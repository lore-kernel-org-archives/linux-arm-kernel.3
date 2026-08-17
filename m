Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE24C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLmqosVfHRUnCpTXG/vmgJdRPIFeEEdEr21ji49UgUg=; b=qRPkLrQqXJTqkEvloYCbf4cd3H
	Sws4dC0TN5AjQbkb/tNmKHvnk6TDfTZe39TkXgyS2DCL0RM7lKnlrAtDccnxHa4SCFB3OaxHx72zb
	apxxwDryZWxkLGMTsd7pAHXiYARA5Hfp5MBSaxUaY2cLAPC4OlgkiHXG59MVmJBghj97UR/jMTjmI
	yM5+qNmlagTjcgqQeO5/M3AkxpoNsSRGnQMO59UI8aN6E4kamMYy+3I5GPfovJJ1wXxwjt1u8sK1O
	Z51hz6Fwd8EotYh2HLcLT34Co3+pBsuRmDwI0EF85fODTBkGbvHdsnrtvmIt/3zIlCXOvs6q/GKgx
	znLTuKng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxqP-00000006FbZ-0FXh;
	Mon, 17 Aug 2026 13:57:41 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxqJ-00000006FZk-2thQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:57:36 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6a09571dd5cso445569a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 06:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786975054; x=1787579854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLmqosVfHRUnCpTXG/vmgJdRPIFeEEdEr21ji49UgUg=;
        b=HT/MIh9xnulRa+PtB2nMTrsGtaE9QeANNLnSRaYITaRu/RssyENQM2xtODEvVKAWeY
         GiHkYTBtwGghn2NCDGR4wr6150LnLXDI25lKc4c5mdyuzgtiuKelxEVR2lRSVt1F12IH
         3/CSp6LkB1VJ2W5wF3mCsutHVqiRnfwjazkTq53E+df3Aiak5F+4eIW7Yj2jiFx7MfRd
         YCFank/a1JuHL/2TWSVvWrxhoLuAIR1i7gJ89LOe0E044nvuLAjEkFXLCeB3kyl58oAO
         HxtjCoWAUh4S29KVfnjN8FJq+r+gt8IAInbmctkzzRTGxGcagq7ilfw03zFaWzzuNalh
         4JnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786975054; x=1787579854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLmqosVfHRUnCpTXG/vmgJdRPIFeEEdEr21ji49UgUg=;
        b=oVOhul03GRHmhqx8CGUsrSgZ+/xuIyxIVwLOySGik/HmF6mjs3ODtISlPXIAo5o4sg
         YhGmyTUJ5A8c8FUkJOvxnFkNUIHyPuYKe8zGPcHqYe7khuk3/tNLL9+RyKIdxMGv3Ccj
         ELEq4gxOjXPKUaYp3pSoixWI/H721UANgrHfls790ktztKuVUvSVLiHjL4hr77EA32t9
         W2A6o0g9gojb/lLyX2Nq9s8CznniQnnqmji1LVzFSvsyQ0AxF3SF7IGWU3iuxFt5L89C
         KjOu3uU3LZ8VZnc/GakC8T4YV2MNZ8jNLkAqDXd9MUM5CRXZOWPPudQeILuJoUTQunwZ
         soxA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0tWxG220jJhfWet/iTVIep7EXDqwTUuzMZBmbnu4lPvolhXpnCvoroDlNG14PZyu5dxzeeVAR1f6Is3h913XA@lists.infradead.org
X-Gm-Message-State: AOJu0YwFgfiqMEFqTRqldPS4jDdyAdtB0dKiNMfRsrlCp0YncACEYrdY
	TgTMnbcqtxJKxIzY1fsjX4EsoBn1CZvo5GcxoOerHQdeFSvq7dAY1jLEaA+1OVIsxwc=
X-Gm-Gg: AR+sD10VNhYIcBHaN6vX5Wcja7WKeVowJtwErb5gXoHUdetLmz0NEJYWei4U6AG2QT0
	RXk8CpSHCFaLLkKugfezbMA6gQCJuqCncWSAZ2OXt9TSr7dXOltX0JAQT3edVrYmP58UORuMXwE
	c4EtrmF6jeNwjcpch2wNnLDLr4hAQ/lcSwVG8Ors+r0p/T9TfgJqbmm1L+Xrihha3fvvcagINqk
	3W46aSZp8uNGborw90Pnr/COPqUgDj1G2MWuccANJR2vdcZqPCZky96VvjRl9gFN3U1MzPpYFGg
	JewfKcthA4NBnp9V4YXbpZAf/qSMpbBwuaur5Ts6luKDitLvgLJtIgW+AlhRHNET4xSF0sMu12c
	aD3uazLNXV2CPDu5ClrdMGKciDbyJCF8HcsKWnyHRUR9SOTMznbfYs0vLF1zhvhDmYoIR3QN+Vc
	8j6t50RTzuseMJcOTniWNNI+hwtmHdAKPJd1gcWqtGKyXVymagPejB8cOtSQCAyuOWNVG9CEcny
	9s7RLMCvy0ekjZ1YNYZ9/VoQIR/F8sAfRWybShVaSeti8lXgg0h31yblMg=
X-Received: by 2002:a05:6402:234b:b0:6a3:68c2:9a9e with SMTP id 4fb4d7f45d1cf-6a38a845a42mr7135042a12.0.1786975054047;
        Mon, 17 Aug 2026 06:57:34 -0700 (PDT)
Received: from Mac.localdomain (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85319b1sm810238a12.13.2026.08.17.06.57.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Aug 2026 06:57:33 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dmaengine: sun6i: fix non-atomic read of DMA position registers
Date: Mon, 17 Aug 2026 15:51:22 +0200
Message-ID: <20260817135723.12807-2-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
References: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_065735_765034_76EF9C43 
X-CRM114-Status: GOOD (  14.73  )
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


