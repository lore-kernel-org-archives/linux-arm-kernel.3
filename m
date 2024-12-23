Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F96E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 14:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkQFu57Xw7aHa6drSo6fMkLlf1A2SffvDf56Onaz0Os=; b=KgnJwlEeS+K9axcAraEjk2aRJC
	nv3A8x12KbidyC+qASFjhcLZzzPU4lxrljCWfOuGuSRH25ULOfEEM4zy0LKkpkuW3T6NQmdFkJImQ
	zspRlBdivzlhszShcllAC/O2hUj9lytW+wbdAhfvxs4cL1zHLIg5WdOUESFs0LaSQ7b6utL1JrrCz
	VsAm1MlNWsDtuSQgAY0+fw20hnOKZKuCgLc+LP/78GkG5Boliu7rank48H3pZfgodTIErI2hSkYOc
	zAysPr8t0Rf+XkdooAI/Kc00xhQm5/PNfc3ANlHGx8DknbQ37gpmVlmzXg/l642/b5VjyPrVrHC+k
	MFaShyEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjii-0000000ADje-2GsO;
	Mon, 23 Dec 2024 14:47:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjhX-0000000ADfP-0Z5T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 14:46:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBwwGF020173;
	Mon, 23 Dec 2024 14:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NkQFu57Xw7aHa6drSo6fMkLlf1A2SffvDf56Onaz0Os=; b=JBPepMeSyd3m2Q4o
	UWlf4SzmyZb6fWYrgGmWOhK7FIetzKzvaGjDVNl6z3qRUplofX4lDxFS+MrSApf3
	lmgZzqNOZRToXggbnlVWlUaWcY7LIkMLPpQ+3grO5LuucOPb+D/FbpmJQ37C1En8
	lyC4y4DUUxMYFZMEQ1ubFLbWGRkzPJnipc97EnS7+nkXMvXJRjaMnEK50AJVx1Na
	IcDV1W7IFxlUEnzWGTfKElm+JVr8ZyU8ehyWWzJCeQG2JaNeFTBzFUGv8SdNkPFh
	KUnVxcXaA6IVMdl6TM7tICr0TS9eTSS42ipq7qOOg6tGrJ7+WAlZXUpkLEqAXCYB
	/HRrYw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q7ev0dep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 14:46:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNEk9Bt009224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 14:46:09 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 06:44:13 -0800
Message-ID: <00c27553-5466-e59a-633a-e368a6e26167@quicinc.com>
Date: Mon, 23 Dec 2024 19:30:46 +0530
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
        <conor+dt@kernel.org>, <arm-scmi@vger.kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com> <ZyvLktLUZOGP-LH5@pluto>
 <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
 <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
 <Z0BC203BhGEmXcJi@hovoldconsulting.com>
 <d61bb7bc-d824-883a-4edd-109ae74076c1@quicinc.com>
 <Z1HMWUa_QCsNA1-Q@hovoldconsulting.com>
 <132d1404-9009-9fb5-1fb9-63eca03ce9fc@quicinc.com>
 <Z2P3bh04xXsreBF7@hovoldconsulting.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Z2P3bh04xXsreBF7@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0j4k8P_OsHqZvPH_hm1q_GerogBkN_h6
X-Proofpoint-GUID: 0j4k8P_OsHqZvPH_hm1q_GerogBkN_h6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_064631_305265_5D17FF0C 
X-CRM114-Status: GOOD (  24.94  )
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



On 12/19/24 16:07, Johan Hovold wrote:
> On Tue, Dec 17, 2024 at 05:19:25PM +0530, Sibi Sankar wrote:
>> On 12/5/24 21:22, Johan Hovold wrote:
>>> On Thu, Dec 05, 2024 at 04:26:55PM +0530, Sibi Sankar wrote:
>>>> On 11/22/24 14:07, Johan Hovold wrote:
>>>
>>>>> I have a Lenovo ThinkPad T14s set up now so I gave this series a spin
>>>>> there too, and there I do *not* see the above mentioned -EOPNOSUPP error
>>>>> and the memlat driver probes successfully.
>>>>>
>>>>> On the other hand, this series seems to have no effect on a kernel
>>>>> compilation benchmark. Is that expected?
>>>>
>>>> I can have a look at your tree. But memlat in general
>>>> depends on the cpu frequency when your benchmarks max
>>>> the cpu's the ddr/llcc are scaled accordingly by it.
>>>
>>> A kernel compilation should max out the CPU frequency on all cores.
> 
> Answering my own question here; bwmon should scale the buses for
> benchmarks like kernel compilations so I guess the non-existing impact
> of memlat is expected here.

you would see impact only in cases where you would benefit from
having ddr and llcc at a higher frequency i.e. latency workloads.
I usually run geekbench with and we are expected to see a big
difference with and without it.

> 
> Ettore helped me run some further benchmarks, including cachebench, but
> also saw no positive (or negative) effect with this series running on an
> X1E CRD (with recent firmware).
> 
> Do you have any suggestions of benchmarks to run where the effect of
> memlat should show up? What have you been using for testing?
> 
> I did measure a possibly slightly higher (idle) power consumption with
> memlat, but I guess that is also expected given the intended more
> aggressive ramping of the bus clocks.
> 
> These are the branches (and configs; johan_defconfig) we've used for
> testing:
> 
> 	https://github.com/jhovold/linux/tree/wip/x1e80100-6.13-rc3
> 	https://github.com/jhovold/linux/tree/wip/x1e80100-6.13-rc3-memlat

Thanks, we'll get this sorted out.

> 
>>>>> And does this mean that you should stick with the uppercase "MEMLAT"
>>>>> string after all? The firmware on my CRD is not the latest one, but I am
>>>>> using the latest available firmware for the T14s.
>>>>
>>>> We should stick with "memlat" if we run into a device in the
>>>> wild that doesn't support "MEMLAT"
>>>
>>> Ok. So the updated firmware supports both strings?
>>
>> Sry for the delay, was out sick. Yes the updated firmware supports both
>> strings.
> 
> No worries, hope you're feeling better.
> 
> I noticed that the firmware on the T14s indeed accepts both strings.
> 
> Johan

