Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB61E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56bHgJLPiTtJ7oA6sbuuFB9R8hrWoD6GaOyTZakQqr8=; b=GpYmrQ7k8/diKdJ9xKP+15uuQa
	VTD8p2L5kyw58xC/suLK4+kXHw6utJ/MCL7r/pMIP2Dd2bkR9y9yHavAAQd77jj8Koips5RLwlr60
	/Ae1vALJ7MPDAHo2F2SD1FnVVznMw19SWX+tjzkCErJa9Vuh8zKKs17OLHxNMBYv/0eCSuy7jbZxu
	uTfongEN7DHezcg6m8ByjUzP0Spps++378g/LpEEIOEvfactEV4K+ORLDN7qnbxTSWpJDDu9qNzVZ
	exnBM/PHGE1/Eu8t55hXLya0OLHDsuTwhj1U5te6JFivlhlzoocV3dbC9FUgrhzJV9rQ5G0dLodB4
	3QFLfvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdib-000000056Zb-36oh;
	Fri, 20 Dec 2024 14:11:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdVd-000000054Wf-0GK5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:57:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKADgpK008347
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 13:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	56bHgJLPiTtJ7oA6sbuuFB9R8hrWoD6GaOyTZakQqr8=; b=HlL3l9UUEcTZCYjI
	6VJx6DHCANIIwSgjxqYnYBt7l18Ag9NdKkqugQtwOhdoSXFKbzz/Mei5kPrP/pyv
	oCR/xDWAYf5yDdAfF8gIRSdF18Kw6ZksYmcw3s7GtbBVHQBZHN9maj3Sm3v/cT1r
	DDQwC6d0rVzu4NPB9OYHUG2h4I7IMJvlcXshLkNDaVOjOpfYGsqvUOnRK8jtBoGa
	NgStPYi43yE25/oTMrZLl0RNYoz+np4dkekq5Z8HjGb89ip5/wjr1v4zsCGhVWA9
	ffv0/tWaJTnwMRsKCi8HE68QZBlzQYyd5vaXm0n6OYlbJFRgBUa7fjDOJbrKiZ7f
	uqNzow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n6n4ggr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 13:57:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6f28dc247so31086185a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 05:57:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734703059; x=1735307859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56bHgJLPiTtJ7oA6sbuuFB9R8hrWoD6GaOyTZakQqr8=;
        b=SOxKCnOfzhNuXtIrfX2iES2T7KRVXXo1QOfoQH6Oo0KTd1lRTBOEt/NJC0lSTC+yOE
         cavUNFIIoUVDOnaLqSErUSGZy/A3I744ue8/68jnqOG9jsmi1/XdN8WJTQ1YF5VFwRDR
         RxJXMZewHV9gFAVmserDlSc8VIU+utGE+0ZnuCsFNrTrLdoyWRhKjEreAwoBvEUUQCRP
         GX86OsLveBTRBZTG5rNgGF49kRm7sBDzrMkhGHwtbQxk3599P9GsqWsSxQoqp4lRPQZ4
         MxJcy9b/kGux0tc4A/KOu54pgFRoSz3nKu7qBp7bisn0ZYkoeKNmAAEWKg7O07BGQ+9B
         mdeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4IJ+hjQm1oJaCsIY09pqgAy/URmu2jMtU5fCk1wgAEwwwroVYnoxY/iRb3sL4P42EQWXG+hu8vnP0Sfpc+lMo@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5exk8FngmuK5FBkSn42pIQt3/A5S4gSsa7WuUH/3ukBG30xLt
	uc9b/AKg/cFAkVGHCHf8NyIg0L2KvjjY21IdgDCSKFDKHzeTM2XK9wP7Jhpq+DWJhDFYwuASid7
	fyWcJ17DF5KfkVeIljs2hTkju4zZCofpidA2+MoUgI3tRf3VAKm/wVZpT8sPAyVilVCAaIDCSHc
	poYaROow==
X-Gm-Gg: ASbGncua5K3tPtiGKe/G8oZOIFjtE3FF8ug4Bi0RiqFUQiEEP7pvppr4KDeL9DoAAK1
	Kh56zx+bMl/U7R1bf7gG37Gv180WiflctE7Y3zmI/0AwgnBYRDviIP+jLUEkIl5p2hWMuqTv9+O
	fj+H3tvpA8T6YcLAaFQbaq649bRrMnonOE45JHKnhbK5cbjfTrQe/P4mL9e5gi+gjCUkv4ymwIt
	Opz6LK4Tn+3UmyfDcpl87xL60K7aGEx/YnPhBifn8+V1hLDnE5DBgWkFFWkACBvsBnirJfu8tPo
	0rkgbXTx+VOzEUc3DUXHQpjUE2eur66uOhg=
X-Received: by 2002:a05:620a:2986:b0:7b3:577b:6da8 with SMTP id af79cd13be357-7b9ba733e3dmr141503885a.4.1734703058599;
        Fri, 20 Dec 2024 05:57:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6tuv4tNldIE356QcRbQFCyNERIo5TnquyOp2uCweUBMvT2I+yyu94kCIo8uKwhq9CZfd6VA==
X-Received: by 2002:a05:620a:2986:b0:7b3:577b:6da8 with SMTP id af79cd13be357-7b9ba733e3dmr141501785a.4.1734703058192;
        Fri, 20 Dec 2024 05:57:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701abd1sm1750204a12.76.2024.12.20.05.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 05:57:37 -0800 (PST)
Message-ID: <c80c4cdb-48e1-4b6f-8ab8-fad6e100af00@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 14:57:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm,psci: Allow S2RAM power_state
 parameter description
To: Sudeep Holla <sudeep.holla@arm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241028-topic-cpu_suspend_s2ram-v1-1-9fdd9a04b75c@oss.qualcomm.com>
 <Z1LQOmEfFy640PjG@bogus>
 <54cc4221-ba5f-4741-9033-20874265ca01@oss.qualcomm.com>
 <Z2VUiHWHgbWowdal@bogus>
 <349bac70-87e0-4870-a3f0-9f6a3b3e6824@oss.qualcomm.com>
 <Z2V3amqWYDUWA2uM@bogus>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z2V3amqWYDUWA2uM@bogus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OgB5jw2jamRxzz1mFbBZbiFJZr_C9JV3
X-Proofpoint-ORIG-GUID: OgB5jw2jamRxzz1mFbBZbiFJZr_C9JV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412200115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_055741_113152_3CD58A93 
X-CRM114-Status: GOOD (  21.24  )
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

On 20.12.2024 2:55 PM, Sudeep Holla wrote:
> On Fri, Dec 20, 2024 at 01:54:45PM +0100, Konrad Dybcio wrote:
>> On 20.12.2024 12:27 PM, Sudeep Holla wrote:
>>> On Thu, Dec 19, 2024 at 08:43:27PM +0100, Konrad Dybcio wrote:
>>>> On 6.12.2024 11:21 AM, Sudeep Holla wrote:
>>>>> On Mon, Oct 28, 2024 at 03:22:57PM +0100, Konrad Dybcio wrote:
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> Certain firmware implementations (such as the ones found on Qualcomm
>>>>>> SoCs between roughly 2015 and 2023) expose an S3-like S2RAM state
>>>>>> through the CPU_SUSPEND call, as opposed to exposing PSCIv1.0's
>>>>>> optional PSCI_SYSTEM_SUSPEND.
>>>>>>
>>>>>
>>>>> If so, can you elaborate why s2idle doesn't work as an alternative to what
>>>>> you are hacking up here.
>>>>
>>>> Please see other branches of this thread
>>>>
>>>>>
>>>>>> This really doesn't work well with the model where we associate all
>>>>>> calls to CPU_SUSPEND with cpuidle. Allow specifying a single special
>>>>>> CPU_SUSPEND suspend parameter value that is to be treated just like
>>>>>> SYSTEM_SUSPEND from the OS's point of view.
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/arm/psci.yaml | 6 ++++++
>>>>>>  1 file changed, 6 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
>>>>>> index cbb012e217ab80c1ca88e611e7acc06c6d56fad0..a6901878697c8e1ec1cbfed62298ae3bc58f2501 100644
>>>>>> --- a/Documentation/devicetree/bindings/arm/psci.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
>>>>>> @@ -98,6 +98,12 @@ properties:
>>>>>>        [1] Kernel documentation - ARM idle states bindings
>>>>>>          Documentation/devicetree/bindings/cpu/idle-states.yaml
>>>>>>
>>>>>> +  arm,psci-s2ram-param:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +    description:
>>>>>> +      power_state parameter denoting the S2RAM/S3-like system suspend state
>>>>>
>>>>> Yet another NACK as this corresponds to PSCI SYSTEM_SUSPEND and as per
>>>>> specification it takes no such parameter. This is just misleading.
>>>>>
>>>>
>>>> Yeah PSCI_SYSTEM_SUSPEND takes care of this on platforms that expose it.
>>>>
>>>
>>> And those that don't advertise/expose don't get to use, simple.
>>
>> The spec says:
>>
>> "The call is equivalent to using the CPU_SUSPEND call for the
>> deepest possible platform powerdown state."
>>
> 
> Please take a look at the preconditions for both the calls. They are
> different.

Which is *precisely* why I want to tell the OS that it's a S2RAM state,
so that different actions can be taken in peripheral device drivers.

Konrad

