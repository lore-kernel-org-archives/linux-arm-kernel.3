Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B16C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ze692xwI5jsqaKUMaqkOILgz7h+mY9HSH9sWUthU9v4=; b=Troh6JzHVHN7vNjXKQRXm5Xuhw
	vPVceenJZ+oZRVKSsONsfm/pmQOP9tPbkt8s89Zd8ao7ozdlnJyHOSmfxgzstkbzBD/srYS9Oc9sd
	HtrEv/rhxlNVrRRPRmOkz8vPLoeSlgkz47Q314Bl13oGYTBHlOyPuvI099yE0lTt9KsMQW/Ehj8pM
	DX4yRjHouXnutcgjhA28g36wpUl3gd3+6dB8eZRcLl4UK1CsTgkjVjRgocyiGVafb+BX+COgKu6dz
	D88raZvCtGr/272LVjySni4hvmO8/oVUc6Pj3/M9IX/5oEtq+8PQI7/k+gGFWWcpOb/FV3HmHUazW
	ILvOW5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZMu-00000006vhL-1gPk;
	Mon, 07 Sep 2026 13:26:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZMs-00000006vfI-0BhX
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 13:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ze692xwI5jsqaKUMaqkOILgz7h+mY9HSH9sWUthU9v4=; b=nFQFszQr9uoAHltga+xc4BLNd9
	ao4cZVpt8C1JftVGZJdcZfvPMfHL6Bowuf/2IMtrr1f9GgxrdAbAszedyCqdD0kvM2DuBBV/Tsmbd
	+126KODh2++1yCgmUI2YHYxROtD1ntJJqIAIjGVP/kr6USlLSKjf3Ddrvm8UpxKwQ5Bvv1zS8C1sY
	GHD8kcuIHaQC9v7dtIN8wezh8gkWgVAWnNIAH62gPv0OddHyabmFwXVqs/rw6kJ5LJn4lKN4E4jtG
	h6Uv6KrlIEJwiJ5Ub6DHNcGapzOMmXrW2LJPVgF+Gyb/+fTXdaGq3FlhXMiktXNHW6LQgG3Rt8jwI
	gG6oPaHg==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3ZMo-0000000GHAp-3QGD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:26:36 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c1677c91969so343482766b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787592; x=1789392392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ze692xwI5jsqaKUMaqkOILgz7h+mY9HSH9sWUthU9v4=;
        b=vfzZ8dkLe1yRrVSjDMRJ54RfgssdALwLxaBkM10I73EClO/bQdeTvNg/+Ud7bSjW+k
         ceDj4ggpzJVSr7CEf/rJuom0kaCKCA4WV4KMypVE2VU5Ux8EZy4ilj3zTQncfVOmWczr
         lALyuO46V0LrUOlvCwNsvaI1hal2nY7PyFyt9FrqZk9dBlOSwhIgiUlPptQoVY9lFECo
         nzHGllYdgq95HM+8jFIWnajRyJHG8FXmFVuj3Zct5OOExirSwP58eQ0U8I5MZOTc55j2
         uBpXCj85r+fmEkJWFoK9hY32nL5wex95kSyoECawui8/atCYcKFWEgKIfBTj157zITie
         RhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787592; x=1789392392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ze692xwI5jsqaKUMaqkOILgz7h+mY9HSH9sWUthU9v4=;
        b=Texw+H3boWJ+y3ST8CHVThFnwfS2gafb5y8uinUwJAnWKGG6WyQaWrCv6cnc+CN3ti
         Gc53DAFgLxFKqW5jw1BhMdwsZsTZP/zgzomTEV7L4irZApkYnzEHH4FG2oyDBkgwK9Wl
         qbctWTV+HaPM+JgDTggHuohi58cAVxXRG4ybO4KDJUOPnH39JuBgZpxlRYfaD2cq/lUo
         FlK3yynq+JNsB2bXHo11+IHJHCAkLXMlIG9/CNhy03rTpgPsrZQMKGOj/0W8ZbmPJCL+
         2Ao0Krqh9je+GawVANaK+BQ/BxShP5WnN3E5XY74sHbMnnfR/bqhbkkhXznOdfI4Dsyf
         /dyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzS9vy05iU3fat9TV7zeT1qXlvQQ3UmxeoOR6HkwkOdoquG68w1wU7Mr/D+bJQjIq5DyfQpCSzh1TCgwn97DqiJ@lists.infradead.org
X-Gm-Message-State: AFuF++l2nFRj34KYt5lS2l1UIz8oyw+WzTCIrIVvavzuEj/iqebT0oty
	13bIG8KFbVYi8uPj5jwhdCiGAMFpZazWaicvpSW7POmWL7JCcmueyvfb9N0/44rQqQY=
X-Gm-Gg: AYBFou1thG6fe7KFPFf+jKbSgYj3QV4ZFHrTG2Sm/MIpALfJwLw5sGWKrMWycxxKRtL
	HWgUusrOcCXuapoN5whdj2qbHWuoHHUeTpbDxqtbfXN1shXcetYxCtR2oFbXOuLXuYTDNOl1DtC
	AxR6C45B25Yp4Kdo2+K12YIeYem4egfj06KW/u2Vzcki7kNXDuOXfmOyfk/3v+RJY8P78OzxcL0
	E/C+uCgFLgDhFQ4kxONQfRfOXcooYdcvhud1jFpDI/P1EL+Lo36fdhDjQg6xTrNGumVR31rvlmO
	U7volX2W3Y/J+YLFnhxpZctPPqaN2xoUBAJM6pYimzSbnhPoi+8jtp4xgbiRcyPKPBhR4ol+ZVn
	zag7dbMhxmTI4Vrn5Ce6nzxU5TJv8w14thSQfnHvMTgfMCoeDu3HtJsvzgWhBF0UdWqSw8+I3nd
	FnJrkn/o/FNvP6UIV08PUX4S7qt154Q25wOEoYZkZnmTb3WOGGNis1Brq5+2fhmW6RoWJVvglfN
	SpYaXHlHSCsvnfaF5B9hO8LtxVwwXShd8crHnCaGovygAsKVMj6WXqUDd4IvX32mwUbTcuWnhc5
	FaDThw4szcye/Cag2liax4MRYRQ1F8KOaUDrIw==
X-Received: by 2002:a17:907:3eaa:b0:c26:37fb:3461 with SMTP id a640c23a62f3a-c2637fb36b0mr464023066b.46.1788787592611;
        Mon, 07 Sep 2026 06:26:32 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:31 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 2/6] mmc: sdhci-of-at91: add option to keep clocks enabled
Date: Mon,  7 Sep 2026 15:25:30 +0200
Message-ID: <20260907132617.1198548-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907132617.1198548-1-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_142635_152935_56F637AC 
X-CRM114-Status: GOOD (  16.18  )
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

sdhci_at91_set_clks_presets() both enables the controller clocks and
programs its capabilities and preset registers. This prevents callers from
restoring the registers without changing the clock enable counts.

Move clock enablement to callers and add a SoC data flag for controllers
that must keep their clocks enabled. Use it in the runtime PM paths while
keeping register restoration separate from clock enablement.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>

 drivers/mmc/host/sdhci-of-at91.c | 39 +++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of-at91.c
index 7c4ac65f247d..b7e2a89da348 100644
--- a/drivers/mmc/host/sdhci-of-at91.c
+++ b/drivers/mmc/host/sdhci-of-at91.c
@@ -38,6 +38,7 @@
 struct sdhci_at91_soc_data {
 	const struct sdhci_pltfm_data *pdata;
 	bool baseclk_is_generated_internally;
+	bool keep_clks_on;
 	unsigned int divider_for_baseclk;
 };
 
@@ -164,7 +165,7 @@ static const struct of_device_id sdhci_at91_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
 
-static int sdhci_at91_set_clks_presets(struct device *dev)
+static void sdhci_at91_set_clks_presets(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -174,7 +175,6 @@ static int sdhci_at91_set_clks_presets(struct device *dev)
 	unsigned int			gck_rate, clk_base_rate;
 	unsigned int			preset_div;
 
-	clk_prepare_enable(priv->hclock);
 	caps0 = readl(host->ioaddr + SDHCI_CAPABILITIES);
 	caps1 = readl(host->ioaddr + SDHCI_CAPABILITIES_1);
 
@@ -222,11 +222,6 @@ static int sdhci_at91_set_clks_presets(struct device *dev)
 	preset_div = DIV_ROUND_UP(gck_rate, 50000000) - 1;
 	writew(SDHCI_AT91_PRESET_COMMON_CONF | preset_div,
 	       host->ioaddr + SDHCI_PRESET_FOR_DDR50);
-
-	clk_prepare_enable(priv->mainck);
-	clk_prepare_enable(priv->gck);
-
-	return 0;
 }
 
 static int sdhci_at91_suspend(struct device *dev)
@@ -254,9 +249,11 @@ static int sdhci_at91_runtime_suspend(struct device *dev)
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
 		mmc_retune_needed(host->mmc);
 
-	clk_disable_unprepare(priv->gck);
-	clk_disable_unprepare(priv->hclock);
-	clk_disable_unprepare(priv->mainck);
+	if (!priv->soc_data->keep_clks_on) {
+		clk_disable_unprepare(priv->gck);
+		clk_disable_unprepare(priv->hclock);
+		clk_disable_unprepare(priv->mainck);
+	}
 
 	return 0;
 }
@@ -269,14 +266,23 @@ static int sdhci_at91_runtime_resume(struct device *dev)
 	int ret;
 
 	if (priv->restore_needed) {
-		ret = sdhci_at91_set_clks_presets(dev);
-		if (ret)
-			return ret;
+		if (!priv->soc_data->keep_clks_on)
+			clk_prepare_enable(priv->hclock);
+
+		sdhci_at91_set_clks_presets(dev);
+
+		if (!priv->soc_data->keep_clks_on) {
+			clk_prepare_enable(priv->mainck);
+			clk_prepare_enable(priv->gck);
+		}
 
 		priv->restore_needed = false;
 		goto out;
 	}
 
+	if (priv->soc_data->keep_clks_on)
+		goto out;
+
 	ret = clk_prepare_enable(priv->mainck);
 	if (ret) {
 		dev_err(dev, "can't enable mainck\n");
@@ -344,9 +350,10 @@ static int sdhci_at91_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->gck),
 				     "failed to get multclk\n");
 
-	ret = sdhci_at91_set_clks_presets(&pdev->dev);
-	if (ret)
-		return ret;
+	clk_prepare_enable(priv->hclock);
+	sdhci_at91_set_clks_presets(&pdev->dev);
+	clk_prepare_enable(priv->mainck);
+	clk_prepare_enable(priv->gck);
 
 	priv->restore_needed = false;
 
-- 
2.55.0

