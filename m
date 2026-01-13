Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAF2D0C852
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QriPXAEoCg1J6fQrwPE4jiHUStR2X6nRraXMO9SHFs=; b=ZSo9PegrWoFEp+PcQJCwufL2u3
	A/k+rMga8/yQjbv/vu60uyQV9mbiGh8BtvgD9sjUFtLF53LTOUlCJjmqBKn4SY3fA9DMwKITdXLqf
	ecRqoYaCu9mh0BRsvLiCuP/uSUx7pYdDJHoEUqwba+5Ls7LL42kS9WGyoPj0uIzpqdTsqoQIcMY6B
	cGuKb/p7Ep0oeq2yLBTOzgwDVobORKbW5NNkp8BqA80Up8hVY14JVpweSPdTcf/i9PCRRx583LhpO
	+dFJ61HWfPGPGrlVY/3fjKHQugMgX+6qJNc4C5S2OnnR7mCg6oPlan4ojcgvIBumosgezW/bIy7rF
	3PTuL3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcH7-00000006zho-3wlL;
	Tue, 13 Jan 2026 11:09:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcH5-00000006zgf-1qrG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 11:09:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D535S92865771
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 11:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/QriPXAEoCg1J6fQrwPE4jiHUStR2X6nRraXMO9SHFs=; b=BjytnvjXlLcbUWMn
	/lDseXZut/XmwPC9HF00k0NihosslTEY7aKAAoKoOPbV9xL1I6G0pK4U7FSTwvXe
	uMCi8R6M0nUmkfW2Sa8B4J5HwolaIgzLMAhgA0jfIk5joWrAz82pY0ELVD2H3tnI
	PaDSYjurBnkkNtprD0+iL/YB3yuWeHYmnKe+lYad4hEH5Nb9xytwmjIjZRK5oNb/
	I+yVKm/XyqY3swXDJ1CspUUfHUer/ccvKIzoMN/bDEkQ9b5DmfQISj2Ol/CToxTi
	1zmup+2u9BHS7fPR9b46o3xk3ipgdwM5vyugBaO6pIo1BlkNBYsLqIWJJxcCgVPF
	aRbPYQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjh94yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 11:09:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee409f1880so18203101cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 03:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768302562; x=1768907362; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/QriPXAEoCg1J6fQrwPE4jiHUStR2X6nRraXMO9SHFs=;
        b=fmWelz7FW1w3ShFsBR31ysFqioWjn7Xy+WHU8aQW0IECPfGqRH53cPgDINKxUIP2Dt
         l/wrLtf74EDRCq2ssw2TkfBZk5301GmE7eUV7V6M3P0YffmWT5vugyebQLI8QIz+YoZR
         oXpjXFKDDP58VFH302czCLNdpMVzyt8qtZZNLTneISutU3XeCmrMHDAqustWHVxsx3Er
         6ZzwbpIVPHLrWp0YxmhNAd34Dyrv/9tTK4AO14C1ILw76b8pva0KxqyYyG7ducF5u7nI
         iZKdxF0FGBIVpgdXfGm1M1Upx0d92QOUuLDOYZa1kON8c0pDEbNNXcPfRW/beY7DXiXl
         SKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768302562; x=1768907362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QriPXAEoCg1J6fQrwPE4jiHUStR2X6nRraXMO9SHFs=;
        b=oISvuQoqhkiGZWVU7//iWe+QkLb1HLrKuz0leMqeb7TsAHm8NbWTtOUT7BI3oNdwvb
         yWx/BdRvlrn15ns+cXK4JDl85Sq0ebNg5V5U4YOAHZ92WIX6xXqo6dMqi1SNiYfFzfcA
         9gA0o7zNoyT5w3eDDFEj6fyl/akCm3Uboq0IFcTw5dQRPWyR/8iZf03vY2WPsjj7QsXw
         HXzVe8ozm0Hw7HaYHtffgwnJUIN6Xd0jBZ7qCNDpU6uyLxqqWG4sVh8vVuMnMhJwTR4X
         3SPZVdbChhoer4VtsHlEpixInQn/VEioRfifc6EORoq9lM7KB/nqX0OIU6iZwZEySV06
         asXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP4d5fBhKly2+3nXsMh1Ojf/jr9ZX/DrYPKfAf42WDLRi3Vf7XaV+Ww/33SjsuVkouxhMojmSvjbqBj2pZ3XkS@lists.infradead.org
X-Gm-Message-State: AOJu0YwCfXZktNcTy/8uZtl3763s7fzBdKKTUHsmL6D26AXL3ZOESyvG
	R56WTeJBJ8nsWVNAcFMTck8OcqgvZzlwTi/zqZCXPzuhGvGI0L4+n36yinYZarYBCzErQYeRGSI
	BvR+z8nQRBMQyBrTgvC1uIzcLNzF1oDB/5MuUea6g+2nadwSaJKJWKzSrpVXo27v+aeKmtG/p3+
	j1Pw==
X-Gm-Gg: AY/fxX7HYSiTqI7rKBq1Ro21wQOVa8yy3U/UQButMNkRjOMZ13eu1udey0zp5egsHSk
	hSGw5SHTSb8R7fQwr9M2iqhKgnCHuVk1ub/tmmKW5WfniNAUmhVMdqOG5NaujzPyz6fFxAIXRlZ
	GM0Jrk3XgoWE8nq7XJM98uf3y0c+2TE9vewjuwOmTirCCPdIz4/Niv24ddEfMQBtnbJ+NXOTBPH
	W1/aq328r9UxI/9UQsogExpgSOQNNaPIkYfLTSEBYHZmWrhgW7x8Szq2JdRSgE07qWEJ7PA/9ab
	8RFxv+oSvnkFrsZd38DHE9f5TTKwc1+DWG6Etj4s8t91/XJhdL0DSwi3L7nPDhx/bNPg0gspDdI
	BgRJmxo2zzVFUy2IfKLCfBdUmD5W7piCfTZWSOyOyskAMbK0ocp8HU4yGZ4oq+OWmWKw=
X-Received: by 2002:a05:622a:110c:b0:4f4:b372:db38 with SMTP id d75a77b69052e-4ffb49228d5mr242132701cf.5.1768302561587;
        Tue, 13 Jan 2026 03:09:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6337MjTU7AcHaegJA0wueUS4wjvItz665L7mSv3oMtkL95AZzYVlHESIEliD3kp9PgHh1Tw==
X-Received: by 2002:a05:622a:110c:b0:4f4:b372:db38 with SMTP id d75a77b69052e-4ffb49228d5mr242132371cf.5.1768302560937;
        Tue, 13 Jan 2026 03:09:20 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm19664879a12.29.2026.01.13.03.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 03:09:20 -0800 (PST)
Message-ID: <f34abcca-6b09-4f6c-96f3-e2295a82284e@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:09:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/7] qcom-tgu: Add signal priority support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-4-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109021141.3778421-4-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5NCBTYWx0ZWRfX8OgOwdBhIU8D
 bHKmT/IwtJbQu1mXeo27ZBuRetDCOGuei5N67YAAau96DHvQVRrmqdgybjzNxolUIwirzlwxKRx
 NOpQvMkaAoLWQV3rnXPJhimKOwbEb00WLi/OxcdN391WdnELAjW5vQRAauj7oHSrtyYXIaOeunn
 nkR0E+aDtymw7ogAljjRlaL3vC8orX0vSn+4anGg/vfZdcRr6VCCcb7GUMmdhKeH/wRCsFA1KMu
 T9DoMeKsdufhVXcO1YkVd2ezmBNyVNfLL8PexmIzD55GX7+P9WrsaOCK61j5eEO+cW/cmNcTFhH
 x+zUAtMhReOfYiMZ2+E3ACQz5WtkGBd2pEKpWsIGmJKEZNbUu7ZQT6uv5FG5648cze9Y+dvsekj
 7FPr+a7M9iEDY+VogoOPXJngeqr2lYKDKyHt0yDGaCBaIgoWIDMYLyd0S+QFBAPeBD0YBpIQsqH
 UB0XUFZaNjtJAyDa/qg==
X-Proofpoint-GUID: CaYvr_FT9qgwm0gIfWA340xjHDXiQsYj
X-Proofpoint-ORIG-GUID: CaYvr_FT9qgwm0gIfWA340xjHDXiQsYj
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=696627e2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=v85vifYcghIHyo4UzKcA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_030923_508881_49B1D2E7 
X-CRM114-Status: GOOD (  21.94  )
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
> Like circuit of a Logic analyzer, in TGU, the requirement could be
> configured in each step and the trigger will be created once the
> requirements are met. Add priority functionality here to sort the
> signals into different priorities. The signal which is wanted could
> be configured in each step's priority node, the larger number means
> the higher priority and the signal with higher priority will be sensed
> more preferentially.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---

[...]

> +static ssize_t tgu_dataset_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t size)
> +{
> +	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
> +	struct tgu_attribute *tgu_attr =
> +		container_of(attr, struct tgu_attribute, attr);
> +	unsigned long val;
> +	int index;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(spinlock)(&tgu_drvdata->lock);
> +	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
> +					 tgu_attr->operation_index,
> +					 tgu_attr->reg_num);
> +
> +	tgu_drvdata->value_table->priority[index] = val;
> +	return size;

Style: some functions have a \n before return, some don't. The former
is preferred

> +static umode_t tgu_node_visible(struct kobject *kobject,
> +				struct attribute *attr,
> +				int n)
> +{
> +	struct device *dev = kobj_to_dev(kobject);
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct device_attribute *dev_attr =
> +		container_of(attr, struct device_attribute, attr);
> +	struct tgu_attribute *tgu_attr =
> +		container_of(dev_attr, struct tgu_attribute, attr);
> +	int ret = SYSFS_GROUP_INVISIBLE;
> +
> +	if (tgu_attr->step_index < drvdata->max_step) {
> +		ret = (tgu_attr->reg_num < drvdata->max_reg) ?
> +			attr->mode : 0;
> +	}
> +	return ret;

This is very convoluted

How about:

if (tgu_attr->step_index >= drvdata->max_step)
	return 0;

if (tgu_attr->reg_num >= drvdata->max_reg)
	return 0;

return attr->mode;

?

[...]

> +static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
> +{
> +	int num_sense_input;
> +	int num_reg;
> +	u32 devid;
> +
> +	devid = readl(drvdata->base + TGU_DEVID);
> +
> +	num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
> +	if (((num_sense_input * NUMBER_BITS_EACH_SIGNAL) % LENGTH_REGISTER) == 0)
> +		num_reg = (num_sense_input * NUMBER_BITS_EACH_SIGNAL) / LENGTH_REGISTER;
> +	else
> +		num_reg = ((num_sense_input * NUMBER_BITS_EACH_SIGNAL) / LENGTH_REGISTER) + 1;

num_reg = base case

if (num_sense_input * NUMBER_BITS_EACH_SIGNAL) % LENGTH_REGISTER)
	num_reg++;

?

[...]

> @@ -112,6 +250,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>  {
>  	struct device *dev = &adev->dev;
>  	struct tgu_drvdata *drvdata;
> +	size_t priority_size;
> +	unsigned int *priority;

reverse-Christmas-tree would be nice


>  	int ret;
>  
>  	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -127,12 +267,32 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>  
>  	spin_lock_init(&drvdata->lock);
>  
> +	tgu_set_reg_number(drvdata);
> +	tgu_set_steps(drvdata);
> +
>  	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>  	if (ret) {
>  		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>  		return ret;
>  	}
>  
> +	drvdata->value_table =
> +		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
> +	if (!drvdata->value_table)
> +		return -ENOMEM;
> +
> +	priority_size = MAX_PRIORITY * drvdata->max_reg *
> +			drvdata->max_step *
> +			sizeof(*(drvdata->value_table->priority));
> +
> +	priority = devm_kzalloc(dev, priority_size, GFP_KERNEL);
> +
> +	if (!priority)

stray \n above

[...]

> +#define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
> +#define TGU_DEVID_SENSE_INPUT(devid_val) ((int) BMVAL(devid_val, 10, 17))
> +#define TGU_DEVID_STEPS(devid_val) ((int)BMVAL(devid_val, 3, 6))
> +#define NUMBER_BITS_EACH_SIGNAL 4

"TGU_BITS_PER_SIGNAL"

Konrad

