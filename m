Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99422C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajyOyG8K6JPFk2IWC1XA9XBmELTfRS1zEbB5Vd0Gkmo=; b=pXgWYJAppYQ2NPnRVvIQiJChAx
	GXY/2xoUxPiwTJgicXLPRChz6GsV6E/Ot1t/5dSEuOfn24sIahbA0McC5HjFM883j1ClVNs3uzrvl
	GJjQyq0HQT7ReIEGYwtyTYr+8VR56uFzDEFU5WsXyuYUD6UOXqiogS26yPoBjMIor+fayhk84j1I/
	pugiZ4W48awUDpQ5KtNs+STntKAeC0jFIoUxJnzI1eL9r+fmXglYGZ6vr9qD+OVm8SeTiJ1mFr0v5
	7Apmf33jBGd0KRT18myE1HrETTtGyDf5OMlLfkPS7wU3nOJAwO5qFxpmn4BCpclJ+G0I1WMYR/3/U
	cD5WWQuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnjH-00000003Ooz-1PHw;
	Tue, 11 Feb 2025 10:42:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thndH-00000003N7r-3TsE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:36:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5CC8BA4023A;
	Tue, 11 Feb 2025 10:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F66C4CEDD;
	Tue, 11 Feb 2025 10:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739270206;
	bh=1zu6tZCsh7aYgjU+gNDoFE87fQ7V3td5jRhPpf0IkJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q7PeTo+mIHLgO6J81jy2uDEEgKkM36ufdVbuMhZ/59KgG5zQ1LJh+QVcxwcwx4yvF
	 ProIcvwKivCw/KPeE+b7gvzH73GuebXeXtowVmkFCQXj6C8iJkRaTw5idJ38nCPLHT
	 IYkO8u/DbQLxcqWAG5mOoAZPW13xQKfoGmCVh+9gILOu8Z3E7OPhr/bXP+kpwa7Bam
	 qRc17nfSTVIK0tiDr+OUh9FMoUQ01c0pHgAATOP12e9XPbtzJY8k5LpMPOPYqRM/wD
	 jb5+W7GB0Yol98C8imPPwB/LeLUcvcne0J/wBA+nQgxT5Tj8ACwd7REbUpj+hmMRVd
	 lrPp0nv59CHGg==
Date: Tue, 11 Feb 2025 10:36:40 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v3 8/8] KVM: arm64: Eagerly switch ZCR_EL{1,2}
Message-ID: <20250211103640.GC8653@willie-the-truck>
References: <20250210195226.1215254-1-mark.rutland@arm.com>
 <20250210195226.1215254-9-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210195226.1215254-9-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_023647_991998_83DC6EA0 
X-CRM114-Status: GOOD (  24.56  )
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

On Mon, Feb 10, 2025 at 07:52:26PM +0000, Mark Rutland wrote:
> In non-protected KVM modes, while the guest FPSIMD/SVE/SME state is live on the
> CPU, the host's active SVE VL may differ from the guest's maximum SVE VL:
> 
> * For VHE hosts, when a VM uses NV, ZCR_EL2 contains a value constrained
>   by the guest hypervisor, which may be less than or equal to that
>   guest's maximum VL.
> 
>   Note: in this case the value of ZCR_EL1 is immaterial due to E2H.
> 
> * For nVHE/hVHE hosts, ZCR_EL1 contains a value written by the guest,
>   which may be less than or greater than the guest's maximum VL.
> 
>   Note: in this case hyp code traps host SVE usage and lazily restores
>   ZCR_EL2 to the host's maximum VL, which may be greater than the
>   guest's maximum VL.
> 
> This can be the case between exiting a guest and kvm_arch_vcpu_put_fp().
> If a softirq is taken during this period and the softirq handler tries
> to use kernel-mode NEON, then the kernel will fail to save the guest's
> FPSIMD/SVE state, and will pend a SIGKILL for the current thread.
> 
> This happens because kvm_arch_vcpu_ctxsync_fp() binds the guest's live
> FPSIMD/SVE state with the guest's maximum SVE VL, and
> fpsimd_save_user_state() verifies that the live SVE VL is as expected
> before attempting to save the register state:
> 
> | if (WARN_ON(sve_get_vl() != vl)) {
> |         force_signal_inject(SIGKILL, SI_KERNEL, 0, 0);
> |         return;
> | }
> 
> Fix this and make this a bit easier to reason about by always eagerly
> switching ZCR_EL{1,2} at hyp during guest<->host transitions. With this
> happening, there's no need to trap host SVE usage, and the nVHE/nVHE
> __deactivate_cptr_traps() logic can be simplified to enable host access
> to all present FPSIMD/SVE/SME features.
> 
> In protected nVHE/hVHE modes, the host's state is always saved/restored
> by hyp, and the guest's state is saved prior to exit to the host, so
> from the host's PoV the guest never has live FPSIMD/SVE/SME state, and
> the host's ZCR_EL1 is never clobbered by hyp.
> 
> Fixes: 8c8010d69c132273 ("KVM: arm64: Save/restore SVE state for nVHE")
> Fixes: 2e3cf82063a00ea0 ("KVM: arm64: nv: Ensure correct VL is loaded before saving SVE state")
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Tested-by: Mark Brown <broonie@kernel.org>
> Cc: stable@vger.kernel.org
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/fpsimd.c                 | 30 -------------
>  arch/arm64/kvm/hyp/entry.S              |  5 +++
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 59 +++++++++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c      | 13 +++---
>  arch/arm64/kvm/hyp/nvhe/switch.c        |  6 +--
>  arch/arm64/kvm/hyp/vhe/switch.c         |  4 ++
>  6 files changed, 76 insertions(+), 41 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Thanks for the quick re-spin!

Will

