Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF42606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 22:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QtTB6Xjo;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FVxwyTOW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ub1wcWejjpZhi+639ya37TwcHArqYpKLVBaE2WfY3MM=; b=QtTB6XjoF5UaxCgIdqe6b26fwF
	q2rBOBwKuLhDNkr1gPOCBeSN5r95IaAneVHjwm8y6Q0WsURPhWtEL4z6knY4vpYMHTrjahaLGxN5s
	mtxPibKd3pjOOb9wYFq4h29cS4Ezobyg/MeV1dobEX6+PQtOYbvsSJmMbkSZFMCFo1h+4HLuWQfZt
	G+phNr6thaeURO8WuAylH9s7mxwiq5mWZ1IFJaYxW8GqYG+hlRc0p1aLTAm+dkyD304ScBeYHtw6S
	wx9j7jKn+p2JU3gLqPIW4AaeQifXZ+d5MksC2V0XQRXtIr32cdaTllxIB59qyihxt2vGPfZ5dnDjT
	SZo5nDyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK11Z-0000000F3hx-2DZj;
	Thu, 22 Oct 2026 22:12:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK11X-0000000F3hZ-3EnH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 22:12:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6CF660211;
	Thu, 22 Oct 2026 22:12:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792707154;
	b=m5wGTcu/BXMoYBFGvwHkoGeRO2XvVWp9aOcgt/Io65aIIuUAQwXrjtpqcpBH5D32guu5
	 ZiPVZqzTdA01XhN0a+WzDJrtspr9maFg9WNLPS1BKwqjC/B6EgDOUbdzaduU902oNxvgu
	 3nvlIy7+J+7rjYPT30I5eI9miYk3lGif5MJBKOEGFetSy1yoo/g0E3cjHir3ZuCIJf6zf
	 AF0BvZW6HHynWONwNq6mhYMQP5kRrZ75HOAg5nTs3iaTlS4h8DRG1X7MOcMvbAoIW89im
	 Zbizyv6T9Y/WMEjPhiIfFdmt1yNqv6Uc6e/DEc6fDc2RG492ot2f8m8ynVe9O16JCaA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792707154;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ub1wcWejjpZhi+639ya37TwcHArqYpKLVBaE2WfY3MM=;
	b=hjnU0RNTvmhOk+Ogy28ohwA7DwuUFptP1uxBz4Xt0OLsMXuT+f5LRWBErFUyehy0p5c6
	 o2fx77vJlkrZ+UcP4QWIBmUy0p4vbk+wHnLchyf4p3QmSk6q/wpUdUBWVcN+aru3Eynh+
	 rsc3gesBrfCvWh6bDOhZR6VhARcDJWllyRYCBvYBVTATfRMIzqWXsuNzzTI8TDiBnDecS
	 +doBZzYjUU1EJ5kf4s8zvVGaNNTnmPYW5wI5v9e6WNpd7TSY2aOgqUukBFrFhe/NCbD9J
	 vuik13FsAZ+MmmEg1vGE29kwFnHK/dW5ZZbpXcCfwewSrN+o/zTpA04E4TOV1YtUGIA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D6B81F01829;
	Thu, 22 Oct 2026 22:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792707154;
	bh=Ub1wcWejjpZhi+639ya37TwcHArqYpKLVBaE2WfY3MM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FVxwyTOWmTH2qTxsVLhmKdG/T2wCfAINPkh3GNgY6U+3WtHjXZfWVkEDPCBhepg60
	 ab/vn9glVV5OXKg0rkcWJf6rfpYTcZlXKA/ub658DrWyhLT+JV2OrUFP9KaHTZQW+s
	 w+eq98xvFVbDnTdnUfW4PY25NHfRsUOXFt9Om5oTYTTLEBrUJ9hZyqUxvwcU9Qqa+t
	 u1pecdhOIORsAnqGoqbb5z3FjeVY6K/oQm7ecEOGB+DU+CTOCfGvNMOdM13LpvDvxi
	 EL93AH2XeBPVQPSoi7LjJFe0NuB6D2zOqXs/y0x3GLcrawPwkN9kHqRlbx1PCrtzMn
	 2v17W4dK+9t9Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 74FAA41FB2;
	Thu, 22 Oct 2026 22:12:33 +0000 (UTC)
From: "Jeff C. Jensen via B4 Relay" <devnull+kernel.nullptr.com@kernel.org>
Date: Thu, 22 Oct 2026 15:11:30 -0700
Subject: [PATCH 1/5] dmaengine: xilinx_dma: Reject transfers that map no
 data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261022-xilinx-dma-work-v1-1-20faea2e7a80@nullptr.com>
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
In-Reply-To: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
To: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Suraj Gupta <suraj.gupta2@amd.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Alex Bereza <alex@bereza.email>, 
 Folker Schwesinger <dev@folker-schwesinger.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Jeff C. Jensen" <kernel@nullptr.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155; i=kernel@nullptr.com;
 s=openpgp-2026; h=from:subject:message-id;
 bh=4HSoHWwpvRObiCk9NoS17klkZW5nP/aozCZjxK9JszY=;
 b=owGbwMvMwCV2439B4wpuQQ7G02pJDFm3ugIqTHk057113Wq+c/as+yY/3Xevzkhfa2C1dcoT0
 wN1vjZHOkpZGMS4GGTFFFmOH5u2M9/Wv66o+n4VzBxWJpAhDFycAjCRE3cZGS4df5qnIF2dcvm4
 vMHG08suzOv9fMFrZVi+6JOj8qb7V7AwMqxm+eHYnPjv4NmIuob0q3JKu8LvCliUH/EoXfXgzrT
 ldUwA
X-Developer-Key: i=kernel@nullptr.com; a=openpgp;
 fpr=C7C696B96F3D4F7E727BDF7AD8FF7081A80B1108
X-Endpoint-Received: by B4 Relay for kernel@nullptr.com/openpgp-2026 with
 auth_id=1265
X-Original-From: "Jeff C. Jensen" <kernel@nullptr.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: kernel@nullptr.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Jeff C. Jensen" <kernel@nullptr.com>

If every entry of a scatterlist or a DMA vector array has zero length,
the preparation loops in xilinx_dma_prep_slave_sg(),
xilinx_dma_prep_peripheral_dma_vec() and xilinx_mcdma_prep_slave_sg()
allocate no segments. Each function then takes list_first_entry() of the
empty segment list anyway, so desc->async_tx.phys, which is later
programmed as the current descriptor, is derived from the list head
rather than from a segment. For DMA_MEM_TO_DEV, the SOP and EOP bits are
also set through pointers that do not point at a segment.

Fail the preparation when no segment was allocated.

Fixes: c0bba3a99f07 ("dmaengine: vdma: Add Support for Xilinx AXI Direct Memory Access Engine")
Fixes: 6ccd692bfb7f ("dmaengine: xilinx_dma: Add Xilinx AXI MCDMA Engine driver support")
Fixes: 38433a6fdfb7 ("dmaengine: xilinx_dma: Support descriptor setup from dma_vecs")
Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Jeff C. Jensen <kernel@nullptr.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index cffe7c6fa640..5ccc9f9d58a3 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -2305,6 +2305,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	head = list_first_entry(&desc->segments, struct xilinx_axidma_tx_segment, node);
 	desc->async_tx.phys = head->phys;
 
@@ -2406,6 +2409,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_slave_sg(
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	segment = list_first_entry(&desc->segments,
 				   struct xilinx_axidma_tx_segment, node);
 	desc->async_tx.phys = segment->phys;
@@ -2613,6 +2619,9 @@ xilinx_mcdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	segment = list_first_entry(&desc->segments,
 				   struct xilinx_aximcdma_tx_segment, node);
 	desc->async_tx.phys = segment->phys;

-- 
2.43.0



