Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07520D10375
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 06:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgodkdvxFslYjYvAp7cxMq5/AH0TWVDsyHdrx+MM6Cg=; b=LRGrSaN838v7kvJKhssq70IQVH
	MTKPjknTv1GftuPbU9ubEOum6fX8xcGrySGIpjyubJrPFhmhBVjXCfTYumoxcqEilPBhL7u1mdiOr
	erPA+QAJrWTsqV34lxQCO4eoZ8tujEnnUy60e9wSGaEkpxQUOKQFcpZPpXXFD6zs3h+X44f1FIXRX
	UZrLjV88hN/inGQuIflSX9WP6ZsR1RrUz/7AIPCvHnOr4ZYd3cWAzMJsihTBfPUmGt79zL+cjQN1Q
	2Jx+5pzc62XGLaCLgPIyHFGdg/oJptLHFYUAOwjwyCFybE8R7vPHH9RZR8nUDlysf5Xlq8lOnZIKw
	Jr8v5tlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVcz-0000000G3fC-1Uq0;
	Thu, 27 Nov 2025 06:37:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVcy-0000000G3f5-06N3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 06:37:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 259A66016E;
	Thu, 27 Nov 2025 06:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAEB2C4CEF8;
	Thu, 27 Nov 2025 06:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764225434;
	bh=sxm/pZRxFK+AZN/1aSkLmnFO7vK7xwxEtuumkKqVWs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=secg8Oj4iwk0hBvUbPFzz+j+hhH6cmpWPfG/YpGNTbMPOY3RnYZ5N4OjH7wwZS0Co
	 qCvrNf0E9cD1di0gSesJU3RyjrhKOYZsd+otKZvo+lyVA5MUzLWzlDCuyXuyIDU+Um
	 +XLT8oepfwvxr9eZ40IOFdemjnuEN/by4VV2XT+c1R1sQHrI4zgP+UHtbAiy+/RwiI
	 TOeJdje3X5DO1cAwEc26uND4nbttPkuEo/u4p9KYUyMa0r8uCpua2rDGf9CM7BduHI
	 FkETw4oXtXVDPhGx2crT5UJtTaqNYbmGsQs6eTReE4JJEEaWSSQQTIo6Gv2+lYbQCJ
	 aTKPQFA/phqgA==
Date: Wed, 26 Nov 2025 22:37:13 -0800
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH v2 2/5] KVM: arm64: Force trap of GMID_EL1 when the guest
 doesn't have MTE
Message-ID: <aSfxmQptJlCHhb0M@kernel.org>
References: <20251126155951.1146317-1-maz@kernel.org>
 <20251126155951.1146317-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126155951.1146317-3-maz@kernel.org>
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

On Wed, Nov 26, 2025 at 03:59:48PM +0000, Marc Zyngier wrote:
> If our host has MTE, but the guest doesn't, make sure we set HCR_EL2.TID5
> to force GMID_EL1 being trapped.
> 
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 9e4c46fbfd802..2ca6862e935b5 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -5561,6 +5561,8 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
>  
>  	if (kvm_has_mte(vcpu->kvm))
>  		vcpu->arch.hcr_el2 |= HCR_ATA;
> +	else if (id_aa64pfr1_mte(read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1)))

This helper is ugly!

> +		vcpu->arch.hcr_el2 |= HCR_TID5;

How about setting the trap unconditionally when !kvm_has_mte()? Even in
the case of asymmetry we'd want GMID_EL1 to trap.

Thanks,
Oliver

