Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32088CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 20:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8eA5erpVUaElEed48rJS2wGTR5+Yv1nLd38ESSS2Rw=; b=muFy5TGoi7/3rVTFvO7ES7k7A5
	TFwR6aVaFzSbon/tyQrl9xJwSD1MhPgM5pfEabpvMkxscbxIbLgj3Iyg0NC/aX3mMAOU3LiuTP7ni
	/+CmfItcWoAKB54ci0QOemFHFXyO9lxOvkaj0Hm30jE/s+QHMr2uNyqH4NSgfqyi2/n/HFE1bb3Rt
	QLdwfDKhetuaVt9Ms4kDPWfJC47i0OcRvXk2eF2LqvOh9E9ChCS5btOCrL4TQb1Vqb+debqrOsbqf
	43OUNjxJpOrL8ldTWXGJ9OZbBD8+inj0nt11FUk/o+wECNWsmIxsI8UQrsMuEHjaKE3a2uZagCezi
	uWUl43dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbP6m-000000049NZ-35JN;
	Sun, 21 Jun 2026 20:49:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbP6l-000000049NL-1qGs;
	Sun, 21 Jun 2026 20:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M8eA5erpVUaElEed48rJS2wGTR5+Yv1nLd38ESSS2Rw=; b=g6iAM/3xDdWgV5X+yh4FkmLv62
	OiHp0rJWKrS0azBEgV4lUi6tf73QIx3b1EfxkJWLE9+0vYHZwchHgBudDH0pHDxxXgTjwrWdu/mct
	Pv33b+2kvV7VjO9v7r9ZJhg42qZrzl0nH7+5lsv84CGZePPxYtNzgtc+jHFw/OqqVr5gfB6dJeyht
	Ta+Y3SqdvDLqXkzUCijftXQvtQR1xKMpDX3P8Pi4bp33DePJ+q2Ae6ol72ij7EXyHBJ2UsHVBJ0x9
	+qUBkAxK1+zVPdKdmOAH0oG08P8SIzHjxBxu4r6NIyihQBFDoDV5qvDZCRzyYtm8IkqtseF10HUAj
	vqUbW0Ug==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbP6X-00000002ysn-1JeK;
	Sun, 21 Jun 2026 20:49:21 +0000
Date: Sun, 21 Jun 2026 21:49:21 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Barry Song <baohua@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, akpm@linux-foundation.org,
	linux-mm@kvack.org, vbabka@kernel.org, rppt@kernel.org,
	mhocko@suse.com, jack@suse.cz, pfalcato@suse.de,
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com,
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org,
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com,
	bhe@redhat.com, youngjun.park@lge.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <ajhOUdbWsswgQyl2@casper.infradead.org>
References: <5zdaa5uv5oj27q3taopl3amops57ouxgyfsdveudz4ovmbdw7z@6lwrlyvmhcp2>
 <CAGsJ_4yKxg1QugcsJi3WD0KVGJKe-zXycgm5D6cRi9vWtNcpDQ@mail.gmail.com>
 <ag4h87CBd-gph9zX@casper.infradead.org>
 <CAGsJ_4zA8afu0xXy0WS+tMe-eesDX1W6UBmfAsuouUpcAgK8JQ@mail.gmail.com>
 <ag4kj84EcKqamdB-@casper.infradead.org>
 <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
 <CAGsJ_4xC5LdhuoWV1=tK-RZ5rkjc8aOKOkmb1L_8BG_3gtJhDg@mail.gmail.com>
 <ahB6QyHgYq8ksj65@lucifer>
 <CAGsJ_4zxLvZ01i19vdo0xA47T1hxa1VRYvxLmiDhy5q1GDKPRg@mail.gmail.com>
 <CAJuCfpHTxaU4KdNmefU7C7cWZSLCFDLPdUrnqV6yzxzN+8RQ0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHTxaU4KdNmefU7C7cWZSLCFDLPdUrnqV6yzxzN+8RQ0Q@mail.gmail.com>
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

On Sat, Jun 20, 2026 at 04:48:57PM -0700, Suren Baghdasaryan wrote:
> Just checking in on the followup plans. IIUC the RFC mentioned will
> try to implement the solution we discussed at LSFMM: splitting
> VM_FAULT_RETRY into two flags - one for retrying under per-VMA locks
> and another one to fallback to mmap_lock.

I continue to hate this idea.  I don't believe that those who were
pushing for it have ever tried to understand the whole fault path.
It's utterly byzantine.

I defy anyone to make sense of this:

        /*
         * NOTE! This will make us return with VM_FAULT_RETRY, but with
         * the fault lock still held. That's how FAULT_FLAG_RETRY_NOWAIT
         * is supposed to work. We have way too many special cases..
         */
        if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
                return 0;

        *fpin = maybe_unlock_mmap_for_io(vmf, *fpin);
        if (vmf->flags & FAULT_FLAG_KILLABLE) {
                if (__folio_lock_killable(folio)) {
                        /*
                         * We didn't have the right flags to drop the
                         * fault lock, but all fault_handlers only check
                         * for fatal signals if we return VM_FAULT_RETRY,
                         * so we need to drop the fault lock here and
                         * return 0 if we don't have a fpin.
                         */
                        if (*fpin == NULL)
                                release_fault_lock(vmf);
                        return 0;
                }

Wed need to simplify the fault path, not add additional complexity.
Josef has said he wouldn't've done the lock dropping had we had per-VMA
locks.  We should rip it out.

