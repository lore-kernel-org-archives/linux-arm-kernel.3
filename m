Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361C3D4A603
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 06:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89kM6DqaNI0SVDHAhqFeo0gmvjmHcOVivNaMRoE3IB8=; b=xDBSWdN8Si2p+oAWc+VuOWTHFF
	RuYD5TrZdfgzG2LzT1iqSMREpmVHhWisocZH09MO1ulL706HJcwVHIk9rsA3OUBWurE/uOBlWc6nZ
	sksUzClszVVPTyO/nSBAy+YlwJlyWMQeDCnlRRc4iSHkbnxiFitRd8UhBfX3ffJz4irNvB35+vRyh
	atu1Gl0hMU/9tC/SMGLtAdOa7ydI4W4thuIiP2ieL+uYlG0x3PrPf71rVrkQGUtU96CF/IhLcnEdZ
	PKmHwU6y1r+j3MclLuE1rJ49aElFwpQcAi348moiUzqQBE0DqtR+QriAetQElICAu9OzTrexRnwQH
	VxdidcbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgdHn-0000000Df8P-1kWC;
	Fri, 16 Jan 2026 06:26:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgdHk-0000000Df7M-1kJw;
	Fri, 16 Jan 2026 06:26:17 +0000
X-UUID: 3fc7d058f2a411f09f706fa2197c6ceb-20260115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=89kM6DqaNI0SVDHAhqFeo0gmvjmHcOVivNaMRoE3IB8=;
	b=i5OppwCCpw8PFG1ly/ec7lDbQ9u2hFI36lndZ1hg5wkbMZjJpLAgZ9LKMoyCCMAxCPue5Hxp41X7RH7mh7eDyXtpzB0qOcY+4+3hzU5AB+1ytbbJpY/ZGOUVVRXxR5hPzZZXKIG+JoLLHgz/l14ljMJci+2962MH2ysq3sQiG4g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:39710277-9d49-4516-aaf8-b09c85e2cd58,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:4b8c94e8-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|836|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3fc7d058f2a411f09f706fa2197c6ceb-20260115
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <robin.kuo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1546757166; Thu, 15 Jan 2026 23:26:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 14:26:07 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 14:26:07 +0800
From: <robin.kuo@mediatek.com>
To: <robin.kuo@mediatek.com>, <akpm@linux-foundation.org>, <ryncsn@gmail.com>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi
	<shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He
	<bhe@redhat.com>, Barry Song <baohua@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <casper.li@mediatek.com>,
	<chinwen.chang@mediatek.com>, <Andrew.Yang@mediatek.com>,
	<Qun-wei.Lin@mediatek.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 1/1] mm, swap: Restore swap_space attr aviod krn panic
Date: Fri, 16 Jan 2026 14:25:00 +0800
Message-ID: <20260116062535.306453-2-robin.kuo@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260116062535.306453-1-robin.kuo@mediatek.com>
References: <CAMgjq7Db38sNdsGe121oBFshiJz+vUrKWf5BjB3djAYUr40LLA@mail.gmail.com>
 <20260116062535.306453-1-robin.kuo@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_222616_467885_9544A342 
X-CRM114-Status: GOOD (  11.26  )
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

From: "robin.kuo" <robin.kuo@mediatek.com>

commit 8b47299a411a ("mm, swap: mark swap address space ro and add
context debug check") made the swap address space read-only.
It may lead to kernel panic if arch_prepare_to_swap returns a failure
under heavy memory pressure as follows,

el1_abort+0x40/0x64
el1h_64_sync_handler+0x48/0xcc
el1h_64_sync+0x84/0x88
errseq_set+0x4c/0xb8 (P)
__filemap_set_wb_err+0x20/0xd0
shrink_folio_list+0xc20/0x11cc
evict_folios+0x1520/0x1be4
try_to_shrink_lruvec+0x27c/0x3dc
shrink_one+0x9c/0x228
shrink_node+0xb3c/0xeac
do_try_to_free_pages+0x170/0x4f0
try_to_free_pages+0x334/0x534
__alloc_pages_direct_reclaim+0x90/0x158
__alloc_pages_slowpath+0x334/0x588
__alloc_frozen_pages_noprof+0x224/0x2fc
__folio_alloc_noprof+0x14/0x64
vma_alloc_zeroed_movable_folio+0x34/0x44
do_pte_missing+0xad4/0x1040
handle_mm_fault+0x4a4/0x790
do_page_fault+0x288/0x5f8
do_translation_fault+0x38/0x54
do_mem_abort+0x54/0xa8

Restore swap address space as not ro to avoid the panic.

Signed-off-by: robin.kuo <robin.kuo@mediatek.com>
---
 mm/swap.h       | 2 +-
 mm/swap_state.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/mm/swap.h b/mm/swap.h
index d034c13d8dd2..1bd466da3039 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -198,7 +198,7 @@ int swap_writeout(struct folio *folio, struct swap_iocb **swap_plug);
 void __swap_writepage(struct folio *folio, struct swap_iocb **swap_plug);
 
 /* linux/mm/swap_state.c */
-extern struct address_space swap_space __ro_after_init;
+extern struct address_space swap_space __read_mostly;
 static inline struct address_space *swap_address_space(swp_entry_t entry)
 {
 	return &swap_space;
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 5f97c6ae70a2..44d228982521 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -37,8 +37,7 @@ static const struct address_space_operations swap_aops = {
 #endif
 };
 
-/* Set swap_space as read only as swap cache is handled by swap table */
-struct address_space swap_space __ro_after_init = {
+struct address_space swap_space __read_mostly = {
 	.a_ops = &swap_aops,
 };
 
-- 
2.45.2


