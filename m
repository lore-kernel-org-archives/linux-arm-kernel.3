Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BB5D3940E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gcyN/GpR/dCMQqrSmqyH79BAE988FzRe8i1TntIPok=; b=Ii1rWzx/jjr2DI9hagj6l92W28
	tn29ixA9YwOanceVJNfny4ZUQqtRLhE8xjMHDMGcHR8sLgmJv6zKcY7ShPJcjyFekVTiu2yI/E9k6
	7DmBpfhclXhEQZFH30SFCWmNm7zTZnCxrlkx97aQmbvG03C/bsgZCTeNNlTLNwoBM0507vOdJy4lF
	cZ54kRsPC/Z/ZUv0ZVkuV2JiuahVUdkJ5ScOcbNJWppeiuOlFt4Eim5OFJaRV3aT2hPnfelA8iXWG
	gSnOzMkGnXe6h+Cb6ArWwBZB4KmMowaNL6uTYaIZH7ZPpUChiSNvDiVHc1ZRLEme/H9LV8oh+BEhc
	4r8PQg8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FFx-0000000HPCq-0wo7;
	Thu, 02 Apr 2026 10:26:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FFu-0000000HPCT-1CYT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:26:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326k5w31424253
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 10:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/gcyN/GpR/dCMQqrSmqyH79BAE988FzRe8i1TntIPok=; b=JSS/ZwUcPQEZ8vNg
	vvc8t4n+WX+pZGIG6KB17FAWrac/Y24+80Y26vpDgjZXdfBYZyAoZ/iKJaRKH0tv
	ywJl99iT4N+oVforPggJlNx+/ygniX6PBE+PD/CyJNyrkHBpyTWVCbIJR3vaFhup
	3n52M8usjC6QlmwN6kcPyj8CBhrsr0s+/Vm5qSP/hFzRRGTuz2R5A9lXxcXYzdtL
	FluVWwd8pcgiB7dynQ2EwgbZh9sm6FEH+7RomUeQ1qVuW5BkUl1XmRHpgygMoZ/u
	Vb+gGhR166CcKrfNadfBQSdtXsqRMb+Cdx2SJPdPP0MncbtNTUrZTJEe6djJRTRD
	WExIFg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9511c7pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 10:26:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0b57e192bso6659415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 03:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775125588; x=1775730388; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/gcyN/GpR/dCMQqrSmqyH79BAE988FzRe8i1TntIPok=;
        b=D33zUyP/C1Yjgv5VCAg2U6q2Dr+lqRLuAfHs/5KvOqGNU60+0uUeCdHWVdhGPGp3GO
         dznQ4/u3IIT8O2QHf9h5URrBzcSaSe6AAlri4sOl/WVKnh4H90fwu68xvqLIxjOrqj2Y
         ci4UuSH79eR6sjewAeIvBPrwm3oXLlH09fioGB2J9dgqeywlUcxkjf742pRHH0T8gcVr
         Re1L1DftSvhNLUSfvi715LFZYm3hpZPLCp5fwBqpWgB6Sgm0txi+sM6NDDF4yUe+edUV
         4uMn9hGBGXCGNtR5rv6bhIWLnG101VDibc+KB2DB5HOiKtYvNIikL5NKj6+0/DuLo/na
         wpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125588; x=1775730388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gcyN/GpR/dCMQqrSmqyH79BAE988FzRe8i1TntIPok=;
        b=rB7eXCM12dKjVW6lR+iMdnr/uLl3YLhwbPNE3Mqwmtz3pcRdfDx9kNh1CuHJSapIhY
         /H572LB3fZbwBd4X40epAe1AV0P/OS6jpCXgYIb3k7n3CT8FhKO0iPtGB8gUwyjUhUYq
         D2K5bISZOErFZjyQyPRJ7ohm5kJNKS5YfgkFUh5M7V8JrZXaufF0zIGki2+LmrnpU1kS
         xAC9J505v38RgUSarIPQrr5oUA8PqzjClCIs14Ayg6P2jwQa8YIYz9S4vltzWEUAxVsK
         /OZ+iWtGAJ7q23Di49ffawCClHvoiyupQSVH6vz1e4Vp+lUnbPbEjSwbcgwZEb4pxqH9
         94kg==
X-Forwarded-Encrypted: i=1; AJvYcCWiDNvQhm+wduQVYZRD++uZRkmn0HQeX+8i/Vjg9bKvK5Bp6wl4MFXVyIGtRw+q/i/0xVtBOcMYrZwIlL4BH+sQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwXnNY7j85inonDuqiGW6PHZYWnkEQk8g9Nf7/cNU+O7VmMjYWK
	Lqe7KmPs/oWnBSz/JjdE/2u+EfXwJi0/waF3n6BdR+hYtd8j9nTSvNn1MOryMOSQpybmRO/XDC5
	G/F0m/LvXuUzzgDNn65S1yfvklKCrPS/Z7yYtQ6hMW/Cu4RLFB14LrT6bLYvtoYYtkyKvY0rlGs
	JtFw==
X-Gm-Gg: AeBDietsHST9Idoy8TPDve3Zm+0NQ29WknRdaJzYoyF8k4QxHDqfG4HXUSB638V2Gz9
	Wh4XzBYpxS3VUxe18W1K57k6oE6BiobiMjkNAVykRiNWRihtCecowl92YSUqha34DCcfdr5XNol
	Cf2qg3FdSvLDnAtzqenqSAo9Y+B62d8Nwu3DMMBthwbLkiIDEq+pxlAiKq+lHR4m0BX00RnHWix
	TAUezXb9p7WZWD21Xby2Ud49K5cf9aV4mHQZjjgH9Oz9QIJerK8S5+8bDMxdo6z+dVwMUYRbSTj
	lZEZnUpIqIXxSjNie4zangHZyyYRElaScBQt25RmSPCkuKdD7+mUviITwFoVjAuu7CdgHXLkBta
	tGPzKd9mcFvOTbXEzJS2KoCirSWdtMeMEDy7scQcntT6tlG6xrpvBH561QXd2C4BkRJKi949KIu
	/XaUwMVEzFzfY=
X-Received: by 2002:a17:902:d592:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2b269ac58f4mr72100195ad.18.1775125587796;
        Thu, 02 Apr 2026 03:26:27 -0700 (PDT)
X-Received: by 2002:a17:902:d592:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2b269ac58f4mr72099855ad.18.1775125587207;
        Thu, 02 Apr 2026 03:26:27 -0700 (PDT)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472ddd0sm25232485ad.4.2026.04.02.03.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 03:26:26 -0700 (PDT)
Message-ID: <93ac3f1f-830b-4c74-9c3f-30f6c06f7d35@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 18:26:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 6/7] qcom-tgu: Add timer/counter functionality for TGU
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
 <20260402092838.341295-7-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260402092838.341295-7-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5MyBTYWx0ZWRfXxMKCanB30mnv
 O4hVJPG+GpUcsNVWKr9i91rmDqgPJ+GK6eL1u+Fg4Oqbs0ITH3xO/p1/CAoldFgup3i3qcFPQ5j
 SvAoSpuY1sUuBa7Q7NYzuR0k1mX7aaK/RE9+5ndaXNcBKQ51dXbP4+mqPbYvwdPEmzSoQA4yZfC
 rfz0DdjSn9SbqXg7kDng2SLDjwOY0lqundunhdb+Vqc8JUq15au28otJ9afRn7UFqzYJAW1GK0g
 DKS4bhMLX1VcoK0JEgC3zWubsjPP8aqoABs6v6qD8BCo+UqnHmxa5IhcHT4PvpqjEnvJtH5Gg7F
 tY+0FUCrG+YNIITCubT22o6uNdVLW4bM1qas3XZXL+pHAuej7/VzSlKyZSSKOsc9nQOnAAxmILh
 NaHlymL9Ld6olaGIglMjr0+lsEO1EstWl5NK156ZX/FWAgzSjedi4E02jl2bsmSRm/IfeqNtlVg
 6LrUpsSP5jjTnHjpZEg==
X-Proofpoint-GUID: 4-OWte5P1wU0NG9zo9xYSau-0Y54SgVy
X-Proofpoint-ORIG-GUID: 4-OWte5P1wU0NG9zo9xYSau-0Y54SgVy
X-Authority-Analysis: v=2.4 cv=F8pat6hN c=1 sm=1 tr=0 ts=69ce4455 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=x5Cro-eQjQa3ufzbw04A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_032630_480994_6730C7EE 
X-CRM114-Status: GOOD (  26.86  )
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
> Add counter and timer node for each step which could be
> programed if they are to be utilized in trigger event/sequence.
> 
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  14 +++
>   drivers/hwtracing/qcom/tgu.c                  | 116 +++++++++++++++++-
>   drivers/hwtracing/qcom/tgu.h                  |  56 +++++++++
>   3 files changed, 184 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 786cb852bbe5..7a3573e03e27 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -28,3 +28,17 @@ KernelVersion:	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the next action with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the timer value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the counter value with specific step for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 4112e6a691d6..4a529520b428 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -32,6 +32,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
>   	case TGU_CONDITION_SELECT:
>   		return step_index * (drvdata->num_condition_select) +
>   			reg_index;
> +	case TGU_COUNTER:
> +		return step_index * (drvdata->num_counter) + reg_index;
> +	case TGU_TIMER:
> +		return step_index * (drvdata->num_timer) + reg_index;
>   	default:
>   		break;
>   	}
> @@ -77,6 +81,12 @@ static ssize_t tgu_dataset_show(struct device *dev,
>   	case TGU_CONDITION_SELECT:
>   		return sysfs_emit(buf, "0x%x\n",
>   				drvdata->value_table->condition_select[index]);
> +	case TGU_TIMER:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->timer[index]);
> +	case TGU_COUNTER:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->counter[index]);
>   	default:
>   		break;
>   	}
> @@ -122,6 +132,14 @@ static ssize_t tgu_dataset_store(struct device *dev,
>   		tgu_drvdata->value_table->condition_select[index] = val;
>   		ret = size;
>   		break;
> +	case TGU_TIMER:
> +		tgu_drvdata->value_table->timer[index] = val;
> +		ret = size;
> +		break;
> +	case TGU_COUNTER:
> +		tgu_drvdata->value_table->counter[index] = val;
> +		ret = size;
> +		break;
>   	default:
>   		ret = -EINVAL;
>   		break;
> @@ -163,6 +181,18 @@ static umode_t tgu_node_visible(struct kobject *kobject,
>   		if (tgu_attr->reg_num < drvdata->num_condition_select)
>   			return attr->mode;
>   		break;
> +	case TGU_COUNTER:
> +		if (!drvdata->num_counter)
> +			break;
> +		if (tgu_attr->reg_num < drvdata->num_counter)
> +			return attr->mode;
> +		break;
> +	case TGU_TIMER:
> +		if (!drvdata->num_timer)
> +			break;
> +		if (tgu_attr->reg_num < drvdata->num_timer)
> +			return attr->mode;
> +		break;
>   	default:
>   		break;
>   	}
> @@ -213,6 +243,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   				drvdata->base + CONDITION_SELECT_STEP(i, j));
>   		}
>   	}
> +
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_timer; j++) {
> +			index = check_array_location(drvdata, i, TGU_TIMER, j);
> +
> +			if (index == -EINVAL)
> +				goto exit;
> +
> +			writel(drvdata->value_table->timer[index],
> +				drvdata->base + TIMER_COMPARE_STEP(i, j));
> +		}
> +	}
> +
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_counter; j++) {
> +			index = check_array_location(drvdata, i, TGU_COUNTER, j);
> +
> +			if (index == -EINVAL)
> +				goto exit;
> +
> +			writel(drvdata->value_table->counter[index],
> +				drvdata->base + COUNTER_COMPARE_STEP(i, j));
> +		}
> +	}
>   	/* Enable TGU to program the triggers */
>   	writel(1, drvdata->base + TGU_CONTROL);
>   exit:
> @@ -256,6 +310,27 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
>   	drvdata->num_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
>   }
>   
> +static void tgu_set_timer_counter(struct tgu_drvdata *drvdata)
> +{
> +	int num_timers = 0, num_counters = 0;
> +	u32 devid2;
> +
> +	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
> +
> +	if (TGU_DEVID2_TIMER0(devid2))
> +		num_timers++;
> +	if (TGU_DEVID2_TIMER1(devid2))
> +		num_timers++;
> +
> +	if (TGU_DEVID2_COUNTER0(devid2))
> +		num_counters++;
> +	if (TGU_DEVID2_COUNTER1(devid2))
> +		num_counters++;
> +
> +	drvdata->num_timer = num_timers;
> +	drvdata->num_counter = num_counters;
> +}
> +
>   static int tgu_enable(struct device *dev)
>   {
>   	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> @@ -405,6 +480,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
>   	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
>   	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
>   	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
> +	TIMER_ATTRIBUTE_GROUP_INIT(0),
> +	TIMER_ATTRIBUTE_GROUP_INIT(1),
> +	TIMER_ATTRIBUTE_GROUP_INIT(2),
> +	TIMER_ATTRIBUTE_GROUP_INIT(3),
> +	TIMER_ATTRIBUTE_GROUP_INIT(4),
> +	TIMER_ATTRIBUTE_GROUP_INIT(5),
> +	TIMER_ATTRIBUTE_GROUP_INIT(6),
> +	TIMER_ATTRIBUTE_GROUP_INIT(7),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(0),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(1),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(2),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(3),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(4),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(5),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(6),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(7),
>   	NULL,
>   };
>   
> @@ -412,8 +503,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   {
>   	struct device *dev = &adev->dev;
>   	struct tgu_drvdata *drvdata;
> -	unsigned int *priority, *condition, *select;
> -	size_t priority_size, condition_size, select_size;
> +	unsigned int *priority, *condition, *select, *timer, *counter;
> +	size_t priority_size, condition_size, select_size, timer_size, counter_size;
>   	int ret;
>   
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -432,6 +523,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   	tgu_set_reg_number(drvdata);
>   	tgu_set_steps(drvdata);
>   	tgu_set_conditions(drvdata);
> +	tgu_set_timer_counter(drvdata);
>   
>   	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>   	if (ret) {
> @@ -474,6 +566,26 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	drvdata->value_table->condition_select = select;
>   
> +	timer_size = drvdata->num_step * drvdata->num_timer;
> +
> +	timer = devm_kcalloc(dev, timer_size,
> +			    sizeof(*(drvdata->value_table->timer)),
> +			    GFP_KERNEL);
> +	if (!timer)
> +		return -ENOMEM;
> +
> +	drvdata->value_table->timer = timer;
> +
> +	counter_size = drvdata->num_step * drvdata->num_counter;
> +
> +	counter = devm_kcalloc(dev, counter_size,
> +			      sizeof(*(drvdata->value_table->counter)),
> +			      GFP_KERNEL);
> +	if (!counter)
> +		return -ENOMEM;
> +
> +	drvdata->value_table->counter = counter;
> +
>   	drvdata->enabled = false;
>   
>   	pm_runtime_put(&adev->dev);
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> index ac46a2875209..5dfef0afbad6 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -11,6 +11,7 @@
>   #define TGU_LAR		0xfb0
>   #define TGU_UNLOCK_OFFSET	0xc5acce55
>   #define TGU_DEVID		0xfc8
> +#define CORESIGHT_DEVID2	0xfc0
>   
>   #define TGU_DEVID_SENSE_INPUT(devid_val) \
>   	((int)FIELD_GET(GENMASK(17, 10), devid_val))
> @@ -18,6 +19,16 @@
>   	((int)FIELD_GET(GENMASK(6, 3), devid_val))
>   #define TGU_DEVID_CONDITIONS(devid_val) \
>   	((int)FIELD_GET(GENMASK(2, 0), devid_val))
> +#define TGU_DEVID2_TIMER0(devid_val)	\
> +	((int)FIELD_GET(GENMASK(23, 18), devid_val))
> +#define TGU_DEVID2_TIMER1(devid_val)	\
> +	((int)FIELD_GET(GENMASK(17, 13), devid_val))
> +#define TGU_DEVID2_COUNTER0(devid_val)	\
> +	((int)FIELD_GET(GENMASK(11, 6), devid_val))
> +#define TGU_DEVID2_COUNTER1(devid_val)	\
> +	((int)FIELD_GET(GENMASK(5, 0), devid_val))
> +
> +
>   #define TGU_BITS_PER_SIGNAL 4
>   #define LENGTH_REGISTER 32
>   
> @@ -53,6 +64,8 @@
>   #define PRIORITY_START_OFFSET 0x0074
>   #define CONDITION_DECODE_OFFSET 0x0050
>   #define CONDITION_SELECT_OFFSET 0x0060
> +#define TIMER_START_OFFSET 0x0040
> +#define COUNTER_START_OFFSET 0x0048
>   #define PRIORITY_OFFSET 0x60
>   #define REG_OFFSET 0x4
>   
> @@ -67,6 +80,12 @@
>   #define CONDITION_SELECT_STEP(step, select) \
>   	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
>   
> +#define TIMER_COMPARE_STEP(step, timer) \
> +	(TIMER_START_OFFSET + REG_OFFSET * timer + STEP_OFFSET * step)
> +
> +#define COUNTER_COMPARE_STEP(step, counter) \
> +	(COUNTER_START_OFFSET + REG_OFFSET * counter + STEP_OFFSET * step)
> +
>   #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
>   	(&((struct tgu_attribute[]){ {                                   \
>   		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> @@ -82,6 +101,10 @@
>   	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
>   #define STEP_SELECT(step_index, reg_num) \
>   	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
> +#define STEP_TIMER(step_index, reg_num) \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_TIMER, reg_num)
> +#define STEP_COUNTER(step_index, reg_num) \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_COUNTER, reg_num)
>   
>   #define STEP_PRIORITY_LIST(step_index, priority) \
>   	{STEP_PRIORITY(step_index, 0, priority), \
> @@ -122,6 +145,18 @@
>   	 NULL               \
>   	}
>   
> +#define STEP_TIMER_LIST(n) \
> +	{STEP_TIMER(n, 0), \
> +	 STEP_TIMER(n, 1), \
> +	 NULL              \
> +	}
> +
> +#define STEP_COUNTER_LIST(n) \
> +	{STEP_COUNTER(n, 0), \
> +	 STEP_COUNTER(n, 1), \
> +	 NULL                \
> +	}
> +
>   #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>   	(&(const struct attribute_group){\
>   		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> @@ -143,6 +178,19 @@
>   		.name = "step" #step "_condition_select" \
>   	})
>   
> +#define TIMER_ATTRIBUTE_GROUP_INIT(step)\
> +	(&(const struct attribute_group){\
> +		.attrs = (struct attribute*[])STEP_TIMER_LIST(step),\
> +		.is_visible = tgu_node_visible,\
> +		.name = "step" #step "_timer" \
> +	})
> +
> +#define COUNTER_ATTRIBUTE_GROUP_INIT(step)\
> +	(&(const struct attribute_group){\
> +		.attrs = (struct attribute*[])STEP_COUNTER_LIST(step),\
> +		.is_visible = tgu_node_visible,\
> +		.name = "step" #step "_counter" \
> +	})
>   
>   enum operation_index {
>   	TGU_PRIORITY0,
> @@ -151,6 +199,8 @@ enum operation_index {
>   	TGU_PRIORITY3,
>   	TGU_CONDITION_DECODE,
>   	TGU_CONDITION_SELECT,
> +	TGU_TIMER,
> +	TGU_COUNTER

[Nit] TGU_COUNTER,

Thanks,
Jie

>   };
>   
>   /* Maximum priority that TGU supports */
> @@ -167,6 +217,8 @@ struct value_table {
>   	unsigned int *priority;
>   	unsigned int *condition_decode;
>   	unsigned int *condition_select;
> +	unsigned int *timer;
> +	unsigned int *counter;
>   };
>   
>   static inline void TGU_LOCK(void __iomem *addr)
> @@ -198,6 +250,8 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>    * @num_step: Maximum step size
>    * @num_condition_decode: Maximum number of condition_decode
>    * @num_condition_select: Maximum number of condition_select
> + * @num_timer: Maximum number of timers
> + * @num_counter: Maximum number of counters
>    *
>    * This structure defines the data associated with a TGU device,
>    * including its base address, device pointers, clock, spinlock for
> @@ -214,6 +268,8 @@ struct tgu_drvdata {
>   	int num_step;
>   	int num_condition_decode;
>   	int num_condition_select;
> +	int num_timer;
> +	int num_counter;
>   };
>   
>   #endif


