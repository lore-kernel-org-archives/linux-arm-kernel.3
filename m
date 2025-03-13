Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC444C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 09:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DF1eXiWA++7dVvFQ387XbvvBNFJ2uiLqvlepOnibQqU=; b=vYeZOci1Ewu62KK/OXIWE2HQwz
	u6kpQIf9r084douGAi7Lxy56/cLIQjxzwDejo5gjaTVe7kpc2jfO7EKayLW30TrwftX7SR0sdam9R
	R42alzAsvi96zkQt5MnLbFuZy//N2wJwUsVSV3SXegUxvsaf6xpxZmnTc3tX4ug/ouurilh+G6lA8
	jzfTzhlO19srsJypgexS5rQiBEFha2i4H0PM+ugStmW3qQBsblTVfcxHGktvCPb8cdZJvan1b5+k/
	yB/98G8j9+Hy90Xlu9ELtryOtaRM1ZpQBfTcHCl/ayKVMLdG+vJ8+ae4lCtSILU35puZgQy2AFCtg
	qnLstXcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsev4-0000000Aje8-2nNu;
	Thu, 13 Mar 2025 09:32:02 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsetP-0000000AjQG-40yf;
	Thu, 13 Mar 2025 09:30:21 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2255003f4c6so12790095ad.0;
        Thu, 13 Mar 2025 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741858219; x=1742463019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DF1eXiWA++7dVvFQ387XbvvBNFJ2uiLqvlepOnibQqU=;
        b=JCprZWYv7XXbkrzF8Y81HFgZk/xWqGmahbpGuTKYXsDUCR7LzjJXWpayicfKF5JirG
         HFlySLcX+bFj84123JjPHY6CAM08E+LqkG2gJBauNyeVCKkVYz4PBvSHQe6VtHDS9r6t
         ZugaCJ7h8YKRFWTSXxxK8zZgzxdZBWOxo/SwdwABdVogAT1uJaoZ+WcsHOVfDL+RMadp
         GQf3z/emt1HmmcwxTLWQ7LYfY1IezcTk6PvdHf1ISMkVsvI69nprMLHbmD2zSBCNEHcF
         QJ8dao1FlH6/iDiTIrDwo7zBzZqZFzv+oJnzz5BdZz+qTHSOCdjygrBXoqOfd3q52/mM
         b7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741858219; x=1742463019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DF1eXiWA++7dVvFQ387XbvvBNFJ2uiLqvlepOnibQqU=;
        b=H0KC1JNbz6QxAAfzTwyr5hKTI9YBxht8407KyOutIilSJE8DfTJcFowKAzW8B1J4uO
         TlS1Y9HEunw5CQB3rC932ql0BYlyf+STz6SQz/EdrXx8k0JuFBADx5i486cV/sppjngE
         8b5n8eYK2pTaXkPYyFpCjSHHlO0vtLZO4k/W2MZd0a7m7yR/GCKXGgybPgdoIYC+3Ob5
         IRY41ZMA+a/NWQA93LW00muSosNToVmlcmMsD6VEu2dfFWQCe12vAX78REgJoUBhoxhf
         1rCJZiA9kRbnApo1uwtIHvf5bwNxmhZTuUf8U4dQzJ5Yh+Nc7w48/xjBKnIeHOwYobPO
         z3IA==
X-Forwarded-Encrypted: i=1; AJvYcCU/YycmdlU9aPfdAMskIHSa5hX3q79BxgdIeJWkMJCR3BIak9U5qKT3DmIGYEhGRGMZ/6kCVLbIx2+bW7Jdkq7z@lists.infradead.org, AJvYcCXBGenot3mxBb3PLZCp25tZbLIGIjNe46G0G8jfsrCFbCLjQy9uCmggAcSfncK5O0TsAMOcXWt4G5w6/cWeXwU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWtsJ0ok/om/fCgAMlUrivb1Tl5ogncpWUHqUw5xoYMSCx8Dbc
	KcjMGBLvLxQPf8ogKNNF6AxuetQtCyO/3F97hDw0D9RcfepWwNvp
X-Gm-Gg: ASbGncv40ed9C2e71xNt3uqZNABjNB8xz0Tjye4TEEMZDZETEQ6H7HpqFFN4LaVKhWG
	czcOWZmwLaVmnsK2JjebsPjWvI8R8jCtL2CfraGzy3QHysNjVS2gUYCcE9wMqjoobPSCs5OqL3y
	G14HilCKGnBDuvUt94s5sXWO4SjkBhfkfaKhHy1atT+5eXfx3exHIh0QQ72IIMz/iU6Q/Uqu6ST
	CLdCV0chkzHjCDuZnlWJkJ1nEG8AwovRoBSmbwadROeQYRfmhkAasw/G9hxLuzAV2ygULtX4XaF
	9Kv18UFYu5+qfRvijArcNc/TqNjRzLzQDjXOPIQwcfl5wWqeAXejCTyraNrJ+w==
X-Google-Smtp-Source: AGHT+IENeSJ/IswzZ3DorkAIV3dT3SU4Nhv66RaT71103q97yi/XYFYo7f6+vWyZvR7l0in1am2n/w==
X-Received: by 2002:a05:6a00:194c:b0:730:79bf:c893 with SMTP id d2e1a72fcca58-736eb7a0176mr14602942b3a.4.1741858218860;
        Thu, 13 Mar 2025 02:30:18 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.30.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694e34sm927243b3a.140.2025.03.13.02.30.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 13 Mar 2025 02:30:18 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: minchan@kernel.org,
	qun-wei.lin@mediatek.com,
	senozhatsky@chromium.org,
	nphamcs@gmail.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	andrew.yang@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	axboe@kernel.dk,
	casper.li@mediatek.com,
	chinwen.chang@mediatek.com,
	chrisl@kernel.org,
	dan.j.williams@intel.com,
	dave.jiang@intel.com,
	ira.weiny@intel.com,
	james.hsu@mediatek.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mm@kvack.org,
	matthias.bgg@gmail.com,
	nvdimm@lists.linux.dev,
	ryan.roberts@arm.com,
	schatzberg.dan@gmail.com,
	viro@zeniv.linux.org.uk,
	vishal.l.verma@intel.com,
	ying.huang@intel.com
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from kswapd
Date: Thu, 13 Mar 2025 22:30:05 +1300
Message-Id: <20250313093005.13998-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAGsJ_4yw17rLJPgS6CNXfXNVQnv2pf0PnLSA4UVAR1sUWDhP5Q@mail.gmail.com>
References: <CAGsJ_4yw17rLJPgS6CNXfXNVQnv2pf0PnLSA4UVAR1sUWDhP5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_023020_017827_178BD5F2 
X-CRM114-Status: GOOD (  42.42  )
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

On Thu, Mar 13, 2025 at 4:52 PM Barry Song <21cnbao@gmail.com> wrote:
>
> On Thu, Mar 13, 2025 at 4:09 PM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > On (25/03/12 11:11), Minchan Kim wrote:
> > > On Fri, Mar 07, 2025 at 08:01:02PM +0800, Qun-Wei Lin wrote:
> > > > This patch series introduces a new mechanism called kcompressd to
> > > > improve the efficiency of memory reclaiming in the operating system. The
> > > > main goal is to separate the tasks of page scanning and page compression
> > > > into distinct processes or threads, thereby reducing the load on the
> > > > kswapd thread and enhancing overall system performance under high memory
> > > > pressure conditions.
> > > >
> > > > Problem:
> > > >  In the current system, the kswapd thread is responsible for both
> > > >  scanning the LRU pages and compressing pages into the ZRAM. This
> > > >  combined responsibility can lead to significant performance bottlenecks,
> > > >  especially under high memory pressure. The kswapd thread becomes a
> > > >  single point of contention, causing delays in memory reclaiming and
> > > >  overall system performance degradation.
> > >
> > > Isn't it general problem if backend for swap is slow(but synchronous)?
> > > I think zram need to support asynchrnous IO(can do introduce multiple
> > > threads to compress batched pages) and doesn't declare it's
> > > synchrnous device for the case.
> >
> > The current conclusion is that kcompressd will sit above zram,
> > because zram is not the only compressing swap backend we have.
>
> also. it is not good to hack zram to be aware of if it is kswapd
> , direct reclaim , proactive reclaim and block device with
> mounted filesystem.
>
> so i am thinking sth as below
>
> page_io.c
>
> if (sync_device or zswap_enabled())
>    schedule swap_writepage to a separate per-node thread
>

Hi Qun-wei, Nhat, Sergey and Minchan,

I managed to find some time to prototype a kcompressd that supports
both zswap and zram, though it has only been build-tested.

Hi Qun-wei,

Apologies, but I’m quite busy with other tasks and don’t have time to
debug or test it. Please feel free to test it. When you submit v2, you’re
welcome to keep yourself as the author of the patch as v1.

If you’re okay with it, you can also add me as a co-developer in the
changelog. The below prototype, I'd rather start with a per-node thread
approach. While this might not provide the greatest benefit, it carries
the least risk and helps avoid complex questions, such as how to
determine the number of threads. - And we have actually observed a
significant reduction in allocstall by using a single thread to
asynchronously handle kswapd's compression as I reported.

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index dbb0ad69e17f..4f9ee2fb338d 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -23,6 +23,7 @@
 #include <linux/page-flags.h>
 #include <linux/local_lock.h>
 #include <linux/zswap.h>
+#include <linux/kfifo.h>
 #include <asm/page.h>
 
 /* Free memory management - zoned buddy allocator.  */
@@ -1389,6 +1390,11 @@ typedef struct pglist_data {
 
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
index 281802a7a10d..8cd143f59e76 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1410,6 +1410,7 @@ static void __meminit pgdat_init_internals(struct pglist_data *pgdat)
 	pgdat_init_kcompactd(pgdat);
 
 	init_waitqueue_head(&pgdat->kswapd_wait);
+	init_waitqueue_head(&pgdat->kcompressd_wait);
 	init_waitqueue_head(&pgdat->pfmemalloc_wait);
 
 	for (i = 0; i < NR_VMSCAN_THROTTLE; i++)
diff --git a/mm/page_io.c b/mm/page_io.c
index 4bce19df557b..7bbd14991ffb 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -233,6 +233,33 @@ static void swap_zeromap_folio_clear(struct folio *folio)
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
+	if (zswap_is_enabled() || data_race(sis->flags & SWP_SYNCHRONOUS_IO))
+		return kfifo_in(&pgdat->kcompress_fifo, folio, sizeof(folio));
+
+	return false;
+}
+
 /*
  * We may have stale swap cache pages in memory: notice
  * them here and get rid of the unnecessary final write.
@@ -275,6 +302,15 @@ int swap_writepage(struct page *page, struct writeback_control *wbc)
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
@@ -289,6 +325,38 @@ int swap_writepage(struct page *page, struct writeback_control *wbc)
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
+		if (kthread_should_stop())
+			break;
+		while(!kfifo_is_empty(&pgdat->kcompress_fifo)) {
+			if (kfifo_out(&pgdat->kcompress_fifo, &folio, sizeof(folio))) {
+				if (zswap_store(folio)) {
+					count_mthp_stat(folio_order(folio), MTHP_STAT_ZSWPOUT);
+					folio_unlock(folio);
+					return 0;
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
index 0abb68091b4f..38d61c6a06f1 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -21,6 +21,7 @@ static inline void swap_read_unplug(struct swap_iocb *plug)
 void swap_write_unplug(struct swap_iocb *sio);
 int swap_writepage(struct page *page, struct writeback_control *wbc);
 void __swap_writepage(struct folio *folio, struct writeback_control *wbc);
+int kcompressd(void *p);
 
 /* linux/mm/swap_state.c */
 /* One swap address space for each 64M swap space */
@@ -198,6 +199,11 @@ static inline int swap_zeromap_batch(swp_entry_t entry, int max_nr,
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
index 2bc740637a6c..ba0245b74e45 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -7370,6 +7370,7 @@ unsigned long shrink_all_memory(unsigned long nr_to_reclaim)
 void __meminit kswapd_run(int nid)
 {
 	pg_data_t *pgdat = NODE_DATA(nid);
+	int ret;
 
 	pgdat_kswapd_lock(pgdat);
 	if (!pgdat->kswapd) {
@@ -7383,7 +7384,23 @@ void __meminit kswapd_run(int nid)
 		} else {
 			wake_up_process(pgdat->kswapd);
 		}
+		ret = kfifo_alloc(&pgdat->kcompress_fifo,
+				KCOMPRESS_FIFO_SIZE * sizeof(struct folio *),
+				GFP_KERNEL);
+		if (ret)
+			goto out;
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
 
@@ -7402,6 +7419,11 @@ void __meminit kswapd_stop(int nid)
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
 

> btw,  ran the current patchset with one thread(not default 4)
> on phones and saw 50%+ allocstall reduction. so the idea
> looks like a good direction to go.
>

Thanks
Barry

