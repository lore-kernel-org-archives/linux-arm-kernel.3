Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3650AD116E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 02:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQm/hpjl97YQhN4/UPkldLLMmAXJLOJiRTjQPPZOSf8=; b=OWe0xuo835ugzVneHnKnyGOQc4
	LNlb421OIH1qIxkmC/Sz+a1eKLWzRHc92aZeMp5VXQtH5YSlO+Ke3Y4wsRYMP5Zg+7W7M0FWv332b
	zz29V79GjeygZfNgHgySOZRpP0q8EOWfC/l5jLFx/TVBgGuUdnsEIaYT8CRL4nAbCyiDaknRxD+vm
	7t56FmE3ODQ9ocvUis1Jh2lkK6jfeABHPsR8VINk3/VNM4NrwnOLkUkjbMGm3XmOA+QUAW5XPmhXZ
	1AyMsDbm4QRJ06lL246DbiRbAQWJlcOKADs+81/zJgmkOTIi/2rME6dQCSN7bJ1YuClshUd8xaD1N
	9bvVytFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORjp-0000000FtTv-1A9y;
	Thu, 27 Nov 2025 02:28:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORjm-0000000FtTa-0BJe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 02:28:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQJMNwu2388022
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 02:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQm/hpjl97YQhN4/UPkldLLMmAXJLOJiRTjQPPZOSf8=; b=eKgaAJ2O+i/ngqoP
	krOXmGzyCdGQbK4Ges1lA4B8fztG1LvLFYyvyQnvn72+bYhCzVDnEj3//9gAPhDV
	lqyeeybBKzkZvIGpoWUvjJQN2Xz8BD+na9hRZ1n+BtRsJRux+YoToYPxVRIL/57y
	yPjJYZc7gdh8LTRoh88driSM4uYw5jUx++/FEqNUp+8YusrPZhYBhIfCDTpVV/5E
	Y49bmwVumJqlJif2hp2TwpdlhS0GlZykD1JROZWw3ravlO5JzuKy0rkXO8QBdUSp
	7gXi2+ayiSSuqG1ouypivQs91eL5dFfqrjtfEXTZ6CDM11zYUPpfkByNIo4RZLR6
	g9b3gQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap7n8gt2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 02:28:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297e5a18652so4284225ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 18:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764210480; x=1764815280; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQm/hpjl97YQhN4/UPkldLLMmAXJLOJiRTjQPPZOSf8=;
        b=DWeiJK4D95UgXLjcHoYaVj5GV1qBUwJAoS4NZwMRaDuLF+SMPkbRsoSnI6LyAmsCk3
         lgplZFrr8VpitjJqZ1vtYlyVI9FXCBEW9ZCh7NMyALrl8cyr7qW4k3ZaCcyVirl7LujK
         qgtkUlQeCz0p3Uv6cV7U/dM5XUNxsHDlkPW9w3sFJ77KUqk8bkQLTs/7QnXfRu+1RDQG
         WusqB0uvu8j+g2mF6iXqBsOdVfOgT+u5c+/Cf/tQz2/NoOmnLMSS6DeW/C715Mp4vBRR
         csHgzp94F9OjwJJKVNKBamKzM/Hyho3OOeGuYj5EdK9LNPXZkB/eFKf/srrpnjs+10m4
         w/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764210480; x=1764815280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQm/hpjl97YQhN4/UPkldLLMmAXJLOJiRTjQPPZOSf8=;
        b=P9qTw9jfcepd9z5A7LYbv2AtVzk4XIJ/uXenOmCqMYPWxW9T2z2UVyLhMCLicdXoPh
         0zq5KTDIYS3dyZjQnLhZiRgmqURu6/9cIpkuGNK0flPF1R4lV53on7sd1wzS3QLguiYt
         tF6dzzT6d0NU9YHiLI+3oFnLTDXdVatVToDCB9Mdyz8VNSPVqzoUXE2C3vwnbGxaW/zM
         0E0wQC1aipbamsGJG2zOReFqfUPXtDiRhF8sFQjRmCyi7MvxuKLvrPqCWi4saUHsJsj8
         JF2Pp0EnO38KMdEXa1SlyHlPtk7Q8Udca0v0+8cSfkjCyuwrTW2iup8qZxSE+tzDzqAM
         G8lw==
X-Forwarded-Encrypted: i=1; AJvYcCUCS+RHdnpX5TDrmqjNIz1hDDAr7DVHvz9A9ypa68HAkJq/QruYtonXIpErp9lvgmFFbhqDSi67kS+iMyzCSebZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzMDT0JRSnxfMogQNErF1GqaOo1Z28wpqyT3rITBR5ICkVpsnHp
	tDHBjNAucMXieDG1KELNZHEPgfp7++zRp+7RG4SutearUoiOx1GAY56C7aDT7MtlMvFKPO0hKr6
	R5liX1QS5f0GjGJ1FN2R11TEKuYDzM6tpi+AQHRN7t7YwURdkVvWAK4lLbUxPC8BBPE2Hm7ArQj
	EXcA==
X-Gm-Gg: ASbGncvjE2sKAXCUrTiWJbK7LBpbvqZdcHYcc06dJxJ9ibnCiAL0/0H7vHmK3l+AE1e
	D7dVHTqDFdinKRx9y/8npNuT01DuGzmLzQefk2iPYCr1KZqaR774XAP1dwnloOA2rwQKbYa52fm
	wC5OJleNiS8AMAOLKZaKL/rB4V2ILzMTFrVHvw7glPwV1AG56LG2+PP+onMqGMopUp43St31A0K
	tnLYU9vILBBHDlQn6KDFJ16TCEIRnNpqW21bb9cpT+SGxXc6w7cSKLNRTPYT/mhcR5XUymH1Aep
	zfXCqqeqU+Mz+JFxEolQx1SKwXGwoumPAzp8LhDplIRHIyXxuv3VXsUVpnjgTrG/39CWsBMFW6z
	PDi/MyQvgEE1c/DjxW9DFlNo6FYfr7btkwD1Wru/riKBR0XZWosEz9UIaW8luJJAhjicRAVDliO
	Q=
X-Received: by 2002:a05:6a21:32a2:b0:340:db9b:cfe8 with SMTP id adf61e73a8af0-36150e1fc11mr24519944637.12.1764210480252;
        Wed, 26 Nov 2025 18:28:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiAeOMpYdHf1InUmL+Cvmp8kK5JBuNuxbX5BxzSEmVGWKC6I85XJ5FtyO3p8MYiH5dDy/DAQ==
X-Received: by 2002:a05:6a21:32a2:b0:340:db9b:cfe8 with SMTP id adf61e73a8af0-36150e1fc11mr24519915637.12.1764210479728;
        Wed, 26 Nov 2025 18:27:59 -0800 (PST)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be5095a1d85sm160891a12.26.2025.11.26.18.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 18:27:59 -0800 (PST)
Message-ID: <78956452-7c22-4338-823d-bc3d619cef7d@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 10:27:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/13] coresight: Allow setting the timestamp interval
To: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-12-7fae5e0e5e16@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251126-james-cs-syncfreq-v7-12-7fae5e0e5e16@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q8fuov7FN8HKWF1bNzE4kXek9DeylwFx
X-Authority-Analysis: v=2.4 cv=AufjHe9P c=1 sm=1 tr=0 ts=6927b731 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8
 a=ANtGpvVd1iEdTLDb4B8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: q8fuov7FN8HKWF1bNzE4kXek9DeylwFx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDAxOCBTYWx0ZWRfXylXHe0ZNU3eQ
 gs2I86PXuWofmZMySY66UQvSsy+0++leEKy5pSRKweEe1BrRMF50qTQS0Ja/h//eEbp7GwOXOIq
 lH82e7G6WnTwrCrCskYBRG0ZqaRF3ZTaG262g+2nh4CiV+cFwnNmWgHaZ7wgOnkUt6SZgLYkG6m
 70r2uMAuuQAEidIC9PZ2j1hA31l3gaPrmcC9bsaf8hUVHmlNZjBThH7yYJVRkR14eQKheHFONuN
 E5LLKwTZ1DtQYL/tG32px61tWPj3v7eeaQUtUMo4C9Y406P7hDnpBCsf23TxaVgRLTfw69MJal8
 uruMItDWRR5u6zIlMEvCubzP3eD5If55fS5dyPU8WI275aCB/s6dsKKP/gWgDd6kn/5UzQuFeRn
 vecixaeEnKxX0oihrLzqjKP+wRa2oA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_182802_095073_144B112D 
X-CRM114-Status: GOOD (  27.98  )
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



On 11/26/2025 6:54 PM, James Clark wrote:
> Timestamps are currently emitted at the maximum rate possible, which is
> much too frequent for most use cases. Set the interval using the value
> from the timestamp field. Granular control is not required, so save
> space in the config by interpreting it as 2 ^ timestamp. And then 4
> bits (0 - 15) is enough to set the interval to be larger than the
> existing SYNC timestamp interval.
> 
> No sysfs mode support is needed for this attribute because counter
> generated timestamps are only configured for Perf mode.
> 

Tested on Qcom Sa8775p-ride with perf session.
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>

Thanks,
Jie

> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.h   |  1 +
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 28 +++++++++++++++-------
>   2 files changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index 24d929428633..128f80bb1443 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -7,6 +7,7 @@
>   #ifndef _CORESIGHT_ETM_PERF_H
>   #define _CORESIGHT_ETM_PERF_H
>   
> +#include <linux/bits.h>
>   #include <linux/percpu-defs.h>
>   #include "coresight-priv.h"
>   
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index c7bf73c8f2d7..0129b0502726 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -651,7 +651,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
>    *  +--------------+
>    *         |
>    *  +------v-------+
> - *  | Counter x    |   (reload to 1 on underflow)
> + *  | Counter x    |   (reload to 2 ^ timestamp on underflow)
>    *  +--------------+
>    *         |
>    *  +------v--------------+
> @@ -662,11 +662,25 @@ static void etm4_enable_sysfs_smp_call(void *info)
>    *  | Timestamp Generator  |  (timestamp on resource y)
>    *  +----------------------+
>    */
> -static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
> +static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
> +				       struct perf_event_attr *attr)
>   {
>   	int ctridx;
>   	int rselector;
>   	struct etmv4_config *config = &drvdata->config;
> +	struct perf_event_attr max_timestamp = {
> +		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
> +	};
> +
> +	/* timestamp may be 0 if deprecated_timestamp is used, so make min 1 */
> +	u8 ts_level = max(1, ATTR_CFG_GET_FLD(attr, timestamp));
> +
> +	/*
> +	 * Disable counter generated timestamps when timestamp == MAX. Leave
> +	 * only SYNC timestamps.
> +	 */
> +	if (ts_level == ATTR_CFG_GET_FLD(&max_timestamp, timestamp))
> +		return 0;
>   
>   	/* No point in trying if we don't have at least one counter */
>   	if (!drvdata->nr_cntr)
> @@ -704,12 +718,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>   		return -ENOSPC;
>   	}
>   
> -	/*
> -	 * Initialise original and reload counter value to the smallest
> -	 * possible value in order to get as much precision as we can.
> -	 */
> -	config->cntr_val[ctridx] = 1;
> -	config->cntrldvr[ctridx] = 1;
> +	/* Initialise original and reload counter value. */
> +	config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << (ts_level - 1);
>   
>   	/*
>   	 * Trace Counter Control Register TRCCNTCTLRn
> @@ -799,7 +809,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>   		 * order to correlate instructions executed on different CPUs
>   		 * (CPU-wide trace scenarios).
>   		 */
> -		ret = etm4_config_timestamp_event(drvdata);
> +		ret = etm4_config_timestamp_event(drvdata, attr);
>   
>   		/*
>   		 * No need to go further if timestamp intervals can't
> 


