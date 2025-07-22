Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EAAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kMb9UGDdGa1FC5EIBOAuw/B/aFVLo54iG09Jzjx0Mg=; b=RuvPItJvbe7eSg3P9eAYJlP/av
	AcuA89+E9izouZ+omDWl3iqPPYzTRCqeStfU/68EmTuTCqT2KzX5lMCNmSkX7MZ8e9PqEbmVN6GUu
	QIlvzxUocXL1Tq82O1BiisogQe0LRaPShbwfXsRzBp5+kvul/jJTefPnSQPpGUdt5WIPsP4exHoBJ
	SrEno1O1zmQL7x6LvpRQAbhv3Gwytcqxzw7cvHazZJLCzLrY73CAo/I5qvHYAw8it3w19iIRpbQCP
	+C3NhbRMJuB3gTdd9w99BfEzk77GrZyuQifiuAhKA1HhGqHi2/UsBwh1dQRwYlQ9WkKv9CiPBwgb4
	GpzL4yrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFSz-00000002xn6-074q;
	Tue, 22 Jul 2025 16:03:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEnP-00000002qvK-08Sy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 15:20:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 737E544609;
	Tue, 22 Jul 2025 15:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4311C4CEEB;
	Tue, 22 Jul 2025 15:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753197646;
	bh=0jaOz64C0knyg+jyXmhIhsVE2Ax3ezX3vVfN6kAhc2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oEEApmZ0eliq4DaZcH38Z6gf4frrJzmMJHLNplw5axw3rytNDazsOMwRGSM7+BIH0
	 abdZtiCDmhhHZvqXEHClyKsing7RE6OdIPpE/VtjyIaUqsl4frvqyWv5c9XMjiOWRg
	 VqY+OaN01lct86gC31Jcsp5d+CJ/wiVYf4mJ+2zILnQv8nIXmFLpaz8ZLJ/U/MHuUW
	 piAET6FMX94BZzZNi62hYd/ASm6nVyAiphZXm/sTR9iSw2672PUA8rGN+PNF0E/eHS
	 GH/ezcm7GhLRTQ6oIZQmim55QOUKWvvE8hMJFg4xfDO/p8ircPGNUBCdVv47+DApbX
	 PMGGDLlpmSCzA==
Date: Tue, 22 Jul 2025 16:20:42 +0100
From: Will Deacon <will@kernel.org>
To: "Prundeanu, Cristian" <cpru@amazon.com>
Subject: Re: [PATCH] arm64/entry: Mask DAIF in cpu_switch_to(),
 call_on_irq_stack()
Message-ID: <aH-sSqC177IM-nbi@willie-the-truck>
References: <20250718142814.133329-1-ada.coupriediaz@arm.com>
 <82AA504A-E3D8-479E-A625-306004E1850F@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82AA504A-E3D8-479E-A625-306004E1850F@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_082047_094348_EBEBAC6F 
X-CRM114-Status: GOOD (  17.67  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jul 21, 2025 at 09:42:23PM +0000, Prundeanu, Cristian wrote:
> On Fri, Jul 18, 2025 at 03:28:14PM +0100, Ada Couprie Diaz wrote:
> 
> > Completely mask DAIF in `cpu_switch_to()` and restore it when returning.
> > Do the same in `call_on_irq_stack()`, but restore and mask around
> > the branch.
> > Mask DAIF even if CONFIG_SHADOW_CALL_STACK is not enabled for consistency
> > of behaviour between all configurations.
> >
> > Introduce and use an assembly macro for saving and masking DAIF,
> > as the existing one saves but only masks IF.
> >
> > Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > Reported-by: Cristian Prundeanu <cpru@amazon.com>
> > Fixes: 59b37fe52f49955791a460752c37145f1afdcad1 ("arm64: Stash shadow stack pointer in the task struct on interrupt")
> 
> Confirming this fixes the spontaneous reboot previously observed when
> enabling both pseudo-NMI (irqchip.gicv3_pseudo_nmi=1) and shadow call
> stack (CONFIG_SHADOW_CALL_STACK=y). Tested both on kernel 6.16-rc7 and
> legacy kernel 6.8 where the issue was initially observed.
> 
> Tested-by: Cristian Prundeanu <cpru@amazon.com>

Ah, I hadn't appreciated from the cover letter that this was fixing a
real issue seen in the field. It all sounded a bit theoretical (but more
likely with pNMI).

I'll pick it up as a fix so we can land it in v6.16.

Ard -- maybe we can rework this in future along the lines that you
suggest but, from what Mark was saying offline, there may be problems
beyond the SCS that need addressing too if we decide to leave IRQs
enabled.

Will

