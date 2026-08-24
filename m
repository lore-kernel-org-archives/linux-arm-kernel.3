Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A3BC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReE4v/AXKGlfRF1+yGu6+RLz4T+N5BL3J3XV6ZQxP80=; b=Ez2AhlOrEJ0MrQ8aqryj5hEs+x
	5SKTKSHJwVkEvCsXbeDuKxiWOMkULYe6HSYH6cFthJV75kNkGbLRr1Vad03CoD5EXnr2Q7f08SuC8
	6OvcvkmSBwxNyPCpvHL38AgyUVVtn14cdt8q2vkHU1GM3torCZWMD1xGBESySKBXOZNZEqQO4bHq4
	q0zUAIIzz7oOSs/oOq9S7YphMsxLCzogEIGlPNpI1teKXVHFBtOtLQGeZpYJIyBq7KEEHyQyvxjoP
	vXuFNig8VCKAIZ4C+ixpksR7YuAsQL75dWBFEjX9xm7fTjm63swam+vpc942KcWs/CnU7rArtsuy3
	FWBalT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXU2-0000000H2ea-1Evz;
	Mon, 24 Aug 2026 16:25:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXTz-0000000H2df-1vS1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:25:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E782D16F2;
	Mon, 24 Aug 2026 09:25:05 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A6D23F85F;
	Mon, 24 Aug 2026 09:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787588709; bh=l0zojGsMsGNgqs2R/TURzvKx5nHn3Uw+B2dqC+xyz6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIOAsiBtOY0kYfuovVHPIsfJwSEgnj9Id9svYkH4BwGORMkuSEF3wxr9zCcaELjCY
	 KTVxCNCiwlKBVgHm80DKd3lrMNSINarzu56ik2J8f8hDEM1dizJgf20yBW9nrnMZA8
	 InPkW8Tz6rYoCZy1YUv4U58nZalwIKEIn5nBC29o=
Date: Mon, 24 Aug 2026 17:25:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2] arm64: Defer the GMID_EL1 read to
 {init,update}_cpu_features()
Message-ID: <aoxwYb8cpwDV7Q8A@arm.com>
References: <20260824071004.504894-1-fuad.tabba@linux.dev>
 <aoxCk5lFQv6lFwHQ@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoxCk5lFQv6lFwHQ@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_092511_581303_71DDC980 
X-CRM114-Status: GOOD (  35.13  )
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

On Mon, Aug 24, 2026 at 02:09:39PM +0100, Will Deacon wrote:
> On Mon, Aug 24, 2026 at 08:10:04AM +0100, Fuad Tabba wrote:
> > __cpuinfo_store_cpu() gates the GMID_EL1 read on the raw
> > ID_AA64PFR1_EL1, so it reads the register on MTE hardware even when the
> > kernel has disabled MTE (CONFIG_ARM64_MTE=n or arm64.nomte). KVM sets
> > HCR_EL2.TID5 in that case, which traps the read to EL2 and injects an
> > UNDEF:
> > 
> >   Internal error: Oops - Undefined instruction: 0000000002000000 [#1]
> >   pc : __cpuinfo_store_cpu+0xf4/0x264
> >   Call trace:
> >    __cpuinfo_store_cpu+0xf4/0x264 (P)
> >    secondary_start_kernel+0xc8/0x1d0
> >    __secondary_switched+0xc0/0xc4
> >   Kernel panic - not syncing: Attempted to kill the idle task!
> > 
> > Only pKVM is affected, and only for a CPU that is offlined and brought
> > back online. Every CPU's first bring-up precedes KVM's initcall, and
> > pKVM refuses CPU_ON for a CPU that was not online when KVM initialised,
> > so hotplug is the only path to cpuinfo_store_cpu() with TID5 set. pKVM's
> > PSCI CPU_ON relay sets the host HCR before the CPU enters EL1, whereas
> > plain nVHE sets it at CPUHP_AP_KVM_ONLINE, after cpuinfo_store_cpu().
> > 
> > Defer the read to {init,update}_cpu_features() and gate it on the
> > sanitised ID register, as MPAM already does. system_supports_mte()
> > cannot serve as the gate, as update_cpu_features() also runs during
> > initial SMP bring-up, before smp_cpus_done() calls
> > setup_system_features(). The init path gains the CONFIG_ARM64_MTE test
> > the update path already had, leaving SYS_GMID_EL1 uninitialised when
> > MTE is compiled out, where its only other user (lib/mte.S) is not
> > built.
> > 
> > Fixes: f35abcbb8a084 ("KVM: arm64: Trap MTE access and discovery when MTE is disabled")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> 
> [...]
> 
> > diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> > index d50e2a9b066b3..c8967f185e3dd 100644
> > --- a/arch/arm64/kernel/cpuinfo.c
> > +++ b/arch/arm64/kernel/cpuinfo.c
> > @@ -502,12 +502,14 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
> >  	info->reg_id_aa64smfr0 = read_cpuid(ID_AA64SMFR0_EL1);
> >  	info->reg_id_aa64fpfr0 = read_cpuid(ID_AA64FPFR0_EL1);
> >  
> > -	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
> > -		info->reg_gmid = read_cpuid(GMID_EL1);
> > -
> >  	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
> >  		__cpuinfo_store_cpu_32bit(&info->aarch32);
> >  
> > +	/*
> > +	 * info->reg_gmid deferred to {init,update}_cpu_features because
> > +	 * reading it traps to EL2 when MTE is disabled.
> > +	 */
> 
> I don't think we should defer this, as I've been actively doing the
> opposite for parallel CPU onlining (where the ID registers can be read
> concurrently by incoming CPUs to amortise the cost of a trap) and also
> for the RNG traps during early boot:
> 
> https://lore.kernel.org/all/annJ0oDB2HObQC5j@willie-the-truck/
> 
> If you look at the diff I sent in the thread above (I didn't get a
> reply), the idea is that __read_sysreg_by_encoding() reads from the ID
> register values stashed by cpuinfo_store_cpu(). So you could use that
> to check id_aa64pfr1 before reading gmid, as it will give you the
> sanitised view.

Since cpu_data[] has the raw per-cpu regs, I think it makes a lot of
sense to read the cached values in __read_sysreg_by_encoding() than
issuing the MRS again.

Given Marc's earlier series to make config=n and override behave
similarly, I wonder whether we should just store the overridden value in
cpu_data (with the clamp Suzuki was proposing to avoid making up
features on the command line). We can then get rid of the override
applied in various places and it might be easier to take the config into
account as well.

-- 
Catalin

