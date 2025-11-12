Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832F1CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 17:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNBYYgKYBAN8KJ+cgQyzq0Cqs/83MYIWHYqLx/z3jiU=; b=v2YwTccyVoBNl0QAeXrRqvSev5
	ki+MGApHCcD2RmJFdTdxkaj9HJDvfKmZiFSLlmeqbemtTWJOqUKV9HZHtq29P6NZ/mcDspk2KhzK9
	d46Fut1mgkDujjh/nEEhOTLD0ePObmVU3ufU/OGaRtDCHRAVyQC4bUyxqrUD0bbkp9C5nR8IGuh85
	DqFsQP3kLw0213ayKENWNadhq29h0hL9KChLCb1+qEvriyVJGFmII0DFeKhWTapLchTePvKftzHDo
	NZlIrXSnit/KoJmZEdzMZ5x9OSws8t03vb5abFE4m7ZRlNyC/dQN5u+mrD4HH4O9hF34AhqSuJefn
	ZOtTXVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEbc-00000009FPv-3iuf;
	Wed, 12 Nov 2025 17:26:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEba-00000009FPO-0MrY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 17:26:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACGY5Qu1757213
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 17:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UNBYYgKYBAN8KJ+cgQyzq0Cqs/83MYIWHYqLx/z3jiU=; b=Asi0ZCevWHa5vpUq
	wydrPJdR5WLStOV9/DGr3VxUXBZoWqa/zgCg8bnQzNA9P0JK7UM6bgsHvINAq854
	zqyZM0phZQsfIx6xpL9c1I4p4US+sPxmy/0LcPzRNz9D2woOfqAE8a1U3FutS2mP
	RSjHFghPfCdr7dcmWvQAi9fP7Ypnxm6uNKEXYRd73cmbxmuQaAo69Ydiy0SH9v76
	NqxKeS/lvKq1bbs4S4rTIKuTbicFhnAnjDsLE8ovl9cRz8W1G/30ppmUHADbdWLf
	HNty7VP9ltQnvlYP2xrXREZ3xHnosdp2Z7YvNYoTWHluPLcq866qz3nVukaBj5zp
	gc/y5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acwve859t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 17:26:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297e66542afso25893535ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 09:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762968357; x=1763573157; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UNBYYgKYBAN8KJ+cgQyzq0Cqs/83MYIWHYqLx/z3jiU=;
        b=OgiNPo2V0Ro7hpgAbD6ZlbSRkYEf5XYp13RgU2K/LTgMWGUG8jdDsLyQs6Rq9mKGDA
         E8LnkUwR2lWi3/Aoc2SlyolEGq9ZvdTMp4zBc49G7BC677z35+RNmsFtyMGRdU/0WaGt
         8hMnysCdjfbeSrR0VbzfQhIXAX0llS/HkKkGR3Qp3+4LJJBB0BdBw5SdyxnBvth1DLJi
         skTwUuL082ouKZS1YDimXXB69kE+BzR/nXVrVgbZ3ptZhNmFCgYjOzmeTpHeFjhMZkTZ
         sjVS49gv8bkuQdIsy+XavS5POxXUnOltfLQBzyn/mMswzlXOp3QvvL/zug63aceY5ihW
         4dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762968357; x=1763573157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNBYYgKYBAN8KJ+cgQyzq0Cqs/83MYIWHYqLx/z3jiU=;
        b=BKi6vxvxen+/ox1q+b+klQwyGYvtay2926m8spwnWIiBsZVECzvbcFk57hvGGczEm9
         zY9iwfYv1uU/Pysjnb1LrQupQb7txkjbuoFppprR3KdutaIWbBbujSvyRnqdboncf6Ui
         9tF6vpiI0zIUht3xaTGSUlAATINv3Mkhf+a3zSckSNzyytx0vX11p3rBV7CNmpGKp3Uq
         XV5vR62Or0srKhtw5UlPHUJl4yvnxXiDdkRSjYzI04C4XAi1LjzKsv7jXi5MOtjaOQ6F
         P8qk7ACsqPHX7BSSWZKlt4MyksjkioDY8HdbJbBEz9ihHSyYfIQA5qQoBW2F+/TVqZ7s
         ugeg==
X-Forwarded-Encrypted: i=1; AJvYcCUJVMMezeM3HZMnXubKeB/QpRpUSPRvaZ6GIXfVKOzwYxA1ABrEStBPvY/Wfq9Xx9MlFCRODeQ3D3kLmGD7hOKP@lists.infradead.org
X-Gm-Message-State: AOJu0YzvfZ69oc98XZQ2/OvkxH4BOcFtyED5sPSpXKtp+NU24IqpzTMR
	JIGl6eQX4H9bV8ZOpSQI6PBOlL5sCBVQIk5NLvpO1AU8kBc8hWQYsKxuAOxMOS1O+JOFT9zr1BV
	EnAVtQxwfbOLsg+Zx32h5sPGpmvTv4FK/xv/JZOImREjHGNZCjR3ytQSVj3i1hAuTAA+qNR4wkP
	1pJg==
X-Gm-Gg: ASbGncuY3ZypKJysJjnnjq6Lmknaus3bvVf7m34MU7mfcnoBj2gtkfMzOOO4oN7f7w6
	dC6xhOpRSBc0/TAfhCMOGG+Lmb62mV4GXl9K9nG5NcxghPCz5v3nv34cy/PcvPb19VotEyWaqL9
	RxEzcwoGlbUojJk9Efc+YMlxEpSMrU4DJ3jMbOCrjuNldQbjpJSEoAYqUOG8GTN3Yn7mBQ8Up1G
	q5yR+h4Rw8efIbHVdhpnEg14PA36D6sRVf3+tgNqGWEA+p9Kqau8YM9CnGFgpTPvutrzuD93SSw
	8rGcXafqzv459DViNuVy6gg+e0hZvpkZIKqMfaa0C/SoHy+WCTJL7ejpDawokaoUql/Xl4Fdqbm
	wVv7CPjp+hKWgiXxqGKVIqAUGpR4LAre3
X-Received: by 2002:a17:903:4b2f:b0:264:70da:7a3b with SMTP id d9443c01a7336-2984edefea2mr49648155ad.49.1762968357063;
        Wed, 12 Nov 2025 09:25:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlxML53eq5FCGodemREH9wM+Y3YdT+a0wr3azep64CW6zyU6Xwbk8j/OZEoJXgKMwh8FNU/g==
X-Received: by 2002:a17:903:4b2f:b0:264:70da:7a3b with SMTP id d9443c01a7336-2984edefea2mr49647545ad.49.1762968356489;
        Wed, 12 Nov 2025 09:25:56 -0800 (PST)
Received: from [10.216.19.73] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcea628sm35957245ad.104.2025.11.12.09.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 09:25:56 -0800 (PST)
Message-ID: <5d03ea27-82e7-1a55-3441-b80c7496a26b@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 22:55:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 09/12] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Content-Language: en-US
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-9-46e085bca4cc@oss.qualcomm.com>
 <20251110122824.5je5jfoanivl6xrh@hu-mojha-hyd.qualcomm.com>
 <btvknf3tcqhgxzf7ckyvfwix6hxle2bs4whyayan5haaejo3sm@gnbszdys32lm>
 <20251110161950.ngs4ihn3asijoqks@hu-mojha-hyd.qualcomm.com>
 <cvfr4zaceknma6camborq4ro3lwbx3dfps2zjagwhwmvwoxriz@jwybwtzdd46u>
 <20251112111540.w57ygzrvc6m3qbrs@hu-mojha-hyd.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20251112111540.w57ygzrvc6m3qbrs@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SNC8_-ZoazNWfGMK_dejWli6rPEYH405
X-Authority-Analysis: v=2.4 cv=F7Rat6hN c=1 sm=1 tr=0 ts=6914c328 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oQ2sxdDcfxKlcFxZ0_oA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: SNC8_-ZoazNWfGMK_dejWli6rPEYH405
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE0MCBTYWx0ZWRfX3VI0xTPkSVqE
 0czE6LrCuclfc4mj1uH5ISo42dz1ea2oG7BkCKYSmQtZg+OVWrwmhQQZ9z4o3W40ha0kfe8xhXQ
 syl1xLsvNb54GoapV9umTt84I1PixgkNk0pwrZv/bi3lHquGvZPJCYINVT3bVxoIQiUyKsJ7anl
 jukg4AJPmnxN+ecVk8Amze6+ohNEoRZj07E3kDT2VM+wNeD2IuBAiHGNCC0UF/HCht0vltPwHeJ
 JcqmJDKUE+NXSjB4EckSZzJ04onzQeVo3Ic3taF3ysKZ2q561QRx/BzIRpR7Bpz/NHgoL5n7Znm
 nq9MBc56vC/PltqsPrBVLXN/1dGEE6Le772zShcL+/EeuZA08RughP29jEALYRRXGwqFj36W+FM
 y4/RuJ8bsvXZAqn3aW0dZJjlmvci6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_092602_140342_92F40522 
X-CRM114-Status: GOOD (  21.98  )
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



On 11/12/2025 4:45 PM, Mukesh Ojha wrote:
> On Tue, Nov 11, 2025 at 10:52:34AM -0600, Bjorn Andersson wrote:
>> On Mon, Nov 10, 2025 at 09:49:50PM +0530, Mukesh Ojha wrote:
>>> On Mon, Nov 10, 2025 at 09:30:26AM -0600, Bjorn Andersson wrote:
>>>> On Mon, Nov 10, 2025 at 05:58:24PM +0530, Mukesh Ojha wrote:
>>>>> On Sun, Nov 09, 2025 at 08:07:22PM +0530, Shivendra Pratap wrote:
>>>>>> From: Elliot Berman <elliot.berman@oss.qualcomm.com>
>>>>>>
>>>>>> Add support for SYSTEM_RESET2 vendor-specific resets in
>>>>>> qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
>>>>>> "bootloader" will cause device to reboot and stop in the
>>>>>> bootloader's fastboot mode. "edl" will cause device to reboot
>>>>>> into "emergency download mode", which permits loading images via
>>>>>> the Firehose protocol.
>>>>>>
>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
>>>>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
>>>>>>  1 file changed, 7 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>>>>> index 721a26d49ccaeb1429e2cc1c3a5c8d9517da3be6..cebdedd5d614b9efb6dfbee91dd67f3c3e322a38 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>>>>> @@ -935,6 +935,13 @@ &pon_resin {
>>>>>>  	status = "okay";
>>>>>>  };
>>>>>>  
>>>>>> +&psci {
>>>>>> +	reboot-mode {
>>>>>> +		mode-bootloader = <0x10001 0x2>;
>>>>>> +		mode-edl = <0 0x1>;
>>>>>> +	};
>>>>>> +};
>>>>>> +
>>>>>
>>>>> Make sense for this as it leverages sc7280 and adding it there would not
>>>>> have made sense.
>>>>>
>>>>
>>>> Why wouldn't it make sense?
>>>
>>> It is better to add for platforms we know their firmware support this
>>> from day1 and not add for something like chrome or any other variant of
>>> sc7280 where this support would never come or not tested.
>>
>> So SYSTEM_RESET2 only exist in newer firmware versions and hence this
>> isn't (and won't be) broadly available in SC7280 devices.
>>
>> That would be excellent information to put in the commit message, so
>> others writing Kodiak dts doesn't feel the urge to copy this and debug
>> why it doesn't work.
> 
> Sure, @shivendra please add this information in commit text.

Ack.

> 
>>
>>>>
>>>>> Acked-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>>>>
>>>>
>>>> Please read submitting-patches.rst about Acked-by, and use Reviewed-by
>>>> going forward.
>>>
>>> I was acking the idea of this particular change in platform file compared to
>>> other patches, if above reason looks fine, can be converted to R-by.
>>>
>>
>> That's appreciated, but per the documentation, the meaning of acked-by
>> is different.
> 
> Sure..
> 
>>
>> Regards,
>> Bjorn
>>
>>>>
>>>> Regards,
>>>> Bjorn
>>>>
>>>>>>  &qup_uart7_cts {
>>>>>>  	/*
>>>>>>  	 * Configure a bias-bus-hold on CTS to lower power
>>>>>>
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
>>>>>
>>>>> -- 
>>>>> -Mukesh Ojha
>>>>>
>>>
>>> -- 
>>> -Mukesh Ojha
> 

