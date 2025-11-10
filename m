Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03143CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTVZptE9yhavDPYFhKzpNou/6CcU7o9cuxLzEmT1XSo=; b=ei9mEcbsWYQn/JAn6NSJDAwE7J
	ImlVaj5pJY4bzAfgeSE8WTvYmzQxAlDegM4Vawr/ZGq7cp5v8rV9VnO/NIOAzVUJXcuH39klQtaLF
	Ax6yeMO92qUJ0ClGKGpN+PdmASXs0uIG/PZhLJa4lv7/urXYwHqGpSAHdEU5QdiqLFwqPnwmYkI18
	zy9t16Cmk90cXYJZ5uvQQCbTyorfW5LfrLzqv+Q4A6x3D0hrp2OEuJhSAcrMXjl6Z3TtmnbY1Ahw7
	rTHzWhVzdjdr217kU+gboqqdJrmggDrV/GUa2QgoWJe0HNhdXMZw9mT+24DniPrYm3A+QZcL0Z4l9
	/o9dEq0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISIB-00000005XEH-0A3k;
	Mon, 10 Nov 2025 13:50:47 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISI7-00000005XCW-0YBp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:50:45 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tTVZptE9yhavDPYFhKzpNou/6CcU7o9cuxLzEmT1XSo=;
	b=UD0fhW2SqX/JSAcOaD/yxVnfiTA5qPzfQCSMIKBD5kQ+/8y535cdK8FU+D6oTTQR7986lK/F4
	glg5leKC1YVV7GuuX7ZnqNDQ04yxpOLe98GImTY3O2iRCtWyxGwTwQtQhT14zE5S6quiKbeS7Mk
	8kTvaLMU37O54CGhjIWb51M=
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4d4rcB1Ddgz1cyPS;
	Mon, 10 Nov 2025 21:48:58 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id DAC661A0188;
	Mon, 10 Nov 2025 21:50:36 +0800 (CST)
Received: from [10.174.178.24] (10.174.178.24) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 10 Nov 2025 21:50:34 +0800
Message-ID: <7df04942-5afa-604d-3573-ec54a2c89945@huawei.com>
Date: Mon, 10 Nov 2025 21:50:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 28/33] arm_mpam: Consider overflow in bandwidth counter
 state
Content-Language: en-US
To: Ben Horgan <ben.horgan@arm.com>, <james.morse@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <bobo.shaobowang@huawei.com>,
	<carl@os.amperecomputing.com>, <catalin.marinas@arm.com>, <dakr@kernel.org>,
	<dave.martin@arm.com>, <david@redhat.com>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gregkh@linuxfoundation.org>, <gshan@redhat.com>,
	<guohanjun@huawei.com>, <jeremy.linton@arm.com>,
	<jonathan.cameron@huawei.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lpieralisi@kernel.org>, <peternewman@google.com>, <quic_jiles@quicinc.com>,
	<rafael@kernel.org>, <robh@kernel.org>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<sudeep.holla@arm.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<xhao@linux.alibaba.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-29-ben.horgan@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <20251107123450.664001-29-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.24]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_055043_514661_75F01E10 
X-CRM114-Status: GOOD (  23.16  )
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



On 2025/11/7 20:34, Ben Horgan wrote:
> Use the overflow status bit to track overflow on each bandwidth counter
> read and add the counter size to the correction when overflow is detected.
> 
> This assumes that only a single overflow has occurred since the last read
> of the counter. Overflow interrupts, on hardware that supports them could
> be used to remove this limitation.
> 
> Cc: Zeng Heng <zengheng4@huawei.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c  | 24 ++++++++++++++++++++++--
>   drivers/resctrl/mpam_internal.h |  3 ++-
>   2 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 2d1cef824b8e..eea082dfcddc 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -986,11 +986,18 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
>   	}
>   }
>   
> +static u64 mpam_msmon_overflow_val(enum mpam_device_features type)
> +{
> +	/* TODO: scaling, and long counters */
> +	return BIT_ULL(hweight_long(MSMON___VALUE));
> +}
> +
>   static void __ris_msmon_read(void *arg)
>   {
>   	u64 now;
>   	bool nrdy = false;
>   	bool config_mismatch;
> +	bool overflow;
>   	struct mon_read *m = arg;
>   	struct mon_cfg *ctx = m->ctx;
>   	struct mpam_msc_ris *ris = m->ris;
> @@ -1012,13 +1019,20 @@ static void __ris_msmon_read(void *arg)
>   	 * This saves waiting for 'nrdy' on subsequent reads.
>   	 */
>   	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
> +	overflow = cur_ctl & MSMON_CFG_x_CTL_OFLOW_STATUS;
> +
>   	clean_msmon_ctl_val(&cur_ctl);
>   	gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
>   	config_mismatch = cur_flt != flt_val ||
>   			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
>   
> -	if (config_mismatch)
> +	if (config_mismatch) {
>   		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
> +		overflow = false;
> +	} else if (overflow) {
> +		mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
> +				      cur_ctl & ~MSMON_CFG_x_CTL_OFLOW_STATUS);
> +	}
>   
>   	switch (m->type) {
>   	case mpam_feat_msmon_csu:
> @@ -1038,7 +1052,13 @@ static void __ris_msmon_read(void *arg)
>   
>   		mbwu_state = &ris->mbwu_state[ctx->mon];
>   
> -		/* Include bandwidth consumed before the last hardware reset */
> +		if (overflow)
> +			mbwu_state->correction += mpam_msmon_overflow_val(m->type);
> +
> +		/*
> +		 * Include bandwidth consumed before the last hardware reset and
> +		 * a counter size increment for each overflow.
> +		 */
>   		now += mbwu_state->correction;
>   		break;
>   	default:
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 1f2b04b7703e..7c99d4f3dc9c 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -209,7 +209,8 @@ struct msmon_mbwu_state {
>   	struct mon_cfg	cfg;
>   
>   	/*
> -	 * The value to add to the new reading to account for power management.
> +	 * The value to add to the new reading to account for power management,
> +	 * and overflow.
>   	 */
>   	u64		correction;
>   

Reviewed-by: Zeng Heng <zengheng4@huawei.com>

