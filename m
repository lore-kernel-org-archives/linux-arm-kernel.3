Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5071CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 19:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqenN9shMYdzOKywPnjFE4//o+lrw5xNvct/8DapoGQ=; b=OorTqo+heTvuxmR9IXnI/s/Uo3
	IDxFeY58wmPibm2gAYBNUE5q/oSXxentcMuFlTErv+gw+nRqjfmIWkowtzddabpk6CVfgoto9DAPm
	jXUlcOFK47fUisVfu/CQGh0hTdt91pHL+o6s/qJn/lPI8Thhiflz6FA776pe2K42JLHAW1wY0nNUe
	ziv8fA98/LnKZS2x5gaDVNa0+GTmKRpfSz4OKjYdDZy2qI1XRqxa6ejAmYbs5wwu7y/dT/vi+WfXp
	blpvyaURMzPrbQrB5SLzXTQ2BXEfVk35JxVC7x0bM3VST2GVhE+zq57Eg3nIE84spkKInW4GOyoXl
	xH88dzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5A1-00000008SR5-0vYa;
	Mon, 18 Aug 2025 19:04:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4bQ-00000008L82-0bkZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 18:29:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4921144E79;
	Mon, 18 Aug 2025 18:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AF9C4CEEB;
	Mon, 18 Aug 2025 18:28:58 +0000 (UTC)
Date: Mon, 18 Aug 2025 19:28:56 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>, harisokn@amazon.com,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com,
	Joao Martins <joao.m.martins@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 1/5] asm-generic: barrier: Add
 smp_cond_load_relaxed_timewait()
Message-ID: <aKNw6JMUIFg4gL5Q@arm.com>
References: <20250627044805.945491-1-ankur.a.arora@oracle.com>
 <20250627044805.945491-2-ankur.a.arora@oracle.com>
 <aJXWyxzkA3x61fKA@arm.com>
 <877bz98sqb.fsf@oracle.com>
 <aJy414YufthzC1nv@arm.com>
 <67b6b738-0f1c-4dd4-817d-95f55ec9272b@app.fastmail.com>
 <aJ3d2uoKtDop_gQO@arm.com>
 <1ccb0011-d2d2-453f-afcd-dd2967bf572a@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ccb0011-d2d2-453f-afcd-dd2967bf572a@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_112904_194814_87C6D460 
X-CRM114-Status: GOOD (  23.18  )
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

On Mon, Aug 18, 2025 at 01:51:28PM +0200, Arnd Bergmann wrote:
> On Thu, Aug 14, 2025, at 15:00, Catalin Marinas wrote:
> > On Wed, Aug 13, 2025 at 06:29:37PM +0200, Arnd Bergmann wrote:
> >> On Wed, Aug 13, 2025, at 18:09, Catalin Marinas wrote:
> >> and virtual machines with CPU overcommit.
> >
> > Not sure it helps here. With vCPU overcommit, KVM enables WFE trapping
> > and the event stream no longer has any effect (it's not like it
> > interrupts the host).
> 
> I would expect a similar overhead for the WFE trapping as for the
> bare-metal hardware case: When the WFE traps, the host has to
> reschedule all guests that are in WFE periodically, while WFET
> with event stream disabled means this can be driven by an accurate
> host timer.

For WFIT, yes, this works as the hypervisor either gets an interrupt or
schedules a timer. It can tell what WFI* is going to be woken by.

With WFET, the hypervisor cannot tell if an event was generated by
another vCPU (e.g. clearing of the exclusive monitor) unless it does a
WFE itself. So it can't put the vCPU to sleep based on the WFET timeout.
IIUC, from kvm_handle_wfx(), the only difference is whether it returns
immediately to the vCPU if it timed out or tells the core KVM to
reschedule other vCPUs.

> > That said, my worry is that either broken hardware or software rely on
> > the event stream unknowingly, e.g. someone using WFE in a busy loop. And
> > for hardware errata, we've had a few where the wakeup events don't
> > propagate between clusters, though these we can toggle on a case by case
> > basis.
> 
> Don't we already support hardware without a functional architected
> timer even with? Those don't use the event stream today even when
> CONFIG_ARM_ARCH_TIMER_EVTSTREAM is enabled.

Maybe we still have such hardware around (e.g. errata) but it shouldn't
be the norm, especially if vendors try to follow the *BSA specs.

-- 
Catalin

