Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70FAC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 17:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJHez8HNwZpEakJ3GJ7Qf+N0NueKUDTHXJladqEDSg4=; b=Da/niqADb8GdU75yzfAnaeap3k
	CjyVOfA4MVdIYFg3dfcwhkhsM3esBrTcv1jtcfRbEKYXnxQx3J+Ku2zPXayenhwGL+Kspo+98ZLCj
	xaHPYo57FFT7LZDXGtbNnSpuVRsX/qm0mxdUMYsyA4GwfkLvupQ6PWDgEnrbZqpdziB4T5Fomt9Db
	4hNJzRkN7QCu/sK+asjWcxiUmECit6O8g3WwLwQ6B/7MVeZ4JbZYCHCWwpjbJbdBl8QVyvFEDC+KW
	xYiq1N0/vFTOAmrj5pmqzeXRd7KEKFEeU6QA0fWXh7oPkIrkqrP2WZxsLdermB+t5cq2gmWlm90FT
	Iv3zoBIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAuq-0000000DWIX-09wQ;
	Wed, 30 Apr 2025 17:08:12 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAsu-0000000DW7L-3NYF;
	Wed, 30 Apr 2025 17:06:14 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6e8f254b875so1548796d6.1;
        Wed, 30 Apr 2025 10:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746032771; x=1746637571; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJHez8HNwZpEakJ3GJ7Qf+N0NueKUDTHXJladqEDSg4=;
        b=S0vefxztxiTfnUmZOKN9lE6Zg92vzDmAaVQYHeCqkeNHKiyMPAQB+OE4x7o4hHL/yz
         DxGYUUdiB4RJCfhzW3Q1BZeQ+YYwQPOP1A06wFLZmBB522Z1amNsB4lwQMGVQ0bknKKJ
         q9AoWky+z31x4HRbefMCBw2gOZiCNUyf+y09UbwqKsGLGCGYfvbM6Lx/Dn7Hcw9rXIgX
         R+g5RSSh6qaHRxW507phPHCg04UDC5I9Kt+Qo88wQ6qJ9uXIp7EFXO2/WFBl7QTUrYhV
         EILBRPmnHjWecAFs+xZ6Vm64+JhYUzb0St9CJwjBiPyhExMkqSVPAovVTx1WSrP74mj9
         13hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746032771; x=1746637571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJHez8HNwZpEakJ3GJ7Qf+N0NueKUDTHXJladqEDSg4=;
        b=uWs4dL/egxCju/aDPSEBNklQaUE5THheub9xaiRWMJgZbrsSFsibPu1mVOqMC8wat1
         xV/kw107NakN/3BroGMYApnvHBM3XIVoldCBsDKRxvVTN4bwL29tcVezJwt/cHAp9Jv+
         h1CFRgi7pwZfiuF/Usnx9psDUD3Zz1sX80KUTz0qYiyKQNkb5Q+KfOunv7OpquP+woxJ
         9Ojm6ivjSD9NRRp+tubva+PJjOr6Id7tV7SiCpBXdfKb6Y83aCL+TYqK1WsPg5ei6YqJ
         6NqEoXihTnmE2v72dhBv17IoA6GLjlKq0hrfSYVkRU7Z+Qfq2DDaipsV0MKJLMupDSWj
         UAfg==
X-Forwarded-Encrypted: i=1; AJvYcCUyTnNRkW+6WLa92A16Ue7Y2tKrMPqzyuFHYLRJ813Qs/WoM7G9EwUYysj6KljgRJcU/9qT/S0xdnKPzNPqvF4=@lists.infradead.org, AJvYcCXcfQoubAr3nSEh6dk3ciO6EEEPCu+Fz0oPRyEeILBThGjwzCPDHjzJ1itvkx7XF0PZbKMpy2rwXq7el8LhBL19@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjhfpch03e2vweTWOsVog9PAl7mIGGKuMqhyZ1zIjCS1vq6Nwt
	EC6vEvSpE6tiDyMN1QRLxcXHtYYJji5qseCWXncrY2ZHbIynrE7PTxC1PZvTkRnGjQvyn5m5DhL
	2B14u6HwcKHroAus+N8cSOic7bug=
X-Gm-Gg: ASbGnctDjNO2zqFtAlo11TygRTjwsmRnnsJANmyEMw4HPZaWbqae4Dus9Ev2/zU60Ol
	QIFFftnLVo2S7J1SPTsnEWNNuZCHIF+4kZU/E5xAIOYlF36ziGhML5pRdRWjOM/2bJJXsl5phZs
	8AP7t9y13OpShYduMoAngwYWfsvv69qVEhfg==
X-Google-Smtp-Source: AGHT+IG0E4wID2HPpTmHxUm2md1g3OULl4QwRgKw/Yz/dJz8ojI3h6U7Tg4mhPuA4opVEeJPKJ9IXACDI4cYf214WjM=
X-Received: by 2002:a05:6214:1bc7:b0:6e6:591b:fa62 with SMTP id
 6a1803df08f44-6f4fce40dc6mr67144826d6.5.1746032770591; Wed, 30 Apr 2025
 10:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
In-Reply-To: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 30 Apr 2025 10:05:59 -0700
X-Gm-Features: ATxdqUHgRrr3TynCPFETJ0RePkjNkdgQExomlSQnpz_nUQy5C6ldMmhK-GnUrFU
Message-ID: <CAKEwX=P3GmtqjyNWYTHYT=NLSP44qFRXWiq+R5T+NzPkMvVhsw@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>, Barry Song <21cnbao@gmail.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_100612_851258_1897B738 
X-CRM114-Status: GOOD (  38.42  )
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

On Wed, Apr 30, 2025 at 1:27=E2=80=AFAM Qun-Wei Lin <qun-wei.lin@mediatek.c=
om> wrote:
>
> This patch series introduces a new mechanism called kcompressd to
> improve the efficiency of memory reclaiming in the operating system.
>
> Problem:
>   In the current system, the kswapd thread is responsible for both scanni=
ng
>   the LRU pages and handling memory compression tasks (such as those
>   involving ZSWAP/ZRAM, if enabled). This combined responsibility can lea=
d
>   to significant performance bottlenecks, especially under high memory
>   pressure. The kswapd thread becomes a single point of contention, causi=
ng
>   delays in memory reclaiming and overall system performance degradation.
>
> Solution:
>   Introduced kcompressd to handle asynchronous compression during memory
>   reclaim, improving efficiency by offloading compression tasks from
>   kswapd. This allows kswapd to focus on its primary task of page reclaim
>   without being burdened by the additional overhead of compression.
>
> In our handheld devices, we found that applying this mechanism under high
> memory pressure scenarios can increase the rate of pgsteal_anon per secon=
d
> by over 260% compared to the situation with only kswapd. Additionally, we
> observed a reduction of over 50% in page allocation stall occurrences,
> further demonstrating the effectiveness of kcompressd in alleviating memo=
ry
> pressure and improving system responsiveness.
>
> Co-developed-by: Barry Song <21cnbao@gmail.com>
> Signed-off-by: Barry Song <21cnbao@gmail.com>
> Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
> Reference: Re: [PATCH 0/2] Improve Zram by separating compression context=
 from kswapd - Barry Song
>            https://lore.kernel.org/lkml/20250313093005.13998-1-21cnbao@gm=
ail.com/
> ---
>  include/linux/mmzone.h |  6 ++++
>  mm/mm_init.c           |  1 +
>  mm/page_io.c           | 71 ++++++++++++++++++++++++++++++++++++++++++
>  mm/swap.h              |  6 ++++
>  mm/vmscan.c            | 25 +++++++++++++++
>  5 files changed, 109 insertions(+)
>
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 6ccec1bf2896..93c9195a54ae 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -23,6 +23,7 @@
>  #include <linux/page-flags.h>
>  #include <linux/local_lock.h>
>  #include <linux/zswap.h>
> +#include <linux/kfifo.h>
>  #include <asm/page.h>
>
>  /* Free memory management - zoned buddy allocator.  */
> @@ -1398,6 +1399,11 @@ typedef struct pglist_data {
>
>         int kswapd_failures;            /* Number of 'reclaimed =3D=3D 0'=
 runs */
>
> +#define KCOMPRESS_FIFO_SIZE 256
> +       wait_queue_head_t kcompressd_wait;
> +       struct task_struct *kcompressd;
> +       struct kfifo kcompress_fifo;
> +
>  #ifdef CONFIG_COMPACTION
>         int kcompactd_max_order;
>         enum zone_type kcompactd_highest_zoneidx;
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 9659689b8ace..49bae1dd4584 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1410,6 +1410,7 @@ static void __meminit pgdat_init_internals(struct p=
glist_data *pgdat)
>         pgdat_init_kcompactd(pgdat);
>
>         init_waitqueue_head(&pgdat->kswapd_wait);
> +       init_waitqueue_head(&pgdat->kcompressd_wait);
>         init_waitqueue_head(&pgdat->pfmemalloc_wait);
>
>         for (i =3D 0; i < NR_VMSCAN_THROTTLE; i++)
> diff --git a/mm/page_io.c b/mm/page_io.c
> index 4bce19df557b..d85deb494a6a 100644
> --- a/mm/page_io.c
> +++ b/mm/page_io.c
> @@ -233,6 +233,38 @@ static void swap_zeromap_folio_clear(struct folio *f=
olio)
>         }
>  }
>
> +static bool swap_sched_async_compress(struct folio *folio)
> +{
> +       struct swap_info_struct *sis =3D swp_swap_info(folio->swap);
> +       int nid =3D numa_node_id();
> +       pg_data_t *pgdat =3D NODE_DATA(nid);
> +
> +       if (unlikely(!pgdat->kcompressd))
> +               return false;
> +
> +       if (!current_is_kswapd())
> +               return false;
> +
> +       if (!folio_test_anon(folio))
> +               return false;
> +       /*
> +        * This case needs to synchronously return AOP_WRITEPAGE_ACTIVATE
> +        */
> +       if (!mem_cgroup_zswap_writeback_enabled(folio_memcg(folio)))
> +               return false;

Ah, this is unfortunate.

At this point, we do not know whether the page is compressible yet. If
we decide to perform async compression here, and the page is
incompressible, and we disable zswap writeback, we risk not being able
to activate it down the line, making it more likely that we try it
again too soon :(

Hopefully we can remove this limitation, when Joshua's work to store
incompressible pages in the zswap LRU lands. Then, even if the page is
incompressible, we won't retry it and just put it in the zswap LRU...

> +
> +       sis =3D swp_swap_info(folio->swap);

There's a slight hitch here. Upstream-wise, zswap differs slightly
from zram: it is cgroup-controlled. zswap can be disabled on a
per-cgroup basis. This is useful, for e.g, when we know for certain
that a workload's data are not compressible, and/or they are not
latency-sensitive so might as well use disk swap.

If the folio's cgroup has its zswap limit reached/disables zswap, then
we should fallback to disk swapping right away, instead of holding the
page. I think we should check it here. Maybe add a
mem_cgroup_may_zswap() helper (see obj_cgroup_may_zswap() for
implementation details - should be a simple-ish refactor), and check
here, in addition to zswap_is_enabled() check? Something like:

if ((zswap_is_enabled() && mem_cgroup_may_zswap(folio_memcg(folio)))
|| data_race(sis->flags & SWP_SYNCHRONOUS_IO))

Does that sound reasonable, Qun-Wei and Barry?

> +       if (zswap_is_enabled() || data_race(sis->flags & SWP_SYNCHRONOUS_=
IO)) {
> +               if (kfifo_avail(&pgdat->kcompress_fifo) >=3D sizeof(folio=
) &&
> +                       kfifo_in(&pgdat->kcompress_fifo, &folio, sizeof(f=
olio))) {
> +                       wake_up_interruptible(&pgdat->kcompressd_wait);
> +                       return true;
> +               }
> +       }
> +
> +       return false;
> +}
> +
>  /*
>   * We may have stale swap cache pages in memory: notice
>   * them here and get rid of the unnecessary final write.
> @@ -275,6 +307,15 @@ int swap_writepage(struct page *page, struct writeba=
ck_control *wbc)
>                  */
>                 swap_zeromap_folio_clear(folio);
>         }
> +
> +       /*
> +        * Compression within zswap and zram might block rmap, unmap
> +        * of both file and anon pages, try to do compression async
> +        * if possible
> +        */
> +       if (swap_sched_async_compress(folio))
> +               return 0;
> +
>         if (zswap_store(folio)) {
>                 count_mthp_stat(folio_order(folio), MTHP_STAT_ZSWPOUT);
>                 folio_unlock(folio);
> @@ -289,6 +330,36 @@ int swap_writepage(struct page *page, struct writeba=
ck_control *wbc)
>         return 0;
>  }
>
> +int kcompressd(void *p)
> +{
> +       pg_data_t *pgdat =3D (pg_data_t *)p;
> +       struct folio *folio;
> +       struct writeback_control wbc =3D {
> +               .sync_mode =3D WB_SYNC_NONE,
> +               .nr_to_write =3D SWAP_CLUSTER_MAX,
> +               .range_start =3D 0,
> +               .range_end =3D LLONG_MAX,
> +               .for_reclaim =3D 1,
> +       };
> +
> +       while (!kthread_should_stop()) {
> +               wait_event_interruptible(pgdat->kcompressd_wait,
> +                               !kfifo_is_empty(&pgdat->kcompress_fifo));
> +
> +               while (!kfifo_is_empty(&pgdat->kcompress_fifo)) {
> +                       if (kfifo_out(&pgdat->kcompress_fifo, &folio, siz=
eof(folio))) {
> +                               if (zswap_store(folio)) {
> +                                       count_mthp_stat(folio_order(folio=
), MTHP_STAT_ZSWPOUT);
> +                                       folio_unlock(folio);
> +                                       continue;
> +                               }
> +                               __swap_writepage(folio, &wbc);
> +                       }
> +               }
> +       }
> +       return 0;
> +}
> +
>  static inline void count_swpout_vm_event(struct folio *folio)
>  {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> diff --git a/mm/swap.h b/mm/swap.h
> index 6f4a3f927edb..3579da413dc2 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -22,6 +22,7 @@ static inline void swap_read_unplug(struct swap_iocb *p=
lug)
>  void swap_write_unplug(struct swap_iocb *sio);
>  int swap_writepage(struct page *page, struct writeback_control *wbc);
>  void __swap_writepage(struct folio *folio, struct writeback_control *wbc=
);
> +int kcompressd(void *p);
>
>  /* linux/mm/swap_state.c */
>  /* One swap address space for each 64M swap space */
> @@ -199,6 +200,11 @@ static inline int swap_zeromap_batch(swp_entry_t ent=
ry, int max_nr,
>         return 0;
>  }
>
> +static inline int kcompressd(void *p)
> +{
> +       return 0;
> +}
> +
>  #endif /* CONFIG_SWAP */
>
>  #endif /* _MM_SWAP_H */
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 3783e45bfc92..2d7b9167bfd6 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -7420,6 +7420,7 @@ unsigned long shrink_all_memory(unsigned long nr_to=
_reclaim)
>  void __meminit kswapd_run(int nid)
>  {
>         pg_data_t *pgdat =3D NODE_DATA(nid);
> +       int ret;
>
>         pgdat_kswapd_lock(pgdat);
>         if (!pgdat->kswapd) {
> @@ -7433,7 +7434,26 @@ void __meminit kswapd_run(int nid)
>                 } else {
>                         wake_up_process(pgdat->kswapd);
>                 }
> +               ret =3D kfifo_alloc(&pgdat->kcompress_fifo,
> +                               KCOMPRESS_FIFO_SIZE * sizeof(struct folio=
 *),
> +                               GFP_KERNEL);
> +               if (ret) {
> +                       pr_err("%s: fail to kfifo_alloc\n", __func__);
> +                       goto out;
> +               }
> +
> +               pgdat->kcompressd =3D kthread_create_on_node(kcompressd, =
pgdat, nid,
> +                               "kcompressd%d", nid);
> +               if (IS_ERR(pgdat->kcompressd)) {
> +                       pr_err("Failed to start kcompressd on node %d=EF=
=BC=8Cret=3D%ld\n",
> +                                       nid, PTR_ERR(pgdat->kcompressd));
> +                       pgdat->kcompressd =3D NULL;
> +                       kfifo_free(&pgdat->kcompress_fifo);
> +               } else {
> +                       wake_up_process(pgdat->kcompressd);
> +               }
>         }
> +out:
>         pgdat_kswapd_unlock(pgdat);
>  }
>
> @@ -7452,6 +7472,11 @@ void __meminit kswapd_stop(int nid)
>                 kthread_stop(kswapd);
>                 pgdat->kswapd =3D NULL;
>         }
> +       if (pgdat->kcompressd) {
> +               kthread_stop(pgdat->kcompressd);
> +               pgdat->kcompressd =3D NULL;
> +               kfifo_free(&pgdat->kcompress_fifo);
> +       }
>         pgdat_kswapd_unlock(pgdat);
>  }
>
> --
> 2.45.2
>

