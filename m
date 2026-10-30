Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19862606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i0QUGKVQ;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Zd/VYZzH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=htSTNd9cA8Wg2MeyyIfM51PFL8ci57bD31F/Ut36EqM=; b=i0QUGKVQ9fQvpm
	RqX8/AscApckU2mXAUygqCDxvu0/cZlE1UDnz1SsBmkOGgL4ZS3vwG2OiV1p0lqt5bOOWxkGyXnH2
	K25Ax/UGdjF9PUoGqsPvMUXZUCrSCc50dy0suVKK7cnYhrXy/1ThL2c0qYiO5Ao4cN0yQp7nowUuG
	/caIgc7tjkcQOHEFqtU935iEoY7RC6vD+Rj/Iq9HnwmKL0w3bcijaC8IvuKC0muSxENtiH6nU7W8a
	tOABla65Hj5U2IQ2Ph38qfsLTcRkdzmQqbm+aYWA3NpelwVJxdxtBYYMc71oHnKE0k0cD/HyBFGqQ
	gM1/gEAOfDMr94Iy8v1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpcL-0000000C9Lf-3Dbl;
	Fri, 30 Oct 2026 16:38:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpcJ-0000000C9KV-14jC;
	Fri, 30 Oct 2026 16:38:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F5B01682;
	Fri, 30 Oct 2026 09:38:05 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D0C43F673;
	Fri, 30 Oct 2026 09:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793378288; bh=Rfc4WAfhYKXq9UXyLbETI7ENpp2ZXXl3U2uJkCJ+X0U=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Zd/VYZzHC0G8xIyj2KtjF5zomiTqmINVwwYmlLjfKLdpjcOPnRrjfCyWT3CuBbbTp
	 J4zFyqlptBA3FPP4bz6rXczLbQWb/Y/m1ILcXgRV/1RVjTTZQxhMzeoDnxPhjSbwhx
	 G5XsdXCf20ZF8aFLJMUi+knOUeh0gOCHlWeFd/Oo=
Message-ID: <bea9392d-a9d1-4683-ba2c-41139a1dca9d@arm.com>
Date: Fri, 30 Oct 2026 16:38:03 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/19] arm_mpam: resctrl: Leave CDP off when there
 are too few PARTIDs
To: Jinjie Ruan <ruanjinjie@huawei.com>, reinette.chatre@intel.com,
 james.morse@arm.com, fenghuay@nvidia.com, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, tony.luck@intel.com,
 Dave.Martin@arm.com, babu.moger@amd.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 tan.shaopeng@jp.fujitsu.com, jic23@kernel.org, zengheng4@huawei.com,
 gshan@redhat.com, x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
 <20261029123611.1108424-2-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261029123611.1108424-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_093811_485241_07DE15FA 
X-CRM114-Status: GOOD (  25.29  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jinjie,

Thanks for this fix!

On 29/10/2026 12:35, Jinjie Ruan wrote:
> Enabling CDP needs a second PARTID for the reserved closid.

I'm not sure what a 'reserved closid' is here but you could just say:

Enabling CDP requires at least 2 PARTIDs.

> If firmware
> reports too few PARTIDs, resctrl_arch_set_cdp_enabled() returns -EINVAL,

Not all systems are firmware backed. This can be:

If there are too few PARTIDs, ... .

> but only after it has recorded CDP as enabled, halved the monitor count
> and turned off the mbw_max MBA control. 


> resctrl then reports an error
> and believes CDP is off, which leaves the two sides out of step and the
> halved monitor count and the missing MBA control are not undone.

I think the 'reports an error part' can be dropped leaving 'resctrl then believes CDP is off...' as
exactly what resctrl does is not important here.

> 
> Check the PARTID limit, and work out the CDP PARTIDs, before anything is

Why work out the CDP PARTIDs so early if they aren't going to be used?

> changed so a failed enable has no effect.
> 
> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 5468367776e2..886f0595d364 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -210,6 +210,18 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>  	if (enable)
>  		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
>  
> +	/*
> +	 * Check this before changing any state: if CDP can't be enabled the
> +	 * caller must see CDP left off.
> +	 */

I don't think this comment is needed. Failing early rather than failing late after some side effects
have happened is clearly better.

> +	if (enable) {
> +		if (mpam_partid_max < 1)
> +			return -EINVAL;
> +
> +		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
> +		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);

The partid_d/partid_i determination can stay below so it's close to the user.

I think we can just have the check here:

if (enable && mpam_partid_max < 1)
  	return -EINVAL;

Thanks,

Ben

> +	}
> +
>  	/*
>  	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
>  	 * false on error and unmount.
> @@ -238,14 +250,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>  	if (!cdp_enabled && mpam_resctrl_controls[RDT_RESOURCE_MBA].class)
>  		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
>  
> -	if (enable) {
> -		if (mpam_partid_max < 1)
> -			return -EINVAL;
> -
> -		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
> -		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
> -	}
> -
>  	mpam_set_task_partid_pmg(current, partid_d, partid_i, 0, 0);
>  	WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
>  


