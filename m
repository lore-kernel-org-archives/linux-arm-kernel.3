Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DC8CEFCE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wb5o8/fZ2wsNVSXaJfgOWmjxUYJoJ8v1k5aUk8z0HuQ=; b=ylCvKBAJVg4SbD8N5shAZ9PwUe
	ummM+PmFVk/pUm8yQO2EmkE3v3HpWu1JYE+oB19N5lS6SUjBSLQlENTQWAUu9YFiMfJgXIZlWp/kU
	PLqT3a8pBND1Mv30/B0aZYmpE7lQ2cDW0O9PIpIFXfBZUrrG6ryQY+fslBnHrpowf+MMnfrdgl8Kj
	YNtdmBb/opglwwl6b9ob/Zmr0DJswacbXpqMQ0S3RdZlDcYPr95YurKLrl244TMAPa6tMTfRiJ+uo
	kz6DhFlPoLoWPIiKxp1S5Fhgfh4GgTbUtoHlBg3znWbTnSBsbF0P9HcVYoDyk4WutDkPqvmUt8U/W
	2tNnMmwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBML-0000000Ddr3-1JPu;
	Tue, 06 Jan 2026 18:00:45 +0000
Received: from sinmsgout03.his.huawei.com ([119.8.177.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBMH-0000000DdqQ-1bYx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 18:00:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Wb5o8/fZ2wsNVSXaJfgOWmjxUYJoJ8v1k5aUk8z0HuQ=;
	b=j7e4zwk52C4H3xsQMXEn5K9tW8k1jeo3HA2KntCmIYU930/3UbM8KhIHs+2VV+Zg4GFGgQbz5
	EH8flYINJrnpOHcRFvWyHNrNBiPvkcP72iihDk88dXIsz2o6HcRs8fKH4l49nb1mHI1EV9tTmSF
	yXayUSWsyogeWQZW/jQhf68=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4dlzRf3353zMv26;
	Wed,  7 Jan 2026 01:58:22 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlzV14YyKzJ46p6;
	Wed,  7 Jan 2026 02:00:25 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 8BD564056F;
	Wed,  7 Jan 2026 02:00:27 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 18:00:26 +0000
Date: Tue, 6 Jan 2026 18:00:22 +0000
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
Subject: Re: [PATCH v2 02/36] KVM: arm64: gic-v3: Switch vGIC-v3 to use
 generated ICH_VMCR_EL2
Message-ID: <20260106180022.00006dcd@huawei.com>
In-Reply-To: <20251219155222.1383109-3-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-3-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_100042_467916_B00C4A86 
X-CRM114-Status: GOOD (  29.35  )
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

On Fri, 19 Dec 2025 15:52:36 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> From: Sascha Bischoff <Sascha.Bischoff@arm.com>
> 
> The VGIC-v3 code relied on hand-written definitions for the
> ICH_VMCR_EL2 register. This register, and the associated fields, is
> now generated as part of the sysreg framework. Move to using the
> generated definitions instead of the hand-written ones.
> 
> There are no functional changes as part of this change.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Hi Sascha

Happy new year.  There is a bit in here that isn't obviously going
to result in no functional change. I'm too lazy to chase where the value
goes to check it it's a real bug or not.

Otherwise this is inconsistent on whether the _MASK or define without
it from the sysreg generated header is used in FIELD_GET() / FIELD_PREP()

I'd always use the _MASK version.

> ---
>  arch/arm64/include/asm/sysreg.h      | 21 ---------
>  arch/arm64/kvm/hyp/vgic-v3-sr.c      | 64 ++++++++++++----------------
>  arch/arm64/kvm/vgic/vgic-v3-nested.c |  8 ++--
>  arch/arm64/kvm/vgic/vgic-v3.c        | 48 ++++++++++-----------
>  4 files changed, 54 insertions(+), 87 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 9df51accbb025..b3b8b8cd7bf1e 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h


> @@ -865,12 +865,12 @@ static void __vgic_v3_write_eoir(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
>  
>  static void __vgic_v3_read_igrpen0(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
>  {
> -	vcpu_set_reg(vcpu, rt, !!(vmcr & ICH_VMCR_ENG0_MASK));
> +	vcpu_set_reg(vcpu, rt, vmcr & ICH_VMCR_EL2_VENG0_MASK);
>  }
>  
>  static void __vgic_v3_read_igrpen1(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
>  {
> -	vcpu_set_reg(vcpu, rt, !!(vmcr & ICH_VMCR_ENG1_MASK));
> +	vcpu_set_reg(vcpu, rt, vmcr & ICH_VMCR_EL2_VENG1_MASK);

It's more than possible it doesn't matter, but this isn't functionally
equivalent.
The original set passed 1 as the val parameter to vcpu_set_reg(), and now it passes 2.

Given these don't take a bool I'd use FIELD_GET() for both this and the veng0 one above.
Or put back the horrible !!

>  }

> @@ -916,10 +916,8 @@ static void __vgic_v3_write_bpr0(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
>  	if (val < bpr_min)
>  		val = bpr_min;
>  
> -	val <<= ICH_VMCR_BPR0_SHIFT;
> -	val &= ICH_VMCR_BPR0_MASK;
> -	vmcr &= ~ICH_VMCR_BPR0_MASK;
> -	vmcr |= val;
> +	vmcr &= ~ICH_VMCR_EL2_VBPR0_MASK;
> +	vmcr |= FIELD_PREP(ICH_VMCR_EL2_VBPR0, val);

You could uses FIELD_MODIFY() though that would mean using the _MASK
define for both places.  Not sure why the sysreg script generates both
(always have same actual value). I guess the idea is it is a little
shorter if you don't want to be explicit that the intent is to use it
as a mask.

I'd just use the _MASK defines throughout rather than trying for another
consistent scheme. 




>  
>  	__vgic_v3_write_vmcr(vmcr);
>  }
> @@ -929,17 +927,15 @@ static void __vgic_v3_write_bpr1(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
>  	u64 val = vcpu_get_reg(vcpu, rt);
>  	u8 bpr_min = __vgic_v3_bpr_min();
>  
> -	if (vmcr & ICH_VMCR_CBPR_MASK)
> +	if (FIELD_GET(ICH_VMCR_EL2_VCBPR_MASK, val))
>  		return;
>  
>  	/* Enforce BPR limiting */
>  	if (val < bpr_min)
>  		val = bpr_min;
>  
> -	val <<= ICH_VMCR_BPR1_SHIFT;
> -	val &= ICH_VMCR_BPR1_MASK;
> -	vmcr &= ~ICH_VMCR_BPR1_MASK;
> -	vmcr |= val;
> +	vmcr &= ~ICH_VMCR_EL2_VBPR1_MASK;
> +	vmcr |= FIELD_PREP(ICH_VMCR_EL2_VBPR1, val);

As above, FIELD_MODIFY() makes this a one liner.

>  
>  	__vgic_v3_write_vmcr(vmcr);
>  }
> @@ -1029,19 +1025,15 @@ static void __vgic_v3_read_hppir(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
>  
>  static void __vgic_v3_read_pmr(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
>  {
> -	vmcr &= ICH_VMCR_PMR_MASK;
> -	vmcr >>= ICH_VMCR_PMR_SHIFT;
> -	vcpu_set_reg(vcpu, rt, vmcr);
> +	vcpu_set_reg(vcpu, rt, FIELD_GET(ICH_VMCR_EL2_VPMR, vmcr));
>  }
>  
>  static void __vgic_v3_write_pmr(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
>  {
>  	u32 val = vcpu_get_reg(vcpu, rt);
>  
> -	val <<= ICH_VMCR_PMR_SHIFT;
> -	val &= ICH_VMCR_PMR_MASK;
> -	vmcr &= ~ICH_VMCR_PMR_MASK;
> -	vmcr |= val;
> +	vmcr &= ~ICH_VMCR_EL2_VPMR_MASK;
> +	vmcr |= FIELD_PREP(ICH_VMCR_EL2_VPMR, val);

FIELD_MODIFY() should be fine here I think.

>  
>  	write_gicreg(vmcr, ICH_VMCR_EL2);
>  }
> @@ -1064,9 +1056,9 @@ static void __vgic_v3_read_ctlr(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
>  	/* A3V */
>  	val |= ((vtr >> 21) & 1) << ICC_CTLR_EL1_A3V_SHIFT;
>  	/* EOImode */
> -	val |= ((vmcr & ICH_VMCR_EOIM_MASK) >> ICH_VMCR_EOIM_SHIFT) << ICC_CTLR_EL1_EOImode_SHIFT;
> +	val |= FIELD_GET(ICH_VMCR_EL2_VEOIM, vmcr) << ICC_CTLR_EL1_EOImode_SHIFT;

Bit ugly to mix and match styles.
ICC_CTRL_EL1_EOImode_MASK is defined so you could do a FIELD_PREP()

>  	/* CBPR */
> -	val |= (vmcr & ICH_VMCR_CBPR_MASK) >> ICH_VMCR_CBPR_SHIFT;
> +	val |= FIELD_GET(ICH_VMCR_EL2_VCBPR, vmcr);
>  
>  	vcpu_set_reg(vcpu, rt, val);
>  }
> @@ -1076,14 +1068,14 @@ static void __vgic_v3_write_ctlr(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
>  	u32 val = vcpu_get_reg(vcpu, rt);
>  
>  	if (val & ICC_CTLR_EL1_CBPR_MASK)
> -		vmcr |= ICH_VMCR_CBPR_MASK;
> +		vmcr |= ICH_VMCR_EL2_VCBPR_MASK;
>  	else
> -		vmcr &= ~ICH_VMCR_CBPR_MASK;
> +		vmcr &= ~ICH_VMCR_EL2_VCBPR_MASK;
These could be something like

	FIELD_MODIFY(ICH_VMCR_EL2_VCBPR_MASK, &vmcr,
		     FIELD_GET(ICC_CTRL_EL1_CBPR_MASK, val));

More compact. Whether more readable is a little bit more debatable.

>  
>  	if (val & ICC_CTLR_EL1_EOImode_MASK)
> -		vmcr |= ICH_VMCR_EOIM_MASK;
> +		vmcr |= ICH_VMCR_EL2_VEOIM_MASK;
>  	else
> -		vmcr &= ~ICH_VMCR_EOIM_MASK;
> +		vmcr &= ~ICH_VMCR_EL2_VEOIM_MASK;
>  
>  	write_gicreg(vmcr, ICH_VMCR_EL2);
>  }

Thanks,

Jonathan


