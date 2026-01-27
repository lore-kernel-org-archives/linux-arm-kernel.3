Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309DED13C1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 02:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Xcj+7J3rCgzN/qZYc9vEg73R8vlK8fAALq3lkw0cpQ=; b=wPDnQ1RWyG+Yg8BGHOVEiVosNS
	QkCocmwIEqcgC5eqDpXGUiJ3XWRWKw4K5kuoISD2Kc4XtjK2bVPNrkCrTzY53LiPOCRfWdFz5Ukxa
	qEeq2SCKj1QOHBbIXkiMxV7NEnZoqhzB8pbNnZ3/fCP3K2PxZ1HRMQWcVImr6YVZiTIgHXyeenuvR
	pTeplbQi3gLWYNdjVVvm3XtGlHDNLn+1rDOWrEZVpmAq/Ep+1swJB5/0+FeI5hBdhTnyF1ts45FoC
	928bG5h6QscOC9jeeam8lNrsTDoG/nqi1dAyg4Iw2zQHusxOu5KY1kvk1ckWp6K7tACiiut/zl5G6
	ZuusywTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYkO-0000000DU91-3jjX;
	Tue, 27 Jan 2026 02:24:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYkM-0000000DU8g-0CA5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 02:24:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QLW5B14101118
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Xcj+7J3rCgzN/qZYc9vEg73R8vlK8fAALq3lkw0cpQ=; b=NMA3J8zbHSUQq9rh
	HHGIg35QRr8DsMHoRKWv8S5XvoEntlCi4Y3iGb43si8HfY3GviwTR/a3a81zn1fA
	37ux5qoOuxkSbWFpjZvosdhRsMiNkRYTqZvnrQptE//fzDLnXHJoGH4DENPhIRo7
	YZwQCX3aeyiW6zXqnThlwWleQ0NG3T30Ub5RZWqeoRJqJ0/MluawtORGK7O5s0GX
	eBjj5KG9nBrK9oHYRRBcQgFr3+HSsZf1SN/JZraIxGzq7R/BiUuk3I9SH+PGMpKi
	3kJtvRhPK0ckSt5F0JgA/dW5xfUH6L5e3Kc+utWU/s7QBuTaVlF+zO2xQruOgxgq
	JHJMlw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93gmde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:24:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0f4822f77so121679185ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 18:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769480640; x=1770085440; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Xcj+7J3rCgzN/qZYc9vEg73R8vlK8fAALq3lkw0cpQ=;
        b=KyHp20AIQHYVGvA4otBuJPkbkMDv/tvPJ1RQLytybSYJ9Jk6J0sUscMG34AM2OLfdc
         ZAucsxU9hZgSyc/9uDsGN9vtJbKFT6n+jLh2pXqmuaD2A95sv3p4Wt4e355ZFAPKytJT
         K95v5YZJu/NalpKy7uJ+/P9+DHGFC/g7jekauTi22MNAdwV5sXYAqklB1Txgvod3T4az
         WQHivXBeW84exr1o/EjjfDCSK66cs9Dm2Rl+5IiTJxtwKFHx0K/8mWSbiNyeKBtLcdMy
         105e1xy1MDfbrm7KvACOtBhQXyPCqAO0fCTblYpSY29lmHZwEBroUAJWuobnnnJsIlDq
         1jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769480640; x=1770085440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Xcj+7J3rCgzN/qZYc9vEg73R8vlK8fAALq3lkw0cpQ=;
        b=nLGvUUtYYAIVGvz63sdQnKeRKugdmrKbMXhy5bC9H8fRLO/k5RLU/6Nqcx7KxMerCJ
         iVUy+9BYa91cpf8x2Fbr6YgpGGqcxiCUyLC4ipbOHglXcUmG8aHIxcQCf7wyyhTvIyo+
         xUWG4xuPLTK0dQWLndMr0wFwbXZZ7HO2VO9h2Q6gp+R32W42gXZ5exhV+p6VW8Kq4SaD
         Edko4/zxhYwcHweoB9kvvFQrh6woNH2/UsV+5zob0SrhOVYOT0ianHZEohGrdIL1Me70
         sklseXGAX672leTkOKWgYHsp4BHMI3kdEzlf7tE3fvavYQrIhf8+YD4+Uw2WzHYN41eU
         09CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkROmonUN407KpLYBY3tWTLyHrgkoy0iFyXBORcwqo0rmV5Klrhrhy49VEP0KiyXpbyN4mXi5X2RjbSilTbSTi@lists.infradead.org
X-Gm-Message-State: AOJu0YwwtYkEOPDao8s4O1eGfzZSEazZ9HUAMab61KUFc89bDgs35KEH
	hfaRNqRPUU48K2rrQBpawevis8uymvogmLfohxVzfz82kKjeYJa3y0nYL3hw1flU+5Dfqisc7Ip
	YHisivY1/wYpxFD3t7jNH60rVEgOWl/v/uCCvcgc7GywLZiN5Q8wSDPy3BIT8w78g2Cm6nOVTXt
	3Bqg==
X-Gm-Gg: AZuq6aJDgZSmq3zvMO1dQywEQ5+/Mua7c5xoXoZlLX80/H6z7xH4V+jx1tgpCeaX7t9
	m8zA3ExJN+XHladbwNAXhlSf0Xu5/W9uIChiYij6YvIakwCNqQjLSLxfBaJwYTpWW3SGPQvao5H
	PWEuLm2b0Hgg3rGrzKcJj/LlOKvRlz7lsTrEFzrRvsBLLJ3u36yy/c1bVlXRcI4lN/gCffwD6vB
	TSoPIVHV+n2JQNfP9EKOBZVaxdmRvNKo1OIDt0Xo6Ck8BaYCBTqmSzQ5OGRd+EJdLf91RwChjIo
	TCa2GM08G6cAmMUXlS3fRHKAJc21Pqr6h4QjWzxxSUVS4Za07dMOgluu1ZWBNnfS04tnWUQrWaL
	+pgv9aWFn0WHwuiJ+VxCCq35Fjl9j5Qh17vuXFEw=
X-Received: by 2002:a17:903:2cf:b0:295:1e50:e7cb with SMTP id d9443c01a7336-2a870d7446cmr2559625ad.23.1769480639797;
        Mon, 26 Jan 2026 18:23:59 -0800 (PST)
X-Received: by 2002:a17:903:2cf:b0:295:1e50:e7cb with SMTP id d9443c01a7336-2a870d7446cmr2559345ad.23.1769480639302;
        Mon, 26 Jan 2026 18:23:59 -0800 (PST)
Received: from [10.239.133.242] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd96bsm101009885ad.33.2026.01.26.18.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 18:23:58 -0800 (PST)
Message-ID: <bcc3547c-b7d5-41a3-b291-4669c11d7f1c@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:23:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/7] qcom-tgu: Add signal priority support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-4-songwei.chai@oss.qualcomm.com>
 <f34abcca-6b09-4f6c-96f3-e2295a82284e@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <f34abcca-6b09-4f6c-96f3-e2295a82284e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAxOCBTYWx0ZWRfX5ZTdm97Yw5oM
 v2UR3w1Ifva4bI3wqz4Ncz3r4ZKLTKkj4nZB7iMYm9bOnUrCmZo9ZHPeS1ZnfA1xeFRHAXt+8Zz
 reLz0jEHKbUgYyUHjcpHZAbJOm7MLH8JVBBnf60AlAjhwwzGTubgWb4IErC4DyJSWcFGhe455Tx
 JMEIvDjXlMNOhX/u8Q4iXpMDpUhstuyP9wBkSjVFg/kS0+pA/1L6hJOmN3kC8tI3z8vOCcafxRj
 WACj3a1RPMCDgRuOnUS1328GrVkYYqbNqDn3xTTafkmuxA2P26DcxoDl+klqRaMv+FTM6TShluh
 5RjNKs0zfkNHK0QXXhD8dlsKXQqSy+kGInbnFKTqi6e0tTIC/v2Co/qQCEF/n+ZbTcvRJ6/lfgM
 y9jn3Hogte+l1W+ZaQp/dlzPFXAbBLJT74sgt4Wk28wEf9e2zu9DJSWCoPMkKjJNeTpdlycY9o2
 o1kIcgMzO13y7Pkg5Sw==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=697821c0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IIc-LL1DTgqZpWAsoswA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: DVO_uu1j9HPQW-PBIM35_rXEVTJsWhmm
X-Proofpoint-GUID: DVO_uu1j9HPQW-PBIM35_rXEVTJsWhmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_182402_271373_C297E857 
X-CRM114-Status: GOOD (  27.05  )
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



On 1/13/2026 7:09 PM, Konrad Dybcio wrote:
> On 1/9/26 3:11 AM, Songwei Chai wrote:
>> Like circuit of a Logic analyzer, in TGU, the requirement could be
>> configured in each step and the trigger will be created once the
>> requirements are met. Add priority functionality here to sort the
>> signals into different priorities. The signal which is wanted could
>> be configured in each step's priority node, the larger number means
>> the higher priority and the signal with higher priority will be sensed
>> more preferentially.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static ssize_t tgu_dataset_store(struct device *dev,
>> +				 struct device_attribute *attr,
>> +				 const char *buf, size_t size)
>> +{
>> +	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
>> +	struct tgu_attribute *tgu_attr =
>> +		container_of(attr, struct tgu_attribute, attr);
>> +	unsigned long val;
>> +	int index;
>> +
>> +	ret = kstrtoul(buf, 0, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	guard(spinlock)(&tgu_drvdata->lock);
>> +	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
>> +					 tgu_attr->operation_index,
>> +					 tgu_attr->reg_num);
>> +
>> +	tgu_drvdata->value_table->priority[index] = val;
>> +	return size;
> 
> Style: some functions have a \n before return, some don't. The former
> is preferred
Sure, Konrad.
I will update and pay more attention next time.
> 
>> +static umode_t tgu_node_visible(struct kobject *kobject,
>> +				struct attribute *attr,
>> +				int n)
>> +{
>> +	struct device *dev = kobj_to_dev(kobject);
>> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +	struct device_attribute *dev_attr =
>> +		container_of(attr, struct device_attribute, attr);
>> +	struct tgu_attribute *tgu_attr =
>> +		container_of(dev_attr, struct tgu_attribute, attr);
>> +	int ret = SYSFS_GROUP_INVISIBLE;
>> +
>> +	if (tgu_attr->step_index < drvdata->max_step) {
>> +		ret = (tgu_attr->reg_num < drvdata->max_reg) ?
>> +			attr->mode : 0;
>> +	}
>> +	return ret;
> 
> This is very convoluted
> 
> How about:
> 
> if (tgu_attr->step_index >= drvdata->max_step)
> 	return 0;
> 
> if (tgu_attr->reg_num >= drvdata->max_reg)
> 	return 0;
> 
> return attr->mode;
> 
> ?
> 
> [...]
> 
I agree that the expanded form is clearer step-by-step, but I 
intentionally kept the current version as it keeps the bounds checks 
localized and avoids multiple early returns in this simple case.

I find the conditional expression still reasonably readable here, but 
I’m happy to revisit this if you feel strongly about the style.
>> +static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
>> +{
>> +	int num_sense_input;
>> +	int num_reg;
>> +	u32 devid;
>> +
>> +	devid = readl(drvdata->base + TGU_DEVID);
>> +
>> +	num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
>> +	if (((num_sense_input * NUMBER_BITS_EACH_SIGNAL) % LENGTH_REGISTER) == 0)
>> +		num_reg = (num_sense_input * NUMBER_BITS_EACH_SIGNAL) / LENGTH_REGISTER;
>> +	else
>> +		num_reg = ((num_sense_input * NUMBER_BITS_EACH_SIGNAL) / LENGTH_REGISTER) + 1;
> 
> num_reg = base case
> 
> if (num_sense_input * NUMBER_BITS_EACH_SIGNAL) % LENGTH_REGISTER)
> 	num_reg++;
> 
> ?
> 
Marked, will update.
> [...]
> 
>> @@ -112,6 +250,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>>   {
>>   	struct device *dev = &adev->dev;
>>   	struct tgu_drvdata *drvdata;
>> +	size_t priority_size;
>> +	unsigned int *priority;
> 
> reverse-Christmas-tree would be nice
> 
> 
Marked, will update.
>>   	int ret;
>>   
>>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> @@ -127,12 +267,32 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>>   
>>   	spin_lock_init(&drvdata->lock);
>>   
>> +	tgu_set_reg_number(drvdata);
>> +	tgu_set_steps(drvdata);
>> +
>>   	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>>   	if (ret) {
>>   		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>>   		return ret;
>>   	}
>>   
>> +	drvdata->value_table =
>> +		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
>> +	if (!drvdata->value_table)
>> +		return -ENOMEM;
>> +
>> +	priority_size = MAX_PRIORITY * drvdata->max_reg *
>> +			drvdata->max_step *
>> +			sizeof(*(drvdata->value_table->priority));
>> +
>> +	priority = devm_kzalloc(dev, priority_size, GFP_KERNEL);
>> +
>> +	if (!priority)
> 
> stray \n above
Marked, will update.
> 
> [...]
> 
>> +#define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
>> +#define TGU_DEVID_SENSE_INPUT(devid_val) ((int) BMVAL(devid_val, 10, 17))
>> +#define TGU_DEVID_STEPS(devid_val) ((int)BMVAL(devid_val, 3, 6))
>> +#define NUMBER_BITS_EACH_SIGNAL 4
> 
> "TGU_BITS_PER_SIGNAL"
Marked, will update.
> 
> Konrad


