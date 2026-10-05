Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11854CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 08:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vMssXeFUWuK2+atRP/yY0Yi3PMPF4xdx4cHzEXP+mc=; b=QioRCcN+6ogP6o4QrPQ9TndrhP
	9VnW5BOTtIBzXPh8DJMbWaWRbVd3sFPHk5a9ekkJU/fsaG8OgI0xBKD39mCZlMHWZvth25C5opdMJ
	dY7spx9+spvsvVjxUYAy6tEi6Qx2r3FDyfusITdbMkFBeTroPORqSW6uqqnp8DfrkxDjzxkp7a4Oc
	YlMQSaP78pWs2LvMp/FyOQLl4JmX69y6HXQM6zIsSp0NsjzmMVbTsxseuebCSIVFUshv8J4dPyKF2
	w5FKgbQbm0f+PJsq6m24VfmCSI5RRHVgM5m3HAM28DBSPqhbBXtqCvWn9O62UiAAPm4Orgy3CLbTG
	pMJvyKXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDe6E-0000000FtOF-2BtH;
	Mon, 05 Oct 2026 08:31:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDe6D-0000000FtNc-14xO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 08:31:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D3236022E;
	Mon,  5 Oct 2026 08:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AC91F000FF;
	Mon,  5 Oct 2026 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791189064;
	bh=+vMssXeFUWuK2+atRP/yY0Yi3PMPF4xdx4cHzEXP+mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i7coYvwAbK+cQxKJ9kh7zGq3agGxzKHndRn15xPbhOADf5QKOA/QmN6EBGXpj+xgU
	 JLmUQ/mtLLln+nMvG1tlxw8rOf7Oh+RJqlXXRR1K8MB1OPpJWYsp3JrKhUHFUlKQ3/
	 EukvSCTM8MhAcOm1Pk5ul0Vrzj5m8RysAwXRZoArbtFeVx5ZqwfPb2gltLF7rMx1IR
	 QftH+u8ya46m6O8XLTIPMUf/QVgClpZAuv/roONQKKozDDh1tGXIy5gS2xIFOmeNKy
	 rHwVL4UqsZRSrzcpPknKZS8rwF1gipw4+GIXwJEHzjuA0rV0kVnNY1S8ids0vyouJt
	 MU3Vy+k1aSquA==
Date: Mon, 5 Oct 2026 01:30:56 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	vdonnefort@google.com, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com
Subject: Re: [PATCH] KVM: arm64: Pend host SErrors for protected vCPUs
 through HCR_EL2.VSE
Message-ID: <asNgQDxNQP9Gll-p@kernel.org>
References: <20261005050352.836980-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005050352.836980-1-fuad.tabba@linux.dev>
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

Hi Fuad,

On Mon, Oct 05, 2026 at 06:03:52AM +0100, Fuad Tabba wrote:
> diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
> index d6c4fc16f8795..49a342b078365 100644
> --- a/arch/arm64/kvm/inject_fault.c
> +++ b/arch/arm64/kvm/inject_fault.c
> @@ -378,8 +378,11 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
>  	 *
>  	 * As we're emulating the SError injection we need to explicitly populate
>  	 * ESR_ELx.EC because hardware will not do it on our behalf.
> +	 *
> +	 * A protected vCPU's PSTATE and SCTLR2_EL1 live at EL2, so pend through
> +	 * HCR_EL2.VSE and let the guest's own masking apply.
>  	 */
> -	if (!serror_is_masked(vcpu)) {
> +	if (!vcpu_is_protected(vcpu) && !serror_is_masked(vcpu)) {
>  		pend_serror_exception(vcpu);
>  		esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR) | ESR_ELx_IL;
>  		vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));

The emulated injection is only necessary when vcpu_has_nv(), it was just
convenient for the sake of testing that everything short circuits to
emulation instead of VSE.

I see Marc suggests letting the stale PSTATE.A value force the desired
behavior which seems fine to me. If that doesn't work, I'd rather
emulated injection be predicated on vcpu_has_nv() than
vcpu_is_protected() with the appropriate rephrasing of the preceding
comment.

Thanks,
Oliver

