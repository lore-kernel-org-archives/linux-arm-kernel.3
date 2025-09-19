Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C699CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 10:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0Cu/6/nQEGc26DB6Waz6sKioD3eT4MJxYAYD8aPpL8=; b=Exr2bhkgyeaqC8VoWExD82vY98
	j5cP3p3Fgfy/qUwSgjK8K756Qu2HfMEAwNnP+zo/YRzCBHPpzv0m2usbcEwW1sq5ZObeCsYj4MMab
	GtDWPO2jTg9/5k7MLMsVxAQn3o83dUQriBoU+pzRhA/ZSCGf87vZbOjFs8Ku5PNlD96q4aoJQB+YP
	+KcilX4nLQlHSvK14uW/PLtZTaiOAXJ0v54FdXyHhK0qqrbRhjOP/hsQcBUqZVWAoyI+VBFZ7jSun
	mSwG1kJzeCs0briS7p98skV0zKINoaoaIZX16+ilUVqo0GG5zTPPIxZc7d6mjLcRL7P2E8R3RVcxp
	0ourh5/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYkb-00000002dlL-3CE6;
	Fri, 19 Sep 2025 10:54:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYkZ-00000002dke-1vfX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 10:54:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE971169E;
	Fri, 19 Sep 2025 03:53:48 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD2403F66E;
	Fri, 19 Sep 2025 03:53:55 -0700 (PDT)
Message-ID: <64c0b9fc-c970-4f17-8c3b-6a5078257f83@arm.com>
Date: Fri, 19 Sep 2025 11:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] KVM: arm64: Convert MDCR_EL2 RES0 handling to
 compute_reg_res0_bits()
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, Jinqian Yang <yangjinqian1@huawei.com>
References: <20250918151402.1665315-1-maz@kernel.org>
 <20250918151402.1665315-11-maz@kernel.org>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20250918151402.1665315-11-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_035359_539927_A12167CE 
X-CRM114-Status: GOOD (  12.51  )
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

Hi Marc,

On 9/18/25 16:14, Marc Zyngier wrote:
> While MDCR_EL2 cannot be RES0, convert it to the same infrastructure
> anyway, as it make things cleaner.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/config.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 7b5c5044d4f64..109d1edcd83d4 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
[...]
> @@ -1417,8 +1419,7 @@ void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *r
>  		*res1 = SCTLR_EL1_RES1;
>  		break;
>  	case MDCR_EL2:
> -		*res0 = compute_res0_bits(kvm, mdcr_el2_feat_map,
> -					  ARRAY_SIZE(mdcr_el2_feat_map), 0, 0);
> +		*res0 = compute_reg_res0_bits(kvm, &mdcr_el2_desc, 0, 0);
>  		*res0 |= MDCR_EL2_RES0;
>  		*res1 = MDCR_EL2_RES1;
>  		break;

The patch itself looks fine to me but I am confused as to why MDCR_EL2
is the only switch case where we have:

*res0 |= <reg>_RES0;

Should this not be present in the other cases?

Thanks,

Ben


