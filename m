Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90E3D41C00
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 04:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CRcqgJXGmT58AChw8Nvv5lieziF0ewVAThPCHqECyY=; b=URi3UNbehLNro3i8qmHysR9A3a
	Go4tRLfX9EGD8WVXEEOz0j9lw8R2vDBc3U2Gh8BX5BaxmjWejIC/s47cmzbzEyAWvDHIIC/dd+dzH
	9QSJ/nzQq6SAsWiO0CbE1OeJYQSZyTjiwtuGWybgZuT6c8lwvR+S7Ujlv8l3xKll4Rl1aIVun1DCb
	fAeQ0oLrK2jC6hkq6xBECiMlQ8gnNviFYy4JscAUmicszkgrCPGOz3v11ES71nedn/Qs4QXjxdAcc
	IZ/Us6PoJv2WLckrVuWzVxNafLSa7LbV9qvvgcLEbsw7A9TO57moZgMWuSNA1UyhDOaj/R5nqZmju
	qURYGB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBRP1-00000008lMw-3Pa8;
	Thu, 14 Nov 2024 04:24:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBRNE-00000008lET-0O4Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 04:22:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADHxniA027157;
	Thu, 14 Nov 2024 04:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3CRcqgJXGmT58AChw8Nvv5lieziF0ewVAThPCHqECyY=; b=WhvsDkcnUH1nEG+E
	3CWqk3tLV64njfViVerLcyKCr3zEE+z1XR+LdNkCvEVr6Oyw3UaruqMkgO9Jbn5W
	wgckY0esbFHPTj27bHl9HQVdL/BAUc/ulRGm7MrLsQZ2KoV+pW3T9egrdcpgjdGR
	ttETIInMdY2suFyqqW0V9qs8gNcqd8iHRxzSzeAYQEmbTufyPajZtPmDtdvK3wtS
	FkRoRst8LeAFRN3Ruqbg9jXZFLWzhF3OPZ5WXEz4aoBaLTruiXVDjh+TKVET3yJQ
	K6UYfhWvpos2K8HmzCvBzVxYPK2mbFM4SvSZ8YPE+0GKOl5QUf49JzqweSJ4zTOJ
	b8+ZBw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w10jsauf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 04:22:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE4MKxI020469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 04:22:20 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 20:22:15 -0800
Message-ID: <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
Date: Thu, 14 Nov 2024 09:52:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>,
        Cristian Marussi
	<cristian.marussi@arm.com>
CC: <sudeep.holla@arm.com>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, <arm-scmi@vger.kernel.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com> <ZyvLktLUZOGP-LH5@pluto>
 <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ck_pFac5hiXn-6giWIZ01__EsRj8wLt9
X-Proofpoint-GUID: ck_pFac5hiXn-6giWIZ01__EsRj8wLt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_202228_291304_B5454625 
X-CRM114-Status: GOOD (  29.40  )
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



On 11/8/24 20:44, Johan Hovold wrote:
> On Wed, Nov 06, 2024 at 08:03:30PM +0000, Cristian Marussi wrote:
>> On Wed, Nov 06, 2024 at 01:55:33PM +0100, Johan Hovold wrote:
> 
>>> First, I expected the drivers to be loaded automatically when built as
>>> modules, but that did not happen so something appears to be missing.
> 
>> Even though, module usage is tracked by the core AND when an SCMI Vendor
>> driver tries to use protocol_X, it causes protocol_X to be initialized
>> (calling its protocol_init), there is NO auto-loading for SCMI Vendor
>> Protocols when bult as LKM...because there were really no ask till now
>> and this stuff is in general needed so very early dburing boot...so the
>> usecase of all these LKM modules is just debug/test as in your case
>> (or in mine frequently)....
>>
>> ...and I am NOT saying with this that is necessarily right or must be
>> stay like this...just explaining how it is now....
> 
> Ok, thanks for clarifying.
> 
>> ....anyway...it is mostly trivial to add vendor/protocols autoloading
>> transparently...today I was experimenting with a patch that triggers
>> autoloading based on a generic common alias pattern in the form
>> 'scmi-protocol-0x<NN>' (with NN the specific protocol ID of course)
>> that triggers the loading as soon as the SCMI Vendor driver tries to
>> access the protocol during its probe...
>>
>> ....I will post it for the next cycle once it is clean.
>> (unless I am missing something else that you want to add...)
> 
> Sounds like that would solve the issue. I was just expecting the memlat
> client driver and its protocol dependency to be loaded automatically
> when built as modules on machines that can use them (e.g. as we don't
> want to have every vendor protocol driver built into distro kernels,
> etc).
> 
>>> Second, after loading the protocol and client drivers manually (in that
>>> order, shouldn't the client driver pull in the protocol?), I got:
>>>
>>> 	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
>>> 	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
>>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
>>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95
>>>
>>> which seems to suggest that the firmware on my CRD does not support this
>>> feature. Is that the way this should be interpreted? And does that mean
>>> that non of the commercial laptops supports this either?
>>
>> This seems like FW rejecting the command, maybe just only for the specific
>> Linux OSPM agent since it is not allowed to ask for that specific setup,
>> and only Sibi can shed a light here :D
>>
>> ...but this Vendor protocol, if I am not mistaken, AFAIU, uses a bunch
>> of "algo strings" coming from tokens it picks from DT and use thsoe as
>> params for the set_param() VendorProtocol ops...cannot be that a bad/missing
>> DT value could cause the FW to reject the command due to the params ?
>> (even if the command is supported)...
>>
>> ...just a guess ah... I have no real knowledge of this venndor proto...
> 
> Yeah, hopefully Sibi can shed some light on this. I'm using the DT
> patch (5/5) from this series, which according to the commit message is
> supposed to enable bus scaling on the x1e80100 platform. So I guess
> something is missing in my firmware.

Nah, it's probably just because of the algo string used.
The past few series used caps MEMLAT string instead of
memlat to pass the tuneables, looks like all the laptops
havn't really switched to it yet. Will revert back to
using to lower case memlat so that all devices are
supported. Thanks for trying the series out!

-Sibi

> 
> Johan

