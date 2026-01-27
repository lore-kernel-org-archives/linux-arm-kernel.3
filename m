Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA53D25923
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 03:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnAwXWL3GpUOqmGUJiuTdNi//qtxXIIbE2DSDpIS5lU=; b=B4AZm/AgA13M8iByX1vLrP6Kzv
	delbnhOaSa97HTRdJLQ7D1KD5KMlVgyoB9stx46NMEU6OU+heK/Xi4ehLqeECrKZw9giB0P9bAKBs
	gFQwyejfOv9Txm3Bz36dL+1LezfGP5ZegHxqBQ6cPcrsSvb3truNFWPYP5hQobL3J8d9d6IjQex4K
	h5LQtdJS6leyHLoJkV/F5HaxFp/sSErYTzIlLwf15YxeLzSG0fa9DY9iIvaeAsHkTCzIU2gWzosxI
	OGZ9NllQK1GWKbofqYZ9NnG7syNj1kYhZeBWh+18BxUjkUS9kJxjrFbenowx0hWEm5YnW5IuMGEdj
	gtQw3/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZMh-0000000DXzl-2Exz;
	Tue, 27 Jan 2026 03:03:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZMa-0000000DXy6-13M9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 03:03:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgJkm2880235
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 03:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YnAwXWL3GpUOqmGUJiuTdNi//qtxXIIbE2DSDpIS5lU=; b=hP80O4utmL7254mA
	D9x4+vXrJ0TYoP5rgBv7lO4xDPt3MrB9lML2F27eyjGIC9zyLD9K06Eob8zT1/yG
	sj2P6uhHe0PIr3U4yqWF0Dm5rmluIt9sWf5heQGP0hETp7rWqtNs97iqFFFtUs5j
	g0b/dbjwfPTRypwWCc2+Da+efV00ms5RDI+FBjb+Lu8nQ86fX5cWtTS16QBYdVso
	mvWDOmGWmtbKWJ+gAt+OH9UDcAcsAHfgaHUaHz04DGxqSed2rdsJxY9+ak09u3G4
	NeJOGyKofd7lKyV9vlEtVRNPH877f5LHMhf6Hl5u99/nmGV2+ci+GpA1xz+3bWcO
	w1ElOA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs0une-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 03:03:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso488799a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 19:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769483010; x=1770087810; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YnAwXWL3GpUOqmGUJiuTdNi//qtxXIIbE2DSDpIS5lU=;
        b=Q6yFXiPV7uApkKNXXMsRG4mpeRYsuI9b0qNsZDgZtEaydOTCYDJw8g/ZRua67dkSlj
         Xyr//BaCdE6fnk53ETeUpWNdyn/XPzxvDM+de5OJQmQ4sXydm5Z6xx1HmJOFS16NXoGC
         hkdhVcympOYWBXWyEgsB9uW0c5SV0TebItcS7qVxzNWpu23Nruugxwiq6mIsmBR/2sXg
         qyYLk8p3xExV2FcO5AIiC873DkmbSUMW3icaQXobFxxYg+in3QGToi405gK4H0uO8v/y
         WTgQAfhn+Cg/dvIbL1SXestClDjuMzpUlroOk++baIBFDxUCoIv7vJn9d7ckoINGJEfT
         Kb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769483010; x=1770087810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YnAwXWL3GpUOqmGUJiuTdNi//qtxXIIbE2DSDpIS5lU=;
        b=LNSyLwtoObFFj/8B3q4Z4tn8q5kIQ2rvRzyKAF7RN4MsEYdAWhU7YCl8EhXeD1noyT
         qvft8oquegAxLjiJovrzUoPQzIyF4ls88Zeyo7LfSdIBAJa4NoCWauj5yOAEABsEnvu5
         mqtfAUeRZJNEdIe2OxG+qctpmEoNNANJBjDu1HHT2z7hRX6vhb5cNJgmb62T6MjClv4/
         CHz0Am2hJXrQ2STDj4JkKCfb2CvW1UJN9cWFaWz64m05lvfwDUDeu+6ljkvPUb6uIN82
         3LuhsJugJMyOKIeeVP5Ezt+RR+lKR2dVlB12mME5ug8GXEneQKljjOPGde4FqpOOo2Ts
         TScA==
X-Forwarded-Encrypted: i=1; AJvYcCWI3yQ5j/zJ+IEGTTSBR53PGU0nVyjPGOyu8oI3foZbdlf7llHXBaoQmcLYXk6ulYj1K5ZoT+uEqnr8JO87UYqI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9v7wgLSuJ93aR09WRlYnPAt2THSgNSY5yrKk5lZLgZ9S9QTYm
	levEghCF6LoafkOs/XbFDgF9HVcSsCBq1HheLMc3mfFyWlq3y8uEjrzf1iPhPbFHtu52FUCGldz
	dBzhPE091MNBJd0u1ESZuSqIKrNG3G0ABA137LRAS2vve88mbq/BfX1zYtc+c6iBUXBm7vjbApU
	OxQg==
X-Gm-Gg: AZuq6aKte36Wu2Rx6KHZLeagrk4gGjIIUvN0bjspeYw8r8ErihBk8UF7CR4q9msNa9y
	2QCOXtYV70UWWGaXp7bCPYqkarONUPn4fL36D4xC2nvh8ab8cFggrSUNafezc2pB0mIMKdpym87
	eZkRONtxVALC0tj8Ii6M6KIgR7+t7AMlZxEByV/SmV0n6xjSOJdMsjtX55sHT3Nopw5unQTtz9M
	K1MIg68OW0QPwYUiEx7FrU/KbuW1J4qgVzwM3Jt22cJ4yOBpWq9L+HenkLXoT+etC7KJ4lih9hj
	WIf1CVQEJkQ4ikfCrNnzuNCjdG/t/c5vR41Ete0ab1xr2xLBuo+IKmu8h+bWn1rH7qlBaPIE80W
	UYLUaWPaW42cP/Pj+Lcr2Xe/VUirmvxgRMZSR7K4=
X-Received: by 2002:a05:6a20:3d84:b0:34f:ec32:6a3c with SMTP id adf61e73a8af0-38ec62de194mr146416637.28.1769483009935;
        Mon, 26 Jan 2026 19:03:29 -0800 (PST)
X-Received: by 2002:a05:6a20:3d84:b0:34f:ec32:6a3c with SMTP id adf61e73a8af0-38ec62de194mr146380637.28.1769483009319;
        Mon, 26 Jan 2026 19:03:29 -0800 (PST)
Received: from [10.239.133.242] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a425254sm9558200a12.29.2026.01.26.19.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 19:03:28 -0800 (PST)
Message-ID: <e693d33a-5852-451d-b08c-6e822cd1543f@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:50:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/7] qcom-tgu: Add reset node to initialize
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-8-songwei.chai@oss.qualcomm.com>
 <7dd40fb6-38a7-4e29-823b-5c0b2c66e3df@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <7dd40fb6-38a7-4e29-823b-5c0b2c66e3df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TgOtPbZ6xW--iuLzkcEFl0b3p_8VvwIa
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=69782b03 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aDFzzllK5DXHcxDTN8AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: TgOtPbZ6xW--iuLzkcEFl0b3p_8VvwIa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyNCBTYWx0ZWRfX7YBpg5D4seEl
 4uGvfiHh3SSQNmJFW9ao70IOV/IDw4oSKwWvXFIqyW524sNFlj0pzq8GOzux1fwPqFhwaEgbDk4
 11KCAHnb3r9P7QwOkiOUyuZ0U5Ep8ji8XGoF4Rcdu4bTfw0W2WH1GMdXCyOCQrD/6ALKdgMuwPe
 qMvCJSFaD6uGCI1w0CPce3ZsmCA2UAPUfYWg0YvY+d2GVyM7+7jgpOS6hiYQ8l4BQwhfAZI+ECS
 bZw4hpuayoRtp6wWWHBkixmiTOc0hjkxJimiNacmiuCSczbLaB9p2A0sWKFXB0gzJcygBQeYqwB
 vmmxKkQzO5A3DMoDeS+gjo7ZsIC3IaKDRVWUX6lItRRbWXNMo2UPrW/cYhQ8bfg4/XLd4fUmU2r
 v38RjHpTsJJ/cAf7dyNnCSeNKNC8kICwcMTxM8+VA3XgSPCQ8CnPhDQDGwHGLQ/E+QlSpCXdPQI
 1JdjDWkjpWIyflZSzjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_190332_431378_45526913 
X-CRM114-Status: GOOD (  23.80  )
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



On 1/13/2026 7:22 PM, Konrad Dybcio wrote:
> On 1/9/26 3:11 AM, Songwei Chai wrote:
>> Add reset node to initialize the value of
>> priority/condition_decode/condition_select/timer/counter nodes.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
>> +static ssize_t reset_tgu_store(struct device *dev,
>> +			       struct device_attribute *attr, const char *buf,
>> +			       size_t size)
>> +{
>> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +	unsigned long value;
>> +	int i, j, ret;
>> +
>> +	if (kstrtoul(buf, 0, &value) || value == 0)
>> +		return -EINVAL;
> 
> Your documentation blurb promises that only 1 is accepted, but this is not
> the case. I think the previous additions had a similar flaw

I’ll fix this to only accept 1 and review the previous additions
for similar issues.

> 
>> +
>> +	if (!drvdata->enable) {
> 
> I think this check needs to be made under a lock, otherwise something else
> may pull the plug inbetween
Will move "guard(spinlock)(&drvdata->lock);" before "drvdata->enable" check.
> 
>> +		ret = pm_runtime_get_sync(drvdata->dev);
>> +		if (ret < 0) {
>> +			pm_runtime_put(drvdata->dev);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	guard(spinlock)(&drvdata->lock);
>> +	TGU_UNLOCK(drvdata->base);
>> +
>> +	writel(0, drvdata->base + TGU_CONTROL);
>> +
>> +	TGU_LOCK(drvdata->base);
> 
> This is tgu_disable()
will use tgu_disable instead.
> 
>> +
>> +	if (drvdata->value_table->priority)
>> +		memset(drvdata->value_table->priority, 0,
>> +			    MAX_PRIORITY * drvdata->max_step *
>> +				drvdata->max_reg * sizeof(unsigned int));
>> +
>> +	if (drvdata->value_table->condition_decode)
>> +		memset(drvdata->value_table->condition_decode, 0,
>> +			    drvdata->max_condition_decode * drvdata->max_step *
>> +				sizeof(unsigned int));
>> +
>> +		/* Initialize all condition registers to NOT(value=0x1000000) */
> 
> One \t too much
will update.
> 
>> +	for (i = 0; i < drvdata->max_step; i++) {
>> +		for (j = 0; j < drvdata->max_condition_decode; j++) {
>> +			drvdata->value_table
>> +			->condition_decode[calculate_array_location(
>> +			drvdata, i, TGU_CONDITION_DECODE, j)] =
>> +			0x1000000;
> 
> This is unreadable, take a pointer to condition_decode[]
sure.
> 
>> +		}
>> +	}
>> +
>> +	if (drvdata->value_table->condition_select)
>> +		memset(drvdata->value_table->condition_select, 0,
>> +				drvdata->max_condition_select * drvdata->max_step *
>> +				sizeof(unsigned int));
>> +
>> +	if (drvdata->value_table->timer)
>> +		memset(drvdata->value_table->timer, 0,
>> +			    (drvdata->max_step) *
>> +				(drvdata->max_timer) *
>> +				sizeof(unsigned int));
>> +
>> +	if (drvdata->value_table->counter)
>> +		memset(drvdata->value_table->counter, 0,
>> +			    (drvdata->max_step) *
>> +				(drvdata->max_counter) *
>> +				sizeof(unsigned int));
> 
> This is similarly difficult to read with almost random indentation
> 

I agree, the indentation hurts readability. I’ll rework this to make the
expression clearer.

> Konrad


