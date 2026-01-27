Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D4ED25920
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 03:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhIyxCwm/BJ04o7hWF6DK1VS1fUMNrNwJkBwJoBorf8=; b=BByVc5Dt7wyBPoeQI5OrG96cQ9
	liO/UFRt1BZkCTbyOZmzpdFC+oiEtR6pKjVlOIHKWRf7kqzMKbqdRvgNibsbRc73OGmRdeNOnPA98
	v1Iibe1TMdQiV6M/IYewq5VES5UUwFJ5QqKMBDMrQz4QDrNREiTYctiGmNa443hCMqsCBScBp8Iwx
	myRc2fV+yYlQdtVhL3//wCTd2h2+Ho6t3gRQEuQi+Hi9U1RMLj83xWM8CraGO2Wavvu5+7EIXffRJ
	UnlOjpNbFbHrJ9c24cvB0k3PjMIHwAADydpLsPANJEJWCgoo5xvAWy/E3+hRYHm7+4ke6RsqL2sxh
	PJq7DdlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZMV-0000000DXx1-0H5d;
	Tue, 27 Jan 2026 03:03:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZMS-0000000DXw3-1SOg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 03:03:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgtDM2943702
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 03:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EhIyxCwm/BJ04o7hWF6DK1VS1fUMNrNwJkBwJoBorf8=; b=QlIVMZJxT321ZLMs
	cHpBLRGbQZPDc2GeP4NTxwSiPbaUEAVWJnXvrqGMLOpMlIoDpVzx8H3XhKJE/JNd
	ygWdLRmGiLC4C28q5a7yOl9zN8Qhw3Pm2qJ1pGSwtIeRdUEwMDq3ng9aT2rngigX
	UJ6d8RW5rvcuwOtDGClMHjluNRIOW2PvhruAAiln/cmlxdVbsXkdimT7hsGWjhe7
	D8vM4bKEVtbSkzy7C9bcAws4ZvVzpcGucHnYUkEykcZyek1evOmzK6T7L0RlHSvu
	xzA88nN2K0RBhAuexXG9I0IAsIwBJV2kogwnqZeAbsh2uCT24ORdR/ZN6itkV2qe
	Go/27A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx2683asj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 03:03:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso2489264a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 19:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769483003; x=1770087803; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EhIyxCwm/BJ04o7hWF6DK1VS1fUMNrNwJkBwJoBorf8=;
        b=CeuWXXJZ0LR5CtFIe+GjtIhnuEShbyxs0J8kEcZy8iWpHY/n/F14ae/WXeGKKUUYDc
         qmlaaiu8PR2fQshBCdC6WZB2caMTEudR3IhaYhIASCTDoVMjZnwtJvf2ksFLmMGO9ZCu
         t4ZxXCXa8YjRrRp0iyJTlf/B7MmyCT4WGDx/52/9CoBXCs659XBF+89mfxegE72OENqU
         7fN3bO9sKVAw8J0LLQcu9HcJWtJirQp9jKx4nejHP0IylCn/IpDbMBV3ImuO4GBBEPix
         N+83cN05kFWS/tobXUhZBG/sCuWxxr17975QmkCCUbQFs5fmzPK+19VPQn/vkmqTXGnC
         Khyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769483003; x=1770087803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhIyxCwm/BJ04o7hWF6DK1VS1fUMNrNwJkBwJoBorf8=;
        b=mpl85Op+9+HE7VRkIQn4JVUG67jUcYyOaefBRWbXM6runxKL8JhoJwNPABkBO9Fgfi
         BvChX0keQtpW0k9PUEvCByrANfpt2lK5Rc0aoKK1WK/TTHyWG5Eg5qKqrXocz+eKPxgX
         9jt+HSS4NG9jPfVC15EJw8f6yPuiM8tkyizeP/MQNdFTRdsT6PpQerl4zjsQ2y756Hx0
         X6qlwGyWQWSEKTLy4xAlJxHy5n8NiKYi0ssHfqo95WnG+uh4ptZ5dSph2oz4DfQZiiaj
         y9flGvgsAHtj4XIBi2ErwCXOVy7WrHxgtlLrASMmxVN8mjFfnMxquVxoqaJa9VgGU1x6
         JBtw==
X-Forwarded-Encrypted: i=1; AJvYcCVzB4vATR2WySfv7LBEF/YyYE8A72I6GqopIu24orHrbkAM22KqSBtatfaCePU5UR+7OHUfDe2qsuu4nTw1I3t6@lists.infradead.org
X-Gm-Message-State: AOJu0YzahDXyg7dEKvgE3R5QEvB+GUS8WXS97yOcpxt199LcD1b7yQdo
	7cwzdjhu2bFSPkj3/uyhTfDy+Uxu5nGgDLDmPdx/nzr2alLQd7d2duTE3If85MiIHaEhAD+7wBV
	XkYf9minXFOOy/1HLaV7/8j1uZXmxpnqPHH1BKtde6i35UHlDWpLn23yuMZUYnFnc2673lvf/De
	gfMA==
X-Gm-Gg: AZuq6aIuJPlSI5BYqcdyrUI0Fy6g63HVOcaZ203gJEOdv/F3+3sntEDp0B2Ba8v+Pm1
	/pMPV5BSzBcaSyAavNc1qSVI+o96d8xzOkivQLH1+w5rnC6v2BEPWazjc70kOmrKK81kvXRk5I2
	7OAXcf91PsNACH//FrA6jaDXXo8xvQVU7zGtnVpMPglLqCV/XM/M0CvrM8zEBQhBJfyY4dNAPUL
	aZAGu9ovrIiNvhcOVZ4cCsGxbQ8DYQPgNorKHZuzEyoqIbU7AXmjO8jS9D+tuJgCl4cuv/lLm1J
	/F0/udHKf0BGyaGs9NRBSN5123aVYPNmSk3CJBcIL/ZMz5iPr3i9dwjCaJtXzkRJ9hJQL8iWIkk
	psADYqgnJpWGQljTULs7zZHKoCHCGNQ/WMSNmBck=
X-Received: by 2002:a05:6a20:7290:b0:38b:ecae:670c with SMTP id adf61e73a8af0-38ec62c7248mr146926637.25.1769483002934;
        Mon, 26 Jan 2026 19:03:22 -0800 (PST)
X-Received: by 2002:a05:6a20:7290:b0:38b:ecae:670c with SMTP id adf61e73a8af0-38ec62c7248mr146895637.25.1769483002422;
        Mon, 26 Jan 2026 19:03:22 -0800 (PST)
Received: from [10.239.133.242] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a425254sm9558200a12.29.2026.01.26.19.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 19:03:21 -0800 (PST)
Message-ID: <c1efbad6-4ea6-4261-b7b0-7cb8081ecfb1@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:43:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/7] qcom-tgu: Add support to configure next action
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-6-songwei.chai@oss.qualcomm.com>
 <f211054c-ecb7-4f90-b9ce-9fdd7710c8c4@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <f211054c-ecb7-4f90-b9ce-9fdd7710c8c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=69782afb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wydLmLRrjYZFsxpKGVkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyNCBTYWx0ZWRfX1SJadAPycg0S
 sbA7PdLCw55TtBO9kT6cdKoIwoQQ5DNWpfN2ANfQE8jQlu7v9HdSBjJFQ2S3gwCSny0lLFrZg1/
 cDl2IkDLgk6rdH/6WK4E9bPxvavybzMUeM1P38xZv0W3tpooZKldy6SuPPFW+MDU4Jp+KXmY3tY
 bPQVS5GXJmr0cmXvwxt5TWG91NtNd7GCzCydX4wcdWc8ZmLcx3+J8V8r7JCIsTsaiFK1IGPiu5Q
 AW80GSgyWUrkrhHzaZ6fZeI0g2rEcpKQ2swlzBxs7Ys+LhxQLyA5uTwuCcthaWmrUKrTPKV8PgZ
 h+uc9hBLk3x5mbwgDvVOdv1VfAGjVu/zGsW8QGXNdLKbP7DVJXRO9t6PMLvp90q1U7TPrvio+Pt
 cIXXzjpcadcDMBbBLKGak+etBmIzZwLLQ5QEbDz6MrFgpjHAsqOKQ6LORqQGRp71VPgxfAW77h+
 w6WADSI3aZmAM/85JUQ==
X-Proofpoint-ORIG-GUID: FMuaybhfdA2xXMkysJ-Ey6ds79JPhEW7
X-Proofpoint-GUID: FMuaybhfdA2xXMkysJ-Ey6ds79JPhEW7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_190324_391255_ADF5CD68 
X-CRM114-Status: GOOD (  25.31  )
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



On 1/13/2026 7:15 PM, Konrad Dybcio wrote:
> On 1/9/26 3:11 AM, Songwei Chai wrote:
>> Add "select" node for each step to determine if another step is taken,
>> trigger(s) are generated, counters/timers incremented/decremented, etc.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		case TGU_CONDITION_SELECT:
>> +		/* 'default' register is at the end of 'select' region */
>> +			if (tgu_attr->reg_num ==
>> +			    drvdata->max_condition_select - 1)
>> +				attr->name = "default";
>> +			ret = (tgu_attr->reg_num <
>> +				drvdata->max_condition_select) ?
>> +				attr->mode : 0;
> 
> similarly to my previous comments
> 
> [...]
> 
>> +	for (i = 0; i < drvdata->max_step; i++) {
>> +		for (j = 0; j < drvdata->max_condition_select; j++) {
>> +			index = check_array_location(drvdata, i,
>> +						TGU_CONDITION_SELECT, j);
>> +
>> +			if (index == -EINVAL)
> 
> stray \n
>> +				goto exit;
>> +
>> +			writel(drvdata->value_table->condition_select[index],
>> +				drvdata->base + CONDITION_SELECT_STEP(i, j));
>> +		}
>> +	}
>>   	/* Enable TGU to program the triggers */
>>   	writel(1, drvdata->base + TGU_CONTROL);
>>   exit:
>> @@ -225,6 +258,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
>>   
>>   	devid = readl(drvdata->base + TGU_DEVID);
>>   	drvdata->max_condition_decode = TGU_DEVID_CONDITIONS(devid);
>> +	/* select region has an additional 'default' register */
>> +	drvdata->max_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
>>   }
>>   
>>   static int tgu_enable(struct device *dev)
>> @@ -356,6 +391,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
>>   	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
>>   	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
>>   	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(0),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(1),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(2),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(3),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(4),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
>> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
>>   	NULL,
>>   };
>>   
>> @@ -363,8 +406,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>>   {
>>   	struct device *dev = &adev->dev;
>>   	struct tgu_drvdata *drvdata;
>> -	size_t priority_size, condition_size;
>> -	unsigned int *priority, *condition;
>> +	size_t priority_size, condition_size, select_size;
>> +	unsigned int *priority, *condition, *select;
>>   	int ret;
>>   
>>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> @@ -417,6 +460,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>>   
>>   	drvdata->value_table->condition_decode = condition;
>>   
>> +	select_size = drvdata->max_condition_select * drvdata->max_step *
>> +		      sizeof(*(drvdata->value_table->condition_select));
>> +
>> +	select = devm_kzalloc(dev, select_size, GFP_KERNEL);
>> +
>> +	if (!select)
> 
> stray \n
Will improve this based on the comments above.
> 
>> +		return -ENOMEM;
>> +
>> +	drvdata->value_table->condition_select = select;
> 
> I don't see a need for an intemediate variable here

This was done intentionally, following the earlier suggestion in v9 to
introduce named intermediate variables for better readability when 
dealing with allocations.

I’m happy to inline the allocation if you prefer the simpler form here.

> 
> [...]
> 
>>    * @max_condition_decode: Maximum number of condition_decode
>> + * @max_condition_select: Maximum number of condition_select
> 
> Maximum value, perhaps? You haven't explained the feature very well
> so I'm not sure what this is supposed to reflect
Will add "Maximum value" description in cover letter.
> 
> Konrad


