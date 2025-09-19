Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820AFCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 21:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucooLY/Qz66eYBaBZSuky0Pv3RB6ntHfOz3AUckBABo=; b=IJDLI2dk45d4elU3PN0edWv5Y7
	wUTzBKBZS1IVg89mgrgy3iwBeWmTswW2h0Bhmm58AsBNjaRMseYcfZKTHhxXtYpDE8JNffuSqHgDq
	109TPOCGHCuvinyG97dYNkD7JVbBTdS+TIMBFIFFC0vKBL16umDmEqP0wjTeUodHVOVnCu78MjHYL
	URr626bC1rvR7Bz0SsDgQRuRfskA2tCteTXqXB3+AKyFfPSolmdBN+uOpxJUhZ3tTHnbRUC9UmNiO
	4fLWb3aXkmZPxjcYOymD3Z8py62s7Ob/fJVNXUtW/vbQJ6z4ajY5hUAnBkET8NX9DA7hHbQmj6Koo
	s+4VYTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzj7a-000000048xf-1wPV;
	Fri, 19 Sep 2025 21:58:26 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzj7X-000000048xC-34ae
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 21:58:25 +0000
Date: Fri, 19 Sep 2025 14:58:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758319100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ucooLY/Qz66eYBaBZSuky0Pv3RB6ntHfOz3AUckBABo=;
	b=HynyxMpNUG/rRZP59lW/UjSDyNKUh2SFLaS6WDcrAv1UZ3aAmJ3QXn2TfE8uBGw15GXDt2
	FS1sN298fllNGieS+/2A2nMHhQUotWgbajlFrPictri2WPeWWSjfvMazRj5trGq+chwiS6
	kIdQFp2wXYk1ewUs8PJdx2jPRyj9hAk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 06/16] KVM: arm64: Compute shareability for LPA2
Message-ID: <aM3R9mshUCJgXg9K@linux.dev>
References: <20250915114451.660351-1-maz@kernel.org>
 <20250915114451.660351-7-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915114451.660351-7-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_145823_979920_5C8F34EA 
X-CRM114-Status: GOOD (  11.94  )
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

On Mon, Sep 15, 2025 at 12:44:41PM +0100, Marc Zyngier wrote:
> +static u8 compute_s1_sh(struct s1_walk_info *wi, struct s1_walk_result *wr,
> +			u8 attr)
> +{
> +	u8 sh;
> +
> +	/*
> +	 * non-52bit and LPA have their basic shareability described in the
> +	 * descriptor. LPA2 gets it from the corresponding field in TCR,
> +	 * conveniently recorded in the walk info.
> +	 */
> +	if (!wi->pa52bit || BIT(wi->pgshift) == SZ_64K)
> +		sh = FIELD_GET(PTE_SHARED, wr->desc);

nit: s/PTE_SHARED/KVM_PTE_LEAF_ATTR_LO_S1_SH/ makes it a bit more
obvious what field is being used here (even though it was like this
before).

> @@ -798,11 +819,13 @@ static u64 compute_par_s12(struct kvm_vcpu *vcpu, u64 s1_par,
>  	    !MEMATTR_IS_DEVICE(final_attr))
>  		final_attr = MEMATTR(NC, NC);
>  
> +	s2_sh = FIELD_GET(PTE_SHARED, tr->desc);
> +

s/PTE_SHARED/KVM_PTE_LEAF_ATTR_LO_S2_SH/

Thanks,
Oliver

