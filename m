Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D290CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 10:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCUXZj1UudD81J+tzs1iNoS5NARfatylA2v+XY7w0pU=; b=He0pNTNDxyni7sXRXUlWgPrerk
	N55WT+V+QG8qErzNq/myg2O0g+whwJ/25tXM/ubM8t7NRK159BAdmtWVsut3rnPXn+8tdVD88hiNv
	v5aas/tA8FMI00JZKbgxxqTrs/XVvTzX99VeYlr750wfrPKfFn8vmP0Qjfu+/40sjkWlYYQRCJkue
	O8kEI3Mb/38kIs7z57l6NYB87qxhBFDtiyf0lArGwF/DHRakikRwA/uPMluUwAOmqurvumKPcn9aZ
	1RHoxZf9pN+liE+JJDw/CgFnw1IhNf47TJuNGYr0udKPTog9WxvAvlddLneqYsd5yEelIxZM1/H3m
	Z1Rt3LPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh31M-0000000EkFx-3Z5y;
	Tue, 07 Jul 2026 10:27:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh31L-0000000EkFa-239W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 10:27:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 321F640482;
	Tue,  7 Jul 2026 10:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D840A1F000E9;
	Tue,  7 Jul 2026 10:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783420039;
	bh=HCUXZj1UudD81J+tzs1iNoS5NARfatylA2v+XY7w0pU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AYQQX6xqoBaQvhhm8WxPal1Czc3Nsm4qzpqq/veoFkttYnv5OubhCsCtzvx423TO2
	 OQH5I8dpRYNxo9+D1JwUr2qRQYFgz8TStY2wEQGfOZO11H9EqiN++b4RLIAOVNbZ1/
	 m8nD2iN7DDdB05+HW4wYHIzROTXwent0P+GN7QcChPsD32M4gUsN1E+pd3e3Hy+xPD
	 LgqLKveiNXmQ5n4QJgelDe2B6/sGChVFieuwNQ0LWAV434leNc1326gHSSV4JhBquk
	 ClDEAHmHs0GF5jx5XboyDmKuP9Ekbboe18xcXYhdgGlg1TueweSgdIDp5xFwTZFlQV
	 QeDxw/JZa7j/A==
Date: Tue, 7 Jul 2026 11:27:07 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, tsbogend@alpha.franken.de, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, peterz@infradead.org, kees@kernel.org,
	nathan@kernel.org, linusw@kernel.org, ojeda@kernel.org,
	david.kaplan@amd.com, lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, thuth@redhat.com, menglong8.dong@gmail.com,
	oupton@kernel.org, yeoreum.yun@arm.com, miko.lenczewski@arm.com,
	broonie@kernel.org, kevin.brodsky@arm.com, james.clark@linaro.org,
	yangyicong@hisilicon.com, tabba@google.com, osandov@fb.com,
	arnd@arndb.de, anshuman.khandual@arm.com, david@kernel.org,
	akpm@linux-foundation.org, ljs@kernel.org, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	kprateek.nayak@amd.com, chenl311@chinatelecom.cn,
	sshegde@linux.ibm.com, thorsten.blum@linux.dev,
	chang.seok.bae@intel.com, tim.c.chen@linux.intel.com,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 05/12] arm64: smp: Defer RCU registration during
 secondary CPU bringup
Message-ID: <akzUe3aIKZiEr4at@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <20260624092537.2916971-6-ruanjinjie@huawei.com>
 <akvoVCNFwDorQg6y@willie-the-truck>
 <58a9fd8b-387c-41c6-91a2-48ec885870d5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58a9fd8b-387c-41c6-91a2-48ec885870d5@huawei.com>
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

Jinjie,

On Tue, Jul 07, 2026 at 11:02:32AM +0800, Jinjie Ruan wrote:
> On 7/7/2026 1:39 AM, Will Deacon wrote:
> > ce3d31ad3cac ("arm64/smp: Move rcu_cpu_starting() earlier") was to
> > handle the useless print in cpuinfo_detect_icache_policy(), but I've
> > decided just to remove that one. So I think the remaining prints we have
> > to worry about in this early boot code are from error paths in the
> > CPU feature detection logic (check_local_cpu_capabilities()).
> > 
> > Given that those error paths should all be fatal, perhaps we could
> > rework cpu_die_early() and cpu_panic_kernel() as macros that take a
> > string argument and either call printk_deferred() (similarly to what you
> > suggested in a previous version of your series [1]) or do the
> > lockdep_off() there before a pr_crit().
> > 
> > What do you think?
> 
> That is an excellent point. Reworking cpu_die_early() and
> cpu_panic_kernel() to uniformly use printk_deferred() based on the
> specific error type or the string argument is a much cleaner approach.
> 
> This makes perfect sense because these paths are inherently fatal, and
> switching to deferred printing avoids the risky lock-taking and RCU
> runtime constraints during early boot entirely. It cleanly resolves the
> diagnostic noise without broadly blinding lockdep or hiding potential
> locking issues down the line.
> 
> I fully agree with this approach.

It's great that your AI chatbot thinks this is fantastic, but what do
_you_ think? I'm much more interested in your opinion, as you have
already spent time thinking about this.

Will

