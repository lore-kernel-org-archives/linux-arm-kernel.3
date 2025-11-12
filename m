Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE2DCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHE8EhKGYlX0B1PjZpnHT0C1OUz0Lxe0eGFBt61TuBw=; b=JrS5GeO5YpVtUkX87AyrvmvHX8
	r5kNa/wo5hXAPldN3SIMtw6G4ruTY94VcFHdH6Q7SNCOTVCH3SJeC/sSC3z1CBgEno8sEiUsOqSum
	+0SGAL8XwCj+3ulQKRe9uzF26cv/MX/0tdWA6Zaj3gNIKNLhk0u1FC94UKJ0NjvhyPm4YhCTodhUc
	lItgCFGqciUg7ZC2/gUpi47++KWHtyZfXNau+li7Uwo8Wdvh83pukFLefCPN9W8XtV5S5WnZm8QJc
	O6RO1I9l3l59Ih3g/wOPy+cdEFzMe8RfdWmJ3PF9MynVVTieipAjLLBD62B9FeAEuKGN5OpC/SAyH
	dCkEeCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8Wd-00000008ch7-2DuO;
	Wed, 12 Nov 2025 10:56:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8Wb-00000008cgN-2AuT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:56:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 570D11515;
	Wed, 12 Nov 2025 02:56:20 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B71933F66E;
	Wed, 12 Nov 2025 02:56:26 -0800 (PST)
Date: Wed, 12 Nov 2025 10:56:24 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Oliver Upton <oupton@kernel.org>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH] KVM: arm64: VHE: Compute fgt traps before activating them
Message-ID: <aRRn2GuSevEplJIW@raptor>
References: <20251112102853.47759-1-alexandru.elisei@arm.com>
 <aRRkD8tAVcGp5zsY@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRRkD8tAVcGp5zsY@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_025629_600118_EBEAF51D 
X-CRM114-Status: GOOD (  28.02  )
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

Hi Oliver,

On Wed, Nov 12, 2025 at 02:40:15AM -0800, Oliver Upton wrote:
> Hi Alex,
> 
> On Wed, Nov 12, 2025 at 10:28:53AM +0000, Alexandru Elisei wrote:
> > On VHE, the Fine Grain Traps registers are written to hardware in
> > kvm_arch_vcpu_load()->..->__activate_traps_hfgxtr(), but the fgt array is
> > computed later, in kvm_vcpu_load_fgt(). This can lead to zero being written
> > to the FGT registers the first time a VCPU is loaded.
> 
> Yikes! This is no good, thank you for spotting it.
> 
> > Also, any changes to
> > the fgt array will be visible only after the VCPU is scheduled out, and
> > then back in, which is not the intended behaviour.
> > 
> > Fix it by computing the fgt array just before the fgt traps are written
> > to hardware.
> > 
> > Fixes: fb10ddf35c1c ("KVM: arm64: Compute per-vCPU FGTs at vcpu_load()")
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> 
> Reviewed-by: Oliver Upton <oupton@kernel.org>
> 
> > ---
> > 
> > Stumbled upon this when running a Linux guest on FVP with FEAT_S1PIE
> > enabled.  Linux touches PIRE0_EL1 very early during boot, in __cpu_setup().
> > HFGWTR_EL2 was 0 the first time the VCPU was run, KVM would then trap
> > the access to PIR0_EL1 (PIRE0_EL1 is an inverted trap) and trigger the
> > BUG_ON(!r->access) from perform_access().
> > 
> > I hacked __activate_traps_hfgxtr() to print the register value for
> > HFGWTR_EL2. Before this patch, during the first vcpu_load(),
> > HFGWTR_EL2 is 0, then it has the correct value. After this patch, it
> > always has the correct value.
> > 
> > If I were to venture a shot in the dark, it might be that the name is a bit
> > misleading - it's kvm_vpcu_load_fgt(), but it doesn't load anything onto
> > hardware, it just computes values. Might be worth renaming to avoid
> > similar ordering issues in the future.
> 
> Ack, naming isn't quite the best here. The idea was for the name to make
> it obvious that it is meant to be used at vcpu_load().

Actually, having a look at the load functions from kvm_arch_vcpu_load(), the
vast majority don't actually write anything to hardware, so the name is actually
in keeping with the convention, and it was just me being confused by the naming
:)

Thanks,
Alex

> 
> Thanks,
> Oliver

