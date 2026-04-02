Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A39ED3940D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQ7Zd5cgb0yk5pits+gN3wLhngPs3KzNIb6mGSmkcF0=; b=dbTcIqCKoSdAGL4dfAmj2r3jut
	k8WAuX7ojO88TdpiVPEZKPD3n+P+3ztTuDl/ARljxs13gGizbK9075vFHJhz3V4IX+POm9WEX+JUE
	5mEtWNSNrXqgI9MoJgTih/0vYnAHmSuzVZzqFEFsYEzl7SiXOomkph3+U2E0NfsyUTdc1ZkMlTD9V
	qatV63Qlvd/L/InE34+Em0MMAUTg1ZcGOlUkVOXLjIsmAp1fXLbut2ER46ETl2MYK5jj+T2NEri2s
	8oQvKnZ0YmkByYd+6qZZEadH7ithsPZVmVfnv5PbqgbPG4ED0QXn80AezLpQTnZvkiAithzivdajG
	ua0obsxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FHc-0000000HPL0-2nVf;
	Thu, 02 Apr 2026 10:28:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FHa-0000000HPKf-26cO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:28:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326xO712798853
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 10:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQ7Zd5cgb0yk5pits+gN3wLhngPs3KzNIb6mGSmkcF0=; b=QtEE2CB/LG9Io4Go
	EGhJemTXECeThCcc/wBzfFu7oYLJTSD+Xjh5AElDvpqmEWXIlVlpD0Iixl/+nm5D
	KMkDQ6kNvHV3qraajIboWHlpMKVWW1c0I76IDVtT1fhmNlxf0NoIPozhtc/fRoyr
	wLnS4Wjc0pN+s5BgW/doG+xZhHQsUiLAKA0+KI5FrlSgztvBUMNnQYpNqlw6LAQT
	SX+AWvVmaBWYYSg48+qbTSRQuP8B6/u/nNN+6my7WhiMO4RkPnj3h/kMOO6CKy8m
	R8xMlkZ6onc7wmcWOaigKL0DSwHrDSB+3DGmKmNggJKgHmGtyHVr0bY5fFAjOWsM
	lhxz4Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96hk3kq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 10:28:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0bf2b3879so18553565ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 03:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775125692; x=1775730492; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AQ7Zd5cgb0yk5pits+gN3wLhngPs3KzNIb6mGSmkcF0=;
        b=NdGq1OhVGRq0A6tba+HDBClt3BRFRMih4pfO4NXD3ANLKAX/WujGaaETVFEBp252m7
         69csLw9mb+hsgf+ZAjORo/V7JipT/uPSjQ6fZPKG3S5UgLqBB4xJaYiUYilBBqeLmDp/
         e4Gv3W4Kv4eTIkreNceeUXnqSxBsAnvh3UoR3Dy0F+hAteDKlsfXiuOB16cohETLyzXA
         rdOOGo8MiiNPd9+E0HhcwWUzXqMdGy7Mf2AyJGTT0/1hAH+r/abH+OrV6DeVNQ9w7vYy
         Up02yg4JMcEGcETYt1P6uCaZAgVvaPjPWyWUJ9eAi0WCyNg+6+RxUK9CPB3bw25EX7/j
         0PNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125692; x=1775730492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQ7Zd5cgb0yk5pits+gN3wLhngPs3KzNIb6mGSmkcF0=;
        b=VvvTDIeURvt4ejJfKJH3XDcUUMxlgoeb4glIEXBQ+ns23Kk2XmYH+qQEcMMz0rdZoe
         QqW+s0Ykh28o9PWjLd4C7pSAcetw9HD0iTCO73qG2pTFtO+GvEtx3SMSB/zPFZyfv7DR
         WZjD+zsdBbTUFyA0LADBtb0zJUAjXamjaw6H3Pwy6ifLoQBcvRXBsrlCq/usGHsuAPLJ
         RN36WRXxZ1peNE8lmu7ivIKj3afE7DiR+S2BNzRiblV+g3JChu0Y9D1mrx6A/gwVP8TB
         rsYPfiSROT8UELnhXj8Te/NpJEgJyGX7cCmcTYGYYlMMFwsz3b++5+iU0JoxqHHOg/r+
         mauw==
X-Forwarded-Encrypted: i=1; AJvYcCWXfdACkUv8jINMXfrBghIJd5kuIHwSbx3h1WzLMQSCDp0KjciW5hB8zDY12nThG/kdVdkF0GVTFxPk5oMX6Plg@lists.infradead.org
X-Gm-Message-State: AOJu0YzKkcET1NPNp2B4sLcrDsrW6/8QRfReOygE5Ho8IJTZq3X6LG9F
	axTpr6cWIfhpkoWkX3eGBHkIlrZh7/q3zJGtZy5RF+4KAceoEIwiEjWxNEvkZGB51z0LJA+P6On
	J22sdhhPiiynczgukcvszXxeMpEYHwx6tu6fEQz7CvPIcGvAV49NkwQugQh9zwsbX5wutbut+fW
	dS+w==
X-Gm-Gg: AeBDievjAh2RRrM0UjrQ6N4Jw2+rQqTbWkF1rJKrmUFzI4Al3wtdH9sJCez5jbsBbir
	37egJ/9Ean2vWzgvUoK0ZnalGhPgg+vekgmVAWdC7VSh3tUZ35BbVpUVKpp+mbszWPY4YTf5EAv
	R3LUEyO8BhhP6Jg92kkkXadBcsXNDHkMklUHax/pikiN/4thvgw1QClagX04s3I/npOi7UTrQfQ
	KhS0QnP5PhVTWtra7FpsfOTpqhNyRh61emcql5S+KwoTr6XF3R7l0CeO3swaGoTk9F2fU82gMnO
	0yS2BEzOasLwtw7co7oHS0YPWh69enPRmWyTFXLHO2LzL9E5oCqKPFcS+obdmDZhJxx8NzfIloM
	TG/DeoRtEq6NXyXJWPlDqZOXDo1TKZOVoSS5UCR1A+vOuLpdycvKt/VnYOgaeXgoGUKq7UvztEH
	hZWH4mNGniX2M=
X-Received: by 2002:a17:903:1a4e:b0:2b0:51f6:d46e with SMTP id d9443c01a7336-2b269c3c5f6mr76030865ad.15.1775125692319;
        Thu, 02 Apr 2026 03:28:12 -0700 (PDT)
X-Received: by 2002:a17:903:1a4e:b0:2b0:51f6:d46e with SMTP id d9443c01a7336-2b269c3c5f6mr76030445ad.15.1775125691854;
        Thu, 02 Apr 2026 03:28:11 -0700 (PDT)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27475ff56sm24425525ad.22.2026.04.02.03.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 03:28:11 -0700 (PDT)
Message-ID: <be011ef1-e938-44ab-80e8-fdbadf5feeb1@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 18:28:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 5/7] qcom-tgu: Add support to configure next action
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
 <20260402092838.341295-6-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260402092838.341295-6-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5MyBTYWx0ZWRfXxdwe/8NfSbNM
 /Mv4yYNRmWfZ6tdydOJcl+sHFiTZ/KebPuGTXicnP4JEtKehOOS+JY7NGG0OMu1l0vb6ap8sZDV
 /SIJ0n+s/ZAz1jHVAfcL/Cq1wmACBKR2bE2anDKCRWvPcak2whhp3y25xsDajpJDcbbeEBcQMVn
 sanWIlI4tP4FT+DFjDkJ5dxXbxBzslw2LCZ0spcs5yknuBviPypq4gWhXRinpEKQiaXQSztQwdV
 UfolnGw/HksmCHX+w2bTdLWVmFORlUG8umWZI3MdUzXFKaYxtWlrwg3HkEaGKAFxls+nv+/jA39
 WhFVfuk7e02UAtDP36hs6hURfInX2cbABUeGCGMhOLvtZqpc+p8+E5cAc9c9Zuhm7A6L4kMn7rs
 CxlGts3QMi3t7oJcZrHIDbi1EB7O8LUZBQHBqTnKO4d6ctWNl4MOMqDxJ5zpRzMh9JQyYFe/0JH
 IKIulygz4B1vMj86gpA==
X-Proofpoint-GUID: Gz_D-nLaW6NpggGrC53PycGt4v4bqMug
X-Proofpoint-ORIG-GUID: Gz_D-nLaW6NpggGrC53PycGt4v4bqMug
X-Authority-Analysis: v=2.4 cv=e9ULiKp/ c=1 sm=1 tr=0 ts=69ce44bd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Ex1FgqpvNLb1JEDmgOQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_032814_665946_DFCA28A2 
X-CRM114-Status: GOOD (  28.77  )
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



On 4/2/2026 5:28 PM, Songwei Chai wrote:
> Add "select" node for each step to determine if another step is taken,
> trigger(s) are generated, counters/timers incremented/decremented, etc.
> 
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 +++
>   drivers/hwtracing/qcom/tgu.c                  | 53 ++++++++++++++++++-
>   drivers/hwtracing/qcom/tgu.h                  | 27 ++++++++++
>   3 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 4ef0d696d3d0..786cb852bbe5 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -21,3 +21,10 @@ KernelVersion:	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the decode mode with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the next action with specific step for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 5b37eb10f863..4112e6a691d6 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -29,6 +29,9 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
>   	case TGU_CONDITION_DECODE:
>   		return step_index * (drvdata->num_condition_decode) +
>   			reg_index;
> +	case TGU_CONDITION_SELECT:
> +		return step_index * (drvdata->num_condition_select) +
> +			reg_index;
>   	default:
>   		break;
>   	}
> @@ -71,6 +74,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
>   	case TGU_CONDITION_DECODE:
>   		return sysfs_emit(buf, "0x%x\n",
>   				drvdata->value_table->condition_decode[index]);
> +	case TGU_CONDITION_SELECT:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->condition_select[index]);
>   	default:
>   		break;
>   	}
> @@ -112,6 +118,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
>   		tgu_drvdata->value_table->condition_decode[index] = val;
>   		ret = size;
>   		break;
> +	case TGU_CONDITION_SELECT:
> +		tgu_drvdata->value_table->condition_select[index] = val;
> +		ret = size;
> +		break;
>   	default:
>   		ret = -EINVAL;
>   		break;
> @@ -146,6 +156,13 @@ static umode_t tgu_node_visible(struct kobject *kobject,
>   		if (tgu_attr->reg_num < drvdata->num_condition_decode)
>   			return attr->mode;
>   		break;
> +	case TGU_CONDITION_SELECT:
> +		/* 'default' register is at the end of 'select' region */
> +		if (tgu_attr->reg_num == drvdata->num_condition_select - 1)
> +			attr->name = "default";
> +		if (tgu_attr->reg_num < drvdata->num_condition_select)
> +			return attr->mode;
> +		break;
>   	default:
>   		break;
>   	}
> @@ -184,6 +201,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   				drvdata->base + CONDITION_DECODE_STEP(i, j));
>   		}
>   	}
> +
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_condition_select; j++) {
> +			index = check_array_location(drvdata, i,
> +						TGU_CONDITION_SELECT, j);
> +			if (index == -EINVAL)
> +				goto exit;
> +
> +			writel(drvdata->value_table->condition_select[index],
> +				drvdata->base + CONDITION_SELECT_STEP(i, j));
> +		}
> +	}
>   	/* Enable TGU to program the triggers */
>   	writel(1, drvdata->base + TGU_CONTROL);
>   exit:
> @@ -223,6 +252,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
>   
>   	devid = readl(drvdata->base + TGU_DEVID);
>   	drvdata->num_condition_decode = TGU_DEVID_CONDITIONS(devid);
> +	/* select region has an additional 'default' register */
> +	drvdata->num_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
>   }
>   
>   static int tgu_enable(struct device *dev)
> @@ -366,6 +397,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
>   	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
>   	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
>   	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(0),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(1),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(2),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(3),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(4),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
>   	NULL,
>   };
>   
> @@ -373,8 +412,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   {
>   	struct device *dev = &adev->dev;
>   	struct tgu_drvdata *drvdata;
> -	unsigned int *priority, *condition;
> -	size_t priority_size, condition_size;
> +	unsigned int *priority, *condition, *select;
> +	size_t priority_size, condition_size, select_size;
>   	int ret;
>   
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -425,6 +464,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	drvdata->value_table->condition_decode = condition;
>   
> +	select_size = drvdata->num_condition_select * drvdata->num_step;
> +
> +	select = devm_kcalloc(dev, select_size,
> +			     sizeof(*(drvdata->value_table->condition_select)),
> +			     GFP_KERNEL);
> +	if (!select)
> +		return -ENOMEM;
> +
> +	drvdata->value_table->condition_select = select;
> +
>   	drvdata->enabled = false;
>   
>   	pm_runtime_put(&adev->dev);
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> index 987ea07bd618..ac46a2875209 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -52,6 +52,7 @@
>   #define STEP_OFFSET 0x1D8
>   #define PRIORITY_START_OFFSET 0x0074
>   #define CONDITION_DECODE_OFFSET 0x0050
> +#define CONDITION_SELECT_OFFSET 0x0060
>   #define PRIORITY_OFFSET 0x60
>   #define REG_OFFSET 0x4
>   
> @@ -63,6 +64,9 @@
>   #define CONDITION_DECODE_STEP(step, decode) \
>   	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
>   
> +#define CONDITION_SELECT_STEP(step, select) \
> +	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
> +
>   #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
>   	(&((struct tgu_attribute[]){ {                                   \
>   		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> @@ -76,6 +80,8 @@
>   			reg_num)
>   #define STEP_DECODE(step_index, reg_num) \
>   	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
> +#define STEP_SELECT(step_index, reg_num) \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
>   
>   #define STEP_PRIORITY_LIST(step_index, priority) \
>   	{STEP_PRIORITY(step_index, 0, priority), \
> @@ -107,6 +113,15 @@
>   	 NULL               \
>   	}
>   
> +#define STEP_SELECT_LIST(n) \
> +	{STEP_SELECT(n, 0), \
> +	 STEP_SELECT(n, 1), \
> +	 STEP_SELECT(n, 2), \
> +	 STEP_SELECT(n, 3), \
> +	 STEP_SELECT(n, 4), \
> +	 NULL               \
> +	}
> +
>   #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>   	(&(const struct attribute_group){\
>   		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> @@ -121,12 +136,21 @@
>   		.name = "step" #step "_condition_decode" \
>   	})
>   
> +#define CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(step)\
> +	(&(const struct attribute_group){\
> +		.attrs = (struct attribute*[])STEP_SELECT_LIST(step),\
> +		.is_visible = tgu_node_visible,\
> +		.name = "step" #step "_condition_select" \
> +	})
> +
 > +

remove extra blank line.

Thanks,
Jie


>   enum operation_index {
>   	TGU_PRIORITY0,
>   	TGU_PRIORITY1,
>   	TGU_PRIORITY2,
>   	TGU_PRIORITY3,
>   	TGU_CONDITION_DECODE,
> +	TGU_CONDITION_SELECT,
>   };
>   
>   /* Maximum priority that TGU supports */
> @@ -142,6 +166,7 @@ struct tgu_attribute {
>   struct value_table {
>   	unsigned int *priority;
>   	unsigned int *condition_decode;
> +	unsigned int *condition_select;
>   };
>   
>   static inline void TGU_LOCK(void __iomem *addr)
> @@ -172,6 +197,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>    * @num_reg: Maximum number of registers
>    * @num_step: Maximum step size
>    * @num_condition_decode: Maximum number of condition_decode
> + * @num_condition_select: Maximum number of condition_select
>    *
>    * This structure defines the data associated with a TGU device,
>    * including its base address, device pointers, clock, spinlock for
> @@ -187,6 +213,7 @@ struct tgu_drvdata {
>   	int num_reg;
>   	int num_step;
>   	int num_condition_decode;
> +	int num_condition_select;
>   };
>   
>   #endif


