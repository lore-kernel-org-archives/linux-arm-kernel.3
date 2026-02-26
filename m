Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A24FCE068
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pr+8ExyOhFxW/Uz4btSXrzEhPFdn+MVB6LdMQibRYoc=; b=J2JQCnWPimcyaVgvHacNj3HjsV
	9DvWBp07PZzvLwO213EqlJmN+btL/3wJdKTMKpAzrXDterthv7NrN4V6VNkLgTaytxIlBFd878xHw
	ZfRnfUhDpZQiNjpTvI08HlR7HVPHRFkK2Rmy/AIF+Fnimxe63K5rI9peykEOVfUvkoRSnQIrR52N4
	ODD1FlnBHVz8Ly6HbKQJH06LQWMr+PTdgw4YO8Bzkwh19uKYbUqAGoFNd3eLK/1sEl6yOWow+WtRe
	V/WQpwhMErTmNFBjcRINWdQKLlpiPe5h05XnEcqFGlVGZ2dV4M7JK+Y48BfnCN53rnSTtG2WWARqP
	yhWg3AZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvaVE-000000067Sb-1T1j;
	Thu, 26 Feb 2026 12:30:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvaVA-000000067S5-3t0D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 12:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pr+8ExyOhFxW/Uz4btSXrzEhPFdn+MVB6LdMQibRYoc=; b=HGpZuHzGxjaKNDkGGJJid5glay
	5hMT/4g7xmwuGLThWi9lbZaCDMCu+rYp3wijiDQtm601uNutXM7BiANvKLcd6IbfN0AQiwftMFfbk
	9e0B9QAB5WzNX6ZxQEmeql5WIrVaVgMHtChctKYJCS080QG5xg3fNYFPI3SXJCXkbfOwLFaueiggL
	uriyBEZ3ulpESGQhbJGh9uJDKqfbb8zCIDMwdxr3hA7aHMXFl9AuiyL2BfumcpiC9pNp9ILK4qprS
	CcFSAL/PU5VJFvy78IgS2dxjpXNY+wja/U983SX+6Fd491N2lLoR00kfj6SSTxHuqZ3JZ1F02FGCm
	SxkV6OEQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52834)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vvaV3-000000007v5-1PAl;
	Thu, 26 Feb 2026 12:29:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vvaUz-000000001xL-31zo;
	Thu, 26 Feb 2026 12:29:45 +0000
Date: Thu, 26 Feb 2026 12:29:45 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Yadi.hu" <yadi.hu@windriver.com>
Subject: Re: [PATCH v5 1/2] ARM: mm: fault: Enable interrupts before invoking
 __do_user_fault()
Message-ID: <aaA8uR3_o55uuevl@shell.armlinux.org.uk>
References: <20260226111742.3598421-1-bigeasy@linutronix.de>
 <20260226111742.3598421-2-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226111742.3598421-2-bigeasy@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_042957_255193_BC2A16B0 
X-CRM114-Status: GOOD (  15.75  )
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

On Thu, Feb 26, 2026 at 12:17:41PM +0100, Sebastian Andrzej Siewior wrote:
> From: "Yadi.hu" <yadi.hu@windriver.com>
> 
> A page fault from userland for a kernel address originates from from
> do_sect_fault() (!LPAE) or do_page_fault() and ends in __do_user_fault()
> by sending a signal.
> 
> Sending a signal requires to acquire sighand_struct::siglock which is a
> spinlock_t. On PREEMPT_RT spinlock_t becomes a sleeping spin lock which
> requires interrupts to be enabled. Since the calling context is user
> land, interrupts must have been enabled so it is fine to enable them in
> this case.
> 
> Enable interrupts in do_kernel_address_page_fault() unconditional in the
> user_mode case().
> Enable interrupts in do_sect_fault() if they were previously enabled.
> 
> [bigeasy: Initial patch/ report by Yadi. Maintained the patch and redid
>           the patch description since]
> 
> Signed-off-by: Yadi.hu <yadi.hu@windriver.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sorry, I've been swamped with stmmac for ages, which has become a
millstone.

I need to push out these patches:

ARM: provide individual is_translation_fault() and is_permission_fault()
ARM: move FSR fault status definitions before fsr_fs()
ARM: use BIT() and GENMASK() for fault status register fields
ARM: move is_permission_fault() and is_translation_fault() to fault.h
ARM: move vmalloc() lazy-page table population
ARM: ensure interrupts are enabled in __do_user_fault()

which will address some of your issues, and clean up the fault handling
code. These patches all date from 5th December. :/

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

