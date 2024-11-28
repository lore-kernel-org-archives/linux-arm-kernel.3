Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19E3D70DE9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 17:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eoxpt1hElYo3Lr62axL4tvLlza1cfj6ZJRW4ApIUI20=; b=2C97Enw6OQUVVCKFa0LibfY96C
	GRgVkalYJOZf08BMhTibm4mcaOhe6fZZtNrRd9VwGck0VKsOmNstvlLYU+ExBZRR9HDWU0zBQlEqD
	80HGjZ1YU2etaUvfq0tVFeNDoiJ4J4gMGas+lFLG/L3/ecsERXnwfwGasgwGxq0Xlz+e5JVj+p0Zp
	OkgF/llXVkcSYFvX5RF4BGh0bVvUw8FUtkiaPrTJzYbGckXuZTz31R2k5plL974w8t7BCXbtgOZEm
	ctz4BR+PWXnmsx/Fe7WWm7UvltyCkolPAcgQoyM2eFel+FZK9fspjTMwazs844Nt9eIAIV2Qp9jCJ
	6q1frHRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGilG-0000000G887-49VT;
	Thu, 28 Nov 2024 17:57:06 +0000
Received: from out-176.mta0.migadu.com ([2001:41d0:1004:224b::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGikG-0000000G83O-3YgH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 17:56:06 +0000
Date: Thu, 28 Nov 2024 09:55:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732816559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eoxpt1hElYo3Lr62axL4tvLlza1cfj6ZJRW4ApIUI20=;
	b=c8WtAUUvBNRiabDrwj6WM9TrNXaEq/7nYN5wia0xgHXaDyqiGiWSJEU4yYoQskC1p8wItb
	xjfRfkkTCgO0914+sKtW7cqwgOYnRNbd0uVgP1YdlWyJQq4AsBmNmR56VXXHwlZr3ETmG6
	8fIT9nUhHCzKvddR7po2TvgF9X7IW1Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Keisuke Nishimura <keisuke.nishimura@inria.fr>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH] KVM: arm/arm64: vgic-its: Add error handling in
 vgic_its_cache_translation
Message-ID: <Z0iujBMl1ypdwfBu@linux.dev>
References: <20241128134534.361144-1-keisuke.nishimura@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128134534.361144-1-keisuke.nishimura@inria.fr>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_095605_091941_3E08A48A 
X-CRM114-Status: GOOD (  17.56  )
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

On Thu, Nov 28, 2024 at 02:45:34PM +0100, Keisuke Nishimura wrote:
> The xa_store() may fail because there is no guarantee that the cache_key
> index is already used in its->translation_cache. This fix (1) resolves
> the kref inconsistency on failure and (2) returns the error code.

xa_store() doesn't fail if an entry is already present at the specified
index. It returns the old entry, which is why we have a vgic_put_irq()
on the "error" path.

Genuine error handling definitely is missing here, but that would only
happen if the xarray library failed to allocate (-ENOMEM) or if the
xarray itself is broken beyond repair (-EINVAL).

> Fixes: 8201d1028caa ("KVM: arm64: vgic-its: Maintain a translation cache per ITS")
> Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
> ---
>  arch/arm64/kvm/vgic/vgic-its.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> index 198296933e7e..8f423857b7d2 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -555,7 +555,7 @@ static struct vgic_irq *vgic_its_check_cache(struct kvm *kvm, phys_addr_t db,
>  	return irq;
>  }
>  
> -static void vgic_its_cache_translation(struct kvm *kvm, struct vgic_its *its,
> +static int vgic_its_cache_translation(struct kvm *kvm, struct vgic_its *its,
>  				       u32 devid, u32 eventid,
>  				       struct vgic_irq *irq)

This was deliberately made a void return. The entire translation cache
is opportunistic and not required for functional correctness. Nothing
breaks if we fail to insert an entry for, say, a failed memory
allocation.

It would be extremely helpful if you could share the steps to reproduce
the error you observe.

-- 
Thanks,
Oliver

