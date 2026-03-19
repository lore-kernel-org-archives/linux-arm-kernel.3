Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDEC109190D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wX6S1CdKc2mUwaozX73tCsBdgQ9rtIDSRhAEJ71WCy8=; b=v66OKGfqkoK1/WJR5dB6CL/4pM
	XZT6WJVO2i/SWTrPvRXkW8z84Talzbkk8Z3PpleopntMWug69dto9lYGRv8/n2zmGARJluAGyTWNQ
	x+HEiW4N6HiGvEoZuaGefVjr4xCGdgqla2k3ct0I289TbH+VY5XyK7zAEjFg/uFIqW2v5NmI+23+P
	cNYXK9+eyd+OScUiAC/Hvjupdj/KzErixicYx08+i9Z45CHLHboGSU3HXMSCk+rckNXDcpcVhdk4H
	BSGmAaI0Glcv08z7IjAGhLfXKrUvEkR9/vYTsyjrDWrGZY0XvBuLTkUrz/lbGWXYby5cdApM0yc6t
	I7HxHl4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJ0-0000000BN4Q-16L9;
	Thu, 19 Mar 2026 18:41:14 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IIw-0000000BN39-3oQ2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:41:12 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7d741f61ee5so1040001a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945670; x=1774550470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wX6S1CdKc2mUwaozX73tCsBdgQ9rtIDSRhAEJ71WCy8=;
        b=W7Q2m7bKpMT1v5QbHFGTJ6D93oBmerHYSyTnWEpZcltOYBDfBM+uB5FJtev6t7H+s3
         Jzcfl8Wi+vvg06/YThk/AxmG/ik0Qfv5RuyivJSnSkcimBuHpCgD9HvqigCRg1z+rdgR
         FIQGs/W8n6KXBg6h5CBU8z4wIoM7MzplXf5dX95HhoPgGQHEbCrTR0HINkzRwfhRWZ2L
         7onJPYFso8Yp/7mhIeci7pu7PJ1Nf8GzLwByOMVg0A5lnnsjB6Ra2vJHPFHpPYFHKol/
         KkIBITZ0aL8jlcO1rj3Sf0Xvo3rLDFP6a7sh2pyiczIMtHM6OPjjrAG8JKip8iRVuyJI
         ECiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945670; x=1774550470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wX6S1CdKc2mUwaozX73tCsBdgQ9rtIDSRhAEJ71WCy8=;
        b=U8STiJboo4K54t7RHR9ujewxsUXYO+SwicubxXeF05FMBE9YJuGVb79XHtSZ3kSOFX
         SO8CyzrjXylGi43fzmyKlrDaV9DEOmAivghPwEhLlB3MbvmDtwYljiI/mHfu3U2sTPYi
         hRo18kr7Wqz4/qis8GMCO8nlfhOlfOu3M0g85gxTSzWnR/dKVc01LYkliypMBz/uL9on
         KwbEOSaft2ZJtgrvDy50mkxPHKX8tjYweMiz5B6sK09WZKmHEOtdmKV1hI0DOBalbHJU
         AyEDkgiGeqXS1WAhXf+f0k8EgoxXM7eODDEvauclBNPmUdRh1xtvtJRAxSQg33pHmU12
         qcwA==
X-Forwarded-Encrypted: i=1; AJvYcCWYCNlB9oygNDDOPZsO6mcfH/OacTvRQZGbujFD0n7lVEFUtzDUkpg53DAjSnyoSaYioeHq+cn7xMyZQtAom/a0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Ny8d/JKEmxhU6aJS8VJ5liPT24aUCy/SED1bhwsat7Ao+L4Q
	zaVH9Mz/Y9FNv+7CM8QEkx3DuHI9poO9YT28XmTlt4Gl5GRNnNPljtmz
X-Gm-Gg: ATEYQzy7WAYUUfzcSCdGLutZoEMZdJsCrhVakYaic0S053UZlSQLAxwq3195yafJXrE
	q2bmzMdHzl4S+C2LQVKyoaiAKqKpva1X4iD1qeShruCneysPgk3IkYfvFR/bYbMiTIp3dm7PAka
	dm6OM8qWGQH/vZssyEEd9BfSKoxbMuqM+tj2yXDLu2GtCWB0yQGSYn8XSnJKQsbjaved0Z+QsjN
	5sTp/606RtVMRq7i8mW21BE4MwvKddQO2imInfZzXj7lELWk5lEa2lDJxHur5XBpaIYp+9zSg9/
	X4rDOXQwKmU1EvKFxuAbsX6tRmI4y+bGzGWj6gMjPLSynFQk1jAWaE7GFnrIK2DASEjp/zoxAyP
	Ckfi6ke3K1lHVnvL9w6/vKVqLBKU+LIqiZprUst/GMpIXsLpgE7z+pNCgqOdmQhXU22jq+oH/Af
	hboM6Kx6o1UIA18F9iMdsutipJ/wCFIWrfSzMWvxdZwII+F3x46mW+1PFZYOMWakCmMwfaEPf+M
	1g3TzO4QQg=
X-Received: by 2002:a05:6830:700f:b0:7c7:6043:dd8f with SMTP id 46e09a7af769-7d7eaedc687mr238381a34.15.1773945669849;
        Thu, 19 Mar 2026 11:41:09 -0700 (PDT)
Received: from celestia.turtle.lan (static-23-234-115-121.cust.tzulo.com. [23.234.115.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7eadcb757sm181486a34.15.2026.03.19.11.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:09 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Serge Semin <fancer.lancer@gmail.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 2/2] net: stmmac: Prevent indefinite RX stall on buffer exhaustion
Date: Thu, 19 Mar 2026 11:40:31 -0700
Message-ID: <20260319184031.8596-3-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260319184031.8596-1-CFSworks@gmail.com>
References: <20260319184031.8596-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_114110_950649_D91427C5 
X-CRM114-Status: GOOD (  17.48  )
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

The stmmac driver handles interrupts in the usual NAPI way: an interrupt
arrives, the NAPI instance is scheduled and interrupts are masked, and
the actual work occurs in the NAPI polling function. Once no further
work remains, interrupts are unmasked and the NAPI instance is put to
sleep to await a future interrupt. In the receive case, the MAC only
sends the interrupt when a DMA operation completes; thus the driver must
make sure a usable RX DMA descriptor exists before expecting a future
interrupt.

The main receive loop in stmmac_rx() exits under one of 3 conditions:
1) It encounters a DMA descriptor with OWN=1, indicating that no further
   pending data exists. The MAC will use this descriptor for the next
   RX DMA operation, so the driver can expect a future interrupt.
2) It exhausts the NAPI budget. In this case, the driver doesn't know
   whether the MAC has any usable DMA descriptors. But when the driver
   consumes its full budget, that signals NAPI to keep polling, so the
   question is moot.
3) It runs out of (non-dirty) descriptors in the RX ring. In this case,
   the MAC will only have a usable descriptor if stmmac_rx_refill()
   succeeds (at least partially).

Currently, stmmac_rx() lacks any check against scenario #3 and
stmmac_rx_refill() failing: it will stop NAPI polling and unmask
interrupts to await an interrupt that will never arrive, stalling the
receive pipeline indefinitely.

Fix this by checking if stmmac_rx_dirty() returns its maximal value,
returning the full budget (which tells NAPI to keep polling) if so.

Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Cc: stable@vger.kernel.org
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f98b070073c0..05d3c548ce28 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5604,6 +5604,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
+	int budget = limit;
 	int xdp_status = 0;
 	int bufsz;
 
@@ -5870,6 +5871,12 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	priv->xstats.rx_dropped += rx_dropped;
 	priv->xstats.rx_errors += rx_errors;
 
+	/* If the RX queue is completely dirty, we can't expect a future
+	 * interrupt; tell NAPI to keep polling.
+	 */
+	if (unlikely(stmmac_rx_dirty(priv, queue) == priv->dma_conf.dma_rx_size - 1))
+		return budget;
+
 	return count;
 }
 
-- 
2.52.0


