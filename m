Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58397C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 00:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=toxh8rwTNL/X7WiYHzoGF/u3b7cgt27qWmy1VXJxv+k=; b=ZxhjzWMXigg7R6Lqai6ElWO1+l
	qx1ACkxypUywdtQMR0mEVYTAb7b2olBVSGT/V9I0w9pba9/4JqkvWdIlUIcQzAOOuB/+OS9Ng1s0C
	/87k2XxZ0hqhuLrsHt6/WdukHbamNEdgpdEPOZwkGvEZQzssG2uGNivSsMxjoIHMq30UB1Qn5ibhW
	y8p4/ZBPS/7ZcX9I04CCrl48h1f7YOdgMfQK6LSpC2sVjxSEUqkOkBNTfSqQJZlN6Xgyl6u3EnT0Q
	JxW8Bz7ZStEgOc1TkkkkMHoEshNwVpNsJ3OJStVPSM+gy+jjpxvH7Wx8GQ0pX56AiGjG+GsrP9N5J
	6T6qf+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws8Kd-00000006tre-1wdm;
	Fri, 07 Aug 2026 00:21:03 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws8Kb-00000006tr3-01iN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 00:21:02 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so22661156d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 17:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786062060; x=1786666860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=toxh8rwTNL/X7WiYHzoGF/u3b7cgt27qWmy1VXJxv+k=;
        b=PhMre3J/oJl8RgVXlM8umGQtSGcAjLzjcBRNuBzPKbvuT34wlWM1/3/PpG8rpthwJE
         9zf5zyuFxfBR5lRMJVzI2yKs4urG+rlce2wgGCj1BAXs1bYdYQ3BNuf2UI9ZiLar231J
         eSkT8kxwlNQYG9yksjvuGPQoeZvFCaglG+9IyWNMC7+ricL/b5dWyZppIDBwZ0iYiroR
         KSzttD1up1KJbgHTKDHO50tTE4u0e5KzfNK2V1E9VWbJgTDbXOJgv1Tzql7cJaZSdF6e
         UK6huyC8osyL9jKAexj5ELSi0yQl3dxXsloJWQ9SqxoT5m3hpqSEow94QxX9X3hRkwnb
         EEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786062060; x=1786666860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toxh8rwTNL/X7WiYHzoGF/u3b7cgt27qWmy1VXJxv+k=;
        b=nPJsS02V2ZouKQHGXcSOXYebTbqmQ/YZIn/e60t+9ZCBui3zfuLmDZNapTtxasHEcb
         hTgsfxXhfugaxyJUWZASJLejYhLqOvkQdStPd1TJtZB8d1W1MAW8QRaDKqi7eXb30s6l
         Ds/46CZw+kxQf1bSS5eSH03RkFdesmt4CqR/GD9caiRs6HCYORHwqBsvqLgP6kSOmdA+
         2DUjqOVkbNZ4OlgJf8ZyZYtvLibumWfcMETNjr1Qn/U2q0+dlC86USHYnTVLAt8SdTwq
         JzhM+IzZmlgTqHyQqriEcregwZA4RNZ8cFy9fuvtAEEiZQVLy+e10FM5kmo9rsqKZTXp
         v7BA==
X-Forwarded-Encrypted: i=1; AHgh+RrPHPcH5NfsxBEXvlh0EIK5y0QtBpC7smadJA5BjMatD179PKpFzK8yZIRMSAnxKAVPtuxe6ThcxYKDkuBNdMYJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yylo+z/rnoRo5gnGVcYQgXkiFbSSTzqiTUJ4XkSlV3FaLgsVDPb
	ShvF9Ipbmf7/+bOybKYc09NKu9Kg8O80hqG72mAahs9kLzTkGJTNokjf
X-Gm-Gg: AR+sD13xBNbEfY0iBKJsoOZGRuta0di2HSdRDu8PgnQVgFTLhJoFYhGSP21NWkDBF4Y
	jyz+vgkserNLGwmuiQ6V3hXiJsdWAENiXKInzpHPlG+aG5dnyCM6L5di+IG0MZpZaEvHGgqze31
	vi0mEyLfepYKTE5zu7rBYPyt0hK3087JpFSAFwnRhD+CQbCsZwnNp3l0PhEkkqI9LAwODqWi/Yn
	LHb/hV+dVCJ1KusI0ejskLBzHc4+yIvKYHmOVhTq3XKPull+LmUArTcBnyG+t0L8uzMhEYi8NIK
	za9EeHUMjbzBTIMCHlsOl8pJemCk60g4znTd4/KopwSx/5fvd7DcCW3pcqUhHl3HqbXfyMrDxTn
	GpDa/p17skUSgVQs9vpzz1WQ+TOzha97Umzp6cGjIHgqlWJpg/oCBd623i1utt2wHfz2vpY42AQ
	avxhAoYOd1v9VTEab9y+SOAWdOFbTKE5bGigf0fUaX5RHO/4NdE8dtuj77iDKH+lh/OT2Fyl5XM
	A2+/NUZu2mJQmcjLJZ2mIGVhSCuurfnKkAwWcDxQT6AHczDKJ+6z44Rq3wLPyMjrEuUUD/JX2nf
	JZVcbX+oJiY7957ozZ1XcpP/+Rj/Lvy0CwngQA==
X-Received: by 2002:a05:6214:29c5:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-908813800f7mr217479286d6.15.1786062059761;
        Thu, 06 Aug 2026 17:20:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908800add3dsm64589136d6.39.2026.08.06.17.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:20:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: xilinx: formatter_pcm: clear stream pointers on close
Date: Thu,  6 Aug 2026 17:20:56 -0700
Message-ID: <20260807002056.42953-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_172101_075420_62DCF21C 
X-CRM114-Status: GOOD (  13.51  )
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

xlnx_formatter_pcm_close() never clears adata->play_stream or
adata->capture_stream, and on reset failure it also skips
xlnx_formatter_disable_irqs(), leaving the hardware IOC interrupts
enabled while ALSA tears the stream down.  A subsequent interrupt then
dereferences the dangling substream pointer and calls
snd_pcm_period_elapsed() on a closed stream whose runtime has already
been freed, causing a WARN_ON or crash.  Since the IRQ is never
disabled, this repeats on every interrupt.

Disable the IRQs before resetting the formatter, and clear the stream
pointers in close so the IRQ handlers' NULL checks catch straggler
interrupts.  Do the cleanup even when the reset fails.

Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 7eba3a0205f1..e1d2f1cadf8d 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -421,15 +421,19 @@ static int xlnx_formatter_pcm_close(struct snd_soc_component *component,
 	int ret;
 	struct xlnx_pcm_stream_param *stream_data =
 			substream->runtime->private_data;
+	struct xlnx_pcm_drv_data *adata = dev_get_drvdata(component->dev);
+
+	xlnx_formatter_disable_irqs(stream_data->mmio, substream->stream);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		adata->play_stream = NULL;
+	else
+		adata->capture_stream = NULL;
 
 	ret = xlnx_formatter_pcm_reset(stream_data->mmio);
-	if (ret) {
+	if (ret)
 		dev_err(component->dev, "audio formatter reset failed\n");
-		goto err_reset;
-	}
-	xlnx_formatter_disable_irqs(stream_data->mmio, substream->stream);
 
-err_reset:
 	kfree(stream_data);
 	return 0;
 }
-- 
2.55.0


