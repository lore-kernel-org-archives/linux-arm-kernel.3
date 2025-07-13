Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124F1C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 08:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgf1Do8YljBtD81sfx5m266n9gTHXW+o9sPsSEgzP8Q=; b=w8ZiH7b0XhUqUdAT966ipIC7zI
	Lva0tBq9Ktxvbb+YjD3qR0W1HriV3n3TmN7q40Tqwn8Qluo8ail/1GObPkHIRuTsrECIaFxKIRmAk
	ONUxTmPzaHov5C/KMcicnm1ffjjv+2JK5nbAJc/el7DEKuQOKkVCgKCrH1eOpsTPVzH8tqqQaw05g
	vSDMHnRVzc2vadrMOsEpK2Ur387UrR5lu4pw5s7No34s/x+6iYmDMw/Opy+/kv/rG8iyFtlD0Aexy
	56/+UnDzdsnzh1MzrHhLTAOJQ7m1/7h07p3lpVNetu4NjocrM0Wr6LAVChY5fgcCChePiAIlFQdEq
	K3Cz6rww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarwy-0000000HVxa-0pPE;
	Sun, 13 Jul 2025 08:20:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarjP-0000000HUF8-0jXU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:06:44 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4560add6cd2so4680795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 01:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752394001; x=1752998801; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgf1Do8YljBtD81sfx5m266n9gTHXW+o9sPsSEgzP8Q=;
        b=C5LCiOBLaF12QIvCfXClY/cHE9uz2G+XfeWm3OLOe3Tx3QSzEgRqHSOgrGJ3RLJvtr
         EUS2aTDK2tVvTxhW7iE5cYnJzX3rrHptgTCO/HUix1e+mGtLWjnGRt9+RLI+u5mflu78
         XX7tfiZ4AEL+iiKSfY/yXCsfd18yxkwLN9tc1icbvdAMjweTU7frHp3R7h+NS6/dTwic
         kBF20QLPIiB4AKBuMP33Rnz2W9gP5uWOzm1OO3NEWu271RDvnXPlyYUzqOrhXCcDfk05
         z/wY7n/sUN4CW4p9BYZaKNsfDiK0gUkB3ZA+/kU8mpo7SoQ9iAhHsbkkrskU61nD4YFj
         1Ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394001; x=1752998801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgf1Do8YljBtD81sfx5m266n9gTHXW+o9sPsSEgzP8Q=;
        b=VMgWZOW+gdLEpdmd6jjMU6EA8J3Js2jpQ0dskI/WLw10qEHtcXfRR7RKxUc278gess
         dfb+emmSGrdFePj5kqc3j+E+SFRkhjTn3/4acKwMcpKCkyL+ZURxetUmz/Vg8BAeuzSv
         i/pnHSGskv50kOogF2IL8WY2j8RVzgXyLABMPhdYouBOdgpdri9TPFlwvC0uIbHoDd+/
         48X0T0Vk0mmRWgc/j26ThPzA4XJwW2Eg504pdXtwXIxT9YdvGhPipMoDATwfkX2ODJrj
         I2827Q10w0iTpTSZb/rk4wWNE4F8iC6EOjQYz4nfNJbmK4rj1ls5I4y+Es6OcoUZ/OKK
         ouHA==
X-Forwarded-Encrypted: i=1; AJvYcCUnGTSNTW8aVXwS2F72sRSqNE8l/Ma7o/5BIKSFO1FRBV1F+kCvocer6zJlwMf+7gWE8rSqDFUW6VTLSYKhsjah@lists.infradead.org
X-Gm-Message-State: AOJu0YznEhETb6ha55xwa0w5Gxl9an2SPojlzaPh43vPGydyGQw7XRxc
	SZpzFuudGI5N+IPdNymqe6sbLFZdAvqCABkLWX2OKeCINEYxjJQWHpu3FoCP3KMwyVc=
X-Gm-Gg: ASbGncvXfHT5gU0jylwDXwq2IPNmvEQa7zIwRAxWuEu9ymOkHzVhK0fqrDec8b7cuLc
	VRGJzLUrSKyBg7/uXvMi6kO464qYrCMETY2yExUmAVNio/RN+qAXFgkampnKyS14/a3Ao2LFdYl
	RrfxAQF6q0syzplsEVGVH1dy0pY4PfvQXStiaGz+4Cqc3PmjzPXrjhfNZxzPWfUrY8Zp7adGoya
	bIsuttNdBNgLQfT/Cz5rPgpwTeaYakUxe+Pr01As9o/6JCZoLWbOxxc/oTMbqSKn5EjV6t9qC7X
	ZD4jYgUXukwfRX/6AimOfFqy60bRfsq6xFJ8UjA0wFtZ0soQj/uDrPBDYbI0qiSzMmE+bdYo0LD
	gTi7pNghGkpDwcLUhkE6Fph7pLTclK4OmMLLL
X-Google-Smtp-Source: AGHT+IHyWnqMEVpaRvOXMO0vblvM86y2YgLw6BQSvoG4RgYbH/Ui7SAEt4W5s37bEA/xrCAo7hGufA==
X-Received: by 2002:a05:600c:3f07:b0:456:15a1:9ae0 with SMTP id 5b1f17b1804b1-45615a19f78mr8952975e9.13.1752394001510;
        Sun, 13 Jul 2025 01:06:41 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:06:41 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:27 +0200
Subject: [PATCH v2 05/15] dt-bindings: qcom,pdc: document the Milos Power
 Domain Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-5-e8f9a789505b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=844;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=15ZIEjfNdTMtgNXBiiZtGshrEuJe2UKgX3LhuQVRQYU=;
 b=XFV7UWYTfrWv1RcxcWxJVUHuCP5Ysa43LHrg+BrPBDS/KgoKimDYxgTjN9ghI3i9G3ovnwPgG
 q1r+xiIEV0UBYOCual5XEBtwmgOfedsf3RrNLH/7nc4A/rgd1Nrjzie
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_010643_333069_B1D6921C 
X-CRM114-Status: UNSURE (   9.89  )
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

Document the Power Domain Controller on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index f06b40f88778929579ef9b3b3206f075e140ba96..3f90917a5a4dd9d068ec472565f5009690ea2c5b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,milos-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc
           - qcom,qdu1000-pdc

-- 
2.50.1


