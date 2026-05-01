Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EA7CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CybRlbN4CxbIfeNSZrydRrLn1TjflMMzYAXjMcpWY4=; b=NJlXDFnB5oIULOIaB6UbzkA8bR
	wl6Kjq05S/Ge9gfo5nVFUaucN8LvBfaPkJquow9QYk5oWWcvICbGGog0mQksi2RFM7j7JCsDqZk51
	ALYXKwrLvkrEUAaSnj0KxPoJYfeVj9u3MA5LmjDYcWGYQ2d+oYLkNptbpjLY9/WpqtbFTk5TWNKnQ
	iu26MOHRfDNRhCpMuXISZ6GZLgmkXOzYfMPSVuyW/qxl2VSKadUdjDI1TTMaWwkx38ul+Hk8tGAND
	ChYe6+9A1GYHCQQ/iqTmEBcMrwx416DbI2xt/EXhtc/336d+bS8SoBNUFBCB9Ecp5K/W7y419ATdX
	whbphVYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqSN-00000007OPJ-48WA;
	Fri, 01 May 2026 16:11:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqSN-00000007OOr-0fIe;
	Fri, 01 May 2026 16:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+CybRlbN4CxbIfeNSZrydRrLn1TjflMMzYAXjMcpWY4=; b=S+PrOaTuYpMS9yVFL/SRQq4G+T
	EDyv1/76Ou/0SIA3LL0ouPq9EWPMO5l4Z+1N0ptLnqAYO0BqCC4Xm3PO+wTeHKuBAB3IahTX8uA6n
	a7trLSaMY2QWSwvrG+FRQkKWQ18oVU4G7Xnue+id4br5moG5PbXCSji7QEubPHOv5XAVHxDx6zgXt
	wJ7FY6JrVfHfYKvW2+QN3fwPrQPGIgx3RMlpFCjGDCQcXCHPoN+y5K0Lw5lnU6sBd7VbJb/qhMWfh
	UTsBtEsZO5IdNigyrAUUvt2/YmNpV3JbBPOkDvUuz1JBSyohrXzO8wluq9Nh5ga/qGIKeRzyOIxxx
	5YZRXdig==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqSF-000000091b3-3rae;
	Fri, 01 May 2026 16:11:03 +0000
Date: Fri, 1 May 2026 17:11:03 +0100
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
Message-ID: <afTQl12XcXVnku9J@casper.infradead.org>
References: <20260430040427.4672-1-baohua@kernel.org>
 <20260430040427.4672-5-baohua@kernel.org>
 <afNMkqwxC00OT134@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afNMkqwxC00OT134@casper.infradead.org>
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

On Thu, Apr 30, 2026 at 01:35:30PM +0100, Matthew Wilcox wrote:
> On Thu, Apr 30, 2026 at 12:04:26PM +0800, Barry Song (Xiaomi) wrote:
> > If we are waiting for long I/O to complete, it makes sense to
> > avoid holding locks for too long. However, if the folio is
> > uptodate, we are likely only waiting for a concurrent PTE
> > update to finish. Retrying the entire page fault seems
> > excessive.
> 
> I think the idea is good, but the implementation is misplaced.
> The check for folio_uptodate() should be inside folio_lock_or_retry()
> rather than tampering with FAULT_FLAG_ALLOW_RETRY in its caller.

Actually it needs to be a little more complex than this.  We
sometimes wait for writeback while holding the folio lock, and
that's a similar latency to reads (or with cheap NAND, maybe longer!)

So I think the test needs to be:

	if (folio_test_uptodate(folio) && !folio_test_writeback(folio))


