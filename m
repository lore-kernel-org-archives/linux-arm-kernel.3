Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FA8CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrxqbtZiBL/qfZS6zqxhKAA8G4C9IigNp34u5Qgc960=; b=Gs2oMgJHR+SGJSss0ZQxgEMb14
	bWJb120iqQjezMnDs/tzxMJUAyrQry9NwS322x1Mjz2RjUdRL0KQPrxnnCS2+/SmK5gn+RHx+cgC0
	FFGkVz29eVytL1xIIn65z5Lnhw2YpkUdKHU2YJHzMhrS36FD9tqwxfY4rXGnkot/4Lg+DKgqVEa/A
	qUwcKAH0SUAKtfjyiTt7xovZxyq/03ftZuGjvPdZzRRHWegT/C0z/UqC8DwzngNAseVdGvWr/zrSA
	y77GzPrgq1WN3eSyO+Zkf4Uzwi2ddyG87nAR4dpHmQtV39ZaXscrbmqtNeKP2S/hv+QntIXSd/VMX
	0hcjGehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUUP-00000004NFY-13D0;
	Thu, 30 Oct 2025 15:23:01 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUUM-00000004NEk-0n5u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:22:59 +0000
Date: Thu, 30 Oct 2025 16:22:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761837774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrxqbtZiBL/qfZS6zqxhKAA8G4C9IigNp34u5Qgc960=;
	b=4u4Ee2SRxSM7HfNqMDUNTMZ8zt80JhxIKS6wJUR43zONguQuYeob9FcovaBra1EYtsd0GN
	4SLcj5i/cRZZgdce4ldAHDNhQQ+tsnkUjEzamR3LOF7JIJ+LtG0U9FNgpHQUJO4AVTH4s0
	FkT6lm0/sh5H54gZNbsE7fd31B2OXBx/FslLNKo2ieHoJLlO3VJIv1Gm3rJisRXFgcCkqA
	Beq09jO/ik5FCWPX24j5GL8Ry4yk6w2hniqwWMHdtsGF/WXzZU0l9ObEqSL6vpyrHKIvrz
	a2wlqkpUjNkqDvG3WoCr3AqbAp75lw/PcuLdKLujOEuTAXLK/8xFjKuFA8iGcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761837774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrxqbtZiBL/qfZS6zqxhKAA8G4C9IigNp34u5Qgc960=;
	b=9revQB1kULyB8N2ZJeUz5QrrHZRkebuE2Rq12yPd4uK07Gq7Qf8ec0iXI4J6hdjeWY5/qV
	p35lUOfoaoJvYxAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>
Subject: Re: [PATCH 5/5] ARM: Allow to enable RT
Message-ID: <20251030152253.tK-rY89Y@linutronix.de>
References: <20251029155918.503060-1-bigeasy@linutronix.de>
 <20251029155918.503060-6-bigeasy@linutronix.de>
 <1ab2724c-4280-4193-832b-4afc0ba496c1@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ab2724c-4280-4193-832b-4afc0ba496c1@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_082258_368242_5BE4DFB0 
X-CRM114-Status: GOOD (  14.73  )
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

On 2025-10-30 16:18:45 [+0100], Arnd Bergmann wrote:
> On Wed, Oct 29, 2025, at 16:59, Sebastian Andrzej Siewior wrote:
> > All known issues have been adressed.
> > Allow to select RT.
> >
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > ---
> >  arch/arm/Kconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index 99c9b1c320af8..002db8da69ee5 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -41,6 +41,7 @@ config ARM
> >  	select ARCH_SUPPORTS_CFI
> >  	select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
> >  	select ARCH_SUPPORTS_PER_VMA_LOCK
> > +	select ARCH_SUPPORTS_RT if HAVE_POSIX_CPU_TIMERS_TASK_WORK
> >  	select ARCH_USE_BUILTIN_BSWAP
> >  	select ARCH_USE_CMPXCHG_LOCKREF
> >  	select ARCH_USE_MEMTEST
> > @@ -129,6 +130,7 @@ config ARM
> >  	select HAVE_PERF_EVENTS
> >  	select HAVE_PERF_REGS
> >  	select HAVE_PERF_USER_STACK_DUMP
> > +	select HAVE_POSIX_CPU_TIMERS_TASK_WORK if !KVM
> >  	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
> >  	select HAVE_REGS_AND_STACK_ACCESS_API
> >  	select HAVE_RSEQ
> 
> This can be simplified slightly since CONFIG_KVM is long gone on
> ARM, so you can just select both HAVE_POSIX_CPU_TIMERS_TASK_WORK
> and ARCH_SUPPORTS_RT unconditionally.

If ARM does not have KVM then I would not depend on
HAVE_POSIX_CPU_TIMERS_TASK_WORK since selecting it without providing it
is wrong. This can be implemented without the need of KVM or RT.

>       Arnd

Sebastian

