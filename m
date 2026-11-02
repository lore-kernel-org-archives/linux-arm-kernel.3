Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA4A606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JB5iH5sV;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Inl/f/n7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uDQFPI1KDA0kc2MfKk2nGSM1gT5NZL58NRp1i/RIpe0=; b=JB5iH5sVNqJFrh
	doA6f6kf81+AWQga1WEZlxBibtONfaUHRzyzuqLneItBckA4H09+QDxjTxzkrP8IxicAzwojKz66o
	QhIo2RRMsRIpizag72MbzHG3NcgC7Ap7kx/UyFFdlMX9xA7Ls7rwc2+Uc+Xg2IkPOqO9/gUktTc/A
	uAOYbbq/JiMvzjWMcqQnKFTRkYuk7baR60a8L0pHvyjdEshLkmup6hkG15xia5AEDSvP0C1XbciOs
	6M1bEICvQGxvi8YHpRj4hqxi5rDGr2X24ETVLCV3t1UO2G7eu1iYsmE38exrciXA8UMvz90fF1CB1
	cTjv7r+k4EGffvV3IgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNocC-0000000G3aK-0R2V;
	Mon, 02 Nov 2026 09:46:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNocA-0000000G3Zm-1MZd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:46:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60E0A1691;
	Mon,  2 Nov 2026 01:46:00 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 775B03F59E;
	Mon,  2 Nov 2026 01:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793612763; bh=L4lGO/TR0LC4Klf4but4GyDe/cWEKZRFCS4SULLDNI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Inl/f/n71KfSzhlbqkGJYPcf9+SOi/1GQKNdCnZkGPQo5Z0UfbN8QRNQJDpMFbCZJ
	 TzHazfDTqjwjWVbD1mpuVT6U69ShYE97nahhJ2VFlnAts7fjqWENMPdmdIGt7cAvFR
	 mW+/T3dUvc/wyK2u6YV1avNZRLZd24HHoRZ1A9Zc=
Message-ID: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
Date: Mon, 2 Nov 2026 09:46:01 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Only program MATCH_PMG when the monitor
 supports it
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <20261102071300.554160-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261102071300.554160-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_014606_449954_4B432DF2 
X-CRM114-Status: GOOD (  24.21  )
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

Hi Ping,

On 02/11/2026 07:13, Ping Li wrote:
> An MSC of ours implements the MBWU monitor without PMG support:
> MPAMF_MBWUMON_IDR.NO_MATCH_PMG is 1, so MSMON_CFG_x_CTL.MATCH_PMG is
> RES0. On this hardware resctrl monitor reads always returned 0.
> 
> Tracking this down: __read_mon() unconditionally sets match_pmg,
> because the resctrl (closid, rmid) model maps rmid to PMG. The
> expected configuration generated by gen_msmon_ctl_flt_vals() then
> contains MATCH_PMG, but the hardware ignores the bit, so the
> configuration read back never matches, config_mismatch is always
> true and the monitor is reprogrammed on every read - the counter
> never accumulates.
> 
> The architecture allows an MSMON implementation without PMG
> support, so read the NO_MATCH_PMG bits during probe and only
> program MATCH_PMG when the monitor supports PMG filtering,
> falling back to filtering by PARTID only. The CSU monitor has
> the same issue and is covered the same way.

I'm afraid this doesn't work. resctrl will show the same counts for every monitor group under a
control group rather than the counts related to the tasks/cpus associated with the individual
monitor groups.

Have you actually built NO_MATCH_PMG? I ask because I understood that NO_MATCH_PMG and
NO_MATCH_PARTID were erroneously added to the MPAMv1 specification and were going to be removed.
What you should build or not is question for support@arm.com rather than the list though.

Thanks,

Ben

> 
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
> ---
>  drivers/resctrl/mpam_devices.c  | 22 +++++++++++++++++++++-
>  drivers/resctrl/mpam_internal.h |  4 ++++
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index c067b6d57d71..2086ff121b59 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1089,6 +1089,9 @@ static int mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>  				if (FIELD_GET(MPAMF_CSUMON_IDR_HAS_XCL, csumonidr))
>  					mpam_set_feature(mpam_feat_msmon_csu_xcl, props);
>  
> +				if (!FIELD_GET(MPAMF_CSUMON_IDR_NO_MATCH_PMG, csumonidr))
> +					mpam_set_feature(mpam_feat_msmon_csu_match_pmg, props);
> +
>  				/* Is NRDY hardware managed? */
>  				err = mpam_ris_hw_probe_csu_nrdy(ris);
>  				if (err < 0)
> @@ -1118,6 +1121,9 @@ static int mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>  				if (FIELD_GET(MPAMF_MBWUMON_IDR_HAS_RWBW, mbwumon_idr))
>  					mpam_set_feature(mpam_feat_msmon_mbwu_rwbw, props);
>  
> +				if (!FIELD_GET(MPAMF_MBWUMON_IDR_NO_MATCH_PMG, mbwumon_idr))
> +					mpam_set_feature(mpam_feat_msmon_mbwu_match_pmg, props);
> +
>  				has_long = FIELD_GET(MPAMF_MBWUMON_IDR_HAS_LONG, mbwumon_idr);
>  				if (has_long) {
>  					if (FIELD_GET(MPAMF_MBWUMON_IDR_LWD, mbwumon_idr))
> @@ -1309,6 +1315,20 @@ static int mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
>  	return __mpam_write_reg(msc, MSMON_MBWU_L + 4, 0);
>  }
>  
> +static bool msmon_supports_match_pmg(struct mon_read *m)
> +{
> +	switch (m->type) {
> +	case mpam_feat_msmon_csu:
> +		return mpam_has_feature(mpam_feat_msmon_csu_match_pmg, &m->ris->props);
> +	case mpam_feat_msmon_mbwu_31counter:
> +	case mpam_feat_msmon_mbwu_44counter:
> +	case mpam_feat_msmon_mbwu_63counter:
> +		return mpam_has_feature(mpam_feat_msmon_mbwu_match_pmg, &m->ris->props);
> +	default:
> +		return true;
> +	}
> +}
> +
>  static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>  				   u32 *flt_val)
>  {
> @@ -1322,7 +1342,7 @@ static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>  
>  	*flt_val = FIELD_PREP(MSMON_CFG_x_FLT_PARTID, ctx->partid);
>  
> -	if (m->ctx->match_pmg) {
> +	if (m->ctx->match_pmg && msmon_supports_match_pmg(m)) {
>  		*ctl_val |= MSMON_CFG_x_CTL_MATCH_PMG;
>  		*flt_val |= FIELD_PREP(MSMON_CFG_x_FLT_PMG, ctx->pmg);
>  	}
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 1f86cc158100..88cd5ac4cde3 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -227,12 +227,14 @@ enum mpam_device_features {
>  	mpam_feat_msmon_csu,
>  	mpam_feat_msmon_csu_capture,
>  	mpam_feat_msmon_csu_xcl,
> +	mpam_feat_msmon_csu_match_pmg,
>  	mpam_feat_msmon_mbwu,
>  	mpam_feat_msmon_mbwu_31counter,
>  	mpam_feat_msmon_mbwu_44counter,
>  	mpam_feat_msmon_mbwu_63counter,
>  	mpam_feat_msmon_mbwu_capture,
>  	mpam_feat_msmon_mbwu_rwbw,
> +	mpam_feat_msmon_mbwu_match_pmg,
>  	mpam_feat_partid_nrw,
>  	MPAM_FEATURE_LAST
>  };
> @@ -645,6 +647,7 @@ int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
>  
>  /* MPAMF_CSUMON_IDR - MPAM cache storage usage monitor ID register */
>  #define MPAMF_CSUMON_IDR_NUM_MON	GENMASK(15, 0)
> +#define MPAMF_CSUMON_IDR_NO_MATCH_PMG	BIT(22)
>  #define MPAMF_CSUMON_IDR_HAS_OFLOW_CAPT	BIT(24)
>  #define MPAMF_CSUMON_IDR_HAS_CEVNT_OFLW	BIT(25)
>  #define MPAMF_CSUMON_IDR_HAS_OFSR	BIT(26)
> @@ -655,6 +658,7 @@ int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
>  
>  /* MPAMF_MBWUMON_IDR - MPAM memory bandwidth usage monitor ID register */
>  #define MPAMF_MBWUMON_IDR_NUM_MON	GENMASK(15, 0)
> +#define MPAMF_MBWUMON_IDR_NO_MATCH_PMG	BIT(22)
>  #define MPAMF_MBWUMON_IDR_HAS_RWBW	BIT(28)
>  #define MPAMF_MBWUMON_IDR_LWD		BIT(29)
>  #define MPAMF_MBWUMON_IDR_HAS_LONG	BIT(30)


