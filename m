Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E4CC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2El0M6am4JsL+bEkXw1yoY8gU7i68pwJgBLwsg6xg4=; b=zqQK1g6+cLae1HHRKXmGnpRiSN
	bEqSE1ES19DRq+vEFTz/ZPXEfFTkbvdAUXYMVh/MI4A9Zd0xdmsEtcZIi2Vs0766hm8lrnkELN1En
	9fjHjOk8xt36HpSQyJi31ZlhA+Zwvh64q6t9ZHH1frC5ewfkVykWsDVO6qy6/bd+iMYRCcLUBScfD
	DCqxIwSCgdkpZZWUXCvzb3hUkljnzbGVyBvCvPEhyQGgt6tPBXrDC+C8JFyxqzVRLPEOxF3XUSVWG
	SypXidQ6V2KurlVtLJkMyPAF7fax7O6dinQIMfG0tVRZOkn6DvP+L/O0BH6vsdGqmtFE0Svg0/nw5
	Fhbxpcew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZlc-00000006QlK-4AwF;
	Fri, 03 Jul 2026 09:01:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZla-00000006QkS-1qne
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 09:00:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84C9B1684;
	Fri,  3 Jul 2026 02:00:52 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.73.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58C973F905;
	Fri,  3 Jul 2026 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783069256; bh=FaTU6ZiyPyiPxJG4iwJWWSF1yEgoyNUyWDD0Eltw0Nc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lN7tnWTipISpo9m4CaYXRl0gVWPXXDKsf7gAD4vvvnJ/Z4/jkg6moMIhL/WWyqExu
	 2p0O7hjGjA1NK3XdyTd7HNkneZ+hFShU5sf2L4PtUuBSxpMvEhQkIsRe2eKcPosD3T
	 O+0OMCcSvHl2wEQqYAMeWyW7RCewAh8P1/gyzpJw=
Message-ID: <fa9440a9-cfbe-4eef-a255-a4aed196640e@arm.com>
Date: Wed, 1 Jul 2026 21:19:28 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v2 07/15] arm_mpam: propagate MSC read errors for state
 saving functions
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260702162229.4008659-1-andre.przywara@arm.com>
 <20260702162229.4008659-8-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260702162229.4008659-8-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_020058_572566_E5D5A2FF 
X-CRM114-Status: GOOD (  16.53  )
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

Hi Andre,

On 7/2/26 17:22, Andre Przywara wrote:
> Allow the mpam_save_mbwu_state() function to return an error, and
> propagate read errors from the lower level up.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 47 +++++++++++++++++++++-------------
>  1 file changed, 29 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index d18c7be86aaa..c50ca0e4f426 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1773,6 +1773,7 @@ static int mpam_save_mbwu_state(void *arg)
>  {
>  	int i;
>  	u64 val;
> +	int ret;
>  	struct mon_cfg *cfg;
>  	u32 cur_flt, cur_ctl, mon_sel;
>  	struct mpam_msc_ris *ris = arg;
> @@ -1789,31 +1790,41 @@ static int mpam_save_mbwu_state(void *arg)
>  		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
>  			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
>  		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> -		mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
> -		mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
> -		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
> +		ret = mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
> +		if (!ret)
> +			ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
> +		if (!ret)
> +			mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>  
> -		if (mpam_ris_has_mbwu_long_counter(ris)) {
> -			val = mpam_msc_read_mbwu_l(msc);
> -			mpam_msc_zero_mbwu_l(msc);
> -		} else {
> -			u32 val32;
> +		if (!ret) {
> +			if (mpam_ris_has_mbwu_long_counter(ris)) {
> +				val = mpam_msc_read_mbwu_l(msc);
> +				mpam_msc_zero_mbwu_l(msc);
> +			} else {
> +				u32 val32;
>  
> -			mpam_read_monsel_reg(msc, MBWU, &val32);
> -			val = val32;
> -			mpam_write_monsel_reg(msc, MBWU, 0);
> +				ret = mpam_read_monsel_reg(msc, MBWU, &val32);
> +				if (!ret) {
> +					val = val32;
> +					mpam_write_monsel_reg(msc, MBWU, 0);
> +				}
> +			}
>  		}
>  
> -		cfg->mon = i;
> -		cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
> -		cfg->match_pmg = FIELD_GET(MSMON_CFG_x_CTL_MATCH_PMG, cur_ctl);
> -		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
> -		mbwu_state->correction += val;
> -		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
> +		if (!ret && val != MSMON___L_NRDY) {
> +			cfg->mon = i;
> +			cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
> +			cfg->match_pmg = FIELD_GET(MSMON_CFG_x_CTL_MATCH_PMG, cur_ctl);
> +			cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
> +			mbwu_state->correction += val;
> +			mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
> +		}
>  		mpam_mon_sel_unlock(msc);
> +		if (ret)
> +			break;

There is a lot of if(!ret) in this loop. Does it not end up cleaner to
add an out_unlock label after the loop and jump to that in the failure
cases?

Thanks,

Ben

>  	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /*


