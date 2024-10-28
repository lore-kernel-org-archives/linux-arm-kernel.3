Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C20BD13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErPoXh63XrcFWpHe9zG8v9aPuGfFzlqWX+d+j6TRc4A=; b=SHEK6xm0o0yrq4cEBHmQy3Y+43
	ZbaN6/z/TBPJMvSM0L3UFOFKbGs4vnruqYowr3RIQy0iF8vSJwlbL7qZIeRpeZXSZCslnhDJ40UGl
	suoGqDb/Woq+gzY2VxNSAhkE0bmy9FiCy6aE27Gox9jxbilj3XDVGvVObHCf+x+A4roKWGNg1/Wpw
	BJZm45ech6YoL4FCi8DV98fgsDfNrLTnpS1r28LFmYxzFhrTfxrosLzHMv9CFYKp8OpAm3fhWCJ4b
	gFNr26IZd//ggaFSS2+CS35i3qjjxgG3G/2yW5cAp/W9SbxXchWsiuwKunAZ0jzLRvuBP+X2jaFNa
	uHWCX0WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5N1g-0000000APMX-3WgK;
	Mon, 28 Oct 2024 10:31:08 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Mww-0000000AONh-37jz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 10:26:16 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9932aa108cso619736066b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 03:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730111173; x=1730715973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErPoXh63XrcFWpHe9zG8v9aPuGfFzlqWX+d+j6TRc4A=;
        b=mU+MaTk51HIFoBnq1yiR1hrhb8/tYSI/bevK/0GOo1/RGG7zrK2stD2TFIeCjxRKZj
         0P6MfGxAgbxXsqOPrfBuorYutwKoXsnWLKvc80nMrqzWsPKm4jibSuSbH1sk51yNPAsI
         ymCDyBKrTDPy+Cvp7OMHhrpXcPUtCojWqo1Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111173; x=1730715973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErPoXh63XrcFWpHe9zG8v9aPuGfFzlqWX+d+j6TRc4A=;
        b=j/FYu/f0oW3ABj+a6rXn+bULnE0KillOqiYgC+kyLm6LVj/5f3D7UqcuePa2b4xIsf
         VBvYb82GtIaN/U7wwAjbp2j5qUZEdheD2pbuy86qmlFTc6d2cfFfsbmA2BZ7OyvFlII+
         v80MOEY5MhvtjT19aHMHNaxR2BF5CJtv8gprYWgiIz0ea7QBIUdEAU8Ny7fBfQKq1Z6V
         ACnl+mPCsfDiZEyddcaoYELX4Yp80twYQv5UaiPrDriibNJmTUstLPH53DXlV0+RB+tm
         59r2NkVY4/RnunDHYWw4UGBvmX7BDmH9UTB52at4yYMGqidyGUcraedl6PJ6uj+zgzq6
         x+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXB3zNcQFPONpnp5fTCDdjfARLFN8EAkcsGukKZLW04cpZh9EvCFXs9PRXYNofDCUxihobaG7T/1lxxbheBx2uF@lists.infradead.org
X-Gm-Message-State: AOJu0Yyok9r9rTuPCJxpXO9Ad2aOdXNZJa9I/yHyPL2waunUlB1RC2LY
	ODd4h21WbVjAgRGW+V7fFniC06+3Ve7PUQ7OKTEOAd9JYl57HCZGgLoSZsUqVgM=
X-Google-Smtp-Source: AGHT+IGCR28JnEaozP81Xbh2KLif47qmv9KNL7NMIxup/Qx2H3ia0ChVJ6kRCnNRLDGwqzzr1QgmvA==
X-Received: by 2002:a17:907:9712:b0:a9a:2afc:e4d7 with SMTP id a640c23a62f3a-a9de619d18bmr803160866b.44.1730111172695;
        Mon, 28 Oct 2024 03:26:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:26:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [RFC PATCH 02/10] pmdomain: imx8m-blk-ctrl: don't turn on a power domain already on
Date: Mon, 28 Oct 2024 11:25:25 +0100
Message-ID: <20241028102559.1451383-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_032614_820523_9EAF7C37 
X-CRM114-Status: GOOD (  18.76  )
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

The patch, by informing pm_genpd_init() with the "is_off" parameter that
the power domain is already on, prevents the power_on() callback from being
called, thus avoiding the unnecessary repetition of the hardware power-on
procedure. This feature is crucial when supporting the simple framebuffer,
as the power domains have already been initialized by the bootloader.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 51 ++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index ca942d7929c2..8dc1508571dd 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -166,6 +166,24 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
 
 static struct lock_class_key blk_ctrl_genpd_lock_class;
 
+static bool imx8m_blk_ctrl_is_off(struct device *dev, struct generic_pm_domain *genpd)
+{
+	struct device_node *node = dev->of_node;
+	struct imx8m_blk_ctrl_domain *domain = to_imx8m_blk_ctrl_domain(genpd);
+	const struct imx8m_blk_ctrl_domain_data *data = domain->data;
+	u32 boot_on;
+	int index;
+
+	index = of_property_match_string(node, "power-domain-names",
+					 data->gpc_name);
+	if (index < 0 || of_property_read_u32_index(node,
+						    "fsl,power-domains-boot-on",
+						    index, &boot_on))
+		return true;
+
+	return !boot_on;
+}
+
 static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 {
 	const struct imx8m_blk_ctrl_data *bc_data;
@@ -173,6 +191,8 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 	struct imx8m_blk_ctrl *bc;
 	void __iomem *base;
 	int i, ret;
+	bool init_off;
+	bool *pm_runtime_cleanup;
 
 	struct regmap_config regmap_config = {
 		.reg_bits	= 32,
@@ -221,6 +241,11 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 					     "failed to attach power domain \"bus\"\n");
 	}
 
+	pm_runtime_cleanup = devm_kcalloc(dev, bc_data->num_domains,
+					  sizeof(*pm_runtime_cleanup), GFP_KERNEL);
+	if (!pm_runtime_cleanup)
+		return -ENOMEM;
+
 	for (i = 0; i < bc_data->num_domains; i++) {
 		const struct imx8m_blk_ctrl_domain_data *data = &bc_data->domains[i];
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
@@ -274,7 +299,8 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 		domain->genpd.power_off = imx8m_blk_ctrl_power_off;
 		domain->bc = bc;
 
-		ret = pm_genpd_init(&domain->genpd, NULL, true);
+		init_off = imx8m_blk_ctrl_is_off(dev, &domain->genpd);
+		ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 		if (ret) {
 			dev_err_probe(dev, ret,
 				      "failed to init power domain \"%s\"\n",
@@ -283,6 +309,24 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 			goto cleanup_pds;
 		}
 
+		if (!init_off) {
+			ret = pm_runtime_get_sync(bc->bus_power_dev);
+			if (ret < 0) {
+				pm_runtime_put_noidle(bc->bus_power_dev);
+				dev_err_probe(dev, ret, "failed to power up bus domain\n");
+				goto cleanup_pds;
+			}
+
+			ret = pm_runtime_get_sync(domain->power_dev);
+			if (ret < 0) {
+				pm_runtime_put(bc->bus_power_dev);
+				dev_err_probe(dev, ret, "failed to power up peripheral domain\n");
+				goto cleanup_pds;
+			}
+
+			pm_runtime_cleanup[i] = true;
+		}
+
 		/*
 		 * We use runtime PM to trigger power on/off of the upstream GPC
 		 * domain, as a strict hierarchical parent/child power domain
@@ -324,6 +368,11 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 	of_genpd_del_provider(dev->of_node);
 cleanup_pds:
 	for (i--; i >= 0; i--) {
+		if (pm_runtime_cleanup[i]) {
+			pm_runtime_put(bc->domains[i].power_dev);
+			pm_runtime_put(bc->bus_power_dev);
+		}
+
 		pm_genpd_remove(&bc->domains[i].genpd);
 		dev_pm_domain_detach(bc->domains[i].power_dev, true);
 	}
-- 
2.43.0


