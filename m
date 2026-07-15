Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C47C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZu8Q5rmvSzT1dZOx7L4/GAUQvW2ZWYPAhfjWTb/lUo=; b=Fwe73LW0CZ0TN0RSWSCYz1qwFG
	6sn19LCqATUwvqgCfWIkIvWq7SkJ/GwUWtUOXEOYH+za2a58hpBsTShJ3wF6iXmIksRWZ387KVh2D
	prhl9eOoC3AY7Jez93q4fcYoz2cla/atn9d3BZpaWTzTc/+hFO+frib6cAbTP5wKRkhBubPqdAoTd
	4LYVlaWWx6zzyTl2viEx03vasf31691y93y328NjKzSUAz5LmIRgN5BnRPEq49JKw/+FLr3O+lm3q
	diZHCXmKAzA5KyTgaWi9j/d4RUE9qA6QCi7X+K0wvedJr+mi8jaHDvUSsuebhh1KTXR/czdeKWaMo
	0YJmwsTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzlX-0000000Exa0-2kYd;
	Wed, 15 Jul 2026 13:35:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzlU-0000000ExZB-2Wut
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:35:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29CBA1477;
	Wed, 15 Jul 2026 06:35:02 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0D923F915;
	Wed, 15 Jul 2026 06:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784122506; bh=uLHoCbNeYoAD6ga2+Gc3umZz0EJETiWvCIQnmkNiWh4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f+mgWwPSYRO7uOwEe/kBxC3xfoS1XKLO9Eb56aPYKQP7ZrTjvyHKVkGoo09YNdws9
	 +9iBFCh7bsm53Qa/fNn7nsevXquVHGzNuvLqZUJ1Wx0hLGhttl82Dd6n6bJC3CyVgI
	 CALnQwqFwKoz0510F7SZ/Ysy2NH7EfQNkw3P/qdo=
Message-ID: <8dcafd5c-5ff8-4151-a68b-6d6b9c0c8b7c@arm.com>
Date: Wed, 15 Jul 2026 14:35:02 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v3 04/16] arm_mpam: propagate MSC read errors for
 mpam_msc_read_mbwu_l()
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
References: <20260710144520.917375-1-andre.przywara@arm.com>
 <20260710144520.917375-5-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260710144520.917375-5-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_063509_851147_79F9D630 
X-CRM114-Status: GOOD (  23.53  )
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

On 7/10/26 15:45, Andre Przywara wrote:
> Allow the mpam_msc_read_mbwu_l() function to return an error, and
> propagate read errors from the lower level up.
> So far we were using a special value to indicate the "unstable read"
> condition, replace that with the actual Linux error code, since it's now
> easy to do.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 54 +++++++++++++++++++++++++---------
>  1 file changed, 40 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index b1bd047da203..3b6f9e552a9f 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1112,8 +1112,9 @@ static bool mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
>  		mpam_has_feature(mpam_feat_msmon_mbwu_44counter, &ris->props));
>  }
>  
> -static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
> +static int mpam_msc_read_mbwu_l(struct mpam_msc *msc, u64 *res)
>  {
> +	int ret;
>  	int retry = 3;
>  	u32 mbwu_l_low;
>  	u32 mbwu_l_high1, mbwu_l_high2;
> @@ -1123,20 +1124,30 @@ static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
>  	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
>  	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>  
> -	__mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
> +	ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
> +	if (ret)
> +		return ret;
> +
>  	do {
>  		mbwu_l_high1 = mbwu_l_high2;
> -		__mpam_read_reg(msc, MSMON_MBWU_L, &mbwu_l_low);
> -		__mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
> +		ret = __mpam_read_reg(msc, MSMON_MBWU_L, &mbwu_l_low);
> +		if (ret)
> +			return ret;
> +		ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
> +		if (ret)
> +			return ret;
>  
>  		retry--;
>  	} while (mbwu_l_high1 != mbwu_l_high2 && retry > 0);
>  
> -	if (mbwu_l_high1 == mbwu_l_high2)
> -		return ((u64)mbwu_l_high1 << 32) | mbwu_l_low;
> +	if (mbwu_l_high1 == mbwu_l_high2) {
> +		*res = ((u64)mbwu_l_high1 << 32) | mbwu_l_low;
> +	} else {
> +		pr_warn("Failed to read a stable value\n");
> +		ret = -EBUSY;
> +	}
>  
> -	pr_warn("Failed to read a stable value\n");
> -	return MSMON___L_NRDY;
> +	return ret;
>  }
>  
>  static void mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
> @@ -1283,6 +1294,7 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
>  static void __ris_msmon_read(void *arg)
>  {
>  	u64 now;
> +	int ret;
>  	u32 now32;
>  	bool nrdy = false;
>  	bool config_mismatch;
> @@ -1358,8 +1370,9 @@ static void __ris_msmon_read(void *arg)
>  	case mpam_feat_msmon_mbwu_44counter:
>  	case mpam_feat_msmon_mbwu_63counter:
>  		if (m->type != mpam_feat_msmon_mbwu_31counter) {
> -			now = mpam_msc_read_mbwu_l(msc);
> -			nrdy = now & MSMON___L_NRDY;

You've removed the software setting of MSMON__L_NRDY but the h/w may still set it.
(The spec is somewhat confusing on this point but we shouldn't change our behaviour in this series
anyway.)

Thanks,

Ben

> +			ret = mpam_msc_read_mbwu_l(msc, &now);
> +			if (ret)
> +				goto out_unlock;
>  
>  			if (m->type == mpam_feat_msmon_mbwu_63counter)
>  				now = FIELD_GET(MSMON___LWD_VALUE, now);
> @@ -1397,10 +1410,15 @@ static void __ris_msmon_read(void *arg)
>  	if (nrdy)
>  		m->err = -EBUSY;
>  
> -	if (m->err)
> -		return;
> +	if (!m->err)
> +		*m->val += now;
> +
> +	return;
> +
> +out_unlock:
> +	mpam_mon_sel_unlock(msc);
>  
> -	*m->val += now;
> +	m->err = ret;
>  }
>  
>  static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
> @@ -1747,6 +1765,7 @@ static int mpam_save_mbwu_state(void *arg)
>  {
>  	int i;
>  	u64 val;
> +	int ret = 0;
>  	struct mon_cfg *cfg;
>  	u32 cur_flt, cur_ctl, mon_sel;
>  	struct mpam_msc_ris *ris = arg;
> @@ -1768,7 +1787,9 @@ static int mpam_save_mbwu_state(void *arg)
>  		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>  
>  		if (mpam_ris_has_mbwu_long_counter(ris)) {
> -			val = mpam_msc_read_mbwu_l(msc);
> +			ret = mpam_msc_read_mbwu_l(msc, &val);
> +			if (ret)
> +				goto out_unlock;
>  			mpam_msc_zero_mbwu_l(msc);
>  		} else {
>  			u32 val32;
> @@ -1788,6 +1809,11 @@ static int mpam_save_mbwu_state(void *arg)
>  	}
>  
>  	return 0;
> +
> +out_unlock:
> +	mpam_mon_sel_unlock(msc);
> +
> +	return ret;
>  }
>  
>  /*


