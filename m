Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A7010F284B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/f2VVRiC4kZMfmEF+GIeE3o0ebT2+vMtOCZ9kYiqt3w=; b=tLxwgSZJTws4dpnOkNnlL1bC3K
	3tZNYHkf0g644UqKqNZuVel8u6XJLXdl4eTApzZSTEIXzEQk30BCnQhpBfdCMi0BkqqJ6ICaUdDeA
	VH7/emL6CVwelo23338dBqyrtaQWwvz6Ry9wnN+ZBe/Zeo69/5Kll73PELw6pgoAm6tq5FspUb20+
	eSP7CSS5KKc4ReXfIB1ghbVoGsHImy+2KVDlAvMIz1uIBiz7QyLqA+1To/bXAo3x7B/Wl+6vnuEO2
	sPNzweHFoMJs5DNVin7JiP0Gvs/WN5YMKQ4lU5C3Csk0PXOtsw9Tm9lHkAzYpX9pRUbjFlxptu3tB
	/BzdE8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69wa-00000007lOP-3VdN;
	Fri, 27 Mar 2026 16:21:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69wY-00000007lNh-17Vj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:21:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1519935DA;
	Fri, 27 Mar 2026 09:21:47 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97B473F905;
	Fri, 27 Mar 2026 09:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774628513; bh=rLD7D9hB1vO0sLYUWoaxiGJUNxnpjdOsHR7xPwiNSSk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WTF7+ykAX6sFkGCxVe4cCl1XX1yEyhecilKZP9eHWygbi8E6UJul45MEkX5osViHT
	 W4gwwyJaY1GKdrKh3aZBJQ0Fgm+87LVJR4T4avKhzuuSUykzsGzmia/9+wJVfNDHSs
	 LSg6891x++zHlA+u6CoJp0XIRcjq/Q1HQP4APU8k=
Message-ID: <27047c27-9479-4aed-937e-04db108526d7@arm.com>
Date: Fri, 27 Mar 2026 16:21:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/40] arm_mpam: Reset when feature configuration bit
 unset
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-3-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260313144617.3420416-3-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_092154_457949_CEDD87C8 
X-CRM114-Status: GOOD (  17.01  )
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

Hi Ben,

On 13/03/2026 14:45, Ben Horgan wrote:
> To indicate that the configuration, of the controls used by resctrl, in a
> RIS need resetting to driver defaults the reset flags in mpam_config are
> set. However, these flags are only ever set temporarily at RIS scope in
> mpam_reset_ris() and hence mpam_cpu_online() will never reset these
> controls to default. As the hardware reset is unknown this leads to unknown
> configuration when the control values haven't been configured away from the
> defaults.
> 
> Use the policy that an unset feature configuration bit means reset. In this
> way the mpam_config in the component can encode that it should be in reset
> state and mpam_reprogram_msc() will reset controls as needed.


> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 0fd6590a9b5c..ff861291bd4e 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1364,17 +1364,15 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>  		__mpam_intpart_sel(ris->ris_idx, partid, msc);
>  	}
>  
> -	if (mpam_has_feature(mpam_feat_cpor_part, rprops) &&
> -	    mpam_has_feature(mpam_feat_cpor_part, cfg)) {
> -		if (cfg->reset_cpbm)

After this, nothing reads/writes these explicit reset flags so they can be removed from
struct mpam_config.

(I'll do this locally)


> -			mpam_reset_msc_bitmap(msc, MPAMCFG_CPBM, rprops->cpbm_wd);
> -		else
> +	if (mpam_has_feature(mpam_feat_cpor_part, rprops)) {
> +		if (mpam_has_feature(mpam_feat_cpor_part, cfg))
>  			mpam_write_partsel_reg(msc, CPBM, cfg->cpbm);
> +		else
> +			mpam_reset_msc_bitmap(msc, MPAMCFG_CPBM, rprops->cpbm_wd);
>  	}
>  
> -	if (mpam_has_feature(mpam_feat_mbw_part, rprops) &&
> -	    mpam_has_feature(mpam_feat_mbw_part, cfg)) {
> -		if (cfg->reset_mbw_pbm)
> +	if (mpam_has_feature(mpam_feat_mbw_part, rprops)) {
> +		if (mpam_has_feature(mpam_feat_mbw_part, cfg))
>  			mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM, rprops->mbw_pbm_bits);
>  		else
>  			mpam_write_partsel_reg(msc, MBW_PBM, cfg->mbw_pbm);

Reviewed-by: James Morse <james.morse@arm.com>


Thanks!

James

