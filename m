Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F13C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 00:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=04FhADnipVf1VPFtyxLVHbuBJYmlqyNGeVnPiku2pjU=; b=VuQP1peMfal8YFzjRvWFRZShpz
	7ZA+GEimZkC817aVVhoaQ1ytNg8qPOaHqHf6Ni8MsXJzEy0oUozP4W7K87TDNiYojOjn1+e7XovDm
	8uQrQpNLDfFw4KhapsQhTI55oL+JGOKxYkuAkg7AiI+WlstRgalJARZoW53hTG9subpu/mlg5Akra
	NGUcReMKwaASUyosQbGpIRtKV6l164vNZIeOjXqd1gnQYFbtGGAERD3vFuyhDd25uJzv9xjxww0IS
	aeS6rTPiNHLnB8uFztALmYHukCuWhmp9nQlagGkN7rH9DQZW1X2byPSTHD/XGsYVdL0Bp0pmFT9hk
	TPccKwAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws8dZ-00000006uGk-3pwt;
	Fri, 07 Aug 2026 00:40:37 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws8dX-00000006uGP-2CRW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 00:40:36 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso2501969a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 17:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786063234; x=1786668034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=04FhADnipVf1VPFtyxLVHbuBJYmlqyNGeVnPiku2pjU=;
        b=j/Ta2ZgqWnJVQyQoh1KH4XjTCbAQzXoBbQbf/gdR2ZN5uVewH6+tCUL7L59f+9M9v+
         Z8pBNuDD4U05bpJ5O5/SZIVDT7T0kTckvfZa16xZxOJh10P33s9PWjp033iA++M/lYO1
         fkW1MFnGeBblbKo6fouJSaUDXMcFWASmmI8siMISuHeBY3CrB5WF0BT7kYid5mDWy7Nh
         auA/6Zz1eqYGyrdacEyeUlyy31nuUIifzbKUq0MhfL64FkLWHi+53/TDnhX48xcMxiRv
         Jv3EWJg6ahRG1ljwNLRpcM3NFkDOb+eTXsOM2hO0XLjMDmzoHngb8JBe2/bc+5zSaNco
         3+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786063234; x=1786668034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04FhADnipVf1VPFtyxLVHbuBJYmlqyNGeVnPiku2pjU=;
        b=CoiOoEFYudz0FrMNrk7ZzZaTktAXASMMULYkQdy1CT1sLmfy5vTT3GCOgvwCe4tF0H
         17BNyJ+Osulu4tX9vCBwtuUxwhIsHkaX0w/ah6qIBIFvOmCe1CSTseDHh/pVKLUKFP2e
         V8gpxEfgA9YJn17Yi0JQmJuWcMzQV8I9/0nA7o09tayK6jq3Q7j9fRBACrPZZGUDc3KD
         XNSJjqfc+dZ5Ym37jtCtlhVWEjYAIbc4pt2shH6d3c7faS7zwdGxc4XSt9GD12WPOeRZ
         fEzETG7QRpJywOuWoQ/60R09a5JJpPQpMRn581+d+N4H2bnLlmTJj+0SEeY7TC1Tg+Sq
         F/kg==
X-Forwarded-Encrypted: i=1; AHgh+Rqxtl//Th3x5bH7Ic7pcstNMQKKWShMmeD/GDzYA3GHKfeKXPu2en6OFmNj9MqZar+a9utqn0bDuBoIaoaIjqQA@lists.infradead.org
X-Gm-Message-State: AOJu0YwF0SaKh5CdjlP3DTz8RTSLiQCCWFFk78cylUaopZSyoTV8zz1+
	rMWUjyoZOuuJnA7UbeimiQpudcmqQr5EUhcuGIyAE54+PR9zsQR5t1AI
X-Gm-Gg: AR+sD12vfFYA3cy678ou9u4L4zIXmINimUlRoPy+hBGLGjZfi+iAd9Ok3u2rCAQWz4N
	FcpWhZloAsQm97OIpn5wu1NYXaW1iImfP07Q6agqWbZIOhKYGVClLBhik4K/0uZu8cr4t+Y0nwB
	ate6tp23l4AbsMr0c81ax8SUmzH+PgxYV4obLqMBHme4mL23LaTR8XAS9TbLJFESPAzlbiPjjqU
	cgF0cDt9ZEGvPxDpq4zK7NkXuvBjoLVsnkhFRdtc264cOrysXFV+hCp6ZoC4QNU/9F8ImG6wwhJ
	+05IsOkvykRyt6JxQRzhZZhde1VNvI6Wxhs/v1coQzr0sGu/qpa2UOTzIRwWUdDqiLz2GUb9p+r
	Wta2LYH03qBGTspxIv+uYbZvRdI3q9547ZlCgg2YTaGnw1keeVgShin8QaCSQIhgNEU5fXlGkI+
	yBUz16zr+T9oqY5EGuDj8jSjWJ26BLAtJmv8Sfx+xscXWbH1z+z0v+hD3ECjD+m3F40Hj/Pad3e
	N3XE+sNx7lqkF/KNF/2N3OewxYMPl9iI2DjfKjlnhBa3uqhFNdreOJxA1WUzHofQJb3UDVQUmby
	vvZT1sf4aWtoyVUrVGcy+BtlJp9fMgQl+oBuiw==
X-Received: by 2002:a17:90b:5447:b0:37f:f4ae:5f25 with SMTP id 98e67ed59e1d1-3903c634cd0mr20028872a91.20.1786063234266;
        Thu, 06 Aug 2026 17:40:34 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2fdsm2511616a91.12.2026.08.06.17.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:40:33 -0700 (PDT)
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
Subject: [PATCH] ASoC: xilinx: formatter_pcm: fix stream_data leak on open error
Date: Thu,  6 Aug 2026 17:40:31 -0700
Message-ID: <20260807004031.47455-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_174035_567486_4E175DB0 
X-CRM114-Status: GOOD (  14.03  )
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

In xlnx_formatter_pcm_open(), stream_data is allocated and
adata->play_stream or adata->capture_stream is assigned early.  If a
later step, such as snd_pcm_hw_constraint_step() or
snd_pcm_hw_constraint_integer(), fails, the function returns the error
immediately.  ALSA does not call the close callback when open fails, so
stream_data is leaked and the stream pointer is left dangling, pointing
to a substream that ALSA frees.  A later interrupt would then call
snd_pcm_period_elapsed() on the freed substream.

Free stream_data and clear the stream pointer on the error paths.

Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 7eba3a0205f1..4f4c1e650aaf 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -385,7 +385,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	if (err) {
 		dev_err(component->dev,
 			"Unable to set constraint on period bytes\n");
-		return err;
+		goto err;
 	}
 
 	/* Resize the buffer bytes as divisible by 64 */
@@ -395,7 +395,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	if (err) {
 		dev_err(component->dev,
 			"Unable to set constraint on buffer bytes\n");
-		return err;
+		goto err;
 	}
 
 	/* Set periods as integer multiple */
@@ -404,7 +404,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	if (err < 0) {
 		dev_err(component->dev,
 			"Unable to set constraint on periods to be integer\n");
-		return err;
+		goto err;
 	}
 
 	/* enable DMA IOC irq */
@@ -413,6 +413,14 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	writel(val, stream_data->mmio + XLNX_AUD_CTRL);
 
 	return 0;
+
+err:
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		adata->play_stream = NULL;
+	else
+		adata->capture_stream = NULL;
+	kfree(stream_data);
+	return err;
 }
 
 static int xlnx_formatter_pcm_close(struct snd_soc_component *component,
-- 
2.55.0


