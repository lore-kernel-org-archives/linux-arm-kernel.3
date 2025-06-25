Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7A8C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 10:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRCR5w6mxJl9kOE01aENY7pdoYD3D3UcZSaG9WSr1E8=; b=2z6C76SkKUBpE7fBI6AAIbUkyR
	rL1Y5HJtGyb4DSKoXqFfar0YoqHWYflu9Wfkee8yfYRSrvmaCDL9EUMDskpnyVk50DCReDa3R31Ii
	xdVNKUi6RL9cIHbQnU30ua5XpIpQ8EJ2rNAbTNB6Rq9QFB20QIXJjN5VBnpssmNPn5YlYvuPL/iyV
	O3xClpTrvc7Mnh4Kmj849nuEQ1vaq0zpbbknD84kXzEGTn6c0wwTzbj4WlNyRHVZAtUogThghvT8I
	XBsmdJjazDZYczfWzqWDphCvTCaOCDG1ewnnyHkx6Jy0ZS7qNLHsoCzeHmyi2xUVuyPpNWDgF471e
	Ls1WYRwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNJr-00000008J0B-1Ve6;
	Wed, 25 Jun 2025 10:25:31 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLZ-000000087Mj-1Hka
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:23:14 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1057098666b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 02:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843391; x=1751448191; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRCR5w6mxJl9kOE01aENY7pdoYD3D3UcZSaG9WSr1E8=;
        b=cgy8DTTVHcBQz+8oDuFcvh8F5ZUoh9J3+zKnv8qUQnK5EN22YtIj6WmI/FMZtbsqUB
         4nSMOInw6KKdbH3DjnHtn9k8odScFiziX94Sof83qXFmvCoHlaQMubJBbK4eCzU/TaNE
         EnS2GuLMmEC6bblj35jBGELQXEA681n81m4peLad1iW6+AdTs14QqmGDf3P6qLMiQtra
         +svLpfkeHACqXeUzOJO8tv/5HL7k9hP20C3YGDzAmd/mDU/G5RSyBaQrCuhq36uQ4ozA
         Azpm4PK4JTLxuBqSGhhyBMSd2uPEI78btLXmObbW1BgyHEYDtdAfFldyF7+EkTJZg3Jt
         ktug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843391; x=1751448191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRCR5w6mxJl9kOE01aENY7pdoYD3D3UcZSaG9WSr1E8=;
        b=qC5NBqgqsrmkTMHAXF4pzwVc86qHo0nFgixYTeK1GlzPe4NOwkNj9r+8xlDVNHfTpz
         JJU55IBjqBJwXligs7lWVL7FNTtLwSjZZVFnEsMvQl8agIiNT78k7fJz3na1pGvcSx2H
         AdIYJg6MHcomxhIFX/UOhKNwzSvyisbtbxmP2/uC30/uzFVU0bUxtRFZNRZjFD8kRZHQ
         PiIbCpwyn2dCqPBT2/7ewM7kXqNjbKiNrqGC/gvrCB4INzFsT6kmxWpAK/KRBjtHw2m2
         ukQ+DAULkfVZ3I9nypURAlFy5fu+REYUivTl6gOZwJmsUr2E3WTHWf1wVx8i4YmkrZXx
         jqzg==
X-Forwarded-Encrypted: i=1; AJvYcCWLIw+EvLqu2ejY0er4cLOqlVqNJRa9QOc1WE+hnolqjpfZRa2cMASsWUOOH6/cGxFTDR4NOvFf4abMe+/o4+68@lists.infradead.org
X-Gm-Message-State: AOJu0YzyuWQF19c7gH69zj0u8eU0Hw+9XoaVneGfkMt4m5QkUtX0sU42
	aa7JvmeiwEJqhXASp0yQZkMZFJ58W9ShcVbmKe8Ic8zKcUfyxYkcJ4oKUFHpyyIjPvw=
X-Gm-Gg: ASbGnctlcZs+YfYpIaX0nXvGs9T048/0Env2MX44FL9Ucu5EUDtYGqd8tiJETk9Ddvy
	TTdax9W9Z3cID5u9FBEKhW9bHiuh9ZqmXjrETUqmJQVApxviKqHHSZx9dNA31nM1Ox8esfexZak
	ZTgR4/sY4cMIkQ32XRri2rz9h0d3Dk6DnoYz3UNbyor7iYBzrHWpNHSZmijfHw30w3ZAHh0KerK
	nu/U/MbFhPYAr+B2xHzBb27fp0cbPjIMYYMTJuirvLUufq+DYjHXVKLlvAN8f3iRqNHP0DPkTJe
	K6RYT2gn/vKDfXkwU1wbnLeSof2dFJeW4V51rKvmYsxZoJPfLb1paKqnYqPBA4+4xFUyOhO9HKc
	/bPFsYiR8EN+J4BxAYoyuIiedBM4P+DCo
X-Google-Smtp-Source: AGHT+IFCI10YnV57Cjp2sR+UxOV3FgvVKAqwit3yxRvSArMNgi+VmBiwj5MjTcE7iiy2oz3pOZCWRA==
X-Received: by 2002:a17:906:7953:b0:ae0:66e8:9dd9 with SMTP id a640c23a62f3a-ae0be90cffdmr205488666b.8.1750843391467;
        Wed, 25 Jun 2025 02:23:11 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:11 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:22:58 +0200
Subject: [PATCH 03/14] dt-bindings: crypto: qcom,prng: document SM7635
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-3-d9cd322eac1b@fairphone.com>
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=870;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ARurSlf9cAaTHf8riWzBxjObIWFoiMC+3sc1W+uG3PE=;
 b=s58rpWvVx4KEw/gWNPIbo8A+oAxUDMuwW9s3oTq9LY5OoYgLguK+Onhp3DmRNdPW9BsH3qKmf
 59mx2TZBcoYBb+w1bKOg/GL7crYXeJ4Hl7R0nL42pqDOwmT/DDnmfr5
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_022313_353628_0C3FF194 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

Document SM7635 compatible for the True Random Number Generator.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index ed7e16bd11d33c16d0adf02c38419dbaee87ac48..c34a4267a0d5292e89f61c766c08e7071bd2ff09 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,sa8255p-trng
               - qcom,sa8775p-trng
               - qcom,sc7280-trng
+              - qcom,sm7635-trng
               - qcom,sm8450-trng
               - qcom,sm8550-trng
               - qcom,sm8650-trng

-- 
2.50.0


