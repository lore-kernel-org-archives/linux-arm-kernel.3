Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05EEC54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmFcFe2QT9U8qliwVXxdZOhNAzFVdMxQuD0Zpv0P1OU=; b=0LbxVATbBu8a9qV7QYsEBxH/0s
	938h5aXquU0oLEz4lKtDCrWatO9YTgPgGo9FBE2GKe8ACn2fM+Hq9MTCzxgjmkJCAcGm4Bg7I+ua6
	/eZEoyP7vxQ6Ev1m55mFCF5m5ezkF+L6Vs2mYr95R/80k7rENqX8KvO8LqLQMnFWmoDkzfzmDGME2
	sFucMobr8A5UQgth6aV+JjhHtMEVv8PaR5MNG8TXREl6VfhyxdCNFlionhkKiL6igURQlHqVQq0rN
	yZEH2s+ZOdxSdlVXku6zqKrKV75QvOwQlvOgbaHzg1oHTFd9EQBOvJBX2IXh6Vjye81eLlozjAOhV
	m2wxANOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNTJ-0000000A6jh-1QxP;
	Thu, 30 Jul 2026 09:54:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNRZ-0000000A5NQ-0V5c
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Jul 2026 09:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RmFcFe2QT9U8qliwVXxdZOhNAzFVdMxQuD0Zpv0P1OU=; b=OlUAZTuatXsDNmI/1fUgV+YSob
	zh34gBEo3ANFyvADCPo5y++IJfaAQuR2yovmyvz5YEkE+O8qbHNHcGr6OMlh1mUOh++n8RBJzuyMV
	142tb+hmsSfn1AMbX7TCecNpHK7C2WCm+6JF07HVvzHxMuJ3aXChOJZFKx+J9bwsCyq/SF5QakvbA
	l0UC15kErqBQwaP4b3tMVlfbE4mN10fvEyeAxeyLJoGLKm1bZWUkaAaq3RWffkfAu6g78MC8UdE2d
	2YyH3c1yNoj1cUfwlmq+U8tPlca/GkeWeMFLPmJpjfORM6WE79OwwCG0PP4eHizFaa475QaW5KxCT
	iZ4RLYHg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpNRH-00000006YRX-0WuO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 09:52:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1037A204C;
	Thu, 30 Jul 2026 02:52:25 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEF8B3F99C;
	Thu, 30 Jul 2026 02:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785405149; bh=xYT95HwP3Wxou2PQvp2OVBtuUoGkxFQDOtYH+TmyHjY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uDrxJYLs3DSCDzYb5Sj92HjNYVKmzlL55LET42ZXWuRbCnl+0UlETc23PLFgUSslV
	 lZRvImDO1QIixSUB5pPseoLaKxW0AIFHUcwDwCfALYTHQoNinngzNfxlKn569GHc6Z
	 +qylh1FwjDCkE+XtLaRgWL6uM7SQj2ngQdQvnUyg=
Message-ID: <fad866fe-45d1-40a5-8870-67fa702890ec@arm.com>
Date: Thu, 30 Jul 2026 10:52:25 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 05/10] arm_mpam: propagate MSC access errors for
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
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260729134124.2506269-1-andre.przywara@arm.com>
 <20260729134124.2506269-6-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260729134124.2506269-6-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_105231_625170_137F65E9 
X-CRM114-Status: GOOD (  24.50  )
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

On 7/29/26 14:41, Andre Przywara wrote:
> Allow the function for RIS accesses to return an error, and propagate
> read and write errors from the lower level up.
> This function is a bit special, since it can be called via an SMP
> helper, so the prototype must stay as void. So propagate any errors
> using the "err" field in the struct passed in as the sole argument to
> that function.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 36 +++++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 9d9f0c635527..44eafef1e7ab 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1333,6 +1333,10 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
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
> @@ -1356,7 +1360,9 @@ static void __ris_msmon_read(void *arg)
>  
>  	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
>  		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
> -	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> +	m->err = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> +	if (m->err)
> +		return;
>  
>  	switch (m->type) {
>  	case mpam_feat_msmon_mbwu_31counter:
> @@ -1376,7 +1382,9 @@ static void __ris_msmon_read(void *arg)
>  	 * Read the existing configuration to avoid re-writing the same values.
>  	 * This saves waiting for 'nrdy' on subsequent reads.
>  	 */
> -	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
> +	m->err = read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
> +	if (m->err)
> +		return;
>  
>  	if (mpam_feat_msmon_mbwu_31counter == m->type)
>  		overflow = cur_ctl & MSMON_CFG_x_CTL_OFLOW_STATUS;
> @@ -1390,18 +1398,24 @@ static void __ris_msmon_read(void *arg)
>  			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
>  
>  	if (config_mismatch || reset_on_next_read) {
> -		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
> +		m->err = write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
> +		if (m->err)
> +			return;
>  		overflow = false;
>  	} else if (overflow) {
> -		mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
> -				      cur_ctl &
> -				      ~(MSMON_CFG_x_CTL_OFLOW_STATUS |
> -					MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L));
> +		m->err = mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
> +					    cur_ctl &
> +					    ~(MSMON_CFG_x_CTL_OFLOW_STATUS |
> +					    MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L));
> +		if (m->err)
> +			return;
>  	}
>  
>  	switch (m->type) {
>  	case mpam_feat_msmon_csu:
> -		mpam_read_monsel_reg(msc, CSU, &now32);
> +		m->err = mpam_read_monsel_reg(msc, CSU, &now32);
> +		if (m->err)
> +			return;
>  		nrdy = now32 & MSMON___NRDY;
>  		now = FIELD_GET(MSMON___VALUE, now32);
>  
> @@ -1423,7 +1437,9 @@ static void __ris_msmon_read(void *arg)
>  			else
>  				now = FIELD_GET(MSMON___L_VALUE, now);
>  		} else {
> -			mpam_read_monsel_reg(msc, MBWU, &now32);
> +			m->err = mpam_read_monsel_reg(msc, MBWU, &now32);
> +			if (m->err)
> +				return;
>  			nrdy = now32 & MSMON___NRDY;
>  			now = FIELD_GET(MSMON___VALUE, now32);
>  		}
> @@ -1792,6 +1808,8 @@ static int mpam_restore_mbwu_state(void *_ris)
>  			mwbu_arg.val = &val;
>  
>  			__ris_msmon_read(&mwbu_arg);
> +			if (mwbu_arg.err)
> +				return mwbu_arg.err;

As sashiko points out [1], this is a change of behaviour as mbwu_arg.err could already be non-zero
previous to this patch. In particular, -EBUSY when NRDY is set. When this is the case we should
continue restoring the other counters rather than changing to bailing out early.

As -EBUSY is only used in the NRDY case you could change the condition to be:

if (mbwu_arg.err && mbwu_arg.err != -EBUSY)
         return mwbu_arg.err;

[1] https://sashiko.dev/#/patchset/20260729134124.2506269-1-andre.przywara%40arm.com

Thanks,

Ben

>  		}
>  	}
>  


