Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D582C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 10:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2doEA49glFV0jNYF7SY2cBfCmd9cgII4c/PhcaIuUs=; b=vgB1liqNdTyydhmpdE+HYaPR12
	nJcAwssZn7kkGKdIAEKbGBRUqnmAD/x9JSIlULKoRSk7+0cHRMbAYu+xfiM8kw4TaSNJnRkX8Y10k
	8YwhyTMmmqI39zfljVISGEcuE68i95qYYwhjR1xd4QEDXzumj7ErHGHorBuvAwyyD4l0161DsREif
	waAY0og4fNy3AypOaFrxNQQ8Ym0o0ppZEvUnYYqhfLsafTWqAs30prqhunvWGK/SA5AAYyYJXB4c3
	7ar2iQoIJpPgsjYWCdnuKE6SPYSqxyd56bO+72ktrkbxjKqCubzZJEmJyA3E5HZ/62Cj/9TCYcPG0
	87UGFtvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaOQ-0000000FUqO-2Yhg;
	Thu, 29 May 2025 10:21:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaIH-0000000FUL3-2YMQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:15:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC45C49F2F;
	Thu, 29 May 2025 10:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7728CC4CEE7;
	Thu, 29 May 2025 10:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748513724;
	bh=d1L0SK9PUjm32cIbPjaT405KKRPlaLMETFf/RHnKNQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKUXlBY/TRwavbHkTS5JUwfmWQO8UonSiABztZ1lQY0ULSFCk5oq7YFOBLzIG0HP2
	 Ah91wLuBaGPGY11ZccD+BCuFsnMYLNeWHq9lf551IW12zJl56fFj49KpV4/gaQV2kL
	 TetxKzTYOmUzUR8SRfPsk5Ynwe0aLTCDUe1HuQEuUMNF8iuO0+9DUdPJEvOSX7rMQb
	 FDYyOW1nMxXVGINuHCTP0E+xjb3JWiRox6bNHdF6Bq2ai9wwOGBMzvLM098JSCcNvO
	 wFBiIpVcSVXM7wIsriQXm5het6SeP1JNRG9grar5vDr8GV2cDh+X0yEMIJSLS52HfK
	 LfHwE2VUXwsTw==
Date: Thu, 29 May 2025 11:15:20 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 11/11] arm64: debug: remove debug exception
 registration infrastructure
Message-ID: <20250529101520.GD29082@willie-the-truck>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-12-ada.coupriediaz@arm.com>
 <20250521093817.GA20245@willie-the-truck>
 <7d856e23-2697-4ba1-ab80-a658a9b84d9a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d856e23-2697-4ba1-ab80-a658a9b84d9a@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_031525_679956_5E88EC4A 
X-CRM114-Status: GOOD (  21.38  )
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

On Wed, May 28, 2025 at 05:41:43PM +0100, Ada Couprie Diaz wrote:
> On 21/05/2025 10:38, Will Deacon wrote:
> 
> > On Mon, May 12, 2025 at 06:43:26PM +0100, Ada Couprie Diaz wrote:
> > > diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> > > index 50d7a6a75f45..ce20f46e08cb 100644
> > > --- a/arch/arm64/kernel/traps.c
> > > +++ b/arch/arm64/kernel/traps.c
> > > @@ -1101,29 +1101,5 @@ int ubsan_brk_handler(struct pt_regs *regs, unsigned long esr)
> > >   }
> > >   #endif
> > > -/*
> > > - * Initial handler for AArch64 BRK exceptions
> > > - * This handler only used until debug_traps_init().
> > > - */
> > > -int __init early_brk64(unsigned long addr, unsigned long esr,
> > > -		struct pt_regs *regs)
> > > -{
> > > -#ifdef CONFIG_CFI_CLANG
> > > -	if (esr_is_cfi_brk(esr))
> > > -		return cfi_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
> > > -#endif
> > > -#ifdef CONFIG_KASAN_SW_TAGS
> > > -	if ((esr_brk_comment(esr) & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
> > > -		return kasan_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
> > > -#endif
> > > -#ifdef CONFIG_UBSAN_TRAP
> > > -	if ((esr_brk_comment(esr) & ~UBSAN_BRK_MASK) == UBSAN_BRK_IMM)
> > > -		return ubsan_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
> > > -#endif
> > > -	return bug_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
> > The early bug handler is now only called if the brk immediate matches,
> > but I couldn't spot any problems with that.
> 
> Correct, as far as I can tell the behaviour is unchanged for a fall-through
> :
> `bug_brk_handler()` would have called `report_bug()`, which would
> not have found a non-BUG BRK and bailed early with BUG_TRAP_TYPE_NONE,
> leading `bug_brk_handler()` to return `DBG_HOOK_ERROR`.
> 
> Now, we would return `DBG_HOOK_ERROR` anyway if it's not an immediate we
> know how to handle. (This also seems to match better with the expectations
> of the comment in `is_valid_bugaddr()`, in `kernel/traps.c` !)
> 
> Happy to have my logic checked or add a mention in a commit message
> (either this one, or patch 02 ?)

It wouldn't hurt to have a note there, but I don't mind either way. I
just highlighted it to check that we agreed.

Will

