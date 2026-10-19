Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204A4606A319
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 16:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YQ0SWskb;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dIm66M1A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnDnWT8nfy0oU8oxY5YNCzl+YDj5L9kNPFLlGZgp4nU=; b=YQ0SWskbj0PNQpPV/3bQ0wH93f
	8OYP0M+oi2o+XlDm7pe2ZI6N/NYg40s3OkeLmTVpsrfEMvFjNe4UA2IAUsKQ/eOqyQBGJEp05xa9+
	fGsBh0gXbsXEMJjmRLwBOIMoMAqpABTnSzGBBs4U+WfS+iCwOL3NKVJpjQaX3+w194wHERBMEwS3E
	5FPDRDd/ObYRLeFctFWzP8YYKG0fV2PuEvh8y/UPVdhWJnlQ6XSP/TJ1v26bfLFoZqJosw7WppfIa
	rYuDea/Y2z5BtSA7q+DXiRqi+UcD9rt16+VFxxXUB4pQ+sLNgjOzs7xn5CRMC1apCGNYpa6qThp4Y
	I9vSHpuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIq44-00000007wiq-3f7X;
	Mon, 19 Oct 2026 16:18:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIq42-00000007whC-46Rx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 16:18:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 570D91682;
	Mon, 19 Oct 2026 09:18:06 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C509B3F673;
	Mon, 19 Oct 2026 09:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792426689; bh=PbsjFNsm7VGpra2Vi/6m7D2lXbbkOy07UDe6RsBa9ao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dIm66M1AAK2DTm44/RC4CeugGbPKALRrtpOthiN3TkCk8HDpMEc4iEOa+cmjqwb5R
	 ulegfB5hJ66aJK/3G88pPELm6ERKzjk9ZsN9+Oo4RKow07arEuVNIOr+WMewv0rCQl
	 C6Wjj3gFBsBR2vQMIhwp5atOH3S9mjtqsScSHjD8=
Message-ID: <4bf21ff8-7e4b-4afe-b3e9-9ee85fcd1c84@arm.com>
Date: Mon, 19 Oct 2026 17:18:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Do not access MPAMF_ESR on MSCs that do not
 have it
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <20261019124612.134035-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261019124612.134035-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_091819_111496_ECE8BA0B 
X-CRM114-Status: GOOD (  21.36  )
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ping,

On 19/10/2026 13:46, Ping Li wrote:
> mpam_msc_clear_esr() and mpam_msc_read_esr() read MPAMF_ESR
> unconditionally, but the MPAM architecture only provides this
> register when MPAMF_IDR.HAS_ESR is set. 

This isn't always true. With MSC v1.0 then there may be MPAMF_ESR but there is no MPAMF_IDR.HAS_ESR bit.

On an implementation without
> ESR these accesses reach unimplemented register space.

Rather, they are either fully implemented or RAZ/WI.

In version B.d of the MPAM spec section 7.3,
RLNXX:
If FEAT_MPAMv1p0 is implemented and it is not possible to detect error conditions, then MPAMF_ESR
and MPAMF_ECR must be RAZ/WI.

PNPQQ:
If all of the following apply to an error condition, then an MPAM MSC implementation is required to
detect and report that error:
• At least one feature that can cause the error condition is supported.
• The MSC is designed such that the error condition can occur.
• Detection of the error condition is required. See Required error condition detection.


These two rules together indicate that for MSC v1.0 that MPAMF_ESR should either be RAZ/WI or
implemented.

SJFMB:
If all of the following apply, MPAMF_IDR.HAS_ESR is permitted to be 0:
 • FEAT_MPAMv0p1, or from FEAT_MPAMv1p1, is implemented.
 • No error conditions meet the criteria in PNPQQ.

Together with the comment in 9.5.5 for HAS_ESR (quoted below), this indicates that for MSC v1.1 that
MPAMF_ESR should be RAZ/WI or implemented.

"
If an MSC cannot encounter any of the error conditions listed in MPAM MSC Errors of Arm® Memory
System Resource Partitioning and Monitoring (MPAM) System Component Specification (ARM IHI 0099),
both the MPAMF_ESR and MPAMF_ECR must be RAZ/WI.
"

As such, reading and writing MPAMF_ESR should either behave as per the register definition or be
benign but ineffectual. Have you got a platform that behaves differently?

Thanks,

Ben

> 
> Read HAS_ESR from the IDR during probe, make clear_esr() a no-op on
> such MSCs, and have read_esr() return -ENODEV as the register
> cannot be read.
> 
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
> ---
>  drivers/resctrl/mpam_devices.c  | 7 +++++++
>  drivers/resctrl/mpam_internal.h | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 48adc49b833c..a473b2872183 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -388,6 +388,9 @@ static int mpam_msc_clear_esr(struct mpam_msc *msc)
>  	u32 esr_low;
>  	int ret;
>  
> +	if (!msc->has_esr)
> +		return 0;
> +
>  	ret = __mpam_read_reg(msc, MPAMF_ESR, &esr_low);
>  	if (ret)
>  		return ret;
> @@ -415,6 +418,9 @@ static int mpam_msc_read_esr(struct mpam_msc *msc, u64 *res)
>  	u32 esr_high, esr_low;
>  	int ret;
>  
> +	if (!msc->has_esr)
> +		return -ENODEV;
> +
>  	ret = __mpam_read_reg(msc, MPAMF_ESR, &esr_low);
>  	if (ret)
>  		return ret;
> @@ -1205,6 +1211,7 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  		pmg_max = FIELD_GET(MPAMF_IDR_PMG_MAX, idr);
>  		msc->partid_max = min(msc->partid_max, partid_max);
>  		msc->pmg_max = min(msc->pmg_max, pmg_max);
> +		msc->has_esr = FIELD_GET(MPAMF_IDR_HAS_ESR, idr);
>  		msc->has_extd_esr = FIELD_GET(MPAMF_IDR_HAS_EXTD_ESR, idr);
>  
>  		scoped_guard(mutex, &mpam_list_lock) {
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 1f86cc158100..b648c006e102 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -80,6 +80,7 @@ struct mpam_msc {
>  	int			fb_id;
>  	u32			nrdy_usec;
>  	cpumask_t		accessibility;
> +	bool			has_esr;
>  	bool			has_extd_esr;
>  
>  	int				reenable_error_ppi;
> 
> base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad


