Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26582C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 02:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BiR6jPxkOnLAagXEhEW/SSBXilTT30QIgH9a11uZjl0=; b=BofsECc5OfubFQ+rVfqHZxFDF7
	V7Uy+1K5BJQhQ0efUkbL2bymBsCPtNKocjSUbeVTzh4N/IPX5QubThVxDu6jjX9jL05kZrnIw6GVa
	aiW39M5G0/cyKLBm+KpPvf+xbcr5BKSEg13hpLEl50IOVEVCvelXGNzQV9xYHbdic6sWcUhGRixxR
	2XpLhX7LDSsKM6yhiqOj2C2JoTBlspiqocybhMpNhiT7gE07kc3pDzGfpYNL9je93B9+lk3X0GcgJ
	Vk0joy1vZgyD+Q/SxaCrilFBXAd199jpwjxtX4SbHVt1VX/R3/mrzNS6DktVtjcRkj1mIzO/f1fgp
	fbqe0urw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgwoS-0000000DttT-1Nng;
	Sun, 09 Feb 2025 02:12:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgwn3-0000000DtjZ-26d7;
	Sun, 09 Feb 2025 02:11:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E155A418EA;
	Sun,  9 Feb 2025 02:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2782CC4CED6;
	Sun,  9 Feb 2025 02:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739067079;
	bh=qFK7B8RPzAwL/YK1uWbMTQGDX7kc0N5pqqW9E/GIQFM=;
	h=From:To:Cc:Subject:Date:From;
	b=UfGVUaSbzy61F1Nfo0EybrDZkz2Aa+sbXQksZSSK/Ab3V7vnvtc3Mh91xGX06xcuD
	 wRl7wyRGBI0clcSVSxJdl7s1TZv2hWqSkVdZPFBFFKuyPvqN9pKxnU9S4Zdkrr4xJ7
	 MJytwX87tmJ2Uxwv0s2v5N1pcI1nu3zVRAJ0HAQ87S7MUajMx0xhGugouoW/uB+DAc
	 pWsDBzhzNYcAmN6DiqPowJYtmmZefuwqjr2ilOhryac4Zn2grh61fiiE4fcsSychc5
	 3Erj4lREgtElqqlxg9svZMEHYFdSRPxZejV5WHC3VFfM6ZuntKbyyZZ8pY5eQyk5xQ
	 CLk9Bo4hZPWwQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] mailbox: mtk-cmdq: remove cl in struct cmdq_pkt
Date: Sun,  9 Feb 2025 02:11:02 +0000
Message-Id: <20250209021102.5253-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_181121_606871_6BE27499 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

Every client driver has the struct cmdq_client information, so
it's not necessary to store it in struct cmdq_pkt. cl is used to
store struct cmdq_client information and now no client driver use
it, so remove it.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 include/linux/mailbox/mtk-cmdq-mailbox.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index a8f0070c7aa9..4c1a91b07de3 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -75,7 +75,6 @@ struct cmdq_pkt {
 	dma_addr_t		pa_base;
 	size_t			cmd_buf_size; /* command occupied size */
 	size_t			buf_size; /* real buffer size */
-	void			*cl;
 };
 
 u8 cmdq_get_shift_pa(struct mbox_chan *chan);
-- 
2.34.1


