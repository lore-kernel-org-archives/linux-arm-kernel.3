Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58702C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YukWWHI9wYIN19FTJID+eUyg7sERpWkqr51k3rjwMM=; b=U2VrwyIIdEw5qJ4xP5zfEAg4AO
	9m4Q9plT+mfgDul3s1PM4w48bV2qtkBxUqeHoZh2ckhYYZjhboNMqMxKMh7lCm7KYm/H4kOIJUSda
	cD0hQafrTG0VGervisNhXIZNcrJYFCx2Keg+YJ/m/Jeag+JPq4qqPfXY8XNFvI7oRR/aUA94I7LYK
	Y+tYtehSr+0sYvF+IgEGksmq/4FulLZMiLtcXd8uOvJYw0zdP3X29FdB9wTM1hHhA/phOqx0VNIl8
	QoX2LLeNGmTSiQBEJDT+yFurNsDA+tZ/MeOgt3RgHnZbzdfwpCQYGIXTiypMWcqqpoI3TKbXXPnpo
	yeDzLfsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuryk-00000002ikn-0OlU;
	Fri, 14 Aug 2026 13:29:46 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuryg-00000002ijp-2j1a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 13:29:44 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6a18ef236ecso192400a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786714181; x=1787318981; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7YukWWHI9wYIN19FTJID+eUyg7sERpWkqr51k3rjwMM=;
        b=L7g6sb57T+hK0Y3PbXNskMkMxOx5jINalFz0UvotxwEMS6+w+s+Y+61pfWQRP5kVfc
         HZjOKVTRtVIJ1eEt1A1ho/Xo2asMRKkPnj3kTeNWmP9JvhpN8paSif25hNFymafhbtXo
         fWge8QIBBjRmwx20PxPtNxnuBiDkBAv+eBAkOo2D4sY9b35m/ltZioBdycK93NvXVWYK
         Liy6FWvJGreUQjSToekk1A4vtaUemK8CLy7XMtqDTXN1MkwXMT12p9Y32Zo0xSgvFSZR
         caWLi7719Sk0RK19LxYCUcbmImdeaUxHs4J4vfO/iJyJUtj7eV/E4cJv6JmOrZ9THANP
         /edA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714181; x=1787318981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YukWWHI9wYIN19FTJID+eUyg7sERpWkqr51k3rjwMM=;
        b=Yb5xAKjNwVriiCOPc9ADRNb5tmfJE+tjiBI+lgum2kMbYCv73k92rWQCBoFIYzsA7m
         uifgDzYF1YNIE+qHX74CD9Do5m0JW2fHLW7Gmosp/1Av627KQh5kRPhVHvX3Sm/Fypg8
         OpXlXI//hKX52C7UUtcGooArWsBp5Vz5Hj38vTxXwLS7XReVDfezzfRM3X1n/aIpwraI
         zTTxOrqGNHrUy51m5JfrQ62CsNWmxwelR1HOnb7CETdYC5Z5/S1iBvVY11yHuTK1HPhG
         26q8pmUszB1G1AQhnhyRJnwXglDDa0CB89I2IjXpPIZfL1pTBtP/B1GsAS8/q3MnXZQi
         i5tQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBehmTT/6W4gqzdswU7Ke+JirvGkBtlZsQmdTlZHcMSWjYDgAunRj5YL7GTaafuKp2ucIg+Bre4ApUh7YcHZ4F@lists.infradead.org
X-Gm-Message-State: AOJu0YyEg8LeMiYBOS7kSSegrudPZvumU1YaKMNbp0ADEynSjHXs4PW/
	Kc9YLRXiCK7YZ6JGtkxYKp/pJqBzt19Qnq++ubyjM2y3p3wl6pAH8CDKB/vGaa3U54M=
X-Gm-Gg: AR+sD12isIsNRBfyp21VsAYfh1PE6230A8KM3y3MMzkg0xiRUbhKQ1tHVDEuLAzubvm
	2NgFdD+zohZmkyZ6Vm7EFbiJPO/EuC9KCJ2M1LanOgIC4TMu9hZzp/K8Qa8A1shyqNWkQ0qVrQg
	zMVhNlhntXdXMtct6S6IQAeRbZr1ufH9xHvsVrQtbhPaAfaF1/Juj9uqPdobASoiFcQuu3x3e88
	Qcne39ku/3tmaaP4G0IalwPhvZ3N++QgplYmHTyB+kkqMTGvEiS05tY6UQF2Qtu4l+nHfKzTmig
	QJxW7vJ4FyyYZep8rvh9EwWcdaH8OxSmlmaeyk3e2O/7TzWYbuAEIem6V/yP+w/2kG9T49iucSg
	E17p/1l7IPwYyAVkneGYMdUaT5Nc6t5c6HNlEAb52PqZgZzXgZyRHj6wr7rs/qm4l5G/c9isZ3d
	vzEHDyRxq6eOJjF7VFtzH+C2B3TDQBqVGjunte4GqCIM2T4gX09c7Tmi/dKQUju0QDknqpITEPg
	Z76hnVUTqHHXW0OFxFgmkjSq/1uxtq6aMDslKe2vbt5Vw4UqnTObmPV2w==
X-Received: by 2002:a05:6402:1cc4:b0:6a1:d68:338a with SMTP id 4fb4d7f45d1cf-6a38a83ce95mr1450030a12.0.1786714180850;
        Fri, 14 Aug 2026 06:29:40 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38c9d5eb2sm841941a12.5.2026.08.14.06.29.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 06:29:40 -0700 (PDT)
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
Subject: [PATCH 1/2] dmaengine: sun6i: fix non-atomic read of DMA position registers
Date: Fri, 14 Aug 2026 15:28:29 +0200
Message-ID: <20260814132906.70322-2-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
References: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_062943_201377_47A2FF68 
X-CRM114-Status: GOOD (  20.07  )
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


