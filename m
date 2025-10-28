Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDDACCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0yxojRUhkv7avomLXrPgMCU3DkrIfYAD2DDV/SBzIk=; b=kQLdplHvlp6yQidY2SglyTXpHQ
	vwGEqL7BXOrh3nZEUI77mNfJn9UOQwFdlPhGFAnV+4RGnq1FLrOu/+fxbGTALxL5LTIUKGAV7cq1I
	E4CI6Szet/53f4tx3dRvE1r0dBWZif+epqJU0hVmHZMms/HGOmT15J/tn46RKTKrm3nzCLjaaOgSr
	YuEdv44WoL1l+YSbF3h0DDB+M8MA1QbSA8Je8IMeJ/q0KmIOWMAhok3wsi+dyETpzQQTQZsk67ya8
	TEfdHUoVbZlqiGfCkjZPCcgo/PxOhznWhaKeoHudVKAUG57EbvSr51iurmOXjycV8baDq5J87eT4d
	8zJL/m+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgu6-0000000Fl2s-0oAw;
	Tue, 28 Oct 2025 10:26:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgu2-0000000Fl23-1dOb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:26:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CCDB106F;
	Tue, 28 Oct 2025 03:26:01 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 146923F63F;
	Tue, 28 Oct 2025 03:26:06 -0700 (PDT)
Message-ID: <f5aa3c19-fdea-4f62-9541-530e59b20a87@arm.com>
Date: Tue, 28 Oct 2025 10:26:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] KVM: arm64: support optional calls of FF-A v1.2
To: Yeoreum Yun <yeoreum.yun@arm.com>, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 perlarsen@google.com, ayrton@google.com
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251027191729.1704744-1-yeoreum.yun@arm.com>
 <20251027191729.1704744-3-yeoreum.yun@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251027191729.1704744-3-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_032610_549968_1244A384 
X-CRM114-Status: GOOD (  20.67  )
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

Hi Levi,

On 10/27/25 19:17, Yeoreum Yun wrote:
> To use TPM drvier which uses CRB over FF-A with FFA_DIRECT_REQ2,
> support the FF-A v1.2's optinal calls by querying whether
> SPMC supports those.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 0ae87ff61758..9ded1c6369b9 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -646,6 +646,22 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
>  		ffa_to_smccc_res(res, ret);
>  }
>  
> +static bool ffa_1_2_optional_calls_supported(u64 func_id)
> +{
> +	struct arm_smccc_1_2_regs res;
> +
> +	if (!smp_load_acquire(&has_version_negotiated) ||
> +		(FFA_MINOR_VERSION(FFA_VERSION_1_2) < 2))
> +		return false;
> +
> +	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
> +		.a0 = FFA_FEATURES,
> +		.a1 = func_id,
> +	}, &res);
> +
> +	return res.a0 == FFA_SUCCESS;
> +}
> +
>  /*
>   * Is a given FFA function supported, either by forwarding on directly
>   * or by handling at EL2?
> @@ -678,12 +694,13 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_NOTIFICATION_SET:
>  	case FFA_NOTIFICATION_GET:
>  	case FFA_NOTIFICATION_INFO_GET:
> +		return false;
>  	/* Optional interfaces added in FF-A 1.2 */
>  	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
>  	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
>  	case FFA_CONSOLE_LOG:			/* Optional per 13.1: not in Table 13.1 */

Looking at table 13.54 in the FF-A 1.2 spec FFA_CONSOLE_LOG is only supported in secure FF-A
instances and not from the normal world.

>  	case FFA_PARTITION_INFO_GET_REGS:	/* Optional for virtual instances per 13.1 */
> -		return false;
> +		return ffa_1_2_optional_calls_supported(func_id);
>  	}

I don't think that an smc call here is the right thing to do. This changes this from a light 
weight deny list to an extra smc call for each ffa_msg_send_direct_req2 from the driver.

Instead, I would expect this patch just to remove FFA_MSG_SEND_DIRECT_REQ2 from the deny list
and rely on the TPM driver to use FFA_FEATURES to check whether it's supported.

So, just this change:

@@ -679,7 +679,6 @@ static bool ffa_call_supported(u64 func_id)
        case FFA_NOTIFICATION_GET:
        case FFA_NOTIFICATION_INFO_GET:
        /* Optional interfaces added in FF-A 1.2 */
-       case FFA_MSG_SEND_DIRECT_REQ2:          /* Optional per 7.5.1 */
        case FFA_MSG_SEND_DIRECT_RESP2:         /* Optional per 7.5.1 */
        case FFA_CONSOLE_LOG:                   /* Optional per 13.1: not in Table 13.1 */
        case FFA_PARTITION_INFO_GET_REGS:       /* Optional for virtual instances per 13.1 */

Am I missing something?

>  
>  	return true; 
Thanks,

Ben


