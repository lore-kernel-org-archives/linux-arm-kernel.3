Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F6BCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47DrDT23mvenUht8WeFSn/mPyxvnjTBwgGz6uB5i8gc=; b=vrqqBZdt8tD/AGo7QkoVU0olqF
	aBX7PoXN5o/ea6jFjKyQiRQoFzBCN58h4Z2w0Ni5OGxWxnxbRDoYRTKfd77RgDn3oXxmGUBul+L+a
	xx30GUoLwuuCDweqYrqqK6lIpKs9XRfCVAlW2mY9o6s7vsI1ui9b/8PTFYn5WFqKQihGAeRdVMdYL
	0d1+1q13d18BvgYWsfvjLpyWE59t8EPucih+iWoRoq7ghdXxs2NpI4GUsQmUlMxjY+e3/IFnLZ5tT
	SYpzEYWvFVnWtFia6U79GJlZbDxzOKm2GsjOtUmpxfK5TGQKWJObm9WIxlkLI5obo4oiKo57N4O+Z
	AlMN4qeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Px2-00000003WPc-3N47;
	Wed, 08 Oct 2025 08:55:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Px0-00000003WPA-3loy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 08:55:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87275434B3;
	Wed,  8 Oct 2025 08:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B61C4CEF4;
	Wed,  8 Oct 2025 08:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759913710;
	bh=eyr6gDi37Ru8nuj21CkAi6nqiQrd/Us5xWlLiGHLy2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IfZztZSNbIcLHWEXxmGMy7WBI7I5FnPLuHesKunLdfxwEVd7YFIJ/4HujdZFo74+m
	 mQArzKq0O8VkfyQ0NaHGmQIAg1rAaJj4yCyGnsJCsPWR/PgLeD8/uSeetV6EMkClQ0
	 /Ih7G0bIn9npYMYVfLHHazcjL9kB9XlFPX2029pGTi7NNohqpQ9FZoxWznon7ATN+Q
	 plbj5FBms3j8zXWeUlMn9TK7+eZ4fdgKRyZLrqqTmes2csL8h7o8BbZhJU166YF95S
	 4NoCKzuHrq+ijolrj7C/xeIQu4mfXyBCf9DOn0ZKJrZEdLiXNpFvJcX8k0ZRBKjypN
	 V5fwjJIW3Uv2g==
Date: Wed, 8 Oct 2025 09:55:05 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2] arm64/sysreg: Fix GIC CDEOI instruction encoding
Message-ID: <aOYm6SUnPo1VEvdM@willie-the-truck>
References: <20251007102600.879337-1-lpieralisi@kernel.org>
 <aOUsjRkq4DTcLujW@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOUsjRkq4DTcLujW@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_015510_982702_72AEB01A 
X-CRM114-Status: GOOD (  19.78  )
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

On Tue, Oct 07, 2025 at 04:06:53PM +0100, Catalin Marinas wrote:
> On Tue, Oct 07, 2025 at 12:26:00PM +0200, Lorenzo Pieralisi wrote:
> > The GIC CDEOI system instruction requires the Rt field to be set to 0b11111
> > otherwise the instruction behaviour becomes CONSTRAINED UNPREDICTABLE.
> > 
> > Currenly, its usage is encoded as a system register write, with a constant
> > 0 value:
> > 
> > write_sysreg_s(0, GICV5_OP_GIC_CDEOI)
> > 
> > While compiling with GCC, the 0 constant value, through these asm
> > constraints and modifiers ('x' modifier and 'Z' constraint combo):
> > 
> > asm volatile(__msr_s(r, "%x0") : : "rZ" (__val));
> > 
> > forces the compiler to issue the XZR register for the MSR operation (ie
> > that corresponds to Rt == 0b11111) issuing the right instruction encoding.
> > 
> > Unfortunately LLVM does not yet understand that modifier/constraint
> > combo so it ends up issuing a different register from XZR for the MSR
> > source, which in turns means that it encodes the GIC CDEOI instruction
> > wrongly and the instruction behaviour becomes CONSTRAINED UNPREDICTABLE
> > that we must prevent.
> > 
> > Add a conditional to write_sysreg_s() macro that detects whether it
> > is passed a constant 0 value and issues an MSR write with XZR as source
> > register - explicitly doing what the asm modifier/constraint is meant to
> > achieve through constraints/modifiers, fixing the LLVM compilation issue.
> > 
> > Fixes: 7ec80fb3f025 ("irqchip/gic-v5: Add GICv5 PPI support")
> > Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Acked-by: Marc Zyngier <maz@kernel.org>
> > Cc: stable@vger.kernel.org
> > Cc: Sascha Bischoff <sascha.bischoff@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> (unless Will sends another pull request before -rc1, I'll pick this
> patch shortly after)

I'm not planning to send anything until the -rc3 timeframe now as I'm
going fishing for a couple of weeks :)

Will

