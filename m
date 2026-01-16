Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA12C982E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYA1/PW/0yIH+JE9voV2k0usAZeLlOr7n78hGG9p8IA=; b=inlf8cEX817Z8UFvBTDbaXOvbM
	8rtqSPg+wGWTV28bEO6JCttRZnGMyf7+SHSq3CS5q66H1E4h066Zij6HqQUrQdg2AToP1m+5TBDe1
	P5+apDDN3HtP9/q5QX6H8E+X1JV8PI6rBkCcGm8k8bv2kkWpHteeAyDVq0u+m3UT/LBUlpjDw+80k
	uFrO8bvZ1H7vwY8RaIl3DB4fyGnCU7XxrlNeJwf0qkXd9QMo4jAboH0tWUcKxBQXzZD60emPmcEdn
	ngO3SYqmUVw3GsYpG+BCNdVUYCiL/3nkH9gV6+TmaTKOMPlMHH4Rg9f/MxAOd1tuFOfnwSHKXJlWH
	3YoAIgGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnhy-0000000EaVs-3lAr;
	Fri, 16 Jan 2026 17:34:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnhv-0000000EaUq-3tIM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 17:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XYA1/PW/0yIH+JE9voV2k0usAZeLlOr7n78hGG9p8IA=; b=QFQLb4DtnGGuGfg6tzYpMSXF/W
	ue4Jp5++XNHkR2KYLvgIRT7dbompth+qQ+kdEHlX3RYEmuv3XkPzJ19DPeN29oLEl10ve92Sb/rnj
	Y/GZhWvxaOGeNQW0YF8yBcKLMCEId2mlPlhi1ghGMfixcRWCdW/gWI5ZmuApKMF0fHhDtr+Z/QO6/
	7yI77qfOwnAu2iaboZeksr9zTCwGy4PUCuxB7yxvWwfl+NZN/Kphh8kF2poxmSjhe1lMbTrH4nJco
	gZv49PoDsMKt5V3MJ3h0ThE2gsd8pD6nzgE4IEXVC/2PR8uDwXxUsXiQTrx5vpRsW7v58TglFEb5g
	KAPt3GhA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53306)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vgnhn-000000002YA-3e5e;
	Fri, 16 Jan 2026 17:33:52 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vgnhk-000000003mL-3E2k;
	Fri, 16 Jan 2026 17:33:48 +0000
Date: Fri, 16 Jan 2026 17:33:48 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Yadi.hu" <yadi.hu@windriver.com>, Bryan Brattlof <bb@ti.com>
Subject: Re: [PATCH v4 1/2] ARM: mm: fault: Enable interrupts before invoking
 __do_user_fault()
Message-ID: <aWp2fKGfIQKJ8wze@shell.armlinux.org.uk>
References: <20260116170041.1059997-1-bigeasy@linutronix.de>
 <20260116170041.1059997-2-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116170041.1059997-2-bigeasy@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_093359_968483_84F0A095 
X-CRM114-Status: GOOD (  11.98  )
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

On Fri, Jan 16, 2026 at 06:00:40PM +0100, Sebastian Andrzej Siewior wrote:
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

Do you need any of this? __do_user_fault() now calls
local_irq_enable() as almost the first thing it does.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

