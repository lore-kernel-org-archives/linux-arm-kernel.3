Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B189C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 21:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZIFhyha4G5i8WRLJMw6/zI37vSJCnSLVsLqNxDj5gU=; b=lijceewnz0/rnWYTxowkxpgGb4
	J97oi2KZo6l883dsNG5Z2lCmPwcybwtLpr9Stu+6riqOWF/OlRT4dg5EA5m+9v9KFlP5M4EvIa+lF
	syyAshLrwKvxMKYwS3SYv40yAu1rX0+cuAZCw6g4F74nfkGCL1piQUb2EO4xOD+Aa1d/Q4suKBzXS
	G0sdX8F9cKwArscPWaLipGFKOTdCGKE7Bw6gHhhgBsXMGR9gY0ITxwaudklssGoCQEhASA3Dwn7RK
	gGb0awtNEMxKtsvqg2UX5kaw/O+FM8wve8VfzZZH2spu9IE4UaVUqbALKQY728S9lzY3CL2cTXq3Q
	NmH8MZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAFMa-0000000E7UA-3DM1;
	Wed, 30 Apr 2025 21:53:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAFKf-0000000E7NK-07ta;
	Wed, 30 Apr 2025 21:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54423A4B7E8;
	Wed, 30 Apr 2025 21:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C5EC4CEE7;
	Wed, 30 Apr 2025 21:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746049867;
	bh=5u/M4235ZhIaoydVPyaBH4cYCvqZf2avpMDKQWTlaWo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RndfgxAr+7rzrSzhRqUo3Hdh8cOk1RR+5tdnl4wEyYYGeBTuUq2adD0CtwrTvKC8+
	 dCPYZldY4E2o0iBRPOHrpSYjq8fGDoceEbNX1cS2VvMPrZM1ARHA6ddt6i14worw86
	 Ftug5mszCLdfxUuQBPRg3hOiMYU/LpCr0zRhkqrk=
Date: Wed, 30 Apr 2025 14:51:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Mike Rapoport <rppt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Nhat Pham <nphamcs@gmail.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim
 <minchan@kernel.org>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Casper Li <casper.li@mediatek.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang
 <andrew.yang@mediatek.com>, James Hsu <james.hsu@mediatek.com>, Barry Song
 <21cnbao@gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
Message-Id: <20250430145106.8ce79a05d35cec72aa02baa6@linux-foundation.org>
In-Reply-To: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_145109_148109_78B38078 
X-CRM114-Status: GOOD (  19.18  )
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

On Wed, 30 Apr 2025 16:26:41 +0800 Qun-Wei Lin <qun-wei.lin@mediatek.com> wrote:

> This patch series introduces a new mechanism called kcompressd to
> improve the efficiency of memory reclaiming in the operating system.
> 
> Problem:
>   In the current system, the kswapd thread is responsible for both scanning
>   the LRU pages and handling memory compression tasks (such as those
>   involving ZSWAP/ZRAM, if enabled). This combined responsibility can lead
>   to significant performance bottlenecks, especially under high memory
>   pressure. The kswapd thread becomes a single point of contention, causing
>   delays in memory reclaiming and overall system performance degradation.
> 
> Solution:
>   Introduced kcompressd to handle asynchronous compression during memory
>   reclaim, improving efficiency by offloading compression tasks from
>   kswapd. This allows kswapd to focus on its primary task of page reclaim
>   without being burdened by the additional overhead of compression.
> 
> In our handheld devices, we found that applying this mechanism under high
> memory pressure scenarios can increase the rate of pgsteal_anon per second
> by over 260% compared to the situation with only kswapd. Additionally, we
> observed a reduction of over 50% in page allocation stall occurrences,
> further demonstrating the effectiveness of kcompressd in alleviating memory
> pressure and improving system responsiveness.

It's a significant change and I'm thinking that broader performance
testing across a broader range of machines is needed before we can
confidently upstream such a change.

Also, it's presumably a small net loss on single-CPU machines (do these
exist any more?).  Is it hard to disable this feature on such machines?

>  
> +static bool swap_sched_async_compress(struct folio *folio)
> +{
> +	struct swap_info_struct *sis = swp_swap_info(folio->swap);
> +	int nid = numa_node_id();
> +	pg_data_t *pgdat = NODE_DATA(nid);
> +
> +	if (unlikely(!pgdat->kcompressd))
> +		return false;
> +
> +	if (!current_is_kswapd())
> +		return false;
> +
> +	if (!folio_test_anon(folio))
> +		return false;

Are you sure the above three tests are really needed?



