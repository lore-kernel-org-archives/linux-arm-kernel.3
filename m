Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03346C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 14:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YukWWHI9wYIN19FTJID+eUyg7sERpWkqr51k3rjwMM=; b=onvLJovHJb6+XO9oRRB3KeUEcM
	sHgcjCNNMBlemh5D/IprT4j87sqyahZouzX0y1kL9c4eNzr6dgF6qq/SlgrFJ3j1qzWhaL5Lx2ntR
	F30gcFgv9XB/PAIxBjWZWU8223yAaIAvktJj3fZ0Lvv0j2yXQr6ThKSfcgCFdyeajBhG0WJgmHoaU
	Sv+TezGhccxlcjnznPxxjzOgZHnXb4I3f2diYdExtHcmL1QltRDpAD3U8Vp8ac1JxlcL56WQPkN05
	4cFpr9EepLT7vnFjVOqbshxv74p9vrqMGjYophg6DECIbak/uoSAErPliz6h1EX3TxJGCDHtpSofa
	NCr54/5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wussk-00000002n5s-0Qa5;
	Fri, 14 Aug 2026 14:27:38 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wussh-00000002n51-2xlV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 14:27:36 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6a1f56768baso164980a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786717654; x=1787322454; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7YukWWHI9wYIN19FTJID+eUyg7sERpWkqr51k3rjwMM=;
        b=rteok71neNK5OGRLf45+Mgdgt7u8h+hVwWWjXGYaXPO31+5WTIaWWg1d96o2kSJ2Yl
         JixC/bNe1GnBTValLjMRlQxNB7H6uryftVWSlZDypWHFX/nf6XmU2/32Jrt6bnQFwbc2
         g/L7N6XJWmcwFmIKwp5GOLs7TDOMETif5uMPoAFPAD/cOlnqMPpoc76B8r3JtlrFP2Gq
         sFrFiCWlI7DEl+4/G6+Wntq/bN1Ux5uG0rySH2PIgW9LQoXW7oZ0Dz0L/cdtY//1wfWr
         lppWVIopyU683+RpEvdX00FjGzFb3IuoovqwW8GAkFeWkGgXkwnP4ALbSmFdEcT6GGMN
         NMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717654; x=1787322454;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YukWWHI9wYIN19FTJID+eUyg7sERpWkqr51k3rjwMM=;
        b=L5UdERyHP9P+M0wjCd3yFUNRuwEwcMXAe5nshMg5sjrb1G16L1Ut+/oUjiQYqXu2/o
         D5z5lN0U5B/IejM30AdWo1J4NVabplOkdxS7wR9uLalYkkU8DoGKRLmn1yfbusm5TBn6
         fpccVWYdIafEO9TbshpTGhmEfZydalhSJ8tqK/+h3CAxWwq5pP4yKZ6JVX3jJZOHlYqN
         2LnR+oRXRhwhPQ4ddZXHGncdX7iBvd3isJbssYJ+ttB11cuNVkFvKpH+5VgAAY7gvQ7c
         KXYRzPtukKFZHqkFUi02An9fK3auUoGFnPny99uiOeIa0bUtRsJnPq7QHvaq+OPXV/Zr
         oHuA==
X-Forwarded-Encrypted: i=1; AHgh+RopPAzxG3NwNi4K52kf45HD4o64GjkIRipprYLGwivi31KqMkWx1X18upIwtRemnzwHhCxmYlX2AwNFdfu/a9s6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6mV3bY10HJz9ZQA2yEnyO5ut3q3r3sNFysJh/vpr4gMfZWInQ
	vB1HhgasoR6ib5XcVAZ/aoliGzuXuJzMTN6ZuOaLXYol+pu9p2o/Y/yyCyxazQkJMAk=
X-Gm-Gg: AR+sD11HJfGOsXhTcq285yMtPcjPtXAkb7l77mA7bhor4diRqoq/WHBR0Se+VB1V8sI
	yrvoAyJ7A8tOrt/wvlQ/qW0B4BQlzkiiDOfSIddjRcJ/RyBQzbW1AWvbwE1GzUd1VyqiBxqYGAc
	GgVqK+N4+7jGuBUOp3XRW89lgxpEkV8c/L8ovH2fqN7amCa1utInKauLmsEwGmSaL27bKbRhRNm
	1WevMlv+W/Y3hf6kQOLpCpyWh6ERLJyGwDJSDf8nhKAOT+PvZ6YPPqkI+C6QtgNKHPnjjyhPxih
	hxXpLixtprD7uH67iPliKUVumhWo2KHJsKqPZAUNUrBbMGCBfrebwDTn+XPQoqIzALmAB5RJaD2
	ntY7aMPDXfxiPxiuWPOysYOwkpXFSVXxJh0XvJTuh8qkld4G/DO8zpiQryhx3qJvL2gxoA55wJz
	yEMMNGJz1okfVS0VrHli8AtBWTY/XqVngmy8Tjz0ziE3BuKA58qF17S0owfaGOCLJ3kt4PmiOv5
	w3QmMRF98Lab9z2EARGQ4eC9VWVlgDDMacPAhMK9REvF+3fLLAbKWBCGw==
X-Received: by 2002:a05:6402:548d:b0:6a0:f1d5:deb8 with SMTP id 4fb4d7f45d1cf-6a38a83c619mr1585118a12.0.1786717653700;
        Fri, 14 Aug 2026 07:27:33 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234c45ffsm106308866b.19.2026.08.14.07.27.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 07:27:33 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] dmaengine: sun6i: fix non-atomic read of DMA position registers
Date: Fri, 14 Aug 2026 16:21:10 +0200
Message-ID: <20260814142708.79120-2-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
References: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_072735_771310_0AF710C9 
X-CRM114-Status: GOOD (  20.41  )
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

sun6i_get_chan_size() reads DMA_CHAN_LLI_ADDR and DMA_CHAN_CUR_CNT in two
separate readl() calls with no synchronisation between them:

    pos   = readl(pchan->base + DMA_CHAN_LLI_ADDR);
    bytes = readl(pchan->base + DMA_CHAN_CUR_CNT);

DMA_CHAN_LLI_ADDR holds the physical address of the *next* descriptor the
engine will load once the current one completes. DMA_CHAN_CUR_CNT holds the
remaining byte count for the *current* descriptor. If the DMA engine
advances to the next LLI entry between the two reads, pos becomes stale: it
still points to what was the next descriptor at the time of the first read,
but that descriptor is now the current one and CUR_CNT reflects its initial
(full) byte count. The subsequent virtual-chain walk starts one entry too
early and accumulates an extra full period's worth of bytes into the
residue estimate.

For ALSA cyclic buffers the over-counted residue can reach the full buffer
size, causing the computed playback position to appear to jump backward to
near zero. The ALSA PCM core treats such a backward discontinuity in hw_ptr
as evidence that the buffer has underrun and declares an xrun.

On the Barix IPAM400 (Allwinner H3, kernel 6.12) this manifests as audible
glitches accompanied by spurious xrun log entries, confirmed by two
independent observations:

First, the ALSA buffer in the affected configuration is 2 seconds deep with
a 500 ms refill period (the interval at which the player software wakes up
to top up the buffer). For a real underrun to occur the player would have
to stall for the full 2 seconds without writing any audio — effectively
impossible under normal scheduling conditions. Yet xruns are observed
regularly.

Second, the underrun duration reported by the kernel at xrun time is
~30 µs, roughly one audio sample at 44100 Hz. A genuine drain of a 2
second buffer cannot resolve in 30 µs; only a phantom position jump
caused by a register read race can produce such a number.

Observed on a 44100 Hz stereo S16_LE stream:

  $ cat /proc/asound/Codec/pcm0p/sub0/status
  state: XRUN
  delay: 0
  avail: 88200
  avail_max: 22514

The avail_max of 22514 frames (511 ms) matches exactly one ALSA period —
the amount added by starting the LLI chain walk one entry too early.

The race window itself is narrow. Each DMA descriptor covers approximately
88 samples (~2 ms at 44100 Hz), so the engine advances to a new descriptor
roughly every 2 ms. The two readl() calls must straddle that exact boundary
for the corruption to occur, which explains why the bug is intermittent.

The bug is further confirmed by the xrun_debug bit 2 toggle (jiffies
position validation). With it enabled xruns cease immediately and do not
return; clearing it causes xruns to reappear within minutes. This on/off
reproducibility isolates the fault to the hw_ptr position reporting path;
the DMA engine itself is functioning correctly, as evidenced by hw_ptr
advancing at a steady 44100 frames/sec between events:

  $ echo 4 > /proc/asound/Codec/pcm0p/xrun_debug  # xruns stop
  $ echo 0 > /proc/asound/Codec/pcm0p/xrun_debug  # xruns return

Fix this by re-reading DMA_CHAN_LLI_ADDR after DMA_CHAN_CUR_CNT and
retrying if the value changed. This double-read pattern guarantees that
both registers were sampled during the same descriptor interval. The cost
is at most one extra readl() pair per call in the racy case, which occurs
only at descriptor boundaries (~every 2 ms) and is negligible.

Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Christian Lugnberg <christian.lugnberg@soundtrack.io>
---
 drivers/dma/sun6i-dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f47a326dd7ff..04fe1f5042e9 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -354,8 +354,10 @@ static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 	size_t bytes;
 	dma_addr_t pos;
 
-	pos = readl(pchan->base + DMA_CHAN_LLI_ADDR);
-	bytes = readl(pchan->base + DMA_CHAN_CUR_CNT);
+	do {
+		pos = readl(pchan->base + DMA_CHAN_LLI_ADDR);
+		bytes = readl(pchan->base + DMA_CHAN_CUR_CNT);
+	} while (pos != readl(pchan->base + DMA_CHAN_LLI_ADDR));
 
 	if (pos == LLI_LAST_ITEM)
 		return bytes;
-- 
2.54.0 (Apple Git-156)


