Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173E4C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 10:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgqZI7oI1+Rtsh8AHih668v9LL7u8KNYlhdavj5r3Pw=; b=IJ/eF2/FhJ9CrsjarC6LVmB9mY
	leQnzntUhvuru/SgT87Y7g4HCAgE6qMVA4jMbiv6NZGjqN/bls1gsCZgSlSuXidwgQUkqEL6yBQWm
	2UuPEOzu/Y8DEvh1aQiApfcqVRqufJ98e3AqC9RUF35bZVFFoxm478Y2uv4e8CH4lzu6xSRFALPXh
	5y5IUNDUjtCsqILUR7GwRovcaOd+aG5VHlJjh8J8diJQfLNeBRhR3J20o9our9FfMGqaJ46LT2r+o
	6G/jufT6CZnSapRxrcqW2p33i9O7V4c8nQxwUXnLA6YTVzp6l3kvwQuYDKxlErlwotJft1shaGMns
	op6YdoTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNFJ-00000008IH6-0t9I;
	Wed, 25 Jun 2025 10:20:49 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLX-000000087Lv-0jAa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:23:12 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ade30256175so1108024866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843389; x=1751448189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgqZI7oI1+Rtsh8AHih668v9LL7u8KNYlhdavj5r3Pw=;
        b=dg+Ed4YtYQyCAo+iCOQcN0UJhxCZHck1pyI/GdsdRo8LV1p9vGSpXkZU7FxgrsQUma
         piytFAbjwOpjSyIWbhhldU207vTSmPrPHCh3CDW7dEqFETfy9kFn94dycNe6++vNzVzt
         uisS4KvOnhcnRpQG208DLZJpPqYQAXBimuLlZwUO/enQ8pMnckaXJCeslwgQL2HRStZk
         2IxBDlerhP1NN380zn2f/n7u7loJe/29RmFaaAEzFCyJ5fThy5Y3Us3Wb6gvaO5vCV06
         LpRTSVYkp1SF35K/yTYCpj/0SEXO+dMxpK4/K4Yg9eeIYsBko6AsbT8RFGppVxuIpCK/
         ZtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843389; x=1751448189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgqZI7oI1+Rtsh8AHih668v9LL7u8KNYlhdavj5r3Pw=;
        b=YwyaYpIduReEwnHoXEnNAZNu+sfbWwB+CCq4Ojh5sD4w+6zfSlmKJWq5Qlz10SCMn4
         csAFgeR1p0m+r+eWtvnXWhO4hV3HWcDD6FSYzndUtaoUqcbYhFpmhIeVBM+QkvQOiOVv
         TsxPm9LMRqjs3kGZ/xRD0PafrtxBHzMVR19f5WsOz21cPMYK6GmtvIekrf4w94sHtjYl
         mME0z44sN9qiuijvp0ft8lj5CwkoWddEZmmgHkggRc1gFTusnDddKyTrjdbMyfmUGkXR
         sbhQxvvg7VO0NSnuG4Nzl3KpuIn6R4wnW+eXK3TZDMhLPBrVPyU+PX1cX/25D+J8rJJU
         TXgg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ4WEpAf6yYIOMHt+GIVYG84NzxiSRUKLcsNxWnkb5VVT0+S2LBHVEdCErWOqSzvEFkmXvJVcqBwSuT76bkEod@lists.infradead.org
X-Gm-Message-State: AOJu0YwlhXV+/0ZabnX/WDaQich73LAobK1xksuuUijBLqqH8B+0dnKd
	Q3X7xeZ6aip0lmSHL7TnO25W8RzJSgtUsYlLhI68WSAXGDD31ER+16vvyNl3fpfbpnA=
X-Gm-Gg: ASbGnctO+jn0amLmD6+hcmmPG5HrIvNPgUh/j3/mgwbi4l8Rmj8bRyE3U3K99AWFETM
	wAk6qKjXrpzsZAYO0W8mxehD7Y3tw+rGkJfX33ygSvRKCFK4kdcRhaFCOjGpBhd9ACbSu8FhOEC
	pxW2n8HSScwxlfat2wFjhU8uMLRcAglKx7SF5IFzoFqouybl7s0ZZ6LUk/R0xbQYQpr/pWrcKO/
	oshzwrc0KjN0ETKzlETbDsmGUPleYkdg6DfugZQF5GLzXGMnZmKkMDsBYx7UQPKUTsAJdrEhiN0
	cHXoyQlKiKuwfGTZpx178QRyCx7SfSyKk6GLbRaJCB4P08opaNO09BuKrpTWucN7yDQVf+WJShD
	1FcwaAXLs+XnR70XZJ1Oie8Y7YacHldFp
X-Google-Smtp-Source: AGHT+IEbu2f/7cXyJsOb3QqXP0wh8TgrbA5ZDl76nci0eiAzw3s+R0MtL3pVIqORzpzq/cBkmMRAoQ==
X-Received: by 2002:a17:907:6088:b0:ae0:a597:2959 with SMTP id a640c23a62f3a-ae0bed8e8acmr247450866b.32.1750843389413;
        Wed, 25 Jun 2025 02:23:09 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:09 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:22:56 +0200
Subject: [PATCH 01/14] dt-bindings: arm-smmu: document the support on
 SM7635
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-1-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=1465;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=eQWT5rynZ1PMaMurlFu0xtL6k2P+7npo9dOzB+6rBOg=;
 b=gDsmUgdZBFiEdwrYEbZ8pi64XslJKaJrZmQirkFpqMll05JV6aPCYeaepteR65EJtYCQZk9aa
 7x2FpL//Q9vClR/bmMVFhIADOJuoW9AUJVzbXxYdMo+K4lm7WiiCaKO
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_022311_216519_7EBD4978 
X-CRM114-Status: GOOD (  10.37  )
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

Add compatible for smmu representing support on SM7635.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 7b9d5507d6ccd6b845a57eeae59fe80ba75cc652..8545dd8e886b265caa333188c031f19a44d7fa6b 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -55,6 +55,7 @@ properties:
               - qcom,sm6125-smmu-500
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
+              - qcom,sm7635-smmu-500
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
               - qcom,sm8350-smmu-500
@@ -99,6 +100,7 @@ properties:
               - qcom,sc8280xp-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
+              - qcom,sm7635-smmu-500
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
               - qcom,sm8350-smmu-500
@@ -535,6 +537,7 @@ allOf:
           items:
             - enum:
                 - qcom,sar2130p-smmu-500
+                - qcom,sm7635-smmu-500
                 - qcom,sm8550-smmu-500
                 - qcom,sm8650-smmu-500
                 - qcom,x1e80100-smmu-500

-- 
2.50.0


