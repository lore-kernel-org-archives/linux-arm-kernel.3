Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D8FD3B9A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2pdt1QKqUvhQF74nha7uxn2IzLNNgFKRfKY0UJFns0=; b=2ID5FfipUA5n+XJm3ORuIDa2zx
	o3dedB3B4wgs05YKziIjuCL4lOMEdh+msN919r/h2/S/uEC3mXcdjkAVkG4SVAtIEbZxDbxtIp3qh
	GX3k38wedPIO+3nf6QHSDV4XzwCEAs2mq3ohJeHWy8O/l1lpNRWG3StDZdy+V4L/CHt26ZkiQfXNM
	58z4KaUJltgjoPlM3+GIk0mkUifRZUv+qee7rcoZRGQDf24vuy9Q8QKE3EE6Wg155XWx5k6BgcBvB
	VfCeeWZGcIYZGgCLdKsWvsK+9Tp44BefTduSzwx74LkrEuHwu/i9e3zeGciqQZhENxsQo39QaS4LK
	zcZZF5+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxUA-0000000B0C2-1o21;
	Tue, 26 Nov 2024 15:28:18 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxTB-0000000B02q-3Zxn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 15:27:19 +0000
Date: Tue, 26 Nov 2024 07:27:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732634831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M2pdt1QKqUvhQF74nha7uxn2IzLNNgFKRfKY0UJFns0=;
	b=A4uEAhXN/IN4JzD/h5Bvk7X6D4FcKNtOdhYKUDeS4X+PtKv9ifrMkNkRxORI8wkDABMBER
	I1IQrnMYwpcc3Mc/QHzUbHuKKp2qA0I+sjNbV0gL4CmlRposshcn5Sxh5RdoQbDafNn6Uk
	URaRqsg4H6Xxh9ZtFmIPIkG7p4aI8/k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH] KVM: arm64: Fix S1/S2 combination when FWB==1 and S2 has
 Device memory type
Message-ID: <Z0XoxGSWRCjbTFie@linux.dev>
References: <20241125094756.609590-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125094756.609590-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_072718_399876_4E22CA0D 
X-CRM114-Status: GOOD (  17.05  )
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

On Mon, Nov 25, 2024 at 09:47:56AM +0000, Marc Zyngier wrote:
> The G.a revision of the ARM ARM had it pretty clear that HCR_EL2.FWB
> had no influence on "The way that stage 1 memory types and attributes
> are combined with stage 2 Device type and attributes." (D5.5.5).
> 
> However, this wording was lost in further revisions of the architecture.
> 
> Restore the intended behaviour, which is to take the strongest memory
> type of S1 and S2 in this case, as if FWB was 0. The specification is
> being fixed accordingly.

Since you're already asking for a spec fix, could you mention that the
column headers in DDI0487K.a Table D8-95 are incorrect? MemAttr[1:0] is
used twice, although I believe the first column is actually MemAttr[3:2].

> Fixes: be04cebf3e788 ("KVM: arm64: nv: Add emulation of AT S12E{0,1}{R,W}")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/at.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index 8c5d7990e5b31..98cb499fa4b11 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -739,8 +739,15 @@ static u64 compute_par_s12(struct kvm_vcpu *vcpu, u64 s1_par,
>  			final_attr = s1_parattr;
>  			break;
>  		default:
> -			/* MemAttr[2]=0, Device from S2 */
> -			final_attr = s2_memattr & GENMASK(1,0) << 2;
> +			/*
> +			 * MemAttr[2]=0, Device from S2.
> +			 *
> +			 * FWB does not influence the way that stage 1
> + 			 * memory types and attributes are combined
> + 			 * with stage 2 Device type and attributes.
> +			 */
> +			final_attr = min(s2_memattr_to_attr(s2_memattr),
> +					 s1_parattr);

Otherwise, LGTM.

-- 
Thanks,
Oliver

