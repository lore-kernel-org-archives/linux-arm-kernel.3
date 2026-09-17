Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A360C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFfU27c/MB1+OwrZCJemAaFCM2FvVVYUhgrF6DVP7qo=; b=aydySfVpP7HT1DHSyAFtW6hQef
	hPXZSd0sE3gaALX6FvPckmoqpDCP6OebsznoFviJke3EbO/Z1iVTuC1XtgeJ7q3cUPwPiq2Q+I2fm
	eJCzI7YJyopi1KMED7o4h7539HmtHQLzKysceFKT0v+K6bwH2IhwNTq44Fpib5II9wBMRtOVLM//5
	oQkVWwrGxamzQY5YQD7cEfkjsiZaWKDA5OUksUpasUXKXsECFsgkEYumXYiU65PiNasOXUtyOzyQV
	gX9EV2jfRvUMFyVkSIQ2AZ/srsGCj0GkPxVqvQZ8WofcY/XMwl4qr4BtYilKe1t6+VSagIByP6I3e
	yk8vNw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78vi-0000000B3kK-1ggG;
	Thu, 17 Sep 2026 10:01:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78vf-0000000B3jy-0PEg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 10:01:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E27B01476;
	Thu, 17 Sep 2026 03:01:13 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE3AE3F7B4;
	Thu, 17 Sep 2026 03:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789639277; bh=7f+DyO0aVahV3yaG3OLFFC7DhrsBd/PbfzSn6AGTRdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SxuwVEPbRV5U3eLO+R05qilnaeyPOUDhkohdjK8kwFZQ1ZIjBxktQXqSgkqeSE5bi
	 3TdfbpaF58mTm/Xn8gtbzBpUQpQ7VXFT0ZRhad6GgRHd1cni/47NHIP0g0L8MCniPj
	 AWiENNa0WnZzGglRA/JUz39uETLtCRrpUy8NWJqc=
Date: Thu, 17 Sep 2026 11:01:11 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Florian Weimer <fweimer@redhat.com>,
	Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
	Uros Bizjak <ubizjak@gmail.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v8 1/4] arm64: vdso: Prepare for robust futex unlock
 support
Message-ID: <aqu6ZzMpunlKDIwm@J2N7QTR9R3>
References: <20260821-tonyk-robust_arm-v8-0-077707b6f1c7@igalia.com>
 <20260821-tonyk-robust_arm-v8-1-077707b6f1c7@igalia.com>
 <aqqmmNTDnzT5d-ZT@J2N7QTR9R3>
 <4cc1a199-8917-4a93-91f8-138ca1511cff@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cc1a199-8917-4a93-91f8-138ca1511cff@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_030119_469303_AADF9704 
X-CRM114-Status: GOOD (  25.79  )
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

On Wed, Sep 16, 2026 at 10:05:38PM -0300, André Almeida wrote:
> Em 16/09/2026 11:24, Mark Rutland escreveu:
> > I reckon this might also be clearer as:
> > 
> > | 	if (regs->regs[3])
> > | 		return NULL;
> > | 	
> > | 	return (void __user *)regs->regs[2];
> > 
> > Do we need a __force cast here, or is sparse happy without that?
> 
> I've just re-compiled those patches with C=1, and didn't find any warning
> for this.

Perfect, thanks for confirming!

[...]

> > > +	futex_set_vdso_cs_range(fd, is_32bit ? 1 : 0, start, end, is_32bit);
> > 
> > On arm64 (and every architecture other than x86, AFAICT), the
> > native/compat VDSOs are mutually exclusive, and a single mm can only
> > have one of them.
> > 
> > Given that, I think we can make this:
> > 
> > 	futex_set_vdso_cs_range(fd, 0, start, end, is_32bit);
> > 
> > That way we'll avoid confusing/bikesheeding over 'is_32bit ? 1 : 0',
> > without having to add mnemnonics for the native/compat CS indices.
> 
> Perfect, I will simplify that then.
> 
> > That said, what's the plan for 32-bit robust lists on a 64-bit host?
> > IIUC you wanted that for emulation, and AFAICT you have no way to call
> > __vdso_futex_robust_list32_try_unlock() from a native task.
> 
> Yes, the plan is to be able to use the 32-bit robust lists on a 64-bit
> hosts, with a new interface (set/get_robust_list2[1]). That means that a
> 64-bit kernel will be able to process an user robust list made of 32-bit
> pointers. So the emulator will call set_robust_list2() one time for it's own
> list, and another time for the emulated app list.
> 
> However, what we have agreed for the moment is that, while there's no
> support for that, we will not expose the 32-bit functions yet [2]:

Ah, thanks for the pointer! I had mistakenly assumed that some of
that had already happened.

I guess the common logic for futex_set_vdso_cs_range() will need to
change at that point I guess if/when that happens, you'd expect to add
__vdso_futex_robust_list32_try_unlock() into the 64-bit VDSO, regardless
of compat?

Mark.

> "...that requires also the ability to register a 32-bit robust list for a
> 64-bit process, which is not supported right now. So no, we are not exposing
> something half functional..."
> 
> So yes, in the near future I will need to expose
> __vdso_futex_robust_list32_try_unlock() to 64-bit apps as well, to be able
> to do this handling with 32-bit pointers, but we are not doing it right now.
> 
> [1] https://lore.kernel.org/lkml/20251122-tonyk-robust_futex-v6-0-05fea005a0fd@igalia.com/
> 
> [2] https://lore.kernel.org/lkml/878q9vwote.ffs@tglx/
> 

