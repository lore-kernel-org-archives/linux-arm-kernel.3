Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D699CD1288
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 23:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cijZ+09YTsl3uHzpkuOiO4+DMdT2cKq32KSIaXuX+bQ=; b=cdshmO97qIfdLX2ezmJdydGzpw
	lYrjUFiFZ0z6fptg8KmIEa6jVNr3AMOxHHCTUgL0iXQ1baLHnsr5F51cKjwp2g7e1sIkUqP/kT6uh
	1N1z5DTOtCkAlC/cWpo2tvFo0fQZi0z/kMrFuZaqtdkrywBAatFY82yDCx4uB1ziM2143yS9LBW6e
	7OH/yN7ItRualrVH7tMF8EnZKVdhuZMkvfl3qb7vkKolZvOW3w9uAeaw0Oi5+mMazThJ9QtafHZj9
	Nx99yBVz+hZejz0d57bZ9BTwDYQoouQJ0nW7aPyyHL+zQJTVPCm0E22aYgfB/KvbhCCI5uunKmszi
	D97CD38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7g-00000003YdG-3kTN;
	Sat, 08 Nov 2025 23:13:32 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7e-00000003YZG-0C0I
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 23:13:31 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so3128012a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 15:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762643608; x=1763248408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cijZ+09YTsl3uHzpkuOiO4+DMdT2cKq32KSIaXuX+bQ=;
        b=GgB9LgCQwNBxc5JBw8lHT4DH5ZZaPpm9ycr+dld+O8jrah+JA1iA0mgZ3jTy09mJxi
         LQNwtyp8+BfLcYFFJ+HEUI5B0qRQp74TQOOPiRbrLVmmLWoz/OeV5yaAR0Wv07YTQ5qv
         9SBGzhjnJ0HxSLYBL0M6D74eZ+HGshaiJLptmCE1yYYooyoBxn3cgki+VrVuOmjWJyG5
         fdoZLmAQRmRAgc+y6f17yO41tW+4lQ6aq/NaeLMQTAuvUPZBSaVd/FMbwuDVJ1sqAF0T
         IzZ7HCigNVNgciH404Swb9sK74jEVZSINeTYSeLlwREvnoCEzIlncAubMc66QOCJiL/W
         +0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762643608; x=1763248408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cijZ+09YTsl3uHzpkuOiO4+DMdT2cKq32KSIaXuX+bQ=;
        b=rNYd66BoVjZHjwzLt262DZzvIVrYzW+n+J7KE2SFC/56B7vliDLq2SbTN65VDXcoSz
         QsPXoKSTJqBhuoc985eInYcthQr64drKm89IZSuuYoOIws1/oWPmsr4gYLFmRKFZhkma
         1otglZAMWsKvT57WIDkeCXmQCMJqjDxmhiUFitvnAzK4+Xx6h2XzPr16VXiQXqfd1tR0
         AUl92Vlnza17jVP19JUaRfqa9hUMptAsf9ZDOhOdoP07nBDQWoecLsVwrBwd6DpS1wKF
         pIN78lKrbZsfQRU8Jw/Giel+3QOfGar2ICjqDhsS/5zubaR1vT/l28Xj6S9/D0IWoLbh
         PSDA==
X-Gm-Message-State: AOJu0YzLYeaZU5uqxAB3Aw0aL4rSfB400w9LRTjhqFFBtYRc4GOz8Xpd
	kW+dNQ6MMYVGtqIygXzB7dl4Wwwi8+qzdUaEwUkKOgGPw//yrDJ8sCKl/Niu2w==
X-Gm-Gg: ASbGncsZgMBk2j3GzcvbCaZheOprHpekJzcL12u3NWyKDhi00xSzMYzw6nKX/silKsF
	qrDSMsP9gjAaShbOycTHk+oumJ4g8a4+Ow2AdpHn5zX2xSzj43w8IRP08y2ctIVqw6C/dn0h8dU
	HwvcSI188BrNO1mDyH/ts+VnkPgtV236lmRhDmwwQfRXPhn9M8hDi5v4m17D5yf2L03fXfyr5uX
	USc6U/0g36ybUmNH2ueedzt24izzoubloYKCy35OwTURhYanPCqZS3rc6f3ViqdP5UIIla+Egxq
	gDZok29jhk5Gr9HarGbZU53cwLRO+AFin20/6S36eptY/zkuCOU9xgmnpDjermeYHoPDh1uYtD7
	1ST6WMPoga2kpZuHNjcEuDw6itssxiin533N+KLp7CYaJFQbwqQrgZBVCLEVCyhAFKizIetT8YK
	21A/u9m5MH3JNlyL3hIU/b9TUoqdD/kRsWPxdJxos0Xr933JlczlUUxrv9+nDL0NrKeXOUAwmp0
	iZJI/UbIT2iNCDOjU9B2DxG+riIIGHX940xwD6oSwQ=
X-Google-Smtp-Source: AGHT+IGhMEgUC8oM2+pqlrfLLlvVoY4z7bHF+SAAYNYxAbvCQcc6jUd5lgOvOXrATxrEZssO/EG4/Q==
X-Received: by 2002:a05:6402:4310:b0:63b:dc3e:f01c with SMTP id 4fb4d7f45d1cf-6415e6cc622mr2587683a12.12.1762643608311;
        Sat, 08 Nov 2025 15:13:28 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f814164sm7642807a12.13.2025.11.08.15.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 15:13:26 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 5/7] mmc: meson-mx-sdio: Use dev_err_probe() where appropriate
Date: Sun,  9 Nov 2025 00:12:51 +0100
Message-ID: <20251108231253.1641927-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_151330_111841_5F8F0709 
X-CRM114-Status: GOOD (  14.04  )
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

This streamlines probe error handling / logging with other drivers.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdio.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index 214ce84f1ddd..052bcf8f32df 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -520,16 +520,14 @@ static int meson_mx_mmc_add_host(struct meson_mx_mmc_host *host)
 	struct device *slot_dev = mmc_dev(mmc);
 	int ret;
 
-	if (of_property_read_u32(slot_dev->of_node, "reg", &host->slot_id)) {
-		dev_err(slot_dev, "missing 'reg' property\n");
-		return -EINVAL;
-	}
+	if (of_property_read_u32(slot_dev->of_node, "reg", &host->slot_id))
+		return dev_err_probe(slot_dev, -EINVAL,
+				     "missing 'reg' property\n");
 
-	if (host->slot_id >= MESON_MX_SDIO_MAX_SLOTS) {
-		dev_err(slot_dev, "invalid 'reg' property value %d\n",
-			host->slot_id);
-		return -EINVAL;
-	}
+	if (host->slot_id >= MESON_MX_SDIO_MAX_SLOTS)
+		return dev_err_probe(slot_dev, -EINVAL,
+				     "invalid 'reg' property value %d\n",
+				     host->slot_id);
 
 	/* Get regulators and the supported OCR mask */
 	ret = mmc_regulator_get_supply(mmc);
@@ -666,7 +664,8 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	host->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					     &meson_mx_sdio_regmap_config);
 	if (IS_ERR(host->regmap)) {
-		ret = PTR_ERR(host->regmap);
+		ret = dev_err_probe(host->controller_dev, PTR_ERR(host->regmap),
+				    "Failed to initialize regmap\n");
 		goto error_unregister_slot_pdev;
 	}
 
@@ -680,12 +679,16 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 					meson_mx_mmc_irq,
 					meson_mx_mmc_irq_thread, IRQF_ONESHOT,
 					NULL, host);
-	if (ret)
+	if (ret) {
+		dev_err_probe(host->controller_dev, ret,
+			      "Failed to request IRQ\n");
 		goto error_unregister_slot_pdev;
+	}
 
 	core_clk = devm_clk_get_enabled(host->controller_dev, "core");
 	if (IS_ERR(core_clk)) {
-		ret = PTR_ERR(core_clk);
+		ret = dev_err_probe(host->controller_dev, PTR_ERR(core_clk),
+				    "Failed to get and enable 'core' clock\n");
 		goto error_unregister_slot_pdev;
 	}
 
@@ -697,7 +700,8 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(host->cfg_div_clk);
 	if (ret) {
-		dev_err(host->controller_dev, "Failed to enable MMC clock\n");
+		dev_err_probe(host->controller_dev, ret,
+			      "Failed to enable MMC (cfg div) clock\n");
 		goto error_unregister_slot_pdev;
 	}
 
-- 
2.51.2


