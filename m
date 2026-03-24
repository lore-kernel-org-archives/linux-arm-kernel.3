Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C48F4613D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zFzmznth4w2yq/AjuDCmzQNXGece83X0HFfdgQTCcY=; b=GdfxOhxsxdopwFYM7a47n4up5l
	r2QKpwJSLQQgE0rHwApjK7nxghwVE1TewRKmVmxVBnQmiz6ZeRmxatKgzr1MEW9x9uReq57Rlcb+d
	UoDZYL3G64K692S7wA2Lx7qptrebhcB4xBZtKU+3M6F6Ne2uuS4jFpfm7VrOCvSlHBPnPjP8FzBfV
	P6Jfnj4fWMzpdb2O553LBSKgMWd/kuHbMh3bH8YAT5G1w4GpIXaYuwPKZ/EtlxPmNPlb2KXw9+Yfj
	xw4206HF/vyrMSybwDqvtqGLE4NBud27K/QAbV4T9NJsA15TJDePh8eDaHW5w/NOjVZ1o4KdzxJNw
	Q4lwAHHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Jp-00000001SeF-3XIu;
	Tue, 24 Mar 2026 12:57:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Jn-00000001Sde-1K23
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:57:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 315DA1476;
	Tue, 24 Mar 2026 05:57:03 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 782DF3FAF5;
	Tue, 24 Mar 2026 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774357029; bh=cbQdQbNvEjdIsfIpzc+tru+4caZBQorrCrsoyo8asdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=roaqIxhv41RmoMelSoBtZ+5Kn4t7Tu0gWq6OFEOOCOsmoUfL0FsoV/kbE0tFhFFe8
	 UEkk5hLW69Hp43KhFev3lmo8PiMr1t7QdbFOqGQXCkH6Dym8FxYSCxqlF17cNT7CGv
	 NhWkXrWFbybl2dJS/M9RltJlX5xXSOqsjXALGq+0=
Date: Tue, 24 Mar 2026 12:56:56 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 5/5] KVM: arm64: Add SMC hook for SME dvmsync erratum
Message-ID: <acKKGJG-MUm6TxOm@arm.com>
References: <20260323162408.4163113-1-catalin.marinas@arm.com>
 <20260323162408.4163113-6-catalin.marinas@arm.com>
 <acJkEEXKt_GunFLQ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acJkEEXKt_GunFLQ@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_055711_664105_2570B4B0 
X-CRM114-Status: GOOD (  24.28  )
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

On Tue, Mar 24, 2026 at 10:14:40AM +0000, Vincent Donnefort wrote:
> On Mon, Mar 23, 2026 at 04:24:05PM +0000, Catalin Marinas wrote:
> > From: James Morse <james.morse@arm.com>
> > 
> > C1-Pro cores with SME have an erratum where TLBI+DSB does not complete
> > all outstanding SME accesses. Instead a DSB needs to be executed on the
> > affecteed CPUs. The implication is pages cannot be unmapped from the
> > host stage2 then provided to the guest. Host SME accesses may occur
> > after this point.
> > 
> > This erratum breaks pKVM's guarantees, and the workaround is hard to
> > implement as EL2 and EL1 share a security state meaning EL1 can mask
> > IPI sent by EL2, leading to interrupt blackouts.
> > 
> > Instead, do this in EL3. This has the advantage of a separate security
> > state, meaning lower EL cannot mask the IPI. It is also simpler for EL3
> > to know about CPUs that are off or in PSCI's CPU_SUSPEND.
> > 
> > Add the needed hook.
> > 
> > Signed-off-by: James Morse <james.morse@arm.com>
> > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Oliver Upton <oupton@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Sudeep Holla <sudeep.holla@kernel.org>
> 
> In case this goes in before Will's p-guest series and with just a small comment
> below:
> 
> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

Thanks.

I can leave this patch for later, maybe merge it after -rc1.

> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 38f66a56a766..ef8afbdd421b 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -5,6 +5,8 @@
> >   */
> >  
> >  #include <linux/kvm_host.h>
> > +#include <linux/arm-smccc.h>
> > +
> >  #include <asm/kvm_emulate.h>
> >  #include <asm/kvm_hyp.h>
> >  #include <asm/kvm_mmu.h>
> > @@ -28,6 +30,15 @@ static struct hyp_pool host_s2_pool;
> >  static DEFINE_PER_CPU(struct pkvm_hyp_vm *, __current_vm);
> >  #define current_vm (*this_cpu_ptr(&__current_vm))
> >  
> > +static void pkvm_sme_dvmsync_fw_call(void)
> > +{
> > +	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714)) {
> > +		struct arm_smccc_res res;
> > +
> > +		arm_smccc_1_1_smc(ARM_SMCCC_CPU_WORKAROUND_4193714, &res);
> 
> With hyp tracing in kvmarm/next, this should be hyp_smccc_1_1_smc().

One more reason to leave it after -rc1.

-- 
Catalin

