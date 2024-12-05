Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB641E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBUdjdgLVwj0/hVJtgaHJOU56SLNHURQ1RyBIpwz4Os=; b=TdPLCTWrhx1Zw9DARXd9wCzr7W
	2IG949aH9TIrO3w2w56RfqH/jhYKZHfDYKJhDkyrzKg+e7f9aCIobVdK4dwu7ug47Q89ybPMVpM6o
	AQJUPutpZPiuNLrNxue2tvupZ2XeurUSSXO111CfVG/A+8pmd6Dq0II7Mur/Npes+89RvzWtseLAy
	rE6/IqQvTRyPeEgG3k0DjoG7lNgDsa7uMWdFZmEfGotfDf2FXAof/vT3T2+gejCeeiZoVXTk/wxqK
	HhXwkfnR0m2MQUP27fsdZ6wvMiNXKYvD0SoOVaAEdkciojia7UAesxcKjx//C0SP0edORvj6JviHK
	6/BB8JyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVz-0000000Fq4M-13ZY;
	Thu, 05 Dec 2024 11:59:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Xh-0000000FdbC-44Ci
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 10:57:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B542ECT031997;
	Thu, 5 Dec 2024 10:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EBUdjdgLVwj0/hVJtgaHJOU56SLNHURQ1RyBIpwz4Os=; b=Bp2UtrnYL0yAewsA
	g2+mP0bimstgu7QQKTe2scd7rgvK2rQRC4ICw2z2RUYPahnMwPkaZd79mvYjmCdW
	3zhMK0cqvMg4JBdKZB+yQz967I+ZhQbaDJSLgh7urJ0EGfP8fwdgvxxd/9j9LxgM
	y63IbYAtCI7u46zAXIuaqAFgsxBYeLikbN+dILRFEfN4xOT9RvwqdCSl3mZtFVjX
	XNKoTQGGLOdnalExdzDsbemccqqSPl3cNV5NRViLf78rBOuIspacux4jV73OampP
	Ucxjn99H83f+4Ia+1IxizJZJ0Fjzv6A0GUBao/gldbeqDDw7GjkiDG+I6yIwFGxF
	fccPBQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3fax7ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 10:57:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5Av1db026052
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 10:57:01 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 02:56:57 -0800
Message-ID: <d61bb7bc-d824-883a-4edd-109ae74076c1@quicinc.com>
Date: Thu, 5 Dec 2024 16:26:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
CC: Cristian Marussi <cristian.marussi@arm.com>, <sudeep.holla@arm.com>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, <arm-scmi@vger.kernel.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com> <ZyvLktLUZOGP-LH5@pluto>
 <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
 <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
 <Z0BC203BhGEmXcJi@hovoldconsulting.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Z0BC203BhGEmXcJi@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3uxBE9bRq_pqJ6zTmUEmn1JHAbjS8324
X-Proofpoint-GUID: 3uxBE9bRq_pqJ6zTmUEmn1JHAbjS8324
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_025710_017182_9686B4B7 
X-CRM114-Status: GOOD (  24.79  )
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



On 11/22/24 14:07, Johan Hovold wrote:
> On Thu, Nov 14, 2024 at 09:52:12AM +0530, Sibi Sankar wrote:
>> On 11/8/24 20:44, Johan Hovold wrote:
> 
>>>> On Wed, Nov 06, 2024 at 01:55:33PM +0100, Johan Hovold wrote:
> 
>>>>> Second, after loading the protocol and client drivers manually (in that
>>>>> order, shouldn't the client driver pull in the protocol?), I got:
>>>>>
>>>>> 	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
>>>>> 	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
>>>>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
>>>>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95
>>>>>
>>>>> which seems to suggest that the firmware on my CRD does not support this
>>>>> feature. Is that the way this should be interpreted? And does that mean
>>>>> that non of the commercial laptops supports this either?
> 
>>> Yeah, hopefully Sibi can shed some light on this. I'm using the DT
>>> patch (5/5) from this series, which according to the commit message is
>>> supposed to enable bus scaling on the x1e80100 platform. So I guess
>>> something is missing in my firmware.
>>
>> Nah, it's probably just because of the algo string used.
>> The past few series used caps MEMLAT string instead of
>> memlat to pass the tuneables, looks like all the laptops
>> havn't really switched to it yet. Will revert back to
>> using to lower case memlat so that all devices are
>> supported. Thanks for trying the series out!
> 
> I have a Lenovo ThinkPad T14s set up now so I gave this series a spin
> there too, and there I do *not* see the above mentioned -EOPNOSUPP error
> and the memlat driver probes successfully.
> 
> On the other hand, this series seems to have no effect on a kernel
> compilation benchmark. Is that expected?

I can have a look at your tree. But memlat in general
depends on the cpu frequency when your benchmarks max
the cpu's the ddr/llcc are scaled accordingly by it.

> 
> And does this mean that you should stick with the uppercase "MEMLAT"
> string after all? The firmware on my CRD is not the latest one, but I am
> using the latest available firmware for the T14s.

We should stick with "memlat" if we run into a device in the
wild that doesn't support "MEMLAT"

-Sibi

> 
> Johan
> 

