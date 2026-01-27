Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8681D34081
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 15:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twcXPifLSWHAsGOkinrYNZoawMnOQsAeiqgxAgy3K1U=; b=PFFD9431WGYmSO0HRVNqCm2rPw
	KT04GlOAduneZiDYbsXUPzciUNHJsd4pnuf2faDoPBaAvEQMfACpEjDbSGvxO22OuFVq8FfPyYk5c
	dOeEkqjbkLs/dpYS19G5F3Nqshy8rRrlO74/r3vu9MDTC46qiLxdgvPudSI7WjB6tOnjVQyToysXt
	AtvpFnTdvRV/fQDJZ/dpXAbxIbFCLbE2JGmUnraZiIDhsFEMDoT3B5HxY9qlkRmeayslmGMWGmpNG
	i1YpPv80D62G3AxX7oYwBX4cFPoMWIyT7YBS48NifER1c0fa9/nSqXbgepDr/18IDsVogXbI+ZFP8
	saRTOv5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkxN-0000000EXyO-3fwO;
	Tue, 27 Jan 2026 15:26:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkxK-0000000EXxq-1Mvc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 15:26:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 121791596;
	Tue, 27 Jan 2026 07:26:07 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 213823F632;
	Tue, 27 Jan 2026 07:26:12 -0800 (PST)
Date: Tue, 27 Jan 2026 15:26:09 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 07/20] KVM: arm64: Allow RES1 bits to be inferred from
 configuration
Message-ID: <20260127152609.GB2685766@e124191.cambridge.arm.com>
References: <20260126121655.1641736-1-maz@kernel.org>
 <20260126121655.1641736-8-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126121655.1641736-8-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_072615_017380_866A5B70 
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

On Mon, Jan 26, 2026 at 12:16:41PM +0000, Marc Zyngier wrote:
> So far, when a bit field is tied to an unsupported feature, we set
> it as RES0. This is almost forrect, but there are a few exceptions

forrect is almost correct too!

> where the bits become RES1.
> 
> Add a AS_RES1 qualifier that instruct the RESx computing code to
> simply do that.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey

> ---
>  arch/arm64/kvm/config.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 8d152605999ba..6a4674fabf865 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -24,6 +24,7 @@ struct reg_bits_to_feat_map {
>  #define	CALL_FUNC	BIT(1)	/* Needs to evaluate tons of crap */
>  #define	FIXED_VALUE	BIT(2)	/* RAZ/WI or RAO/WI in KVM */
>  #define	MASKS_POINTER	BIT(3)	/* Pointer to fgt_masks struct instead of bits */
> +#define	AS_RES1		BIT(4)	/* RES1 when not supported */
>  
>  	unsigned long	flags;
>  
> @@ -1316,8 +1317,12 @@ struct resx __compute_fixed_bits(struct kvm *kvm,
>  		else
>  			match = idreg_feat_match(kvm, &map[i]);
>  
> -		if (!match || (map[i].flags & FIXED_VALUE))
> -			resx.res0 |= reg_feat_map_bits(&map[i]);
> +		if (!match || (map[i].flags & FIXED_VALUE)) {
> +			if (map[i].flags & AS_RES1)
> + 				resx.res1 |= reg_feat_map_bits(&map[i]);
> +			else
> +				resx.res0 |= reg_feat_map_bits(&map[i]);
> +		}
>  	}
>  
>  	return resx;
> -- 
> 2.47.3
> 

