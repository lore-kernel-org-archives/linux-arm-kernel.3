Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC2DD1CDC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 02:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVS7raly54q0rZvgh+jBl9xmb+xtSnb+plPkT836p9k=; b=q6FWptDBV0PgXCGJl1y5TZwfeI
	PcYLw8pNo0zkdFXuB2zLDeGF8K0ZiaKPP9ocu1gI/XSGPp+G6SY1kvPb0y9Y/tzjfFveC31WgoAQf
	ofd7T8J41sj8fd/UitUsu2qeBUTzeetSoSVgWIC1gtVAPGO4qB3+oTJpVZhUlRy35nEw4J1wIKO2O
	o0VN9C5tid/Q+maFxXEotZtbrMTTVSbdJfj/P1dpKytOwgFN4F08tSONKjq24KkbmdtLaqiY/gdjf
	1Sg/jfphb0k0NvdSlvZCalsFMahmCCazNgKAs/2QCywPYG27g3dKmsuRpinW2WCNp+/tmMCrISwBw
	QSvd7H8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQzLb-00000007NP1-3Win;
	Thu, 04 Dec 2025 02:45:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQzLY-00000007NOd-3tWY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 02:45:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3Ia38D3328923
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 02:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mVS7raly54q0rZvgh+jBl9xmb+xtSnb+plPkT836p9k=; b=hPnhsTbZ7fp8xKMh
	jdhilo8QCLKnWCHEALzpbteXVuG7A7GrxC9JZuU8kQN68l3eLQ0zFnabaVeiAutk
	5hQ9+Pll+ozdGOP903ZXY0HdCJEjUNRjHU6jt3PoKXqPIYXZNj/yLS5Msjmltuie
	2z/DBSTkE2THajN1GjZP+/dRz1SNab2iSLA7N6Ap/Y8Qspq54tAVHP93CRi5dV+r
	qWgf4EA4NQ21lzUU7lyHLbekmYzcCR7mOSjrcd96SvE1TdiAo9DqrGuM0psEmn2e
	p0fLT1jR30Bl7kQpczaL8uFE6M9FYhBdqAYreRPeMk+vKC5jNjqJATpb2L18FxoF
	MlS1zQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4attmh966m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 02:45:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b90740249dso689175b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 18:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764816330; x=1765421130; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mVS7raly54q0rZvgh+jBl9xmb+xtSnb+plPkT836p9k=;
        b=MRajz27/wvVwB4Kn2iH/CKJxBVrVZyiT9wJRPVvDZRHmWlvafIzbVjkrFnnMr5rAp8
         tZyly4rxQMjgaJbHqvD5xh8r4jfEc/TtK1z+7eTNqtUlStvSxIB5pDYbLNwennlQg2v5
         CYES4nEF+ppWbbqhQ/8stXllaIjX4PTVBngMaHHDeex78eKZR8uWLys9z+o9B5ABVLLA
         tywgC1FhyDDOv+a9NsnX3KQ1fRMuKc+FW+A28bP9EWfZYq6tLP3MBWIQgMAOf9x2qdEn
         Ox9IN+hDLZwtEiBVsKTTwm1qBCa1rDFAcwClQ2lXRs/2k1dEa5WwGZ4yemjYWQTMzDNu
         VZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764816330; x=1765421130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVS7raly54q0rZvgh+jBl9xmb+xtSnb+plPkT836p9k=;
        b=ZaAL9wv9pJG7lZV8gfx99DHuy3be397X4/uoPHBL4i0LD2I94J3uOf3yiXHc8Z3Uns
         CJu4x6Sh5juLOz9UII64IDf2cEZsMTZNeJKoPDMLT7BBmpQj1k6lPocy0bF+V0ILHRMg
         +ov42uCH2gzLiunyOUWZrhZ5dDOho6v1a/oBKf3c1d4SllRsOU2LtzcX4Zkl4C5+hENV
         toKC55bE/zLXjal7KdrkFy0uuK5M+6uOklRH56L+MNL5dPTqLYLOPfVB/fRIuFcCSAE6
         Ot2U7F4FSE9Fd+z3DbAYEdaHS8upR+R/84HLsQ5l2xQvL2jwiQBZNSqNjHywXcZLPRtQ
         i7IA==
X-Forwarded-Encrypted: i=1; AJvYcCURc3zzQy7SyfBYe4Xc6w8OGj9v/P5LAmDqiLSz+v497K9L2nnYxDUjnbOP2sPODPzhfPQjlctMpVfPrAwfeyds@lists.infradead.org
X-Gm-Message-State: AOJu0YxiynokX2UcePE9SLAeO/qv6/7x+BKTUfhg0yT098gNO5CyKqBT
	oMW0i8ro+IqsMHrd0DaS/WVHy/Q1JjcWn383ra93F2tmhfwtnNflEVIis3l4MtA0yUS98xkxY64
	w0UTtFu8nat+t063ChJVkAODsOP+pD5sChnukY1T0r3lmvpmUf4U17uIv7QfbhiYaboTEDHOLK2
	rH5w==
X-Gm-Gg: ASbGncu7XfUGRmZeHeOiK98RSA0RPpKJ9oM2gmLdV3k3Loj369wz3/Cjuh/C1utxKGy
	XS0DV7RrQBiWWVGtDWLDExadKyHcKTYs1pNmpzfukcgEPpGh4zTp6O2zgc0xdUdfGmC8/0AC8XA
	nawm9s7Sf4CIsHtGGrS/N6AlQnQI8HDqkZXVKcsoVcD9y4Xd4JLqEVZSY0oz/kJRBgOcK2L6pW2
	vU6NQqeKYWLbC72j5Apn5nsDox75dQQdn7ZBk0hBWg8PVENF+TdB1426cixmaLgmglxFmjkEsYh
	l5t9DorPpwvQZux8n1u1Xh9EZK/mt7Gv7oIp7j2vL30KFVMGcNyF6BlSPChXaxSvMQj8AcypzWv
	1F2WzH8XEwEKTimoobewLnWKd5oER60LbLFKBOFzbiySGP6hXY0ExFoZVDOaC7QxiPxqvirCwCf
	Q=
X-Received: by 2002:a05:6a00:1803:b0:7b1:79be:1273 with SMTP id d2e1a72fcca58-7e00fbcedaamr5490251b3a.26.1764816330147;
        Wed, 03 Dec 2025 18:45:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE37bJ6SuNkL1ibi+kVSbfhO34dJIPCl5xiwPxofyWOKXbjDtL4lt70R3l5q+n/T6TY9GpAbw==
X-Received: by 2002:a05:6a00:1803:b0:7b1:79be:1273 with SMTP id d2e1a72fcca58-7e00fbcedaamr5490231b3a.26.1764816329603;
        Wed, 03 Dec 2025 18:45:29 -0800 (PST)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a006547fsm370091b3a.21.2025.12.03.18.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 18:45:28 -0800 (PST)
Message-ID: <156d7def-364d-4fbf-b63f-99e1de657f93@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:45:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
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
 <20250908-enable-byte-cntr-for-tmc-v6-1-1db9e621441a@oss.qualcomm.com>
 <29a61f75-df0b-41da-9c8d-3e2ced0a9ce7@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <29a61f75-df0b-41da-9c8d-3e2ced0a9ce7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GzDzUugHduUCXPOG9nZESFHNgIXk8Yuq
X-Authority-Analysis: v=2.4 cv=NcTrFmD4 c=1 sm=1 tr=0 ts=6930f5cb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=fsjGGd5fPUumY84vGlEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAyMCBTYWx0ZWRfX8Pr0XSvlZeB+
 S+60+UP8cGHIz6+3i9BmsEHzBGq6XRZAnkaJkucD65q/aSa/lFbe+yDc6yYTVuHzAEmchDNyShU
 4/JGZY1GbHzDFDKuy04jn+2zGCqmCLnJtLHLsOSER9j+7wwOWTPNpP+cUH9dy8xG2E4OP5+X6zb
 KK6cN8Holi4qzpi9DSwlPZgz2GVynq+EXtYzveRfO1TwNQ/pNT5Zjp6tsKv8mJtC1A/m8DL0xMA
 QsOqYNdjYjhzJr3X9KH3na0EGEvUZiAgCFVoQw5mwfJImb8OafqXouVWyKC+ffYWFNp3sLRMcbS
 v2Q8ycvdXtPywdadmlIc4nrZD9qhG7qGpqTbZ4ifnHamPf/aOYczrC+zMXWd4hpP6lao3XAPYRe
 UtJQOSeNDxgDmIigDtNF80VhmuqpGA==
X-Proofpoint-ORIG-GUID: GzDzUugHduUCXPOG9nZESFHNgIXk8Yuq
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
X-CRM114-CacheID: sfid-20251203_184533_088635_4B0C8BEC 
X-CRM114-Status: GOOD (  20.38  )
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



On 12/4/2025 12:18 AM, Suzuki K Poulose wrote:
> On 08/09/2025 03:01, Jie Gan wrote:
>> Remove ctcu_get_active_port from CTCU module and add it to the core
>> framework.
>>
>> The port number is crucial for the CTCU device to identify which ETR
>> it serves. With the port number we can correctly get required parameters
>> of the CTCU device in TMC module.
>>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 
>> +-----------------
>>   drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
>>   3 files changed, 27 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 1accd7cbd54b..042c4fa39e55 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -580,6 +580,30 @@ struct coresight_device 
>> *coresight_get_sink(struct coresight_path *path)
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>> +/**
>> + * coresight_get_in_port_dest: get the in-port number of the dest device
>> + * that is connected to the src device.
>> + *
>> + * @src: csdev of the source device.
>> + * @dest: csdev of the destination device.
>> + *
>> + * Return: port number upon success or -EINVAL for fail.
>> + */
>> +int coresight_get_in_port_dest(struct coresight_device *src,
> 
> Please could we make this more explicit :
> 
>      /*
>       * Find the input port number at @csdev where a @remote
>       * device is connected to.
>       */
>      coresight_get_in_port(struct coresight_device *csdev,
>                    struct coresight_device *remote)
>      {
> 
>      }

Hi Suzuki

That's make sense for me, will update in next version.

Thanks,
Jie

> Suzuki
> 
> 


