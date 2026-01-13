Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB5FD0C854
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVz2cn3CkK/mIo0N8EVudxmtiUauPsvts9rJ0BtRZTc=; b=J5ESfU3uHonfIaChJ0K+ybBCTV
	1OXVpcSwP9zixISEciYsjWkhn4DidNe/PEXi2ERrncL3G+f+m5XAO+lIhZ04xkqPekrA2Q9USB3we
	GpAiKHtXC9EVj+nZvzyk8e3BKFgF44qloqfd/r568ZtZIZjwmO4ky4A5dOo7mjn2KoRc1T9tsUKSj
	IUCfNizFhKl1rttQCZ+Hh19+6rwMHYXV0RvLkNysvzRFRpcMIcerAuHlwXUfjf1RlB8Xuhhow6cmD
	kOqyBXzQ0UAhflqJ32lAydlgFJjd21AMLkJDbywvP8VmHNIvmItxUzwGGeMekp72J/84yixeSRm5/
	5qqqyFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcNT-000000070L1-1OlE;
	Tue, 13 Jan 2026 11:15:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcNQ-000000070KZ-2RSJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 11:15:57 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D76CF7175876
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 11:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WVz2cn3CkK/mIo0N8EVudxmtiUauPsvts9rJ0BtRZTc=; b=iEERgBlO108Jbnoe
	rdkZ08PB4PGIZn/o+lECpKt6YvxF949EuAE31JyvGK2l3ScuRaa1eYl3/0ateZ3W
	IboWh0dtqGduxGxPVv5sWLB8Nzn2bR4nPKrLvrHO1tosdnYFG0myuNSfI0jtSKR5
	ugE3JsnS718CZizEpv77l089ZZ1cskYb3jcIEFMxG3QewCm8z2hPjuY/+Knv9ikJ
	mM+MUZm16JRUyHpIFOyuL2Ys6hPr15V2ZBafo8irR34KWZVSS0w9KdKdMuk4GqwE
	f7Ger/7Zr5uYTzueuZbptj6DfzO1vE7GzpMtRCI4zLuWO9594mxTjGZFwslEDRum
	1VbbGg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn52f3080-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 11:15:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50144419b6cso228251cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 03:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768302955; x=1768907755; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WVz2cn3CkK/mIo0N8EVudxmtiUauPsvts9rJ0BtRZTc=;
        b=W2/eWGL/d0Ig+vYrRpAIWoTzKS8+eEXB3+9+RurEJ4/eoiTxiaUv8lI+UkeIRBNx3X
         7zGYgUTzaUv7UzmBspxycPREjlF4+bzRE1AM6kV/XJOvuQQhgHxuG2nJUoqJbEWcgOn/
         GNY4G4zkuMHPCZtUJee0BiOEs/mdvOQOk9zR9WXrw9e39eY6EsBZ8MxxIRYGA8eRhzXB
         6bV31cETUuQt56hkUhe1n/u7IkD9ITYadavDuLJ7BrO6aFAxVBewRVfRN2+wbPZZZxzF
         /k9mRbhFKfHmNKqdju2636KMR2T/NxjdKOzQDKI4jkkmO1+57kUlAWuBMsxAgFP7/a3k
         lVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768302955; x=1768907755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVz2cn3CkK/mIo0N8EVudxmtiUauPsvts9rJ0BtRZTc=;
        b=V5QsmYo9NQvt+5+NuKwN50QPTA9YuXVbcOBLsR/gS96Jvg3IgVq2fHVt9O1ryMCe+F
         4ECWgRcMukkHeOwp6WflVWLE/hFhiqT5DlC4++Hdwktzta4qfm3N0rbnaRUp2by1bLRw
         YLL/nwi3+kL/GQXlF8MYp2JXoUrLrtnDj5AoRM1tHJzLeUkQDXBakgt3ordm0AzlV5jh
         L3FU+hzQ7YmKZAFCdqbTQBNvhZMmmJVicGiJiVPmF0v0Jzhd1a6MDqZ3eWEAPPo+DY3T
         es/1aZmRI6rYpV0sBhDkBE57wudHzCmBFXz1uhALymL/kyBHzLIgR9FZRb0hcvoM0R+g
         kz0g==
X-Forwarded-Encrypted: i=1; AJvYcCVY8se8XbPfkgnxmocuvp+qbSoocXsfzmJGb5ESbD1pL4imPkQOD/iTTBVYuzuyHJTwgB0YTJfPfpSBDQlzp4Mb@lists.infradead.org
X-Gm-Message-State: AOJu0YzRS5U9cDd+FUMi2au4IYU7gbJqFGvtg82P6Yba621aN+SjJzVt
	OYVfjXdcZI8m0WBExAzhQd+BKXwadggpAYmZAX8p7I65/vUOPrP/UmeCbyougXcgSzebd5UeF0U
	h7T0SbYkNI6hFta0whLVxBJQubLplVxCfQRAwwVcq0kx2FzeEaP4IjBYIrnCYl95M1HRuTn/plJ
	uTlw==
X-Gm-Gg: AY/fxX7bdDk53K8eJ3/XsvPbO/uxaSDoWiBXNpgO9YWBnb6VZJrNyNWBx5QEa0syi4z
	K84c58qVuM98uw31A3I0LHkqfNtDab41Hb2swWQMKtdbyA70hWUEVTbFg8ulEFIrQ6LdmdFUSoc
	MTM57FTAC8jh99sHKKl1TZTzw6WE1uFe41wUiNP1lTM6CBD/8SpytwB+u/lwtKe18SSc9OQMDVp
	ptmMAJUbpVnrvkvQZjGEqq7TIRolhTNk8Bws4rTzBxMnviy9GpSO0m8O25bzRpJIRuxtllb6pAC
	I9HxnK00lTDuFaseM8Zal7Awe9BVLdjCy7z44biHGh7Wsy0x2Oq7Fszf5hPUrRQnsXa6PlG82Fo
	fvXD9uRywOnNaZkFU9fmdtEej6FcOsluK7OMKycYvuQqWiMNwi/iNW5TUFa3oxAoMt/E=
X-Received: by 2002:ac8:57d5:0:b0:4fc:989e:f776 with SMTP id d75a77b69052e-4ffb4861697mr246418341cf.4.1768302954979;
        Tue, 13 Jan 2026 03:15:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgvlL8JKDCb6sI78Mbz0Vz1WwN8iCeTN2tlWwmv6VllLm5D5BHEcNdQ6oG3pEEypulUcU1eQ==
X-Received: by 2002:ac8:57d5:0:b0:4fc:989e:f776 with SMTP id d75a77b69052e-4ffb4861697mr246417551cf.4.1768302953623;
        Tue, 13 Jan 2026 03:15:53 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4cfe60sm2185088966b.45.2026.01.13.03.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 03:15:53 -0800 (PST)
Message-ID: <f211054c-ecb7-4f90-b9ce-9fdd7710c8c4@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:15:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/7] qcom-tgu: Add support to configure next action
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-6-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109021141.3778421-6-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5NSBTYWx0ZWRfXybkOMLF2q0xj
 XkalmxOynLP6rOeCJ49ZeJYxjQ5ZBJZ+Jb6KBcNT6UpOK+h7sbA/qLgm0MprXHSf1TbwfJWDNDK
 doI6le5eRA6Si1Gom07NATsc7/IJNp79+unmjrWo4Zp5nh1ZSzXUonem23YnUPcL2BIkWgKmG82
 0oiYev5Zbh+j54MQ4qCHgrZwAcDKjWRqf0gOPDXiHgEOTsh/+SyxdBMKAMKNwY4fgSdGE0/bX9P
 CLg7oefj8Rl/ykUC3gVS2Rv6KKWNxQ1oNDc3t/tn0HVD3lLSAD1POq6zXC2iWA6xswMNXEa0EpM
 rT14el3TQ+COqV4F8mpB7sWHW1Iqg+rtRBuXd4W+IkrX5VhJZZGqGObpfhFb2tQzNis5UO7WvYN
 uDKbpbd1YGgL4YXEIHZEGR80HW9ySjGyZ5rS52/3/XUW7wuWQpzdkh7uZ4AFiRfWPwfluYDM0jO
 lU9TcuvMZ3hi4sIqscA==
X-Authority-Analysis: v=2.4 cv=TcCbdBQh c=1 sm=1 tr=0 ts=6966296c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jWTz0FIqI1YCIfhA4ZQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Dpc1OVh1Xh7DBnOBw8AXmRzuXDeLgJAZ
X-Proofpoint-ORIG-GUID: Dpc1OVh1Xh7DBnOBw8AXmRzuXDeLgJAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_031556_633458_17AE6B44 
X-CRM114-Status: GOOD (  22.92  )
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

On 1/9/26 3:11 AM, Songwei Chai wrote:
> Add "select" node for each step to determine if another step is taken,
> trigger(s) are generated, counters/timers incremented/decremented, etc.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---

[...]

> +		case TGU_CONDITION_SELECT:
> +		/* 'default' register is at the end of 'select' region */
> +			if (tgu_attr->reg_num ==
> +			    drvdata->max_condition_select - 1)
> +				attr->name = "default";
> +			ret = (tgu_attr->reg_num <
> +				drvdata->max_condition_select) ?
> +				attr->mode : 0;

similarly to my previous comments

[...]

> +	for (i = 0; i < drvdata->max_step; i++) {
> +		for (j = 0; j < drvdata->max_condition_select; j++) {
> +			index = check_array_location(drvdata, i,
> +						TGU_CONDITION_SELECT, j);
> +
> +			if (index == -EINVAL)

stray \n
> +				goto exit;
> +
> +			writel(drvdata->value_table->condition_select[index],
> +				drvdata->base + CONDITION_SELECT_STEP(i, j));
> +		}
> +	}
>  	/* Enable TGU to program the triggers */
>  	writel(1, drvdata->base + TGU_CONTROL);
>  exit:
> @@ -225,6 +258,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
>  
>  	devid = readl(drvdata->base + TGU_DEVID);
>  	drvdata->max_condition_decode = TGU_DEVID_CONDITIONS(devid);
> +	/* select region has an additional 'default' register */
> +	drvdata->max_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
>  }
>  
>  static int tgu_enable(struct device *dev)
> @@ -356,6 +391,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
>  	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
>  	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
>  	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(0),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(1),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(2),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(3),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(4),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
>  	NULL,
>  };
>  
> @@ -363,8 +406,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>  {
>  	struct device *dev = &adev->dev;
>  	struct tgu_drvdata *drvdata;
> -	size_t priority_size, condition_size;
> -	unsigned int *priority, *condition;
> +	size_t priority_size, condition_size, select_size;
> +	unsigned int *priority, *condition, *select;
>  	int ret;
>  
>  	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -417,6 +460,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>  
>  	drvdata->value_table->condition_decode = condition;
>  
> +	select_size = drvdata->max_condition_select * drvdata->max_step *
> +		      sizeof(*(drvdata->value_table->condition_select));
> +
> +	select = devm_kzalloc(dev, select_size, GFP_KERNEL);
> +
> +	if (!select)

stray \n

> +		return -ENOMEM;
> +
> +	drvdata->value_table->condition_select = select;

I don't see a need for an intemediate variable here

[...]

>   * @max_condition_decode: Maximum number of condition_decode
> + * @max_condition_select: Maximum number of condition_select

Maximum value, perhaps? You haven't explained the feature very well
so I'm not sure what this is supposed to reflect

Konrad

