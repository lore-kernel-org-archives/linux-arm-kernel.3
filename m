Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0133C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 13:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2I/g6DzNEY6MLWNE45x2+A3Pg81FAkaF8xBvQmIiUUk=; b=wPozW8LE1HsS7ZLOdP0nj3tBiO
	M5gkZ/rpL5O3y4vSWknQY5WZbQO5z7AEd4sy8Yyy1qIEVaBlMQetDGuVTqs6Yrod1lrQ6gQbXP2M5
	5apZwn04PSEE47W/uwzY7K/2G4qd9R+fKrv5S3FU5C55S/ESyrGGk7yWw5JqNAQm5JG3Ghw41UP2Q
	gllTd8bsIZA42CcaI52VvlYnu51Ol3qp1iRCKGgTF9MWAufDygKFfd41R/dKRPozYj9PEhb3ioUpn
	CcIHVFrkRc3Nas+vu83G7s54/Wczvo6VuI+r9m5gNwadyJ+0Qn0Kae6/x8x/tdx5ky4H6SW7qeVyh
	Q9ROTPZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOmx-00000002KrG-1N4E;
	Mon, 27 Jan 2025 13:04:27 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOVu-00000002ILl-0zGi;
	Mon, 27 Jan 2025 12:46:51 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso2532843f8f.3;
        Mon, 27 Jan 2025 04:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982008; x=1738586808; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2I/g6DzNEY6MLWNE45x2+A3Pg81FAkaF8xBvQmIiUUk=;
        b=gvMp4eeYgAArYEagmzjg6LphvEJiQpRWzKsNQ/I8YjFhBv5odPTZttmeHBKtyyWE2T
         Yauelc4aLqkayeBb3TZjKDWmzhj5aqueRZhvmM7v/F62i2qVtvsDX9hh3eVXV3VJnIWS
         e5HlDilDWBDTFfUxgWbSZmDtEZ0kxfAZPZFhdD2kaRc3M31P///dtnplQkLffQciQPcY
         Uc0+kMloHUa6cSXeZhH+Y+AFHpKnRrjDQ0cFj1CdJ22eAm7METdtAepKNytNXYU/DrqO
         U6BhA0VlO0jHGhJlssebcdEISYDTeT2eZ7bMAE9/1hhu8dlpfHhVqjpkP5QBEZcVmzsk
         BIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982008; x=1738586808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2I/g6DzNEY6MLWNE45x2+A3Pg81FAkaF8xBvQmIiUUk=;
        b=cWM3mshy7hV0LCu5JU17QY2yTtZkbF9XDghDFJk9dFxKgkYcsTtmTVztftg4d7gbVZ
         lCsNelSGGaZ6c6Zin/cHUz3SBowzqoCOIXIQ9ncZjkL1nQq2ohHzmTVWHOiK7+pt0tW5
         3WihsXyDLwHPBweEGDolVEMLIkgaw2Z8rG5YTvL09rxcJlwua9LtPKQcNqWrxi0HQqSj
         rbUEiyV4tVBlSDNS6SZKzLgAzoKykJX5C3mKbWDPCF3P1yUcezFiIBrF47atkbRN0rzR
         WmEH+kazloMQIkZDvQErz+6lhym9vcC0+h2JA6o08PZCuD2admPX8KpnUMPGY9D2FimK
         3FHg==
X-Forwarded-Encrypted: i=1; AJvYcCUBtj/Gb6984Mz9uzhfLWaTy9huEPv66LLUeIPuHF/k2wNTxh4feCk9UnH0XBvjFChCqMpXL8U9nOFRaQ2k7Ek=@lists.infradead.org, AJvYcCXYTThDEd0uj6RGes9qJHGVMvc6X52nDEBHNGbhefGSs7BR/9m8qGrYCnAy0QIqHxr/Nh2vHfQc0H2PeXAH/iK4@lists.infradead.org
X-Gm-Message-State: AOJu0YzKozBAPU11NUZMT+8SuoOHyfPJqhSg3bJAs/zqmcjo7rPB66h3
	I9ZrAl4sIlqFoy+9WtU0C7Uec4ezohLBQMt9U9mBG5IajIsrSyrX
X-Gm-Gg: ASbGncthE12HWGM20+wJUyirmaTE4MBRTnUvTJQdXHIwOHzjY45bqXOK9WyUq1AG6wI
	fmqBzAh+PMqX5FSEdxe7Vmd8zxXddgmXF2r+TpU1XyZ2924luaO73vRohLTERhrt8aS4WCfU3D1
	GZEhi4zKTInRNkrvVcsOVadnGCaYCFetx4E7oWuVld0+6jqW6cApf7m6c9aLEegLx41pMaPuEbM
	ux9YLPyX3kjJyxobLGdLQ9xRVr8YPenQogeKAgjPODXse7lhrqY1FOzvr28hVCzU+pbOlDR0S1e
	2e6J
X-Google-Smtp-Source: AGHT+IHsX9fH6pHzf3bCE6qbXfxbIlFTpPyDWWHgJOqmqyR1gPb9ILP3sU12vqEYpKUdafd4H6jDhg==
X-Received: by 2002:a05:6000:2c2:b0:385:e8ff:b9c9 with SMTP id ffacd0b85a97d-38bf57a9599mr31959724f8f.42.1737982008403;
        Mon, 27 Jan 2025 04:46:48 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176538sm10795823f8f.8.2025.01.27.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:48 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:07 +0100
Subject: [PATCH RFC 12/14] ahci: pata_imx: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-12-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=RduU4fzm2S8yXhoNskJ0+TWDY47QJ0ZCJVc8mKi6Q6E=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4Asu66s73cxW3afxzdcBdIOeskJ4QvLePjmL
 oaiUlkSOWqJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eALAAKCRDnIYpo1BLC
 tS73EACMRajQZc8Z1sdLWV/SZIXg7nYvK964ydiGMezg7pqnDcMaSYXnamkue4xk8YysWf76r6q
 rAIFBZxGxVa72BcdpYNyoxdGNBJ5f1QW+OTmmg9LRSUVFNAeA13SfgT3pIw7CTNB1dnliTzbSR5
 GS4aD7UnS0Dh3GpOdzcGelDLJtR+sc/OXaK1viecqgLA7ZJ3++U/18rFhwQzukJSzGdjNkKaTse
 sxLzAtXw9ol/+193Zcxih/qbp72pO6avHOcSiZh4LQYHDSxTxQ1hdD91bLM3lx7CwuUU5SbCMqe
 EE4ztvnAjkzJrPcixcsE3l1WLe9bZ5xwYSGUj9Rdw46fwKSObdpfCMcZEoaL6lc4axzOoAxfDVU
 hCBda18r0bikrIbRH64hrz5s//Evqw1DgvyqglLbLNHTxkhXCd1ge+4KqHDqizV/kHtTQBzHdV9
 Qq01VP9o4MFgfHJZmAFp0wHEmo3MlL5C9u/irRELaCBV2FXJ3sa93XxO6SWDALiWzv0dbJ7sXgL
 P/oB4FwJKL+02n0knMyZWDG0Hb4bG+1N1i7GipLIzXLx4YaivcE4dX0nzXPZWx0PHQrTcPNIeaX
 r+U1dlYiTSU4v+XAjGJTkDKy9N8YZVv4PJkrbfgrLQzZ0Kmxjrqu7nMTaeAqdUYlqeK/8YjAelw
 FUg+FQ0FzBVVD6w==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044650_278320_09AA5F69 
X-CRM114-Status: GOOD (  13.91  )
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/pata_imx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/pata_imx.c b/drivers/ata/pata_imx.c
index b37682b0578f48ea9d51a103d19e40fe91c4729f..533de2782c37fb21bba4e4b8361c48c0f2878175 100644
--- a/drivers/ata/pata_imx.c
+++ b/drivers/ata/pata_imx.c
@@ -201,7 +201,6 @@ static void pata_imx_remove(struct platform_device *pdev)
 	__raw_writel(0, priv->host_regs + PATA_IMX_ATA_INT_EN);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int pata_imx_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -234,9 +233,8 @@ static int pata_imx_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(pata_imx_pm_ops, pata_imx_suspend, pata_imx_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pata_imx_pm_ops, pata_imx_suspend, pata_imx_resume);
 
 static const struct of_device_id imx_pata_dt_ids[] = {
 	{
@@ -253,7 +251,7 @@ static struct platform_driver pata_imx_driver = {
 	.driver = {
 		.name		= DRV_NAME,
 		.of_match_table	= imx_pata_dt_ids,
-		.pm		= &pata_imx_pm_ops,
+		.pm		= pm_sleep_ptr(&pata_imx_pm_ops),
 	},
 };
 

-- 
2.48.0


