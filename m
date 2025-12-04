Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E105D1CDC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 02:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unAlOHqnQvPypW08kj02As2TqLsKYsUW9rJ3R/A7yzw=; b=xbLL5IEUs2sWNBEEtFCsfZQVJJ
	joHnjGDLuvJN5y3FrV6qcHWOIdWBCAFfHhI7fU9soTXI8JBBsCCm1/QmtIWq3LgG61FFrPbLjXui0
	gJH7zi+z6TLz/HWbnkDyjvSmfBK8X0xSQleDlco1qizPaTuKkOMLzmqJTf0vbrgf7771OUr5iSubA
	w71P5nEmIdgrJ1jiJ0t4x5Sg6MMn5t4/whmSm3yqBX+tTo9QFi09bQ/E7ipz2D1ebyQqAWObDlLDM
	5PfxyLCT24IBIeb6WLEbLjrhjWm3VcU4r+K8wYKCVfAPkK3dQ9Q8jMmbB1V/vK86sEgzrO/mgZJT6
	LxsFc8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQzNP-00000007NXE-16m8;
	Thu, 04 Dec 2025 02:47:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQzNL-00000007NWZ-423z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 02:47:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3IaM1a3329258
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 02:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	unAlOHqnQvPypW08kj02As2TqLsKYsUW9rJ3R/A7yzw=; b=Yc0OygAuVfycr7zH
	qBoNIzFGOvpd34ZFEoS6VIOc2FWcUb5GFHQUWjEQAsvsScyszaiAn64fIfcIqrA1
	7T7rbv79IJNhoQZjkwNdFFdAGjPLaZFyolYF6Q46Kmyvv+6u51UZpREK2niLxo9z
	X8nBOgOAn1+UjN8ssqg1KCHwtfBsnQOxKpF9pHVGB+vQ/6t2r/NaVQQIKea3wMz6
	sNKWa7WMwbNuuIE0xgWjllacw2I7VMDH3Ix/HFIjKwuCPWnPUbt+xs5C4MlDa+a9
	WWpQ+FAKNa0UrPbipxRIcC2D2xXKJnRolBJu7b+cSfbafDb/LQgQtZ9A/DM7k+Bj
	Wz5Xdw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4attmh96d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 02:47:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29be4d2ef78so11001935ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 18:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764816442; x=1765421242; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=unAlOHqnQvPypW08kj02As2TqLsKYsUW9rJ3R/A7yzw=;
        b=HQTJtDibxcNHLHYl0VnlrppCRC4c1uuG/C3vpyjA+8N9scGO+ZjICECzMymBItoNGU
         YFDlW5Z8T4xNLobhAfp83dzLQsog+K6hx5ALb72MZBAlKCEx6UpGPPIc5qHUPPfuT65u
         vidEWqlbr2fw8qheDPwtqpfDbz0Q8C2gBCSOwAaULfwKuuO87KPdEs3Ib/4qbXZrByT3
         qMNKRyIMF0M4PAZqWW12P622NNpY/L9hFwqEYzpyrG98xslDF2W9Ua7LBqh3jCkXDmBP
         A8JUGVgj7OTofK4txGO4MhkftsMFPu/JGr44qbSku02ckoqV9wAFA1Ts0+BZUnOnAwfU
         7QuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764816442; x=1765421242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unAlOHqnQvPypW08kj02As2TqLsKYsUW9rJ3R/A7yzw=;
        b=kq/9DDoKrEZO+Bce/UhW0EAeJLujK6eX0ydkSenqxpOhWIWqScjR4q8Wvuy5UXPptV
         7X6MVb4inmkEHMI7/dohrLoU9/DTDGEXJtV0S9eV8y+cXHILD7F4FQ7/JIZVqavK1MFL
         HUGvF/Fq3hW/b1mnCsxuzmNyi6YNHDjQKRj1YerKgsq+zN7RTIDzggo9UV5gTm8Bequi
         hNaT5inGR/LrjojqtuHc7ziE8U1Up8pTy4dsB7aTR+RbreSykoqtrUJ8z5RCDY6GiP6s
         V+1O/DHufp9MjoRhsafsRPz5nacxAUDONqrX5ZVHFd/Ucb6SVokz/KlUy3+foJoOMY8X
         42dg==
X-Forwarded-Encrypted: i=1; AJvYcCUQlEMnkaipyIRGWtR6I40dlxmgSJfYWZzorlW0LDxucMg+1VYkpsLC0QwY5mjOkDXyl7BEz7Df6ce3fYLGp5qT@lists.infradead.org
X-Gm-Message-State: AOJu0YwBHADMjUKeZA91e0cT66ZkzCEW/qmHpUA8YodIvJEoLiGHIDit
	ifLT3FkWgU834/H3AValTqHdaj4k3XoJ5BakKHI280Epki381swGxS6IyXKVDP9Xb/YlMWOtYEE
	a8YBwtCg9vGfXAsHLaxBC8rW0JXd09l30iSUrbLu/V9kXbs3i10UBtBQ5RAOagnGE0P9ZBouZi1
	gwlA==
X-Gm-Gg: ASbGncsmkfxt80QNTH+1xw5xM4H8/nYjG50/jB/d/6J6vPfbvNAHwv7zaDdr4VVCFeU
	aj6zVKz7JVVkgwzcL1u6X7ajx299wZnBO0pjPLPa89y7g8BOMm5BlYpOKeOt/tAoBnwptXJrqde
	1v/PBbEfg4WxmGoXqNZsy7J4YBgKtCwB3rdNjQMe0eTFpEGOgHUV/N97M/6W0ziHG2lQH2vT03q
	Jrkw1k+tibXb0B8RqzHeA2iiSLuuJ/FzAUgcp7h2ANvaXWrNaw7hF4dLkrhpUhHXO5j8FhSoJy4
	lz4lZGlv+tpMzqeOwg1bi7/Ufrpg7Wre8373x6eBmSnprkCvv451lX18pxlTfhnfcBV88WUp47j
	mvaO2shNIdh64cz/c2IlCIDypitjHP1jdTuyAEMg4KBSFyVQlhgzKYtVx9kX7C7tIMdRdg7/c5m
	4=
X-Received: by 2002:a17:903:fa5:b0:295:f1f:65f with SMTP id d9443c01a7336-29d6838d02cmr48784535ad.31.1764816442028;
        Wed, 03 Dec 2025 18:47:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt9B9cBT8Dxz1xktUJJG9Xh+E/RA69io4sm0kf0sHRUQn5y+QS5EHh81B4YdAkwJm86a5ByQ==
X-Received: by 2002:a17:903:fa5:b0:295:f1f:65f with SMTP id d9443c01a7336-29d6838d02cmr48784255ad.31.1764816441484;
        Wed, 03 Dec 2025 18:47:21 -0800 (PST)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaabfdcsm2450395ad.75.2025.12.03.18.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 18:47:21 -0800 (PST)
Message-ID: <d5f1dd06-1c53-4656-882b-dbf771e3a125@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:47:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] coresight: core: add a new API to retrieve the
 helper device
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-2-1db9e621441a@oss.qualcomm.com>
 <d8c6111f-28ba-4046-bcd5-67233e8ed4ca@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <d8c6111f-28ba-4046-bcd5-67233e8ed4ca@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w8WzwGdNRiKQUkSlBQr2519HOJoxyGeY
X-Authority-Analysis: v=2.4 cv=NcTrFmD4 c=1 sm=1 tr=0 ts=6930f63b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=tbyorNNmht2swkRmfsMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAyMCBTYWx0ZWRfX7tL4Bhrjjh2v
 q4Lt+fThuQ9mE5h4whycqm/4aHELtQaRtnajwBNdLfaZ577iVV6AcIWnGuvfWqQ913KpRnrZlom
 uHT7t5c8Z9A7iCLZCSdHG7ZsuLr/sqaOqKY06Yv996j7nB67upUaEDRGMfIFoRKDNW4+Sb4oTDe
 QHDlJYOA0YIfRtN32Z85SQS4BDPYoQesAxXWI7cme/fm7KYJFCb7GGzSXcbzw8m4buwpwVzmSmO
 kwEZ7PRRscoOMLCo07LbqHV5gNt8W2AE51cxUZGj1f/E9g7oTCqp/sZOxlpjkKZmCTxOQX/uxrU
 b7dwcqacouRkbrq06SivyWfFJYRPn+5Jyh4pDnXjhMPCE+RnVO8k1G9O7mPfzLaPGvpUHHWMGNo
 oMlVkwKvyMIKEq1eMx0LhQy95T7lNg==
X-Proofpoint-ORIG-GUID: w8WzwGdNRiKQUkSlBQr2519HOJoxyGeY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_184724_283737_E0317D97 
X-CRM114-Status: GOOD (  21.65  )
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



On 12/4/2025 12:15 AM, Suzuki K Poulose wrote:
> On 08/09/2025 03:01, Jie Gan wrote:
>> Retrieving the helper device of the specific coresight device based on
>> its helper_subtype because a single coresight device may has multiple 
>> types
>> of the helper devices.
>>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-priv.h |  2 ++
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 042c4fa39e55..018b1119c48a 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -580,6 +580,41 @@ struct coresight_device 
>> *coresight_get_sink(struct coresight_path *path)
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>> +/**
>> + * coresight_get_helper: find the helper device of the assigned csdev.
>> + *
>> + * @csdev: The csdev the helper device is conntected to.
>> + * @type:  helper_subtype of the expected helper device.
>> + *
>> + * Retrieve the helper device for the specific csdev based on its
>> + * helper_subtype.
>> + *
>> + * Return: the helper's csdev upon success or NULL for fail.
>> + */
>> +struct coresight_device *coresight_get_helper(struct coresight_device 
>> *csdev,
> 
>> +                          int type)
> 
> nit: enum coresight_dev_subtype_helper subtype
> 
> Otherwise looks good to me

Will update in next version.

Thanks,
Jie

> 
> Suzuki
> 
>> +{
>> +    int i;
>> +    struct coresight_device *helper;
>> +
>> +    /* protect the connections */
>> +    mutex_lock(&coresight_mutex);
>> +    for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
>> +        helper = csdev->pdata->out_conns[i]->dest_dev;
>> +        if (!helper || !coresight_is_helper(helper))
>> +            continue;
>> +
>> +        if (helper->subtype.helper_subtype == type) {
>> +            mutex_unlock(&coresight_mutex);
>> +            return helper;
>> +        }
>> +    }
>> +    mutex_unlock(&coresight_mutex);
>> +
>> +    return NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_get_helper);
>> +
>>   /**
>>    * coresight_get_in_port_dest: get the in-port number of the dest 
>> device
>>    * that is connected to the src device.
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/ 
>> hwtracing/coresight/coresight-priv.h
>> index e51b22b8ebde..f80122827934 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct 
>> coresight_path *path,
>>                      enum cs_mode mode);
>>   int coresight_get_in_port_dest(struct coresight_device *src,
>>                      struct coresight_device *dest);
>> +struct coresight_device *coresight_get_helper(struct coresight_device 
>> *csdev,
>> +                          int type);
>>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>>   int etm_readl_cp14(u32 off, unsigned int *val);
>>
> 
> 


