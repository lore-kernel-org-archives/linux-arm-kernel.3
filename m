Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26620C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1L47aBsv1HwLFqXhSYjEBIyJW3Jn0EXXldYhFKkblcM=; b=oHxAEI3rg5uwL5LNFBXBJH6m5m
	+y4wjyUzMtmhkKXAAyad5SbuTOZT4z9D+cSMNo5MBSaSULbkaxwoCnM1fNIUuirovxLpb3Lfz/13R
	CKKti16fn1u7aN2H8SFuzgVyMW6j/dY5i7rMu+gdsVek7Qd+oEsnF2ngAvEI2O2cyyGrrqGF0jQ0b
	8gw4KO0y+j1VTcROIYuMaRCs2JMiDx07OE+ZJ99gtUxXFGVv5Lb/snatn5YHKKWt+2vaffuP+MtZc
	xEKZE+oHnDfzSXroxbhGIzzR1Ef+B5ZguIt/CNmRGy5zT2xREOWngkND+RjE3pxFjowRwCqwD5Bc6
	zYXA+xzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPuY-0000000DVYu-1j3b;
	Fri, 21 Aug 2026 14:07:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPuX-0000000DVYT-2kSi
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Aug 2026 14:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1L47aBsv1HwLFqXhSYjEBIyJW3Jn0EXXldYhFKkblcM=; b=enrEtQjFp74dfKC9QJTmhXlCFR
	QFhryTHQyh7ItJnVEZnLztAWITS53nIwHlDgpje3LWs+86LD9KKXBrcghKu77Va+ZNjC4GTIHOnbb
	ti3eGwiXYPXIwrRt6eUzIZBRPPd+aZXO1sUkOGKyxJkZz4WI+Omdk338zMLUMxBCxOAwFWub7qDUZ
	85tQ4oEnXrFo4Z8awebn7ZhgklPnEusWZ7i5rxYkD58KiAJGuiEvenTndWnr5nw5Q6l79En0X8LsO
	TysPQe0LBt1GBwrdZE9QKYhEwkIflAgrbn2Y4DXrAq2gjNxx/QJt2LCpCaYL/wuqUkjwD5MBXoFSn
	eAFhexDw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wxPuU-00000003ozx-0Qyc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:07:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE67714BF;
	Fri, 21 Aug 2026 07:07:46 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D3A83F8D6;
	Fri, 21 Aug 2026 07:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787321270; bh=JCVdMMYyyY2M5FDk6kI1z8YBWx48BH6o/yTqAholXpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TIx9PfyWkBjxOnF1Ik49l805DHl+r9+j/UKZI4i4c9xo3rcO/p9QApglM0XP2VIbQ
	 ZmNgoQnuAMe5ai4uQoIrF+ezzShF2WKxnFnOyquwLHjeX/D6nRK0ek2tTTQk+n/o0K
	 g5ITHTXpio2d27u9y2iNhsPMvPCaUuog/vbIr9Jk=
Date: Fri, 21 Aug 2026 15:07:36 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 03/14] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <up3nfebqc42ykeboaqng22ib3ndgkecuwtuz4bdstjzebsuesq@2fy6i736x4gj>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
 <20260812-arm64-gcs-v19-3-9105afd828ac@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-arm64-gcs-v19-3-9105afd828ac@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_150754_691133_18DF9A2E 
X-CRM114-Status: GOOD (  20.00  )
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

On Wed, Aug 12, 2026 at 08:12:02PM +0100, Mark Brown wrote:
> GCS introduces a number of system registers, on systems with GCS we need
> to context switch them and expose them to VMMs to allow guests to use
> GCS.
> 
> In order to allow guests to use GCS we also need to configure
> HCRX_EL2.GCSEn, if this is not set GCS instructions will be noops and
> CHKFEAT will report GCS as disabled.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_emulate.h       |  3 +++
>  arch/arm64/include/asm/kvm_host.h          | 14 ++++++++++
>  arch/arm64/include/asm/vncr_mapping.h      |  2 ++
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 31 ++++++++++++++++++++++
>  arch/arm64/kvm/hyp/vhe/sysreg-sr.c         | 10 +++++++
>  arch/arm64/kvm/sys_regs.c                  | 42 ++++++++++++++++++++++++++++++
>  6 files changed, 102 insertions(+)
> 

[...]

> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index bae2c4f92ef5..1f0da8988961 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h

[...]

> @@ -1648,6 +1658,10 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
>  #define kvm_has_sctlr2(k)				\
>  	(kvm_has_feat((k), ID_AA64MMFR3_EL1, SCTLRX, IMP))
>  
> +#define kvm_has_gcs(k)					\
> +	(system_supports_gcs() &&			\
> +	 kvm_has_feat((k), ID_AA64PFR1_EL1, GCS, IMP))
> +
>  static inline bool kvm_arch_has_irq_bypass(void)
>  {
>  	return true;

[...]

> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index a17cbe7582de..053d7b3c5104 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h

[...]

> @@ -131,6 +137,17 @@ static inline bool ctxt_has_sctlr2(struct kvm_cpu_context *ctxt)
>  	return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
>  }
>  
> +static inline bool ctxt_has_gcs(struct kvm_cpu_context *ctxt)
> +{
> +	struct kvm_vcpu *vcpu;
> +
> +	if (!cpus_have_final_cap(ARM64_HAS_GCS))
> +		return false;
> +
> +	vcpu = ctxt_to_vcpu(ctxt);
> +	return kvm_has_feat(kern_hyp_va(vcpu->kvm), ID_AA64PFR1_EL1, GCS, IMP);
> +}

This seems to duplicate some work done in kvm_has_gcs(), can we use
kvm_has_gcs() in this function?

static inline bool ctxt_has_gcs(struct kvm_cpu_context *ctxt)
{
	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);

	return kvm_has_gcs(kern_hyp_va(vcpu->kvm));
}

Thanks,
Wei-Lin Chang

[...]

