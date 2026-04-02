Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05A2D39406
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9IPPUPQv3jw5OO1P9dXF+EHN5oJqE82fBLDJkfRkCo=; b=F/BiXbrgS2f0+lyTUiGgft27+n
	UmYF9MCFbiRLOl0rRFThh+J5nRju8tBmqt3n9kqm90LqZzUy/HRZp73g6J5VOE1AqkOy0xtgqvJyr
	Vm49fq9/1dwo++C/walCFzBcxB703E442y0QLHF4uQpvKIrEA7//4Djx+KnLHtlpkmGir3HzBHoQD
	YsK5gVsC6N+uJokDnE3ZlhtJk5AMj2UPeDYek7IVfi8mSlxsOF4j/OBX67UhDzUVQ3IIvci6Esk/P
	oOTfFPNbbU9mWuIKXA+JlD9MIUyR5N/5PSiTlmx5WMoQyEpS8xKnIf07eMCt+0SCIwPTfMiB8Sv25
	WMSExMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EtC-0000000HKxF-0bmf;
	Thu, 02 Apr 2026 10:03:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Et9-0000000HKwk-3N31
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 10:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=m9IPPUPQv3jw5OO1P9dXF+EHN5oJqE82fBLDJkfRkCo=; b=qpVF0VZt+GcpLk15lCs7+8lMSw
	3lsOcNcEwvqrhstby4m6svBiP5D+fhGoYzcDgyIwcLmU9lP+gco+ZVDz8SBRhmeVLBFqW8IdJ54Ny
	mTBrtUAzOqcP7Qfnjj9fA2cxVdzwmVVcukYVWjUm3xcRd2b9y5mHQZXolzksdz/BIaR7dytelsv96
	jMJKKMvGmCJ3K29uPkydipUbBbas7EcRGmTjww4OtS+u9X2bflkN6LB8FuavmWh49Mb8g0gUxAnZP
	q/kz/QJoIaL3czg5SEIzT1uIoEwn6Y6bwyNgD+dwP51HGtN6OWKQOfipnUe/UwET1JJPDMpFqVP+o
	FdCN34Vw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Et6-00000002C8h-0TRD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:02:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328dAao1249508
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 10:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m9IPPUPQv3jw5OO1P9dXF+EHN5oJqE82fBLDJkfRkCo=; b=N8Yv2rmOsEDL9Kj5
	yZpTFSwCTunZbPvXhIJ1gMIVEokpOU0LQ+HeccfPCs7hqJlJbX6lx7wecLzV06YR
	xCDITt/Viy+xzy0WVlGFfLUnd1Y6eeUtE4IgwWxoFDUeMoigCRnyMFgA0uwvO9Rv
	wxZLgQAJnMS9bE9jzCBnLXFjyH4e96x09ikMR5MS+kYjO71SSqQWTzLeTlzziMQl
	l5Y6QaiBwkHYI5RzBaehHJ9YWnFxyhDyC4Y+TGrpe3pFYxMeeLX1bMA4Q7PSdtJh
	QCSWiNW9+UCJdFT/Iyk4Zx5sxOfV/7ph8C8QNJCY48hUrJf0PXQD08CcYSd6OoGN
	QbXRSg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t0ay9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 10:02:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35c1107da15so766673a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 03:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775124171; x=1775728971; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m9IPPUPQv3jw5OO1P9dXF+EHN5oJqE82fBLDJkfRkCo=;
        b=d6w5JsDSGo4IDbPDp7/mdHcWn9/xClwCfHL5eCt5pX63HvIqjwFZDZ3z25GWhHSKiB
         S18WMTCvaVo+EIPSSL7oQmUGsVIKdrs9/PtreqstxdTbLUkA9cjkwzw5mRSKLLEG2JiR
         Rkkw+6NGPBk4A2iuZcFkXYrl1ALDB1kU4jEXiZCgA2HCWdjlZx9LQl0bZ887Rbcsctjg
         Pq0Zk7r+kfqZQfv1gb71oT1wnUwf+/qqrD+TihQGtNF6Lr19koisibkTNF2uYXaSj6fV
         zsl5sLzxE0C+16VDQDribMJ1ai7gGafJCk4ZssKOFfdwUlDRtRr9/fVJDYMllyWGHIu5
         ETfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775124171; x=1775728971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9IPPUPQv3jw5OO1P9dXF+EHN5oJqE82fBLDJkfRkCo=;
        b=pDnrT7rZyL9HqZEafiAhZXUzk6xvl9p8KgX6U7iH0CbWWNbrbgHx3Jj466JxgrWcT8
         Xe61zoY2KfkjHXYLzEe70lBMzO0K0kpE31hgacDMvOHcf8kT+2AuoLdfkjrmDJ/45TyY
         PyFbXK/FD4IiOcewWNJ24zKp+etsHBgENFm2ys6mYgHtVAfskh+EvbqTasGaYwihtZqx
         hA3kV3t3bfFMQpV1FIg+pL7roTeXgnqXJwwveg87+nosx1twgtTGomufXXlVx+oYN7Sy
         rnQ1RqueM3y0y/XBRuRz2v8415sxGxrpiphkzTWSibyX5g2M6JfXwPR+mf1Br+GXGjjZ
         TXAA==
X-Forwarded-Encrypted: i=1; AJvYcCUxBKXocKHiOh924Yf+iJnwUoFxIwvmPAVXT+aVKV6fpNmX2ND953MBzrIKsW7L8os1/+l7HpDxpzVQUgtYLV9J@lists.infradead.org
X-Gm-Message-State: AOJu0YyzzfcsvG0mffF6bb17LMqW1X90PUsQReCnXR5M1ewTDyZN1LCE
	DvniWXhTkap6yUBrlHtAd7Aq0B6LRyg8+2XxB+hBJvTjhrrRzkeEwJ9GS+8U0xOdUcgeISerkSk
	P4OJjWBNfEhG1CUmtH1uBSdK++ARoqyfjSjf4FGJhBbyvUwYpLTAGxrQV52r5m4bpPN9CV7m+1Z
	HOFA==
X-Gm-Gg: AeBDietoxQ6w8rNIMc1gXEA3uXf99tk3dtLDvuiraD9XA9CYUJsBcYilFpLOLnFipLi
	+49QTydUJYOZEQ00GXIVH2yklwfhu3oQRsKeZl0JqWQGg0T2H8Xof/viD2tm8Ltg90ot+EW8i/I
	6UQCXej6w+6SeDYfNY2jwGWSfB5zRJQhtZQiVKTApk83WGAwEyKDeQ8Zy8oWTmeIXidDOg8orQf
	DhUCREBJLf0I+MdUAhO8cRBlnaFqxd68LvCPxlCNb8xdhKJfnexx/8D1j+ItCsDcgNzGurmGdOR
	xFgDn/7Ud9MtviA/1HwHffuAhi2aNcNCcdJnmsAXwLHGbBZ12yPBfIk10W4aI5yn68GJ9zXchg4
	CgtTzQvXwYi01ya7B5/cIeauIGdU9K7q8WE3qpcaC1MoMZQora7C5sX8HEamvWC98TD7sg/7Vkw
	SNApE5jF24198=
X-Received: by 2002:a17:90b:2887:b0:35d:8e4d:23a8 with SMTP id 98e67ed59e1d1-35dd40bd502mr2545610a91.15.1775124171034;
        Thu, 02 Apr 2026 03:02:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2887:b0:35d:8e4d:23a8 with SMTP id 98e67ed59e1d1-35dd40bd502mr2545557a91.15.1775124170389;
        Thu, 02 Apr 2026 03:02:50 -0700 (PDT)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6491157sm2048651a12.9.2026.04.02.03.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 03:02:50 -0700 (PDT)
Message-ID: <e0680ed3-4529-4da6-bf62-fd5f460e1be7@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 18:02:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 4/7] qcom-tgu: Add TGU decode support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
 <20260402092838.341295-5-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260402092838.341295-5-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2KXQT9G9wYfYP2o7nrksVO1oEB2aGZFc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5MCBTYWx0ZWRfXzG70vN2Ea1DH
 9P3ZckkAhAM28s8Gjytdz2Yhc9hKSsrETP/hR17QP0xTadHMwcn+MT6sHynQNms/v8pdeUMQOaT
 5AFEppavaiwTHyn0lN3smC9mtaOS0AlCxxLaLOxfPiyh/d5TpkCO8lUX2/mX+YgJ4fGC4aflT+r
 m04i2sYelNhsjA1RDmJ/RU8pEu53J0HL133PqJG4nXQm1oPsiB9/Cmcq8Q9DC9LjQ+qFUeCUwWp
 j0sW+7FFuwYwupTnUmZ7AWLXBylSIJCFdT/1s47djvQKRy9UgbbOA0dUm9s+GrNNsYhnMjbEANK
 9Ir3iExb7HPhOJXzuwjdKKgBh6EeHM8hBSetQ1l/EQ4vRoYlRlpmPA/HQdUItORsr3Fp7Fmd4hQ
 yNbiaKV/SQSMto4d/kh3KZ4y1pnGteWDoYHXE82onrDNQbjkWH2ez/z0ELAPfW6C1n5JjasdciW
 VlaU64FFfK7xOTPDoFQ==
X-Proofpoint-GUID: 2KXQT9G9wYfYP2o7nrksVO1oEB2aGZFc
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69ce3ecb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Zw-1Wp-visFawXo776gA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_110256_825266_41E4BAB3 
X-CRM114-Status: GOOD (  29.42  )
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
> Decoding is when all the potential pieces for creating a trigger
> are brought together for a given step. Example - there may be a
> counter keeping track of some occurrences and a priority-group that
> is being used to detect a pattern on the sense inputs. These 2
> inputs to condition_decode must be programmed, for a given step,
> to establish the condition for the trigger, or movement to another
> steps.
> 
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>   drivers/hwtracing/qcom/tgu.c                  | 157 +++++++++++++++---
>   drivers/hwtracing/qcom/tgu.h                  |  27 +++
>   3 files changed, 170 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 223873789ca6..4ef0d696d3d0 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -14,3 +14,10 @@ KernelVersion:	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the sensed signal with specific step and priority for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the decode mode with specific step for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 7d69986c3e3d..5b37eb10f863 100644
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

s/arrary/array

Thanks,
Jie

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
> @@ -131,16 +217,26 @@ static void tgu_set_steps(struct tgu_drvdata *drvdata)
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
> -	drvdata->enabled = true;
>   
> -	tgu_write_all_hw_regs(drvdata);
> +	ret = tgu_write_all_hw_regs(drvdata);
> +	if (!ret)
> +		drvdata->enabled = true;
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static void tgu_do_disable(struct tgu_drvdata *drvdata)
> @@ -262,6 +358,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
> @@ -269,8 +373,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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
> @@ -288,6 +392,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	tgu_set_reg_number(drvdata);
>   	tgu_set_steps(drvdata);
> +	tgu_set_conditions(drvdata);
>   
>   	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>   	if (ret) {
> @@ -310,6 +415,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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


