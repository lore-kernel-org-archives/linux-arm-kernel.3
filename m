Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155C3CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zATfjb5DrtN7vFvB+8m71gHoExTWZ4WIUE1i+eqc1SU=; b=CrpezHBMot5ehg5yDl81CQvhiZ
	fdPadWN/jrtqYAulXrKJ4yR6oE3/hKyxB5ZjiqAc0EyjMg9ALB7JtW5tiaZNcoX0ooQHJ2pVlof+M
	TjiS4sDvYXL102JeT180DcyycSExOSIxV22y3L6wuDNDDw7xprt2ET1VWtzSBMS8o89+kkakg7N1G
	PsBU46ZNGP9o1EyHLzecDb9kMHYUGjtBw+C/ZSO8qMW5p3obu/ZdTgVMmyintCiXR0KGCB7DhbpKr
	DjqWqlvnZ62wqlM7gZLR9er8CmujJXYAorpjMJdr466zufHsS/wbGWw9p2DBiyto767zutKfVe7c1
	vSmZ2M+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEN-0000000CB4u-1G0r;
	Fri, 02 Oct 2026 17:39:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEL-0000000CB4F-14CK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:39:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F9FC143D;
	Fri,  2 Oct 2026 10:39:29 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0093F3F85F;
	Fri,  2 Oct 2026 10:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962772; bh=8AOzxXFPkwZXoPCLFKcDeivji18LzJ50iTSm+cbY8ko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kjG7HIVxVIENDoXL11f0gaBtvKOuWmSfU1kJ5KeXEapofDmepwbGaBJ48wyelyrU5
	 Tm/DuKphEBpP7Vxww9OYm69SPICuNmwFu1utqna+g93kPHg2X/PxnmRpBughyB3cn8
	 sl7f9/Pc9LD14c3PGOD/J4VLg3HxhI/yZ6qctCJQ=
Message-ID: <0bedf04c-24ef-40de-909f-b41dd72b8e78@arm.com>
Date: Fri, 2 Oct 2026 18:39:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 03/13] arm_mpam: propagate MSC access errors for MBWU
 counters
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Ben Horgan <ben.horgan@arm.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
 linux-acpi@vger.kernel.org--cc, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261001153439.3295416-1-andre.przywara@arm.com>
 <20261001153439.3295416-4-andre.przywara@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20261001153439.3295416-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_103933_377126_CB7E6594 
X-CRM114-Status: GOOD (  17.48  )
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

I've picked up this series to send on to Catalin and Will ...

On 01/10/2026 16:34, Andre Przywara wrote:
> Allow the mpam_msc_read_mbwu_l() function to return an error, and
> propagate errors from the lower level up. This also changes the users
> of this function.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 3aefeab371788..583560798dd8b 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1327,10 +1338,12 @@ static void __ris_msmon_read(void *arg)
>  	struct mpam_msc *msc = m->ris->vmsc->msc;
>  	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
>  
> -	if (!mpam_mon_sel_lock(msc)) {
> +	ACQUIRE(mon_sel_lock, guard)(msc);
> +	if (ACQUIRE_ERR(mon_sel_lock, &guard)) {
>  		m->err = -EIO;
>  		return;
>  	}
> +
>  	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
>  		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
>  	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);


This conflicts with Ben's fixes [0] that turn this into __ris_msmon_read_locked().
I don't think the ACQUIRE buys us anything after that, as none of the callers need
to return early, and __ris_msmon_read_locked() can always just return.

The same thing happens in mpam_save_mbwu_state() where Ben's change means you no
longer need an early return after mpam_msc_read_mbwu_l().

Please double check I've not botched your patch when fixing up the conflict!
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/tag/?h=mpam/for-next/v7.4_v2

Thanks,

James


[0] https://lore.kernel.org/linux-arm-kernel/20260917145617.2202986-1-ben.horgan@arm.com/


> @@ -1423,7 +1438,6 @@ static void __ris_msmon_read(void *arg)
>  	default:
>  		m->err = -EINVAL;
>  	}
> -	mpam_mon_sel_unlock(msc);
>  
>  	if (nrdy)
>  		m->err = -EBUSY;
> @@ -1784,6 +1798,7 @@ static int mpam_save_mbwu_state(void *arg)
>  {
>  	int i;
>  	u64 val;
> +	int ret;
>  	struct mon_cfg *cfg;
>  	u32 cur_flt, cur_ctl, mon_sel;
>  	struct mpam_msc_ris *ris = arg;
> @@ -1794,7 +1809,8 @@ static int mpam_save_mbwu_state(void *arg)
>  		mbwu_state = &ris->mbwu_state[i];
>  		cfg = &mbwu_state->cfg;
>  
> -		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
> +		ACQUIRE(mon_sel_lock, guard)(msc);
> +		if (ACQUIRE_ERR(mon_sel_lock, &guard))
>  			return -EIO;
>  
>  		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
> @@ -1805,7 +1821,9 @@ static int mpam_save_mbwu_state(void *arg)
>  		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>  
>  		if (mpam_ris_has_mbwu_long_counter(ris)) {
> -			val = mpam_msc_read_mbwu_l(msc);
> +			ret = mpam_msc_read_mbwu_l(msc, &val);
> +			if (ret)
> +				return ret;
>  			mpam_msc_zero_mbwu_l(msc);
>  		} else {
>  			u32 val32;
> @@ -1821,7 +1839,6 @@ static int mpam_save_mbwu_state(void *arg)
>  		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
>  		mbwu_state->correction += val;
>  		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
> -		mpam_mon_sel_unlock(msc);
>  	}
>  
>  	return 0;


