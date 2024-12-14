Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517B1E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 22:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qo9DRUyKRrqtLyRuNXYM99TkYAh0n7GpnTKVcYgBdPE=; b=jjIFOReVk0pQ71ITgc4KFbSXKu
	rSNwxXB3wzoycnARQW0jb2acZbLJA2KfLjrjj+O7tE8kTzh4hnktaisZAQsWUgb8NIgIogI4GGxyF
	AzNw/gOkA/bB+7kWMBi3LjyTorPWeyDkD8JQStiIOWAhe3oucD0joev18KLvM7FTxGwrqeqkzQVBJ
	Kmp/f0AZR8Mn/0XihJqLHWlXbUSYeApJhrOu/pGymhqalctbPNH4u2xmyDqgNxEUPEsMGhYFYTfgf
	59m1u/a/IBQp85oNtR36flb+G6frpShu9IFvYKwtsnJUJlBoh+jKo240CPQrSwjLjDvf49EIk+Jra
	SdNEw9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMaN2-000000072Cd-008v;
	Sat, 14 Dec 2024 22:12:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMaLy-00000007274-0fnW
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 14 Dec 2024 22:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Qo9DRUyKRrqtLyRuNXYM99TkYAh0n7GpnTKVcYgBdPE=; b=FPP5zK8ViSCb+8pbD6ArAAmyiH
	5tbsuw6oSYj65D4t5veoY7adMhxKFB+WgfTWDVJO6RSojy1lEUw9xUz8L8QRlbtz5dnQSi5XxMcdt
	6Ff8bEnof3eNQ9CAbrH+Yb0z23MJSpEmAMZe4iU6on3G7ZyYYSTWWEcP5qzywn7bC/HXl2oduQes/
	RqBpxyXKcYfPIe3zo1ZYsTnleFm0OLJfvW7SzyxVyFsRaKN4mrB7K3332MojFURnVQ4FVivEMLjjR
	OEvWiSHUz4gM4MSrYfTBe+OWUyE0rlNy/yBYHKTJYbdUJEu38qV2Sfqjgz8BdUoHPhaN36eG3EKuj
	/1Tq73AQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tMaLs-00000005RuX-0hl1;
	Sat, 14 Dec 2024 22:11:08 +0000
Date: Sat, 14 Dec 2024 22:11:07 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Arnd Bergmann <arnd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 2/4] ARM: Disable HIGHPTE on PREEMPT_RT kernels
Message-ID: <Z14Ce7cziCn5Fluq@casper.infradead.org>
References: <20241210160556.2341497-1-arnd@kernel.org>
 <20241210160556.2341497-3-arnd@kernel.org>
 <CACRpkdZaoD2vqbCi1AFUa6mF2_=c3Nu4R0CvxFAep0VMgtMtOQ@mail.gmail.com>
 <20241211152257.Igx3aT2Y@linutronix.de>
 <CACRpkdbYU=Txm0zUWDWvNXA0JHRNGpy1ccy0zQdiBb2Ya+UBFA@mail.gmail.com>
 <Z1v6XcaSK97Sa9Tz@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1v6XcaSK97Sa9Tz@shell.armlinux.org.uk>
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

On Fri, Dec 13, 2024 at 09:11:57AM +0000, Russell King (Oracle) wrote:
> On Fri, Dec 13, 2024 at 01:27:00AM +0100, Linus Walleij wrote:
> > On Wed, Dec 11, 2024 at 4:22 PM Sebastian Andrzej Siewior
> > <bigeasy@linutronix.de> wrote:
> > > On 2024-12-11 14:29:29 [+0100], Linus Walleij wrote:
> > > > So fast GUP is supposed to be lockless, and should just not
> > > > have this problem. So it can't be addressing gup_fast_pgd_range()
> > > > right?
> > > …
> > > > I'm more asking if HIGHPTE even acquires a spinlock anymore
> > > > as it is supposed to be "fast"/lockless. If it does, it is clearly violating
> > > > the "fast" promise of the fast GUP API and should not exist.
> > >
> > > This is lockless on x86. The problem is ARM's
> > > arch_kmap_local_high_get(). This is where the lock is from.
> > 
> > Aha that calls down to kmap_high_get() that that issues
> > lock_kmap_any(flags).
> > 
> > But is it really sound that the "fast" API does this? It feels
> > like a violation of the whole design of the fast stuff.
> 
> If there's no way to do it lockless, then it has to take the lock.

Well, no, it's allowed to fail.  It could trylock and fail if it can't
get the lock.

