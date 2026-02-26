Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6991FCE078
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 13:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9CDr3NUu/sKpVBd5lt9QN1bpaxogyWeWa+do82w1+U=; b=aiJ0ZaLVs6NADIHBe8yQCO6FGO
	IObPzoL5wWIAUs8ucutXcy+eIoz8KZryWJgmSpdh7rlXG4/sEsQregGHuAyp5PES4GB2j1uW6Xhyy
	rx8P4LdpUROO76XGXpfxjq8xD040Rc33v4IiYQU06bkSGhDvbBml7mbw0y6W8JWcXMeWRmW0Jefzn
	n4AXcF2TtH3Sj1a6iZ7tRtlYhj9huIToSW3/AhX7E5fEdnI5AuZxXgSZxOj18ZlELGgInw8uuP0KS
	Gd5Jy/P1PUY436xJPd0Js0T/LOAOp5gYw+FwLuJ+wdcntn83CwRosa+6Vts4mPUAVS8JE2anoDPTR
	y0ksQZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbCu-00000006BnI-1Pgm;
	Thu, 26 Feb 2026 13:15:08 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbCr-00000006Bmx-1i0z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 13:15:06 +0000
Date: Thu, 26 Feb 2026 14:14:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772111701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B9CDr3NUu/sKpVBd5lt9QN1bpaxogyWeWa+do82w1+U=;
	b=BehE2YRgVuzgSCllJG9NEK5zdFCWHrjjINxBTYIbIi3Yk0Wv/FjE94mf+aPxMAZDkG4qgW
	DNkgNK6itRAL8Ow5R0KrDaaTiR4fbd0qmhHDJkv5+D5zHogKkZmZOBnxGXizyIPgmynvVW
	pEZO+3C24POW9N0ysrh2y3crYExckvdgkPYmw1Jftl0T8EPvFXf22gHOoBjr7POofwrshW
	xrH4XHQ3fYS2dqsJgHitMqp/lQ7HAuPju+Zne4/yW1jFDRiC5O2CeoD7dgtC0TlCH1A2ik
	dIYH0VYy+gDbBYNX6TcHvSl21/FQWJj580MkDW09++/qPZFfd/pLf4lm1uHgcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772111701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B9CDr3NUu/sKpVBd5lt9QN1bpaxogyWeWa+do82w1+U=;
	b=wS2L/5XybNnrmwSrjn7LPdhisOo0huBHxtY9rebHvX+O2b0nV3KwluS5GeZGsRhHnk0MZ+
	UrYKPxfEnMuVN3Bg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Yadi.hu" <yadi.hu@windriver.com>
Subject: Re: [PATCH v5 1/2] ARM: mm: fault: Enable interrupts before invoking
 __do_user_fault()
Message-ID: <20260226131459.8lBz2Cbs@linutronix.de>
References: <20260226111742.3598421-1-bigeasy@linutronix.de>
 <20260226111742.3598421-2-bigeasy@linutronix.de>
 <aaA8uR3_o55uuevl@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aaA8uR3_o55uuevl@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_051505_609328_941086EF 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

On 2026-02-26 12:29:45 [+0000], Russell King (Oracle) wrote:
> Sorry, I've been swamped with stmmac for ages, which has become a
> millstone.
> 
> I need to push out these patches:
> 
> ARM: provide individual is_translation_fault() and is_permission_fault()
> ARM: move FSR fault status definitions before fsr_fs()
> ARM: use BIT() and GENMASK() for fault status register fields
> ARM: move is_permission_fault() and is_translation_fault() to fault.h
> ARM: move vmalloc() lazy-page table population
> ARM: ensure interrupts are enabled in __do_user_fault()
> 
> which will address some of your issues, and clean up the fault handling
> code. These patches all date from 5th December. :/

Okay. Thank you. Please let me know once you pushed them where I can
reach them. Then maybe we can reduce this to just 2/2 ;)

Sebastian

