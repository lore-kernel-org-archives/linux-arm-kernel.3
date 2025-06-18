Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E710C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 13:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wo041F93t/9xQdqS4Ovt8IZJ/Q+AOi1PvUChKnkds3Q=; b=p0C79urTDWH6vEZ5DZlC0TBPOL
	AVI9qUTjl+8EvYCZ4TpN4WkRI5TpZdEWcLolYz2H3g8MVtpC+Qup/P1NjYdKleYj8kCuL7QmXu69O
	js7ac6AxnQMJjx43bCgX18a8mE05//NRVvo1yyUumUy2sBsCiMV7yhUtcudpkcPce6pl8sV9N3ly7
	LaEjIIwraRDb6bLnMHobvGKjHOSSPZp39u8TSYTKhcsUWVLfqLU3kwFidhV7j0vodeQNslwhS3iy/
	EHUmR+3Fd4JpLjL57bgYVhMH+AIGrxcRqiJs0em3OMjWUrPpp6mmH87R20V1HK/ekEfuiZaQVJjJz
	v9yOp7bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRstE-0000000AJt7-2l4x;
	Wed, 18 Jun 2025 13:31:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRq2J-00000009mvA-11gA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:28:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E142D14BF;
	Wed, 18 Jun 2025 03:28:33 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AD3E3F66E;
	Wed, 18 Jun 2025 03:28:53 -0700 (PDT)
Date: Wed, 18 Jun 2025 11:28:45 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v3 03/13] arm64: debug: call software break handlers
 statically
Message-ID: <aFKU3RQZL76S96Yb@J2N7QTR9R3>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-4-ada.coupriediaz@arm.com>
 <15c103f5-fd7a-4960-b984-4055a745aa5a@arm.com>
 <5e7afdfa-1f03-4914-a58e-1dcb05c26199@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e7afdfa-1f03-4914-a58e-1dcb05c26199@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_032855_324126_5CAAC882 
X-CRM114-Status: GOOD (  26.72  )
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

On Mon, Jun 16, 2025 at 02:29:37PM +0100, Ada Couprie Diaz wrote:
> On 13/06/2025 07:11, Anshuman Khandual wrote:
> 
> > A small nit - s/break handlers/break point handlers/
> You are right, checking again I was using too small a character limit for
> the summary line (55), which is not relevant. I will write `breakpoint` in
> full, I wasn't happy about leaving it out !

FWIW, saying "software breakpoint" sounds good to me.

[...]

> > On 09/06/25 11:04 PM, Ada Couprie Diaz wrote:
> > > Unify the naming of the software breakpoint handlers to XXX_brk_handler(),
> > > making it clear they are related and to differentiate from the
> > > hardware breakpoints.
> > Unless absolutely necessary - could we please move these renames into a
> > separate patch in itself instead ? That will reduce the churn and help
> > the reviewers see the functional changes more clearly.
> Fair enough, I can move the renames to a later patch to avoid renaming in
> all the places
> that get removed in this patch.
> Would it make sense to combine it with the single step handler renames in
> this case, or would it be better to have two independent commits ?

TBH I think this is fine as-is and doesn't need to be split out. The
renames aid clarity, and the churn to early_brk64() is small.

[...]

> > >   void __init trap_init(void)
> > >   {
> > > -	register_kernel_break_hook(&bug_break_hook);
> > > -#ifdef CONFIG_CFI_CLANG
> > > -	register_kernel_break_hook(&cfi_break_hook);
> > > -#endif
> > > -	register_kernel_break_hook(&fault_break_hook);
> > > -#ifdef CONFIG_KASAN_SW_TAGS
> > > -	register_kernel_break_hook(&kasan_break_hook);
> > > -#endif
> > > -#ifdef CONFIG_UBSAN_TRAP
> > > -	register_kernel_break_hook(&ubsan_break_hook);
> > > -#endif
> > >   	debug_traps_init();
> > >   }
> > debug_traps_init() can be renamed as trap_init() and just drop this
> > redundant indirection. All applicable comments can also be changed
> > as required there after.
> I understand what you mean, but I would be tempted to not change it,
> with the following reasons :
>  - `debug_traps_init()` gets removed entirely in the last commit,
>  - having `trap_init()` in `traps.c` makes more sense than
> `debug-monitors.c` to me
>  - `trap_init()` ends up empty at the end of the series, it could make sense
> to simply
>    remove it entirely, given there is an empty weak definition in
> `init/main.c` already.
> 
> What do you think ?

I agree with your reasoning, please leave it as-is!

Mark.

