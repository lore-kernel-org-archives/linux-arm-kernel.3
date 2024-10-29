Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71CCD339A3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kRBCS21xbUg+ZtyrX+0216a9IgyvQrvSGGoh4bdg5Wo=; b=LYY5T4P6jLQtG+
	OgDbS5q6FjzeA8HREl9Z3gIMX4W4OxO94+m3J2LkYldl/SHhWTJ5g//LvLxZFr0fuwULD6j3gpPu6
	d4fnLCqxRGNsNRQqmDsaKpteZIBb6BIO2OSHaxkFsLQCJP6Mhi+EI8Bv5/CvVmAH09AdEaBIs0cMy
	8/4V4ksFi/6uWhXfAZl+0nfPO8IEtP8nPr1kFyOcf/9cufM3y+nWhvor5Yi0QRRoXcEqACsH8lTQO
	Ic8b6v2rbLuZZ34FwB/uiy+rx6MEgvDOMBAKagEd+nmGP3CMv2SVmzaFGBijfzUE8kgCd5Ul2pQ2u
	5MgR2fHNAp2UNUufelFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gsR-0000000DXrS-20iA;
	Tue, 29 Oct 2024 07:42:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gno-0000000DWx9-2W8E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 07:38:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-431688d5127so50031625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 00:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730187486; x=1730792286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kRBCS21xbUg+ZtyrX+0216a9IgyvQrvSGGoh4bdg5Wo=;
        b=cQerlPn/LEUJRbRTJIphISl8ZFEGZtcFhheBAqJ22yqoLWqwzRfOHVhH+zxo8tfJlm
         a+fLwxQvsJ7v7nE6tNz0Yy1g+Gtm4pttbq92dfDu8wPEpyzb7LcMlNQH5Jgxo8CfQtiC
         gGH614ltheVQUHUj5Oqg1O74o+TIWjl6wc4+MwSC1jcQlhAfAyg8wB5GHXnFvvYzhaP7
         gNIe6G4jQYkKe3w1kGYCP2Z0GfVmY+JRCdXyyi8/AJ+i7MnpVqB/8YoRaWijoqzimbYR
         gVNguE/o+jLH4wXTFl/qScPR35nnFY270JlSDUiws1rnKurPXauLkfMhZbFRUMlC/f+d
         UtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730187486; x=1730792286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRBCS21xbUg+ZtyrX+0216a9IgyvQrvSGGoh4bdg5Wo=;
        b=m1DVwy36N9QdEFFg4hE3OglARxzNR7P1ta8LF15KC3CS6/uKUb4UR0bbOPcT1F2t3o
         4H8y6dftm7sxTAt36TpNP8APccJOC3+FusiqHRAGSjBKQaOMnuigOtunVsPYTdHd8UDx
         4rNvOKp4V9JvSVuia8/PXbkMO+37a8VOpQqDKGQrB4MT9/ct6LjLz+i3KtHoRHOxImKB
         lEL9DTyggu5IEwGx3TG0AD8Oczs+8osk2UQgMwwxVWLMzKYlxjLDAWkA3xWZyquqKUqj
         lyNx2MYkk1WlQ/Mb93Idk4DcGcdtgVHKrVpi0U/y3qAEN8sdp4mMC3i6CCHWZB9PbLGs
         JQWg==
X-Forwarded-Encrypted: i=1; AJvYcCUuolSpHEIdzgWRhzQ+aI26qbgfiHs30SClcLC+Icl2awISLr8nQeZbwgwT/+uMV4qHQTNWoSWeWFkxYRKvfCLE@lists.infradead.org
X-Gm-Message-State: AOJu0YyvbJmxa2aWnmIFf1yVBzKAxgCzgCs6O/5IpaA3z0/EDoFUExTL
	Gc+8P0bWhuU3bCBUQEUtFz3K0qv+VQkp4s/+wxuQ1MaktOEqEWs6nwJt05iCTMk=
X-Google-Smtp-Source: AGHT+IE/QTlrTfqOXWM8zSxaY+sQmjccOShgerlk9HjJclBzVZ62XYIIe6dba6vKrd4PnXhBaOl1zQ==
X-Received: by 2002:a05:600c:4e0f:b0:431:12d0:746b with SMTP id 5b1f17b1804b1-4319ad294a4mr81325345e9.35.1730187484985;
        Tue, 29 Oct 2024 00:38:04 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b5706c3sm164752335e9.34.2024.10.29.00.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 00:38:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] sound: Switch back to struct platform_driver::remove()
Date: Tue, 29 Oct 2024 08:37:47 +0100
Message-ID: <20241029073748.508077-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8427; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=bofb0GXHAy72+VfSg4Mly92y7jtyu1u1iViJjOuNI8o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnIJDMDMnZBV7DocFNxEnCFbvqTaMWTOgrRJ9/c IbcL2jDvQmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZyCQzAAKCRCPgPtYfRL+ Tu98B/4gJo9q/Fgct6hluhXw8q+tQ5dF1BSpJ6nHeqplYujtgo382D7jTSdgvdP966ghu0jLNZW 3YS2mOsukJil3wG1Lz0PhuS+BlSNQKUB+fPty+hhAZIABLcgmmvrUDP0iM2slhEO32pKl6qcEXV fikATTb1hjzZTvc18EECgkaxjM+ZDES2vxXFQlXkph0b4WYlvgZPOvvAGrpDfgE6UXIIPbb05Iz 7D8QaBk5d0/dVI01H0vTnV8EBiwSVCF+KtehiUNLAXm82iqpENvT2DocfWKmPcFk0czA+osxSpe VsHmtxbe1pesSbw3cJrdPFf+3SdmUdnOCeXOtRUck/Bxz30j
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_003808_674777_7D66B722 
X-CRM114-Status: GOOD (  23.03  )
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
Cc: linux-arm-kernel@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Ivan Orlov <ivan.orlov0322@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Haojian Zhuang <haojian.zhuang@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below sound to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

On the way do a few whitespace changes to make indention consistent.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of sound. sound/soc was already converted
separately, so isn't mixed in here. While I usually prefer to do one
logical change per patch, this seems to be overengineering here as the
individual changes are really trivial and shouldn't be much in the way
for stable backports. But I'll happily split the patch if you prefer it
split.

This is based on today's next, if conflicts arise when you apply it at
some later time and don't want to resolve them, feel free to just drop
the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend. (Having said that, I
recommend b4 am -3 + git am -3 which should resolve most conflicts just
fine.)

Best regards
Uwe

 sound/arm/pxa2xx-ac97.c             | 2 +-
 sound/atmel/ac97c.c                 | 2 +-
 sound/drivers/mts64.c               | 2 +-
 sound/drivers/pcmtest.c             | 2 +-
 sound/drivers/portman2x4.c          | 2 +-
 sound/mips/hal2.c                   | 2 +-
 sound/mips/sgio2audio.c             | 4 ++--
 sound/oss/dmasound/dmasound_paula.c | 2 +-
 sound/pci/hda/hda_tegra.c           | 2 +-
 sound/ppc/powermac.c                | 2 +-
 sound/sh/aica.c                     | 2 +-
 sound/sh/sh_dac_audio.c             | 2 +-
 sound/sparc/cs4231.c                | 2 +-
 sound/sparc/dbri.c                  | 2 +-
 14 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
index 4c367e73b2c9..77b11616a7ee 100644
--- a/sound/arm/pxa2xx-ac97.c
+++ b/sound/arm/pxa2xx-ac97.c
@@ -271,7 +271,7 @@ static void pxa2xx_ac97_remove(struct platform_device *dev)
 
 static struct platform_driver pxa2xx_ac97_driver = {
 	.probe		= pxa2xx_ac97_probe,
-	.remove_new	= pxa2xx_ac97_remove,
+	.remove		= pxa2xx_ac97_remove,
 	.driver		= {
 		.name	= "pxa2xx-ac97",
 		.pm	= &pxa2xx_ac97_pm_ops,
diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 402b5f66dcc3..d8f8e08f1bb7 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -861,7 +861,7 @@ static void atmel_ac97c_remove(struct platform_device *pdev)
 
 static struct platform_driver atmel_ac97c_driver = {
 	.probe		= atmel_ac97c_probe,
-	.remove_new	= atmel_ac97c_remove,
+	.remove		= atmel_ac97c_remove,
 	.driver		= {
 		.name	= "atmel_ac97c",
 		.pm	= ATMEL_AC97C_PM_OPS,
diff --git a/sound/drivers/mts64.c b/sound/drivers/mts64.c
index 6fc255a6754d..17f215bad0ec 100644
--- a/sound/drivers/mts64.c
+++ b/sound/drivers/mts64.c
@@ -1008,7 +1008,7 @@ static void snd_mts64_remove(struct platform_device *pdev)
 
 static struct platform_driver snd_mts64_driver = {
 	.probe  = snd_mts64_probe,
-	.remove_new = snd_mts64_remove,
+	.remove = snd_mts64_remove,
 	.driver = {
 		.name = PLATFORM_DRIVER,
 	}
diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 21cefaf5419a..72378f354fd0 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -640,7 +640,7 @@ static struct platform_device pcmtst_pdev = {
 
 static struct platform_driver pcmtst_pdrv = {
 	.probe =	pcmtst_probe,
-	.remove_new =	pdev_remove,
+	.remove =	pdev_remove,
 	.driver =	{
 		.name = "pcmtest",
 	},
diff --git a/sound/drivers/portman2x4.c b/sound/drivers/portman2x4.c
index 54d818d2f53d..5e4ef25a83a4 100644
--- a/sound/drivers/portman2x4.c
+++ b/sound/drivers/portman2x4.c
@@ -794,7 +794,7 @@ static void snd_portman_remove(struct platform_device *pdev)
 
 static struct platform_driver snd_portman_driver = {
 	.probe  = snd_portman_probe,
-	.remove_new = snd_portman_remove,
+	.remove = snd_portman_remove,
 	.driver = {
 		.name = PLATFORM_DRIVER,
 	}
diff --git a/sound/mips/hal2.c b/sound/mips/hal2.c
index 3c26334227bb..991793e6bda9 100644
--- a/sound/mips/hal2.c
+++ b/sound/mips/hal2.c
@@ -886,7 +886,7 @@ static void hal2_remove(struct platform_device *pdev)
 
 static struct platform_driver hal2_driver = {
 	.probe	= hal2_probe,
-	.remove_new = hal2_remove,
+	.remove = hal2_remove,
 	.driver = {
 		.name	= "sgihal2",
 	}
diff --git a/sound/mips/sgio2audio.c b/sound/mips/sgio2audio.c
index a8551ccdd1bf..4e2ff954ff59 100644
--- a/sound/mips/sgio2audio.c
+++ b/sound/mips/sgio2audio.c
@@ -917,8 +917,8 @@ static void snd_sgio2audio_remove(struct platform_device *pdev)
 
 static struct platform_driver sgio2audio_driver = {
 	.probe	= snd_sgio2audio_probe,
-	.remove_new = snd_sgio2audio_remove,
-	.driver = {
+	.remove	= snd_sgio2audio_remove,
+	.driver	= {
 		.name	= "sgio2audio",
 	}
 };
diff --git a/sound/oss/dmasound/dmasound_paula.c b/sound/oss/dmasound/dmasound_paula.c
index b8fad12f9e5f..8d443a3663d3 100644
--- a/sound/oss/dmasound/dmasound_paula.c
+++ b/sound/oss/dmasound/dmasound_paula.c
@@ -732,7 +732,7 @@ static void __exit amiga_audio_remove(struct platform_device *pdev)
  * triggering a section mismatch warning.
  */
 static struct platform_driver amiga_audio_driver __refdata = {
-	.remove_new = __exit_p(amiga_audio_remove),
+	.remove = __exit_p(amiga_audio_remove),
 	.driver = {
 		.name	= "amiga-audio",
 	},
diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index d967e70a7058..b1e30a83dfb0 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -606,7 +606,7 @@ static struct platform_driver tegra_platform_hda = {
 		.of_match_table = hda_tegra_match,
 	},
 	.probe = hda_tegra_probe,
-	.remove_new = hda_tegra_remove,
+	.remove = hda_tegra_remove,
 	.shutdown = hda_tegra_shutdown,
 };
 module_platform_driver(tegra_platform_hda);
diff --git a/sound/ppc/powermac.c b/sound/ppc/powermac.c
index 8e29c92830ad..f1b0cf9ea555 100644
--- a/sound/ppc/powermac.c
+++ b/sound/ppc/powermac.c
@@ -160,7 +160,7 @@ static SIMPLE_DEV_PM_OPS(snd_pmac_pm, snd_pmac_driver_suspend, snd_pmac_driver_r
 
 static struct platform_driver snd_pmac_driver = {
 	.probe		= snd_pmac_probe,
-	.remove_new	= snd_pmac_remove,
+	.remove		= snd_pmac_remove,
 	.driver		= {
 		.name	= SND_PMAC_DRIVER,
 		.pm	= SND_PMAC_PM_OPS,
diff --git a/sound/sh/aica.c b/sound/sh/aica.c
index 66b33623549f..39bf51ff43a1 100644
--- a/sound/sh/aica.c
+++ b/sound/sh/aica.c
@@ -599,7 +599,7 @@ static int snd_aica_probe(struct platform_device *devptr)
 
 static struct platform_driver snd_aica_driver = {
 	.probe = snd_aica_probe,
-	.remove_new = snd_aica_remove,
+	.remove = snd_aica_remove,
 	.driver = {
 		.name = SND_AICA_DRIVER,
 	},
diff --git a/sound/sh/sh_dac_audio.c b/sound/sh/sh_dac_audio.c
index e7b6ce7bd086..e7b80328f0ef 100644
--- a/sound/sh/sh_dac_audio.c
+++ b/sound/sh/sh_dac_audio.c
@@ -383,7 +383,7 @@ static int snd_sh_dac_probe(struct platform_device *devptr)
  */
 static struct platform_driver sh_dac_driver = {
 	.probe	= snd_sh_dac_probe,
-	.remove_new = snd_sh_dac_remove,
+	.remove = snd_sh_dac_remove,
 	.driver = {
 		.name = "dac_audio",
 	},
diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index a1339f9ef12a..1b44119edfbc 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -2107,7 +2107,7 @@ static struct platform_driver cs4231_driver = {
 		.of_match_table = cs4231_match,
 	},
 	.probe		= cs4231_probe,
-	.remove_new	= cs4231_remove,
+	.remove		= cs4231_remove,
 };
 
 module_platform_driver(cs4231_driver);
diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index b5d53c5550d3..69f1c9e37f4b 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -2682,7 +2682,7 @@ static struct platform_driver dbri_sbus_driver = {
 		.of_match_table = dbri_match,
 	},
 	.probe		= dbri_probe,
-	.remove_new	= dbri_remove,
+	.remove		= dbri_remove,
 };
 
 module_platform_driver(dbri_sbus_driver);

base-commit: 6fb2fa9805c501d9ade047fc511961f3273cdcb5
-- 
2.45.2


