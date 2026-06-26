Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3163BCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8BDlwFSAwx/VUcU/0Zc7YpwR/WtK9Ex0Sk5CLPSAtZY=; b=kD20XK+0rsvio1Sci1CmFNMEXZ
	nGHSheYQxYPrqXyyMy2eNEFuKfa9Mmg7l/F0o9USk56US/4b6RHkJwJh/tjlPDqzaPUrvVIoasgZV
	QIJOWs2/8+tNFFpMdmDT+/0Du7csmPx02XO2wjXOQH/BcPTJZC4hWergy3/JTtDrq/U5pQ+K/I0D/
	ITbQ+a9tAYoLjrb8ud3dnFYdoE6nhyGoxgSdZlcSLbqzchITh5pSq0qIljn53B3sNWtMXVPuVmZEc
	s8SgBYPKznVhc6AJtntSHm+yKAed7Ww+eYn5OWFhmVdc5pzR7GkWUDzBVJvImj4oWpkqTsW2ea8ZC
	cMZ0CkZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Y8-0000000Akad-1dPp;
	Fri, 26 Jun 2026 08:04:32 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Y5-0000000AkZO-2d9v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 08:04:30 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-697ebe536b6so1064262a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 01:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782461067; x=1783065867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8BDlwFSAwx/VUcU/0Zc7YpwR/WtK9Ex0Sk5CLPSAtZY=;
        b=DVmLz0AblE9RIFkt7P6Dnxno9a8IE6xobsa2JxkWsl4O6Qe9YTJhE+OBBHy3e6uN1j
         D2JnRGkTTwGx8zzTaP/W/YU4DXVEdc5lDlMIbyL3j80iFLLu895YcPNyAnskmVCgE7U6
         oqRzrAE51UdAwGdN0v4D/q+NC+hLh45m1G6cJHphPzH/nis76x87sjP7EArWCCzsWqKi
         XD1exg0zdk/hYp4retB7VX0wPkaCyZAsUlSwOGRZWzF6n9EwRTtU0mdBkFXUljDONmKJ
         5i/Mv/hmSlNvGB9kHw39eEeX00TSKoi9TLw5TCkXY5eGzmdj6/ShBba6QuTbM49lJoSE
         5KRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782461067; x=1783065867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BDlwFSAwx/VUcU/0Zc7YpwR/WtK9Ex0Sk5CLPSAtZY=;
        b=jbU+q7cich2/xc0qOtomNm1RdURrDdOQ6lpkj/Dgt4DYE0CFt+FbmMb04VCttGAqbb
         tVVNFeqURYEbN9clfJNhiZXlxI1voPG3pDsYLjDePq//CI8dR+6W18m1wnrtE50gyOrV
         pEevC7OLvEzqDysJPq5SedCooXHvA69f+sz4Q5CzllqcOwpFFhZNkvpVDqyWyJsviCjz
         3mnr4Jdhv3KfcBvXxUqsLg4YoDJMMxDKyd1g0ZXFnSymHF8wl4Rm90ngORU6MRzu7mpI
         cJzpw7QNRkKRWZrlWFMf0SODlHbj3WjJCoEP+rhbSsxdVDvnSK9/xRKV467wLo61MJM9
         wA8g==
X-Forwarded-Encrypted: i=1; AHgh+RrEO3a2nuGgzIeHdVaUt6/tqvJWn82UZXT8g2srSeRqJpAxF/7mWg4y6yKiL4xIMndc84PZq7WbKVE/9/R74Jnw@lists.infradead.org
X-Gm-Message-State: AOJu0YxKvrRwfZcrxKyvhz9Bu2SYm4avj4s9I+JSlL/G0bjceElGTxC5
	bjVl0ZMbh/11IMyLEaZqRNCNOrZXfo+mAxUkseaQPDzICu0Fj+T8gpKg
X-Gm-Gg: AfdE7cnotkzsK0kboJpYK7eRcOMofyh9tT4OCzUWuKLvr4uQkhR7JUPUsj+Y60i5Kdt
	G6MtMOyWzrrfrUhVnCBv1KbrkigL3BFGHShSg44I+LQ7xPaS3o8tgKhUyriWl/uFZk2r06JgIN3
	1gQIg+f+eiG1OBjmyMG6KgTXcMoa8bZhHTnkK8lTHDm6mZNycbPAx7H3gFPdyLfb+QvzO3lkccP
	wZ168UUe7h644TZvzS90sPyHt+xW8wVrDUPSztaknuqemqBfEzrsMD45DwHkC0c8P3qPh2pguh6
	P9gDLiYzJ59M3lLbHvnkj7EM8hxYdpW+wUMhDGVGOGO8HKGopgBGNTv1aUAZkGEnA9VDEjfvBWF
	FjJffRuGbbVBu5sd11pwnXi0Rf2LWBF+EyG0hLtnxurMB1XvpodnWhEuMnDZQsiKnQ+T271hVEf
	+AwhjDDdnV8favJcL5
X-Received: by 2002:a05:6402:3553:b0:698:bbe:9c8 with SMTP id 4fb4d7f45d1cf-69810ae7ec2mr1477123a12.15.1782461066991;
        Fri, 26 Jun 2026 01:04:26 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c3bsm24027475f8f.10.2026.06.26.01.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:04:26 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop
Date: Fri, 26 Jun 2026 08:04:22 +0000
Message-ID: <20260626080422.4191435-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_010429_685293_E916BA6C 
X-CRM114-Status: GOOD (  11.48  )
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

The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit 0 +
AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no equivalent:
it only toggles the IEC958 DCU, so a stale datapath FIFO can be replayed,
producing the "machine gun noise" buffer underrun - on start when switching
outputs, and on stop when playback ends. The latter is audible on devices
with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek Play2).

The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) on
both enable and disable (audio_hw_958_enable), and when reconfiguring
(audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the same:
reset before enabling the DCU on start, and after disabling it on stop.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 sound/soc/meson/aiu-fifo-spdif.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index e0e00ec026dc..826055a71421 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -24,6 +24,7 @@
 #define AIU_MEM_IEC958_CONTROL_MODE_16BIT	BIT(7)
 #define AIU_MEM_IEC958_CONTROL_MODE_LINEAR	BIT(8)
 #define AIU_MEM_IEC958_BUF_CNTL_INIT		BIT(0)
+#define AIU_RST_SOFT_958_FAST			BIT(2)
 
 #define AIU_FIFO_SPDIF_BLOCK			8
 
@@ -68,12 +69,16 @@ static int fifo_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_soc_component_write(component, AIU_RST_SOFT,
+					AIU_RST_SOFT_958_FAST);
 		fifo_spdif_dcu_enable(component, true);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
 		fifo_spdif_dcu_enable(component, false);
+		snd_soc_component_write(component, AIU_RST_SOFT,
+					AIU_RST_SOFT_958_FAST);
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0


