Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF17C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 06:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cjQWSwj8nKF9KoRQ2WmbNuDTwdSzRb9QicnW/ugG1M=; b=kXnazAs67vk/sorUiD7YyH9K5r
	6eMM8vdP+mSLVoMo3iIJXcu1zzt4oeluRf3hyIWlPfN9H1X5CWItrIljGt9HUN2MlROJZyDBAWy1n
	sF/dnbZ0lr34KULZ+tbuUDr45084LYrAwxv1LLRNneaEUHKubRopAsTxBxwpyhlbdwMEMYv0Ph4vj
	kY22rujqDaL68Vp+iC7iLxKwNRN6mBAnYsQhX/90qazr8ysnRjmaOUlF0sLt8Omyjzc/QvZrMflPq
	UTncrX7Lhing0vj7gWPVMa3mIiUmugf2ywsx9DPaDBWqCQKIKMdJ5EnLgT721rEMh01+3WlAlZR+O
	a3x1nSdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSWR-00000009uMs-39Ly;
	Thu, 13 Feb 2025 06:16:27 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSUi-00000009u6H-0UYZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 06:14:42 +0000
Date: Wed, 12 Feb 2025 22:14:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739427277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5cjQWSwj8nKF9KoRQ2WmbNuDTwdSzRb9QicnW/ugG1M=;
	b=rfpa5Zy3jCDew0wr+3Ap2UlABlwFrZ6W90clYvgaXHX+f1Y2+BkqgfWW+PofMQ7NrAgIYK
	ztM5LIlQ1YH9ZBfGfUI6WM/fJ81qGfighs8088pa79LoCafpufn76YepsKUa5dEqQuJxK2
	yr4wx4OSTqKC8VG+i0vLMqajSkxMh7c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v7] KVM: arm64: Fix confusion in documentation for pKVM
 SME assert
Message-ID: <Z62NxRzbOyt-nBmK@linux.dev>
References: <20250212-kvm-arm64-sme-assert-v7-1-0f786db838d3@kernel.org>
 <Z6yByMUBPDUyEWOr@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6yByMUBPDUyEWOr@J2N7QTR9R3>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_221440_760690_EE4B7C2D 
X-CRM114-Status: GOOD (  27.48  )
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

On Wed, Feb 12, 2025 at 11:11:04AM +0000, Mark Rutland wrote:
> On Wed, Feb 12, 2025 at 12:44:57AM +0000, Mark Brown wrote:
> > As raised in the review comments for the original patch the assert and
> > comment added in afb91f5f8ad7 ("KVM: arm64: Ensure that SME controls are
> > disabled in protected mode") are bogus. The comments says that we check
> > that we do not have SME enabled for a pKVM guest but the assert actually
> > checks to see if the host has anything set in SVCR which is unrelated to
> > the guest features or state, regardless of if those guests are protected
> > or not. This check is also made in the hypervisor, it will refuse to run
> > a guest if the check fails, so it appears that the assert here is
> > intended to improve diagnostics.
> > 
> > Update the comment to reflect the check in the code, and to clarify that
> > we do actually enforce this in the hypervisor. While we're here also
> > update to use a WARN_ON_ONCE() to avoid log spam if this triggers.
> > 
> > Fixes: afb91f5f8ad7 ("KVM: arm64: Ensure that SME controls are disabled in protected mode")
> > Reviewed-by: Fuad Tabba <tabba@google.com>
> > Signed-off-by: Mark Brown <broonie@kernel.org>

I don't think a Fixes tag is warranted here, this doesn't fix any
functional issue.

> > diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
> > index 4d3d1a2eb157047b4b2488e9c4ffaabc6f5a0818..e37e53883c357093ff4455f5afdaec90e662d744 100644
> > --- a/arch/arm64/kvm/fpsimd.c
> > +++ b/arch/arm64/kvm/fpsimd.c
> > @@ -93,11 +93,14 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
> >  	}
> >  
> >  	/*
> > -	 * If normal guests gain SME support, maintain this behavior for pKVM
> > -	 * guests, which don't support SME.
> > +	 * Protected and non-protected KVM modes require that
> > +	 * SVCR.{SM,ZA} == {0,0} when entering a guest so that no
> > +	 * host/guest SME state needs to be saved/restored by hyp code.
> > +	 *
> > +	 * In protected mode, hyp code will verify this later.
> >  	 */
> > -	WARN_ON(is_protected_kvm_enabled() && system_supports_sme() &&
> > -		read_sysreg_s(SYS_SVCR));
> > +	WARN_ON_ONCE(is_protected_kvm_enabled() && system_supports_sme() &&
> > +		     read_sysreg_s(SYS_SVCR));
> 
> As I mentioned on the last round, we can drop the is_protected_kvm_enabled()
> check, i.e. have:
> 
> 	/*
> 	 * Protected and non-protected KVM modes require that
> 	 * SVCR.{SM,ZA} == {0,0} when entering a guest so that no
> 	 * host/guest SME state needs to be saved/restored by hyp code.
> 	 *
> 	 * In protected mode, hyp code will verify this later.
> 	 */
> 	WARN_ON_ONCE(system_supports_sme() && read_sysreg_s(SYS_SVCR));
> 
> Either way:
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> 
> Marc, are you happy to queue this atop the recent fixes from me? Those
> try to ensure SVCR.{SM,ZA} == {0,0} regardless of whether KVM is in
> protected mode.

I'll pick it up for 6.15 if Marc doesn't grab it as a fix.

-- 
Thanks,
Oliver

