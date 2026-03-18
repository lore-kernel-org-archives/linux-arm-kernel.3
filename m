Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A326103E17D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 13:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rs3adY8XZxdJZ63cmDfT1emW51/t4hrCf8SyLtSagyQ=; b=Ym8PZ+14uA4r7Tp6cDunRVPehH
	8+V6vCG6+rA6phPAleFXT0uytgYj9ZcAkMnq/8rmgAnHkM4Que6SgNnyByIkUbKmsbCzQuf9UIHrw
	x4neGdDKCwrhcMrsxCnkDFl4uHcyizfcxYzfd1ZzJk47AkYbWPGNz72fB3cWvBT8tS+ApmRgjVTme
	5Tk4UdDL5ClMNozhMN3QBSKtdP/te1gRT+k7bYw+atV2wtaOCYFRCfhTigsBVXA51F90z8UbOcx7P
	AAquN9NQX7ZVCrwLDFGf6XMgwnMy8U76CVJ+3gZhZGXo1lXRqac1fz0mFf9mD2et94F/+w85VGfH3
	Vajinn7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rGu-00000008WNt-0S2U;
	Wed, 18 Mar 2026 13:49:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rGs-00000008WN4-1ddl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 13:49:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8A4Rg2789425
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 13:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rs3adY8XZxdJZ63cmDfT1emW51/t4hrCf8SyLtSagyQ=; b=O7VF3BRWrG/KQdFQ
	E6cLNat3VbaSpuAvj0HJq2QIarYnzfbrci/C1MQ/NRDVEkzzLeJ/NnMuSWBLNszT
	UQTQFvdWJMsJtPG+oEPcSF1QvcZlRHY7ITzhvWn//meNpPqaPu8vMBdYd/gtJgAY
	czDD4tJgZrAI+2eC7xZvwY+UjzKIByKvzDnpU5K2gOJvo4YT5jkv63hm+4kFYVsy
	G0xiS4LpIyWRBNz8pCLLaTJno8lQAA0AEBjEJ12Ie32h+VKjgrXf6gzdlsnlVM2Y
	LmYVaVcenFusdqaRB4YRaODI8zDWpAe8qIUHYm+kkWIBvlrtuH5PqpZ7MDohhXtk
	b7hQkQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g2s22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 13:49:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-359fe4e9ea7so842241a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 06:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841753; x=1774446553; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rs3adY8XZxdJZ63cmDfT1emW51/t4hrCf8SyLtSagyQ=;
        b=SDTZ1VEEy3lwZnQselLQpvHajam501w5ij0+Jf9FlsfwuE9x4J6Aw4PLthiVciZDTh
         VoOyRkrhz0pRBa4cMMslU6LNwSGjrvU2MVj2PzJHGuN12t11awS0lPA8WDkgPMKg1nLA
         UzkYX39OPxhpEoLvWfrJU7kZIFXOWWbBjQj3ovFPnktBGYriyrkQEAsVXKIYLlBPKo0x
         QRVwZhH3Ww4DIR/T3kD4Ff/PMhF0BENrJy0Wh+8SFQ1u3UTGooO54k7Bn42DlZ7vwIUE
         WBUdKoeOhwQhT14IPBEBtzcBOP0XFNpSxxBdgIX9d3SPWpixtahl8/lW9Vp6CMzkNViw
         PRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841753; x=1774446553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rs3adY8XZxdJZ63cmDfT1emW51/t4hrCf8SyLtSagyQ=;
        b=MfxtXEfhLcr6NroAJ24e42621ibY2yEZ7/Q5w6BR609Prr3aESUArmT9XMw/3iuhKK
         k6figSxjqjKMAfjCakVb91kW+TSw5X1cwdU10vWxMeZVv5YTOW92uPauajXSnNg2+ZLL
         IQjKXvfEq0FdqujzqkQ9IesQonzQ/R/N44cCYPSf4axUhbOeRy3nLy1kR2btAkL/Z59z
         nHnmpwfGalIe0B1Iu64rW3p6TnfA2KaURnvFSWAyXFhF/ThRRQhH2wM/sLBHgN5sQgzx
         73vn9oNlA9fFK6gQ8mqMbypxzWaBeN8E4wzxqD7KzCiCwhCxx2pLIGdASMQhT9II/Jcz
         YhQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoAzE+9MiyX9ZQivePweqJHwGnDZLBp0MUzVGIq01Ug83kzpPbY1nphj0gik90G/uRDbGz1ywx3Tvms1lz0Eo/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5zXWsMhS9nxuJpwt6zGO5apuK37i+vpzijPFp9CKf8mYZBuwH
	a0niGVfH8YyCfW4WN+NcL01zennWn6MUfZtncPp6Hj0zKeIAOnY928WZ4B9plScNAXXVQyNtDzr
	P7Ml0IYtPsBt4v+fyFLF5VaY8LSujl+Hxtc6LvAzNNdmsMuw4YhtfV3PUjnjHjfFzRYVwj6s5+w
	urKA==
X-Gm-Gg: ATEYQzzDJsZX0JlJWPVcKLC0dm0/Vjf1EePb1KO7mIdEuKZxiUJyN5PlzIeSrE3fPjF
	+uKah7EqF5FA0U4OSdZucQWDPudrc/Npn6GkMzDnz9zIqTXguynvG/ed3pp+4LcS6ZaDeqmnNoS
	qgD/F6aStCZ5WC7kc2KnOn4djrCyJ9pdb7sSHsnK1lklDs3p8e/1zpA8lvkVRkDvok2m/MG373P
	kGsJkZaYd5CcWn0KuuiBFTuiLj+a/Ib6be/amLCv5yCEaFSKEjXEmcbD5gwIAQ+cmSRUu6bzrk+
	/16oNxAzgzJmkoovhLSbY946AHGtUCskdD77EO6AQTitL1+g/ewqob602Zed9Sut3cxXlq46jNz
	FLGVSFTfBFLIzm5n2BhiX//3SQo25F75qLIOcUiTZHabJwrLwnAj7DmnEizup+IBI8XzyaA1l55
	C2fiy7mMp67A0=
X-Received: by 2002:a17:90b:2b50:b0:35b:a656:a614 with SMTP id 98e67ed59e1d1-35bb9f34357mr2884243a91.21.1773841753135;
        Wed, 18 Mar 2026 06:49:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2b50:b0:35b:a656:a614 with SMTP id 98e67ed59e1d1-35bb9f34357mr2884212a91.21.1773841752605;
        Wed, 18 Mar 2026 06:49:12 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e0b3c43sm2698912a12.4.2026.03.18.06.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:49:12 -0700 (PDT)
Message-ID: <2bb28022-e77c-4459-8b03-6ee7713798e7@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 21:49:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/7] qcom-tgu: Add timer/counter functionality for TGU
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
 <20260317032639.2393221-7-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260317032639.2393221-7-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69baad59 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=x5Cro-eQjQa3ufzbw04A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: fwiV8GbIdnHULYpi4Zd5ikacNy0yTaC_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExNyBTYWx0ZWRfX9iKlUAneeWms
 zfAGFxj8HSl5CxVxJLf+PX5QZ8vWVn8128CW3S4w3Ihcj4Yo0Y5NpJRy5R6+5NVfZoE7v8+wwPQ
 BLzgvo8cjoJfO4EFORjRRJYxduPSd4kLhAGRL3sFdgghFFvyB9KI40BONAZw4+aCaxD7d43BO4S
 /kZXJIj5tLNYBFQhIz7GqDf8PUNZ4vAgfIwQBnxoleTGNft9J5AYKw4/HffsOMk1qmM4g9d/0tu
 7QHJLzFZqvLQSCnhSV0AS+NlFHV8gdGGQK6DrJ2vG3vSOw9JXM5mHlJjxYwqMvF5KFlFitw6ZYA
 7bqN+maqRdVcY2dyq8Br426bjmDaKk8Z2CxABjM7ohcU7razme8fkXXEC6UsdijqvqrGJN5sog7
 SfwB4imz0fwOKixuIB3c70CKZre+nNtcMtTqPY1BbTfBaP7Gv6NGF6ZIwAg7h//0XFtzqUAd/te
 jHAf4kL9AVsVecJUTXA==
X-Proofpoint-GUID: fwiV8GbIdnHULYpi4Zd5ikacNy0yTaC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_064914_449695_A5E09B45 
X-CRM114-Status: GOOD (  26.55  )
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
> Add counter and timer node for each step which could be
> programed if they are to be utilized in trigger event/sequence.
> 

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  14 +++
>   drivers/hwtracing/qcom/tgu.c                  | 116 +++++++++++++++++-
>   drivers/hwtracing/qcom/tgu.h                  |  56 +++++++++
>   3 files changed, 184 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index d8431a82574a..5370882333bc 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -28,3 +28,17 @@ KernelVersion	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the next action with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
> +Date:		March 2026
> +KernelVersion	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the timer value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
> +Date:		March 2026
> +KernelVersion	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the counter value with specific step for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 1d996b9e303a..4539415571f6 100644
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
> @@ -395,6 +470,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
> @@ -402,8 +493,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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
> @@ -422,6 +513,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   	tgu_set_reg_number(drvdata);
>   	tgu_set_steps(drvdata);
>   	tgu_set_conditions(drvdata);
> +	tgu_set_timer_counter(drvdata);
>   
>   	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>   	if (ret) {
> @@ -464,6 +556,26 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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


