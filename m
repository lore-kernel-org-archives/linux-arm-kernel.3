Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E457C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpVK7jHSU6DZTLrF288lYqUeXcyrWXMppgRFJTLSRmE=; b=cWgDJ+zTqgZ7DoQ8QvpOMnHAuy
	oyZM9W8WVaXlpV71XL3tTDdtLcuO9GCH2MAfdxGRosyhPwViV2jAB1WeGecIayWRPHNu5EY+z8TxP
	LvBvHkKfHo6xIXZjeHGWdgQuYKE8hxXg4nN87+d4o2HQ10EEt9kVo7mS14ow8f2/q9s3n4HNVG2Lz
	ekO563TNZMBRshpwfQQfydISMp2aZrtDdHmjQT2yjRG3hGHafZxIthVi0BHMgkOdNcwH6G8CsTm+8
	a659554ufgvj+EzIBtVO82fSqOr8IWbB6TPgk7rIdCIXsz3TpyPM4YszgOne9js9HgmNELwds7LtX
	60AAawnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZgl-00000006QH6-3WY1;
	Fri, 03 Jul 2026 08:56:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZgj-00000006QGT-2Go9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:55:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C72251F60;
	Fri,  3 Jul 2026 01:55:51 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.73.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF5D23F905;
	Fri,  3 Jul 2026 01:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783068956; bh=+KB54fHhiLJ7QJHqj8KD4+z0cUvnDc9dzs+QfuUqKrU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UPDgItcVp7b5gJHl98aXaC78cmuWm17hyGjnqb1XIfXOjEEtOk493dvXvCa8NvSKZ
	 ugPsi9QDZ8z/fuWuTv9vkJ1ddjd89GR55lfYDPKRAcQBm4TZdE8f8LEO0Qiw3P20sR
	 a7Bm+t5A/z1KmjnpJ26F3w/ZYDGrhZyqFFR5ndrg=
Message-ID: <332b1348-285f-4b4a-9d3d-97f040739703@arm.com>
Date: Wed, 1 Jul 2026 21:14:27 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v2 06/15] arm_mpam: propagate MSC read errors for
 __ris_msmon_read()
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
 <20260702162229.4008659-7-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260702162229.4008659-7-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_015557_667168_7A781C6A 
X-CRM114-Status: GOOD (  22.91  )
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
> Allow the function for RIS accesses to return an error, and propagate
> read errors from the lower level up.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 35 +++++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index b259fe20a614..d18c7be86aaa 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1285,9 +1285,14 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
>  	return overflow_val;
>  }
>  
> +/*
> + * This function might be called via smp_call_function_any(), so propagate
> + * errors inside the arg struct.
> + */
>  static void __ris_msmon_read(void *arg)
>  {
>  	u64 now;
> +	int ret;
>  	u32 now32;
>  	bool nrdy = false;
>  	bool config_mismatch;
> @@ -1326,7 +1331,9 @@ static void __ris_msmon_read(void *arg)
>  	 * Read the existing configuration to avoid re-writing the same values.
>  	 * This saves waiting for 'nrdy' on subsequent reads.
>  	 */
> -	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
> +	ret = read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
> +	if (ret)
> +		goto out_unlock;
>  
>  	if (mpam_feat_msmon_mbwu_31counter == m->type)
>  		overflow = cur_ctl & MSMON_CFG_x_CTL_OFLOW_STATUS;
> @@ -1351,7 +1358,9 @@ static void __ris_msmon_read(void *arg)
>  
>  	switch (m->type) {
>  	case mpam_feat_msmon_csu:
> -		mpam_read_monsel_reg(msc, CSU, &now32);
> +		ret = mpam_read_monsel_reg(msc, CSU, &now32);
> +		if (ret)
> +			goto out_unlock;
>  		nrdy = now32 & MSMON___NRDY;
>  		now = FIELD_GET(MSMON___VALUE, now32);
>  
> @@ -1371,7 +1380,9 @@ static void __ris_msmon_read(void *arg)
>  			else
>  				now = FIELD_GET(MSMON___L_VALUE, now);
>  		} else {
> -			mpam_read_monsel_reg(msc, MBWU, &now32);
> +			ret = mpam_read_monsel_reg(msc, MBWU, &now32);
> +			if (ret)
> +				goto out_unlock;
>  			nrdy = now32 & MSMON___NRDY;
>  			now = FIELD_GET(MSMON___VALUE, now32);
>  		}
> @@ -1402,10 +1413,15 @@ static void __ris_msmon_read(void *arg)
>  	if (nrdy)
>  		m->err = -EBUSY;
>  
> -	if (m->err)
> -		return;
> +	if (!m->err)
> +		*m->val += now;

Why does this change? Can't you keep this the 'if' statement as before
and more the 'return' after the '*m->val += now;'?

Thanks,

Ben

> +
> +	return;
>  
> -	*m->val += now;
> +out_unlock:
> +	mpam_mon_sel_unlock(msc);
> +
> +	m->err = ret;
>  }
>  
>  static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
> @@ -1729,6 +1745,7 @@ static int mpam_restore_mbwu_state(void *_ris)
>  {
>  	int i;
>  	u64 val;
> +	int ret = 0;
>  	struct mon_read mwbu_arg;
>  	struct mpam_msc_ris *ris = _ris;
>  	struct mpam_class *class = ris->vmsc->comp->class;
> @@ -1741,10 +1758,14 @@ static int mpam_restore_mbwu_state(void *_ris)
>  			mwbu_arg.val = &val;
>  
>  			__ris_msmon_read(&mwbu_arg);
> +			if (mwbu_arg.err) {
> +				ret = mwbu_arg.err;
> +				break;
> +			}
>  		}
>  	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /* Call with MSC cfg_lock held */


