Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762E3E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 07:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H11rnIjZ/6A+y0BhElAhFFU5gZO2NZydl8Xc9FZjLpY=; b=ltYFZ/IDmyakKJFd/AixKBctvM
	d0wjMi8SUL0Z4KHToQnTmvbTH7PmgYEviz8txusQIge+vUrS6AuboGHLREjUY5WqoD9nN9zY5pmEp
	UsXgNlRnfPdFfzeaNbsrpslLC2ZXhVFDoBDNbABwLicXskehUSbHd4NPpRSTcu9ISJxzCWMhafQTu
	+BOv3jzCi7YlX6MBmRc1ACTEz8Wly6KMcU4B/ehx6Txb+jo7rbBrY2rLbK6tiey3Pwmdi8HhJ+MtU
	aM/W85yL/buoih+y6KV5w4KH/3E2a4Yi3V8gdYfCuDy/ReCllbKJVotnaSddTEyL14htXDSy2WdVj
	naYCQ+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Qp-0000000F37r-3PmE;
	Thu, 05 Dec 2024 07:37:51 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6MO-0000000F1i1-1jEi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 07:33:18 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5cecbddb574so676277a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 23:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733383995; x=1733988795; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H11rnIjZ/6A+y0BhElAhFFU5gZO2NZydl8Xc9FZjLpY=;
        b=DoPQrHnq3DirzRypLOMfQQI1IV7q3cgXtheWbXN1Dq++FarAprrqoxGQlufqQzB42l
         xlugqemhfBXKv7mmqB0mY16fGozvL7w2i1N2sD/k9c0Cf8FcNp6CKzPs/A/bufNiUo9B
         KSD/gIueTGm89X7thD2EpQMJllOFMpI789dzF/TzFvVl0Prlbh95yzidGqwxx4+/lfpE
         VgD8AZaFIbxPzvGax4S9hBVi4RgrEOyMaN53DVpRPTsyhuwIhN08vqP9RswLxEpwQy3z
         U2poRIlylNxBfyMLAmAyZJk5lPV5YeDiwlrJRtanp5nHxPNSDPa0TV44r8ov6huqk/5Y
         cGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383995; x=1733988795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H11rnIjZ/6A+y0BhElAhFFU5gZO2NZydl8Xc9FZjLpY=;
        b=rzr4UOqUUH+96d1eLC1sdARbaSvgv+f9Tilbwr0IsauQXp+93CE8j/+ZYTf82z1kC8
         3t1jzjTTmBQT7YLI3KHTtQUru2ci2VytRUdCaftT6TtEB6I5gNs9dC5SWrDv+Q+J9tnn
         EyrtmOfezQcIwnxfmgJnZpAIIZC5guwonG74V1P27aCmOPjHdqtkkMaSQ3XrzFrpqITX
         V1ffGfez4f/UPptha+2WJ2/JdvAzRVVv/Mql0Rct1nGYh3lse9kQFnqZZCfbGRS5GIDC
         qrSDNJ1pX/peo7Fdm5uqOgorhRVv6hJvd2/r3kYAMaskg+fE/25ZGllTaIj0QN5bcERm
         NxQw==
X-Forwarded-Encrypted: i=1; AJvYcCW306UQ7uTG+LX0brBTxgXQu3YrC4O3FmDBAdp4Cpzwu1jN8tcGgL32O25T2Fr7wbMNpXQRJB7FW12NF3Lavwej@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ5QuQIwts5t1L+ZjG47In85diIErnopgWHSM4ZUxjLAMIDfrX
	8UUgTtYbaH9ONFoRgJdiHyvSkWGxJ1C8SkOk5Q3oDTz4dWsNPZs7Ix8Ab9/T3Dc=
X-Gm-Gg: ASbGncu5927PTH49nRQ0A0aHff90ZMbCKzhiX0uxOOl0BeLY1EhuoBpCAPyU0BsXoiy
	pvd+KXE7NWvxL6++GU7wVt62cZan/4Bfg+PxtCqcfHYixAP+cb3MCNxJLAsMVcglcmY8xe3tE6M
	piWf9jikJPqtvy8KCn8/wAxSqv9YXJM+i2ExDgNSmli8SbAfnDSpeM7DRhmZVAJQYOK8F26oly5
	V354KRH3jGo1lDDy8JadC/mQ9oIhkRTFALUiDUwTAgEVH+j5Axr0FIyW7DDL8x1ScDo/lE92Leb
	qToTrmXh/mrAPpZMCreuOCeI8PDQJuFSuQ==
X-Google-Smtp-Source: AGHT+IFYsJycA4yASAH+sZjUsdut4D7esnBNe4R4ApeFxO8IGWZZ/0bN1Z5Vd1ltD4MxKYmMzQqjIw==
X-Received: by 2002:a17:906:31c7:b0:a9a:bbcc:508c with SMTP id a640c23a62f3a-aa5f7ca9f9emr722031966b.2.1733383995058;
        Wed, 04 Dec 2024 23:33:15 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260888casm53371766b.133.2024.12.04.23.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:33:14 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Dec 2024 07:33:14 +0000
Subject: [PATCH v3 3/8] phy: exynos5-usbdrd: convert to dev_err_probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-gs101-phy-lanes-orientation-phy-v3-3-32f721bed219@linaro.org>
References: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
In-Reply-To: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_233316_448776_C86BF47F 
X-CRM114-Status: GOOD (  12.06  )
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

dev_err_probe() exists to simplify code.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* collect tags
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index c421b495eb0f..ceae4b47cece 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1725,10 +1725,9 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 
 	reg_pmu = syscon_regmap_lookup_by_phandle(dev->of_node,
 						   "samsung,pmu-syscon");
-	if (IS_ERR(reg_pmu)) {
-		dev_err(dev, "Failed to lookup PMU regmap\n");
-		return PTR_ERR(reg_pmu);
-	}
+	if (IS_ERR(reg_pmu))
+		return dev_err_probe(dev, PTR_ERR(reg_pmu),
+				     "Failed to lookup PMU regmap\n");
 
 	/*
 	 * Exynos5420 SoC has multiple channels for USB 3.0 PHY, with
@@ -1759,10 +1758,9 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 	for (i = 0; i < EXYNOS5_DRDPHYS_NUM; i++) {
 		struct phy *phy = devm_phy_create(dev, NULL, drv_data->phy_ops);
 
-		if (IS_ERR(phy)) {
-			dev_err(dev, "Failed to create usbdrd_phy phy\n");
-			return PTR_ERR(phy);
-		}
+		if (IS_ERR(phy))
+			return dev_err_probe(dev, PTR_ERR(phy),
+					     "Failed to create usbdrd_phy phy\n");
 
 		phy_drd->phys[i].phy = phy;
 		phy_drd->phys[i].index = i;
@@ -1786,10 +1784,9 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 
 	phy_provider = devm_of_phy_provider_register(dev,
 						     exynos5_usbdrd_phy_xlate);
-	if (IS_ERR(phy_provider)) {
-		dev_err(phy_drd->dev, "Failed to register phy provider\n");
-		return PTR_ERR(phy_provider);
-	}
+	if (IS_ERR(phy_provider))
+		return dev_err_probe(phy_drd->dev, PTR_ERR(phy_provider),
+				     "Failed to register phy provider\n");
 
 	return 0;
 }

-- 
2.47.0.338.g60cca15819-goog


