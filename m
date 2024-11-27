Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0CAD609D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9Ja8bSv98C0dnIrT5U7vJcSaQnvSrF1zZ95Z+KMMq8=; b=TE4/KXVW6D8vzMCi7vWL9ve2ZW
	q/cbzbciQ1vL4JBieOkEn22fXGWSCVnXIviRsaKvl0VICveOHZytsqLhOqXJBQUbx76WwLnLwaup2
	RuXgD9bSOlA75iRhDFhpRiPo0Zxa5Ds+E7NmaNuAhzWKcOczKCXQTfyCrNhsDQ6VYXXaywSFdAE63
	FzrajsUDlP4zJ26gfr9GOSKM00SqY8XNv1GvEKO+oLReY67D0Ikf81Yl1uYPMu7M3/YOePxR31cW5
	r3SehsDv5MORR8i2Kz7vpgmUHD/heEVf3ZbRFkwy8b9perqH+ZruAoHb4IIUhK0MQ9p8aH0vPlHnP
	s6c77frg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFq5-0000000CwX2-2TpL;
	Wed, 27 Nov 2024 11:04:09 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFkP-0000000CvDU-0PGi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:58:19 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ffc3f2b3a9so49035711fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705095; x=1733309895; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9Ja8bSv98C0dnIrT5U7vJcSaQnvSrF1zZ95Z+KMMq8=;
        b=wJrNH2beePNe9xuOvn+xw0DQKjo4YW6P/FcxgYmjjPatp/8bEa9g5JA4wHPa3kUl6S
         hDCrEmBXS/DTdF5RYaIIU9ti8NFLeSuVW1ggiujU6CYPAgHrZpkuT4aFDP1nlinyNilj
         0rpKn3mh2dR7H5jCeKBLVooz96eNPN/w2vgdCoL2mQiscH1CHkWE+erejHcH++ekyFML
         /GCB4cgKfucF+GjOYebp55BDMVs8fZQUBf1PAtvPUW0UpwRBngjDIdaYRXVc54X0Qg3I
         KTReQEAU9qkEtQCEm2lXzlIAeybCamd1XCXWHT8e4NHArkabEC+b3kJXccmw2ysEInDR
         brAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705095; x=1733309895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9Ja8bSv98C0dnIrT5U7vJcSaQnvSrF1zZ95Z+KMMq8=;
        b=hjONQ2LG6XTwZPfkOleMCNBLU+hXTRgZE055UpoUy7dRbr5RSSbcTivQ8bhunH5/hu
         9VEL2nRU/5YFPwe0cjiRArZUIFxcZmhpW0Q3Yll8PKwYEwbAfvDek7jK2C0NwGz+jdjC
         x8VFFJb+OY/pqO6q4CSise6Y8f1bVAuTm04qEVEPR5RsEpdBTf01xQoRvJNwKvbtH3Rx
         65I/OVdPjitGLoo+SnFHs3cIjONVuvv+k0jlN3Yb/1iUER5WlF3uDHheOYOg7pV5Hy0m
         dA5WFZPORO1AKKY6zBH6WJvM0IfOwCQgmOWzTq38+jm7g1dwgAmYf49yJpjrXk+rbCFF
         iOlA==
X-Forwarded-Encrypted: i=1; AJvYcCXTq88BPhcHd+dpl1bZyOB9uw6okkJ0zPpz35Re/s2emSWwStABIFkbE8hJzTOn2qj75UVsWNiN1P6L9a1/D2T4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9FaqHZSToLY41Z8ZRSUeuWjuxY1KTZL8VCw0Bys3DcUV37on5
	VVoFxcOOcKs4EzOdxH/vlF3IIUgwgFXmYQC03rfMPWU2btRyXlWnCLyXNT3VK44=
X-Gm-Gg: ASbGnct1TFRtSFJyP52iA+2Yn2W6oFvItg0Qdcm0ahcwBV7Y37xezsX0zfz/F00mfiy
	/gfbodYZIBB1+Z8SOO+TCsbDrtkGqVSWsJcAuOeIj8wV8w7AjcpeMDcaHJRh/bIaz+lG9ZE4AV8
	mG7ULcghWN8iJgGtLS4gVP7rgWuV8WAIFheaJPtdZvnJv3KDpXAR0INfHeFy76e8RJI0jw9154d
	S8yjegLTCfd9s8CWfLilrgq5cnmYLYEG1E1jcTXQvuPbiWSapEfpdq3KQf9COgVblOtFhBrqxFv
	aaB3WV/Ef/Qtemanpq35BGVLnqngET9ysg==
X-Google-Smtp-Source: AGHT+IGFJqt4+X9+b9OZ9iJ+1uoSSp1Y782XmdGaTyXXLw7W9wq9YHlHSBg308ZxZ/fLYqnCqQPhog==
X-Received: by 2002:a05:651c:b24:b0:2ff:c4b2:496b with SMTP id 38308e7fff4ca-2ffd5fcc1c9mr16671261fa.7.1732705095196;
        Wed, 27 Nov 2024 02:58:15 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:14 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 10:58:16 +0000
Subject: [PATCH 6/9] phy: exynos5-usbdrd: gs101: ensure power is gated to
 SS phy in phy_exit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-6-1b7fce24960b@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_025817_166440_D45DB61E 
X-CRM114-Status: GOOD (  12.22  )
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

We currently don't gate the power to the SS phy in phy_exit().

Shuffle the code slightly to ensure the power is gated to the SS phy as
well.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 2a724d362c2d..c1ce6fdeef31 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1296,14 +1296,17 @@ static int exynos5_usbdrd_gs101_phy_exit(struct phy *phy)
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 	int ret;
 
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		ret = exynos850_usbdrd_phy_exit(phy);
+		if (ret)
+			return ret;
+	}
+
+	exynos5_usbdrd_phy_isol(inst, true);
+
 	if (inst->phy_cfg->id != EXYNOS5_DRDPHY_UTMI)
 		return 0;
 
-	ret = exynos850_usbdrd_phy_exit(phy);
-	if (ret)
-		return ret;
-
-	exynos5_usbdrd_phy_isol(inst, true);
 	return regulator_bulk_disable(phy_drd->drv_data->n_regulators,
 				      phy_drd->regulators);
 }

-- 
2.47.0.338.g60cca15819-goog


