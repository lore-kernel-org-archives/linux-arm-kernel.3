Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AD2CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 02:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4Y8OgnYQdT1QtuisubqSFNUEjWwvf0derGNmFwfw84=; b=nZsBkf1e2fgt9044jvpKFWmE7y
	VR/C/cWsoiAdfZAIRvJjn8QmjrWjlFkVPiBVS08EdxeU3RwTEn+D6OZUxH576ZkXHm4YJkzPt9g+9
	ORpZp29Z0ek3LLgUxPwlulqgUnUYNjYSucr2MAyGAoExJSx2quxdfi47s10ykfYrD/NmBNl9Xh7in
	EM5Z5jfzHr7DQQ6skqYx+cSwV+k20hlTFcbu08COUt53LdDVLdg+kCLCsux82AbUq9FGPdOMoyA9e
	FyejcnapvyhnW1dpxzvvmx8RESvABZxDLGfr4uip1gzMjbqUfTt4DW0JZPPDk74rXKfZeNcigUabv
	Wo0acf3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQFmM-00000009Zk7-0TNj;
	Fri, 22 May 2026 02:38:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQFmJ-00000009Zja-2GXv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 02:38:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LGk4Yc399180
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 02:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4Y8OgnYQdT1QtuisubqSFNUEjWwvf0derGNmFwfw84=; b=KUq9B2c9MnKVSHLg
	yZj1x+LT2QUWAugGUd5ChDQqCK/rMT6vmdY55Nou3rBAHF7qZH8+HJhBJGtyOBZL
	3W94QgV6ehGf8xhrkuvl/E8pUq5Aij3r9vDb12sqprHOh1cYehy+YXN29CU/ecCi
	sWJu73//A8VfB868n2oygQl9WpPvjHwbshN3EtA4Q36VE243+h/KLglEOb5hV7XJ
	hrAUdI8f3Gf+18xSUREF0RWRtTSE54Qq/bogVg3HWY4I17hQubjUYyr6pAqoKD2P
	BzjZcZCXKKZeYNtnsRq+ecuCH4HAYuRJN7AeM8iyBD+PKtLrCTzN0g0gfS2PZ41l
	kjO8qQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9t2gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 02:38:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba115ab6bbso71930245ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 19:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779417502; x=1780022302; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M4Y8OgnYQdT1QtuisubqSFNUEjWwvf0derGNmFwfw84=;
        b=cYSSDqpk5YuYuiuvTzuJkgsxMc2YuaCyul75/HHgzTAmkwYXarI4JPc8OZHPPkmtKP
         oRuUQGoTX1VxleoDfIJiERbfUpDm+//9f4fiWHGnXnbnoZ0LxCUNY3KQ0XHWZbPJdanQ
         ZzcpP37Bnrv6Qi7ypxPb8hi4vYdJqU5AgVyknp/dNByWk2QKIpPiu8Cc2G5p0EqTzYck
         x7ehbZEi1z6COhi82y+xBnFcSDCV5oYnizHp+EQG/7mhW2BgARpM01fz0zxMa+DYPgeZ
         T1qfvKMQOc5yB4J/s23/Jit7J4Tg7EjIbe2bLp9v41NtB0cz4jHhYGVEEMR/dZ6VHWbd
         VK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779417502; x=1780022302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4Y8OgnYQdT1QtuisubqSFNUEjWwvf0derGNmFwfw84=;
        b=hSZZz9uFi+WTJE4E9Ww0JGBYFtyI9K1zCp3+jWVIpgG6Y3W+8Tjf77Nsb3p10AitY0
         JewYVSpjoL5/mtcx6d+VR5XWRPj6Izb5gqxGoNjaEuSvpozrcRzyFG2RSEtF1G5Kkfoc
         v7HFwX7N+Kvr8QbSrneuZ9ihcAxmEBJzqnAVx1KUuwxbPyWr2fttnqu3ygee6nBrM3SU
         v5+d3XA4SpWqvtIwRsPNUhGG350UV0mKCfT9cHINB28Bkdt3fSrJ1DMF2Xh8fduyM+V7
         +aXZXm78+yEaeo9fC5viEbrt6oZN7ad/01Uv/D3r3OQMUm+8Jr+h04u/NfPPJ01z403a
         WyXA==
X-Forwarded-Encrypted: i=1; AFNElJ8G/WIYBjEw/KeHBklHOVqald/F6s0Ra0Ot34WMFg949hzbS2qhvnZhGUk1Tb1AEMx48LvmxShQLTFDxA2Iontg@lists.infradead.org
X-Gm-Message-State: AOJu0YyI3kXwVLwwbdJ/pmU3y3DSQCG5vvDmhpc7fCiC358xTFbcgwOE
	httVvt6OawcoU1+JEhXWTl2+1hmUPdznPK7AicuyFexiPGICWUxwUAGDbWvAdWf/Hn0QD+vjO3p
	LLODVUgobZXz/ksnLYD6asTpiws2yhXDF8FqPqcpeWRrmm/bbzFtLbdjtS31cTklXIis1TJw5VA
	aTrQ==
X-Gm-Gg: Acq92OGkIgZK3VyUd1qOb6spbb/J/YL2ySXsvTNV/WRaFScQIW8NZRCyA6k5ceIZ6+5
	YkHZp3aE0qV129Xs8jShN9eCIVswsosj7SppqmRCClaI+GOUaoxLwzHRStd9dTMmZE4c7F3rw0V
	2PbUDE9p/XLOtZit9qBe3WzeYOEdieIe99J2DvK7tdVZN+Bb/BZ2YuBYCDJUXs96GBMkyIadX5J
	l0Dq8F72OFVPOigXZZfyVFSPagaieMFAQWfHl7TKB1qOWauBpG6tX+nN3YhGcsZJ13qHfte2+Kn
	NRh9WjTWYCsmP7jvRZLms4lIs7TuYsoolS9XSIHPAgGQiSdkp8NwqfDXJ6Tap7QLOqMOJuIdOdj
	WmX++U1he95RSlXvKE+Op+7L0/VqFXFbvbO2ofL6lQj2eU6E7H3r/xgbdhW3GkDB5n7Nmze5h7k
	1u4HXJaAw2wOVbprEjhhRYIA==
X-Received: by 2002:a17:902:e548:b0:2bc:ac76:c1d3 with SMTP id d9443c01a7336-2beb0770aebmr16548175ad.29.1779417501912;
        Thu, 21 May 2026 19:38:21 -0700 (PDT)
X-Received: by 2002:a17:902:e548:b0:2bc:ac76:c1d3 with SMTP id d9443c01a7336-2beb0770aebmr16547745ad.29.1779417501383;
        Thu, 21 May 2026 19:38:21 -0700 (PDT)
Received: from [10.133.33.140] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb0e64b89sm6072415ad.8.2026.05.21.19.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 19:38:20 -0700 (PDT)
Message-ID: <daad52c7-c420-437d-8747-61e10437f460@oss.qualcomm.com>
Date: Fri, 22 May 2026 10:38:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] coresight: cti: add Qualcomm extended CTI
 identification and quirks
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-3-d21f4f92c51e@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260521-extended_cti-v9-3-d21f4f92c51e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a0fc19e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Fi1y-F4gZlMYRSbziuEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: pF-EOKDG1vnLXK17RPHNlV4bI0gtLkyn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDAyMyBTYWx0ZWRfXyvwcxB3c3XMR
 y/VbD/Q/pPIggViu8+ANRj6ECxfeSI+tVb7Zu6uweIFIIim5r2wVtavsu5auQSC2LNCAJM6r1iE
 dFFrZsycD6DkuQytelBInkb90U1VschmJTBE0NdesykpKU5bu4EVPrrjmjAlJmn9tqODXIzAfOj
 g2Imnt5oWHLJen36+0WSnLtMzfO+fGADhBLyIlmijkc5RPHhv3rSzjBDq7uan7IUo2mujz7Lyak
 7by0ygKdGxgqA7Z2jxhzCixU+Dck6zvPNDiB+su0KqoXuQbPPAk7bi0miI9VdAX7MhJVwhDYJLo
 gV6KvPO7LQDtXjIfux0anIoIAb9Z1YVnKA2pL9lJ82cTRz35PeoMbbx/KlONhAG02Ls+zHiw4ZI
 yTzKuVZMVwkt/ASXF0N1PwmSwqjHFj+2pY0ucvRhuOL2k7/xb3wdTWtK+9lUoXUthSkYguOtEaS
 0GQhz5LH+6btUbihk6w==
X-Proofpoint-ORIG-GUID: pF-EOKDG1vnLXK17RPHNlV4bI0gtLkyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_193823_594417_5BAB0614 
X-CRM114-Status: GOOD (  37.34  )
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



On 5/21/2026 8:16 PM, Yingchao Deng wrote:
> Qualcomm implements an extended variant of the ARM CoreSight CTI with a
> different register layout and vendor-specific behavior. While the
> programming model remains largely compatible, the register offsets differ
> from the standard ARM CTI and require explicit handling.
> 
> Detect Qualcomm CTIs via the DEVARCH register and record this in the CTI
> driver data. Introduce a small mapping layer to translate standard CTI
> register offsets to Qualcomm-specific offsets, allowing the rest of the
> driver to use a common register access path.
> 
> Additionally, handle a Qualcomm-specific quirk where the CLAIMSET
> register is incorrectly initialized to a non-zero value, which can cause
> tools or drivers to assume the component is already claimed. Clear the
> register during probe to reflect the actual unclaimed state.
> 
> No functional change is intended for standard ARM CTI devices.
> 
> Co-developed-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-cti-core.c | 27 +++++++++-
>   drivers/hwtracing/coresight/coresight-cti.h      |  7 ++-
>   drivers/hwtracing/coresight/qcom-cti.h           | 65 ++++++++++++++++++++++++
>   3 files changed, 97 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index c5cc2706e241..2dac5eb4ecca 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -21,6 +21,7 @@
>   
>   #include "coresight-priv.h"
>   #include "coresight-cti.h"
> +#include "qcom-cti.h"
>   
>   /*
>    * CTI devices can be associated with a PE, or be connected to CoreSight
> @@ -45,6 +46,9 @@ static DEFINE_MUTEX(ect_mutex);
>   static void __iomem *__reg_addr(struct cti_drvdata *drvdata, u32 off,
>   				u32 index)
>   {
> +	if (unlikely(rvdata->is_qcom_cti))

typo.
s/rvdata/drvdata

Thanks,
Jie

> +		off = cti_qcom_reg_off(off);
> +
>   	return drvdata->base + off + sizeof(u32) * index;
>   }
>   
> @@ -172,6 +176,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
>   /* DEVID[19:16] - number of CTM channels */
>   #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
>   
> +/* DEVARCH[31:21] - ARCHITECT */
> +#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
> +
>   static int cti_set_default_config(struct device *dev,
>   				  struct cti_drvdata *drvdata)
>   {
> @@ -702,6 +709,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   	struct coresight_desc cti_desc;
>   	struct coresight_platform_data *pdata = NULL;
>   	struct resource *res = &adev->res;
> +	u32 devarch;
>   
>   	/* driver data*/
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -726,6 +734,22 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	raw_spin_lock_init(&drvdata->spinlock);
>   
> +	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
> +	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
> +		drvdata->is_qcom_cti = true;
> +		/*
> +		 * QCOM CTI does not implement Claimtag functionality as
> +		 * per CoreSight specification, but its CLAIMSET register
> +		 * is incorrectly initialized to 0xF. This can mislead
> +		 * tools or drivers into thinking the component is claimed.
> +		 *
> +		 * Reset CLAIMSET to 0 to reflect that no claims are active.
> +		 */
> +		CS_UNLOCK(drvdata->base);
> +		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
> +		CS_LOCK(drvdata->base);
> +	}
> +
>   	/* initialise CTI driver config values */
>   	ret = cti_set_default_config(dev, drvdata);
>   	if (ret)
> @@ -782,7 +806,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	/* all done - dec pm refcount */
>   	pm_runtime_put(&adev->dev);
> -	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
> +	dev_info(&drvdata->csdev->dev,
> +		 "%sCTI initialized\n", drvdata->is_qcom_cti ? "QCOM " : "");
>   	return 0;
>   }
>   
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index 98b8de8a3687..08ea6daf5b3c 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -54,10 +54,11 @@ struct fwnode_handle;
>   /*
>    * CTI CSSoc 600 has a max of 32 trigger signals per direction.
>    * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
> + * QCOM CTI supports up to 128 trigger signals per direction.
>    * Max of in and out defined in the DEVID register.
>    * - pick up actual number used from .dts parameters if present.
>    */
> -#define CTIINOUTEN_MAX		32
> +#define CTIINOUTEN_MAX		128
>   
>   /**
>    * Group of related trigger signals
> @@ -168,6 +169,9 @@ struct cti_config {
>    * @spinlock:	Control data access to one at a time.
>    * @config:	Configuration data for this CTI device.
>    * @node:	List entry of this device in the list of CTI devices.
> + * @is_qcom_cti: True if this CTI is a Qualcomm vendor-specific
> + *		 variant that requires register offset translation
> + *		 via cti_qcom_reg_off().
>    */
>   struct cti_drvdata {
>   	void __iomem *base;
> @@ -176,6 +180,7 @@ struct cti_drvdata {
>   	raw_spinlock_t spinlock;
>   	struct cti_config config;
>   	struct list_head node;
> +	bool is_qcom_cti;
>   };
>   
>   /*
> diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/coresight/qcom-cti.h
> new file mode 100644
> index 000000000000..d3846613a0de
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/qcom-cti.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _CORESIGHT_QCOM_CTI_H
> +#define _CORESIGHT_QCOM_CTI_H
> +
> +#include "coresight-cti.h"
> +
> +#define ARCHITECT_QCOM 0x477
> +
> +/* CTI programming registers */
> +#define QCOM_CTIINTACK		0x020
> +#define QCOM_CTIAPPSET		0x004
> +#define QCOM_CTIAPPCLEAR	0x008
> +#define QCOM_CTIAPPPULSE	0x00C
> +#define QCOM_CTIINEN		0x400
> +#define QCOM_CTIOUTEN		0x800
> +#define QCOM_CTITRIGINSTATUS	0x040
> +#define QCOM_CTITRIGOUTSTATUS	0x060
> +#define QCOM_CTICHINSTATUS	0x080
> +#define QCOM_CTICHOUTSTATUS	0x084
> +#define QCOM_CTIGATE		0x088
> +#define QCOM_ASICCTL		0x08C
> +/* Integration test registers */
> +#define QCOM_ITCHINACK		0xE70
> +#define QCOM_ITTRIGINACK	0xE80
> +#define QCOM_ITCHOUT		0xE74
> +#define QCOM_ITTRIGOUT		0xEA0
> +#define QCOM_ITCHOUTACK		0xE78
> +#define QCOM_ITTRIGOUTACK	0xEC0
> +#define QCOM_ITCHIN		0xE7C
> +#define QCOM_ITTRIGIN		0xEE0
> +
> +static inline u32 cti_qcom_reg_off(u32 offset)
> +{
> +	switch (offset) {
> +	case CTIINTACK:		return QCOM_CTIINTACK;
> +	case CTIAPPSET:		return QCOM_CTIAPPSET;
> +	case CTIAPPCLEAR:	return QCOM_CTIAPPCLEAR;
> +	case CTIAPPPULSE:	return QCOM_CTIAPPPULSE;
> +	case CTIINEN:		return QCOM_CTIINEN;
> +	case CTIOUTEN:		return QCOM_CTIOUTEN;
> +	case CTITRIGINSTATUS:	return QCOM_CTITRIGINSTATUS;
> +	case CTITRIGOUTSTATUS:	return QCOM_CTITRIGOUTSTATUS;
> +	case CTICHINSTATUS:	return QCOM_CTICHINSTATUS;
> +	case CTICHOUTSTATUS:	return QCOM_CTICHOUTSTATUS;
> +	case CTIGATE:		return QCOM_CTIGATE;
> +	case ASICCTL:		return QCOM_ASICCTL;
> +	case ITCHINACK:		return QCOM_ITCHINACK;
> +	case ITTRIGINACK:	return QCOM_ITTRIGINACK;
> +	case ITCHOUT:		return QCOM_ITCHOUT;
> +	case ITTRIGOUT:		return QCOM_ITTRIGOUT;
> +	case ITCHOUTACK:	return QCOM_ITCHOUTACK;
> +	case ITTRIGOUTACK:	return QCOM_ITTRIGOUTACK;
> +	case ITCHIN:		return QCOM_ITCHIN;
> +	case ITTRIGIN:		return QCOM_ITTRIGIN;
> +
> +	default:
> +		return offset;
> +	}
> +}
> +
> +#endif  /* _CORESIGHT_QCOM_CTI_H */
> 


