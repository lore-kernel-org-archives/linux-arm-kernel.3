Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00919CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 10:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHk+A5Sdr78XfGzIL/hT9Sc/BCLMrjVL63nMxl+dTOQ=; b=nc2QkleFrQXYnH8iQ3KnwQ+I2R
	IxzFFoAvl1ei9WYZDKjvAzZJYridbaVI/QFEt7N5g0OOqbnwazDLL3mRb+7/QidigLjZ3pEWPmKX0
	Pf3LkXulc+k/rT/xnuKe1kqwBvgR91THJxT/76MJPmImWkVCuP5KIoEDBL96IsRC75nBS3kuIuyTx
	78w4bt2HuA67ZHexDKCmcRzvV5uG8Uo/ZrQLOBxOzMW1lX2qrp0O6aDc5SbD4oJMtAry8fIj491F4
	DP+VL4hmzvv/KOLCCBIyIs6+YnZIM/rnUCz+F8lcMuGzX3Hi5LMWqNpkuAeBHz0LWTV+M6xlnu3/J
	PTDyqT3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCENQ-00000008YjC-2h8Y;
	Thu, 01 Oct 2026 10:51:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCENP-00000008YiW-2QOv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 10:50:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE01A60A57;
	Thu,  1 Oct 2026 10:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A46E1F000FF;
	Thu,  1 Oct 2026 10:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790851858;
	bh=xHk+A5Sdr78XfGzIL/hT9Sc/BCLMrjVL63nMxl+dTOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F/0f4Qi1BcZboIFrJ8gvrQdKLcHA689Xa+ziPcEImnPg59/XyNF0X4WCkbq2x3T5T
	 iOqpbm4jE/zo8FvcldMI9OWZX/ySs/0+U0x/TM+17FS4Q3HwX/fmvlEH7E4TW6Adl8
	 CcZ6Di5+gzxs8F3M39gsocZJkxPirxl3ldGTV64YQHZLQoCFGdFmbgNdrr5Sx6OG8B
	 Rf5xq4yWeXQIozISHrooVwHzlA+LOCPZsU0wVIjGHJEazkeDYSA8aNRwFO8psAkHfZ
	 9jSBMsd5HLL2ZfQf5Gf6O2qYy6a99kc69zR4PKlN3GehsPwVszioku+gciX+bAcdga
	 JI9wNQYCcOGQA==
Date: Thu, 1 Oct 2026 11:50:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 02/15] KVM: arm64: Refuse to start a guest with S1PIE
 or S1POE but not TCR2
Message-ID: <ar4yT297fh45gwM6@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-2-3556644cd927@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-arm64-gcs-v21-2-3556644cd927@kernel.org>
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

On Wed, Sep 30, 2026 at 10:48:12PM +0100, Mark Brown wrote:

> Fixes: 663abf04ee4d ("KVM: arm64: Make PIR{,E0}_EL1 save/restore conditional on FEAT_TCRX")
> Signed-off-by: Mark Brown <broonie@kernel.org>

Great, this looks like the most sensible way of resolving the issue with
userland being able to trigger a kernel oops due to the save/restore
registers optimisations.

It's also entirely sensible to disallow completely broken configurations
like this.

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 44aae52c473d..3ae293798b27 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c

> @@ -5928,6 +5946,9 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
>  		kvm_vgic_finalize_idregs(kvm);
>  	}
>
> +	if (!kvm_validate_id_regs(vcpu->kvm))
> +		return -EINVAL;
> +

Seems like the right place to put it as part of the finalisation process,
run once per VM and guaranteeing the invariant so it's guaranteed that
ctx_has_s1pie() -> ctxt_has_tcrx() and ctx_has_s1poe() -> ctxt_has_tcrx().

(Just working it through for my own understanding), tracing through it ends
up at struct kvm_arch->id_regs[]:

kvm_has_tcr2()
  -> kvm_has_feat()
    -> __kvm_has_feat()
      -> kvm_cmp_feat()
        -> kvm_cmp_feat_unsigned()
	  -> get_idreg_field_unsigned()
	    -> kvm_read_vm_id_reg()
	      -> __vm_id_reg()
	        -> ka->id_regs[]

Which will all have been populated by here. however failing at this point
will stop KVM_ARCH_FLAG_HAS_RUN_ONCE from being set (also obviously your
other series separately fixes the issue with KVM_ARCH_FLAG_FGU_INITIALIZED
being set with !KVM_ARCH_FLAG_HAS_RUN_ONCE).

--
Cheers, Lorenzo

