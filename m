Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E67103E181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 13:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxgPs4A2aV5nJQ+32pziXlEECTTOn7MJ+QMCGaDo1PM=; b=O8ol5JelhFVAQMXRXIr1HflquF
	4p9zrm91fEVusoF615tccKemVtD41k+HDR9XpuhYYW8cHH/HR4Mw9apJ3rrbT9rKcUz+az6wWsM86
	2imI3lKX2cq+Fa1atRms9HrcIafXJRZiXn+3n7D7d10JVZQT73QVp3nb6iTqOQr5IuyuYfdvPQleS
	Ewk7WtJHOR+hELNkccPzzjBfz3srBNEb0n4t/80anSEj29h8moii8AlqON3ZU7fSo+350M1aZUP8e
	uBFjFsXzpulE3HPXGTTszrPFBGxp3BXljo6Ik69oLoGw0ir0lgU+I9NgROUyGiVDVCftevyvbG8Ft
	1r76ogcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rIG-00000008Wdi-0KE8;
	Wed, 18 Mar 2026 13:50:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rIE-00000008WdD-2QnO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 13:50:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ICME572878100
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 13:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxgPs4A2aV5nJQ+32pziXlEECTTOn7MJ+QMCGaDo1PM=; b=NuIh2cp+bqxR0rAi
	z15rXLlZnst4Ym5fd+fbNfyzm4tjtEJwvKj5HWFGDa8XCfWF87GKcHTULR2RI6zR
	RtKLV33s7C/AX4CGd9PHrKpr78/0gWDLk62KPLC730prWj7JesPDC+tdj1NqiGVf
	0YTE6JVhzUHEGyk0ROit/WLx+QYDtUZQVRclIqaKi0xJcKVwJMJo3J7ZnTWITq6Q
	kVByqA7vEaL+lxLr8477ALq5FDRgronMal6xCglNnjCMmgycSuldKKiUTobjCHy4
	7Xofb9Gr/CbUyUM2QFHBFJbqePgGJ5ulkwIT+54lLytraHAuYNw6anRCTBzLd3sw
	xdOfOw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cypwr1qmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 13:50:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35b8f351debso4053747a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 06:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841837; x=1774446637; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yxgPs4A2aV5nJQ+32pziXlEECTTOn7MJ+QMCGaDo1PM=;
        b=A7BKINIvHGKC7fvg5JO0FnOybwhAQ6A7Wgkf60dbtmxhvnioVxQu1kvSxWjUD7dz5s
         XtlpFUDzaWWsbTL8hO6D0JcAtjrH6evSjPotAMs0KtPoeg2Ku4JfgBpQNCK5CaSPYGP5
         jG7Gwam6uA60gnAvIGogSLGaLOG1rSHZpOjGgouIwiGc0C2sR+aYv+1OYU8y6O1GtAWC
         Ieoxi8OSPJfYU7n35R1lMFW3O0DaEqcLw2WB/iSjvTm0GPMGgrLPYJHaQDSQK1ZJE4jp
         8hO42qkywf/I0NaPR/UM0T54aeGqTD+rYkLtmbrRylAbYlp4QwNb/nnn61u2ciLmTegr
         AbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841837; x=1774446637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxgPs4A2aV5nJQ+32pziXlEECTTOn7MJ+QMCGaDo1PM=;
        b=IzOb+pGnfWhKhUWYm3wVF9XrZlec448Nwq7DdIw00EOn8jII59vbxKYLimIofpgZNS
         qLtKKnaVFSYg8/wRZBcojbGTR+hBbaunakPIvBNsoM+7X+nrELaDvwZqUiMjp7GMLV/V
         DRUP8rjKOKWYjE2AILC773XI5z/tzrCdBLwafxK4XQOozPEQd4MxAG5C7fgd28nvu7T1
         gwmX8kr8e9ZZJHN5D8vwHONVJETijCDxpKC1Zo3iO2k+2QwQSOKf152kKD7eJQiByrVt
         jwKUtrPble3+37UKXZNHJJc/usG13pQTOXPfDUUz0wW3IxVpHv0hdQUZoCTZ/gwXo2uU
         9MRg==
X-Forwarded-Encrypted: i=1; AJvYcCWHKaEqdC4Ps74VWniogBspV9zMy12Y5VjXlR2kirdUkugvO5R2HRMP2pzDJPFxn+j9gldbYEix5YULnFedXZ3X@lists.infradead.org
X-Gm-Message-State: AOJu0YxSRvOILmXYBILcQdRJGzP1RxpHFuTips/p6xmsa44rBXM1RlVw
	9sKg5srLe3Nchw/gYM6uLmYWbLrkZ4jJXIGGFKuXf9JuKaODlysUCoU2RvU8OwfEj7qVqlfpCz3
	kVZSERwvS/YuII3vsXBbRXZr2KHvwiOXjzj8lOimC8sBVcLTnhUUUCW3W/aB4qV8a72tv4uTXOM
	HY7A==
X-Gm-Gg: ATEYQzzzSaw3g7rgVQ478+g2yU4y1D7dO7SR+H8TojmQMz9XCO+ul7xCx1D2WkDhuRN
	M+9gDFxWHvVGJhM1Z+C8uTYHLTfoB2ecuitqaBFTW/4Bc7far0MI+7200hRkDIZXr7MeyrXFlfi
	VVzA8Gt6WAPT8TMKjg4RwfKxtb09P8yNxff7IB5GeKmGSFX5F1CcWl7v0D43hEdq+OINVKuRkZl
	f34We9WbYPHgQ56uIvMJmDXZ87jj99b/DDNxZhHpMyyEBlOLiWFoI64x95l55C2SQgEThFevcQV
	UACzVkQd2GoOh7IG/YJykj5b/qiQBt09fkRbikcJ1sB/sX8+49zUK1CEj7p7QEsrTHFCOuGGQUM
	wIr7VFGIaMzPCTW4mNvmAHjTPusdGq1o/vhkcEGJqCLmVsc4wrFn/lipT2NAyqsIh0wrxgtvXRe
	OVLDh2GPRDets=
X-Received: by 2002:a05:6a21:3483:b0:398:7357:bb92 with SMTP id adf61e73a8af0-39b99ca7b7cmr3605300637.5.1773841837370;
        Wed, 18 Mar 2026 06:50:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:3483:b0:398:7357:bb92 with SMTP id adf61e73a8af0-39b99ca7b7cmr3605260637.5.1773841836849;
        Wed, 18 Mar 2026 06:50:36 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e577c1esm2929352a12.28.2026.03.18.06.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:50:36 -0700 (PDT)
Message-ID: <d2d4b2e2-f3b3-4ed0-8586-9a4eca9daf25@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 21:50:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 7/7] qcom-tgu: Add reset node to initialize
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
 <20260317032639.2393221-8-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260317032639.2393221-8-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bIcb4f+Z c=1 sm=1 tr=0 ts=69baadae cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=arahFDS25cvTpKsIBlcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: tV9xxzHZMXqsir8anRMLqspy21h3XEMm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExOCBTYWx0ZWRfX0TCL9yPGok1I
 8Cgbv37G4mSJSh0FUl23xI6/Hr4DXImNJDxjZhhLWnA2r20bKLByKD3a41zKB0gU3tU9hel96nB
 nutT9fN/EUtuC+Z+dLUXSJNhNtAfbNCuMGu+NraNe5vwsR8/R5Yl5LVIUvzuOFv74jphmuUZn0U
 ThwXaNvimxbKbE8xUBTmKGbqNHXchGR5QpOueEPosuWSc8FFx2O5Z17sC0C5as6W4i+DlUL4ASj
 NeliJe4lS0dmkkPWIoxncvkOy2jyieG6wZsr3mIzp8nSWIdw0AdhRVGmy2HSpW5L/zQewLS2ZLc
 4rqhBcOHnbsbdrOBE78wnONYN4rzIwRrcjjc2pWuYrKy8lc+SXVor8z/yHshql8YxnUaGHPEFp1
 5AnHrnAoECgC8E24bNXEBmFG7dgvXwDhnerihTr0lKHinjXJECe3uUUIB0Vu6vbGFFdtFI8cYhN
 +XS/1KsFyOeePSTBHmw==
X-Proofpoint-GUID: tV9xxzHZMXqsir8anRMLqspy21h3XEMm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_065038_647756_ABDF6FF7 
X-CRM114-Status: GOOD (  23.45  )
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
> Add reset node to initialize the value of
> priority/condition_decode/condition_select/timer/counter nodes.
> 

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
>   drivers/hwtracing/qcom/tgu.c                  | 77 +++++++++++++++++++
>   2 files changed, 84 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 5370882333bc..1dcb8fb71cd9 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -42,3 +42,10 @@ KernelVersion	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the counter value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
> +Date:		March 2026
> +KernelVersion	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(Write) Write 1 to reset the dataset for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 4539415571f6..e28e6d27cf56 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -410,8 +410,85 @@ static ssize_t enable_tgu_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(enable_tgu);
>   
> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
> +static ssize_t reset_tgu_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t size)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct value_table *vt = drvdata->value_table;
> +	u32 *cond_decode = drvdata->value_table->condition_decode;
> +	bool need_pm_put = false;
> +	unsigned long value;
> +	int i, j, ret;
> +
> +	if (kstrtoul(buf, 0, &value) || value != 1)
> +		return -EINVAL;
> +
> +	spin_lock(&drvdata->lock);
> +	if (!drvdata->enabled) {
> +		spin_unlock(&drvdata->lock);
> +		ret = pm_runtime_resume_and_get(drvdata->dev);
> +		if (ret)
> +			return ret;
> +		need_pm_put = true;
> +		spin_lock(&drvdata->lock);
> +	}
> +
> +	tgu_do_disable(drvdata);
> +
> +	if (vt->priority) {
> +		size_t size = MAX_PRIORITY * drvdata->num_step *
> +				drvdata->num_reg * sizeof(unsigned int);
> +		memset(vt->priority, 0, size);
> +	}
> +
> +	if (vt->condition_decode) {
> +		size_t size = drvdata->num_condition_decode *
> +			      drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_decode, 0, size);
> +	}
> +
> +	/* Initialize all condition registers to NOT(value=0x1000000) */
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_condition_decode; j++) {
> +			cond_decode[calculate_array_location(drvdata, i,
> +			TGU_CONDITION_DECODE, j)] = 0x1000000;
> +		}
> +	}
> +
> +	if (vt->condition_select) {
> +		size_t size = drvdata->num_condition_select *
> +			      drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_select, 0, size);
> +	}
> +
> +	if (vt->timer) {
> +		size_t size = (drvdata->num_step) * (drvdata->num_timer) *
> +				sizeof(unsigned int);
> +		memset(vt->timer, 0, size);
> +	}
> +
> +	if (vt->counter) {
> +		size_t size = (drvdata->num_step) * (drvdata->num_counter) *
> +			      sizeof(unsigned int);
> +		memset(vt->counter, 0, size);
> +	}
> +
> +	spin_unlock(&drvdata->lock);
> +
> +	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
> +
> +	if (need_pm_put)
> +		pm_runtime_put(drvdata->dev);
> +
> +	return size;
> +}
> +static DEVICE_ATTR_WO(reset_tgu);
> +
>   static struct attribute *tgu_common_attrs[] = {
>   	&dev_attr_enable_tgu.attr,
> +	&dev_attr_reset_tgu.attr,
>   	NULL,
>   };
>   


