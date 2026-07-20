Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFAEC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 06:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeGYNprjO9RozTDm6r0Dm+rCthz+7k4Z0dmrZWw1tp8=; b=rJcnsL/jxb/cDgO2l7iP2n5nEA
	EuL4SJC8NvmOD2mZZ1pm3ys3gQky2Rad7fA5axtJ03cNQlx6sRvcRoyTvg5yHd3ZYF9G3EcC/mpWT
	IFTJyGiNfT8UhlX01BgGZSboBXeC4O/MoXJ+NaLUdwEW5SN/ttFztRKRT7WuugVEoXcIbMOc84ysS
	EysG6MMtmp0jJxGv+9cUBDT5ogmHKXYKHmHALU1ur2ByRuyBzpBA1jTsTuSpejL2U1cgFVjScJ8kc
	dxjavyJZCAI2iCJ/Ln7tTz/saa9D95nP1syM2n+yXZS/Rpcq//cyqx7DAxvrJd647njEiQ00mPh9T
	qy+DHPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhQR-00000005wIA-3SN0;
	Mon, 20 Jul 2026 06:24:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhQO-00000005wHL-434G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 06:24:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49553515a8bso15690115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 23:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784528663; x=1785133463; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YeGYNprjO9RozTDm6r0Dm+rCthz+7k4Z0dmrZWw1tp8=;
        b=pf3+w59I7MmZf3wDaj7IqV5yzEM+jC/8o26mxsBj/gy/hL8pg25SayJSIZf/j0qc2w
         xf7Or6hE/5z0ghmq5Xq71MjeqfmfyFI5pMF02F08sONZThBXI601KCAWcXetbwEKEi/Q
         BTX2ivPaBOxgZcaeZowUtacTZdjVnESGrHTdzJnPrOmC1GDkQqCGIcSE9EBjZtLuPejG
         Ok38ZKRLTHIeiQN9jcEKYKt1YOoFoYQ8dCsMTu2QeIhUWkN5ylPkn4TTY6XV6IyDTbHB
         o/PDhRllsgu7SlYcb8aQbF24JxO1fLrjAHPjfQtLcKJwPlKBJSU3v9+tnglJGni/E4IC
         scbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784528663; x=1785133463;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeGYNprjO9RozTDm6r0Dm+rCthz+7k4Z0dmrZWw1tp8=;
        b=AvK1Y7VBb3NDXX2EWMMQdvOAi8tDd3Ng5OzhEvrmf13He0nt9LFdfbndpREaGmg2q7
         BCbJOSdJHkqA1f9kwJxKUcSIYnuGlDXpW6b8OObkwsRty6x8XfRak937j9O5LeUqizsm
         IWBjRXFg02DDq8fb02O+x0G+1p2CEAPZb7CexCFz0EXkl2jIQiQSJ5n5S1mcHOCJaacg
         EXcLEVTs54OExitfV22FL2GdTSlk9j/9c3c6743U4x9ty6ulNbJABBPMZ3WkDJlnChUn
         7ZE4ZfW3mlUaRUDwvZoWeW85x+Mw3OonZ93Kwm0V+fSbZBW59EzFC6Kayka8jwa0qTTr
         fC7A==
X-Forwarded-Encrypted: i=1; AHgh+RrDgnH/QQS+fgahqYJU3OwNBxkYrLzZc/UfO9ayL1xTb8E1sa/Ja9ZCWDt3w71NdM0el9bpgbfXyNijwaz9kNS2@lists.infradead.org
X-Gm-Message-State: AOJu0YwASLuzujttjhAKNPiCgkCk7cZLonZNNbZSBwTI6gTjyijdjDf5
	vu0kBm3lHNxu/xDYPbKDNe3DaTICrXnrITvtFL4pLRaLRN7nXxIwHox+9yZQ4pkkgjw=
X-Gm-Gg: AfdE7cmHfJAQAPQgvgb/Gelvp7gxHEszN91nnNjas6wV1gHZN/VDDOLT4YVE++xZjHp
	AWCcek231KX9XXNqr0RyeWylkkV2MM+BmFKFcxq21/ZtGlCTIq4rUoXLpRX7Jg+4byJhk623XyC
	6jqjrJb6Xj/kZMg1581djRoTfX//cYxM1MqbsXerbRQCivyaHR++0fpzxXaMSoIkzLaSbF9p0C0
	ueKvBkejVsRvdtt4OVQ1i1EKtcPeb4jZcHurNpPiliGt99GGDZEFyzkwLCjX/YtobucNRcW/wHg
	w5gLqI2mC2RhX4JkfBFShASmcz485v24452Sjt8FuqI/lKBbYknmdJAOlJrXcC8+5B7/a4SRvof
	0Ll10DZZIxaHGc0lguxy1QXmbwiTFvBjCGubIvKkrpfUXKYti/Pvi9Do/ZBWFuGsRedUNspeWVd
	Hr2VkoyE/L258OCjxk7Q==
X-Received: by 2002:a05:600c:1d1b:b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-4954a3db7dbmr131890425e9.15.1784528663074;
        Sun, 19 Jul 2026 23:24:23 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4954a2b87c6sm455259245e9.7.2026.07.19.23.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:24:22 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
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
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 6/6] ASOC: Unify code style for platform_device_id arrays
Date: Mon, 20 Jul 2026 08:23:50 +0200
Message-ID: <093867d47c079d2aaab06bccaae734c54c342a7d.1784528081.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=13598; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=iR1LqIFM5kpqU9FhK7AKXR85Ty5byfvUM0BITDHvv+A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqXb7/ZjkV1xENnv57f8GUMRLZBCpZ1LZrci46v TNMnyy6QuCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCal2+/wAKCRCPgPtYfRL+ Tk+/B/4zvL3PZkVE/LvqrCiNOp093/fSaf+JA33aGPRnYdd3KE4PbdhEyLN92lv8dUj8MS+5U/C nd/3Jw3tR64O4+HgjFbfwaFuQnkUnsAkl1y3vrsscJpaV5FfRy/q3Fe/rMxYj3rEB5B2S+eR9f9 9eqlrwN6uNkJfN+cCAjdjKOVgZflj7GY5J4tXcqRR9KG0dr2h186sG/16b6M7ocumP8SmSnlkor MIMG/xs6Yj+5RLaWHP4wsA3g6iAcmK4nA66jB3h44Eneonrp/xOpjrN+JJBxEmJOolDyTgsUgP3 bzcA38YgoukL02WmEgrd6mYHAhsOsBbKUz+ap5KbL2kWMmwU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_232425_149372_594592A9 
X-CRM114-Status: GOOD (  16.15  )
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
 sound/soc/au1x/db1200.c                |  2 +-
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
 sound/soc/intel/avs/boards/probe.c     |  2 +-
 sound/soc/intel/avs/boards/rt274.c     |  2 +-
 sound/soc/intel/avs/boards/rt286.c     |  2 +-
 sound/soc/intel/avs/boards/rt298.c     |  2 +-
 sound/soc/intel/avs/boards/rt5514.c    |  2 +-
 sound/soc/intel/avs/boards/rt5640.c    |  2 +-
 sound/soc/intel/avs/boards/rt5663.c    |  2 +-
 sound/soc/intel/avs/boards/rt5682.c    |  2 +-
 sound/soc/intel/avs/boards/ssm4567.c   |  2 +-
 sound/soc/samsung/i2s.c                |  2 +-
 25 files changed, 40 insertions(+), 66 deletions(-)

diff --git a/sound/soc/au1x/db1200.c b/sound/soc/au1x/db1200.c
index 81abe2e18402..78346cd7959c 100644
--- a/sound/soc/au1x/db1200.c
+++ b/sound/soc/au1x/db1200.c
@@ -42,7 +42,7 @@ static const struct platform_device_id db1200_pids[] = {
 		.name		= "db1550-i2s",
 		.driver_data	= 5,
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, db1200_pids);
 
diff --git a/sound/soc/codecs/adau7118-hw.c b/sound/soc/codecs/adau7118-hw.c
index 92b226b8b4bb..4342eb7dd9e5 100644
--- a/sound/soc/codecs/adau7118-hw.c
+++ b/sound/soc/codecs/adau7118-hw.c
@@ -22,7 +22,7 @@ static const struct of_device_id adau7118_of_match[] = {
 MODULE_DEVICE_TABLE(of, adau7118_of_match);
 
 static const struct platform_device_id adau7118_id[] = {
-	{ .name	= "adau7118" },
+	{ .name = "adau7118" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, adau7118_id);
diff --git a/sound/soc/codecs/bt-sco.c b/sound/soc/codecs/bt-sco.c
index c0bf45b76cb8..b085885e3f18 100644
--- a/sound/soc/codecs/bt-sco.c
+++ b/sound/soc/codecs/bt-sco.c
@@ -85,13 +85,9 @@ static int bt_sco_probe(struct platform_device *pdev)
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
index ee741f3d79bd..7086fb7fc1eb 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -810,9 +810,9 @@ static const struct dev_pm_ops imx_rpmsg_pcm_pm_ops = {
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
 
diff --git a/sound/soc/intel/avs/boards/probe.c b/sound/soc/intel/avs/boards/probe.c
index 73884f8a535c..4053d14289b9 100644
--- a/sound/soc/intel/avs/boards/probe.c
+++ b/sound/soc/intel/avs/boards/probe.c
@@ -64,7 +64,7 @@ static const struct platform_device_id avs_probe_mb_driver_ids[] = {
 	{
 		.name = "avs_probe_mb",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_probe_mb_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index a689f4c80867..289f1230851f 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -261,7 +261,7 @@ static const struct platform_device_id avs_rt274_driver_ids[] = {
 	{
 		.name = "avs_rt274",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt274_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 4c9ac545555a..9364d60cfcc7 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -231,7 +231,7 @@ static const struct platform_device_id avs_rt286_driver_ids[] = {
 	{
 		.name = "avs_rt286",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt286_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 2d7a7748d577..5d3b3cdc9564 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -250,7 +250,7 @@ static const struct platform_device_id avs_rt298_driver_ids[] = {
 	{
 		.name = "avs_rt298",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt298_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index 22139eaad83a..e448bc9fa5ad 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -178,7 +178,7 @@ static const struct platform_device_id avs_rt5514_driver_ids[] = {
 	{
 		.name = "avs_rt5514",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt5514_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/rt5640.c b/sound/soc/intel/avs/boards/rt5640.c
index 2990d32f2301..c4e33d71e82f 100644
--- a/sound/soc/intel/avs/boards/rt5640.c
+++ b/sound/soc/intel/avs/boards/rt5640.c
@@ -252,7 +252,7 @@ static const struct platform_device_id avs_rt5640_driver_ids[] = {
 	{
 		.name = "avs_rt5640",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt5640_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 68fea325376a..aadbd3f2a1b2 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -249,7 +249,7 @@ static const struct platform_device_id avs_rt5663_driver_ids[] = {
 	{
 		.name = "avs_rt5663",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt5663_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 81863728da1d..d33699cca595 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -325,7 +325,7 @@ static const struct platform_device_id avs_rt5682_driver_ids[] = {
 	{
 		.name = "avs_rt5682",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt5682_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index ae0e6e27a8b8..d7c9bff37556 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -180,7 +180,7 @@ static const struct platform_device_id avs_ssm4567_driver_ids[] = {
 	{
 		.name = "avs_ssm4567",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_ssm4567_driver_ids);
 
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 56d11741dabd..81d5dd36a246 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1675,7 +1675,7 @@ static const struct platform_device_id samsung_i2s_driver_ids[] = {
 		.name           = "samsung-i2s",
 		.driver_data	= (kernel_ulong_t)&i2sv3_dai_type,
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, samsung_i2s_driver_ids);
 
-- 
2.55.0.11.g153666a7d9bb


