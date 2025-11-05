Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF41CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ta2hRtjIGYutwa8+T+jr5APKYGbkaeiNFYgNPk9GyZs=; b=Gp3joYh4KoT2pwP7XBu+ACvh1f
	GWA0YGWNkbhLgQ60I/q27xWuXfd+dmtT++NrhEbykVvgoZgVhdWJebcJnHrVP86ort9AVwnsdhJ/D
	QH26B9ePwjhH7BCP4Lev+ltnCy9FsBWhRRbjntyy+Ugo5HpxlDFOvAXCuh7g9MC3dcojT+Z6VjEAS
	hRG6vcMEFS61eF+L3hpBRj2fyViRnI8TzzE9Qz/YYxoPVqmGdnM/LwNReTHF2PvrHH6LQbdtEf7/b
	KcU/v434uFMUFO+12a/Y6fRuPrHvZaTWrS+AVBaJhwD8RUiPg2kEnHLW16CqjISu0++GUrdruycCV
	TP+jDOvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaZN-0000000DSSa-1Aif;
	Wed, 05 Nov 2025 10:16:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaZK-0000000DSSF-2FVu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 10:16:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A58H8682927605
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Nov 2025 10:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ta2hRtjIGYutwa8+T+jr5APKYGbkaeiNFYgNPk9GyZs=; b=RC+kGHDTS6JoWG5p
	L8H+qjW8iRH0MF7ABUr10ZTs/K10OcVvNiLn757+xRnXzXhNBg9e5RxrjkaFMVzX
	bLSVssRbVCLzIPtcjeePxnq+H6M2Ni74pWaGQn+9rZaMlLOC3c9j4hh5TWNBwoJ2
	QRB7mnBcBvqZLudzjzwmMEuIr0HM4qta+QM1cUkNzOulkiR3y6cNAkk2+jCxEqU0
	D15P0oA3gImp7EeOJO75rXrXwg4H/SpwV0jJVLMWr0hP7UvMgj7P78z+9tbDslJ+
	HIa8FLKtDvTwiuMssPMTDVEEqkE/MK9t8nuLcpFrQr5Fj8WbtUOyM6yGBKn6twzN
	dZFL1g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7me5tx9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 10:16:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-294ecd3fdd4so82772065ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 02:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762337805; x=1762942605; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ta2hRtjIGYutwa8+T+jr5APKYGbkaeiNFYgNPk9GyZs=;
        b=gLKGl0KveGZQ9B7AqpvVSs+lu7F6IqQecxCcPo8TmXNSbcX1N05kWdQjLqgd0ghQUJ
         /xLlHuFZkC67WGqzz8+pjQKjLkVPfT4uIWdQqw6t3bU04V7JPqx8TYJA0g9BRRUmcgT+
         fOmHf06vBZhnMjjZdkNGfQIzeyUibxgqPMXfAnU7CQ/JEso1IE4faqiYjNz1a6l9drLH
         wHvgBTvt5zn54EZ9J1Ho/A4jIxHuMVirDYoxxsOoE9Jhnl1LdzRfWgUT4ft32s8FubRI
         f0zuOk+M0wsOcjD3ki/nFct/tWFPZBxnG0NFkbKzWs3MOQ2e1m/Q9feF/9NJqKDr5fSQ
         QJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762337805; x=1762942605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ta2hRtjIGYutwa8+T+jr5APKYGbkaeiNFYgNPk9GyZs=;
        b=Nn3xkxPEIXpeNtTYT8xMeoMXv23BcPYn6dTrLqn3m5ZLS/C+Jrk3u7rWQDkw6HBxnA
         zWYkojcU3e7dwVMRP5pkWx8OGfuPhyT5gcpQFUfhsarFeXJMX/Bxusz4q80DlI1P+cai
         moHG2KzwPGIbORAZoWHluD+W62LrqSQSHrWA0XNLtm/xjQbq7TgCmSHTQ4VZGTvMnlDS
         ZOuLcbrwsSSk9wFLMO9f1O7PeFOw/qCrZKReWTzsh5kkL7qUAl95o+7WlIKldmhVmqqp
         dMT8JiCYMAyoWBoaF4LBPulOB1/JDRplJj+w/6yMThu53/AxrJq04ijxtZ1Yob+8IqyE
         OhXA==
X-Forwarded-Encrypted: i=1; AJvYcCXQVac9KTvme0nKKke0XkuCekRFzI6Jg+Gzyn/JJ3MOOBQV/3qbWVGrMrpHXeHIXjX1sonshXuPS0Nu9IVpYgRP@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc6XwJT4Q0g2JCW3tlTpYOkE1Tm2lcF9ylwonENYE5mev74r8f
	bxvPJsGYmO52fDvcbe1c6vhiBEAyL15K34mgPphF/Fvmv6Vpn605eeLwfSdLfRnC2BDOTrM91DJ
	38Awluru4T5T+ofJKe6jtIrBCAtovX+V+SFuwmRmfgvd6H5pkRg/Ua4n6lt+JLiEeyBqWMh3v7C
	2AeQ==
X-Gm-Gg: ASbGncvRy19vUSoGD2DnT8+dSTbKkQP7R41kOr3o4u5eeUMBLGz2R44e4TBiG7NIOmz
	XxOJgvOUAvZ6ZwP1jMfRCBHrXi5IP6iH7RtJ3iaiCGhcZJVn7Py03OtKxIUGuJChSQ+qaDNxonE
	KeMxdJ1CvfmluXan4SAX5Dwfdw9VCjXEN5MdyVIgib38RWR6NjaUq5BUi7OSnIrjw3QoEy0MJIY
	phM0MOQvkhhzREdIB2GV7tQfdsYbvMcFJdhJKTkZl0AS1m7mxjZL/2ZDQbdseH92Iu9TeHv9Mma
	1q4cbmPuYGfIYb0HtXiv+il5bEOttsd3AOvZjVnMd68dqR5+lZA5rovmWz40Lnve6gawQtsdW1+
	FRUu3uyCGE+t7kPlF/MKwh3g37bgL8MYS+3EWAuCgf2AdCwrrDWgDz5nhk6DIMX3ioDkEbg==
X-Received: by 2002:a17:903:1ce:b0:292:dca8:c140 with SMTP id d9443c01a7336-2962adb9205mr41766575ad.44.1762337805114;
        Wed, 05 Nov 2025 02:16:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEERiVnLzKuHQJ0gmzb0TNIDrn5liDBDTJoghkGYIdT79j0+ZWIT8X5xbtlRH3ZR2fs/EOZQg==
X-Received: by 2002:a17:903:1ce:b0:292:dca8:c140 with SMTP id d9443c01a7336-2962adb9205mr41766255ad.44.1762337804622;
        Wed, 05 Nov 2025 02:16:44 -0800 (PST)
Received: from [10.133.33.81] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2960199831esm55608125ad.37.2025.11.05.02.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 02:16:44 -0800 (PST)
Message-ID: <dc2d7940-8750-4ba7-9e4d-05c8b4bbb819@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 18:16:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org
References: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
 <20251104064043.88972-2-songwei.chai@oss.qualcomm.com>
 <20251105-industrious-oxpecker-of-valor-af17fa@kuoka>
 <746b292f-fc3a-43a8-89b1-76f61ccc0630@oss.qualcomm.com>
 <7ba7e32b-f00a-4f77-88da-047126a8c3f9@kernel.org>
 <b9e7f8ba-a629-4316-a6dd-d765ed0037ee@oss.qualcomm.com>
 <38452e04-255e-477d-8262-53aeb3c87a01@kernel.org>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <38452e04-255e-477d-8262-53aeb3c87a01@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0FSCKIGyafxItl755hXXbUIyS_jPq3Y_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA3NSBTYWx0ZWRfX3Rs5vepaFpr8
 AgVh1f4uX78eiRJ2qQ/1M2yi9Wa9GOtpv6l64nXViWiiip2LVdPuoEemTmYH07AE3IRk29GK79G
 X26UKKp3s7N5a1WIOHFOkn+TpMMylER+TZP5QgsS71HDEvN+oF9Uyi6Wo0X5V0aj6QneEtV9LTe
 zSjoOZ1Fv1c8W3KocOX1jcKC2AzOH9xCgPgdwYPG1SndQ6n+anSlr5KjyBk2ZMx1gO3RI7AgPRv
 wZRX4gxi/NOvKxrxEtaZ45VaOxYYoccqiHClK4Y38Y8m7FsZG0UXu+jLocxvwqjytXRTOJuUV8z
 mopUpqhHPXjzlklzq+N2Z0C6R/AsQuFiJ529iupOm4sRVbJqJrK/SgHFyLULdw/ZkBFloKuy3aT
 naVoWrJ9AJo5uD6xbB1bvzte5+adcA==
X-Proofpoint-ORIG-GUID: 0FSCKIGyafxItl755hXXbUIyS_jPq3Y_
X-Authority-Analysis: v=2.4 cv=IpsTsb/g c=1 sm=1 tr=0 ts=690b240d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jwEE-YN-BAOtPsYX2CoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_021646_578586_A8411F2D 
X-CRM114-Status: GOOD (  21.40  )
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


On 11/5/2025 5:03 PM, Krzysztof Kozlowski wrote:
> On 05/11/2025 09:49, Songwei Chai wrote:
>> On 11/5/2025 4:15 PM, Krzysztof Kozlowski wrote:
>>> On 05/11/2025 09:11, Songwei Chai wrote:
>>>> On 11/5/2025 3:49 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Nov 03, 2025 at 10:40:37PM -0800, Songwei Chai wrote:
>>>>>> The Trigger Generation Unit (TGU) is designed to detect patterns or
>>>>>> sequences within a specific region of the System on Chip (SoC). Once
>>>>>> configured and activated, it monitors sense inputs and can detect a
>>>>>> pre-programmed state or sequence across clock cycles, subsequently
>>>>>> producing a trigger.
>>>>>>
>>>>> I do not understand: You got review which you ignored and then you
>>>>> removed pieces of this code to make it incorrect. Go back to previous
>>>>> versions so you won't waste our time re-doing review.
>>>> Hi Krzysztof,
>>>>
>>>> The previous reviewed-by is no longer applicable because in this
>>>> version, we moved
>>>>
>>>> the driver from /drivers/hwtracing/coresight/ to
>>>> /drivers/hwtracing/qcom/. This means the
>>>>
>>>> required compatible has changed from "/qcom,coresight-tgu/" to "/qcom,tgu/".
>>>>
>>>> Since this involves changes to devicetree binding, i didn't not carry
>>>> over the previous review tags.
>>> And which part of changelog explains the exact reasons to drop review
>>> tags? Not mentioning that changelog is almost impossible to find, buried
>>> under 10 pages of some repetitive introduction
>>>
>>> Did you read submitting patches?
>> As I mentioned above, the |compatible| string in this version has
>> changed compared to
>>
>> the previously reviewed binding. Therefore, I believe it's a default
>> rule that the previous
>>
>> |Reviewed-by|tags are no longer applicable. If the community requires a
>> note in the changelog to explain this,
>>
>> I will make sure to include it in the next version.
>>
>>
>> “
>>
>> Did you read submitting patches?
>>
>> ”
>>
>> Yes, the explanations in the cover letter were written by me, so I have
>> definitely read them. All of these explanatory documents are
>>
>
> Heh, why I am even reviewing this... you indicated in your address list
> that you do not wish review from me, so I will keep that in mind and not
> provide review.

Hi Krzysztof,

Apologies - I just realized i forgot to include you in the To list earlier.

Your input has always been valuable and welcome to me and i've learned a 
lot from our past discussions.

>
> Best regards,
> Krzysztof

