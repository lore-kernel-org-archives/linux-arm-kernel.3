Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC33EF4EB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 07:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGY27Ax6sAp6aj3CQFadNtRLCYIrljekonhKb+hXF+4=; b=gZpB0Ata6nbreKvupOFNKYTSUW
	2y4KlTPkCKldxM5rPDSeCnaTukXv3+YyBHLL6UGmh/TsIgd57jCQupmPWKSl4zGS3ofdGeFv3Q/x3
	F7WqTm31Phkf7luvoLwlIw9L/d0HMFvqoh2IIvmVnSTPDEzne72JTdJpCA6feHeBremK3eKUHPVvO
	A75Z4m+0m0bI8HdmwvzB6DVuoedszQXJouHnE25rsP97JoAgDrm7Nz9raqOc8oPclJER0pX+aC+dm
	AyH1/7b6QAJd8PtfHUhHeucwluXFS4ImgG6StVq7nOrxQaKE6zd4co8+D1Jhlhk7irx1VFgEkBMar
	any9iG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9eSF-00000004tBC-0Kx6;
	Mon, 06 Apr 2026 07:33:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9eSC-00000004tAN-1oZq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 07:33:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39F7F42B18;
	Mon,  6 Apr 2026 07:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F321DC4CEF7;
	Mon,  6 Apr 2026 07:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775460776;
	bh=tFc2zLl3pskbe3FC0+yZdcjLpUXA/C9dZ7kzSWxtKJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UkYMxxpgXc0u/JzR1P59+gpwjGqbDRTkIouFQhLlUaskNSAcU+KbdNoYpodmTn674
	 mAi6Xm4zSSBlb6pXoyuzIggzeZ4X1P8uLIIUsfPdo1doLi1Dp5XE0qhXgK/WFhjjWZ
	 ZODEUyYszoMvviPXSh5NXqfgNLzEWXmkuIzqrvs2g2C1PBcJIZc6yFZ0P77QUdNd5q
	 1b6Y9KjrHNvGGyFJrk+mPrgInKxMwP3n0T1u+j6xizfQtNaKFE0vXMU8k4oaEWGAyF
	 UdjadVyd+5E8Sv95odTSevN4t+JaDqXl63zsSfAd0NB0jfPOtM9g3zz0D0Mc6Ecyu5
	 3v7HqQnYME9cQ==
Date: Mon, 6 Apr 2026 00:32:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] KVM: arm64: Advertise ID_AA64PFR2_EL1.GCIE
Message-ID: <20260406073251.GA2366413@ax162>
References: <20260401170017.369529-1-maz@kernel.org>
 <20260404181330.GA3987102@ax162>
 <874ilqcu3c.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874ilqcu3c.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_003300_668949_34FB57E4 
X-CRM114-Status: GOOD (  13.42  )
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

On Sat, Apr 04, 2026 at 10:07:51PM +0100, Marc Zyngier wrote:
> Gah. No idea how I managed to miss that: the register fields must be
> strictly ordered, and I placed the field in the wrong spot. The
> following hack fixes it for me:
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 5bca6e064ca72..1bfaa96881dab 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -325,9 +325,9 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
>  
>  static const struct arm64_ftr_bits ftr_id_aa64pfr2[] = {
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_FPMR_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_GCIE_SHIFT, 4, ID_AA64PFR2_EL1_GCIE_NI),
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_MTEFAR_SHIFT, 4, ID_AA64PFR2_EL1_MTEFAR_NI),
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_MTESTOREONLY_SHIFT, 4, ID_AA64PFR2_EL1_MTESTOREONLY_NI),
> -	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_GCIE_SHIFT, 4, ID_AA64PFR2_EL1_GCIE_NI),
>  	ARM64_FTR_END,
>  };
>  
> If that works for you, I'll fold that into the original patch...

Can confirm.

> Thanks for pointing this out!

Thanks for the quick fix!

Cheers,
Nathan

