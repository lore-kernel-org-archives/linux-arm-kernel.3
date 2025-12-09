Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59205D3B981
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 17:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quSmkvtaWV2nzYeSixo2jy1+33/HPY7uTd25Su0RX/c=; b=Kp8qDk4h8VKqUpPVP1HqSDEiZy
	VNWwhLrbftWsG52Q3zhNTEZSCa1NNfbNrrLpzTTcoblu0OFcqiU0dLLozaNmlUWwqG0dK7r7loXre
	49Nuj9RmsHbvw3XBZyEzPpPnypOeGKsWHsYlsD+tp4UjUOxJw9I8YGQ+oQABueNZTQMmXeIWTlTh+
	v/8UZOrXM6YbqB6hk5hMYYCL/hdaXGW9IJmCsfntlnFHnT4z82stFS7HFMPl5vnLZW1i5CWx6u+bm
	WIoLIB9aQjt4PPjoxxlno/pIekbmRFB3IcXF5v3qzZl/kNVYTa3pOxfOy2v9PBM2ZVwJGvRHHUVmx
	Xdpt0IHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT1Ao-0000000EZgi-4BDy;
	Tue, 09 Dec 2025 17:06:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT1Am-0000000EZgJ-16YT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 17:06:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3466C175D;
	Tue,  9 Dec 2025 09:06:39 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FBB93F762;
	Tue,  9 Dec 2025 09:06:42 -0800 (PST)
Message-ID: <1562cbdd-f50c-4890-8b41-2987490ea384@arm.com>
Date: Tue, 9 Dec 2025 17:06:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 37/38] arm_mpam: Add workaround for T241-MPAM-6
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-38-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251205215901.17772-38-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_090648_394149_10312F0E 
X-CRM114-Status: GOOD (  25.59  )
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

Hi James, Shanker,

On 12/5/25 21:59, James Morse wrote:
> From: Shanker Donthineni <sdonthineni@nvidia.com>
> 
> The registers MSMON_MBWU_L and MSMON_MBWU return the number of
> requests rather than the number of bytes transferred.
> 
> Bandwidth resource monitoring is performed at the last level cache,
> where each request arrive in 64Byte granularity. The current
> implementation returns the number of transactions received at the
> last level cache but does not provide the value in bytes. Scaling
> by 64 gives an accurate byte count to match the MPAM specification
> for the MSMON_MBWU and MSMON_MBWU_L registers. This patch fixes
> the issue by reporting the actual number of bytes instead of the
> number of transactions from __ris_msmon_read().
> 
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  drivers/resctrl/mpam_devices.c              | 24 +++++++++++++++++++--
>  drivers/resctrl/mpam_internal.h             |  1 +
>  3 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index b18bc704d4a1..e810b2a8f40e 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -250,6 +250,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | T241 MPAM       | T241-MPAM-4     | N/A                         |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| NVIDIA         | T241 MPAM       | T241-MPAM-6     | N/A                         |
> ++----------------+-----------------+-----------------+-----------------------------+
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Freescale/NXP  | LS2080A/LS1043A | A-008585        | FSL_ERRATUM_A008585         |
>  +----------------+-----------------+-----------------+-----------------------------+
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 5ba0aa703807..c17a6fdea982 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -684,6 +684,12 @@ static const struct mpam_quirk mpam_quirks[] = {
>  	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
>  	.workaround = T241_FORCE_MBW_MIN_TO_ONE,
>  	},
> +	{
> +	/* NVIDIA t241 erratum T241-MPAM-6 */
> +	.iidr       = MPAM_IIDR_NVIDIA_T421,
> +	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
> +	.workaround = T241_MBW_COUNTER_SCALE_64,
> +	},
>  	{ NULL }, /* Sentinel */
>  };
>  
> @@ -1140,7 +1146,7 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
>  	}
>  }
>  
> -static u64 mpam_msmon_overflow_val(enum mpam_device_features type)
> +static u64 __mpam_msmon_overflow_val(enum mpam_device_features type)
>  {
>  	/* TODO: implement scaling counters */
>  	switch (type) {
> @@ -1155,6 +1161,17 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type)
>  	}
>  }
>  
> +static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
> +				   struct mpam_msc *msc)
> +{
> +	u64 overflow_val = __mpam_msmon_overflow_val(type);
> +
> +	if (mpam_has_quirk(T241_MBW_COUNTER_SCALE_64, msc))
> +		overflow_val *= 64;
> +
> +	return overflow_val;

overflow_val wraps around for 63 bit counters. Do those need to be
considered for this errata?

> +}
> +
>  static void __ris_msmon_read(void *arg)
>  {
>  	u64 now;
> @@ -1245,13 +1262,16 @@ static void __ris_msmon_read(void *arg)
>  			now = FIELD_GET(MSMON___VALUE, now);
>  		}
>  
> +		if (mpam_has_quirk(T241_MBW_COUNTER_SCALE_64, msc))
> +			now *= 64;
> +
>  		if (nrdy)
>  			break;
>  
>  		mbwu_state = &ris->mbwu_state[ctx->mon];
>  
>  		if (overflow)
> -			mbwu_state->correction += mpam_msmon_overflow_val(m->type);
> +			mbwu_state->correction += mpam_msmon_overflow_val(m->type, msc);
>  
>  		/*
>  		 * Include bandwidth consumed before the last hardware reset and
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 01882f0acee2..108a8373901c 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -224,6 +224,7 @@ struct mpam_props {
>  enum mpam_device_quirks {
>  	T241_SCRUB_SHADOW_REGS,
>  	T241_FORCE_MBW_MIN_TO_ONE,
> +	T241_MBW_COUNTER_SCALE_64,
>  	MPAM_QUIRK_LAST,
>  };
>  

Thanks,

Ben


