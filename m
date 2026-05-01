Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32C5CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 14:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWaEOZ6T8RZshC5VNeX+VR+c38seOstsZgFtVZK1Yb0=; b=2xcEc8e6jp4e6blregbk7cAjZL
	jrR+sZhfyCHweNBgtRiIKdX2GcN3N1I1LsOAKxnz8EfZrWMVVmPlGvuhCdlHdJCNi7KzhAnajgjat
	STd7CeS/9tuCPy21ZFqtWy8rR5FKt+NycInEFD2zVtv49p7t/0e4ZkoM0xeNj10BZcitoS1lmPMyS
	fQTt/ntF7LNL5qUh+ZKC/QZCawxcfEAucWUUIzEiA+1rTYGSXSz8v4/aQXk2Rx8WrVEJjDImSy7bq
	AcK0o3M1Wg0Am6KVMhJK2NkaPyalaXJj7LC46Nlzkc/mGg3Io06u5rJ8MkR4ikBrow9uq5YrZGQnc
	vQAX02bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpId-00000007Iuy-04Sw;
	Fri, 01 May 2026 14:57:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpIc-00000007Iui-1qUc;
	Fri, 01 May 2026 14:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GWaEOZ6T8RZshC5VNeX+VR+c38seOstsZgFtVZK1Yb0=; b=Er8GF8z4i4fcdoqldcSz6UdIrK
	0uV2fMmb401OPsbWUDQlEgY0WImYvRoaOS/51Kt7cci4PwM0IwWZmDRUbGXw7O9IkTUTcXx4Dq2Om
	1ySnKP5ZPsmA0cdTKwQEUsbejJKOkDxp+xsnqOc9et7bCG9WzZFKFYNxcz4UjijcH9lNIaYGg9axV
	D8CvZuRnVnBvGs0WeFCpwaRxMrcj+ZmM+kVA2Q+aDmR35tDfpqtDlNjfzVDU0ieNT7dT3nkuFY8KO
	oBaeuIlQkfSbM8D3+gtqA/Kl4BULEQcG2OPtDBswRpN88NbjoIlZE7bl29JItAlrzNVWRNazfWERT
	lB1uWyaw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpIN-00000008wbR-3iIK;
	Fri, 01 May 2026 14:56:48 +0000
Date: Fri, 1 May 2026 15:56:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <baohua@kernel.org>
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
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <afS_L-5XeWIldTXA@casper.infradead.org>
References: <20260430040427.4672-1-baohua@kernel.org>
 <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
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

On Fri, May 01, 2026 at 06:49:58AM +0800, Barry Song wrote:
> 1. There is no deterministic latency for I/O completion. It depends on
> both the hardware and the software stack (bio/request queues and the
> block scheduler). Sometimes the latency is short; at other times it can
> be quite long. In such cases, a high-priority thread performing operations
> such as mprotect, unmap, prctl_set_vma, or madvise may be forced to wait
> for an unpredictable amount of time.

But does that actually happen?  I find it hard to believe that thread A
unmaps a VMA while thread B is in the middle of taking a page fault in
that same VMA.  mprotect() and madvise() are more likely to happen, but
it still seems really unlikely to me.


