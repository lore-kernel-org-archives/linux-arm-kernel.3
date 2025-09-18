Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF54CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syQQWcaVehYQIN6zPapR1D5/yZmbi0VQ1aDexidfpWM=; b=UkkZYSSeDhP2to8fOo3brkBWlU
	FbRx6Y5EP4yVLaV452Uv90jg+LgJr/WniOlJVDZyTwG3DCgRonA5aKRqZ/WxlS+dBOF7EBxYgQlYw
	x00efMd+yfThUd513lyPey47+IM6TxfiKAph7pM0Ap97thoobtlzPdr8gx8xTfoJYx30bWCiJP0KV
	mHI+2zfP739i9BVmLulvQdKWjHEQPjBsi7s7I4XcbEseKKYeXJCitGF4tOUG8o4FXcCI2ZRALplQE
	hjVw1RM39Qrpwpd0y5lnalTTjlo0Osuiz2YDTksOY3fTKj3qrVDGX8yhwhS2NCYvupxCk9v0EtOXT
	nRRKvpDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7o0-0000000GNWN-28ek;
	Thu, 18 Sep 2025 06:07:44 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7nx-0000000GNVk-3lph
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:07:43 +0000
Date: Wed, 17 Sep 2025 23:07:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758175656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=syQQWcaVehYQIN6zPapR1D5/yZmbi0VQ1aDexidfpWM=;
	b=bpXOi0qEdNeh4GOx7Ii1VMyunAhNE59E1CrB1Iyjq1zQyDFT17I9G9twaK+exuHKLmSQ3/
	dh7WjDpvxndnHEkt+CGIC+LGLUUlS68YLt/z0rMh2GUKt2w6As4REFFqwXewHA6rUVZC4R
	iD3Trol7iojf8NdDRFxdNDRvT4GfMhE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: Re: [PATCH 1/8] KVM: arm64: Enforce absence of FEAT_FGT on FGT
 registers
Message-ID: <aMuhni_SDxQaAtiU@linux.dev>
References: <20250917165840.1633412-1-maz@kernel.org>
 <20250917165840.1633412-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917165840.1633412-2-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_230742_415892_67B5E916 
X-CRM114-Status: GOOD (  17.73  )
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

Hey,

On Wed, Sep 17, 2025 at 05:58:33PM +0100, Marc Zyngier wrote:

Did you mean to add changelogs to these patches?

> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/config.c | 201 +++++++++++++++++++++++++++-------------
>  1 file changed, 137 insertions(+), 64 deletions(-)
> 
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index da66c4a147752..42b834c82a20d 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -8,11 +8,16 @@
>  #include <asm/sysreg.h>
>  
>  struct reg_bits_to_feat_map {
> -	u64		bits;
> +	union {
> +		u64	bits;
> +		u64	*res0p;
> +	};
>  
>  #define	NEVER_FGU	BIT(0)	/* Can trap, but never UNDEF */
>  #define	CALL_FUNC	BIT(1)	/* Needs to evaluate tons of crap */
>  #define	FIXED_VALUE	BIT(2)	/* RAZ/WI or RAO/WI in KVM */
> +#define	RES0_POINTER	BIT(3)	/* Pointer to RES0 value instead of bits */
> +
>  	unsigned long	flags;
>  
>  	union {
> @@ -28,9 +33,16 @@ struct reg_bits_to_feat_map {
>  	};
>  };
>  
> -#define __NEEDS_FEAT_3(m, f, id, fld, lim)		\
> +struct reg_to_feat_map {
> +	const char				*name;
> +	const struct reg_bits_to_feat_map	feat_map;

Some documentation might help with confusion between this and
bit_feat_map. IIUC you're using a single NEEDS_FEAT() expression to RES0
the whole sucker based on whether or not the FEAT_XXX for the EL2
register is present?

> +	const struct reg_bits_to_feat_map	*bit_feat_map;
> +	const unsigned int			bit_feat_map_sz;
> +};

Ok, differentiating "reg_to_feat_map" and "reg_bits_to_feat_map" is a
bit hard on the reader... Could this maybe be called "reg_feat_map_desc"
or similar?

This refactoring could also be done as a separate patch.
 
Thanks,
Oliver

