Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8EBE9E30A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 14:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hkv6yEZIu6AjpO4/Olv6t/LeNmIBj39aOisBe+pVOfI=; b=MuyHcsaM5WYkrc/wJw4qlTtNm0
	h6xs/YT5S3Ar3+h4jtBcZw/sMcgrp1lyiZ8hop1m7XG/7HEXsmilGY7C6FtROViYjGOrcnWmUxoLB
	K5E6WJjG7rfnz82GNkCBE6v27umEXEby9YFBsBzDMVR4/okFklu3mqV/e51JfTTjoysLg/KB2cF9D
	tyQxkSre37QTjxKGakckt8VdysYQsJn1qH2LoO5BDp3vrc0UWskE+HfyKh5+TqrIHRebtZ802kDag
	wHqxPwofYyTa002Qa4ttvv2lHuKg9Jgiwe9OTK00xgo6xNV7ciNcRxkplrIilQ2QeqyfO4BTyDFWH
	stkf+JhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqAno-00000000hzM-2tbp;
	Wed, 11 Feb 2026 14:02:48 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqAnm-00000000hyr-2Prn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 14:02:47 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-354b79a9ad5so2498283a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 06:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770818565; x=1771423365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hkv6yEZIu6AjpO4/Olv6t/LeNmIBj39aOisBe+pVOfI=;
        b=gSZkh6HjOLxOTf82X0qK4nfSW33CK2dE9L2aiNbYbihqYofcdkjTOLrnR8kJHPdd8W
         +pMDgBYtsFJ6sq6htdfF+5MMFVr+aCIUoP/djRPuW7jpcxHQW0GwlnC518L725sjvmbz
         43eD5EZW2tDhdSEgzLXK6JFIkQp3q0e6Zpp6pgCkmsrsR1oNCerggpLe1Ps4xlksSnfL
         QvRuRpmcb3ZG4jSnitOGno0TsuE7kNHMjIjQC6FKvwapx7pA2n6SvxCIJM2e6NSVLXXC
         0jFqjBtj/F28LL+n5kjOzmdbxTJpN9PquqgZwmZC3U63/2Cg8WfEGcYdCGblQlRgOnWP
         QStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770818565; x=1771423365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hkv6yEZIu6AjpO4/Olv6t/LeNmIBj39aOisBe+pVOfI=;
        b=AXcB4tmHKlkN+ySIgUwwep8yco4UwyUWZjFpRBjaSz1T7hHiPN25dXMIewvyMhwHmd
         WKo6QuLEwuxxJt9Twc7/3b2K5INYT1vwXBaKzlHV/sNIFjZ2p4sCCHbQsuR5nRhBYTC7
         txyGmlqmi13DnP0nOiMiCaHOhGeWs/SNwvb5Gz3VSfeGMTP5cKljInlCwkgK7jLlj2EN
         FgdSgsXSac/YPYEcQ7etC3hHl2yLr3TelkIaHYSXnSVWnB5XpUlrp8G7uEVGy40HC/6A
         S+/DfJlWUf6ONuyyLLQZkRHPdpMhtZUPMmPEER5PrHw/CbzGom9o2D0tY0jyQIAj3DIw
         kVmw==
X-Forwarded-Encrypted: i=1; AJvYcCVeT9vW/IAvBpcc5j+Wx0rqMGcDvLFjeL84IWmCq/TjjXaniZrH2jN33Yx7zFXS0HL7nJVNdQxuEW1p2e1aRJPe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7gkJghxh04GXCTPWOBhPFrl5abUjPakSZJS4eiOU69pfyyCP4
	/ex9/53qqr23xjdgpa/caIhqR7Ou24dNfqJFQo0qWP8uc9wQhrbRxZtt
X-Gm-Gg: AZuq6aJ5OzNWZDoRARuBt8rvtj0NeYkfcx/UG4Py4d9p79/Zj0Uf3fv0+YqvCZJbENQ
	i9AmNRYDDCB2cmItayCAUWcAAoAKKXf7xSITL3ZbszguBp0H4Nd6V/grvb75KS4gGMIxGjOJl0+
	tHz1pgiFZKU13kNi1PpPtHSlCYvutrXwmBpkr9qJa29OKrKbD3UzT32/ELBz0uwMSJgd/cuc2ie
	cOJghlaC+U2C1ujtWwP6la5hVuFvtxMTKiTzDmAtYV49M1xSm1bOt3KxvFHEOkF8M0mr1Hf0dli
	XwHjkGjoViq9utwuEZtGHfn21TYENiCC4ghlsC6/inz7reSATu+dfa/7FXbdjQq92DmZ/Gt5AAV
	bS5E+a9zkUqXmXRgse3UJyHPZ+oZ4ZNIVMLteb73fZw8N33zZ+bLGKWJ7eL17YSRi5msGFpaq3i
	c/HYH2zBLqDurhg0TgDXG/4W3HSl/x5FI=
X-Received: by 2002:a17:90b:558d:b0:356:1edc:b64 with SMTP id 98e67ed59e1d1-3567af6f668mr2508787a91.8.1770818564538;
        Wed, 11 Feb 2026 06:02:44 -0800 (PST)
Received: from bsp.intra.ifm ([123.252.218.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567af23fb7sm1874714a91.2.2026.02.11.06.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 06:02:43 -0800 (PST)
From: Rahul Navale <rahulnavale04@gmail.com>
To: dmaengine@vger.kernel.org
Cc: vkoul@kernel.org,
	michal.simek@amd.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	thomas.gessler@brueckmann-gmbh.de,
	radhey.shyam.pandey@amd.com,
	Suraj.Gupta2@amd.com,
	marex@denx.de,
	manivannan.sadhasivam@linaro.org,
	harini.katakam@amd.com,
	marex@nabladev.com,
	Rahul Navale <rahul.navale@ifm.com>
Subject: [RFC PATCH] dmaengine: xilinx_dma: device-wide directions cause ASoC cyclic DMA regression
Date: Wed, 11 Feb 2026 19:30:51 +0530
Message-ID: <20260211140051.8177-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_060246_623429_CCDA56DF 
X-CRM114-Status: GOOD (  13.37  )
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

From: Rahul Navale <rahul.navale@ifm.com>

On ZynqMP platforms using AXI DMA for ASoC PCM playback, upstream commit
7e01511443c3 ("dmaengine: xilinx_dma: Set dma_device directions") causes
cyclic playback to fail after the first buffer period.

Background:
The upstream patch adds the following line in xilinx_dma_chan_probe():

    xdev->common.directions |= chan->direction;

Its purpose is to coalesce the directions of all enabled TX/RX channels into
the device-wide dma_device.directions mask so that dma_get_slave_caps()
works correctly. This is required by users such as IIO DMAEngine buffers
that rely on device-wide capability reporting.

Problem on ZynqMP ASoC audio (PCM):
On ZynqMP, Xilinx DMA provides fixed-direction channels:

    MM2S channels -> DMA_MEM_TO_DEV
    S2MM channels -> DMA_DEV_TO_MEM

ASoC dmaengine PCM relies on these fixed directions to select proper DMA
channels for cyclic playback and capture. Aggregating directions device-wide
can cause inconsistent capability reporting depending on channel probe order
or device tree layout.

This leads to the following behavior:
- The first DMA buffer plays correctly.
- Subsequent DMA periods repeat the first period indefinitely, breaking
  cyclic playback.

A temporary local patch that removes:

    xdev->common.directions |= chan->direction;

restores audio playback on ZynqMP platforms.

This RFC patch is a workaround to demonstrate a ZynqMP ASoC cyclic PCM
regression that appears in v6.12.36+ (backport of 7e01511443c3).

The workaround restores PCM playback but may regress users relying on
dma_get_slave_caps() (e.g. IIO DMAEngine buffers). The goal is to start
discussion on the correct upstream fix that supports both ASoC PCM and IIO.

Fixes: 7e01511443c3 ("dmaengine: xilinx_dma: Set dma_device directions")
Signed-off-by: Rahul Navale <rahul.navale@ifm.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index aff046b03ef7..8da86e322c7a 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -2938,8 +2938,6 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
 		return -EINVAL;
 	}
 
-	xdev->common.directions |= chan->direction;
-
 	/* Request the interrupt */
 	chan->irq = of_irq_get(node, chan->tdest);
 	if (chan->irq < 0)
-- 
2.34.1


