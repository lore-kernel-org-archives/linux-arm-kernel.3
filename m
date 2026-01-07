Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D687ACF6BE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 05:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6ePKBgvlfUS0ntFGW76YYkaLLe8e4OHaogWUUcShds=; b=Ib9PhCwGbCTw7du9xiuVzK+tgs
	s63TgDgibA5cJeNO19U1mvLYq/P1bUWq/Eh0EWRO7UjkDUXtHf4mrwZOMbD1afrznYLdlBaDa0qKO
	XFwtAHsr6FtFSTJ8cJSi73XWfkf+EKAU0tmKlSN4mrS6XwHzznDx5UNgNyeApBDzdVdznbQtBWE69
	eEtfIOcnCoIHx4/M1zOAOfEepPuavOqeDLD5PTY2PCgou2CInilHIBSpt1i8zBxTJcEBSyV0KVQrL
	3mKmVgt8jOaCRC/Y0vW1L+iTg4xJqa+naitoErx12Q1aUpcq5QvTCEduH+CocKUMubrO6wJVXgFJj
	xrjfcISQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdMAp-0000000EBId-3o0d;
	Wed, 07 Jan 2026 05:33:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdMAn-0000000EBII-2i8P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 05:33:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60731QF13889006
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 05:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X6ePKBgvlfUS0ntFGW76YYkaLLe8e4OHaogWUUcShds=; b=jSOXlu2aogZZ1wu0
	Gj5K1m7QVxruYAhOFcLomjNtT6ey68ykRNFyweb1HG2dN9V5voF6hWmKSIPUvyuT
	z9YI71PT58uxPXrAlsipAu03XySWkld3ETmkhwYNfoampOjE1TvcQzUXmH0TKxWN
	L43DfVbXQDtICfhuYzGAmOTLIg2QX5gaA7H8Pia02hRKBjFZAjVX/oJmzNaXfM4I
	sojdFU/8puhbgxT69SfBmWNRsi3MiXIW2IuSIsDpIcrmxcetp7Y6ZFE0hd/HcdT8
	VfqH7l9QAbWEevHo9R5VowVg4gq5DAalTHQOSE4ESvs3U0VNBIwrxZQ6vG1ecWQu
	+A+q8A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6a0j1t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 05:33:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso44122745ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 21:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767764011; x=1768368811; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X6ePKBgvlfUS0ntFGW76YYkaLLe8e4OHaogWUUcShds=;
        b=fqo/FiS+iyKRmQEXjjeWYOdi90cw7UcNZG//897fHEuwvg1i4spQVzhAAp+w2TR7TO
         q5QMtV8TqpHcQOuWxAZmuQyhOJCV5vgXaqpUUiAphi5ZVg1A9HPKd3++HFWwhmFvnCg3
         h1FN4SWb9c68iZFz10DkWuO7bF6Hm6WIeEWzd6pNNQkkoEsmgm1mXLJJn+/SDXUUlNrW
         D7rx+ZtenwqoD6B6hsNK4EkKHlPWgOag/8fiNV7st93NbeX7O0ZgShUkTeyp/3+XW/76
         cIGEt9AJncH91An4BOJE87Ix35MScE5RfOs1wLjHCGyzCmT2YGzp5v5kaM9EyKUpTcEe
         wQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767764011; x=1768368811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6ePKBgvlfUS0ntFGW76YYkaLLe8e4OHaogWUUcShds=;
        b=TLqLBUkWAN89H7ydUDUqYgJMF3kjmYHyr9ZHF6vVHKOaWyLfGPGFXo8RxB9f1Gitq/
         ZpEveze9+sVm+Wb+yPIT2HWjFK+shcd/FhhTMet0GypCeSImKY0dVq56Uvb6bwpibwQJ
         bfE27iwSnUeSpxaLLuWvPoBpPxF8dD2F13V9K5DeqtXRnWoXGgN49+1tpuW/ap4J6oCY
         RMd9ienL0O6mGATX0HvUla8uwBbzWcUODy7ATA/dyS8JHWzea7hUnas1a1VCUZgaKE3H
         lPaC3vKWT6tCEi7wxbd8wrIg+Ll1+AbS/mbBgk4rTw6U9qDKIqY6aidh+LK3dIC8ABav
         Gtig==
X-Forwarded-Encrypted: i=1; AJvYcCVtXrE0kmGYf4Z/Eb9a8JY3YWpjPH/wwIz2FM6DpiyzXs5AKzknBf4JZp2RIMoh1BoAdYaRTXK6bcxTY6OQf2qz@lists.infradead.org
X-Gm-Message-State: AOJu0YwFpectrGHLuyHq9PqEqdHkiA3/sTi4TndwoSC+X3KAYhNjwB6D
	Kt15e+331gAttpC22UnvPps100nlQ3+hu3JaWHL7xsokkFmwAqmQNFGMMtdET5J0V406e8CiLHG
	AQwJ7lpausQnu3B9BzaROUXGZbeR4Dpi/jMKtZKUtqk9ly7fUNRCtFYFHIi1Tu7Latdkirxc+qA
	Zh3A==
X-Gm-Gg: AY/fxX6IxeZmrckuTHEmw/c9/pYkWK7Fhib+j03AgJgQV//rFIT5x2c4L5tDgcVqowv
	8M1oYInjmbL5ymm9xi1GOduY8JSG1jqersfFzpNaabq2PEl8Rq7tS+7Ks12AXkLxjVt8ujbyuc/
	edkiCTxsxaa7rI27yM8z+0PXfkR8sILS3fPAT4KHe+LkBZ1QhhaSLqJYMW1w5eTN89EbScMuAs8
	Z0pHEV/3iDlP3t30TjOy95ijZVQuGiyIx16odbfd7WXzniKNw2UoXy/sg/1pYETH+keX+7qBlSH
	z1RZZqQkfUziMnCZpCiU4jIvbSjyqpTNSVxfh4wcYovpL1YUd6GfdZgNVlu1GYlZLabiSWU9Ntq
	zdx7OwSMfbKpVLjyH6F5Fh2ssfbUJhZ40yEP/htUO+4bySwtWrRtNIyBB5P/irkfX9/oELoKAPx
	dS7Xd4Dw==
X-Received: by 2002:a17:902:cece:b0:298:2afa:796d with SMTP id d9443c01a7336-2a3ee4c432bmr11929385ad.61.1767764011474;
        Tue, 06 Jan 2026 21:33:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgy5wTNf6ktpNl/IexKuFlCaYcP5E8i67hUlr8fprbXTH4XkoF6ise2t8mw7XJvOAw0b5P6g==
X-Received: by 2002:a17:902:cece:b0:298:2afa:796d with SMTP id d9443c01a7336-2a3ee4c432bmr11929275ad.61.1767764011001;
        Tue, 06 Jan 2026 21:33:31 -0800 (PST)
Received: from [10.133.33.154] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c2bsm37091885ad.26.2026.01.06.21.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 21:33:30 -0800 (PST)
Message-ID: <945e0063-23eb-4111-9aed-36fce77a0afa@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:33:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] qcom-tgu: Add reset node to initialize
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
 <20251219065902.2296896-8-songwei.chai@oss.qualcomm.com>
 <7cfbcc2e-b6ca-47cf-83fe-1c61df40885b@arm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <7cfbcc2e-b6ca-47cf-83fe-1c61df40885b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: blsbN4NhM7EIGU1rMtELOadX_hme59DA
X-Proofpoint-GUID: blsbN4NhM7EIGU1rMtELOadX_hme59DA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0MiBTYWx0ZWRfXwBhU12N19KHr
 FaiWtsyV4YoROOd60K1/w2gi9PigN16V6gz+5tGcmoWY49TJCMHec4Vn/m/b3IMtzHUYamuBfij
 VvmBLYM0RgAeOOzQOVems7UWsIsKjjUK/SU4tmarpaCgzrzimx4SDtip0hpL4lA61nYNOg+tQmw
 h5x2ZgzHN2Sugbb6yVAcOOC9DvZibGuTmXMtImz2L+Fg6ppnIERZ/gxdEFi9XK2o4sLV2kw8uJe
 0xuacowNQ6XY5dClXotEfZXBhVaJDi58fxkwLNa2PCj+63z64WaA7F1ZIAQWDGyFGq+6lghHn3J
 MWwH7cSx4Cg5wdCTkyz+wwgxhpjQ6ndYZCeiGU9R8d/Z71QLue0Rnqo7cePKH98aC2My5SQqBjQ
 Dqu3FuYfG39t7KUMsG6tmK8yZTqABk5xdE9raeiJo+z9BdB65ZM+1RVYN4GN7vkzpvaCy/HVB1W
 bzHCIMeopZXhaPpopCA==
X-Authority-Analysis: v=2.4 cv=MtdfKmae c=1 sm=1 tr=0 ts=695df02c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aO9wjV38XZb3NMbED0oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_213333_805313_C55802FD 
X-CRM114-Status: GOOD (  14.59  )
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



On 1/6/2026 6:16 PM, Suzuki K Poulose wrote:
> On 19/12/2025 06:59, Songwei Chai wrote:
>> Add reset node to initialize the value of
>> priority/condition_decode/condition_select/timer/counter nodes.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
>>   drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
>>   2 files changed, 81 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/ 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> index 010eade0a1c5..0733b3e07b45 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -42,3 +42,10 @@ KernelVersion    6.19
>>   Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>>   Description:
>>           (RW) Set/Get the counter value with specific step for TGU.
>> +
>> +What:        /sys/bus/amba/devices/<tgu-name>/reset_tgu
>> +Date:        December 2025
>> +KernelVersion    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (Write) Write 1 to reset the dataset for TGU.
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index d4210869556e..5a8c6af9b719 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -425,8 +425,82 @@ static ssize_t enable_tgu_store(struct device *dev,
> 
> 
>> +
>> +    dev_dbg(dev, "Coresight-TGU reset complete\n");
> 
> Qualcomm-TGU ?Exactly! Thanks for reminder.>
> Suzuki


