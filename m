Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41203C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 08:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=te4MJTBpVgJuhtRjxJH2s+xCNlwZ781R0MdiUCdRknI=; b=zDnD3vUNm47J98imCFJWg92r6H
	eYpQ/6XXKxBQW75PZWDZvkmL433016X2n6K9gJzyswFHJq0QL0HU6r3gru26Wc2m3BJj3WvRIAby7
	bRonO4RCrXhtsF4rXvj9VdFn+dMbZQGbCwvUWvGktdDnp4lznBzPuT7e4rJy/u7O5Wzn4IFZN9Eq6
	LbiXVUag2rHbei+tXs7DiY6NliWdt5kHAWb7k96flioRsaehBtnKxq+g7XlgTPyYLTWjo2NaGFSq/
	HiGf+wZZSAQJmSxHz0TNyPTcyrgUKZhO9Fv4rXgx4+LskwgNlpkxQNi267VD/Xu+c09K+CTL75jx9
	t5Puiz5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarnW-0000000HVAO-0RZn;
	Sun, 13 Jul 2025 08:10:58 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarin-0000000HU73-0Xql
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:06:06 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a588da60dfso2348311f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 01:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752393963; x=1752998763; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=te4MJTBpVgJuhtRjxJH2s+xCNlwZ781R0MdiUCdRknI=;
        b=22ua2gEVvG04GHmq3cqY8Av93FIRfChjDA5WBR/8ZIAoy4N03psaHwfB2EG36MF3+X
         2d416EcWV93jac1O9402ipdweUpmKE+xjejnm/C1XJ4snEr66RLmdWQ9/TG7TFYxo8Yf
         ExZ6uatk9dzXbeQ/vHjrIb8+MEWn5k+Hk3Yye4KAVSkVVxgKfSEnP5zbuOoDsaWFY0no
         fiRHx3jj6ebPOd3ETS6XyKTKRoh7j8SHuggiI33Ah5tssGvfurS5PUxmkafryUL1dmCs
         yDPPgfxwdEtj6sVZTxDv61Ts0zZp9B/SIpzoecy6EE4v531w0yhoHr91Dk+m14VED0BR
         DzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752393963; x=1752998763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=te4MJTBpVgJuhtRjxJH2s+xCNlwZ781R0MdiUCdRknI=;
        b=gHINgEVJy3UPSOjAj2yFTdo/n42uYKmkPiGB56Dpd2ABYEhcCunamVRPdlyREZ0UNT
         6sZfUQnzoavXk9VvPYtjxZiPItlB8GPYY8I323CPuJmrLVHuFcyL9mh+3ldn+BUjRYMG
         cOOu1+d+GLTVvNYoccCuI4itMY2JrUDxWXM3vz9eeZRQOH30zRgzPFN8jkyW4IghQDEQ
         RxTh4rZf3UnfSD1aoFlKyQTVYmA8NbNjTvp7tHFRT118wYw6jJmVlblCIvM5VXeNVk5G
         NBySzxWSZr09mk7Sjj9FJnCzumOvIaWczYwFSZ6volCAUDMTPczmIAzqp3h5t0eeeqOr
         ddrA==
X-Forwarded-Encrypted: i=1; AJvYcCVRaO4kjQSAYRzETaixWXDktRjHG40fpKSo18aW45Ac2Njq85uSFUA7j4MspQ9MeZ6W0wAr1k7CdzDgrh8ZZPIQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxFl71JbS1oRcQ/bXA9ra2qjpsJyCyxPPAY1cGmEx7UjLmzCWFd
	ytRFmiZRygJaDvMSsYjCis9ov+BFOSyd5fcgh1XTeWYPkqgDRTNwmKjjQjrkH7vBcVw=
X-Gm-Gg: ASbGncv7sqLwPrlY/ZsPB7PYui4kWca1brQnyXFgfxo71+06BsfFqjxoTgOFS83n1fU
	cM93yOfeV4PtLTY0GVtgCYPLZEHLxNyL4HTkU0zA6Ifk9uXpPfexhPPKlyiNKNVaj0hk2v9suzi
	WtmwC855I6bbIhFPj+Lcb1soEwROVzVZiiJsLbqnMXRB5ew2bvz0DJAY3MmRDVcem2pM1F9LqOD
	6HZwgJRLOkRiqfV4fJW8vLtHhARtbOcXxO7QG2a2yBr4zeEhu4J4x4n4N9DRQwVEKlnPj5PWmQP
	DmUM8KmA0ab4g8Mf4UHvcfSAW3nUlNoeNOu8u3X7BLhm1DdYV5I5VJPNvxHCosxnpt2ot32SWay
	WAKSoBSp0muKxNJOavQifBuQ2phZWQZCIQAmwg/qnyzQNYD4=
X-Google-Smtp-Source: AGHT+IG58Q0+c/JdRpYP9OwThz11aodR+FjCZWHpjNmU/o1HqomzxkC9Hl2w1xFzYfqgnbsp0pIfUg==
X-Received: by 2002:a5d:5f41:0:b0:3aa:c9a8:a387 with SMTP id ffacd0b85a97d-3b5f181bf12mr8730107f8f.0.1752393963493;
        Sun, 13 Jul 2025 01:06:03 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:06:03 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:23 +0200
Subject: [PATCH v2 01/15] dt-bindings: arm-smmu: document the support on
 Milos
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-1-e8f9a789505b@fairphone.com>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=1456;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=VI60lC4ZmfORZyuxHBRWFEsQsFQCradJNwP6TkMJAbg=;
 b=ysFcsREoBvX5mgay6H6zBC7kn964wfsE1peB4S1deXzOSQgOF/awLFfvR6VFGhwUAq6oh+c+L
 jGE9XkkTsEYCtwhnmfdvMrCBbHaWxNcEmIJjlZVGZSlmOWt5qi/15fU
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_010605_173060_9F0F7EE9 
X-CRM114-Status: GOOD (  10.32  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add compatible for smmu representing support on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 7b9d5507d6ccd6b845a57eeae59fe80ba75cc652..66d5a5ff78fa5dbb86db72db754c23b8cc8f188a 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -35,6 +35,7 @@ properties:
       - description: Qcom SoCs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
@@ -88,6 +89,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
@@ -534,6 +536,7 @@ allOf:
         compatible:
           items:
             - enum:
+                - qcom,milos-smmu-500
                 - qcom,sar2130p-smmu-500
                 - qcom,sm8550-smmu-500
                 - qcom,sm8650-smmu-500

-- 
2.50.1


