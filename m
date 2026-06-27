Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F8AC43327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 12:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CgBb9c2zB8E5ylruIOvxgxXaQ+5aMJ9oD3Y4vVrihts=; b=jhYrnDkzq2NBIR/bd9HWQI9W3Z
	8ijhXELyarivAsoxYtrzPM0dR2oD3Gw16WHvBfKq7pPsyVS7dRTpoH6T/1+TRulXXUU79f15umjOB
	kCNZx1iQHgTOBpDGhZuzmRMyiOwrz2njiyP//0JhgNCYd8LOBm2XaY3cad/GD3J18yxEZJ9EjzsPP
	bOw6wl/MmZnZ9ZbYQ7ik7YOorMsO4vxZIN/3def8DdEXTI8aDamgN6Z5ZWp6xmtT+GyxbZ43pLqlR
	VnF4XsFYQgLfGyOBTh0f3S7iZX5ohUR+qGeJn7JtU02DMH6dS1OvSXoMJQG7xMMcN54Inw/f9AfjR
	iAf3+t8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSUY-0000000CTTy-3p9f;
	Sat, 27 Jun 2026 12:50:38 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSUW-0000000CTT2-3G3C
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 12:50:37 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49249707788so14904315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 05:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782564634; x=1783169434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CgBb9c2zB8E5ylruIOvxgxXaQ+5aMJ9oD3Y4vVrihts=;
        b=VAGvSxhFFA3F4GWe0SncjGnORgWs2VLAaa2weUiv7yzgwgbbjHVirZeD8i8hVMLh15
         lUCExzTqKpGEZWePzFuHmCP0O889GQYwZWgE036vJkWxLB5w2yFT9AEbKI0DVTrY5VGC
         nECxfLUNM7cjFxaRsj5n/Xcv76NTV8Vy04UKLiG07BCmQFb10XNSc7M8f6Cd4KTAI+eV
         k2PMt3HuLXQ5BehXqKWbeumQYPDU3D8xxvz8cr7ALwAcYAAZWsREwhbbihSvsHS/aBe8
         mF3WEEMo3PItvJ5I5RpDm32GyQX4jZQGcOv1quEmIbg1so7eZUNtXjbb/sjzLG4TnDtw
         zwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782564634; x=1783169434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CgBb9c2zB8E5ylruIOvxgxXaQ+5aMJ9oD3Y4vVrihts=;
        b=aiKjFzyzoCHh2SLtntMuA3SHnksUI5Qq0tdeXRFG/K+nu1D6r0iuJVd+q2bE8hNSXu
         w24eaPDsuNhMEEqFDYNfe/KgBCtFBF+6EKJH5CNYyMpFfBisgu4FrNQWMih4FBidKpPZ
         ZHh2kIGxeEnjxKfFbny1OIlNJ2c6cdtAejVzv1RgBPTDohTbYvIswZaIKTSymLcQTjqN
         h64C7pjh5I0UTcWmZNpx5sWVCFP0Q4q0NXWK0KV9PZoaBbBeBxVQnkLx/gJ1Mprfhp1j
         wEjqaQzkz9mehgxXZn/gv/wAu9o3MSLd8n1SJl7c213jxFGUvKvDiG/AOIYbfJducczd
         uX6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+4PnDdAeKXkZiEQv1GhkYu0+Ai1IWiVu5kilfGneSmhR2GaWVEuXeF1aUkskqRJp4qt9oXuvBCfx7dgRLEsSXm@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh/ItsAPzGY0UnWUoLJ0QeSfQksdDrK2efdcl9h7FuJjCgn8xn
	2N6IIkZAFdxx8GwSZRvfbJw0+xniBg7656DO4Nph0eapszlboYyqAQ7P
X-Gm-Gg: AfdE7cl35lnAPlp5Mr3OSxUBVscNnrdygPOsj6IRFokh+14ofzOn42JN3DMHh2QuhMH
	oX4r2akSGHDhJi8XvKi9VyX+NJLj1bQ8DUt5jszn/awl2e94DxdmTR8eDzhWObO/4zBLMwEv5A5
	OeZPHuT1XWF3pJ6M1xH77qhbg0i6bbdbEDK0gtq+2G9t41FGg7CJPOje5ETkY+IOveIJk/m+mVG
	y4WsO+shEU1++gQqZ6wCFEjKm3SmCrYRTT6uaJ5Z1iHpmY32viuvLOyq1RlZJVJNUIfYcG0LZAV
	gKpzlXBGYC653wPyuCFh5IW6d2vBlOJIT+7rpLur5hpnd6dAdCrMs9+WJMgSXpXC2x5Nk1/vdK8
	lVz7f6eIhqJ42KwtZC8UiJ8qRZfg72RLY5hMivUvjJw2xNZh3CaoBkE8D9OBtxhGgdbMST2uSxA
	U3vy/m+9WO1xIlfpAK
X-Received: by 2002:a05:600c:4f87:b0:492:703c:df36 with SMTP id 5b1f17b1804b1-492703cdf53mr63941035e9.26.1782564634280;
        Sat, 27 Jun 2026 05:50:34 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926f94f213sm105298565e9.12.2026.06.27.05.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:50:33 -0700 (PDT)
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
Subject: [PATCH v2] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop
Date: Sat, 27 Jun 2026 12:50:30 +0000
Message-ID: <20260627125030.808058-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_055036_827049_13C16D6F 
X-CRM114-Status: GOOD (  12.43  )
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

Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Changes from v1:
- Add missing fixes tag
- Trigger AIU_RST_SOFT_958_FAST then disable DCU as in the vendor driver

 sound/soc/meson/aiu-fifo-spdif.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index e0e00ec026dc..a9861c5d6637 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -24,6 +24,7 @@
 #define AIU_MEM_IEC958_CONTROL_MODE_16BIT	BIT(7)
 #define AIU_MEM_IEC958_CONTROL_MODE_LINEAR	BIT(8)
 #define AIU_MEM_IEC958_BUF_CNTL_INIT		BIT(0)
+#define AIU_RST_SOFT_958_FAST			BIT(2)
 
 #define AIU_FIFO_SPDIF_BLOCK			8
 
@@ -68,11 +69,15 @@ static int fifo_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
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
+		snd_soc_component_write(component, AIU_RST_SOFT,
+					AIU_RST_SOFT_958_FAST);
 		fifo_spdif_dcu_enable(component, false);
 		break;
 	default:
-- 
2.43.0


