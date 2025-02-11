Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C4AC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 12:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTiCs5cj5+OnYoXtI3zLZDWlnFrQ9c4Sv8ukrqXmJ0Y=; b=TjaXO1nnkB/ma5TaO7phFKTLly
	qFacGYWXinR3svBJnd4J76hqiE11XmD2F8R33+gDtQudixsXC4dNEkpOvprg8xdll6unOtv/23nJP
	UekO6l61P6IZVne+csBGZq7tZvoGFxGbKm/ovIfUStvGEYiBF46SmeIsGhz82A+UENhBZHNDT8izH
	NbkAakDtqLZh3x2O0P/dNw/xxZExPDeGBT5L5upHmzNU1P2kcaWdc8VvVRG1pCewRtRb1cpmFMKl2
	pNY35zChxylr4j5pf+fYaKk9xt/NUtEJSZ2BayMejHpb3PF6G/ynotMeg/RrbqKyvonNJubUBSdh1
	RUXfiYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpKP-00000003lL0-1A0W;
	Tue, 11 Feb 2025 12:25:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thoXo-00000003ZAK-2VYk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 11:35:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 770D21424;
	Tue, 11 Feb 2025 03:35:31 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 546A73F5A1;
	Tue, 11 Feb 2025 03:35:08 -0800 (PST)
Date: Tue, 11 Feb 2025 11:34:57 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6] KVM: arm64: Fix confusion in documentation for pKVM
 SME assert
Message-ID: <Z6s14V_4LzD3dATB@J2N7QTR9R3>
References: <20250210-kvm-arm64-sme-assert-v6-1-cc26c46d1b43@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-kvm-arm64-sme-assert-v6-1-cc26c46d1b43@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_033512_729622_CCE77BF3 
X-CRM114-Status: GOOD (  30.90  )
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

On Mon, Feb 10, 2025 at 09:33:32PM +0000, Mark Brown wrote:
> As raised in the review comments for the original patch the assert and
> comment added in afb91f5f8ad7 ("KVM: arm64: Ensure that SME controls are
> disabled in protected mode") are bogus. The comments says that we check
> that we do not have SME enabled for a pKVM guest but the assert actually
> checks to see if the host has anything set in SVCR which is unrelated to
> the guest features or state, regardless of if those guests are protected
> or not. This check is also made in the hypervisor, it will refuse to run
> a guest if the check fails, so it appears that the assert here is
> intended to improve diagnostics.
> 
> Update the comment to reflect the check in the code, and to clarify that
> we do actually enforce this in the hypervisor. While we're here also
> update to use a WARN_ON_ONCE() to avoid log spam if this triggers.
> 
> Fixes: afb91f5f8ad7 ("KVM: arm64: Ensure that SME controls are disabled in protected mode")
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> This has been sent with v6.10 with only positive review comments after
> the first revision, if there is some issue with the change please share
> it.
> 
> To: Marc Zyngier <maz@kernel.org>
> To: Oliver Upton <oliver.upton@linux.dev>
> To: James Morse <james.morse@arm.com>
> To: Suzuki K Poulose <suzuki.poulose@arm.com>
> To: Catalin Marinas <catalin.marinas@arm.com>
> To: Will Deacon <will@kernel.org>
> To: Fuad Tabba <tabba@google.com>
> ---
> Changes in v6:
> - Rebase onto v6.14-rc1.
> - Link to v5: https://lore.kernel.org/r/20241210-kvm-arm64-sme-assert-v5-1-995c8dd1025b@kernel.org
> 
> Changes in v5:
> - Rebase onto v6.13-rc1.
> - Link to v4: https://lore.kernel.org/r/20240930-kvm-arm64-sme-assert-v4-1-3c9df71db688@kernel.org
> 
> Changes in v4:
> - Rebase onto v6.12-rc1
> - Link to v3: https://lore.kernel.org/r/20240730-kvm-arm64-sme-assert-v3-1-8699454e5cb8@kernel.org
> 
> Changes in v3:
> - Rebase onto v6.11-rc1.
> - Link to v2: https://lore.kernel.org/r/20240605-kvm-arm64-sme-assert-v2-1-54391b0032f4@kernel.org
> 
> Changes in v2:
> - Commit message tweaks.
> - Change the assert to WARN_ON_ONCE().
> - Link to v1: https://lore.kernel.org/r/20240604-kvm-arm64-sme-assert-v1-1-5d98348d00f8@kernel.org
> ---
>  arch/arm64/kvm/fpsimd.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
> index 4d3d1a2eb157047b4b2488e9c4ffaabc6f5a0818..f3455641e9c8a65470cdeb9d7daba7d59d78748e 100644
> --- a/arch/arm64/kvm/fpsimd.c
> +++ b/arch/arm64/kvm/fpsimd.c
> @@ -93,11 +93,14 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
>  	}
>  
>  	/*
> -	 * If normal guests gain SME support, maintain this behavior for pKVM
> -	 * guests, which don't support SME.
> +	 * The pKVM hypervisor does not yet understand how to save or
> +	 * restore SME state for the host so double check that if we
> +	 * are running with pKVM we have disabled SME.  The hypervisor
> +	 * enforces this when the guest is run, this check is for
> +	 * clearer diagnostics.
>  	 */
> -	WARN_ON(is_protected_kvm_enabled() && system_supports_sme() &&
> -		read_sysreg_s(SYS_SVCR));
> +	WARN_ON_ONCE(is_protected_kvm_enabled() && system_supports_sme() &&
> +		     read_sysreg_s(SYS_SVCR));

This implies that non-protected modes do understand how to save/restore
SME state, and the wording is somewhat clunky.

Given we've just queued up patches requiring that the host has saved
away the FPSIMD/SVE/SME state, I reckon it'd make more sense to simplify
this to:

	/*
	 * Protected and non-protected KVM modes require that
	 * SVCR.{SM,ZA} == {0,0} when entering a guest so that no
	 * host/guest SME state needs to be saved/restored by hyp code.
	 *
	 * In protected mode, hyp code will verify this later.
	 */
	WARN_ON_ONCE(system_supports-sme() && read_sysreg_s(SYS_SVCR));

... and then if/when we enable SME for non-protected modes we can
constrain that further.

Mark.

