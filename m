Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151A8103E178
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 13:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoJsSdER8bxSYV9EQSeWYeWln+R5FMyjf1qC85N9a3s=; b=p4QDPqR79koLxpHALwmsDLVZW7
	zejKJij6Ip90i3pwBYIbZoajvT4j/ttwkLEXHzcaFRkyVppEkSKZy8dMnib/nF8ZD02C+Y46c1Wfk
	CqHoKxdaJY5Zm5yMGRJS1oMN+dIOmv410mg57lcN/kwWId2NClJnndYV5CIgRvtLiKbzTHie6sDm9
	AQX0rCn0AgaA32zkLIbBPBZTqzbjiKFszkQjD4X/L5mEyJ7RB1zERzELlCxlH68p9N9NZ8N4upLnw
	CVOnUQBrBPTvWNqPNll/SWn/ZzH8fxCWvO1TGGIwBFnLwb99WGdzbdu/iraKANqwTQMOsaVFlJ6tO
	vsQ+cHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rDY-00000008Vmj-22Kx;
	Wed, 18 Mar 2026 13:45:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rDV-00000008Vl5-1Bs0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 13:45:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAhwHD008302
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 13:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UoJsSdER8bxSYV9EQSeWYeWln+R5FMyjf1qC85N9a3s=; b=Grnww/H1VtULtmxg
	iVerOEpO9Nd7mgpJBoM8enQ0tYbZj35J/cusj5heEXUHi0TZOEwWajUk7Up4fx2p
	NdXKFs2aJRd10gk8hiOv0zSO7FVSXZDaRCKmcHMTRojU5juLpgO6ZtKkyqQwMsb/
	DN5YvaEv3/qt9wG7ixd7r2CRQrRpmNOh/SioxrMmgLDSCLvRdBh+zdM3pQj2J8N8
	ED6ldAuLFMGiWb7TccOtUPK6JEjLAoydOOAaOHGC8A1M37Skr737ELTJ/vvhbVCy
	9msBV0Cjh/xo2VFN6tx/H1P+IaoQOpXnj2mm9j+dLk2hGSX1sgSDCs8s36P+fTon
	DgQ7Vg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj50mek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 13:45:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a0998a441so42543721a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 06:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841543; x=1774446343; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UoJsSdER8bxSYV9EQSeWYeWln+R5FMyjf1qC85N9a3s=;
        b=YSziiRkeRhYXrQRG3eI7vR6JEAk1PCDRGWM7g1iav5C8fTqV+Bw0xBXwjF0wPuXNw/
         6rQZyKGg0AG8LCVlvmhClJhnX47crauV3RaP7sBDQp+o9J3kJYnzvORS66Ph+ZnRxfSM
         KTg4KFPI8v3EwnkUjWHwHYEH1mE7EnbajzuE9J9czubyD04oxtWFKyS8D6aA+9ev5lXR
         FhYyUICymxqz6dSVZLfppAcTSeHnvmfxD27cEd8bFMZknu+vR7gqzt3+u7aQn9FOm9KO
         4UK2UJDcETZ4CIHchrTKV+ic7HaOw4xN8zx463hpZw7QffHTNKrWVVhlfgIbIXbvgRbZ
         gs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841543; x=1774446343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoJsSdER8bxSYV9EQSeWYeWln+R5FMyjf1qC85N9a3s=;
        b=emx1NWjjpDO+mFNu7+ceV1sYlgoQHzJPSJGbYvZAzltOXkfkPzkJbK5vheEDj7k3By
         umYlxWdm1MctkCkYdaSonjSlT5ESwJfE/0D/V7MTzbubMvF+4p6foBQU2qAW5SHQT/5u
         jOTaM2xee/nI/HEcmdr3v1rJXGau54q3IH88lSFN7j+agntr5cRufSS2xsYwOW7drzGr
         QEUcjXYA+ya2wBO65FSyeZeNyE9h/Rn1/J2MACVWVqhiA06bdz4iEcG6BYeh2AcvgvoL
         o+HLFTztNFCBiwAVpHedDbk1jYhP5TFeBgYdx/ZOvfPHxdkqLl+u0RnEzDrECnAA8R46
         xXyA==
X-Forwarded-Encrypted: i=1; AJvYcCUK3JUe9ctU08zzxQnvJuBmJD++e5g2+LzRevJxFwx5NjGO8fbV9h8nkxUTdkYzovd1S84UmvLg9yiEKu9cUhrp@lists.infradead.org
X-Gm-Message-State: AOJu0YyoGUpHL7zeItx8b0Y2bkUbC8HM3RVfQ/30nanvcbyCy3Z0BApI
	ng+GJXr4Dz/OvR6yCWcv6AKsR5tNCsckcmxVeAIi/eWpcmdMPA2f/ij3pAD2oERkAkNg/ME9H5U
	Ncd3V9QuyYaXTUYlm7G03qrS/JgvRpgaarFn0P1zca7D1GfximN9wlrzmJRqaMHxpy/tViOaVup
	j3Pg==
X-Gm-Gg: ATEYQzxBpLBSo9lIYKOgbaksVsN0KJgPgmu1h248wCqkU9s3AgIzUW3wqM0mbjj7zf3
	3fD6nJyupBvDKx1ejMjDHXMfHz6kuEictWGOrq3NRwY/KafpEMEzd8iTh/QpgF+MPF6zhpog8Z9
	4dFtb8rWje6zla2P7HHevCI4FhxanNzZzrGSEMbED8KmWgy0yfHiOCg0V0KbwxjZXvne7jqBk4v
	GK/0A9yM6VPq4wRFlQzR+ccZ0iMWatd20Y8mHQqkShvDWQUshyAsCTD/Y+Vgg5FDB8xsciO477u
	uD2ZbhZUNAPg3oerhr3irP2zk35KLEbJTdVY73ZVtNMWgHujiNY0Xq7DuNQtIFwAWPWzBulAFYw
	bm5HthQ21dWuBYTA2Jf+Xyr0w/UAXL2yDIGwaheBLY4ugNyhIEsGtbW+pC6cJLTBPt/NjzbZYf2
	9LXVY2OgkP1QQ=
X-Received: by 2002:a17:90b:2791:b0:359:8c9a:fde9 with SMTP id 98e67ed59e1d1-35bb9e7d3eamr3682382a91.11.1773841543066;
        Wed, 18 Mar 2026 06:45:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2791:b0:359:8c9a:fde9 with SMTP id 98e67ed59e1d1-35bb9e7d3eamr3682329a91.11.1773841542094;
        Wed, 18 Mar 2026 06:45:42 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcb8b9sm8649822a91.13.2026.03.18.06.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:45:41 -0700 (PDT)
Message-ID: <929d0ce6-e414-4d6c-b5e5-7a38e480acbd@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 21:45:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/7] qcom-tgu: Add TGU decode support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
 <20260317032639.2393221-5-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260317032639.2393221-5-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExNiBTYWx0ZWRfXwqweSf7vR/dB
 hSCkbvy7NGTGXcR016igxbW3BEms0nZyh5O/EXDskke7uy8S35evLG17yJCrZSDJkEwUKKlOhWs
 sv9q5fnsiOuuDzdPJhNF4xZZsKpzw4fQonj3mQF7GcgnBm1MNTvzokF8ojiGVNWE7zyaziBF80T
 6FP/ivpjaRt0v10/36+Ep0ZTd8pi+wLHRH94aeiNTA2h4PvC2dagZu4VdgBGcchVyoCFHJKcpsk
 8cp1zEBnvg2U3XTagrjxA23ICIr7ZHLOKN8V9/12eef/fuj9uS/CE6RErHjFc3Q8HhFTIBqiZsa
 4x+MjaheNFMld9M8tmAU45tJii36A18vb40euGn8gqEp82BIdyyq7fhwDyFKH+S9PSrEelR6T7t
 h9D5IIgSxwh5VYyCOxe/Vc1dI/iji+Di+oiHpRpC3iknouEFeYCYewFvRXlsGzIWkLu25vw65K8
 H5WK5pKM5yO7fHTyX2w==
X-Proofpoint-ORIG-GUID: tlc9x6Jn2tKyc_rQIhoDIULhnuWcUrK-
X-Proofpoint-GUID: tlc9x6Jn2tKyc_rQIhoDIULhnuWcUrK-
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69baac88 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wg8t7fkb2t0BE43u6skA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_064545_458621_8436231D 
X-CRM114-Status: GOOD (  28.87  )
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



On 3/17/2026 11:26 AM, Songwei Chai wrote:
> Decoding is when all the potential pieces for creating a trigger
> are brought together for a given step. Example - there may be a
> counter keeping track of some occurrences and a priority-group that
> is being used to detect a pattern on the sense inputs. These 2
> inputs to condition_decode must be programmed, for a given step,
> to establish the condition for the trigger, or movement to another
> steps.
> 

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>   drivers/hwtracing/qcom/tgu.c                  | 157 +++++++++++++++---
>   drivers/hwtracing/qcom/tgu.h                  |  27 +++
>   3 files changed, 170 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index a1dfcd366d92..18930743c99f 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -14,3 +14,10 @@ KernelVersion	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the sensed signal with specific step and priority for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
> +Date:		March 2026
> +KernelVersion	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the decode mode with specific step for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 14d6ad410d89..85fe1140eab5 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -18,8 +18,33 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
>   				    int step_index, int operation_index,
>   				    int reg_index)
>   {
> -	return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
> -		step_index * (drvdata->num_reg) + reg_index;
> +	switch (operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		return operation_index * (drvdata->num_step) *
> +			(drvdata->num_reg) +
> +			step_index * (drvdata->num_reg) + reg_index;
> +	case TGU_CONDITION_DECODE:
> +		return step_index * (drvdata->num_condition_decode) +
> +			reg_index;
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int check_array_location(struct tgu_drvdata *drvdata, int step,
> +				int ops, int reg)
> +{
> +	int result = calculate_array_location(drvdata, step, ops, reg);
> +
> +	if (result == -EINVAL)
> +		dev_err(drvdata->dev, "check arrary location - Fail\n");
> +
> +	return result;
>   }
>   
>   static ssize_t tgu_dataset_show(struct device *dev,
> @@ -30,12 +55,26 @@ static ssize_t tgu_dataset_show(struct device *dev,
>   			container_of(attr, struct tgu_attribute, attr);
>   	int index;
>   
> -	index = calculate_array_location(drvdata, tgu_attr->step_index,
> -					 tgu_attr->operation_index,
> -					 tgu_attr->reg_num);
> -
> -	return sysfs_emit(buf, "0x%x\n",
> -			  drvdata->value_table->priority[index]);
> +	index = check_array_location(drvdata, tgu_attr->step_index,
> +			tgu_attr->operation_index, tgu_attr->reg_num);
> +
> +	if (index == -EINVAL)
> +		return index;
> +
> +	switch (tgu_attr->operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->priority[index]);
> +	case TGU_CONDITION_DECODE:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->condition_decode[index]);
> +	default:
> +		break;
> +	}
> +	return -EINVAL;
>   }
>   
>   static ssize_t tgu_dataset_store(struct device *dev,
> @@ -54,13 +93,31 @@ static ssize_t tgu_dataset_store(struct device *dev,
>   		return ret;
>   
>   	guard(spinlock)(&tgu_drvdata->lock);
> -	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
> +	index = check_array_location(tgu_drvdata, tgu_attr->step_index,
>   					 tgu_attr->operation_index,
>   					 tgu_attr->reg_num);
>   
> -	tgu_drvdata->value_table->priority[index] = val;
> +	if (index == -EINVAL)
> +		return index;
> +
> +	switch (tgu_attr->operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		tgu_drvdata->value_table->priority[index] = val;
> +		ret = size;
> +		break;
> +	case TGU_CONDITION_DECODE:
> +		tgu_drvdata->value_table->condition_decode[index] = val;
> +		ret = size;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
>   
> -	return size;
> +	return ret;
>   }
>   
>   static umode_t tgu_node_visible(struct kobject *kobject,
> @@ -77,13 +134,26 @@ static umode_t tgu_node_visible(struct kobject *kobject,
>   	if (tgu_attr->step_index >= drvdata->num_step)
>   		return SYSFS_GROUP_INVISIBLE;
>   
> -	if (tgu_attr->reg_num >= drvdata->num_reg)
> -		return 0;
> +	switch (tgu_attr->operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		if (tgu_attr->reg_num < drvdata->num_reg)
> +			return attr->mode;
> +		break;
> +	case TGU_CONDITION_DECODE:
> +		if (tgu_attr->reg_num < drvdata->num_condition_decode)
> +			return attr->mode;
> +		break;
> +	default:
> +		break;
> +	}
>   
> -	return attr->mode;
> +	return 0;
>   }
>   
> -static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
> +static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   {
>   	int i, j, k, index;
>   
> @@ -91,8 +161,10 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   	for (i = 0; i < drvdata->num_step; i++) {
>   		for (j = 0; j < MAX_PRIORITY; j++) {
>   			for (k = 0; k < drvdata->num_reg; k++) {
> -				index = calculate_array_location(
> +				index = check_array_location(
>   							drvdata, i, j, k);
> +				if (index == -EINVAL)
> +					goto exit;
>   
>   				writel(drvdata->value_table->priority[index],
>   					drvdata->base +
> @@ -100,9 +172,23 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   			}
>   		}
>   	}
> +
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_condition_decode; j++) {
> +			index = check_array_location(drvdata, i,
> +						TGU_CONDITION_DECODE, j);
> +			if (index == -EINVAL)
> +				goto exit;
> +
> +			writel(drvdata->value_table->condition_decode[index],
> +				drvdata->base + CONDITION_DECODE_STEP(i, j));
> +		}
> +	}
>   	/* Enable TGU to program the triggers */
>   	writel(1, drvdata->base + TGU_CONTROL);
> +exit:
>   	TGU_LOCK(drvdata->base);
> +	return index >= 0 ? 0 : -EINVAL;
>   }
>   
>   static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
> @@ -131,18 +217,28 @@ static void tgu_set_steps(struct tgu_drvdata *drvdata)
>   	drvdata->num_step = TGU_DEVID_STEPS(devid);
>   }
>   
> +static void tgu_set_conditions(struct tgu_drvdata *drvdata)
> +{
> +	u32 devid;
> +
> +	devid = readl(drvdata->base + TGU_DEVID);
> +	drvdata->num_condition_decode = TGU_DEVID_CONDITIONS(devid);
> +}
> +
>   static int tgu_enable(struct device *dev)
>   {
>   	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
>   
>   	guard(spinlock)(&drvdata->lock);
>   	if (drvdata->enabled)
>   		return -EBUSY;
>   
> -	tgu_write_all_hw_regs(drvdata);
> -	drvdata->enabled = true;
> +	ret = tgu_write_all_hw_regs(drvdata);
> +	if (!ret)
> +		drvdata->enabled = true;
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static void tgu_do_disable(struct tgu_drvdata *drvdata)
> @@ -252,6 +348,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
>   	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
>   	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
>   	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(0),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(1),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(2),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(3),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(4),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
>   	NULL,
>   };
>   
> @@ -259,8 +363,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   {
>   	struct device *dev = &adev->dev;
>   	struct tgu_drvdata *drvdata;
> -	unsigned int *priority;
> -	size_t priority_size;
> +	unsigned int *priority, *condition;
> +	size_t priority_size, condition_size;
>   	int ret;
>   
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -278,6 +382,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	tgu_set_reg_number(drvdata);
>   	tgu_set_steps(drvdata);
> +	tgu_set_conditions(drvdata);
>   
>   	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>   	if (ret) {
> @@ -300,6 +405,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	drvdata->value_table->priority = priority;
>   
> +	condition_size = drvdata->num_condition_decode * drvdata->num_step;
> +
> +	condition = devm_kcalloc(dev, condition_size,
> +				sizeof(*(drvdata->value_table->condition_decode)),
> +				GFP_KERNEL);
> +	if (!condition)
> +		return -ENOMEM;
> +
> +	drvdata->value_table->condition_decode = condition;
> +
>   	drvdata->enabled = false;
>   
>   	pm_runtime_put(&adev->dev);
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> index df570c89ffd7..987ea07bd618 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -16,6 +16,8 @@
>   	((int)FIELD_GET(GENMASK(17, 10), devid_val))
>   #define TGU_DEVID_STEPS(devid_val) \
>   	((int)FIELD_GET(GENMASK(6, 3), devid_val))
> +#define TGU_DEVID_CONDITIONS(devid_val) \
> +	((int)FIELD_GET(GENMASK(2, 0), devid_val))
>   #define TGU_BITS_PER_SIGNAL 4
>   #define LENGTH_REGISTER 32
>   
> @@ -49,6 +51,7 @@
>    */
>   #define STEP_OFFSET 0x1D8
>   #define PRIORITY_START_OFFSET 0x0074
> +#define CONDITION_DECODE_OFFSET 0x0050
>   #define PRIORITY_OFFSET 0x60
>   #define REG_OFFSET 0x4
>   
> @@ -57,6 +60,9 @@
>   	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
>   	 REG_OFFSET * reg + STEP_OFFSET * step)
>   
> +#define CONDITION_DECODE_STEP(step, decode) \
> +	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
> +
>   #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
>   	(&((struct tgu_attribute[]){ {                                   \
>   		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> @@ -68,6 +74,8 @@
>   #define STEP_PRIORITY(step_index, reg_num, priority)                     \
>   	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
>   			reg_num)
> +#define STEP_DECODE(step_index, reg_num) \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
>   
>   #define STEP_PRIORITY_LIST(step_index, priority) \
>   	{STEP_PRIORITY(step_index, 0, priority), \
> @@ -91,6 +99,14 @@
>   	 NULL                   \
>   	}
>   
> +#define STEP_DECODE_LIST(n) \
> +	{STEP_DECODE(n, 0), \
> +	 STEP_DECODE(n, 1), \
> +	 STEP_DECODE(n, 2), \
> +	 STEP_DECODE(n, 3), \
> +	 NULL               \
> +	}
> +
>   #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>   	(&(const struct attribute_group){\
>   		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> @@ -98,11 +114,19 @@
>   		.name = "step" #step "_priority" #priority \
>   	})
>   
> +#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
> +	(&(const struct attribute_group){\
> +		.attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
> +		.is_visible = tgu_node_visible,\
> +		.name = "step" #step "_condition_decode" \
> +	})
> +
>   enum operation_index {
>   	TGU_PRIORITY0,
>   	TGU_PRIORITY1,
>   	TGU_PRIORITY2,
>   	TGU_PRIORITY3,
> +	TGU_CONDITION_DECODE,
>   };
>   
>   /* Maximum priority that TGU supports */
> @@ -117,6 +141,7 @@ struct tgu_attribute {
>   
>   struct value_table {
>   	unsigned int *priority;
> +	unsigned int *condition_decode;
>   };
>   
>   static inline void TGU_LOCK(void __iomem *addr)
> @@ -146,6 +171,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>    * @value_table: Store given value based on relevant parameters
>    * @num_reg: Maximum number of registers
>    * @num_step: Maximum step size
> + * @num_condition_decode: Maximum number of condition_decode
>    *
>    * This structure defines the data associated with a TGU device,
>    * including its base address, device pointers, clock, spinlock for
> @@ -160,6 +186,7 @@ struct tgu_drvdata {
>   	struct value_table *value_table;
>   	int num_reg;
>   	int num_step;
> +	int num_condition_decode;
>   };
>   
>   #endif


