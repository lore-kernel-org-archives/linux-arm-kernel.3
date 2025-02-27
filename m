Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B7CC1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7Vu0ZplTEEaE7d+UJdI1+eOMKLWARo7FE2s6iA0Rk4=; b=M2f2f63+Yx9NyT37pVic2v5ZWC
	J0EY4z1Vb3wT/LmSjwbhb2eQSsk8bLePPsAPbQG/Kt+BFqjb2NSpWSU+6LfSPZTCIDfcLu+Veqr1U
	VNAAXR2CztOSE4GeTEamCVIWEiFFKqabj4u4xvRYn359PWZqwaQsOHM53zZyD3JmJgM3VOD9NMVB2
	vRhT6P2IUerBBSqesc226uAE19z3VyEzJ//IeFEWLs1y0JoooS2tojum8gJZfdEFCZQIx1GKYezxZ
	qz/1Y2/RQ0fHwEiwF4SUXpBbAomDn4vUae1E+fGF934ErUSzwMLTssdOKbrSGP/K3nCLEEsuJhx8R
	e/dnDB/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjmR-00000008dOn-3qNu;
	Thu, 27 Feb 2025 19:42:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnijV-00000008Kxq-1Iw1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:35:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77A751516;
	Thu, 27 Feb 2025 10:35:53 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EDB93F5A1;
	Thu, 27 Feb 2025 10:35:31 -0800 (PST)
Date: Thu, 27 Feb 2025 18:35:26 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, oleg@redhat.com, sstabellini@kernel.org,
	tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, kees@kernel.org, aliceryhl@google.com,
	ojeda@kernel.org, samitolvanen@google.com, masahiroy@kernel.org,
	rppt@kernel.org, xur@google.com, paulmck@kernel.org, arnd@arndb.de,
	puranjay@kernel.org, broonie@kernel.org, mbenes@suse.cz,
	sudeep.holla@arm.com, guohanjun@huawei.com, prarit@redhat.com,
	liuwei09@cestc.cn, Jonathan.Cameron@huawei.com, dwmw@amazon.co.uk,
	kristina.martsenko@arm.com, liaochang1@huawei.com, ptosi@google.com,
	thiago.bauermann@linaro.org, kevin.brodsky@arm.com,
	Dave.Martin@arm.com, joey.gouly@arm.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v6 8/8] arm64: entry: Switch to generic IRQ entry
Message-ID: <Z8CwbmCXguCEfJvx@J2N7QTR9R3>
References: <20250213130007.1418890-1-ruanjinjie@huawei.com>
 <20250213130007.1418890-9-ruanjinjie@huawei.com>
 <xhsmh4j0fl0p3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmh4j0fl0p3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_103541_385725_69B9EBCF 
X-CRM114-Status: GOOD (  15.74  )
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

On Thu, Feb 27, 2025 at 07:08:56PM +0100, Valentin Schneider wrote:
> On 13/02/25 21:00, Jinjie Ruan wrote:
> > Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
> > to use the generic entry infrastructure from kernel/entry/*.
> > The generic entry makes maintainers' work easier and codes
> > more elegant.
> >
> > Switch arm64 to generic IRQ entry first, which removed duplicate 100+
> > LOC and make Lazy preemption on arm64 available by adding a
> > _TIF_NEED_RESCHED_LAZY bit and enabling ARCH_HAS_PREEMPT_LAZY.
> 
> Just a drive-by comment as I'm interested in lazy preemption for arm64;
> this series doesn't actually enable lazy preemption, is that for a
> follow-up with the rest of the generic entry stuff?
> 
> From a quick glance, it looks like everything is in place for enabling it.

Sorry, there's been some fractured discussion on this on the
linux-rt-users list:

  https://lore.kernel.org/linux-rt-users/20241216190451.1c61977c@mordecai.tesarici.cz/

The TL;DR is that lazy preemption doesn't actually depend on generic
entry, and we should be able to enable it on arm64 independently of this
series. I'd posted a quick hack which Mike Galbraith cleaned up:

  https://lore.kernel.org/linux-rt-users/a198a7dd9076f97b89d8882bb249b3bf303564ef.camel@gmx.de/

... but that was never posted as a new thread to LAKML.

Would you be happy to take charge and take that patch, test it, and post
it here (or spin your own working version)? I was happy with the way it
looks but hadn't had the time for testing and so on.

I expect that we'll merge the generic entry code too, but having them
separate is a bit easier for bisection and backporting where people want
lazy preemption in downstream trees.

Mark.

