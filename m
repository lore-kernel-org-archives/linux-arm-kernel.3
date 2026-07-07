Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE13DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 10:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/cTRdo+GJL5Yh+CZpV8uwi7exk4QvIR8V1Wfs6Ld7M=; b=JBap1TaUq+jOfzeBSbsVUjRcAi
	lR+osKbg5l4pGOOqH2TMrVgBB2yuVZxcL8Ttmu8JrQez3D17aH00Kllh0z8HPgqZyJ2HIFtOnKnTv
	7R6Voi5RDu+HuqQfBJRYXnwpnCjmHRGhOhhB5ig+1hU1/nDOpHzwRz7QKjyy47FLYy/r3Iaq4Wazh
	Gai26yehrENtpX2kKWX/ufPlpwLpuWnSSNH8i9mQr2Bvysm93U/J8uhEOXQQtuduAPOo5iq9guiUy
	7oL0Iyh6IdY0E/sm0QU0UcQW8SHHFI/tnfDeLt3HJzOYcDtw/NR0pIh67nr3jk3Auks0zwHgZlWMe
	gSmbxTnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh34r-0000000EkbS-2FIK;
	Tue, 07 Jul 2026 10:30:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh34q-0000000EkbA-2kzV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 10:30:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A6BA418C1;
	Tue,  7 Jul 2026 10:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2031F000E9;
	Tue,  7 Jul 2026 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783420256;
	bh=1/cTRdo+GJL5Yh+CZpV8uwi7exk4QvIR8V1Wfs6Ld7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CZ4uHiVi/JIurn8joz1Hau1rp0Gu8K5SAekAw+AVegx0wrBuSzIiAQsdNCIrgwuYB
	 kXUoBb/kfzXzMBHruIC8xrVTLeyDxLGxA0b3yy7M5D7bmwRMp0eSpLztTANkMsJ3IE
	 rO4nlVc8vyiDDOWDrN/0CKBLmqCNrW2+2CQMYf/djbJ+gEt70DqkYjxDgVNdOtKLe+
	 z1Pdiorrs5b/Pqb3HINaBCCEwCsqQH6aKxgn7eTMtkDCAlDsQgV6W+igSg8iie1Jn3
	 KauQEtxtWLawEg2Em7sodFcHMi3ySICCAQagzhI1/CpDmTzLmABqJofChbTxLNm1s7
	 4ShAljprq81ug==
Date: Tue, 7 Jul 2026 11:30:45 +0100
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
Subject: Re: [PATCH v3 12/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
Message-ID: <akzVVSWMOomcw1pG@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <20260624092537.2916971-13-ruanjinjie@huawei.com>
 <bddf7a68-7789-4ec2-819c-aaaee8173c70@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bddf7a68-7789-4ec2-819c-aaaee8173c70@huawei.com>
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

On Tue, Jul 07, 2026 at 12:00:12PM +0800, Jinjie Ruan wrote:
> 
> 
> On 6/24/2026 5:25 PM, Jinjie Ruan wrote:
> > Support for parallel secondary CPU bringup is already utilized by x86,
> > MIPS and RISC-V. This patch brings this capability to the arm64
> > architecture.
> > 
> > To fully enable HOTPLUG_PARALLEL, this patch implements an arm64-specific
> > arch_cpuhp_init_parallel_bringup() handler.
> > 
> > In parallel bringup, early `set_cpu_present(cpu, 0)` inside
> > cpu_die_early() removes the secondary CPU prematurely, causing the primary
> > CPU's second-stage cpuhp_bringup_mask() sweep to skip it and drop
> > failure logs.
> 
> 
> Hi, Will,
> 
> In parallel bringup, cpu_die_early() calls set_cpu_present(cpu, 0),
> which removes the failing secondary CPU from the mask. This causes the
> primary CPU's cpuhp_bringup_mask() sweep to skip it and drop any failure
> log.
> 
> Have you seen this before, and what do you think about the fix?

Yes, I tried to fix this here:

https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?h=cpu-hotplug&id=7e1e4144a54a80e05017e56e0e28e759bd790daa

by moving the manipulation of the present mask to
arch_cpuhp_cleanup_kick_cpu(). I'd just like to nail down the RCU and
cpufeature issues before posting that lot.

Will

