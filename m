Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF73C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y+k8Kj3BOFWEfZ5M4WOVl8vomqLYm7xgUqE++4WvFgA=; b=sua0VosQidhhf81kybtDDYQrfn
	AP72Ed/K8lXY3Ls0tur4h0bYdctC0kDZKTKLHqtdT8N1fZD/+rVnz3qmXV77ZBAH2DboTczfcuSyB
	WIyXXOxUU3QeDzaIQfZkJzTI983Cl5qvwXwx8dL9EcYnc6OFJgYssw+BakztDQ1GVFXeqAv8hoQmH
	n8HK904CszGbxrQ4OTuJk6rdpPIVPnLC+LMHz/L4Rh67xKhGvP1hfBcEpi1v2CKEsRp7AlFd/NMOv
	8Ws8jiDp2yC+uhS5Fx4XCVYSn74AhwqtyLW3UZBrInP7/bLUtIc/lbmVaUlE/L7YGI0YF0leStYaC
	cXHmbZ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA36T-0000000CCuX-3Jvt;
	Wed, 30 Apr 2025 08:47:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA31n-0000000CBz5-1P9f;
	Wed, 30 Apr 2025 08:42:53 +0000
X-UUID: f6da44a4259c11f08d385d50fb11b32d-20250430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=y+k8Kj3BOFWEfZ5M4WOVl8vomqLYm7xgUqE++4WvFgA=;
	b=tg6FzKbrJyDA5YGQM+2F5reLLWllCgXVqQAtV7go2rrFGJ935KsBa5I835xe7C3EjX1cAhpNQL5/miuVXLkhuRPLLk/5lw9A9mLhy7O3tU+6Qq8Jz4NLfEr6xFU4eXzQbTpNqHDypUcW2XeP/2A2GG3GNl/H9NrP0exiotjgXuA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:87890563-fd0d-4042-a3b2-d1c5742efe1f,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:a8829e2b-be47-4281-8f30-e6479b5e1210,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: f6da44a4259c11f08d385d50fb11b32d-20250430
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <qun-wei.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 821145875; Wed, 30 Apr 2025 01:27:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 30 Apr 2025 16:27:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 30 Apr 2025 16:27:30 +0800
From: Qun-Wei Lin <qun-wei.lin@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
	<rppt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Nhat
 Pham <nphamcs@gmail.com>, Sergey Senozhatsky <senozhatsky@chromium.org>,
	Minchan Kim <minchan@kernel.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Casper Li <casper.li@mediatek.com>, Chinwen Chang
	<chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, James
 Hsu <james.hsu@mediatek.com>, Qun-Wei Lin <qun-wei.lin@mediatek.com>, Barry
 Song <21cnbao@gmail.com>
Subject: [PATCH] mm: Add Kcompressd for accelerated memory compression
Date: Wed, 30 Apr 2025 16:26:41 +0800
Message-ID: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_014251_371075_EF9755D8 
X-CRM114-Status: GOOD (  23.40  )
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

This patch series introduces a new mechanism called kcompressd to
improve the efficiency of memory reclaiming in the operating system.

Problem:
  In the current system, the kswapd thread is responsible for both scanning
  the LRU pages and handling memory compression tasks (such as those
  involving ZSWAP/ZRAM, if enabled). This combined responsibility can lead
  to significant performance bottlenecks, especially under high memory
  pressure. The kswapd thread becomes a single point of contention, causing
  delays in memory reclaiming and overall system performance degradation.

Solution:
  Introduced kcompressd to handle asynchronous compression during memory
  reclaim, improving efficiency by offloading compression tasks from
  kswapd. This allows kswapd to focus on its primary task of page reclaim
  without being burdened by the additional overhead of compression.

In our handheld devices, we found that applying this mechanism under high
memory pressure scenarios can increase the rate of pgsteal_anon per second
by over 260% compared to the situation with only kswapd. Additionally, we
observed a reduction of over 50% in page allocation stall occurrences,
further demonstrating the effectiveness of kcompressd in alleviating memory
pressure and improving system responsiveness.

Co-developed-by: Barry Song <21cnbao@gmail.com>
Signed-off-by: Barry Song <21cnbao@gmail.com>
Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Reference: Re: [PATCH 0/2] Improve Zram by separating compression context from kswapd - Barry Song
           https://lore.kernel.org/lkml/20250313093005.13998-1-21cnbao@gmail.com/
---
 include/linux/mmzone.h |  6 ++++
 mm/mm_init.c           |  1 +
 mm/page_io.c           | 71 ++++++++++++++++++++++++++++++++++++++++++
 mm/swap.h              |  6 ++++
 mm/vmscan.c            | 25 +++++++++++++++
 5 files changed, 109 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 6ccec1bf2896..93c9195a54ae 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -23,6 +23,7 @@
 #include <linux/page-flags.h>
 #include <linux/local_lock.h>
 #include <linux/zswap.h>
+#include <linux/kfifo.h>
 #include <asm/page.h>
 
 /* Free memory management - zoned buddy allocator.  */
@@ -1398,6 +1399,11 @@ typedef struct pglist_data {
 
 	int kswapd_failures;		/* Number of 'reclaimed == 0' runs */
 
+#define KCOMPRESS_FIFO_SIZE 256
+	wait_queue_head_t kcompressd_wait;
+	struct task_struct *kcompressd;
+	struct kfifo kcompress_fifo;
+
 #ifdef CONFIG_COMPACTION
 	int kcompactd_max_order;
 	enum zone_type kcompactd_highest_zoneidx;
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 9659689b8ace..49bae1dd4584 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1410,6 +1410,7 @@ static void __meminit pgdat_init_internals(struct pglist_data *pgdat)
 	pgdat_init_kcompactd(pgdat);
 
 	init_waitqueue_head(&pgdat->kswapd_wait);
+	init_waitqueue_head(&pgdat->kcompressd_wait);
 	init_waitqueue_head(&pgdat->pfmemalloc_wait);
 
 	for (i = 0; i < NR_VMSCAN_THROTTLE; i++)
diff --git a/mm/page_io.c b/mm/page_io.c
index 4bce19df557b..d85deb494a6a 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -233,6 +233,38 @@ static void swap_zeromap_folio_clear(struct folio *folio)
 	}
 }
 
+static bool swap_sched_async_compress(struct folio *folio)
+{
+	struct swap_info_struct *sis = swp_swap_info(folio->swap);
+	int nid = numa_node_id();
+	pg_data_t *pgdat = NODE_DATA(nid);
+
+	if (unlikely(!pgdat->kcompressd))
+		return false;
+
+	if (!current_is_kswapd())
+		return false;
+
+	if (!folio_test_anon(folio))
+		return false;
+	/*
+	 * This case needs to synchronously return AOP_WRITEPAGE_ACTIVATE
+	 */
+	if (!mem_cgroup_zswap_writeback_enabled(folio_memcg(folio)))
+		return false;
+
+	sis = swp_swap_info(folio->swap);
+	if (zswap_is_enabled() || data_race(sis->flags & SWP_SYNCHRONOUS_IO)) {
+		if (kfifo_avail(&pgdat->kcompress_fifo) >= sizeof(folio) &&
+			kfifo_in(&pgdat->kcompress_fifo, &folio, sizeof(folio))) {
+			wake_up_interruptible(&pgdat->kcompressd_wait);
+			return true;
+		}
+	}
+
+	return false;
+}
+
 /*
  * We may have stale swap cache pages in memory: notice
  * them here and get rid of the unnecessary final write.
@@ -275,6 +307,15 @@ int swap_writepage(struct page *page, struct writeback_control *wbc)
 		 */
 		swap_zeromap_folio_clear(folio);
 	}
+
+	/*
+	 * Compression within zswap and zram might block rmap, unmap
+	 * of both file and anon pages, try to do compression async
+	 * if possible
+	 */
+	if (swap_sched_async_compress(folio))
+		return 0;
+
 	if (zswap_store(folio)) {
 		count_mthp_stat(folio_order(folio), MTHP_STAT_ZSWPOUT);
 		folio_unlock(folio);
@@ -289,6 +330,36 @@ int swap_writepage(struct page *page, struct writeback_control *wbc)
 	return 0;
 }
 
+int kcompressd(void *p)
+{
+	pg_data_t *pgdat = (pg_data_t *)p;
+	struct folio *folio;
+	struct writeback_control wbc = {
+		.sync_mode = WB_SYNC_NONE,
+		.nr_to_write = SWAP_CLUSTER_MAX,
+		.range_start = 0,
+		.range_end = LLONG_MAX,
+		.for_reclaim = 1,
+	};
+
+	while (!kthread_should_stop()) {
+		wait_event_interruptible(pgdat->kcompressd_wait,
+				!kfifo_is_empty(&pgdat->kcompress_fifo));
+
+		while (!kfifo_is_empty(&pgdat->kcompress_fifo)) {
+			if (kfifo_out(&pgdat->kcompress_fifo, &folio, sizeof(folio))) {
+				if (zswap_store(folio)) {
+					count_mthp_stat(folio_order(folio), MTHP_STAT_ZSWPOUT);
+					folio_unlock(folio);
+					continue;
+				}
+				__swap_writepage(folio, &wbc);
+			}
+		}
+	}
+	return 0;
+}
+
 static inline void count_swpout_vm_event(struct folio *folio)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/mm/swap.h b/mm/swap.h
index 6f4a3f927edb..3579da413dc2 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -22,6 +22,7 @@ static inline void swap_read_unplug(struct swap_iocb *plug)
 void swap_write_unplug(struct swap_iocb *sio);
 int swap_writepage(struct page *page, struct writeback_control *wbc);
 void __swap_writepage(struct folio *folio, struct writeback_control *wbc);
+int kcompressd(void *p);
 
 /* linux/mm/swap_state.c */
 /* One swap address space for each 64M swap space */
@@ -199,6 +200,11 @@ static inline int swap_zeromap_batch(swp_entry_t entry, int max_nr,
 	return 0;
 }
 
+static inline int kcompressd(void *p)
+{
+	return 0;
+}
+
 #endif /* CONFIG_SWAP */
 
 #endif /* _MM_SWAP_H */
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 3783e45bfc92..2d7b9167bfd6 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -7420,6 +7420,7 @@ unsigned long shrink_all_memory(unsigned long nr_to_reclaim)
 void __meminit kswapd_run(int nid)
 {
 	pg_data_t *pgdat = NODE_DATA(nid);
+	int ret;
 
 	pgdat_kswapd_lock(pgdat);
 	if (!pgdat->kswapd) {
@@ -7433,7 +7434,26 @@ void __meminit kswapd_run(int nid)
 		} else {
 			wake_up_process(pgdat->kswapd);
 		}
+		ret = kfifo_alloc(&pgdat->kcompress_fifo,
+				KCOMPRESS_FIFO_SIZE * sizeof(struct folio *),
+				GFP_KERNEL);
+		if (ret) {
+			pr_err("%s: fail to kfifo_alloc\n", __func__);
+			goto out;
+		}
+
+		pgdat->kcompressd = kthread_create_on_node(kcompressd, pgdat, nid,
+				"kcompressd%d", nid);
+		if (IS_ERR(pgdat->kcompressd)) {
+			pr_err("Failed to start kcompressd on node %d，ret=%ld\n",
+					nid, PTR_ERR(pgdat->kcompressd));
+			pgdat->kcompressd = NULL;
+			kfifo_free(&pgdat->kcompress_fifo);
+		} else {
+			wake_up_process(pgdat->kcompressd);
+		}
 	}
+out:
 	pgdat_kswapd_unlock(pgdat);
 }
 
@@ -7452,6 +7472,11 @@ void __meminit kswapd_stop(int nid)
 		kthread_stop(kswapd);
 		pgdat->kswapd = NULL;
 	}
+	if (pgdat->kcompressd) {
+		kthread_stop(pgdat->kcompressd);
+		pgdat->kcompressd = NULL;
+		kfifo_free(&pgdat->kcompress_fifo);
+	}
 	pgdat_kswapd_unlock(pgdat);
 }
 
-- 
2.45.2


