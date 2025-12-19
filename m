Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36950D78794
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0mjmGpOW60lNIbtFI+r1yzZWjFojlQMo6AcrdT+eeU=; b=Rb7JBrjduEx7iNL+RJnndBrflg
	7fmovg9POp8Y1UEcogsgkliHxeHRbOYQ4sAizsQtBcJ4yecrkUJoLcENVuf/LTi26cVqA6b5sRYVq
	qcjtyXfG3dp5l3Bunx0B0BhnC/gJR/77G+U73/geAss67GuRsv6cJmFbkct3nMvwTpGzzAbkctUo1
	xL60cd4mTwvmMsHGl89ad/sLu63H+L6Nbuiq7qioyw8xQiBiJpsrRMwo2f5otUY+L1xExS7lsXGrl
	2+b4hR0Q41imJhhdA54kJ7OLI4VABmEn01CO6c6vSrB0IU6TFHN5Qlubzg4b2J3kPSvp+I/ZtnR+8
	jXd1P9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWd2v-0000000Acbf-336T;
	Fri, 19 Dec 2025 16:09:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWd2u-0000000AcbI-2hMb
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 16:09:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z0mjmGpOW60lNIbtFI+r1yzZWjFojlQMo6AcrdT+eeU=; b=cQPXOwIdyvnpu/TFP07Kw09C6Z
	Zgy1qKTMnuFS26B8P+aXQyJg4yZg3HLAkX0xEcQUFb9VBegbEKRjkggUWliQXDkfWH05DkjXRjOzA
	C4BLRuOUlXgUUmKsfkfx6kx3zmv2NSgsK+y1W8xs4lHqP0rFqJVj1TuUoQKMEBLGbF3mTb79Q6zEJ
	qP6HF/hiSnTrGdltfke63GdUe/UA+lwz6mkGqCjTkGmeZojrYwKo2MrL2Q1VmR3IzbxpjnDBUzzdf
	Cfjw6depJXCBUEYA599KPGQpKSdlZIdHm/i8FF7iqSZ1+vNinkRhiBYj74IVjkx4IUl5Mq6kSTNQy
	n2YND57A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWd2p-00000007n7R-3Bk1;
	Fri, 19 Dec 2025 16:09:31 +0000
Date: Fri, 19 Dec 2025 16:09:31 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	akpm@linux-foundation.org, david@kernel.org,
	catalin.marinas@arm.com, will@kernel.org,
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
	baohua@kernel.org, dev.jain@arm.com, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] mm: rmap: support batched checks of the
 references for large folios
Message-ID: <aUV4u9pOHxvQiDcP@casper.infradead.org>
References: <cover.1766121341.git.baolin.wang@linux.alibaba.com>
 <24b9d33acad627997febe9b61d398fc53739a333.1766121341.git.baolin.wang@linux.alibaba.com>
 <x2s3l56rqwgcpkhpu77pjt65tfwgmchuy4fuyrj7h7uag5gja3@c3jbws4quxrd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <x2s3l56rqwgcpkhpu77pjt65tfwgmchuy4fuyrj7h7uag5gja3@c3jbws4quxrd>
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

On Fri, Dec 19, 2025 at 10:47:52AM -0500, Liam R. Howlett wrote:
> > -#define ptep_clear_flush_young_notify(__vma, __address, __ptep)		\
> > +#define ptep_clear_flush_young_notify(__vma, __address, __ptep, __nr)	\
> >  ({									\
> >  	int __young;							\
> >  	struct vm_area_struct *___vma = __vma;				\
> >  	unsigned long ___address = __address;				\
> > -	__young = ptep_clear_flush_young(___vma, ___address, __ptep);	\
> > +	unsigned int ___nr = __nr;					\
> > +	__young = clear_flush_young_ptes(___vma, ___address, __ptep, ___nr);	\
> >  	__young |= mmu_notifier_clear_flush_young(___vma->vm_mm,	\
> >  						  ___address,		\
> >  						  ___address +		\
> > -							PAGE_SIZE);	\
> > +						nr * PAGE_SIZE);	\
> 
> Did you mean nr * PAGE_SIZE here?  I think it should be __nr or ___nr?
> I think this nr variable works because it exists where this macro is
> expanded?

Yes, this should clearly be ___nr.

> I am also not sure why you have ___nr  at all?

It's a macro cleanliness thing.  Imagine that we have a caller:

	a = ptep_clear_flush_young_notify(vma, addr, ptep, nr++);

If you have two references to the __nr macro argument, then you end up
incrementing nr twice.  Assigning __nr to ___nr and then referring to
___nr within the macro prevents this.

That said, I'm not sure why ptep_clear_flush_young_notify() needs
to be a macro instead of a static inline?

