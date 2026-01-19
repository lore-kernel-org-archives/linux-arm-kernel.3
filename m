Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1423CCCF2F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTsb/OUNxM0Yl8TxO7CLRPGc7+/qemhXAp5qIFHps8o=; b=LL+xXkEQMtXcrc8FIZJGE1k/zj
	3gV6OlXij/dJKDCfHoFPqGevTY7VHOOMxkgOtK4WJIpTodbLhorg5Rjkpje3vsrsnM9oE6gJayaUn
	TA4RfKWFk5+lhEprkc9RVbG9QEEWYNbnB5WF2KRwNdOF0EZVCj+Vbw2Z2xFhWkcPSmQku3yX7O226
	gVc2QBge8kQSTVxiW/37nO4L5B5Hyo4YfnZysND6L3vYHtyu+vn1ft56i1UBwxhIHndWWDDe3PnV1
	2fLdTkTzItUfEsACfs3XM7w8xsbqcsNvYRKhFwVxnydTN8u2iU0KUzxYzz89oTzTNaQ5CqflPOwY+
	aYIHTkcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoDt-00000001zBr-0cZm;
	Mon, 19 Jan 2026 12:19:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoDr-00000001zBL-0hpZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768825146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FTsb/OUNxM0Yl8TxO7CLRPGc7+/qemhXAp5qIFHps8o=;
	b=PuUUAox0hXqQLy4S1oxQ4mIhDAnDzCVGB4voowfL0KMG1iuvSap/e4v/3TC6i+N8ODj6o7
	Dzo6TLimJ89eHZ30EvnzIUX3Pl3iOZvVeypnilCg+tUBuWqjXn3cC/HIz9rWLkve9T55QT
	hQGK7r9zRcJSLVMYbSoq36jWcblpMvg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-bs1UKy1sMqSHxEbfwEcP1w-1; Mon, 19 Jan 2026 07:19:04 -0500
X-MC-Unique: bs1UKy1sMqSHxEbfwEcP1w-1
X-Mimecast-MFC-AGG-ID: bs1UKy1sMqSHxEbfwEcP1w_1768825144
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso7707278a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 04:19:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768825144; x=1769429944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTsb/OUNxM0Yl8TxO7CLRPGc7+/qemhXAp5qIFHps8o=;
        b=rKpNa2tNH4m3Ic5JWud8yg7nCvE5yVbPDiNdWArQ9qu0/PuKlT/BQCw3plNOqeO8TF
         enYZrR+BwUe5RqPcxNPZCrtUJV8i97bxLwIopsjxuLkEvzatnGVq5Us61idegtNSorld
         gQE98kGAL+AmVQGbv/8O4JWvQ3U7j0uqJ2tXnIWtGYZgnRPdFpF/1sDWDzsmC9LnCyOn
         TNKt6QtY3y2V1eeZZ9XQwRk4qqmviud4UvSGT5h9H9Ml9pgIGRHu5lWvaUq+MZKBvn9S
         7wgfHjIKeXVNKsf5plX2APEGoES6i2sjjTHeVyxlFOwIqorTe92+eAtByWsvrcAz3qBL
         nLEA==
X-Forwarded-Encrypted: i=1; AJvYcCVTMiVaRt8BbR2ABYKJ7KnVgJFrvmWyRPgjDfq6TMCBKUXOgGaixVD3cc+05Y/jXdHwfp44sjsb1JZE/9x0g815@lists.infradead.org
X-Gm-Message-State: AOJu0YxvXYUCQV/8PuWy7ingcNH/iO8leohJnjdlwzWlOvyuglJe01cC
	x8GA6VCAajZ1czN/fXBnuMfiu0OWYOF7AGcv0j9ZjJXRi2xMy+6f2JNIMLNvE6UB4jb1iwrLzt7
	ubL2ltec47x6b5PY2RN0OKzfMjEq5XtE+CaaEh3einuqAwYAC+eQ5BCvYNS9mTmXUPUFaVynDr8
	AA
X-Gm-Gg: AY/fxX4NA2T34F14U2Ur6KtsM6e1Z94ZztLq8K6cMhGJXJ4qQfTAiISCXmNqk2X6qJ4
	pBOB7BjpLZjcQnSp8UvDUjsLgqcuCW5k5pTnNcS9Xl3t8uOxUtS2/lBHZna50mbCvPn6nQRuSYJ
	6xq2Cxg/olcX+6YiomuGnooh8NzDguziDBbnjNhQDDwBzFbhZE52X9ZT2d81/M5xt9utCJHzuOH
	MKbu0doElFoP6Q1XzW1h7YpzH8yVRQ8dg4+vqafth4pbCiD2rJpkqYTfjty8QZpqcGqfVP+A9AK
	JTV3vLqmU7N3ciTaEiQocNRrxonsMkmQ5LnbLdBNsxC8o3B7xHP3IgFLDQVnQ0Os5evDlydDdyG
	H/JlPdN++8hU=
X-Received: by 2002:a05:6a21:4ccb:b0:366:14b0:1a2f with SMTP id adf61e73a8af0-38dfe7c6bc4mr11049675637.61.1768825143680;
        Mon, 19 Jan 2026 04:19:03 -0800 (PST)
X-Received: by 2002:a05:6a21:4ccb:b0:366:14b0:1a2f with SMTP id adf61e73a8af0-38dfe7c6bc4mr11049665637.61.1768825143365;
        Mon, 19 Jan 2026 04:19:03 -0800 (PST)
Received: from [10.72.112.128] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf32d1f1sm8972189a12.22.2026.01.19.04.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 04:19:02 -0800 (PST)
Message-ID: <30b7483d-abaa-4668-95bd-93765c72a1f2@redhat.com>
Date: Mon, 19 Jan 2026 20:18:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 47/47] arm_mpam: Quirk CMN-650's CSU NRDY behaviour
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-48-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-48-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tvkAIq37eim_LzqIQ2Q9m0rDgzjFe9CZVyxWVNozHY4_1768825144
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_041907_282493_38C32F6A 
X-CRM114-Status: GOOD (  26.36  )
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

On 1/13/26 12:59 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> CMN-650 is afflicted with an erratum where the CSU NRDY bit never clears.
> This tells us the monitor never finishes scanning the cache. The erratum
> document says to wait the maximum time, then ignore the field.
> 
> Add a flag to indicate whether this is the final attempt to read the
> counter, and when this quirk is applied, ignore the NRDY field.
> 
> This means accesses to this counter will always retry, even if the counter
> was previously programmed to the same values.
> 
> The counter value is not expected to be stable, it drifts up and down with
> each allocation and eviction. The CSU register provides the value for a
> point in time.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   Documentation/arch/arm64/silicon-errata.rst |  3 +++
>   drivers/resctrl/mpam_devices.c              | 12 ++++++++++++
>   drivers/resctrl/mpam_internal.h             |  6 ++++++
>   3 files changed, 21 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index e810b2a8f40e..3667650036fb 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -213,6 +213,9 @@ stable kernels.
>   | ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
>   +----------------+-----------------+-----------------+-----------------------------+
>   +----------------+-----------------+-----------------+-----------------------------+
> +| ARM            | CMN-650         | #3642720        | N/A                         |
> ++----------------+-----------------+-----------------+-----------------------------+
> ++----------------+-----------------+-----------------+-----------------------------+
>   | Broadcom       | Brahma-B53      | N/A             | ARM64_ERRATUM_845719        |
>   +----------------+-----------------+-----------------+-----------------------------+
>   | Broadcom       | Brahma-B53      | N/A             | ARM64_ERRATUM_843419        |
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 7409cb7edab4..e6c9ddaa60e2 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -691,6 +691,12 @@ static const struct mpam_quirk mpam_quirks[] = {
>   	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
>   	.workaround = T241_MBW_COUNTER_SCALE_64,
>   	},
> +	{
> +	/* ARM CMN-650 CSU erratum 3642720 */
> +	.iidr       = MPAM_IIDR_ARM_CMN_650,
> +	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
> +	.workaround = IGNORE_CSU_NRDY,
> +	},
>   	{ NULL } /* Sentinel */
>   };
>   
> @@ -1003,6 +1009,7 @@ struct mon_read {
>   	enum mpam_device_features	type;
>   	u64				*val;
>   	int				err;
> +	bool				waited_timeout;
>   };
>   
>   static bool mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
> @@ -1249,6 +1256,10 @@ static void __ris_msmon_read(void *arg)
>   		if (mpam_has_feature(mpam_feat_msmon_csu_hw_nrdy, rprops))
>   			nrdy = now & MSMON___NRDY;
>   		now = FIELD_GET(MSMON___VALUE, now);
> +
> +		if (mpam_has_quirk(IGNORE_CSU_NRDY, msc) && m->waited_timeout)
> +			nrdy = false;
> +
>   		break;
>   	case mpam_feat_msmon_mbwu_31counter:
>   	case mpam_feat_msmon_mbwu_44counter:
> @@ -1386,6 +1397,7 @@ int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
>   			.ctx = ctx,
>   			.type = type,
>   			.val = val,
> +			.waited_timeout = true,
>   		};
>   		*val = 0;
>   
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 1680d1036472..0bd323728b53 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -226,6 +226,7 @@ enum mpam_device_quirks {
>   	T241_SCRUB_SHADOW_REGS,
>   	T241_FORCE_MBW_MIN_TO_ONE,
>   	T241_MBW_COUNTER_SCALE_64,
> +	IGNORE_CSU_NRDY,
>   	MPAM_QUIRK_LAST
>   };
>   
> @@ -251,6 +252,11 @@ struct mpam_quirk {
>   				FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0)	| \
>   				FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0x36b)
>   
> +#define MPAM_IIDR_ARM_CMN_650	FIELD_PREP_CONST(MPAMF_IIDR_PRODUCTID,   0)	| \
> +				FIELD_PREP_CONST(MPAMF_IIDR_VARIANT,     0)	| \
> +				FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0)	| \
> +				FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0x43b)
> +

An error reported by checkpatch.pl as below.

ERROR: Macros with complex values should be enclosed in parentheses
#105: FILE: drivers/resctrl/mpam_internal.h:255:
+#define MPAM_IIDR_ARM_CMN_650	FIELD_PREP_CONST(MPAMF_IIDR_PRODUCTID,   0)	| \
+				FIELD_PREP_CONST(MPAMF_IIDR_VARIANT,     0)	| \
+				FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0)	| \
+				FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0x43b)


>   /* The values for MSMON_CFG_MBWU_FLT.RWBW */
>   enum mon_filter_options {
>   	COUNT_BOTH	= 0,

Thanks,
Gavin


