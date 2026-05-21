Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CDBCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOCkQ8qgJ4uQWZJPmCu6uJWnm+MALhUPq3TADPATcZU=; b=Hat76/cOdd4S9nWugOfYIf9LEI
	yKiHAV4Mu0N99Js29XK80mvizlJhIqmWyrJtGO73o6Ki0tQ0zo0tIXLdnRTDlSLetLKmQD5RmKTLe
	nZbxjUBgSbZCTfk8Y6QK8xI+gui8tUoYYNCqmy5xEXox8j2Afg3qhP9uYqo8QujPtFJqZjV7c0KsY
	1l4PUKItecbsISRB8dpboypoeoPZuR4MkMqBszOeE5C6lLOr4FZW54M7AK0jV1kfD1jHK1e/n+yfP
	nnANiGgzeZwG5AEKqW4rSA6K1BL/qPoi/T+MML25dG2LtSv80OnJlGpOyJhe1nB9j4hF6qGwnbpa2
	+44vZPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4kM-000000089EB-2p03;
	Thu, 21 May 2026 14:51:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4kK-000000089DJ-0wQ2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:51:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71BCC3585;
	Thu, 21 May 2026 07:51:29 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 571793F85F;
	Thu, 21 May 2026 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779375094; bh=/M7Oaxr332HfiR3rrZsNI2QRSJu4XHbFyuBl33Utx2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KUnLOgdZDj5O2qLZxcb3etfFl0vMdre9eNHzbKWYDMT3m9sHuHIO0cgLCBgIp42TQ
	 IZM6e8EoCXvtdhMM9qtbMhcxxB5FjiL8yAp1GfSkw2oJU/PDEqPUTGOs7a6iwWybag
	 +wmqnJdkv/VNnqs0N1DPop4L2zgnv9+EJyxESFtQ=
Date: Thu, 21 May 2026 15:51:26 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 19/30] KVM: arm64: Provide assembly for SME register
 access
Message-ID: <ag8b7oq4SFpdmlP_@J2N7QTR9R3>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-19-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-19-43f7683a0fb7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_075136_339746_91694A82 
X-CRM114-Status: GOOD (  16.82  )
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

On Fri, Mar 06, 2026 at 05:01:11PM +0000, Mark Brown wrote:
> Provide versions of the SME state save and restore functions for the
> hypervisor to allow it to restore ZA and ZT for guests.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_hyp.h |  2 ++
>  arch/arm64/kvm/hyp/fpsimd.S      | 23 +++++++++++++++++++++++
>  2 files changed, 25 insertions(+)

While this specific instance is simple enough, I don't think we should
continue to duplicate the low level save/restore routines between the
main kernel and KVM hyp code.

I've sent a series that avoids the need for this, and cleans up some
other bits):

  https://lore.kernel.org/linux-arm-kernel/20260521132556.584676-1-mark.rutland@arm.com/

Assuming Marc and Oliver are on board, I'd prefer that we do that
cleanup first, and build the KVM SME support atop.

Mark.

> 
> diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
> index 0317790dd3b7..9b1354d1122c 100644
> --- a/arch/arm64/include/asm/kvm_hyp.h
> +++ b/arch/arm64/include/asm/kvm_hyp.h
> @@ -116,6 +116,8 @@ void __fpsimd_save_state(struct user_fpsimd_state *fp_regs);
>  void __fpsimd_restore_state(struct user_fpsimd_state *fp_regs);
>  void __sve_save_state(void *sve_pffr, u32 *fpsr, int save_ffr);
>  void __sve_restore_state(void *sve_pffr, u32 *fpsr, int restore_ffr);
> +void __sme_save_state(void const *state, bool save_zt);
> +void __sme_restore_state(void const *state, bool restore_zt);
>  
>  u64 __guest_enter(struct kvm_vcpu *vcpu);
>  
> diff --git a/arch/arm64/kvm/hyp/fpsimd.S b/arch/arm64/kvm/hyp/fpsimd.S
> index 6e16cbfc5df2..18b7a666016c 100644
> --- a/arch/arm64/kvm/hyp/fpsimd.S
> +++ b/arch/arm64/kvm/hyp/fpsimd.S
> @@ -29,3 +29,26 @@ SYM_FUNC_START(__sve_save_state)
>  	sve_save 0, x1, x2, 3
>  	ret
>  SYM_FUNC_END(__sve_save_state)
> +
> +SYM_FUNC_START(__sme_save_state)
> +	// Caller needs to ensure SMCR updates are visible
> +	_sme_rdsvl	2, 1		// x2 = VL/8
> +	sme_save_za 0, x2, 12		// Leaves x0 pointing to the end of ZA
> +
> +	cbz	x1, 1f
> +	_str_zt 0
> +1:
> +	ret
> +SYM_FUNC_END(__sme_save_state)
> +
> +SYM_FUNC_START(__sme_restore_state)
> +	// Caller needs to ensure SMCR updates are visible
> +	_sme_rdsvl	2, 1		// x2 = VL/8
> +	sme_load_za	0, x2, 12	// Leaves x0 pointing to end of ZA
> +
> +	cbz	x1, 1f
> +	_ldr_zt 0
> +
> +1:
> +	ret
> +SYM_FUNC_END(__sme_restore_state)
> 
> -- 
> 2.47.3
> 

