Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58620C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 13:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjHSStsJDP//mYX9uSW/6M2wBGGfjxvXziMH/pU21KY=; b=MfV4IULs7PQMRwZmVMSJpi9X9d
	eqAo9wkNgHgO6thZwfrYu5XEDKT8ZOvgaiBhz8ht8sBOPs8Sg+7Bu9j7Y5MQmUyIHn6B8eDSTwXD3
	OtEDSmIWhdwZCpiJyZlh3P9sYyxZbsvvNt1swt2itX3Pfy2UmG+C7yTX0SzoNwEb67H0gnZMXem8r
	IUleDYr9j8kE74uOnpjZv4P+ETSyWhnCSuhVBx18AEVzYNwM7S8i5+cLbYIFyHuuoXFX0GBb2iyZs
	a46rqdBAfU8iNb2uAEQSNHmRBU02ZxIIJIF46DDgQYXIdnrjx6GQyKOz0b27O/stdSDUsp1qt6uOd
	aVE8l7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiWD-00000002OkG-0v3k;
	Fri, 17 Jul 2026 13:22:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiWA-00000002Ojb-0dRJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 13:22:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F3231476;
	Fri, 17 Jul 2026 06:22:11 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 060EE3F7D8;
	Fri, 17 Jul 2026 06:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784294535; bh=ZpoCI9ofx2p/ua+KhEMRhGi82OXdAYlebI0ztnF7GEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6AyEy3StxJcwPLr/m61NkJzXizkRu07Wyuz+kg41HvvKbPRzZqm+z8Wm0ev8hoxp
	 OyjIi/WvIUkh3uwZOORa4hYvZ6Idk9ltbu1Ve2kAUkf/IiuFVW4JH1CDAgs8CstcX0
	 KFIJXYHoTIb3Gq6WTIH4HCNgywrD0MHc3LdKI6H4=
Date: Fri, 17 Jul 2026 14:22:07 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
	maz@kernel.org, oupton@kernel.org, tabba@google.com,
	will@kernel.org
Subject: Re: [PATCH 17/18] arm64: fpsimd: Move SME save/restore inline
Message-ID: <alosf_mrqeX668xC@J2N7QTR9R3>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-18-mark.rutland@arm.com>
 <ahWpST4K3rbMbjWK@J2N7QTR9R3>
 <08e5ce52-be74-4fc5-a0b2-8f405a5eff99@arm.com>
 <ahW8Eba3SNqfVDdk@J2N7QTR9R3>
 <ahXMkPEpgaZQf_Nk@J2N7QTR9R3>
 <ahlYC2qgqzNQxggP@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahlYC2qgqzNQxggP@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_062218_231783_A19A949C 
X-CRM114-Status: GOOD (  20.40  )
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

On Fri, May 29, 2026 at 10:10:35AM +0100, Mark Rutland wrote:
> On Tue, May 26, 2026 at 05:38:40PM +0100, Mark Rutland wrote:
> > On Tue, May 26, 2026 at 04:28:17PM +0100, Mark Rutland wrote:
> > > On Tue, May 26, 2026 at 03:39:56PM +0100, Vladimir Murzin wrote:
> > > > I suspect you are intentionally not using "Ucj" constrain to limit register allocator,
> > > > if so I'm wondering why?
> > > 
> > > Thanks for the suggestion; that was ignorance rather than intent.
> > > 
> > > I was not aware of "Ucj" as it doesn't appear on the public GCC
> > > documentation:
> > > 
> > >   https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html
> > > 
> > > Looking at the machine description file, that's marked with '@internal',
> > > so IIUC GCC folk don't seem to expect/want people to use it. That said,
> > > LLVM seems to support it.
> > > 
> > > I'll go check that all relevant toolchains support this, and poke GCC
> > > folk to see if they're happy to promote that to a public constraint.
> > 
> > GCC folk seem happy to make this public, which is great! I'll cross-link
> > a thread here if/when patches appear.
> 
> Alex Coplan sent a patch for GCC to make this public:
> 
>   https://gcc.gnu.org/pipermail/gcc-patches/2026-May/718560.html

Just for posterity, that was merged in GCC commit:

  090f3e78a10b5ce14fd80de82d3e8dda8af1cae6 ("aarch64: Make Uc[ij] constraints public")

... which can be found at:

  https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=090f3e78a10b5ce14fd80de82d3e8dda8af1cae6

... so we should be able to use that in future once our minimum
supported toolchains are GCC 14.1.0+ and and LLVM 18.1.0+.

Mark.

