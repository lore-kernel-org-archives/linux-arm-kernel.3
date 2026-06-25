Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F28CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x38mY+apgJvav2oRACEhK8S6N3vdzgE0kpGM3pJ4yJk=; b=s5Dh9xHzQop8aDYxghgfnP2+AX
	n1GhQlkzQUymMMg0tRfv+ecVUKDEpmsajulE2sSGC2dkMj5EYBPbW5JWYep4J0Xfp1MxdUU74+R9Y
	TmG/6H3hLoalPy6RBFvLyBsxDXAs/3ncVPxzDAUzWv/KK8iwXW/GHUaDm0KnGOicfUSVWgvJP4WQG
	ZRNT2jjDuklJCedQ2LShe3wB4Ucovipr6dXzWa4jyBhekWEP996nsGEzfaO0z3FLYrFCSMCqmsXCA
	qtAAQlFbJ4XcQ6U1ObL+h2q3KpD+gidplz3/vCeBj5ndUypDEh18imSXN67SUMDRXMtQB5XB9iHSD
	jWWad3Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchFJ-00000008zC1-1txr;
	Thu, 25 Jun 2026 10:23:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchFG-00000008zBW-2ssL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 10:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x38mY+apgJvav2oRACEhK8S6N3vdzgE0kpGM3pJ4yJk=; b=m3sOIQ+qBZbLluxKlIKAN1D0aW
	fRpYkZERaIqvEHIQrSa1INeAtc1DFAyUnD5gb6GUHirkWLdB4/VviXsgjBq//+l68gmfvFQY6ZaHk
	FdKcKNaeR1JsW586gBMhiiskZmtHSOIXb68QVyOahCjp3NPKxkV+vA1MHFsQO+ignUM5vi3gkV24c
	aBoxIX9JzVkoctjJMa02yxLBJL1m3/U665ZLLuj7GPJZNr59MBGiIg+s6uGEsFJKryug2LqWIiB59
	ghay+lyo6Li0rNlU5A1HPfczPSqfjanlnPnFlhXcydzfMtO1FekZzgHvY5JGLsCzlw+86FMXHntMB
	valLG4/w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37248)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wchF9-000000000nG-3BJO;
	Thu, 25 Jun 2026 11:23:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wchF8-000000001vx-1ikY;
	Thu, 25 Jun 2026 11:23:34 +0100
Date: Thu, 25 Jun 2026 11:23:34 +0100
From: Russell King <linux@armlinux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
	linusw@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, liaohua4@huawei.com,
	lilinjie8@huawei.com
Subject: Re: [PATCH] ARM: enable interrupts when arm_notify_die() is handling
 user mode errors
Message-ID: <aj0BpqlaCh3cVw8Q@shell.armlinux.org.uk>
References: <20260625073522.182503-1-xieyuanbin1@huawei.com>
 <20260625100031.25088-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625100031.25088-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_032342_728155_C582E1B1 
X-CRM114-Status: GOOD (  24.91  )
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

On Thu, Jun 25, 2026 at 06:00:31PM +0800, Xie Yuanbin wrote:
> On 2026-06-25 10:05:52 [+0100], Russell King wrote:
> > > for this but actual breakpoint handling might be broken or is it 
> > > just me? But then your stack trace looks like mine so :/
> > 
> > ARM Linux doesn't use BKPT. BKPT was an instruction introduced by Arm 
> > Ltd in ARMv5TE. Prior to this, we use a UDF instruction instead (we 
> > had to pick something!) and gdb and other tools use that as a 
> > breapoint.
> > 
> > Moreover, BKPT isn't guaranteed to trap to the kernel, especially when 
> > there is a hardware debugger connected. In that case, DDI0100E states 
> > that use of BKPT must be according to the instructions provided with 
> > the hardware debugger. This makes BKPT unsuitable for use.
> 
> When do_DataAbort()/do_PrefetchAbort() run into `inf->fn()`, and the
> hook function return != 0 with interrupts disabled, the WARN may be
> triggered. From the code perspective, there are countless possible
> places, and "bkpt #0" is just one of these.
> 
> For example:
> bcm5301x_init_early()->hook_fault_code(bcm5301x_abort_handler).
> if CONFIG_ARCH_BCM_5301X=y, then bcm5301x_abort_handler() may return 1
> without enabling the interrupts.
> if CONFIG_ARCH_BCM_5301X=n, then in the same scenario it will run into
> do_bad(), also return 1 without enabling the interrupts.
> 
> So I think maybe:
> 1. enable interrupts in all hook functions, maybe
>    multiple points for modification.
> 2. enable interrupts in do_DataAbort()/do_PrefetchAbort() before
>    `inf->fn()`, but harden_branch_predictor() may be difficult.

Unfortunately, this breaks the Spectre/Meltdown mitigations. The
page fault handlers must be entered with interrupts disabled.

> 3. enable interrupts in do_DataAbort()/do_PrefetchAbort() after
>    `inf->fn()`, this may be ok.
> 
> From this perspective, arm_notify_die() also seems to be a good place?

If one is happy with higher latency for preempt cases, then it may
be, but if we want lower latency, then it ought to be earlier.
My preference is (3).

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

