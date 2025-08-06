Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49E6C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FXfno0W+qkpNiKxLIrH/CR0MHBmoVI+HrerVsQ0Cgk=; b=dk9K9+W8glsv14F9i7DBTrFn5y
	w/l0X4myrzhMiKkkYeL6kO/AruSYuABnYYYxqwiKKYvk5lRliv+tW7MPsDtYNiq7dlN2XdQBmZ37T
	1kmOc9OnrDrWbcKegCTMIJ98ccZgZt3gNXyVspyoxKPjmxBHr7ruUQltD7XkFfYKtRjPEdv+zrelz
	tFOjS+MJ/T/MMiDhwhgln4/oZBxEN26qXeCIC6/4N9p4EgqQWkBmxykBwQmi4kHf9/POiS3CQVN0Z
	Iv2OFXZG6SuHreh9vfCAJ0uAIzU82PVhKsyS7fpj5O1M582a5JQHwDpEHdyP/0y4gt7BS6o3zWt6u
	Aj7ZP/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujjDa-0000000G7jZ-3G0V;
	Wed, 06 Aug 2025 18:50:30 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujj48-0000000G6H6-1X7x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 18:40:46 +0000
Date: Wed, 6 Aug 2025 11:40:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754505639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/FXfno0W+qkpNiKxLIrH/CR0MHBmoVI+HrerVsQ0Cgk=;
	b=USMrL2Odl7Ei5b5TqPKxvz+HtGXYtu/kKIKKNcerxJkN8b2z5ic0tmfV6bChFP2sHI3jq4
	ekTWF6YMSsjzqv8UfnHfloXaJJO57ckvtMzNvW2edwhG2ZZZhnMkzm1ExBxozG8ZY0JpST
	KmUqbaAD2hGhdHywq49wBLXp4eYV218=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1 2/2] KVM: arm64: nv: update CPU register PAR_EL1 after
 'at s*'
Message-ID: <aJOhnHCUR0Af4XJt@linux.dev>
References: <20250806141707.3479194-1-volodymyr_babchuk@epam.com>
 <20250806141707.3479194-3-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806141707.3479194-3-volodymyr_babchuk@epam.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_114044_850546_5DDBA1A4 
X-CRM114-Status: GOOD (  22.91  )
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

On Wed, Aug 06, 2025 at 02:17:55PM +0000, Volodymyr Babchuk wrote:
> Previously this code update only vCPU's in-memory value, which is good,
> but not enough, as there will be no context switch after exiting
> exception handler, so in-memory value will not get into actual
> register.
> 
> It worked good enough for VHE guests because KVM code tried fast path,
> which of course updated real PAR_EL1.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>  arch/arm64/kvm/sys_regs.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 7b8a0a6f26468..ab2b5e261d312 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -3463,6 +3463,9 @@ static bool handle_at_s1e2(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
>  
>  	__kvm_at_s1e2(vcpu, op, p->regval);
>  
> +	/* No context switch happened, so we need to update PAR_EL1 manually */
> +	write_sysreg(vcpu_read_sys_reg(vcpu, PAR_EL1), par_el1);
> +

Ok, this had me thoroughly confused for a moment. The bug is actually in
kvm_write_sys_reg() which is supposed to update the sysreg value when
things are loaded on the CPU. __kvm_at_s1e2() is doing the right thing
by calling this accessor.

For registers like PAR_EL1 that don't have an EL2->EL1 mapping we assume
they belong to the EL1 context and thus are in-memory when in a hyp
context. TPIDR(RO)_EL0 is similarly affected.

This is a bit of an ugly hack, but something like the following should
get things working if you're able to test it:

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ad2548477257..32f8d1de8f1a 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -149,6 +149,22 @@ static bool get_el2_to_el1_mapping(unsigned int reg,
 	}
 }
 
+/*
+ * Special-cased registers that do not have an ELx mapping and are always
+ * loaded on the CPU.
+ */
+static bool reg_has_elx_mapping(int reg)
+{
+	switch (reg) {
+	case TPIDR_EL0:
+	case TPIDRRO_EL0:
+	case PAR_EL1:
+		return false;
+	default:
+		return true;
+	}
+}
+
 u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
 {
 	u64 val = 0x8badf00d8badf00d;
@@ -158,6 +174,9 @@ u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
 	if (!vcpu_get_flag(vcpu, SYSREGS_ON_CPU))
 		goto memory_read;
 
+	if (!reg_has_elx_mapping(reg))
+		goto sysreg_read;
+
 	if (unlikely(get_el2_to_el1_mapping(reg, &el1r, &xlate))) {
 		if (!is_hyp_ctxt(vcpu))
 			goto memory_read;
@@ -204,6 +223,7 @@ u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
 	if (unlikely(is_hyp_ctxt(vcpu)))
 		goto memory_read;
 
+sysreg_read:
 	if (__vcpu_read_sys_reg_from_cpu(reg, &val))
 		return val;
 
@@ -219,6 +239,9 @@ void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
 	if (!vcpu_get_flag(vcpu, SYSREGS_ON_CPU))
 		goto memory_write;
 
+	if (!reg_has_elx_mapping(reg))
+		goto sysreg_write;
+
 	if (unlikely(get_el2_to_el1_mapping(reg, &el1r, &xlate))) {
 		if (!is_hyp_ctxt(vcpu))
 			goto memory_write;
@@ -259,6 +282,7 @@ void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
 	if (unlikely(is_hyp_ctxt(vcpu)))
 		goto memory_write;
 
+sysreg_write:
 	if (__vcpu_write_sys_reg_to_cpu(val, reg))
 		return;
 
-- 
Thanks,
Oliver

