Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08098C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZmwLJ1BsoajU83dL7tCkIXJVq8VTmYFQ4QgQItfZKc=; b=RZE8k+wGTHc7yUztzuHnHVBM7w
	LpHLFGQZWcFBcijAP6Y++wL8hzDs6ScKmZQQCwvmyIP0fchoRLK5eJuEb2vVVGt27LLLWznikkN3a
	IkELXR0EtMc0oF4Qs0bkA2dSpg5V/nerics0FhuDWOCS1Xiya6MO/CSESi9P+DeeJ1yg+20TOBVSw
	/j1jxbA1pD8fDOZgfwW5gjHvla15yT68Ys3gX2Z4LbcuEPpRAZrb5Am3xt8/n5Oq4jzLyCZFT8wNo
	intjdxzsu1wGlbCr+MgRHr0u6+zolOd4xwMEswo5AA2lqveAEdDPbUb3yqMOR7flaa1MCHBN5psHb
	r8i9PD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mgy-0000000A4td-19st;
	Tue, 29 Apr 2025 15:16:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kha-00000009jgi-0rsF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 13:08:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA1A91515;
	Tue, 29 Apr 2025 06:08:38 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2906A3F673;
	Tue, 29 Apr 2025 06:08:44 -0700 (PDT)
Message-ID: <8821ec7f-712e-4d70-b55f-f560b4002e86@arm.com>
Date: Tue, 29 Apr 2025 14:08:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 40/42] KVM: arm64: Allow sysreg ranges for FGT
 descriptors
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250426122836.3341523-1-maz@kernel.org>
 <20250426122836.3341523-41-maz@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250426122836.3341523-41-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_060846_290116_9277E7D2 
X-CRM114-Status: GOOD (  16.34  )
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

On 4/26/25 13:28, Marc Zyngier wrote:
> Just like we allow sysreg ranges for Coarse Grained Trap descriptors,
> allow them for Fine Grain Traps as well.
> 
> This comes with a warning that not all ranges are suitable for this
> particular definition of ranges.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>   arch/arm64/kvm/emulate-nested.c | 120 +++++++++++---------------------
>   1 file changed, 39 insertions(+), 81 deletions(-)
> 
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index e2a843675da96..9c7ecfccbd6e9 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -622,6 +622,11 @@ struct encoding_to_trap_config {
>   	const unsigned int		line;
>   };
>   
> +/*
> + * WARNING: using ranges is a treacherous endeavour, as sysregs that
> + * are part of an architectural range are not necessarily contiguous
> + * in the [Op0,Op1,CRn,CRm,Ops] space. Tread carefully.
> + */
>   #define SR_RANGE_TRAP(sr_start, sr_end, trap_id)			\
>   	{								\
>   		.encoding	= sr_start,				\
> @@ -1289,15 +1294,19 @@ enum fg_filter_id {
>   
>   #define FGT(g, b, p)		__FGT(g, b, p, __NO_FGF__)
>   
> -#define SR_FGF(sr, g, b, p, f)					\
> +/* Same warning applies: use carefully */
Nit: The other warning is a few hundred lines away. Consider identifying 
it more precisely.
> +#define SR_FGF_RANGE(sr, e, g, b, p, f)				\
>   	{							\
>   		.encoding	= sr,				\
> -		.end		= sr,				\
> +		.end		= e,				\
>   		.tc		= __FGT(g, b, p, f),		\
>   		.line = __LINE__,				\
>   	} 
Thanks,

Ben


