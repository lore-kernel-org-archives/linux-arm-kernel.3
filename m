Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E072E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 12:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1glOxkn1IDIgd0UCki0Nf++sUdgcqfIdre3vsIotpyM=; b=awzAvs5qC2Bj7JqNbGIcZ57Shk
	m+kBV6OcCt+3t3diqeeiMPhSwG9PoBpzjUMlsqGasANS4Nf9KuvgQya+NeG5DSJOghUUqOKMzhkiR
	saORBDgmoPPB5qNl1nInIEfs13zangsCk5axzzfNb5aZ3shl4groL+YrJU2vOwoFBw7/jO3ZBl1Vy
	YmxQa6+1XjCr0VoKSYB2ApI6DnM5Mxdmk/g2cxyOs2FdBy88Gw850AvnyEhx4GpgUdGkQBYqufZ34
	rhDTXF7NK8ggoqbSZFO+/bQSROSHyZAlRa8gK8oz2VB3YERXg8jNKNAgCJmcOSjTiJRsN1mlBANER
	Ad/60fuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcXz-00000004wZZ-0gqp;
	Fri, 20 Dec 2024 12:56:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcWo-00000004wRP-478B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 12:54:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK6lbSd001448
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 12:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1glOxkn1IDIgd0UCki0Nf++sUdgcqfIdre3vsIotpyM=; b=pmX18UQLuSX88CLk
	MhVSc8dtXRsGWf5WGvy24lwct93xuTUWxTcYx7aSEmCufyVckvc9OFXxu4XmUNdN
	fwxel1A1agJy6GkzT6oSUzLZZxWfPOa/bcv3vi14h0ypmagBA50Rfec1KCnbnGbo
	vU1z8lvQrIvcsnaGrharGpXuFKE2NLrMB2XD1FrFJbyT3UB0wPyGRVwpMyk+w3w5
	1GjAajYsYOqXkcxUmo6KPrc2bljVR09YTXQgVL+s7L1DqUVnFVDdCYDdkBZn7d4P
	UCBY8+xEI2amEkFSAx7ik3VHyDxbwepGkAjxe/GOhLh4wlTrNbpPIgX8EjoU/KWI
	uR9fWQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n3mfrxjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 12:54:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d887d2f283so4829016d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 04:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734699288; x=1735304088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1glOxkn1IDIgd0UCki0Nf++sUdgcqfIdre3vsIotpyM=;
        b=TlZhhlmNeXElFcZ4N0HR6Kp7cAY9jPIRSQqOnphvjiutmaSb4iXXxsr6wbZa/pojLe
         0w/wzHPGkVSvOpjhsRcC9n/zLkAEIPUXgmWybp2Ej08qoPrLWKU+Ds26Wd0fIHW8RP2e
         RVKRRuhXC5oCFM5DB6i9TjtNY/kauusljGdXyKIJQnTKz4J+jPI0v/EsZHPxHteevSeP
         cq3/aDjwLXmcw69zU1q7u7e3NSbwyWChQzmHeX25Fb6dkqNorNVCvgdNxyOtqLYAqFij
         J3DsbyLwAc3vgNsEVQAj4qCVeo9wb34qOqVFvLcNNprXgDJMJJE+/M0kv9Q2pa7nRbbG
         KLjg==
X-Forwarded-Encrypted: i=1; AJvYcCV3MASyc1iAeF3ydI5zUo8zHdfcGBRdAjyFiQ/hlFupmMqR4AEuiECU+9KK3tXuIf0WrECs2xGdgbf3I9buuTb3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv1R5mAjcHgVj6a330VUi+iun7UfBCtmQ/Brp/IIRvEiDahtVh
	t8hcKIymxeGF0ZeJsEDyrUb5WkXmbojakNf/RP/nm6Hrsa46RF1Z7mOLCf8THGRBIH2FDld2m7r
	F9ko1INLEIq7/wlyiyou186ag6SuKrMSjXmiQ+qpXZ0oKsLHa/mufDjeAc2bS2cniCGv1vwz+ew
	==
X-Gm-Gg: ASbGncvuOd42kzYivVPNskejw2YHWibMtxbvoly0DlQ/wpiIN/YYWwYyEiXyDm7cNI2
	xhD7vgQtkdVobE6O43CShRG/jt095WDihF5pr4gpThOifxHqqDk6zpzOWZtCW2DjJ9v9xDqi3Hv
	g3xrwVREw0N4EkoeVrICo9SNzfr/zd+La1uWCEkJFYYrPoGcuz+y7aKswrNanSxg/xqfdmgDfE2
	Qp9jZILyfOqFVPlZfCv/EMJ9RKgs7ptWZfvn4Sr+5FUrBe5mNXevrED0IvqaOCU1/hRFgIm+Kk6
	TLhRjbOiEYD4MAk0AIYYD1Keeaq7XDPwO0U=
X-Received: by 2002:a05:620a:1999:b0:7b6:d252:b4f1 with SMTP id af79cd13be357-7b9ba7c8376mr131313685a.11.1734699288405;
        Fri, 20 Dec 2024 04:54:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFauhfwJ3WJ9nZ/J7KQQZfJVN6/UgwZW5dzxwD9LiwBWG5nYGkVE6qtjqC+2RPuPXzjDKtKTw==
X-Received: by 2002:a05:620a:1999:b0:7b6:d252:b4f1 with SMTP id af79cd13be357-7b9ba7c8376mr131312185a.11.1734699288018;
        Fri, 20 Dec 2024 04:54:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae71desm172876166b.89.2024.12.20.04.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 04:54:47 -0800 (PST)
Message-ID: <349bac70-87e0-4870-a3f0-9f6a3b3e6824@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 13:54:45 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z2VUiHWHgbWowdal@bogus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RNf2CeC5MZzrom0KNh4php_juqovr5-y
X-Proofpoint-ORIG-GUID: RNf2CeC5MZzrom0KNh4php_juqovr5-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_045451_032368_91EB396C 
X-CRM114-Status: GOOD (  32.38  )
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

On 20.12.2024 12:27 PM, Sudeep Holla wrote:
> On Thu, Dec 19, 2024 at 08:43:27PM +0100, Konrad Dybcio wrote:
>> On 6.12.2024 11:21 AM, Sudeep Holla wrote:
>>> On Mon, Oct 28, 2024 at 03:22:57PM +0100, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Certain firmware implementations (such as the ones found on Qualcomm
>>>> SoCs between roughly 2015 and 2023) expose an S3-like S2RAM state
>>>> through the CPU_SUSPEND call, as opposed to exposing PSCIv1.0's
>>>> optional PSCI_SYSTEM_SUSPEND.
>>>>
>>>
>>> If so, can you elaborate why s2idle doesn't work as an alternative to what
>>> you are hacking up here.
>>
>> Please see other branches of this thread
>>
>>>
>>>> This really doesn't work well with the model where we associate all
>>>> calls to CPU_SUSPEND with cpuidle. Allow specifying a single special
>>>> CPU_SUSPEND suspend parameter value that is to be treated just like
>>>> SYSTEM_SUSPEND from the OS's point of view.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/arm/psci.yaml | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
>>>> index cbb012e217ab80c1ca88e611e7acc06c6d56fad0..a6901878697c8e1ec1cbfed62298ae3bc58f2501 100644
>>>> --- a/Documentation/devicetree/bindings/arm/psci.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
>>>> @@ -98,6 +98,12 @@ properties:
>>>>        [1] Kernel documentation - ARM idle states bindings
>>>>          Documentation/devicetree/bindings/cpu/idle-states.yaml
>>>>  
>>>> +  arm,psci-s2ram-param:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description:
>>>> +      power_state parameter denoting the S2RAM/S3-like system suspend state
>>>
>>> Yet another NACK as this corresponds to PSCI SYSTEM_SUSPEND and as per
>>> specification it takes no such parameter. This is just misleading.
>>>
>>
>> Yeah PSCI_SYSTEM_SUSPEND takes care of this on platforms that expose it.
>>
> 
> And those that don't advertise/expose don't get to use, simple.

The spec says:

"The call is equivalent to using the CPU_SUSPEND call for the
deepest possible platform powerdown state."

so by that logic, I'd rather call implementing PSCI_SYSTEM_SUSPEND in
Linux unnecessary bloat..

>> DEN0022F.b Section 6.5. recommends that CPU_SUSPEND StateID includes
>> a field for system-level power down states. This binding change only
>> adds a way for DT-based platforms to associate such state with S2RAM
>> suspend.
>>
> 
> Sure, just use the CPU_SUSPEND bindings that already exist. No need to
> define this as some special case if it is exposed as CPU_SUSPEND idle
> state. Not sure why you want to do it differently. I understand the
> need to handle it different in the kernel, but I don't understand to
> define the new bindings for that. Just use the existing bindings for the
> idle states. Again I see no exception for this case.

The bindings exist for core/cluster idle states. This whole series tries
to include a system-wide suspend state that has no business being
described as a cpuidle one and depends on more than just the CPUs being
powered down.

>> That may be a bit Linux-specific whereas bindings are supposed to be
>> OS-agnostic, but since we effectively want one PSCI state for deep
>> suspend regardless of the OS, I would think this kind of hint is fine.
>>
> 
> Exactly, that's the reason for not changing this into special case and
> special binding for that special case created.

I simply don't think it's fitting to lie about system suspend states being
just CPU idle states, see above.

Konrad

