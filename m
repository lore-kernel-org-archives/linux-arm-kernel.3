Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3671D3EE75
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZUXoZxMTPcXobJweOdYXLDq4CMQ2TpTaKkm/Wh4w0c=; b=eaL4eezXHHCeIq1IjPBysMJ8Ys
	2SGYVG3fmDr+8mM+I4Pa3YW5oykFn55kYr7UJLwHN3vmKpbshrq/AHcmQ4ykCH+JAZ8MaR9WfU30W
	v5o2qUtaCYUPsreEGNJHxjs7KMtC5ftwUCMCAtAIDBy9Epr4UqGkPpV60H/6gfhjPL75YXPYS8qA+
	V4wKZU5UMbWEeK6Ayr3MtbeAOHDzZX6VPEw/HSCwHXlIF9g3LiTqGhVFTcNQ+wsIRRQ4grnZUtwWh
	w+TAnDSGk7PvlYHh8wJcenVvgBecPXh65bIFXKRmGO4b8kWPVnqIurCrc5fUxEXYkD2FStWZtajIf
	FNHaq7Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwEV-00000007IF3-2pJV;
	Thu, 22 Jan 2026 15:04:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwER-00000007IE9-2KcX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 15:04:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D42642E5C;
	Thu, 22 Jan 2026 15:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C79AC116D0;
	Thu, 22 Jan 2026 15:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769094262;
	bh=cGpqtKOTFWyChTNyIREce8ooLgtl/FKn1zr/zdRaoCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ix/Ec5tDrikMzZbccvSYYPF3cgbGhNlwZ6R91UAmxYDz9kU40eU0aLoSgJtyxPQi0
	 f7a5wVWIFcop9+eLJ4XeiDFHi2cU/ctXBq54VMgCmDCr5hmbY572dlN8EgFPIvGqJR
	 AZjUKsRtRRJ69DEiwKzM4iPYZfWW/OF2dVg1byyU9C0ZLKrUCr/aFCSyJHVMX0X2fR
	 S/xHdl+NVFccszwiwauCZBH0wRCAsboxmVFfW6ErPxJ3mrb9ykH12AnfYbM2ayTAcz
	 1dsCykqcqYWsUsRFdxfR5e40sK+yzKmJGP9ydv0URAHGW20tOPCbNgP/QiLYwusGXm
	 ogQFtTHugcnWg==
Date: Thu, 22 Jan 2026 15:04:17 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 3/6] KVM: arm64: Make stage2_pte_cacheable() return false
 when S2_AS_S1 is set
Message-ID: <aXI8cchH7l1SHbQR@willie-the-truck>
References: <20260119105651.255693-1-maz@kernel.org>
 <20260119105651.255693-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119105651.255693-4-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_070423_611595_670EE20C 
X-CRM114-Status: GOOD (  21.12  )
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

On Mon, Jan 19, 2026 at 10:56:48AM +0000, Marc Zyngier wrote:
> We cannot tell from the S2 attributes whether what we map is memory
> or not when S2_AS_S1 is set, and issuing a CMO on device memory may
> not be the best idea.
> 
> In this particular case, pretend that the mapping isn't cacheable.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/hyp/pgtable.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 3c5f399b1b986..07561a227f75e 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -911,6 +911,14 @@ static void stage2_unmap_put_pte(const struct kvm_pgtable_visit_ctx *ctx,
>  static bool stage2_pte_cacheable(struct kvm_pgtable *pgt, kvm_pte_t pte)
>  {
>  	u64 memattr = pte & KVM_PTE_LEAF_ATTR_LO_S2_MEMATTR;
> +
> +	/*
> +	 * With S2_AS_S1, we have no idea whether the OA is actual memory or
> +	 * a device. Don't even try a CMO on that.
> +	 */
> +	if (pgt->flags & KVM_PGTABLE_S2_AS_S1)
> +		return false;
> +
>  	return kvm_pte_valid(pte) && memattr == KVM_S2_MEMATTR(pgt, NORMAL);

Since KVM_PGTABLE_S2_AS_S1 is only set for the pKVM host stage-2 and
that doesn't provide any cache maintenance callbacks in its
kvm_pgtable_mm_ops, I don't think the current code is actually broken,
although it's harmless to add the check (and the comment might benefit
from some additional rewording?).

Will

