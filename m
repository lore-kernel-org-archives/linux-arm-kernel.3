Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C885C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 05:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46G8DD90VVrhpEQm7Mku51SwaoXM/jFS2E0FifwksX4=; b=UKwDCDry1VJICmeMQofadWfbdD
	o5XDHsmnS/lXRaS+UymOEqK3m69MfdB1xJx1QZozmSbyDV9T0GD/cqKVucVzMHc1XeFNlKwe8pyES
	BqaA6DURpiQhmfVH/bgFaM/LtVVxiO6V1GMcj8dm4gEAKXFnZc4n7IcVWPlvrX/Qncqnww8gEGXJl
	zS/D5HgQUccHsJgZ+Am3Pt6oH3OTbkUs17ph6qsDC1V65RFJE3FrQUm70Cj9wXXqUGDhRtiHHFFyn
	UxDKw3vwlTqoUvruyfTRRCIsYmxkDMr2OThFIMw0hsHUtmgAr+rmDe3fldSDW2ern1HnQzhCsm0Gz
	Mz5K2/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufApR-000000094pV-0tSL;
	Fri, 25 Jul 2025 05:18:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufAmw-000000094i1-3WnD;
	Fri, 25 Jul 2025 05:16:12 +0000
X-UUID: 780cd6ec691611f09eb0dd999d3936bf-20250724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=46G8DD90VVrhpEQm7Mku51SwaoXM/jFS2E0FifwksX4=;
	b=Gff68kFJapmJYc1HJaAaIb2H6p55MIXAlkoUokMjyuvf2WMs1ies4gkkUfrr86bbec0LBCpNpdlSqzBvJbE+kLxlRm0Uo0vUITNoXU/rbePsr9jPGCS9XN74GSYgxPp7nTc6w1YazN7s6sSy99n4ZWZtkyMMWnpvfbGvcnYmWiM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:094aa427-1588-4db7-aaa4-c7e785b1e73a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:cef9280f-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102,TC:nil,Content:0|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 780cd6ec691611f09eb0dd999d3936bf-20250724
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <akash.tyagi@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 613910120; Thu, 24 Jul 2025 22:16:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 25 Jul 2025 13:16:04 +0800
Received: from mtisdccf01.mediatek.inc (10.18.1.155) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 25 Jul 2025 13:16:02 +0800
From: akash.tyagi <akash.tyagi@mediatek.com>
To: <david@redhat.com>
CC: <akash.tyagi@mediatek.com>, <akpm@linux-foundation.org>, <vbabka@suse.cz>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<surenb@google.com>, <mhocko@suse.com>, <jackmanb@google.com>,
	<hannes@cmpxchg.org>, <ziy@nvidia.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
	<chinwen.chang@mediatek.com>
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
Date: Fri, 25 Jul 2025 10:38:10 +0530
Message-ID: <20250725050810.1164957-1-akash.tyagi@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <67a54f31-e568-427a-8fc8-9791fd34e11b@redhat.com>
References: <67a54f31-e568-427a-8fc8-9791fd34e11b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_221610_890816_090BA196 
X-CRM114-Status: UNSURE (   9.95  )
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

Hi David,

Thank you for your feedback.

We encountered this issue in the Android Common Kernel (version 6.12), which uses PCP lists for CMA pages.

page_owner trace-
Page allocated via order 9, mask 0x52dc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_ZERO), pid 1, tgid 1 (swapper/0), ts 1065952310 ns
PFN 0x23d200 type Unmovable Block 4585 type CMA Flags 0x4000000000000040(head|zone=1|kasantag=0x0)
 post_alloc_hook+0x228/0x230
 prep_new_page+0x28/0x148
 get_page_from_freelist+0x19d0/0x1a38
 __alloc_pages_noprof+0x1b0/0x440
 ___kmalloc_large_node+0xb4/0x1ec
 __kmalloc_large_node_noprof+0x2c/0xec
 __kmalloc_node_noprof+0x39c/0x548
 __kvmalloc_node_noprof+0xd8/0x18c
 nf_ct_alloc_hashtable+0x64/0x108
 nf_nat_init+0x3c/0xf8
 do_one_initcall+0x150/0x3c0
 do_initcall_level+0xa4/0x15c
 do_initcalls+0x70/0xc0
 do_basic_setup+0x1c/0x28
 kernel_init_freeable+0xcc/0x130
 kernel_init+0x20/0x1ac
 
This UNMOVABLE page was allocated from CMA, but it could not be migrated - so CMA alloc failed
At first, we fixed this by adding CMA THP pages to the movable THP PCP list.  
This fixed the issue of CMA pages being put in the wrong list, but now any movable allocation can use these CMA pages.

Later, we saw that a movable allocation used a CMA page and was pinned by __filemap_get_folio(). This page was pinned for too long, and eventually, CMA allocation failed

page_owner trace-
Page allocated via order 0, mask 0x140c48(GFP_NOFS|__GFP_COMP|__GFP_HARDWALL|__GFP_MOVABLE), pid 1198, tgid 1194 (ccci_mdinit), ts 17918751965 ns
PFN 0x207233 type Movable Block 4153 type CMA Flags 0x4020000000008224(referenced|lru|workingset|private|zone=1|kasantag=0x0)
 post_alloc_hook+0x23c/0x254
 prep_new_page+0x28/0x148
 get_page_from_freelist+0x19d8/0x1a40
 __alloc_pages_noprof+0x1a8/0x430
 __folio_alloc_noprof+0x14/0x5c
 __filemap_get_folio+0x1bc/0x430
 bdev_getblk+0xd4/0x294
 __read_extent_tree_block+0x6c/0x260
 ext4_find_extent+0x22c/0x3dc
 ext4_ext_map_blocks+0x88/0x173c
 ext4_map_query_blocks+0x54/0xe0
 ext4_map_blocks+0xf8/0x518
 _ext4_get_block+0x70/0x188
 ext4_get_block+0x18/0x24
 ext4_block_write_begin+0x154/0x62c
 ext4_write_begin+0x20c/0x630
Page has been migrated, last migrate reason: compaction
Charged to memcg /


Currently, free_unref_page treats CMA pages as movable. So, some MOVABLE allocations may use these CMA pages and pinned them. Later, when CMA needs these pages, these pages failed to migrate.
free_unref_page()/free_unref_folios
	migratetype = get_pfnblock_migratetype(page, pfn);
	if (unlikely(migratetype >= MIGRATE_PCPTYPES)) {
		migratetype = MIGRATE_MOVABLE;
	}


Best Regards,
Akash Tyagi

