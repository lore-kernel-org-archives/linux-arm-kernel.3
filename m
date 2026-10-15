Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C84CC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+LoAM7/O56qtCbczKVBsmCZ8BcqH8pl/3PC+hZvCjxc=; b=FbDupIkQJwVrtim/tFa4GL9g3k
	v0enk9Rr6XDpzGiMh6lxr5KEobqT+r8BtGoJjau85fRqzTqRhTelIQOF4LSNN4UncUUqw4zpMILst
	nWISF5EasAYQ0D2Zco2QmdAqU+c0YN5g9tND1X1y8obSkpSHzTedzLVIhQLp5DsIhfM0x4nXCQlo6
	0r4Hl4b1Frfo3x9hiT5vOgSenNg1n7CjV5FqdeIoGTcOqZIeEw2YYkMEZkwRl6yWlGYbhHDtkOvDn
	kdxuE8oE7bzeRY0qlvC5sSdsIQSjpX3/UDYziNMBQT33ICeax3fq8AqjiD3tviA8USqsv2T5WLpP4
	4KN+FLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHH7w-0000000HBcG-3g4T;
	Thu, 15 Oct 2026 08:47:52 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHH7u-0000000HBbc-1Nvp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 08:47:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a020e65269so32536285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792054068; x=1792658868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+LoAM7/O56qtCbczKVBsmCZ8BcqH8pl/3PC+hZvCjxc=;
        b=SqNekxGOOrWSH6Ysl6sZkIB6EoJkWZoIV/MzEn6sORuNND5lCAMRb9keuOzeVUtkax
         sIQx1Y+kT36GrQw+1zZSE+RJtGrkrQTVlBx3hf5KoKoeyo7JN5qTg4mTHponnsqSWONK
         AiZuCVcv/b9QeyLCITpQ7Jbl/+/qWbv/qYkwylFReW4zcvFJzZlvnP1DHwbh5l01ofcP
         vZRWe21ZyXvbddqY3kxB7yMFAOETGufD+25zBrEdYs3l5F/A9BqF1cbUjZf7U0tuPT4s
         iPUT03gglsFlOOxcXGuDWBQYHXFFl+hhFA75lthvGA/UgUlkNeXZ+o0w8lLNmVl9xdGq
         kWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054068; x=1792658868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LoAM7/O56qtCbczKVBsmCZ8BcqH8pl/3PC+hZvCjxc=;
        b=Br8smzuciNJ9fxCaLQXRiXq/R2ONCyTc1lonsVnUIJIdz9Qu2qlQWPuhUsw/cPH9vM
         weNCUWzlT4UMWqf1MHhg6LPLbjJzmMAwhKEp6CM62okWgp8sEGLaQYL++ohB0jVQ9N2j
         AuroGmMAKXJZZ5ADtlbArCMp87Yz4EvGNA6HGbtPAaN533pUZz584kgy+p2zt0SSc6na
         pNx+lTbBJtBsRQ8xgcI5hhWwgW/+N09BZZDu2HMMLR4B2Vpze1foT7papNN5BJF0DRT9
         54R7g3tdpny04RZLFH4Z7Gg6U+pSK9XIUAwEy08s5UimRFOO8gb5/0e5E156Z7mp0TSH
         e1gw==
X-Forwarded-Encrypted: i=1; AKwUvBykha9KS23cTEWaH+orcbo9xnjzLHPw/vkeFRRcRl1hkYyx3sa8O9bW/3KF7m9ICm6mFIzhOPN3bjTfw7naGCXD@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2rnfer0cexT9lXKdZgjOBWz956hrWiEBakNu0etHzD6aTu6sD
	5N1Jzz6Cr/1pinar5xZB4misQPs2k8zJgYa+HjTO3vvVe3fnXhACZi+s
X-Gm-Gg: AYBFou3vaqZHoKEKNFCpb0zwUoTuLx2J5Ep8lri51yYjKnimx+a64XBEqLGin1UwhWK
	lf3E9QVtFkSEvnp8HmzzsFi154unzecmxGPMZzUtTuKPU2M8AB0wBfgskK2wn/5+QP9maJtUQWg
	b2j/CBx+hqI3Z2JhPIMrnGO5l5Jg5myxN5c0/VbnwoCSEQET3ZfN+8pThq8OWjWpDOD0vrkvhDA
	D2xJ+lQirbKiplPwTBeuTKJpm2JP2jMsuMfLeUV65GTE+kawk/ODp8w18SK1ctmAODMATyFHl9D
	s0+u+SxUDPz0o2OT+o+AW/JkQUM7Reu2s7jmSSL1salTVlZ/tdG2ZAPa7WdyjNUYJ3Zog7FQ29W
	4F7ThICnWaZESBVeLetU7WNGCBZNyGTR7eue3taK1tAcd34ZJSYPHlNLPQk6bMRf0P29UhOdlUN
	LVU1IpSWgAmWeGGyIMzFCJ54SmiklxqMYhd82Y+6mtMiYu0EjLlFxnFz3P8KpylOJgFpWxvj5lh
	WjLzG+GoOUbMikRuYWEZvSFZQpbptDK7unIkgSJxzkkyIn5ii5gkYU8m6aOUGy/Y5MiHHhX
X-Received: by 2002:a05:600c:4e12:b0:4a1:7f8e:6e5d with SMTP id 5b1f17b1804b1-4a18e4a393amr399094215e9.6.1792054067874;
        Thu, 15 Oct 2026 01:47:47 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm76383725e9.10.2026.10.15.01.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:47:47 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	andre.przywara@arm.com,
	robert.hancock@calian.com,
	horms@kernel.org,
	joe@dama.to,
	suraj.gupta2@amd.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next] net: axienet: release every RX buffer in axienet_dma_bd_release()
Date: Thu, 15 Oct 2026 11:47:43 +0300
Message-ID: <20261015084743.1798326-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_014750_390833_33FBD699 
X-CRM114-Status: GOOD (  16.25  )
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

The RX walk in axienet_dma_bd_release() stops at the first descriptor
without an skb, assuming that such a slot and all after it were never
filled.  That holds on the axienet_dma_bd_init() error path, but not once
the ring has been running: when axienet_rx_poll() fails to allocate or
map a replacement buffer it leaves the slot it emptied with a NULL skb,
in the middle of a populated ring, until a later poll refills it.
Closing the interface before then leaks the skb and the streaming DMA
mapping of every descriptor after that slot, which can be most of the
ring, and is most likely under memory pressure.

The walk also frees each skb before unmapping it.  With swiotlb, the
DMA_FROM_DEVICE unmap copies the bounce buffer back into the skb data
that was just freed, and on non-coherent platforms it invalidates cache
lines that may already belong to a new owner.

Skip empty slots instead of stopping at the first one.  An emptied slot
still has a non-zero cntrl but its buffer is already unmapped, so the
skip has to cover the unmap too, which it does by coming before it.
Then unmap before freeing, as axienet_rx_poll() does.

This was reported by the Sashiko AI review bot.

Tested on the AXI Ethernet MAC of an ADVA TimeCard X2 (PCIe card, with
the built-in AXI DMA): traffic passes after each of ten down/up cycles,
each running axienet_dma_bd_release(), so the unmap-then-free order is
exercised on every buffer.  A failed RX refill was not reproduced, so
the skip over an empty slot was not exercised.

Fixes: f26667a373f3 ("net: axienet: Fix DMA descriptor cleanup path")
Fixes: 7a7d340ba4d9 ("net: axienet: fix RX ring refill allocation failure handling")
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 919e644d9158..a8b8c0efa21f 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -247,13 +247,13 @@ static void axienet_dma_bd_release(struct net_device *ndev)
 	for (i = 0; i < lp->rx_bd_num; i++) {
 		dma_addr_t phys;
 
-		/* A NULL skb means this descriptor has not been initialised
-		 * at all.
+		/* A NULL skb means the descriptor holds no buffer: it was
+		 * never filled, or axienet_rx_poll() took its skb and could
+		 * not refill it, having already unmapped the old buffer.
+		 * Such slots can sit anywhere in a ring that has been running.
 		 */
 		if (!lp->rx_bd_v[i].skb)
-			break;
-
-		dev_kfree_skb(lp->rx_bd_v[i].skb);
+			continue;
 
 		/* For each descriptor, we programmed cntrl with the (non-zero)
 		 * descriptor size, after it had been successfully allocated.
@@ -264,6 +264,8 @@ static void axienet_dma_bd_release(struct net_device *ndev)
 			dma_unmap_single(lp->dev, phys,
 					 lp->max_frm_size, DMA_FROM_DEVICE);
 		}
+
+		dev_kfree_skb(lp->rx_bd_v[i].skb);
 	}
 
 	dma_free_coherent(lp->dev,
-- 
2.47.0


