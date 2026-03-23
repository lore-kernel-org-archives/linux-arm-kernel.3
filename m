Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8F2F4613F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 22:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOwEUV/+/IiwRIdM5bNrsbwxqPiiVpPpeKsMREHuJ0s=; b=j0oeayG3Zl/MBdTKANwdc8Ntl9
	tZOlHYHEnWDEvKu81TybOiQ60D7nqGEOrXgnaEruohlp89GQRvCwBEGyBEnwMHmDv2xVYiB7aYzeg
	i3zRdnU5R9hOF+BUMACg1auqIz2vjlZ4P4ISIrmQFGYq2P0nYTlYcW8Lfow8Agc1bUpX3nUQs5Hmt
	ljh14sgtkJprEZRl8Iq6KDqb4U6Zy7oMPSYCtTkzel60Z00asMXLpW75+kZ8tU7/iTzInjpqigcAK
	yjztJ2OTBIvjP1X3RQz+T1t8+aJCQzzMvy5WxSG/3C/H1RF5ElGm/qTM0agaw7MZIvYwihYaXpFMm
	tCZRSwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4o5o-0000000068q-1LC5;
	Mon, 23 Mar 2026 22:49:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4o5l-0000000068S-3gvf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 22:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774306188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TOwEUV/+/IiwRIdM5bNrsbwxqPiiVpPpeKsMREHuJ0s=;
	b=ixpDs1u6chAoZKLYc/ziv2JfcaQfCmwhYBn+tNnOmSd8AH0WfqlCHOkJSlobL6iFTwiA82
	txri1v3sOH0ZcBHn/HCEa/hoiyrp9tD+ttMu/1CmCNnY5aJshUj9bM7h5pkZgimwoxZBvo
	On+18hZbCv/n0fFtOLbVvyVUU+24j5Y=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-scA1H0ZlOheXvlAJAoSxew-1; Mon, 23 Mar 2026 18:49:47 -0400
X-MC-Unique: scA1H0ZlOheXvlAJAoSxew-1
X-Mimecast-MFC-AGG-ID: scA1H0ZlOheXvlAJAoSxew_1774306186
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b06b68783dso18906405ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774306186; x=1774910986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOwEUV/+/IiwRIdM5bNrsbwxqPiiVpPpeKsMREHuJ0s=;
        b=knuWvdfV82SfypKuOfgKJH0V7Xep3qz7sfXvhvKOCTYyCM576qH4Boj633icsOe7Od
         Jw0W9VeGuwgy+HJ0wvLOh4eXS9hwMnmmG5xvNSQg5+EFNKPGlCs/bFLLQTZ1v/ZcKGo6
         i3CHTXfpCM3v4joDOktX2BPWaI45ITZjY0z9EfJE/x0dPND0ge9YLI/+6Jt71y9Yt5TX
         OytumpkZ2osbOkygDTEWjBIej58cRp7v6Cn4r9jl6J7luIY2hER/DN5Yx/YOS4I6qMwV
         4W24BZfU1tARuIt6XnWTem2K5dVmaThyhZeEST9EUjqcOKoDbRNj0wcsJ4cG5e5oKAsu
         9OIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9kYXb5QGFKYsAZ4KDJogE0d70OAP9Bks036rMqY/mPWSYOlZ5bWgHfS0xHgE6vvNc1jBzGg6bNEfiNKGqa/nT@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw7r+btFw6UZH7omPU6XuBADOUX+yDCk+CAYhxPgYeGCXoDRad
	mUBeAwTpQEJxJSh7BRwDIEQ+EuC+cLObjt4yEAvAxfoaHKE+LCjE9a3x15ROLQ7RuSkjZCxQB4E
	aR7VYDHC30SZWhuitZIKIcovIml3HE3io4UbLBDq8GjBh7YFIJ9PKMXJ/37XQLhfEMwvjsddrr2
	cM
X-Gm-Gg: ATEYQzwdbBE45FGL8ZmrfQ7/IFG/9/40mbLkylLML2qtGu5RW4zBWGGCtzvxM3OIwql
	DWMrCW+d7hgZ6oS/H+LPOR9PfT5CJqLWxLw7KU8i8e5wzrije7X13PxzosQB0ML0NAXTrMqGNuo
	DZcnXC4axU6duQTS3S5CZPy6f8fOSKnrYGHcK53lj/Sj4Vj3K8GjJvw5dvqsT9rFow1h8XOOLmg
	taUY6WXJWj1qUC6VOZ9Ax3vTsikSqI3ZttJLfMb7ntBRDwyRaNPam6LcUJIPZ4zqQZVvZibL544
	okGAb+AmuW0oj4y8XbHsgiV/+Akuy++QIsg1sau0igAMcLtyugr2izzMXyU+DygLNd+Wbe/qe1R
	z7tei3sTOh/V0EzvpQGtcHhoo19Jtcpt2CS6uK+BopqENjWRTEDEUJJLn20NGUdeL
X-Received: by 2002:a17:902:ce82:b0:2b0:6f20:8044 with SMTP id d9443c01a7336-2b0827e94edmr130458615ad.43.1774306186329;
        Mon, 23 Mar 2026 15:49:46 -0700 (PDT)
X-Received: by 2002:a17:902:ce82:b0:2b0:6f20:8044 with SMTP id d9443c01a7336-2b0827e94edmr130458205ad.43.1774306185890;
        Mon, 23 Mar 2026 15:49:45 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08369617dsm155881845ad.71.2026.03.23.15.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 15:49:45 -0700 (PDT)
Message-ID: <bd450f1f-05a3-44d6-9bbc-1c48d967baa4@redhat.com>
Date: Tue, 24 Mar 2026 08:49:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 22/40] arm_mpam: resctrl: Convert to/from MPAMs
 fixed-point formats
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
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-23-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-23-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EnZcTPpThXnNeewDLR6UG_zTRiSM1ATW72r-sMycl5I_1774306186
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_154950_019729_EC82B18B 
X-CRM114-Status: GOOD (  27.00  )
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

On 3/14/26 12:45 AM, Ben Horgan wrote:
> From: Dave Martin <Dave.Martin@arm.com>
> 
> MPAM uses a fixed-point formats for some hardware controls.  Resctrl
> provides the bandwidth controls as a percentage. Add helpers to convert
> between these.
> 
> Ensure bwa_wd is at most 16 to make it clear higher values have no meaning.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Ensure bwa_wd is at most 16 (moved from patch 40: arm_mpam: Generate a
> configuration for min controls)
> Expand comments
> ---
>   drivers/resctrl/mpam_devices.c |  7 +++++
>   drivers/resctrl/mpam_resctrl.c | 51 ++++++++++++++++++++++++++++++++++
>   2 files changed, 58 insertions(+)
> 

One nitpick below, but this looks good to me in either way.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 0e5e24ef60fe..0c97f7708722 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -713,6 +713,13 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>   			mpam_set_feature(mpam_feat_mbw_part, props);
>   
>   		props->bwa_wd = FIELD_GET(MPAMF_MBW_IDR_BWA_WD, mbw_features);
> +
> +		/*
> +		 * The BWA_WD field can represent 0-63, but the control fields it
> +		 * describes have a maximum of 16 bits.
> +		 */
> +		props->bwa_wd = min(props->bwa_wd, 16);
> +

16 may deserve a definition for it since it's a constant value and referred
for multiple times in this patch, if we need to give this series another
respin :-)

>   		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features))
>   			mpam_set_feature(mpam_feat_mbw_max, props);
>   
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index cab3e9ccb5c7..adaec522c1a1 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -10,6 +10,7 @@
>   #include <linux/errno.h>
>   #include <linux/limits.h>
>   #include <linux/list.h>
> +#include <linux/math.h>
>   #include <linux/printk.h>
>   #include <linux/rculist.h>
>   #include <linux/resctrl.h>
> @@ -242,6 +243,56 @@ static bool cache_has_usable_cpor(struct mpam_class *class)
>   	return class->props.cpbm_wd <= 32;
>   }
>   
> +/*
> + * Each fixed-point hardware value architecturally represents a range
> + * of values: the full range 0% - 100% is split contiguously into
> + * (1 << cprops->bwa_wd) equal bands.
> + *
> + * Although the bwa_bwd fields have 6 bits the maximum valid value is 16
> + * as it reports the width of fields that are at most 16 bits. When
> + * fewer than 16 bits are valid the least significant bits are
> + * ignored. The implied binary point is kept between bits 15 and 16 and
> + * so the valid bits are leftmost.
> + *
> + * See ARM IHI0099B.a "MPAM system component specification", Section 9.3,
> + * "The fixed-point fractional format" for more information.
> + *
> + * Find the nearest percentage value to the upper bound of the selected band:
> + */
> +static u32 mbw_max_to_percent(u16 mbw_max, struct mpam_props *cprops)
> +{
> +	u32 val = mbw_max;
> +
> +	val >>= 16 - cprops->bwa_wd;
> +	val += 1;
> +	val *= MAX_MBA_BW;
> +	val = DIV_ROUND_CLOSEST(val, 1 << cprops->bwa_wd);
> +
> +	return val;
> +}
> +
> +/*
> + * Find the band whose upper bound is closest to the specified percentage.
> + *
> + * A round-to-nearest policy is followed here as a balanced compromise
> + * between unexpected under-commit of the resource (where the total of
> + * a set of resource allocations after conversion is less than the
> + * expected total, due to rounding of the individual converted
> + * percentages) and over-commit (where the total of the converted
> + * allocations is greater than expected).
> + */
> +static u16 percent_to_mbw_max(u8 pc, struct mpam_props *cprops)
> +{
> +	u32 val = pc;
> +
> +	val <<= cprops->bwa_wd;
> +	val = DIV_ROUND_CLOSEST(val, MAX_MBA_BW);
> +	val = max(val, 1) - 1;
> +	val <<= 16 - cprops->bwa_wd;
> +
> +	return val;
> +}
> +
>   /* Test whether we can export MPAM_CLASS_CACHE:{2,3}? */
>   static void mpam_resctrl_pick_caches(void)
>   {

Thanks,
Gavin


