Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91321CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEeIgPWWcPxhEQfZM6jSCu5IBThi/HfESHnYLGFQvAI=; b=DsITI5bWYqSIC3+oxagdqNfrNb
	gVtNS71Avbo49TbHE0vnYBeXg/Dim0DkySiUOcXIn4huk69KfHKk9EnLnOxNedgVIbKrkhb4wYYmm
	M7g9J/KoMabBRyxUGhFp5AtuH5p8JiX93oQ9mLiMtkRMxvLX91qTzW54xpAmeFaIjSnNY5zuyr6y1
	wMO17qFA1b2BadJJEcl4MzQ5CRY66atWJsa6Kkkw4cgnqer6OCnFDGw5IMKsXjGxi5WjkZJYIULzB
	Q4lb3/g6nTc8bXCtQh6V6DpuGCTnzzwDhmBTjSuiCMAgSHH2I1jTwHz1vqSNiXbpJD+WswsxXaPfi
	1zowwWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEbC-00000004TYX-2YW6;
	Sun, 09 Nov 2025 23:13:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEb9-00000004TY9-1kfr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762730006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEeIgPWWcPxhEQfZM6jSCu5IBThi/HfESHnYLGFQvAI=;
	b=P/yvUJ3yClCDkJHa8sPRJf9gHbXtbuw8l27JTfu526fveg24dSDOajb4tzDocIsmIfGV7O
	XnYLmBslRFyJIlePKjfhk/O6KURksyyqUlReJsR1WtYgvOZbkcWF6O8WFdDTOrSSJJNlrv
	0TpO+90KphLaQriGpw2pFHPpHefo62c=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-DlUJj3kEOLia4xTYk2y-4g-1; Sun, 09 Nov 2025 18:13:22 -0500
X-MC-Unique: DlUJj3kEOLia4xTYk2y-4g-1
X-Mimecast-MFC-AGG-ID: DlUJj3kEOLia4xTYk2y-4g_1762730001
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3439fe6229aso269286a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 15:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762730001; x=1763334801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEeIgPWWcPxhEQfZM6jSCu5IBThi/HfESHnYLGFQvAI=;
        b=bGva+NFROI+4OBEn0vJH1WOR6+H4pqY2P1N2qBXjlEo86KZaFcYtcXA9oZnNed7U7M
         +e5lN5WI2Szo6Zeo9GLSDkMvb98jd5Vf3qjSu7s4CQe533TVKIWM8Wt6So0WT0U7NaqB
         +AnDtlLmM+zDZ48ecybd2F31u8h0S3jKqESOxRkxeClXrmkvSJZusx/cmxDRNYQE6k1H
         IV29NU703MB/cAORXIL5f3pUtkELAKOrU34Vj9kAU7TDnhmNIoK79PutsVN//FpDSIxq
         WyIGiYoxGxJFVsaELzP8EdSFK3xenIAWd6gfFs8emav99/Y1mxuqeBSodeyz9yDaA0R1
         /e9g==
X-Forwarded-Encrypted: i=1; AJvYcCWEjrYjtUSrJaMwpg7g3uGh3gP7rePEUaM0U02lTPrs9TfMG/fRlc1JkW75a+zEcgSQ7KBYzIiD4WXX4Ttb5wc1@lists.infradead.org
X-Gm-Message-State: AOJu0YyOtCjCp7PlMe1qTSxYWYV9GlVddQ5n15Vt2mgSFOScm6hyYI4+
	LzWfBp5KeXLMYhInNnraRgYs2FqgEHK2TVNhd6xi4fwgkYB99WKOCgSo24S9zHcCjES4zLU4Q5w
	JSG0l7Fg7A/m1M2QG3X1DMpdL+wWtH6QU7oBDu987yF4YeWPXeF1HXJHEvTjjXk96fOVhe3g1ou
	zO
X-Gm-Gg: ASbGncsTroUFUlFd8BK/zussTmaJXP/OAT/gtZZ6uP7vfqsrdmGQZxmQ7GfiqQOUWEH
	2hnHjAmdmtyjrxdOSsKX4Jqe4LdRXwvOPQSvq4fYlGS1PbAUX5veBIUFpMKyc+C/8XTD4c8DYs6
	WhgwmhWay9etyLEEctk47I5diQmLKCw2z4IaeD9vMffEtQkJ8wGyfugBpzpxPcLKpkyXhIxdwEe
	mLjlZ7Nc4jd6VF4NeawU4VsCDnI6DtEnkuQgn33EQ+m7ousogO7jKKiIrDQvcGNNrvgSNIn/1Bz
	ozuKe6WIEsQUQsBIAP0jTUy0ctipkLgR2tNpCllLAezEMd8FzGeYHT1bXNj2KBvb9MRzkwqYjaI
	bghMgcDFJSRP6eMN63jt58GbA5GlyVxDvDLWkx7U=
X-Received: by 2002:a17:90b:2551:b0:340:c094:fbff with SMTP id 98e67ed59e1d1-34353674a16mr10207155a91.10.1762730001290;
        Sun, 09 Nov 2025 15:13:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt8iNrPieEZUrHG1EFNiaLkUSXMP7VX/YSKIvQnKZqDjoS5F1ysKVWw5vdZEU+bbAqEe/mjA==
X-Received: by 2002:a17:90b:2551:b0:340:c094:fbff with SMTP id 98e67ed59e1d1-34353674a16mr10207135a91.10.1762730000866;
        Sun, 09 Nov 2025 15:13:20 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c332f1csm8678045a91.11.2025.11.09.15.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 15:13:20 -0800 (PST)
Message-ID: <61680de1-6732-48a6-a871-9cc9f17f6759@redhat.com>
Date: Mon, 10 Nov 2025 09:13:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/33] arm_mpam: Add mpam_msmon_read() to read monitor
 value
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-27-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-27-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9UC90KoqsKBg668Yo3HIc1sP1fxtYghQBgkIljh8YWA_1762730001
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_151327_729795_F43999D4 
X-CRM114-Status: GOOD (  33.00  )
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

On 11/7/25 10:34 PM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Reading a monitor involves configuring what you want to monitor, and
> reading the value. Components made up of multiple MSC may need values
> from each MSC. MSCs may take time to configure, returning 'not ready'.
> The maximum 'not ready' time should have been provided by firmware.
> 
> Add mpam_msmon_read() to hide all this. If (one of) the MSC returns
> not ready, then wait the full timeout value before trying again.
> 
> CC: Shanker Donthineni <sdonthineni@nvidia.com>
> Cc: Shaopeng Tan (Fujitsu) <tan.shaopeng@fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> Add tag - thanks
> Bring config_mismatch into this commit (Jonathan)
> whitespace
> ---
>   drivers/resctrl/mpam_devices.c  | 237 ++++++++++++++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h |  19 +++
>   2 files changed, 256 insertions(+)
> 

With below minor comments addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index f51ffb1400db..86abbac5e1ad 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -886,6 +886,243 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>   	return 0;
>   }
>   
> +struct mon_read {
> +	struct mpam_msc_ris		*ris;
> +	struct mon_cfg			*ctx;
> +	enum mpam_device_features	type;
> +	u64				*val;
> +	int				err;
> +};
> +
> +static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
> +				   u32 *flt_val)
> +{
> +	struct mon_cfg *ctx = m->ctx;
> +
> +	/*
> +	 * For CSU counters its implementation-defined what happens when not
> +	 * filtering by partid.
> +	 */
> +	*ctl_val = MSMON_CFG_x_CTL_MATCH_PARTID;
> +
> +	*flt_val = FIELD_PREP(MSMON_CFG_x_FLT_PARTID, ctx->partid);
> +
> +	if (m->ctx->match_pmg) {
> +		*ctl_val |= MSMON_CFG_x_CTL_MATCH_PMG;
> +		*flt_val |= FIELD_PREP(MSMON_CFG_x_FLT_PMG, ctx->pmg);
> +	}
> +
> +	switch (m->type) {
> +	case mpam_feat_msmon_csu:
> +		*ctl_val |= MSMON_CFG_CSU_CTL_TYPE_CSU;
> +
> +		if (mpam_has_feature(mpam_feat_msmon_csu_xcl, &m->ris->props))
> +			*flt_val |= FIELD_PREP(MSMON_CFG_CSU_FLT_XCL,
> +					       ctx->csu_exclude_clean);

{} missed here.

> +
> +		break;
> +	case mpam_feat_msmon_mbwu:
> +		*ctl_val |= MSMON_CFG_MBWU_CTL_TYPE_MBWU;
> +
> +		if (mpam_has_feature(mpam_feat_msmon_mbwu_rwbw, &m->ris->props))
> +			*flt_val |= FIELD_PREP(MSMON_CFG_MBWU_FLT_RWBW, ctx->opts);
> +
> +		break;
> +	default:
> +		return;

s/return/break

We may add a error message here:

		pr_warn("Unsupported feature %d\n", m->type);
		

> +	}
> +}
> +
> +static void read_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
> +				    u32 *flt_val)
> +{
> +	struct mpam_msc *msc = m->ris->vmsc->msc;
> +
> +	switch (m->type) {
> +	case mpam_feat_msmon_csu:
> +		*ctl_val = mpam_read_monsel_reg(msc, CFG_CSU_CTL);
> +		*flt_val = mpam_read_monsel_reg(msc, CFG_CSU_FLT);
> +		return;
> +	case mpam_feat_msmon_mbwu:
> +		*ctl_val = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
> +		*flt_val = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
> +		return;
> +	default:
> +		return;
> +	}
> +}

s/return/break for all cases, and maybe a warning message for the
default case.

> +
> +/* Remove values set by the hardware to prevent apparent mismatches. */
> +static void clean_msmon_ctl_val(u32 *cur_ctl)
> +{
> +	*cur_ctl &= ~MSMON_CFG_x_CTL_OFLOW_STATUS;
> +}
> +

May be worthy be to a inline function.

> +static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
> +				     u32 flt_val)
> +{
> +	struct mpam_msc *msc = m->ris->vmsc->msc;
> +
> +	/*
> +	 * Write the ctl_val with the enable bit cleared, reset the counter,
> +	 * then enable counter.
> +	 */
> +	switch (m->type) {
> +	case mpam_feat_msmon_csu:
> +		mpam_write_monsel_reg(msc, CFG_CSU_FLT, flt_val);
> +		mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
> +		mpam_write_monsel_reg(msc, CSU, 0);
> +		mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
> +		break;
> +	case mpam_feat_msmon_mbwu:
> +		mpam_write_monsel_reg(msc, CFG_MBWU_FLT, flt_val);
> +		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
> +		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
> +		/* Counting monitors require NRDY to be reset by software */
> +		mpam_write_monsel_reg(msc, MBWU, 0);
> +		break;
> +	default:
> +		return;

s/return/break, and maybe a warning message for the default case.

> +	}
> +}
> +
> +static void __ris_msmon_read(void *arg)
> +{
> +	u64 now;
> +	bool nrdy = false;
> +	bool config_mismatch;
> +	struct mon_read *m = arg;
> +	struct mon_cfg *ctx = m->ctx;
> +	struct mpam_msc_ris *ris = m->ris;
> +	struct mpam_props *rprops = &ris->props;
> +	struct mpam_msc *msc = m->ris->vmsc->msc;
> +	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
> +
> +	if (!mpam_mon_sel_lock(msc)) {
> +		m->err = -EIO;
> +		return;
> +	}
> +	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
> +		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
> +	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> +
> +	/*
> +	 * Read the existing configuration to avoid re-writing the same values.
> +	 * This saves waiting for 'nrdy' on subsequent reads.
> +	 */
> +	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
> +	clean_msmon_ctl_val(&cur_ctl);
> +	gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
> +	config_mismatch = cur_flt != flt_val ||
> +			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
> +
> +	if (config_mismatch)
> +		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
> +
> +	switch (m->type) {
> +	case mpam_feat_msmon_csu:
> +		now = mpam_read_monsel_reg(msc, CSU);
> +		if (mpam_has_feature(mpam_feat_msmon_csu_hw_nrdy, rprops))
> +			nrdy = now & MSMON___NRDY;
> +		break;
> +	case mpam_feat_msmon_mbwu:
> +		now = mpam_read_monsel_reg(msc, MBWU);
> +		if (mpam_has_feature(mpam_feat_msmon_mbwu_hw_nrdy, rprops))
> +			nrdy = now & MSMON___NRDY;
> +		break;
> +	default:
> +		m->err = -EINVAL;
> +		break;

This 'break' can be droped.

> +	}
> +	mpam_mon_sel_unlock(msc);
> +
> +	if (nrdy) {
> +		m->err = -EBUSY;
> +		return;
> +	}
> +
> +	now = FIELD_GET(MSMON___VALUE, now);
> +	*m->val += now;
> +}
> +
> +static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
> +{
> +	int err, any_err = 0;
> +	struct mpam_vmsc *vmsc;
> +
> +	guard(srcu)(&mpam_srcu);
> +	list_for_each_entry_srcu(vmsc, &comp->vmsc, comp_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		struct mpam_msc *msc = vmsc->msc;
> +		struct mpam_msc_ris *ris;
> +
> +		list_for_each_entry_srcu(ris, &vmsc->ris, vmsc_list,
> +					 srcu_read_lock_held(&mpam_srcu)) {
> +			arg->ris = ris;
> +
> +			err = smp_call_function_any(&msc->accessibility,
> +						    __ris_msmon_read, arg,
> +						    true);
> +			if (!err && arg->err)
> +				err = arg->err;
> +
> +			/*
> +			 * Save one error to be returned to the caller, but
> +			 * keep reading counters so that get reprogrammed. On
> +			 * platforms with NRDY this lets us wait once.
> +			 */
> +			if (err)
> +				any_err = err;
> +		}
> +	}
> +
> +	return any_err;
> +}
> +
> +int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
> +		    enum mpam_device_features type, u64 *val)
> +{
> +	int err;
> +	struct mon_read arg;
> +	u64 wait_jiffies = 0;
> +	struct mpam_props *cprops = &comp->class->props;
> +
> +	might_sleep();
> +
> +	if (!mpam_is_enabled())
> +		return -EIO;
> +
> +	if (!mpam_has_feature(type, cprops))
> +		return -EOPNOTSUPP;
> +
> +	arg = (struct mon_read) {
> +		.ctx = ctx,
> +		.type = type,
> +		.val = val,
> +	};
> +	*val = 0;
> +
> +	err = _msmon_read(comp, &arg);
> +	if (err == -EBUSY && comp->class->nrdy_usec)
> +		wait_jiffies = usecs_to_jiffies(comp->class->nrdy_usec);
> +
> +	while (wait_jiffies)
> +		wait_jiffies = schedule_timeout_uninterruptible(wait_jiffies);
> +
> +	if (err == -EBUSY) {
> +		arg = (struct mon_read) {
> +			.ctx = ctx,
> +			.type = type,
> +			.val = val,
> +		};
> +		*val = 0;
> +
> +		err = _msmon_read(comp, &arg);
> +	}
> +
> +	return err;
> +}
> +
>   static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
>   {
>   	u32 num_words, msb;
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index e59c0f4d9ada..d8f8e29987e0 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -184,6 +184,22 @@ struct mpam_props {
>   #define mpam_set_feature(_feat, x)	set_bit(_feat, (x)->features)
>   #define mpam_clear_feature(_feat, x)	clear_bit(_feat, (x)->features)
>   
> +/* The values for MSMON_CFG_MBWU_FLT.RWBW */
> +enum mon_filter_options {
> +	COUNT_BOTH	= 0,
> +	COUNT_WRITE	= 1,
> +	COUNT_READ	= 2,
> +};
> +
> +struct mon_cfg {
> +	u16			mon;
> +	u8			pmg;
> +	bool			match_pmg;
> +	bool			csu_exclude_clean;
> +	u32			partid;
> +	enum mon_filter_options opts;
> +};
> +
>   struct mpam_class {
>   	/* mpam_components in this class */
>   	struct list_head	components;
> @@ -327,6 +343,9 @@ void mpam_disable(struct work_struct *work);
>   int mpam_apply_config(struct mpam_component *comp, u16 partid,
>   		      struct mpam_config *cfg);
>   
> +int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
> +		    enum mpam_device_features, u64 *val);
> +
>   int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
>   				   cpumask_t *affinity);
>   
Thanks,
Gavin


