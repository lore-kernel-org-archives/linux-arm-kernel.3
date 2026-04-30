Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F90BFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+Z3DKsnSFmL8ihuU1z6jpmoa/PGowkZGNbOeWbnqGA=; b=GSULcgxN00xsEWbd0yFzgqFJlF
	QACaUA1X6SZRvbE1MvYLimJg7W74LGAZEB1CT7svaJFCY1vCdMZbMnVWpmerl6lZUR0E56F6WR0oy
	PdsJ+wLtbk2CKTlAHyHbuVakNlKSDnNx7n3BOqXVM6wAJhQt8gh8xgGiVy7+NiCjr+7Vmhx93a+zc
	OptxGsPvWM667sTWHAYyetdCukAMdlWhEQVauWYvGVU0QEmkVsTiwtMRdVhXEApOsRaM/fUinaHSy
	jSB5XJbrvxM3hWKGEI/SVxibdyhxgdTUj7lKE03tkX5LkUf0O3LR5qpNc2fF+lSIy90NbGzQ+StDu
	GxQ96sOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQcK-00000005SxQ-2laL;
	Thu, 30 Apr 2026 12:35:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQcJ-00000005Swq-2qEH;
	Thu, 30 Apr 2026 12:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z+Z3DKsnSFmL8ihuU1z6jpmoa/PGowkZGNbOeWbnqGA=; b=iAUflMNTY8s90bOygRPipE/x2+
	2rqGdbTRLii/gKwyDrwP3nkrR0VatKKYld/V/816iJ1P+tXhX+d+idNR+EHjQMboflVsiybW8W+j8
	eYWs7JCkiHvjY2IB2zf7TqoA45+x4aQ6qJmQlmCWvqYPr8NfFayhBn2Yo/Fe4ZPpdXhwYsAJOnz9D
	fjrOixede6cq1gwHChteZEiQiJMRusCYSEQAeQfmUhSpF81serK2xu7B77/VvMp8ZkRnZOjTGarSl
	f2YwbxhX7fGYNMGzMT5rb3gdo1ooWSq/7jwDHw+A2onKlKlIcG5HcwM0Ymw87xAmNi9iGAAb7Q4sY
	9LSfVJFQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQc7-00000007Dpy-0PSw;
	Thu, 30 Apr 2026 12:35:31 +0000
Date: Thu, 30 Apr 2026 13:35:30 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, jack@suse.cz,
	pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn,
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com,
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com,
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v2 4/5] mm: Don't retry page fault if folio is uptodate
 during swap-in
Message-ID: <afNMkqwxC00OT134@casper.infradead.org>
References: <20260430040427.4672-1-baohua@kernel.org>
 <20260430040427.4672-5-baohua@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430040427.4672-5-baohua@kernel.org>
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

On Thu, Apr 30, 2026 at 12:04:26PM +0800, Barry Song (Xiaomi) wrote:
> If we are waiting for long I/O to complete, it makes sense to
> avoid holding locks for too long. However, if the folio is
> uptodate, we are likely only waiting for a concurrent PTE
> update to finish. Retrying the entire page fault seems
> excessive.

I think the idea is good, but the implementation is misplaced.
The check for folio_uptodate() should be inside folio_lock_or_retry()
rather than tampering with FAULT_FLAG_ALLOW_RETRY in its caller.

Similarly for your next patch.

> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/memory.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 0c740ca363cc..a2e4f2d87ec8 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4949,6 +4949,13 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  	}
>  
>  	swapcache = folio;
> +	/*
> +	 * If the folio is uptodate, we are likely only waiting for
> +	 * another concurrent PTE mapping to complete, which should
> +	 * be brief. No need to drop the lock and retry the fault.
> +	 */
> +	if (folio_test_uptodate(folio))
> +		vmf->flags &= ~FAULT_FLAG_ALLOW_RETRY;
>  	ret |= folio_lock_or_retry(folio, vmf);
>  	if (ret & VM_FAULT_RETRY) {
>  		if (fault_flag_allow_retry_first(vmf->flags) &&
> -- 
> 2.39.3 (Apple Git-146)
> 
> 

