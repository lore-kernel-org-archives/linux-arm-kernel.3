Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3A8CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbR5ceHBbK1Nm8XxJV55BunvCKadPA56wyVaVOGmxB8=; b=VnVsG1M3N9bQnSbYwzq2cCqDtn
	+zC97gv61OqPnW72YVqxONd1ipgJfG7nT/eK1i+K8xwqNl2TUmaCx/7PwPXGM2kC/K+G0TFutU1oq
	YGBnYxYB5+A1SThMLQkh1TZK34q0ZeeYqNilQGtGLN5bSs0tbdAo66+BiKUCCWIw93StTLf34P1pw
	7+ede8oNfjmGvh07xQCEdRnPjTG2ioTQqSU2a2LWVFlU3rYnRJb6dCfUgdEIV+BChY9mOLVkPESmo
	Q1URFFtVKUO8PONmSsihlB6P2k0XPaeKaFfgLWfxDTlqzbvGi1HIJ3I76FhlNL8gs0NTTCQN/yPac
	Q+K46DDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXvg-00000000DcR-3FLO;
	Wed, 06 May 2026 08:48:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXvf-00000000Dba-1hgK;
	Wed, 06 May 2026 08:48:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D894860132;
	Wed,  6 May 2026 08:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A17C2BCC4;
	Wed,  6 May 2026 08:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778057306;
	bh=IUO5lXUDkT4nvUBviJejZvM9e4p1qGcE/fMZ5yRqht4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oyYTCfoLxt9bBadi2EzSMoURTPGCD/lKkFKebSQF7LnOtBPR7VpN5fo8iYNGExYVa
	 pzOx4fSjkWAUmltCJw7h9vFz4ijQnMvAm1HfN1G3MPdgeGBbcpUuo3/7au0nR0YPik
	 QP0PIXAdZ0urf5mL1ZHZpMfa3ImOrTwCrDGS6rGzzuXKml0O331yQiC2f/f/zdkqUb
	 icnkpvTei2+s4rP+rPmBhJDOyhpeHek2fYHa5d41MUUvOCZVLneiy8qWgxAQTW/q3p
	 aDLeYpf2toLXyU3+GN4x4R8CHJovyT4t6/+1ytZyodVy0KkHqIds6KcxOgk8aI6cBi
	 YCO2FlL2Ct/SA==
Date: Wed, 6 May 2026 10:48:20 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 2/2] irqchip/gic-v5: Add IWB to ACPI probe dependency
 control
Message-ID: <afsAVO+vTQp2r/EI@lpieralisi>
References: <20260505-gic-v5-acpi-iwb-probe-deferral-v1-0-b37b85998362@kernel.org>
 <20260505-gic-v5-acpi-iwb-probe-deferral-v1-2-b37b85998362@kernel.org>
 <875x51y6gi.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875x51y6gi.ffs@tglx>
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

On Tue, May 05, 2026 at 09:58:05PM +0200, Thomas Gleixner wrote:
> On Tue, May 05 2026 at 10:48, Lorenzo Pieralisi wrote:
> > On Arm GICv5 systems, wired IRQs routed to an IWB may require resolving
> 
> S/IRQs/interrupts/g
> 
> Changelogs are prose and not an acronym dump ground.
> 
> >  drivers/acpi/arm64/iort.c        | 22 +++++++++++++++++++---
> >  drivers/acpi/scan.c              |  1 +
> >  drivers/irqchip/irq-gic-v5-iwb.c |  5 +++++
> >  drivers/irqchip/irq-gic-v5.c     | 13 +++++++++++--
> >  include/linux/acpi_iort.h        |  3 ++-
> 
> I'm confused about the conglomerate of files affected by an irqchip
> change...

True, I can split the ACPI changes into a separate patch though on its
own it would not be that useful because the resulting code would have
no user - I will do what you and Rafael prefer.

Thanks,
Lorenzo

> Thanks,
> 
>         tglx

