Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800D7CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krYQnTx4Ki4G9f7BbnETHpO08nM8jf7MsM7nR34vJH8=; b=wIxPVD9NuLyqK/T/dLu32JHso/
	coIkiYuW4GvZxmPvWnrUIAaOfipALBERTkyFHY7gD+oZDluhJBY6HlPQvXf+dTCRLwDQJSeS8B/e5
	KdknNOEcD//ttQRrqhfrp6/YWggPeRxLP/dQc+cbrDBvuevpFOi4QsCvcO+pPc28jw2CSFt6NA3WH
	I1hVbUnaCUu0LS3oG4MEVEgtoFhdGx6fjpRypaYhpV9dP+RhmS/vWZP9UP1wkD0mI7eqKOKCZCrfZ
	IXfUKuvdtvsqda3oz3xGDzsPAXF6g8IVgNlYNr6JA4Jr1tksAy709oUXF32PqvQTVOKqsuQLFwViQ
	SvOzHbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBY0R-00000002oEI-2GbZ;
	Wed, 22 Oct 2025 12:31:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBY0O-00000002oDj-09gb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 12:31:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7DA91063;
	Wed, 22 Oct 2025 05:31:42 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0871B3F63F;
	Wed, 22 Oct 2025 05:31:45 -0700 (PDT)
Message-ID: <1a1a3522-313a-46e7-bc13-fcbbd9ccf81f@arm.com>
Date: Wed, 22 Oct 2025 13:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/29] arm_mpam: Use long MBWU counters if supported
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Gavin Shan <gshan@redhat.com>
References: <20251017185645.26604-1-james.morse@arm.com>
 <20251017185645.26604-27-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251017185645.26604-27-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_053152_488647_57C116A0 
X-CRM114-Status: GOOD (  23.35  )
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

Hi James,

On 10/17/25 19:56, James Morse wrote:
> From: Rohit Mathew <rohit.mathew@arm.com>
> 
> Now that the larger counter sizes are probed, make use of them.
> 
> Callers of mpam_msmon_read() may not know (or care!) about the different
> counter sizes. Allow them to specify mpam_feat_msmon_mbwu and have the
> driver pick the counter to use.
> 
> Only 32bit accesses to the MSC are required to be supported by the
> spec, but these registers are 64bits. The lower half may overflow
> into the higher half between two 32bit reads. To avoid this, use
> a helper that reads the top half multiple times to check for overflow.
> 
> Signed-off-by: Rohit Mathew <rohit.mathew@arm.com>
> [morse: merged multiple patches from Rohit, added explicit counter selection ]
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
> Changes since v2:
>  * Removed mpam_feat_msmon_mbwu as a top-level bit for explicit 31bit counter
>    selection.
>  * Allow callers of mpam_msmon_read() to specify mpam_feat_msmon_mbwu and have
>    the driver pick a supported counter size.
>  * Rephrased commit message.
> 
> Changes since v1:
>  * Only clear OFLOW_STATUS_L on MBWU counters.
> 
> Changes since RFC:
>  * Commit message wrangling.
>  * Refer to 31 bit counters as opposed to 32 bit (registers).
> ---
>  drivers/resctrl/mpam_devices.c | 134 ++++++++++++++++++++++++++++-----
>  1 file changed, 116 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index f4d07234ce10..c207a6d2832c 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -897,6 +897,48 @@ struct mon_read {
[...]
> +static void mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
> +{
> +	mpam_mon_sel_lock_held(msc);
> +
> +	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
> +	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
> +
> +	__mpam_write_reg(msc, MSMON_MBWU_L, 0);
> +	__mpam_write_reg(msc, MSMON_MBWU_L + 4, 0);
> +}
> +
[...]
> @@ -978,10 +1027,15 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
>  		mpam_write_monsel_reg(msc, CSU, 0);
>  		mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
>  		break;
> -	case mpam_feat_msmon_mbwu:
> +	case mpam_feat_msmon_mbwu_44counter:
> +	case mpam_feat_msmon_mbwu_63counter:
> +		mpam_msc_zero_mbwu_l(m->ris->vmsc->msc);
> +		fallthrough;
> +	case mpam_feat_msmon_mbwu_31counter:
>  		mpam_write_monsel_reg(msc, CFG_MBWU_FLT, flt_val);
>  		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
>  		mpam_write_monsel_reg(msc, MBWU, 0);

Already zeroed if it's a long counter.

> +
>  		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
>  
>  		mbwu_state = &m->ris->mbwu_state[m->ctx->mon];
[...]
> +static enum mpam_device_features mpam_msmon_choose_counter(struct mpam_class *class)
> +{
> +	struct mpam_props *cprops = &class->props;
> +
> +	if (mpam_has_feature(mpam_feat_msmon_mbwu_44counter, cprops))
> +		return mpam_feat_msmon_mbwu_44counter;

This should check the longest counter first.

> +	if (mpam_has_feature(mpam_feat_msmon_mbwu_63counter, cprops))
> +		return mpam_feat_msmon_mbwu_63counter;
> +
> +	return mpam_feat_msmon_mbwu_31counter;
> +}
> +
-- 
Thanks,

Ben


