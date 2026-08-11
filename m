Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9410C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 04:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DjeSCh8LZRB+SCMaYU6AxHwq7ze7+snnwffs3yjAKx0=; b=PBAIoKe9vnLeR/QecOjPcjXRER
	p9yoxZCmFOe6HA2CaSKDQcxTPoy+yoxZ9TjZjQwJJPxmVMMdPVwZaF9dyLEswBJPvYiumrtDQZwVh
	9JrWqKeKIeYfBi2PuoOwAbjKd9U5jde1tqM4pYJveNKGDcTosUb0uqSm1i6Xph1Aa+0q2oNY9Lcre
	qPdOGKVzm/sVntjw9zxUtSXV4s14HvGqqclAm5y5+9KEFw+QqcwaF/yTPlZC+4cEhhjnamNzeWtaL
	TcAYRAmDtgGHdKZRj25T3GDH4pvVYoez7yW8JdcCEJxeLDagEnAXEza1qOwPkc0xZQ/pKsZaYqklJ
	4Qi/sIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wte2R-0000000DHF4-2em4;
	Tue, 11 Aug 2026 04:24:31 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wte2P-0000000DHE9-1RC4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 04:24:30 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7eb64085c45so2058675a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 21:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786422268; x=1787027068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DjeSCh8LZRB+SCMaYU6AxHwq7ze7+snnwffs3yjAKx0=;
        b=p4kIve4LOO+3NOKfsH+7AaTOnscHM4pF/o7sTXB/RNDf5hQOPUS1oaMYPub35zxkBi
         vINrJY2LQLCv+cJbAu8j3inGhLuwItf0CWeRsS+Njbp6NJM/H0ce9u/bke7APn6aPkUp
         FU4+0oEqBKEOLIZujp/1qrz5fzFnTFj4b9PY1b4D/wFVL6XsfakcoU+pqz8r2Thg/WJq
         /MyUEO7J1qzc9lfARh2IdkaCDZ+9xbNB/2c69uNQYJ8F1f509RlmEUMmnhaNoDJlSfAu
         J95QHolpX013ertyilNUIJBhaHu62uByNqQz7dhG5QxUhNJHbH5SkR01vx+26/qkmmuY
         11+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786422268; x=1787027068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DjeSCh8LZRB+SCMaYU6AxHwq7ze7+snnwffs3yjAKx0=;
        b=aGZvHlNz+si4aSQR6VO+cldYX1diV/7gZEskj9sn2fzV5X6Z8Ly8RYOYh/CdpADVv4
         RGpmH3TnjlmRkIdI+VF7D1Z/zvFqkiYycnrj9ctsrcobM4qCwfOXaRz+VdVbuujlyYFF
         8Ov4iRQXvHaZjaCEMPFrLfbfbdresPiDZvIdNrca+gbsmgJru/0C/jc87Fl1DRsvSKHM
         OzACVPBVXvQgejnEwTDsxdxrpGIFI3XStQsmn6hSTJyTy0PFB+VYw6kSR+PenH9Gvrpk
         p3TstWIle2el1lp29I5xmnM8apVbi4Lz5aEONP2Ue5J2+1y3arCz9zon29ZZh8qGe1Wy
         l6yw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5rDl2t8ARsslk8PD+fk8sSLYGZW6PLor217XRHHCMoNQ9ezKg/FIp27+TclPExVQu38hVaLrC6YOPCDjFsUVz@lists.infradead.org
X-Gm-Message-State: AOJu0YzaPwBaKKSF91A5JM+8nc6xesoZ/igenJW1xyYMEwwsO3HfUgd0
	tS0nxBiA06BON7FZ27b++bl6X2SGdQPaeNpwUGSk4HEFVXS9Q1qeIZQ4
X-Gm-Gg: AR+sD103m4ovTD849A31llpBD2N6cAmzmLJlXKH70RZZmhdAR6+hssIeJM35tqWk+IA
	mWZYUaiNH18o6UxTA8vUk6ImGcuQHhWckcLDMH778StcbOUzS7aVn9mKaBBixw8+cryKuLr5stI
	0oJxrNczNprkMzkZJEpIS5WFuupi5g2ZWr2Uaj5jy75FDm9f9AAaES4mAuKgl8vEDy8JVOVOFap
	P5nL6IvAqbO23iOF1EaHpCIN2IhMkXMULQ9BGL6/RgvECrKWwqxHGggjzhld2uNxFRxLsl/kqp/
	Ku2rnl8DrjyxY3Qn27lFHtu+vYp6Qoseeznh/sQTGZcHjx+y29eApDlv4LNzHoyRpcqe1g7eeEH
	o6PZCQdSWVKOEKNQpoYR6SOUCRIFAJXNcdJkQMy+o1q9bUZ81FwHhu0urnwbbtuXLUGdB9TNhYo
	vKBSuhrrp9m4kkkz16+D3ba/4AVEonSkguJmZPbOUv0vWbWmr5nPXiQiNxkxFwczTI3icSxJcIt
	VWRmsKpqZo28awxbSM8l5xPdhFW5QYYnA98nBbp2DJUxmahnp2VylGQGbEMLjjSOUiiOoFA32/y
	WcnKJsBD+LvYjAlRSE7DPy8KywiB5ZZ2t3yvAw==
X-Received: by 2002:a05:6820:618:b0:6ae:55f6:2cdb with SMTP id 006d021491bc7-6b0a2ff0e72mr140724eaf.1.1786422267869;
        Mon, 10 Aug 2026 21:24:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e1d99a4efsm371286fac.13.2026.08.10.21.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 21:24:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] ASoC: mediatek: mt8365: use devm_platform_ioremap_resource helpers
Date: Mon, 10 Aug 2026 21:24:24 -0700
Message-ID: <20260811042424.66882-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_212429_388428_0E4427A9 
X-CRM114-Status: GOOD (  12.49  )
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

Simplify the probe function by using devm_platform_ioremap_resource()
for the base address and devm_platform_get_and_ioremap_resource() for
the SRAM, dropping the manual platform_get_resource() calls.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index dcbc5a345382..fc3a457683b8 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -2121,19 +2121,15 @@ static int mt8365_afe_pcm_dev_probe(struct platform_device *pdev)
 	spin_lock_init(&afe_priv->afe_ctrl_lock);
 	mutex_init(&afe_priv->afe_clk_mutex);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	afe->base_addr = devm_ioremap_resource(&pdev->dev, res);
+	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
 		return PTR_ERR(afe->base_addr);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (res) {
-		afe_priv->afe_sram_vir_addr =
-			devm_ioremap_resource(&pdev->dev, res);
-		if (!IS_ERR(afe_priv->afe_sram_vir_addr)) {
-			afe_priv->afe_sram_phy_addr = res->start;
-			afe_priv->afe_sram_size = resource_size(res);
-		}
+	afe_priv->afe_sram_vir_addr =
+		devm_platform_get_and_ioremap_resource(pdev, 1, &res);
+	if (!IS_ERR(afe_priv->afe_sram_vir_addr)) {
+		afe_priv->afe_sram_phy_addr = res->start;
+		afe_priv->afe_sram_size = resource_size(res);
 	}
 
 	/* initial audio related clock */
-- 
2.55.0


