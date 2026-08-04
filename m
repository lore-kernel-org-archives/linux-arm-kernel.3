Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162EDC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTOKzgHuD3KRtjS03wNmLdJVCRW00bEzm0RyWyZwqBI=; b=nPjhw09rplH0h/B+a1XXAsVt9a
	0KmF3muQHzxzzwpKjPbVhck2tSpZUod1JGoH7rXolgZqu644Zb+/qUGNyU1D9K9WErktcToMly8xz
	+ztx40K6UWQVQ9itk1vndYbtXCcdsPdHXvuEQehsz1Raj1Ogn488rnXjJ+ZilqBI/XKU3yTsG2MWr
	SsuIVHZE18d9adu2ab06v9BmTTB4nOnAEsxIhSeYj2jqVOCaMbO+NAg8Dcx0SO89BU2GCSrjolFLR
	FUXPysoDL0WyBXp+/Ggs6jbS9IUQUld/Fmta6o15Ki3YVSXlHcZw4mV9JgecZnNqN7IsYLv0wECQ6
	Llqi0bHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5vE-00000000vdX-0b3D;
	Tue, 04 Aug 2026 03:34:32 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5vA-00000000vcr-3org
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 03:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785814466; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=TTOKzgHuD3KRtjS03wNmLdJVCRW00bEzm0RyWyZwqBI=;
	b=CDTpmPiLHmKqq3jOZmSIsQHNezWD+IUN9i59bdtI0AAgKPB94yMKIBN6Sd4Gz7xPbMGoCx4CY0quQp4N4JPrHGHFRRvGgLalJib8aC9x6aOa8OpuDqaDIP7dQlXK15G6VPMPMZ9pDTJ4POcRJue7ELyHFmOraYC6R3SLQrjZIXk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X8MUQlp_1785814464;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X8MUQlp_1785814464 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 04 Aug 2026 11:34:25 +0800
Date: Tue, 4 Aug 2026 11:34:24 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Hyunwoo Kim <imv4bel@gmail.com>
Subject: Re: [PATCH 5/6] KVM: arm64: Couple VNCR fixmap clearing and CPU
 number invalidation
Message-ID: <wlcvwmmsu3ryj3zytcnx5xhmuhjbgofqsaw5o54qwbdwc3n7ca@wj5n4swgeokb>
References: <20260801124818.366274-1-maz@kernel.org>
 <20260801124818.366274-6-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801124818.366274-6-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_203429_486170_55673472 
X-CRM114-Status: GOOD (  15.70  )
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

On Sat, Aug 01, 2026 at 01:48:17PM +0800, Marc Zyngier wrote:
> A mapped VNCR translation must indicate which CPU it is resident.
> Unmapping such a translation must make this CPU number -1.
>
> Couple the unmap and the setting to -1 in a helper, so that we
> are always sure they are done together.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/nested.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 47d61d3cf053c..84915e2cff604 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -894,6 +894,12 @@ void kvm_vcpu_load_hw_mmu(struct kvm_vcpu *vcpu)
>  	}
>  }
>
> +static void unmap_l1_vncr(struct vncr_tlb *vt)
> +{
> +	clear_fixmap(vncr_fixmap(vt->cpu));
> +	vt->cpu = -1;
> +}
> +
>  static void this_cpu_reset_vncr_fixmap(struct kvm_vcpu *vcpu)
>  {
>  	if (!host_data_test_flag(L1_VNCR_MAPPED))
> @@ -902,8 +908,7 @@ static void this_cpu_reset_vncr_fixmap(struct kvm_vcpu *vcpu)
>  	BUG_ON(vcpu->arch.vncr_tlb->cpu != smp_processor_id());
>  	BUG_ON(is_hyp_ctxt(vcpu));
>
> -	clear_fixmap(vncr_fixmap(vcpu->arch.vncr_tlb->cpu));
> -	vcpu->arch.vncr_tlb->cpu = -1;
> +	unmap_l1_vncr(vcpu->arch.vncr_tlb);
>  	host_data_clear_flag(L1_VNCR_MAPPED);
>  }
>
> @@ -996,7 +1001,7 @@ static void invalidate_vncr(struct vncr_tlb *vt)
>  {
>  	vt->valid = false;
>  	if (vt->cpu != -1)
> -		clear_fixmap(vncr_fixmap(vt->cpu));
> +		unmap_l1_vncr(vt);

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>  }
>
>  static bool vncr_tlb_intersects(struct vncr_tlb *vt, u64 addr,
> --
> 2.47.3
>

