Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DC1CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 09:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwHmEHawCvEdEm/8FkS4pO9969OH1I8FzaNoFpRPvxc=; b=rPQQJJBKvwTROP05rBHsTf+UyJ
	eYKkSyEmwwLY0UuLu26g4JyEBpgH6hTDB+NwJy7ALG6gLqaj4Ej3RDkW7h+o7M6ZXLcFYKhSJe6MX
	mAd7z0yjBlUlGed2tsGPcWmhmibNJDon3DwMWfxpx9ObQPR763sawIGhdBGwB66mLDL5QuV+d8N94
	CfNvei5aENFVJaH6aOws1UNJQt9wpHIdEe8C+F/Kkpk06/BXz1OGZ9U7FVDtzFn8RFvKFL5yGcjMB
	jQNUnRWY2r5q2hKgzVJ1CpJvFEfYzamUA/zpoEiwx1FkEkNcu50/qTdz0tQFEG9x+Ft/QADjU4jQ+
	w6OopANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWhG-00000005SzG-2j8M;
	Thu, 28 May 2026 09:06:34 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWhD-00000005Sxf-1lVg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 09:06:32 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-45ee1a56328so648603f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 02:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779959189; x=1780563989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwHmEHawCvEdEm/8FkS4pO9969OH1I8FzaNoFpRPvxc=;
        b=LEc7EbOT66EhkFfEke0+8/gnVr9b8Ve3AhN7z+LCXvFZiDNFBxQqGhE+jd2yXKNzyj
         GQtZEMMXp2B+netdLkurO7FNcUk9FoGUoIsx2zKxvia9P3vcF+LCfRZ8plJHoCtL9dXY
         NJ4fckYLprEgYXSPV4BdJDr49xSEcFA1nUyGGUBKrY8MXktAVeCR3amwg3hyHL5FjQc/
         AUsWY4lIYCSEr3I61HPjnynrdWLNNpYoiaHBSKwDbAf3exEWMoQSeCvHzlyw4e8CPtfM
         IFXrWrBVlp/IG9mrT625w6JYPMTH1bvXYmAIfjyaoo/khY4DJvlEP8HI3um50SyL1pDE
         uvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779959189; x=1780563989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UwHmEHawCvEdEm/8FkS4pO9969OH1I8FzaNoFpRPvxc=;
        b=fEqjulEDCAk9FqMTtJ2G5Ob6RwdHci/f2wqtVCL2Rxut5AYbIOkhi13v0O49xjr8B6
         aLw5rXAm16g3iE38GEYQZJGm+h4UrIU5Qqd8QC6IHu+hgbj0+aQqi0b0OCUDvuzMJwWA
         RBE89CjY9jWwOP41Ic1Y3cSMR0EvnaLdN0AnIrX6qtypYP0s9bWcObQPJZSfHPGL6Zw0
         nFgUe8+rN58mi3zhnsQw7B6Ktow6Z4fOEFW/p2FlnuzlOSvEXv9KwPBZxr7nCa1OIJsE
         RAwLUhVivTCZI5owRq01/YCJ7MJvgZmavqeyy99oeca6lc63rUvF3yvW0JF+m/0DWsIE
         kuZg==
X-Forwarded-Encrypted: i=1; AFNElJ9WrunK3yn+xRA+G3uv3h92jmBPcwPqeKmDA3zhxBjCraMlKeoHmOuKHXJIpCZQLAO/Hd4OMmtuUw/Je89yed86@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1+op13JHx2rnVchCip6WkBTDAYelyPpPCg0V3oYOnoi9jOpZ9
	uZmfvb+MzHHBA6OMwO4CTNhi4pcwRGXJNlGE48M7xsg/iYk+RqyZnUf6q4cPFrL6D1M=
X-Gm-Gg: Acq92OGTw2/FdS15NtjKqvqqNRD2CdLnceN/x247HGSrN70RXPT7N4h1+j2Ikr4hGTM
	bp2rtwWaSQCuskPApwH9UO0Ngg63evrSobHaZEDIYh4mxIdmzTGPDUac1KwG/7viQPUty8K5wfK
	MVkZ/VZZCOjCx0YNQfGlLwH9l6tfBvC4s70xMAtpGQL/0x9ExTBOb67mH3JMdRw0+8Kk4zZy63k
	q+gjiAS+cSO+QZaWWUeDsXeavp1ipo/DCIeVK1h+k5DjJBCYgkjzKYyYgeRm21AB4rVG+TE0AYm
	g6xBazzWfqaE9PP4PoV0BqNjIaOPSsUlbnK99176QRuHEAeH+ouCQLsPZEMI8Vom7LUnXieeyl+
	l8nAYSmmy63gpXHNNLGY9U61twFuRCiaq/EgVbjGBkTmzpIrUi/tabld1gx0DmtMFXSMdw0Rp29
	S5CXtrDWzmWK+rMczdy1DzDI4dGci7JyQt7B5lMqvjRf/Wbdq4CeOpl7dVGneNlsODncU8aHcRQ
	7Omt/5U/faqpJ2TeSqaQJSKtg==
X-Received: by 2002:a05:600c:35c9:b0:490:45bb:8dd8 with SMTP id 5b1f17b1804b1-49045bb8e65mr438275745e9.25.1779959189267;
        Thu, 28 May 2026 02:06:29 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4908b6af139sm17124775e9.4.2026.05.28.02.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 02:06:28 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 4/4] ASOC: Unify code style for platform_device_id arrays
Date: Thu, 28 May 2026 11:06:03 +0200
Message-ID: <d131f7afc3c61ca8ac82a848aaa6ecfbb57ec63b.1779958164.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
References: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10010; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=/QZevzqoiILuJdxFPPb5GMy1YhLxYNO661KlZBY80hk=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiwJ1iaBR1031CW00isu5K1or9LLz5CeJt+09/RBa5Vja wscegQ7GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZjIzHT2v5Idn0wVa6bXbuLw dVmSJ/TD6m/pPGHfC6ZpBjUOJtMebPOp9ax+/+f43NriH8dtaxtuXS3TOdEvFfvvzvOazoQCt6D Tl7MPPKqbxpnLIFb5/anq6yLn7JNSsvpxDuff2zO/M5IsOLngxXQ+9uUH5D4JZfUfq/LQXlZn3s nAnDFJYFXU8m86UfvdlEvN+6K3ncxX9928S+Xw/aCFjN/ar+4pf+uk923zmraPjf/iTXq0rHYb/ QmZdCj445bf9fKHV2y9/qVsR1vCpc8F9SsF90nMaIo9emX+zf/2l+91l5bb+zTuO/QwWGdhytXr H/sio25zKzGUzZNrEBc3rrZbwSOheq51xzeBzlR5ljWTAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_020631_527809_E223D33F 
X-CRM114-Status: GOOD (  16.04  )
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

 - Add a trailing comma for initializers unless the closing brace is on
   the same line and for the list terminator;
 - Use a single space in the list terminator;
 - Use compact one-line style for small entries;
 - s/\t=/ =/ were the tab is only one char wide anyhow;

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/amd/acp/acp-sof-mach.c       | 14 +++++++-------
 sound/soc/codecs/adau7118-hw.c         |  2 +-
 sound/soc/codecs/bt-sco.c              | 10 +++-------
 sound/soc/codecs/wcd934x.c             |  6 ++----
 sound/soc/fsl/imx-pcm-rpmsg.c          |  6 +++---
 sound/soc/intel/avs/boards/da7219.c    |  6 ++----
 sound/soc/intel/avs/boards/dmic.c      |  6 ++----
 sound/soc/intel/avs/boards/es8336.c    |  6 ++----
 sound/soc/intel/avs/boards/hdaudio.c   |  6 ++----
 sound/soc/intel/avs/boards/i2s_test.c  |  6 ++----
 sound/soc/intel/avs/boards/max98357a.c |  6 ++----
 sound/soc/intel/avs/boards/max98373.c  |  6 ++----
 sound/soc/intel/avs/boards/max98927.c  |  6 ++----
 sound/soc/intel/avs/boards/nau8825.c   |  6 ++----
 sound/soc/intel/avs/boards/pcm3168a.c  |  6 ++----
 15 files changed, 36 insertions(+), 62 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index 36ecef7013b9..8874151e159a 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -128,31 +128,31 @@ static int acp_sof_probe(struct platform_device *pdev)
 static const struct platform_device_id board_ids[] = {
 	{
 		.name = "rt5682-rt1019",
-		.driver_data = (kernel_ulong_t)&sof_rt5682_rt1019_data
+		.driver_data = (kernel_ulong_t)&sof_rt5682_rt1019_data,
 	},
 	{
 		.name = "rt5682-max",
-		.driver_data = (kernel_ulong_t)&sof_rt5682_max_data
+		.driver_data = (kernel_ulong_t)&sof_rt5682_max_data,
 	},
 	{
 		.name = "rt5682s-max",
-		.driver_data = (kernel_ulong_t)&sof_rt5682s_max_data
+		.driver_data = (kernel_ulong_t)&sof_rt5682s_max_data,
 	},
 	{
 		.name = "rt5682s-rt1019",
-		.driver_data = (kernel_ulong_t)&sof_rt5682s_rt1019_data
+		.driver_data = (kernel_ulong_t)&sof_rt5682s_rt1019_data,
 	},
 	{
 		.name = "nau8825-max",
-		.driver_data = (kernel_ulong_t)&sof_nau8825_data
+		.driver_data = (kernel_ulong_t)&sof_nau8825_data,
 	},
 	{
 		.name = "rt5682s-hs-rt1019",
-		.driver_data = (kernel_ulong_t)&sof_rt5682s_hs_rt1019_data
+		.driver_data = (kernel_ulong_t)&sof_rt5682s_hs_rt1019_data,
 	},
 	{
 		.name = "nau8821-max",
-		.driver_data = (kernel_ulong_t)&sof_nau8821_max98388_data
+		.driver_data = (kernel_ulong_t)&sof_nau8821_max98388_data,
 	},
 	{ }
 };
diff --git a/sound/soc/codecs/adau7118-hw.c b/sound/soc/codecs/adau7118-hw.c
index 45a5d2dcc0f2..ffbd2ea3cde3 100644
--- a/sound/soc/codecs/adau7118-hw.c
+++ b/sound/soc/codecs/adau7118-hw.c
@@ -23,7 +23,7 @@ static const struct of_device_id adau7118_of_match[] = {
 MODULE_DEVICE_TABLE(of, adau7118_of_match);
 
 static const struct platform_device_id adau7118_id[] = {
-	{ .name	= "adau7118" },
+	{ .name = "adau7118" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, adau7118_id);
diff --git a/sound/soc/codecs/bt-sco.c b/sound/soc/codecs/bt-sco.c
index 3afcef2dfa35..6507bd20a650 100644
--- a/sound/soc/codecs/bt-sco.c
+++ b/sound/soc/codecs/bt-sco.c
@@ -79,13 +79,9 @@ static int bt_sco_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bt_sco_driver_ids[] = {
-	{
-		.name		= "dfbmcs320",
-	},
-	{
-		.name		= "bt-sco",
-	},
-	{},
+	{ .name = "dfbmcs320" },
+	{ .name = "bt-sco" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bt_sco_driver_ids);
 
diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index bc41a1466c70..a9e6f2923099 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -5899,10 +5899,8 @@ static int wcd934x_codec_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id wcd934x_driver_id[] = {
-	{
-		.name = "wcd934x-codec",
-	},
-	{},
+	{ .name = "wcd934x-codec" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, wcd934x_driver_id);
 
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 031e5272215d..8f1185dff780 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -829,9 +829,9 @@ static const struct dev_pm_ops imx_rpmsg_pcm_pm_ops = {
 };
 
 static const struct platform_device_id imx_rpmsg_pcm_id_table[] = {
-	{ .name	= "rpmsg-audio-channel" },
-	{ .name	= "rpmsg-micfil-channel" },
-	{ },
+	{ .name = "rpmsg-audio-channel" },
+	{ .name = "rpmsg-micfil-channel" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, imx_rpmsg_pcm_id_table);
 
diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 2b17abcbd2bc..163d9982d797 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -259,10 +259,8 @@ static int avs_da7219_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_da7219_driver_ids[] = {
-	{
-		.name = "avs_da7219",
-	},
-	{},
+	{ .name = "avs_da7219" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_da7219_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index bf6f580a5164..8d36bc7ddf16 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -104,10 +104,8 @@ static int avs_dmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_dmic_driver_ids[] = {
-	{
-		.name = "avs_dmic",
-	},
-	{},
+	{ .name = "avs_dmic" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_dmic_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 301cfb3cf15b..36c13db3a272 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -309,10 +309,8 @@ static int avs_es8336_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_es8336_driver_ids[] = {
-	{
-		.name = "avs_es8336",
-	},
-	{},
+	{ .name = "avs_es8336" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_es8336_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index aec769e2396c..03cfd91202d3 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -231,10 +231,8 @@ static int avs_hdaudio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_hdaudio_driver_ids[] = {
-	{
-		.name = "avs_hdaudio",
-	},
-	{},
+	{ .name = "avs_hdaudio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_hdaudio_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 9a6b89ffdf14..787d781ba1d9 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -107,10 +107,8 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_i2s_test_driver_ids[] = {
-	{
-		.name = "avs_i2s_test",
-	},
-	{},
+	{ .name = "avs_i2s_test" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_i2s_test_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index e9a87804f918..389a50923d3b 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -136,10 +136,8 @@ static int avs_max98357a_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_max98357a_driver_ids[] = {
-	{
-		.name = "avs_max98357a",
-	},
-	{},
+	{ .name = "avs_max98357a" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_max98357a_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index 8b45b643ca29..b8231f71d3d6 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -191,10 +191,8 @@ static int avs_max98373_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_max98373_driver_ids[] = {
-	{
-		.name = "avs_max98373",
-	},
-	{},
+	{ .name = "avs_max98373" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_max98373_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index db073125fa4d..d657e7da1cc0 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -188,10 +188,8 @@ static int avs_max98927_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_max98927_driver_ids[] = {
-	{
-		.name = "avs_max98927",
-	},
-	{},
+	{ .name = "avs_max98927" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_max98927_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index d44edacbfc9a..d7ea08bb27cd 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -293,10 +293,8 @@ static int avs_nau8825_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_nau8825_driver_ids[] = {
-	{
-		.name = "avs_nau8825",
-	},
-	{},
+	{ .name = "avs_nau8825" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_nau8825_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/pcm3168a.c b/sound/soc/intel/avs/boards/pcm3168a.c
index b5bebadbbcb2..9d415fd0499a 100644
--- a/sound/soc/intel/avs/boards/pcm3168a.c
+++ b/sound/soc/intel/avs/boards/pcm3168a.c
@@ -132,10 +132,8 @@ static int avs_pcm3168a_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_pcm3168a_driver_ids[] = {
-	{
-		.name = "avs_pcm3168a",
-	},
-	{},
+	{ .name = "avs_pcm3168a" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_pcm3168a_driver_ids);
 
-- 
2.47.3


