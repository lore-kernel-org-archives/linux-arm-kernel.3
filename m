Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F452C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXNi3EOoOoj09C+mWJNSCmBp9EDVd6qCUzZ8imkNOb4=; b=Fc5Qnu9SpbOMUQNyYlS+3xX4Gu
	NcBnDKPdrp1QTqBsztplUmt3EHEGHUgxT2aZJKgw2M4T6D54BKQJ5F6OwIa64u+l/TXcRFL1MOJb7
	RJNsg1+CLOOCDFA5gbfQ4Bi+BgJKXQ46B7A/hrNVSkpe+cJXFHRaOjUiRY53IkYX+k4i6ljH3zpV/
	WnFYbuCqJOWsGWOmptAdkVhc2sJvd4IOnz6b059EC/yRHGVcfdJjv+/BKs7qhMfNqIJCWJm8cU342
	CTmqUmtECOmNFrQfWLP5mRyXSkEWJmxk6tUeG2kJxfdFB8Cq14dYaRWQFs6Eolc9WBu34SsxbU0UM
	/j0Ecf5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOj0-00000002KVS-45Ns;
	Mon, 27 Jan 2025 13:00:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOVr-00000002IJd-2gz1;
	Mon, 27 Jan 2025 12:46:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43622267b2eso45486875e9.0;
        Mon, 27 Jan 2025 04:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982006; x=1738586806; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXNi3EOoOoj09C+mWJNSCmBp9EDVd6qCUzZ8imkNOb4=;
        b=Keh0wHpbMlIST2Q3b7j3F0Rgzuswtcje2xRPN6eyNJjkftkJfkuZWCBLBwH1vJT60z
         YAgydQuZ2GtFQs6egLVUMzcMi6DnM0Q/ENRYD55vAZJScjKLyZAcTvmDuXuui6doRCVB
         fgv4DIgbSsnAi/p4dZbEb9d27UooCCn5qVQcl8MzqYemljYEc+zTrF4ZO0UCZAzbNhkv
         mVIf3wDe/SxZAEflAuxxL0UgYWQ7YP+ZYDsEOGvzXqFAhT8AY/p6BsUx5agxuUiARZ1B
         lLAKJaJ5FsZt3iohzvmX6U/HqQQYULyik/GozDpVCPOxZjXiNgG8nqH2WmsLZKip9m+N
         OhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982006; x=1738586806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXNi3EOoOoj09C+mWJNSCmBp9EDVd6qCUzZ8imkNOb4=;
        b=Zvy0JMjSHbSc+73m5s2zQZ4+ban9Vnz927Z8s2C1BPKHdIshh+xekAKzwOrk0ADYbt
         aHRWpYGajePOqGhmhicHTL47ObUWOOgSfLsITURu8nQ4LAmoXSeC4Wk46QW2w2HbVovi
         9ZEprDueF+EiuHCpdwaM2jcbOGNcORlgD55W+pENqsvDyedr1hLVRcGApkD3el93GfDo
         J2zBsWIZgftO9rZDpslA3oNEjOhi3nogwLSvmSJj/XPmvRsCzW0IgqBzIP1yqtkfWKPG
         /sW+spa16M0nbBPqY52dnBSeAW61CLO9wKv/cFvpZhk5UWtxl1PUIkgOgeaq8/FGt+/r
         iMWw==
X-Forwarded-Encrypted: i=1; AJvYcCUkbEz27fbOUBDmLW031OTvPdRmi9am7bT6HCIXq72PHeq3YBIHaZqP8AIxX/XP2MAseHUNjwStEuA3cKoQgPU=@lists.infradead.org, AJvYcCWigm7nrCfk/mypFtJXO7rm6Wm5dVrS3JviqA0uU9JoC1QqC4jrsEkGg0lA32CZPSvfJD1k4TNAJ1KIl2wdo7rd@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh66KpggSOieC1YSm2cZbObphX9Zc9834w1kRSSmRRbQwklFni
	U2h/qzD6Kw+e1ZrkQQ/j3ryo8XbnmrKFpcdXkLh63SJyg0B4zJ9t
X-Gm-Gg: ASbGncth0bvD5VqyU3QXHKxwioxY/1LCURmfTiS4KZDk47DX73xjHgl1GYb/VzxPaxs
	e5E+aD8X7tf7GWlZvjzw/lKH2WdDOzw4nx4KO/PqCXWgdWw2EnEsdzyC7/Rpjtw5UD1fhWl5lw+
	GaWgGgRY0AdyiBTCzk2enBWIodOB68Hcs98P9mf1/K5DQ/BkECKgrlly6VRcZqqYkNYciXE3DrQ
	EIjfnEI+bKnWaeJj05K4d8fgg3oa87SvdYy0MY3nUL+q2BIQ0ot5FqvJ3D3JBbvpDWudB+G26GZ
	avAp
X-Google-Smtp-Source: AGHT+IEAjBouqDFRRxREIp+llJfmCSrig9ltB26U/3ZnCQ2AVFGrx3mRWJPMehdo1wr/ju3fkhOnbw==
X-Received: by 2002:a05:600c:a45:b0:436:faeb:2a0b with SMTP id 5b1f17b1804b1-438913e32bemr392457615e9.15.1737982005836;
        Mon, 27 Jan 2025 04:46:45 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4857b8sm129474675e9.15.2025.01.27.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:45 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:04 +0100
Subject: [PATCH RFC 09/14] ahci: seattle: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-9-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=4ewGqTecw9fB2ZWQrXC3ww6+O0Pce0mhF6dQFMkMaFA=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AsXoc9CTFQybRCbZpaLcS7DyP9PPRpr3K/f
 7ALURRpv46JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eALAAKCRDnIYpo1BLC
 tcAeD/4+rRt217wlEAkj+zo4D1LMo+fJcoATk6JOdCwjeGtexKKz6F9bpW6+T9FpMEJkOyevd60
 iaqxz3f/TQ6Kc/vLiCrfAw02zyzvVW1bmI2vr6XRy33K3GYx65AN5MzmInaKwZuP27yx3FoCEob
 Fq84oTZcaoRCOteJdcfabhn1WzmnWa1bFqTVInQ8rrVzds723AZtiJeU2MCURZaofqq6K2DEFoR
 6CBVFgMGxgQuoDByUrb1SjmmissVuqdRtPQYnY4w+7Lb5CsyVNasfoa9IzmEpYFj07JYeqr8KVF
 c4wIM1JMg15XUKNN7Vu6riEMnpiQJePD3TjaSjJziXPkCw5+LATokEW01/ElnQCnqz1EPKSwk5A
 7cTrnEAdX0Xrtu911/9qHXoi490oklQqvbkcs4d6rGYCfn0dyRBAEyXhgK1sFXGjFg4lahWO3AB
 E0uEEl3kf1fg89jgW3cHATh7pSdhxuVO02VKELQS49Jg3XBSvqHDsbk1L/dSuoGig44rYsLnGMl
 J9rTAyJzfpdbcjtzhyLeej+OkYVXhXluhO/C3/gz+C8nESIR9+rKjwJv7yPz3VJkdveQRoLj8Ei
 clkKmuOelYUGxSjj8X3LxYfnNEI0pkLiZ5bdxTdrlbUKRiPJ61CB6WK/cwmunp2Wt8p307RtmTA
 gS8bW2aVFjdIBWg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044647_688163_AF4719B3 
X-CRM114-Status: GOOD (  12.97  )
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
 drivers/ata/ahci_seattle.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_seattle.c b/drivers/ata/ahci_seattle.c
index 3f16c167840222e0de935f7fe44b3d83b95bc16c..4b67f3aa5787de433c8bcc1bb4965a887709aa9c 100644
--- a/drivers/ata/ahci_seattle.c
+++ b/drivers/ata/ahci_seattle.c
@@ -174,8 +174,9 @@ static int ahci_seattle_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_suspend,
-			 ahci_platform_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_pm_ops,
+				ahci_platform_suspend,
+				ahci_platform_resume);
 
 static const struct acpi_device_id ahci_acpi_match[] = {
 	{ "AMDI0600", 0 },
@@ -189,7 +190,7 @@ static struct platform_driver ahci_seattle_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.acpi_match_table = ahci_acpi_match,
-		.pm = &ahci_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_pm_ops),
 	},
 };
 module_platform_driver(ahci_seattle_driver);

-- 
2.48.0


