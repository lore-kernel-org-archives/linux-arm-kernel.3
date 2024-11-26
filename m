Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73336D59D90
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 10:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CYVn2CbyDy7ZM6g1frdzdaFpYqRKBQDIXh/vk2cfTc=; b=MjXtZnY6fNjGsBeWxwzJZ1xRKG
	qzToLwuL8F8xbfh/5LIn9qg4a4ovcO854icq6q0ujoCZLTM7nK2P1+e+A1j3ERY+UJI7QXkDM+AD7
	dBEs3itJ62GrAvc3qC5dpixkYIeUAi4xcc1OPLgywuB8q4T+ecMukCkdITg4BSf12tIKbMCmUL0GJ
	n5HgmaLgMC0LOCK8gBXCwSc7Bixi0T/LS8wJF0IvqMgWnA5Yw01IooBVhlZprkWmJ/uJY6yqm9waW
	3DiSM22B7kYveXJ/nNjk/+IfkgTRQ4vZfncqC9pRF1Lv9g8/W00K1vLrSEDxzXNQFFp+28uAFPcpi
	UXhtZT1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFszh-0000000AKi7-2DfC;
	Tue, 26 Nov 2024 10:40:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsvw-0000000AJxz-0ZPR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 10:36:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFC305C491C;
	Tue, 26 Nov 2024 10:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBCC6C4CECF;
	Tue, 26 Nov 2024 10:36:33 +0000 (UTC)
Date: Tue, 26 Nov 2024 10:36:31 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-pm@vger.kernel.org, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, will@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, pbonzini@redhat.com,
	vkuznets@redhat.com, rafael@kernel.org, daniel.lezcano@linaro.org,
	peterz@infradead.org, arnd@arndb.de, lenb@kernel.org,
	mark.rutland@arm.com, harisokn@amazon.com, mtosatti@redhat.com,
	sudeep.holla@arm.com, cl@gentwo.org, maz@kernel.org,
	misono.tomohiro@fujitsu.com, maobibo@loongson.cn,
	zhenglifeng1@huawei.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v9 01/15] asm-generic: add barrier
 smp_cond_load_relaxed_timeout()
Message-ID: <Z0Wkr-BcSsSzFth8@arm.com>
References: <20241107190818.522639-1-ankur.a.arora@oracle.com>
 <20241107190818.522639-2-ankur.a.arora@oracle.com>
 <878qt6h9kr.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qt6h9kr.fsf@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_023640_207228_3ED00821 
X-CRM114-Status: GOOD (  15.32  )
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

On Mon, Nov 25, 2024 at 09:01:56PM -0800, Ankur Arora wrote:
> Ankur Arora <ankur.a.arora@oracle.com> writes:
> > +/**
> > + * smp_cond_load_relaxed_timeout() - (Spin) wait for cond with no ordering
> > + * guarantees until a timeout expires.
> > + * @ptr: pointer to the variable to wait on
> > + * @cond: boolean expression to wait for
> > + * @time_expr_ns: evaluates to the current time
> > + * @time_limit_ns: compared against time_expr_ns
> > + *
> > + * Equivalent to using READ_ONCE() on the condition variable.
> > + *
> > + * Due to C lacking lambda expressions we load the value of *ptr into a
> > + * pre-named variable @VAL to be used in @cond.
> 
> Based on the review comments so far I'm planning to add the following
> text to this comment:
> 
>   Note that in the generic version the time check is done only coarsely
>   to minimize instructions executed while spin-waiting.
> 
>   Architecture specific variations might also have their own timeout
>   granularity.

Looks good.

> Meanwhile, would appreciate more reviews.

It's the middle of the merging window, usually not much review happens
unless they are fixes/regressions.

-- 
Catalin

