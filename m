Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4102CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 23:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDBZFkLz0GggeQl7SlWwkqdUmwc7HPIN1BkTH8Y1iZ8=; b=ZRnrCMHYpyafuKqX/ti5ywPKGH
	apUVnqEFTyI1OIlrzHEx8o+s2zuSVRsr4Vhjd5skOT4aDTlX4e+xwHVUcb3YPESBV8QUCGHIUAVbd
	CJzJMQdp5kEJvQLLAavdsNKnlqNLShAO223EFWBwR8P4PXNmWwKHapOl9SnGpjBMQB0tgQWXeNdOF
	ZlT5wiVvhe8xRAJp00ixJ6wSD67u/mBNwLlz5eXPh0DPQxaz1Kw5MWiri0Jk8uGz7F0l56N87vXQX
	rFLIUFXLzkLcgkdHobFd1AnkETYqb8GgcxiyBeU9ZVddv7A9pW8BxNpU6kYbCXgbwWBCkXUWu2CWT
	6f7O+mAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgnr-00000004k0J-3jAy;
	Tue, 29 Sep 2026 23:00:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgnq-00000004k09-254U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 23:00:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 754F260234;
	Tue, 29 Sep 2026 23:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A151F000FF;
	Tue, 29 Sep 2026 23:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790722801;
	bh=jDBZFkLz0GggeQl7SlWwkqdUmwc7HPIN1BkTH8Y1iZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OnPa72dfC8teWOzySRtS1+oOP4l6EM26lnfhkoDLScdBQn7mcgGaoF3QPfpoyWXcO
	 rz0CoAWmDS19pHfyRb8awgt0CimJq2Ij+4DqMZmObiRw2mcHuy+iMH2zgViUS5VobF
	 y84si221qWShTl8trROLRPJbpufBLxVWZRu+2yt1UiWGjVhgsNnQ0aukxmBP3PVRfi
	 GdfeaK5HR+PMH2VKF2ISntx5GRVl+yEkcyGoqzqt+43V/7LTSUquyemVgAV61shxy8
	 Xh7vhitFiZuGr+cYjj3bx1392mFs7nPJZSSnPedIctRpK9WySGjdVY5a698+pX6bXB
	 zk+joXQjOUIOQ==
Date: Tue, 29 Sep 2026 15:59:59 -0700
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Check ID_AA64DFR0_EL1.PMUVer in
 reset_pmevtyper()
Message-ID: <arxC7w36HrgRQiRy@kernel.org>
References: <20260929220411.3756519-1-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929220411.3756519-1-coltonlewis@google.com>
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

Hi Colton,

On Tue, Sep 29, 2026 at 10:04:11PM +0000, Colton Lewis wrote:
> When userspace initializes a vCPU with KVM_ARM_VCPU_PMU_V3 but sets
> ID_AA64DFR0_EL1.PMUVer to NI (0) or IMP_DEF (0xf, which is sanitized to
> NI), resetting the vCPU invokes reset_pmevtyper(). Because
> reset_pmevtyper() only checks kvm_vcpu_has_pmu(), it proceeds to call
> kvm_pmu_evtyper_mask(), which reads PMUVer == 0 from ID_AA64DFR0_EL1 and
> triggers a WARN_ONCE("Unknown PMU version 0") in __kvm_pmu_event_mask().
> 
> Check ID_AA64DFR0_EL1.PMUVer directly in reset_pmevtyper() via
> kvm_has_feat() instead of kvm_vcpu_has_pmu() so that PMEVTYPER<n>_EL0
> resets to 0 without querying the event mask when PMUv3 is not exposed to
> the guest.

So this goes a bit further than just this WARN_ONCE()... Ultimately if
FEAT_PMUv3 is hidden via the ID registers then we should expect KVM to
emulate these sysregs as UNDEF.

> Fixes: bc512d6a9b92 ("KVM: arm64: Make PMEVTYPER<n>_EL0.NSH RES0 if EL2 isn't advertised")
> Suggested-by: Oliver Upton <oupton@kernel.org>
> Cc: stable@vger.kernel.org

Avoiding a WARN_ONCE() is not stable material.

> Assisted-by: LLM
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/arm64/kvm/sys_regs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index a2f4e769a4282..0bb3c2f10a22c 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1060,7 +1060,7 @@ static u64 reset_pmevcntr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
>  static u64 reset_pmevtyper(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
>  {
>  	/* This thing will UNDEF, who cares about the reset value? */
> -	if (!kvm_vcpu_has_pmu(vcpu))
> +	if (!kvm_has_feat(vcpu->kvm, ID_AA64DFR0_EL1, PMUVer, IMP))
>  		return 0;

I have this diff locally, separating the visibility change into a
separate patch. Do you want to give it a spin?

Thanks,
Oliver

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 5b1af7e2176f..e2b28dbc0451 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -50,8 +50,11 @@ static u32 __kvm_pmu_event_mask(unsigned int pmuver)
 	case ID_AA64DFR0_EL1_PMUVer_V3P5:
 	case ID_AA64DFR0_EL1_PMUVer_V3P7:
 		return GENMASK(15, 0);
-	default:		/* Shouldn't be here, just for sanity */
+	default:
+		/* Shouldn't be here, just for sanity */
 		WARN_ONCE(1, "Unknown PMU version %d\n", pmuver);
+		fallthrough;
+	case ID_AA64DFR0_EL1_PMUVer_NI:
 		return 0;
 	}
 }
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 44aae52c473d..8315a188676f 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1028,7 +1028,7 @@ static unsigned int hidden_visibility(const struct kvm_vcpu *vcpu,
 static unsigned int pmu_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *r)
 {
-	if (kvm_vcpu_has_pmu(vcpu))
+	if (kvm_has_feat(vcpu->kvm, ID_AA64DFR0_EL1, PMUVer, IMP))
 		return 0;
 
 	return REG_HIDDEN;
@@ -1058,10 +1058,6 @@ static u64 reset_pmevcntr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 
 static u64 reset_pmevtyper(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 {
-	/* This thing will UNDEF, who cares about the reset value? */
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return 0;
-
 	reset_unknown(vcpu, r);
 	__vcpu_rmw_sys_reg(vcpu, r->reg, &=, kvm_pmu_evtyper_mask(vcpu->kvm));
 

