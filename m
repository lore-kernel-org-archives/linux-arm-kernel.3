Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E276C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otwvSlA0QZPjX6oO0LXr1gFxi4gaBAx6UrGbXB2r0Yo=; b=uC8a35F2X+nigBKDhP417kv751
	vB8T1MUinAxSHVIk8C2qtzB5EwFH0+1Hi112AHnIWAzyzOmfpPMKV4IVCiQTIvTHsmsx4DZi4bqdO
	8wMI1ByKX+2Kl72YQprYIw2khqZlYKjqQx1khy3SFzDQo3ZukXFPmUDsj2uMk2J/0051Zp6vseOJy
	zC9Ncmhzf2UgJn2n731edv4Thvujzr1gNNrHnEo0fq9tJJuTSnc1bmqYjwZDuSMU1sEfX2NPJsUyt
	gvtgfbIAgY/I8mQecpItr/kv2vUlcR+mJUJ+RPOFQevmxuegkW/KnNOSQqXpjSvOXTuaQEwjg3MoM
	sS3B1GxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wRY-0000000G6mz-30fH;
	Fri, 11 Sep 2026 08:17:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wRV-0000000G6mZ-3xmA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:17:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E2BB16A3;
	Fri, 11 Sep 2026 01:17:00 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 856213F7B4;
	Fri, 11 Sep 2026 01:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789114624; bh=TPsGC4LYcFPbDZQDuzzjee885teUbGy2eenjNKg1Wwk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NvrLUj+Mtl4RA3Ci+dQCi4Gu3PXOmCVqm7akSjQwrC1/trQKc6gx45SUUy+CNd310
	 +qNENUqr/roCWCUblLUjNKqP4qjFFk5o9CwjIyqxXUZJek54f9iqQ9P8w0hgZ6YiNk
	 6CJsKjn5GPbcZlawTAoAOw52b3Bp0nI+y83w+6i4=
Message-ID: <1cd6fa61-df0d-4743-8f68-84cdf7f8722c@arm.com>
Date: Fri, 11 Sep 2026 09:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/40] arm_mpam: Reset when feature configuration bit
 unset
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
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
 <7500ec7f-5e65-408c-a4ed-3f7af161219b@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <7500ec7f-5e65-408c-a4ed-3f7af161219b@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_011706_275105_66511C8D 
X-CRM114-Status: GOOD (  21.48  )
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

Hi Jinjie,

On 11/09/2026 07:44, Jinjie Ruan wrote:
> 
> 
> 在 2026/3/13 22:45, Ben Horgan 写道:
>> To indicate that the configuration, of the controls used by resctrl, in a
>> RIS need resetting to driver defaults the reset flags in mpam_config are
>> set. However, these flags are only ever set temporarily at RIS scope in
>> mpam_reset_ris() and hence mpam_cpu_online() will never reset these
>> controls to default. As the hardware reset is unknown this leads to unknown
>> configuration when the control values haven't been configured away from the
>> defaults.
>>
>> Use the policy that an unset feature configuration bit means reset. In this
>> way the mpam_config in the component can encode that it should be in reset
>> state and mpam_reprogram_msc() will reset controls as needed.
>>
>> Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> This goes back to the initial feature configuration policy that James
>> used in the MPAM base driver rfc but I unfortunately
>> suggested him to change it.
>> ---
>>  drivers/resctrl/mpam_devices.c | 40 ++++++++++------------------------
>>  1 file changed, 12 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 0fd6590a9b5c..ff861291bd4e 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1364,17 +1364,15 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>>  		__mpam_intpart_sel(ris->ris_idx, partid, msc);
>>  	}
>>  
>> -	if (mpam_has_feature(mpam_feat_cpor_part, rprops) &&
>> -	    mpam_has_feature(mpam_feat_cpor_part, cfg)) {
>> -		if (cfg->reset_cpbm)
>> -			mpam_reset_msc_bitmap(msc, MPAMCFG_CPBM, rprops->cpbm_wd);
>> -		else
>> +	if (mpam_has_feature(mpam_feat_cpor_part, rprops)) {
>> +		if (mpam_has_feature(mpam_feat_cpor_part, cfg))
>>  			mpam_write_partsel_reg(msc, CPBM, cfg->cpbm);
>> +		else
>> +			mpam_reset_msc_bitmap(msc, MPAMCFG_CPBM, rprops->cpbm_wd);
>>  	}
>>  
>> -	if (mpam_has_feature(mpam_feat_mbw_part, rprops) &&
>> -	    mpam_has_feature(mpam_feat_mbw_part, cfg)) {
>> -		if (cfg->reset_mbw_pbm)
>> +	if (mpam_has_feature(mpam_feat_mbw_part, rprops)) {
>> +		if (mpam_has_feature(mpam_feat_mbw_part, cfg))
>>  			mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM, rprops->mbw_pbm_bits);
> 
> This condition is written backwards, but it looks like it has already
> been fixed later.
> 
> Otherwise, LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>


Thanks for your reviews. As you hint at this has already been merged and so it's too late to apply
any tags. Good to know that the code survives being looked at by an extra pair of eyes. :)

Ben

> 
>>  		else
>>  			mpam_write_partsel_reg(msc, MBW_PBM, cfg->mbw_pbm);
>> @@ -1384,16 +1382,14 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>>  	    mpam_has_feature(mpam_feat_mbw_min, cfg))
>>  		mpam_write_partsel_reg(msc, MBW_MIN, 0);
>>  
>> -	if (mpam_has_feature(mpam_feat_mbw_max, rprops) &&
>> -	    mpam_has_feature(mpam_feat_mbw_max, cfg)) {
>> -		if (cfg->reset_mbw_max)
>> -			mpam_write_partsel_reg(msc, MBW_MAX, MPAMCFG_MBW_MAX_MAX);
>> -		else
>> +	if (mpam_has_feature(mpam_feat_mbw_max, rprops)) {
>> +		if (mpam_has_feature(mpam_feat_mbw_max, cfg))
>>  			mpam_write_partsel_reg(msc, MBW_MAX, cfg->mbw_max);
>> +		else
>> +			mpam_write_partsel_reg(msc, MBW_MAX, MPAMCFG_MBW_MAX_MAX);
>>  	}
>>  
>> -	if (mpam_has_feature(mpam_feat_mbw_prop, rprops) &&
>> -	    mpam_has_feature(mpam_feat_mbw_prop, cfg))
>> +	if (mpam_has_feature(mpam_feat_mbw_prop, rprops))
>>  		mpam_write_partsel_reg(msc, MBW_PROP, 0);
>>  
>>  	if (mpam_has_feature(mpam_feat_cmax_cmax, rprops))
>> @@ -1491,16 +1487,6 @@ static int mpam_save_mbwu_state(void *arg)
>>  	return 0;
>>  }
>>  
>> -static void mpam_init_reset_cfg(struct mpam_config *reset_cfg)
>> -{
>> -	*reset_cfg = (struct mpam_config) {
>> -		.reset_cpbm = true,
>> -		.reset_mbw_pbm = true,
>> -		.reset_mbw_max = true,
>> -	};
>> -	bitmap_fill(reset_cfg->features, MPAM_FEATURE_LAST);
>> -}
>> -
>>  /*
>>   * Called via smp_call_on_cpu() to prevent migration, while still being
>>   * pre-emptible. Caller must hold mpam_srcu.
>> @@ -1508,14 +1494,12 @@ static void mpam_init_reset_cfg(struct mpam_config *reset_cfg)
>>  static int mpam_reset_ris(void *arg)
>>  {
>>  	u16 partid, partid_max;
>> -	struct mpam_config reset_cfg;
>> +	struct mpam_config reset_cfg = {};
>>  	struct mpam_msc_ris *ris = arg;
>>  
>>  	if (ris->in_reset_state)
>>  		return 0;
>>  
>> -	mpam_init_reset_cfg(&reset_cfg);
>> -
>>  	spin_lock(&partid_max_lock);
>>  	partid_max = mpam_partid_max;
>>  	spin_unlock(&partid_max_lock);
> 


