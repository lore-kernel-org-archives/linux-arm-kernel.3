Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F51D1F9A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 10:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKtlDjsDmvQYoOS3bTRymk5OgIPvizKl5ShNGonenLY=; b=rYAr8/aRoBY5/IVvqkCrvkK4Cj
	q6jpPnzKNJFO+vg/6udqe+DqsHInNh3SVcbwiDaJdfHg2qniwuY+CbPj1bO43kcXIJyIUCFSjDSoa
	QSZgbFTB0Dr5/9y7ak6bv+A44jBXF83XnuMs6/y475v5S/YVofsOgIwO82Yjp8JVjPGSNfl76eGfh
	xmFvnAP0aVSdopIGbFM92GP9y/gFyvvrhuRjxT16mejE7yccEL3Sjb6HyY8mU4sKeUnLRwGUyamgH
	dAMTK4AilBVeEhnvwaRMfNDAegLa+HAQMZ1zqHz05oaXdGhR66C+QZqEcOZrpIu1pb6R81kkvMNk/
	gTbKi/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6dA-00000007qMO-17v1;
	Thu, 04 Dec 2025 10:32:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6d6-00000007qLr-1GcZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 10:32:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79FB2339;
	Thu,  4 Dec 2025 02:32:00 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4010A3F73B;
	Thu,  4 Dec 2025 02:32:06 -0800 (PST)
Date: Thu, 4 Dec 2025 10:32:00 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: Re: [PATCH v3 1/9] arm64: Repaint ID_AA64MMFR2_EL1.IDS description
Message-ID: <20251204103200.GA98666@e124191.cambridge.arm.com>
References: <20251204094806.3846619-1-maz@kernel.org>
 <20251204094806.3846619-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204094806.3846619-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_023210_511653_3A414419 
X-CRM114-Status: GOOD (  15.11  )
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

On Thu, Dec 04, 2025 at 09:47:58AM +0000, Marc Zyngier wrote:
> ID_AA64MMFR2_EL1.IDS, as described in the sysreg file, is pretty horrible
> as it diesctly give the ESR value. Repaint it using the usual NI/IMP
typo:   directly
> identifiers to describe the absence/presence of FEAT_IDST.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c | 2 +-
>  arch/arm64/tools/sysreg            | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> index 82da9b03692d4..107d62921b168 100644
> --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> @@ -134,7 +134,7 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr2[] = {
>  	MAX_FEAT(ID_AA64MMFR2_EL1, UAO, IMP),
>  	MAX_FEAT(ID_AA64MMFR2_EL1, IESB, IMP),
>  	MAX_FEAT(ID_AA64MMFR2_EL1, AT, IMP),
> -	MAX_FEAT_ENUM(ID_AA64MMFR2_EL1, IDS, 0x18),
> +	MAX_FEAT_ENUM(ID_AA64MMFR2_EL1, IDS, IMP),
>  	MAX_FEAT(ID_AA64MMFR2_EL1, TTL, IMP),
>  	MAX_FEAT(ID_AA64MMFR2_EL1, BBM, 2),
>  	MAX_FEAT(ID_AA64MMFR2_EL1, E0PD, IMP),
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 1c6cdf9d54bba..3261e8791ac03 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2257,8 +2257,8 @@ UnsignedEnum	43:40	FWB
>  	0b0001	IMP
>  EndEnum
>  Enum	39:36	IDS
> -	0b0000	0x0
> -	0b0001	0x18
> +	0b0000	NI
> +	0b0001	IMP
>  EndEnum
>  UnsignedEnum	35:32	AT
>  	0b0000	NI
> -- 
> 2.47.3
> 

