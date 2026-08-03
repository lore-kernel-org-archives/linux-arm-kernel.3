Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE06CC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 23:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pNy0UkHqJf4wD9Q7SUQtnbzuWP3YB4RBFtxq12jMuKE=; b=uEpLexFmaHwOZhuBFjqmdzpGZd
	SgOaj7hes7rheNOqer4/DlpUmwV+fMhMVLudNCvppbXOgrAO1vuoLqbd/eKC/M5QNmDUvk9JmGH3k
	teS+AqokwkxKwhnWmAZL3MRHlc/mZpmVFhnA15v+Bo2BCbiRUfTyiB++aBj/xp7VIZ5S+Mr8dQNbp
	TuzB7KjKIO9ga9UwHPukrayT2fJIkFOg3YYu4u5CBJ0M+zr/mdyLnZj3EHnpUiNcYL0Jz4J1vi465
	PVh77L6DoRYdSeuLYB1hUZXX5VFJ6Zk7n4N4JgCCVTt6y3Hg7o5Qc6BSjwQU823rl+/b8MiYt7+5j
	G+xKNvNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1vR-00000000gHf-10sB;
	Mon, 03 Aug 2026 23:18:29 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1vP-00000000gHC-110u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 23:18:28 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cea3004256so43879365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 16:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785799106; x=1786403906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pNy0UkHqJf4wD9Q7SUQtnbzuWP3YB4RBFtxq12jMuKE=;
        b=JnAihTZ2KNa6QU3tdgATy23bVzOprMOpFfDbEtv2qNiCume5RhRPLcFfXfbzR3scuo
         cLG7Jb/IXR8mlDNJOyVhZ6N5N+N2ITwiBfM7Nt5Dujur+MdGIFqFTW4EPScWBdvLkX4r
         RKDmuW1FP1w/0Dexysl0BkkawJ8u9bddu2WoNDfZ1kmRdytqXOGj3qleKhd3UYvVjFQO
         9XfMr2TwTNookH3tIkRsVIdpTPdun+3grWLOQOlxK0Q/q5BcXN4HEc0ynovmxC2iF/F2
         016cj48cR5E8E2vNLRBUkav9BlQfs4T6IXjKIHS6Y8qD4/zHtdhGZ7YYNrlbFZaTTYwI
         czTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785799106; x=1786403906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNy0UkHqJf4wD9Q7SUQtnbzuWP3YB4RBFtxq12jMuKE=;
        b=QaYKllHboA7o91RfQ/FMUVld3au1JNaFycMokpJI8fD/vs5S5pFWDwozctiu4hu8HA
         mlwu8BOhZmx8XidZCpWSs42XAmMi1omup0kWQKYBGWWZ3b2GkNF24NWhc31y8r5FPap/
         Gd2MkyzIHyhl8TLhBv51H5dTCmt3dknpWoVmilEdtzHB0BqNksa7tcOkpN4h+3smLv8i
         UsxCxjHB2tpK2/1VlUhfTaappl3Q97bnKtrb9vm3E43+nOWnRjRVVP1Ymz/KexRcfvfG
         +3UlZfAY+WagI52muTVFbbsDRSj6+yAyBvMjSATm/OKe51vDpqIX3Dkm0vMYSnW64tR3
         d2Pw==
X-Forwarded-Encrypted: i=1; AHgh+RoH2Kd/g47mjnMGLn2iNXXuABIFqBVFycAS1MQxwRlIHM2h/GSmtYV9+xz29lBwkjzHYK2lx+qkFBEwW8rajnWH@lists.infradead.org
X-Gm-Message-State: AOJu0YwrMdA7pzsUmJs0ekokpBaUpZ/PpCyJEYyosVTxQ6GZS6ICs1qt
	dphIaTxuagwfwJS8qoz45i06KIF6k3on/uw2rfhrixz3OA7AI2Sdi7JP
X-Gm-Gg: AR+sD11MyCwuP9OjYefsXKCaqLw8ncJztcUt12FDQukAXLExQB0HNqo/CXUCX5+1U50
	bEr6Sc+Q+Vs0tw3Kmt7YGPBlpvLTItm83BriLXCONPwdVmL2ndWBw+Wueh3g+yu/McAvKOW0K4l
	RC5JYDIAeMPmRUnXMkeeLBCdEd0p/tcEMCGE+dHVd0mlSVkfNAv3W/rjYMyWCDIYSPp22J8DQ0N
	MCqNDGmPISBo2gkRfv0i7YOfh7lDVNvGEAE61hAaAbDeatYGRm7Sa3gNfqS+J+Y5wdYdcRP1MX7
	Ye5Jd4gJCpZCZZprMCgeCpYb1Z8yyIbrosbx/DLYAuNF8EjBrC6eXM4Y/lEJq0k6yOr5mbnP2Na
	WdEfuA1v0dKakF5bS88rjk63FijJ8cYdezus3LihYH75B79P6ok489ttOmKZZGHNT5Khv2Gz6Pf
	w4rkoMC6uvlbfJ/ASzs6aDKHXZglyUHsxTYZzMAEqmH59FEaX2ECi9VVzgI/jfFAKhzyfv9qqCE
	n9FxJzXPFdnFdYlKbeBV/H7amS2Jvl7XZMuDb436g6K02pA80sxSYK8sj7hxMp+RiU7yeqXP2Fz
	2rAgMV/LLnys6wB0IZDNoYWYOvo6PW7kRAev2Q==
X-Received: by 2002:a17:903:37ce:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2d05221d3bbmr113140515ad.12.1785799105666;
        Mon, 03 Aug 2026 16:18:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04aea0f8asm43349705ad.35.2026.08.03.16.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:18:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: xilinx: replace OF with device handlers
Date: Mon,  3 Aug 2026 16:18:23 -0700
Message-ID: <20260803231823.95147-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_161827_289160_648351C8 
X-CRM114-Status: GOOD (  15.96  )
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

All of these usages of OF handlers use the node from the
platform_device. Use the device member to simplify slightly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c |  2 --
 sound/soc/xilinx/xlnx_i2s.c           | 12 +++++-------
 sound/soc/xilinx/xlnx_spdif.c         |  8 +++-----
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 8f7a76758535..55b5b473d85f 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -9,8 +9,6 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/sizes.h>
 
 #include <sound/asoundef.h>
diff --git a/sound/soc/xilinx/xlnx_i2s.c b/sound/soc/xilinx/xlnx_i2s.c
index 0676da122edd..273258125497 100644
--- a/sound/soc/xilinx/xlnx_i2s.c
+++ b/sound/soc/xilinx/xlnx_i2s.c
@@ -9,9 +9,8 @@
 
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
@@ -174,7 +173,6 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 	int ret;
 	u32 format;
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
 
 	drv_data = devm_kzalloc(&pdev->dev, sizeof(*drv_data), GFP_KERNEL);
 	if (!drv_data)
@@ -184,13 +182,13 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(drv_data->base))
 		return PTR_ERR(drv_data->base);
 
-	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
+	ret = device_property_read_u32(dev, "xlnx,num-channels", &drv_data->channels);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "cannot get supported channels\n");
 
 	drv_data->channels *= 2;
 
-	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);
+	ret = device_property_read_u32(dev, "xlnx,dwidth", &drv_data->data_width);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "cannot get data width\n");
 
@@ -205,7 +203,7 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	if (of_device_is_compatible(node, "xlnx,i2s-transmitter-1.0")) {
+	if (device_is_compatible(dev, "xlnx,i2s-transmitter-1.0")) {
 		drv_data->dai_drv.name = "xlnx_i2s_playback";
 		drv_data->dai_drv.playback.stream_name = "Playback";
 		drv_data->dai_drv.playback.formats = format;
@@ -213,7 +211,7 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 		drv_data->dai_drv.playback.channels_max = drv_data->channels;
 		drv_data->dai_drv.playback.rates	= SNDRV_PCM_RATE_8000_192000;
 		drv_data->dai_drv.ops = &xlnx_i2s_dai_ops;
-	} else if (of_device_is_compatible(node, "xlnx,i2s-receiver-1.0")) {
+	} else if (device_is_compatible(dev, "xlnx,i2s-receiver-1.0")) {
 		drv_data->dai_drv.name = "xlnx_i2s_capture";
 		drv_data->dai_drv.capture.stream_name = "Capture";
 		drv_data->dai_drv.capture.formats = format;
diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index ae05818ba064..a70ca6beb646 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -10,8 +10,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_platform.h>
+#include <linux/property.h>
 #include <linux/platform_device.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -242,7 +241,6 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 	struct spdif_dev_data *ctx;
 
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -257,7 +255,7 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 	if (IS_ERR(ctx->base))
 		return PTR_ERR(ctx->base);
 
-	ret = of_property_read_u32(node, "xlnx,spdif-mode", &ctx->mode);
+	ret = device_property_read_u32(dev, "xlnx,spdif-mode", &ctx->mode);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "cannot get SPDIF mode\n");
 
@@ -278,7 +276,7 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 		dai_drv = &xlnx_spdif_rx_dai;
 	}
 
-	ret = of_property_read_u32(node, "xlnx,aud_clk_i", &ctx->aclk);
+	ret = device_property_read_u32(dev, "xlnx,aud_clk_i", &ctx->aclk);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "cannot get aud_clk_i value\n");
 
-- 
2.55.0


