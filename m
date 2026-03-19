Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB288108E1DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPMVsuI4kmuItDKYtVFIWjVtpoIuKTSxXF3JdWi00Wc=; b=Zkc1gTlhZh/Zs1BlqlQ+pgxjSj
	NoLcn33OQO8ioNsxr/0KftipKhfg5Xj5K06L3wS4RAS79HfxuGM8IYjatTZcYeWr+yOjSyfwDijgj
	jZLE6+GSItFDtk28mamx/j49kYWHrT9Ee0+iMUp+zTC4qQP0hlQR85vpokauh9Lno+WG27/HJc4N6
	7QW45FqpnxIadikTL1hmBrHE4aYEi1S4g+rZzYG/hjZZvGw+lxP0RsEalaF+OE+oEZRd+Auappq0V
	Pm9E0TADonv1XYVWrCCw6ySkq0RrJIvGvB+jETQMakhLCja8He6MCxm5dfdlYuq58LY/1Mg8+mR6Q
	zqtwsPSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Aff-0000000AQ1D-3UOb;
	Thu, 19 Mar 2026 10:32:07 +0000
Received: from sinmsgout03.his.huawei.com ([119.8.177.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Afd-0000000AQ0q-0w7C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 10:32:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UPMVsuI4kmuItDKYtVFIWjVtpoIuKTSxXF3JdWi00Wc=;
	b=X2HmGyscATvKqLvfjO2yF3Do855ux3dK2+g56l6gGCwwXKKS3dOugtLbLLJ4P6i7VKWO3Aeyk
	O/gFYwAyYyEsgqaczjzofwSb/J56rAG6CxM1a6f3UudiMlBWvyGhHDPGF3MP4/ke5NbFOFKVpTX
	Xl1cCYXxQRMFFDZtECPht5M=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fc2201zfszN13J;
	Thu, 19 Mar 2026 18:27:20 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fc2665XcMzJ46tn;
	Thu, 19 Mar 2026 18:30:54 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id CE26740589;
	Thu, 19 Mar 2026 18:31:53 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 19 Mar
 2026 10:31:53 +0000
Date: Thu, 19 Mar 2026 10:31:51 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd
	<nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes
	<Timothy.Hayes@arm.com>
Subject: Re: [PATCH v6 11/39] KVM: arm64: gic-v5: Sanitize
 ID_AA64PFR2_EL1.GCIE
Message-ID: <20260319103151.00006b7e@huawei.com>
In-Reply-To: <20260317113949.2548118-12-sascha.bischoff@arm.com>
References: <20260317113949.2548118-1-sascha.bischoff@arm.com>
	<20260317113949.2548118-12-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_033205_626549_3C343AD9 
X-CRM114-Status: GOOD (  29.65  )
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

On Tue, 17 Mar 2026 11:42:47 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> Add in a sanitization function for ID_AA64PFR2_EL1, preserving the
> already-present behaviour for the FPMR, MTEFAR, and MTESTOREONLY
> fields. Add sanitisation for the GCIE field, which is set to IMP if
> the host supports a GICv5 guest and NI, otherwise.
> 
> Extend the sanitisation that takes place in kvm_vgic_create() to zero
> the ID_AA64PFR2.GCIE field when a non-GICv5 GIC is created. More
> importantly, move this sanitisation to a separate function,
> kvm_vgic_finalize_sysregs(), and call it from kvm_finalize_sys_regs().
> 
> We are required to finalize the GIC and GCIE fields a second time in
> kvm_finalize_sys_regs() due to how QEMU blindly reads out then
> verbatim restores the system register state. This avoids the issue
> where both the GCIE and GIC features are marked as present (an
> architecturally invalid combination), and hence guests fall over. See
> the comment in kvm_finalize_sys_regs() for more details.
> 
> Overall, the following happens:
> 
> * Before an irqchip is created, FEAT_GCIE is presented if the host
>   supports GICv5-based guests.
> * Once an irqchip is created, all other supported irqchips are hidden
>   from the guest; system register state reflects the guest's irqchip.
> * Userspace is allowed to set invalid irqchip feature combinations in
>   the system registers, but...
> * ...invalid combinations are removed a second time prior to the first
>   run of the guest, and things hopefully just work.
> 
> All of this extra work is required to make sure that "legacy" GICv3
> guests based on QEMU transparently work on compatible GICv5 hosts
> without modification.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

Kind of trivial but I'd have split this into a factor out of the helper
(no functional changes) then the additional stuff.
Meh, it's simple enough to perhaps not be worth the effort.

Anyhow, one comment on what to me looks like a slightly inconsistent approach
to sanitization. Anyhow, not that important as code is easy enough to read
and if anything over restricts (which could be relaxed if that ever becomes
relevant).

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


> ---
>  arch/arm64/kvm/sys_regs.c       | 70 +++++++++++++++++++++++++++++----
>  arch/arm64/kvm/vgic/vgic-init.c | 49 ++++++++++++++++-------
>  include/kvm/arm_vgic.h          |  1 +
>  3 files changed, 98 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 42c84b7900ff5..140cf35f4eeb4 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1758,6 +1758,7 @@ static u8 pmuver_to_perfmon(u8 pmuver)
>  
>  static u64 sanitise_id_aa64pfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
>  static u64 sanitise_id_aa64pfr1_el1(const struct kvm_vcpu *vcpu, u64 val);
> +static u64 sanitise_id_aa64pfr2_el1(const struct kvm_vcpu *vcpu, u64 val);
>  static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
>  
>  /* Read a sanitised cpufeature ID register by sys_reg_desc */
> @@ -1783,10 +1784,7 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
>  		val = sanitise_id_aa64pfr1_el1(vcpu, val);
>  		break;
>  	case SYS_ID_AA64PFR2_EL1:
> -		val &= ID_AA64PFR2_EL1_FPMR |
> -			(kvm_has_mte(vcpu->kvm) ?
> -			 ID_AA64PFR2_EL1_MTEFAR | ID_AA64PFR2_EL1_MTESTOREONLY :
> -			 0);
> +		val = sanitise_id_aa64pfr2_el1(vcpu, val);
>  		break;
>  	case SYS_ID_AA64ISAR1_EL1:
>  		if (!vcpu_has_ptrauth(vcpu))
> @@ -2027,6 +2025,23 @@ static u64 sanitise_id_aa64pfr1_el1(const struct kvm_vcpu *vcpu, u64 val)
>  	return val;
>  }
>  
> +static u64 sanitise_id_aa64pfr2_el1(const struct kvm_vcpu *vcpu, u64 val)
> +{
> +	val &= ID_AA64PFR2_EL1_FPMR |
> +	       ID_AA64PFR2_EL1_MTEFAR |
> +	       ID_AA64PFR2_EL1_MTESTOREONLY;

Style wise this feels inconsistent.  For these 3 registers the sanitise simply
clears them if not supported, it doesn't enforce particular values despite
for example MTESTOREONLY only taking values 0 and 1..


> +
> +	if (!kvm_has_mte(vcpu->kvm)) {
> +		val &= ~ID_AA64PFR2_EL1_MTEFAR;
> +		val &= ~ID_AA64PFR2_EL1_MTESTOREONLY;
> +	}
> +
> +	if (vgic_host_has_gicv5())

..but for this one you are forcing a specific value rather than clearing whatever
was there if !vgic_host_has_gicv5()

I don't mind that much though as still obvious what is going on and perhaps
we do need to be careful this takes only a 1 or 0.


> +		val |= SYS_FIELD_PREP_ENUM(ID_AA64PFR2_EL1, GCIE, IMP);
> +
> +	return val;
> +}



