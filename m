Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B7F103E17D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stQl8kSgW1OgtxrwaRnPe7q/fue3covbszl4JlVIBiA=; b=QHE9OPeZt8RFp3Vput4cNfWe1J
	FndtsEyty1DWOLd8FubF/x2qmAeMvmOJj0ue8Vh76CrqbxRG+Pc8/Yn5lonj84q/2OtCSapRa6zsE
	dXh/hNCBb3Pu5bwmqFpVASKOiIr9kMSLfYNDYJYMO3NlUV/EjJu/eCenrja3KKMjzm/pYteadI4iU
	B2rqBgI59ujeIOe5Ceyc1u/Fim8s1kplFxvPpj2gqr3t5Aa4OuqFGBbTenmBx71ljUDg0Xa5vVawr
	MVoKrd7ECr48ptfXEEUM0T8guREHMnucObEz05Ndhve0Z+HI8FvcL3mgUeON501SRz6FXnW8bW8wF
	SYsTGesw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rFg-00000008W8g-1g4U;
	Wed, 18 Mar 2026 13:48:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rFd-00000008W7q-1wvn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 13:47:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAhxEw008446
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 13:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	stQl8kSgW1OgtxrwaRnPe7q/fue3covbszl4JlVIBiA=; b=iG7y6riakr//kT3C
	ksVATukZIv/g3d9QOdxdvX+u/JVpI841Wl4RGu8pj+AU5bccIAYtODT6FTXS/VN7
	09vxi+8LqazLfxucg9Nk8zSdCtJgE5vrlz5Jcm03MDcsBGGuTm30xsIYj08jtq5m
	p3M4RIwifcv34qM/p8oBlpszwiml4/HiZpr4bN4w39ffqxAUwLLS6BZX7NLGZPi6
	kGv9HByXTTimFhqRRhX0ad6ALSoRRfngvfsN2uPoEb9K10DJ1fbSrp7yZpGmJCjl
	bOwtntofss5ObOMBLroHtNFe4Dlg5+WjpIex0aHxyAKfbthvhBueCsFvfHgx3HzF
	cMqMLw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj50mqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 13:47:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c74169c1efbso1215912a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 06:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841675; x=1774446475; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=stQl8kSgW1OgtxrwaRnPe7q/fue3covbszl4JlVIBiA=;
        b=E/BXTpvZQLDMyedeSoWht8WDSFUY5ZaREs0OSUCVD+IvFyj/cKQx8STUFH+I0bI+E5
         OiJMMXRQ5OuXW7v6x8EFuo90Il1c5iuZPktwgXABiB5D9oU3KCyzXz80h4RwFNmIinve
         KWAetFHDKqKZiEdWnLmmvUyAPIlpWCh6uaey6PSD5uxzsw8wKJo2R0QIUUlfkLwtjec7
         XdUQd85gVzFIV0K+AsqTZ38VHCPE6NVMWqIVJOJ59UVNmzx8c6IlLVUYGBADgJXv5EFg
         XR6LzOiBR6jcMmFgO+JSKt7LvJZJV92s7RZ4eJmaW9/7BX3G3ShQ3QKY4miFbWNg/MAf
         h8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841675; x=1774446475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stQl8kSgW1OgtxrwaRnPe7q/fue3covbszl4JlVIBiA=;
        b=Fx6kX5/gsYMEu42r7ToCe+xf25ZQXxLdionYbMH0KOo5hEWOGgPnmLiYSjNLNOsrAo
         Yv1aXUTSfO7GwexJS+CEOoOBINyIGr1WHTa3RXMK9wL6gjITrjYTp7hPIWCSKkv6fL7J
         It6ddN+UifG5K1MRX348dNI0xWRJdWY21B86KdhAnXLJsPcp7GjLNMw+Odb3bdGcGHQu
         m/0nxniReS8CXxUO1aknMq++L5g7gLczrX+4Z9Z+4ydrLdj8eRqxfsu932mCwzp6jmw5
         amIjhZbj0mc0o/2pnUIh+996WiCN8YaDxOHvfZsnJS4oAiB4oLC9u+ot5DVtB9KsQWNX
         /Bpg==
X-Forwarded-Encrypted: i=1; AJvYcCVvbsR5/McQPcFPCFtDVmtkXJoDVFN5eEtPOHj/c+CzKgyK9kSbFKayZvbeoMt6Rlm1XZLkpPVjdA0mXGHlYmlN@lists.infradead.org
X-Gm-Message-State: AOJu0YzObLBNtOWqSQzQXQeMPu6S1yiNZhQHS7SVLIIGg3spYHiuBgp5
	rHSEk4zTM459bBKwUTM3Xn6RbzXtVzLypQX7PvNDXPod8M4BjDfMAdIyRMI6dNYnTe0bhzDhte5
	Eu3fQjn13tsMHrY2cSJUSLvATH/4hkROeUtALnUH9R5/6GJxFOvvi+ziEKdACC6BcqxBfolIBBA
	HMIQ==
X-Gm-Gg: ATEYQzxFR4ZuTZs3MDzHJUq73Vi4JiCXbg2LGkRRkxtpV9gbYw5RWzLsUxbrjTKf2VQ
	wiUevvGJYcis8XQSxzb433H1ZaQfBl9mvBaGuSBW+Sb77NRL96FO9XZEyIcf8tfX5Kog47mwLr0
	LzNsZb/ObQIyPez/O4VpHJeqMD9BdIihIrtYsIt/SPOjQPY8uBaRMskP4MMaLcTYzC97OoKoe2O
	J3o6HhlAOUyRHtx4sq3MfU2se8W9aFt+5DGv5DU9k97ZYxCeuYKh4vPw3A2jBqc6Yz+DbTeNq3G
	4um5NNq1O5k9+u5fWfXml8ACshbZDk7p87vDPldo9FvqFNx9E7fzFutHtb2gf+9wGeoSgwYMGOk
	/vTqDhcNdlJwR/Ap44S8YxMig1jcMKs81q21C2fVfAHnRz9iOO45aK9C9ZIOdfKUOx5J/lLu/Le
	W1VtGJJg4685Q=
X-Received: by 2002:a05:6a21:7d0c:b0:398:72b7:ec82 with SMTP id adf61e73a8af0-39b99d736a5mr3078891637.20.1773841675249;
        Wed, 18 Mar 2026 06:47:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d0c:b0:398:72b7:ec82 with SMTP id adf61e73a8af0-39b99d736a5mr3078845637.20.1773841674652;
        Wed, 18 Mar 2026 06:47:54 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e5663f6sm2793568a12.26.2026.03.18.06.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:47:54 -0700 (PDT)
Message-ID: <be46234d-0136-4632-9cd6-7e9b3f6a09a8@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 21:47:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 5/7] qcom-tgu: Add support to configure next action
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
 <20260317032639.2393221-6-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260317032639.2393221-6-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExNyBTYWx0ZWRfX+C7XBzFgpudM
 zmmtd0Cc73OlZ6HudkVkoBuD0h6ge/aIw6rogULs7fnUfA2wESQNZUKl+NRJcOjEEfPHjhUDt5y
 Zq4OXzxWu4bpEE2c51KLUvYMYNfARu5Yr5F0SmG/bucBsq3AzEt4JCn1LEuzU2a3zBWhCDynPvy
 MXtVLd6d7JI6+9Qsfs7dY3xuyM7ZIP1SRtJGX+kcr9oaEVoMOiQjEvwxebcBV6Psa0ggqi9xarO
 KTQ53oU2Z4Eb8Rs8hFXbxRZbGnMbmcr1SPg4OJ4ghhXA9msJw9I37edgAa2giMw0+//a0E/mIqt
 rw9B8EhY/7zEmaYCfHgzNJ+ZzGO9kmsJoYy0os2zx9s9DOHZo3mKtJ/cyC04OpWML9sEKWwxMVf
 OK2SNjeTq+GDxT6y5vUhybEfY+Mn3to7MbV70kjrUJKiVQYBbLh1aHuzAjgwzuMdGAxa30xCNYI
 TblHXCQPG6GEsYibO9A==
X-Proofpoint-ORIG-GUID: UD1k0htLIL5gJ-QfXJp7TB6EFvZCPsQ8
X-Proofpoint-GUID: UD1k0htLIL5gJ-QfXJp7TB6EFvZCPsQ8
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69baad0c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ex1FgqpvNLb1JEDmgOQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_064757_650239_64CD141F 
X-CRM114-Status: GOOD (  28.67  )
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
> Add "select" node for each step to determine if another step is taken,
> trigger(s) are generated, counters/timers incremented/decremented, etc.
> 

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 +++
>   drivers/hwtracing/qcom/tgu.c                  | 53 ++++++++++++++++++-
>   drivers/hwtracing/qcom/tgu.h                  | 27 ++++++++++
>   3 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 18930743c99f..d8431a82574a 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -21,3 +21,10 @@ KernelVersion	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the decode mode with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
> +Date:		March 2026
> +KernelVersion	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the next action with specific step for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 85fe1140eab5..1d996b9e303a 100644
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
> @@ -356,6 +387,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
> @@ -363,8 +402,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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
> @@ -415,6 +454,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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


