Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0971BCCD188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 09:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Q2RvLUP1TRoeCdEklVO8kA/8Vk/VvKeXscAp6CMzmk=; b=SAWYscbJRGvV8jZAs2oXfWyvWW
	cPGfU6aUJrWrGD5TzPf8I6HX+WB+XrfHl6wQT5nrqwr2c73KSrlVODkTkNE+rA5or0RpmbCH8MNhn
	6ZjczWoH0K9f0JuJQfsRmlnQYSDxoMrfQ+wOWQAe0lO/I+OQgKCKQnnUicALqmAD0cW9E7Yo1EeHi
	TSyJas+UXv4SWZAmRM9F59NKGrO9HQWrJxwvsYcCt9cxetPjQ5p6LAJ23QXS52lI6M8mOsg49v+W3
	lHLhfoLyK3I2iNvDK9MOBzB6CHjbnx72Bl8ZD+ude521Bs4hcniaSul4zAnbZzaCQBK6y1WX6BLRl
	Ya2di4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6myO-00000005erx-48cU;
	Thu, 09 Oct 2025 09:30:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6myM-00000005erc-31XK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 09:30:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996Eg1A011887
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Oct 2025 09:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Q2RvLUP1TRoeCdEklVO8kA/8Vk/VvKeXscAp6CMzmk=; b=TR8wKMrg4tr+wdgQ
	6VYKTMn3aFA064VFzGRZIE+jkvygmm9+Cfbvw5MvYzvVS3al5MoMT2JIDSSMPPTc
	vHIWZhMZNLo2aPIl2HnPoYm7fRW+GVrAvs6qIm48a9ewfI8GSqI/Az7SDkqLmqoL
	f4EgWIsAcBugFvRw3M4ei7Ip0xoRBtblDpIYAZxAPGJh9omh81Xs6Qj6zlFmMpv5
	sSKXtNSe25a4jVdYvA4DUUY0nWPQ/oojXaCLKrcVAfieZt0c3h6r6ba3wsunmnIb
	WGkosrqj9D3XQD5JMwxLyyAOjOQi48B2J/wYXYG0TNc2VRyJmmfUCWlJ9h0fJ2PI
	HA9x9A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv9aa7wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 09:30:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e231785cc3so3955941cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 02:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002205; x=1760607005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Q2RvLUP1TRoeCdEklVO8kA/8Vk/VvKeXscAp6CMzmk=;
        b=s/vwGXz0hZQnu7DMtawyOU2IEiFQkTIahxQvY4g2aUenqEMzEavBT/KcY0tR6092cQ
         MVNq7Li2P/029JvGptIiJd4BNSfr+vdqYawsSohhf0o/rJXJ1QUVWfcdTbWSwKjzoG8V
         H5l+nkEdSWuQsO4Z1Q1Fr7u8Gu9FlQEj1SUJfGxRB8mv/PpVeHf0Rjf8FeLHAJNSKtkf
         Q7NqwBAPQMTsIytXijO7OV/NOZ+Kew6QUuSMotIDP52L7xQ8aK8sPIcygwcB4/IHmPmj
         7Out4rH4bO+UnJjkEU6uVOWtN1MxYE3KOVGkihq8Sq0XZf6OgshtTCAMAObbdz/3w0Gh
         0keA==
X-Forwarded-Encrypted: i=1; AJvYcCXs2ehEnQabhApW5nsXt2ubx/1xsTTCIblDWMjkh/kg7cBQGwddR4w/JiL1Ff4ARsa0dbmUasXAbGmKU2oHOQYL@lists.infradead.org
X-Gm-Message-State: AOJu0YxKp4+eAS+c6EJz5yh79sfsFDJb4A/EhdAmZ3Q3hsFvNzwlsXDY
	CNBFomDUPbB4k4mfwTKkBfGff7YuYAH9YOlr+L73SVv99DFtsLT1WJxWLX4cwz4A2oxl3A3J1t9
	XRXgj4HHAohbkBqi32BtP02NlpiN1o++dr56yI4l6HbusO/tLseNSXoZQewmdV0vT9Jqt4AapPS
	XONA==
X-Gm-Gg: ASbGncvZ1mbCoq0NOEMixTKhXn1gsko0vrPhVZtiNNcKtPugmbUjlZLqAFzqi89j2VH
	iuOxZwUW8zUVAmo4XCIg/TmLhA3rI4/LPOM2gyeaeEJ/qpBLzN23XhCUELU29F6AdmxOdp43axZ
	7ZF2kMPkQp/hd2kx56/65ZcczckuWP5mrY5DbaGjhP/x9pUW7OAL22JROwH0Qi0IwW+MZW/VQwY
	iiNorU7A8hkWaW2f+6SbiYtc0WHkDwhD+kxK4nk1oFLKNRRjgfNGnzCNj6HGaCUFBvtJt4KNL7T
	gd7V0RnJsmCUFMZ8UPCIyUAllDgbQ6tthSwvcUgVzE8CBX4YRN2xZKMmPaVBhhqm7J0CgK4Svoq
	O/CvsO7XhpRLLP6b6uQNi1HJBIfg=
X-Received: by 2002:ac8:5847:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e6ead5a000mr58399711cf.10.1760002204814;
        Thu, 09 Oct 2025 02:30:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFr0wEaBL2XbLULBN8fCQQoMulUdbLu/EIkIvWun7NFXx/+YOoZKhrRMhgISJJafb8hTw0mg==
X-Received: by 2002:ac8:5847:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e6ead5a000mr58399341cf.10.1760002204261;
        Thu, 09 Oct 2025 02:30:04 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9ffbsm1838680266b.10.2025.10.09.02.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:30:03 -0700 (PDT)
Message-ID: <84d7ab07-4026-4313-8919-b5f9205132c6@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 11:30:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
To: Alexandre Messier <alex@me.ssier.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-4-53d7ab3594e7@me.ssier.org>
 <5a9a2ed9-9e95-4bb0-b5b9-e4e0edcfa8d8@oss.qualcomm.com>
 <1d60b78e-136f-4051-8296-245d111ca49f@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1d60b78e-136f-4051-8296-245d111ca49f@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfXx4/kV/+D2hYK
 iHaslmM0TwRGbLaoR3CpjEDK4hAlpve3LOoedLy2UzJfEH+LNvvpQ7D3eC/o096hxF4KOxF0ijD
 mY5ZXUaj4AFrE3Y+x8vVvvZW4aohsCBurKKydISdwKOwEC5H9OOvl7lx+i49j/d4QtscjvvoIJ4
 HBFj8HClx/KGCWnqX9TzPJBiNBLiEAWSwEGQ+RpLv+7P3ADWZ/9Fwd3TDVyGJZLPf5Gop2BQXis
 8UyVqDlMWvENUFUz3Z6jIItnp/DdwQHZCpFqXpoLuj37xAo/MBD6Kkz12fIi6bC0QO5ZHcX989I
 01VrYIEcVSfVtRKWPu5yN50A/01vr+oUgq9UF6nJMOh4XmjoCx3mgwKOSBBbUeGfnEstal8Utjc
 pI9IMkgtSQvv07luQrGWJyPC9mFhLA==
X-Proofpoint-GUID: 8UthJ6WePTVFEQm-MZrOb3LQeNdPPYX4
X-Proofpoint-ORIG-GUID: 8UthJ6WePTVFEQm-MZrOb3LQeNdPPYX4
X-Authority-Analysis: v=2.4 cv=JPk2csKb c=1 sm=1 tr=0 ts=68e7809d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=8poMKPHdAAAA:8 a=nTsu3JDRWy1omu5sJsEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_023006_885627_D2555286 
X-CRM114-Status: GOOD (  23.76  )
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

On 10/9/25 7:50 AM, Alexandre Messier wrote:
> On 2025-10-07 06:04, Konrad Dybcio wrote:
>> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>>> From: Alexandre Messier <alex@me.ssier.org>
>>>
>>> Add the touchscreen device node for the HTC One (M8).
>>>
>>> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
>>> ---
>>>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 36 +++++++++++++++++++++++
>>>  1 file changed, 36 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>>> index 36eb42f0f3d9..040a256f9465 100644
>>> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>>> @@ -65,6 +65,35 @@ vreg_vph_pwr: vreg-vph-pwr {
>>>  	};
>>>  };
>>>  
>>> +&blsp1_i2c2 {
>>> +	clock-frequency = <384000>;
>>
>> This is not a valid I2C frequency
>>
>> You're looking for 100/400/1000 kHz
> 
> Hello Konrad,
> 
> This frequency value is used in the vendor kernel [1], hence why I used it.
> 
> I did a test at 400 kHz, and the I2C devices (touchscreen here, and NFC in the
> other patch) are still detected, with basic functions still working.
> 
> Let me know if I should still update to use 400 kHz. I would prefer to keep
> the value from the vendor kernel (and in that case, I will update the commit
> message to add that information).

Hm, I grepped around in old vendor trees, and it seems like there was
a period of horrid wild west wrt this..

I see 355 kHz, 384 kHz, next to "normal" values of 100/400..

Let's just keep it as-is, but please note in the commit message that this
is intended and that's what the downstream sets too

Konrad

