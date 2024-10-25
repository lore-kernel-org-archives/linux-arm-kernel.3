Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4E8D0C5EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2jONHGUQN65Wp/s13oZofhKzQ9O+ThI0+K9VkaZNt+A=; b=rruhQDXBXJRzeq2ug4RNxZeffX
	OfkOeobswZZGmQ0qWhZZ4L/qO/PxgXiVVvmFK/qBq4HHGiKogO9PidGmoudDMDXBlJ0ht4R8jwr4r
	KYyS26XR9CYMf8hpOnU44OR6qIjmTeQsuEgMgviSZWgk0juacqSy91gW2xAo0cimFc9zhHzNRgo/6
	Cl+NKoVVz35+qpasyt04A5Ziimbs3a3kDrOmAtnK/nZRAF8aebJEVs7S0UXi1REoUzu9sBr7YHFox
	1Mi1UoMQ1PleT2ZA0B9/RozFyvWevbdQAykTkgpZJtWIaTchWWpHd0DOpiP32USy/LbV4IvT+yQzu
	Smsp8Log==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GDB-000000035bP-40op;
	Fri, 25 Oct 2024 09:02:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4G9h-000000034Nw-0Kt7;
	Fri, 25 Oct 2024 08:58:50 +0000
X-UUID: 545fc44a92af11ef9048ed6ed365623b-20241025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2jONHGUQN65Wp/s13oZofhKzQ9O+ThI0+K9VkaZNt+A=;
	b=uKZ/SyOT3Mm9rRM83JQ/Iw08q6PU9rhMrxEew2p+XiUtQqWkzv7kjE5TagpjzwiTuQBOBCdPTGIWGDCiODcIjjZ5egMadNpE3bDio0pOFLn4nsD+g58XQiuV+UJtBrVToHQU/DYNot9nRxn1wytfTkd0BpcrZhOpIIPTyw0ebJ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:3bf7653f-342f-4ed7-9734-880022faa6f9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:93051a2e-a7a0-4b06-8464-80be82133975,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 545fc44a92af11ef9048ed6ed365623b-20241025
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <qun-wei.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 910621834; Fri, 25 Oct 2024 01:58:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 25 Oct 2024 16:58:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 25 Oct 2024 16:58:37 +0800
From: Qun-Wei Lin <qun-wei.lin@mediatek.com>
To: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David
 Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew
 Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Roman
 Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Danilo Krummrich <dakr@kernel.org>
CC: <catalin.marinas@arm.com>, <surenb@google.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <bpf@vger.kernel.org>, Casper Li
	<casper.li@mediatek.com>, Chinwen Chang <chinwen.chang@mediatek.com>, Andrew
 Yang <andrew.yang@mediatek.com>, John Hsu <john.hsu@mediatek.com>,
	<wsd_upstream@mediatek.com>, Qun-Wei Lin <qun-wei.lin@mediatek.com>
Subject: [PATCH] mm: krealloc: Fix MTE false alarm in __do_krealloc
Date: Fri, 25 Oct 2024 16:58:11 +0800
Message-ID: <20241025085811.31310-1-qun-wei.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_015849_160053_37F9E9A6 
X-CRM114-Status: GOOD (  14.45  )
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

This patch addresses an issue introduced by commit 1a83a716ec233 ("mm:
krealloc: consider spare memory for __GFP_ZERO") which causes MTE
(Memory Tagging Extension) to falsely report a slab-out-of-bounds error.

The problem occurs when zeroing out spare memory in __do_krealloc. The
original code only considered software-based KASAN and did not account
for MTE. It does not reset the KASAN tag before calling memset, leading
to a mismatch between the pointer tag and the memory tag, resulting
in a false positive.

Example of the error:
==================================================================
swapper/0: BUG: KASAN: slab-out-of-bounds in __memset+0x84/0x188
swapper/0: Write at addr f4ffff8005f0fdf0 by task swapper/0/1
swapper/0: Pointer tag: [f4], memory tag: [fe]
swapper/0:
swapper/0: CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.
swapper/0: Hardware name: MT6991(ENG) (DT)
swapper/0: Call trace:
swapper/0:  dump_backtrace+0xfc/0x17c
swapper/0:  show_stack+0x18/0x28
swapper/0:  dump_stack_lvl+0x40/0xa0
swapper/0:  print_report+0x1b8/0x71c
swapper/0:  kasan_report+0xec/0x14c
swapper/0:  __do_kernel_fault+0x60/0x29c
swapper/0:  do_bad_area+0x30/0xdc
swapper/0:  do_tag_check_fault+0x20/0x34
swapper/0:  do_mem_abort+0x58/0x104
swapper/0:  el1_abort+0x3c/0x5c
swapper/0:  el1h_64_sync_handler+0x80/0xcc
swapper/0:  el1h_64_sync+0x68/0x6c
swapper/0:  __memset+0x84/0x188
swapper/0:  btf_populate_kfunc_set+0x280/0x3d8
swapper/0:  __register_btf_kfunc_id_set+0x43c/0x468
swapper/0:  register_btf_kfunc_id_set+0x48/0x60
swapper/0:  register_nf_nat_bpf+0x1c/0x40
swapper/0:  nf_nat_init+0xc0/0x128
swapper/0:  do_one_initcall+0x184/0x464
swapper/0:  do_initcall_level+0xdc/0x1b0
swapper/0:  do_initcalls+0x70/0xc0
swapper/0:  do_basic_setup+0x1c/0x28
swapper/0:  kernel_init_freeable+0x144/0x1b8
swapper/0:  kernel_init+0x20/0x1a8
swapper/0:  ret_from_fork+0x10/0x20
==================================================================

Fixes: 1a83a716ec233 ("mm: krealloc: consider spare memory for
__GFP_ZERO")
Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
---
 mm/slab_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index 3d26c257ed8b..3445f4500b54 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1209,7 +1209,7 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
 		/* Zero out spare memory. */
 		if (want_init_on_alloc(flags)) {
 			kasan_disable_current();
-			memset((void *)p + new_size, 0, ks - new_size);
+			memset(kasan_reset_tag((void *)p + new_size), 0, ks - new_size);
 			kasan_enable_current();
 		}
 
-- 
2.45.2


