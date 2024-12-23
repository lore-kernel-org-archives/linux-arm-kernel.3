Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D09FE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUADoYAEXAjzYTaDdyLdGJaM2J1pakkDLD8BArbn9CM=; b=01rsX+ssKJ5EBuMtV5haqhlEDM
	0fxNcN/XcYYr0/YdpP4paCek3PUXXyftzhj/0GOcAy5G1JBOe2FKgiUl5YVmu0A9bV2HjAJMEUWon
	DrAXlbToNXEMsTN3Z1lhsLUiYI/PB/WxlJ4tWU6TRirKoCzy/cD7K/tEQAh6wQFEFmtQ83XyA7CAj
	tUat9y7fUbLua+bSIZ+8qMWAzBCUkA357/Fzht1QxqAgGB3TBQxlxPM8rhS4aE5YxSg3bsSk8pmnL
	IUFHZrLC+YFOI6skzk3B04HAhAxNMBUBmefxgf82eoFhQdyd6KLdLynsZXDUGqJl32t6HRzhdtbuq
	OP9oj4bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjmg-0000000AEHa-0TCG;
	Mon, 23 Dec 2024 14:51:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjl4-0000000AE0U-227s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 14:50:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBvjpG018220;
	Mon, 23 Dec 2024 14:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUADoYAEXAjzYTaDdyLdGJaM2J1pakkDLD8BArbn9CM=; b=ayRZXVPSTxQQQDNf
	JnpqFRP2LpCadNUouzWnMKYT0CjQ0fgVlEXFsZRabQvxkVjAwWQ5oQuNg7QeVXU8
	Y411MBIbF05TzhOKYxqbd4Cno9xoALAi/IRmN6vNWb8+ZPnJbqkFUPVucFx41c3H
	vtms8DDRPWb+TmVbZ1EhvELryrgqFTTZzp4v4c2GbgprC67lnX9LWJZf/XjBPE8/
	HXacdD5bNelHEdIBqhZMjimuyEs1k0dbDAEiFlmb7aaxPBZej+aerxF1WN3LNzkA
	tBPtAdf+eG7iKVv3GW9tzxF2qui3i+PLQZFTF1LSgGvW4FGvtoqK+9uwq1lCdRvj
	zHmUKw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q7ev0e6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 14:50:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNEo2cC023387
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 14:50:02 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 06:49:57 -0800
Message-ID: <8ec6ff19-b4e7-efdd-30b0-3160388e02ec@quicinc.com>
Date: Mon, 23 Dec 2024 19:44:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Johan Hovold <johan@kernel.org>,
        Cristian Marussi
	<cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <conor+dt@kernel.org>,
        <arm-scmi@vger.kernel.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com> <ZyvLktLUZOGP-LH5@pluto>
 <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
 <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
 <Z0BC203BhGEmXcJi@hovoldconsulting.com> <Z1HceQegfMl07qj_@bogus>
 <d313e40b-fa8f-a534-5037-98536ee25044@quicinc.com>
 <20241217175934.GC2016149@bogus>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <20241217175934.GC2016149@bogus>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FWK-J32mSpyKBK7GFultKyoKn9ZG8ePt
X-Proofpoint-GUID: FWK-J32mSpyKBK7GFultKyoKn9ZG8ePt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_065010_655892_4E75AB39 
X-CRM114-Status: GOOD (  45.50  )
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



On 12/17/24 23:29, Sudeep Holla wrote:
> On Tue, Dec 17, 2024 at 05:55:35PM +0530, Sibi Sankar wrote:
>>
>>
>> On 12/5/24 22:31, Sudeep Holla wrote:
>>> On Fri, Nov 22, 2024 at 09:37:47AM +0100, Johan Hovold wrote:
>>>> On Thu, Nov 14, 2024 at 09:52:12AM +0530, Sibi Sankar wrote:
>>>>> On 11/8/24 20:44, Johan Hovold wrote:
>>>>
>>>>>>> On Wed, Nov 06, 2024 at 01:55:33PM +0100, Johan Hovold wrote:
>>>>
>>>>>>>> Second, after loading the protocol and client drivers manually (in that
>>>>>>>> order, shouldn't the client driver pull in the protocol?), I got:
>>>>>>>>
>>>>>>>> 	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
>>>>>>>> 	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
>>>>>>>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
>>>>>>>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95
>>>>>>>>
>>>>>>>> which seems to suggest that the firmware on my CRD does not support this
>>>>>>>> feature. Is that the way this should be interpreted? And does that mean
>>>>>>>> that non of the commercial laptops supports this either?
>>>>
>>>>>> Yeah, hopefully Sibi can shed some light on this. I'm using the DT
>>>>>> patch (5/5) from this series, which according to the commit message is
>>>>>> supposed to enable bus scaling on the x1e80100 platform. So I guess
>>>>>> something is missing in my firmware.
>>>>>
>>>>> Nah, it's probably just because of the algo string used.
>>>>> The past few series used caps MEMLAT string instead of
>>>>> memlat to pass the tuneables, looks like all the laptops
>>>>> havn't really switched to it yet. Will revert back to
>>>>> using to lower case memlat so that all devices are
>>>>> supported. Thanks for trying the series out!
>>>>
>>>> I have a Lenovo ThinkPad T14s set up now so I gave this series a spin
>>>> there too, and there I do *not* see the above mentioned -EOPNOSUPP error
>>>> and the memlat driver probes successfully.
>>>>
>>>> On the other hand, this series seems to have no effect on a kernel
>>>> compilation benchmark. Is that expected?
>>>>
>>>
>>> Hijacking this thread to rant about state of firmware implementation on
>>> this platform that gives me zero confidence in merging any of these without
>>> examining each of the interface details in depth and at lengths.
>>>
>>
>> Hey Sudeep,
>>
>> Thanks for taking time to review the series.
>>
>>> Also I see the standard protocol like PERF seem to have so many issues which
>>> adds to my no confidence. I can't comment on that thread for specific reasons.
>>
>> ^^ is largely untrue, a lot of finger pointing and a gross
>> misrepresentation of reality :/
>>
> 
> Sorry if I was not clear, I just said I don't have confidence yet and if
> the firmware is stable, then it is just the impression I have arrived based
> on the discussions.

It's like you said the SCMI PERF protocol isn't used in Windows
but they do vendor protocol for bus scaling i.e. the memlat
algostring hosted on the generic vendor protocol. So those
bits are expected to be pretty stable.

> 
>> crash in the LEVEL_GET regular message implementation. This
>> pretty much went unnoticed because of messaging in perf implementation
>> in kernel.
> 
> OK, is there any scope to improve in your opinion ? Please suggest and
> discuss or post a patch to have separate discussion.
> 
>> Given the fastchannel implementation isn't mandatory
>> according to spec, the kernel clearly says it switches to
>> regular messaging when it clearly doesn't do that and uses
>> stale data structures instead.
> 
> Interesting, it sounds like a bug. Please provide details or patch to
> fix the bug. That would probably fix it on whatever platform we are
> concerned here.

sry, It was just a misunderstanding. Please ignore.

> 
>> This ensured that level get regular messaging never got tested.
>>
> 
> You seem to point at this bug several time now, we need to get it fixed,
> but we need to understand it first if you want us to fix it or as mentioned
> before you can as well post the patch.
> 
>> We pretty much have been good upstream citizens, finding bugs and
>> sending fixes wherever we can. We clearly don't deserve such a hostile
>> stance.
>>
> 
> Not sure what made you think we are hostile towards your contributions.
> We just need a maintainable solution merged upstream and we are working
> towards the same. The documents written as part of this series is not
> there yet to help me understand the protocol yet. I have asked questions
> and answer to those can be made part of the next version to improve it
> IMO.

Ack and we would ensure those get implemented to ensure the
protocol remains easily reviewable and maintainable.

-Sibi

> 
>>> I will briefly mention my suspicion here. This Lenovo ThinkPad T14s being
>>> primarily targeting other OS using ACPI might have just implemented what is
>>> required for ACPI CPPC which conveniently doesn't have to discover lot of
>>> fastchannel details since they are supplied in the tables straight away.
>>> But that also would mean it could be not fully compliant to SCMI spec.
>>
>> Not fully compliant to the spec? I am pretty sure this series would
>> have been shot down completely and NAKd on the list by you if that
>> was the case lol.
>>
> 
> Honestly I am still trying to make any sense out of this vendor protocols.
> The documents produced as part of this series doesn't help me understand
> the same and that is my main feedback so far on this thread. I haven't
> looked at the code yet so I can't comment on the same as I first need
> to understand the vendor protocol document/specification.
> 

