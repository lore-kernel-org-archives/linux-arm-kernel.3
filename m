Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6126ED11702
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 06:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nU7X9QJtXj4kr5U7czhxv7z8S81VcdkIgIHIJueaW8A=; b=Pf3U3Kap2g4YjhT3+0UfzwjuI/
	IHCEgP6EPVyTMekGJIBKOMNVoVP1nqIp30Z5ylQ9ftCrTkYU8fzM92XCmS3vKSxy+/A9S6Am0NDqz
	qUVWGG+UXh4mEpTuuUl5OaoRLmEj0VyL2lFip79QpsfZyVBsoQzM4sJj4FCagTUiZBXRHIasISgRZ
	wwNcSNzjyFJdD6BIy0QFTWGG3OGmx34bdDCiMsYbShsq+SJ+nykqD2DLbzQKmPulBpu3Hy1wQz2Dt
	pPRqcNFJ0n4S1u3apoEnr+KA5UGCd48zR1f7tq27ttaipCdwEVEbgyXIRW0c9QW79zKvnWNYpnkQx
	VMssw1Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4E78-00000002ioY-0FBY;
	Fri, 25 Oct 2024 06:48:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4E5Y-00000002icd-3GKK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 06:46:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P0lt4h031208;
	Fri, 25 Oct 2024 06:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nU7X9QJtXj4kr5U7czhxv7z8S81VcdkIgIHIJueaW8A=; b=JKYUtI2yQZXS6sB/
	gKG+vuJzWC3vWUED+jzgtVe31wRCCpLb8Hk8+wYBfcz/Igi8NuhnnsNO40CAjP1t
	HafryVKCl0q91IxrFxsYKUUHDAXGtD4VnjA0kevEpoqyuX9lj45PZ4MkcLxSZ6B2
	Ni6Fxa/R3Wc1Pp5FyvvjDAlzCPJhHx51OmxE0nebryJcIZVjRWsf8mWaqiQkjDwt
	q2ucgcqle5AGIeUwNh2cmQLRnzRHG5UmztXieX+zmmtFAGlYMR+sVfWx5f35aFYQ
	uX08aBq9o5qam1ebtqk0g2NpTATEtF0hlVvjY0Qt0R7HF0lPspjGJwDAZL6sFFgv
	yeEBKg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em6880d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 06:46:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P6k7G8025201
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 06:46:07 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Oct
 2024 23:46:03 -0700
Message-ID: <83b635a7-fc69-7522-d985-810262500cb3@quicinc.com>
Date: Fri, 25 Oct 2024 12:15:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V3 0/4] firmware: arm_scmi: Misc Fixes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Johan Hovold <johan@kernel.org>, <sudeep.holla@arm.com>,
        <cristian.marussi@arm.com>, <ulf.hansson@linaro.org>,
        <jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>,
        <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <konradybcio@kernel.org>,
        <linux-pm@vger.kernel.org>, <tstrudel@google.com>, <rafael@kernel.org>
References: <20241007060642.1978049-1-quic_sibis@quicinc.com>
 <ZwfsmqInJlqkQD_3@hovoldconsulting.com>
 <ae5eaef9-301f-7d3f-c973-faa22ae780ee@quicinc.com>
 <ZxkjqEmkBAsC6UkL@hovoldconsulting.com>
 <c8e7420b-a7b4-89cd-1b6e-c1f6693c062d@quicinc.com>
 <ik4dyfbphm7lkeipm2dbr7cmdfxewxd4jtuz2jfnscfwcyo2r4@lrin5hnsqvyd>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <ik4dyfbphm7lkeipm2dbr7cmdfxewxd4jtuz2jfnscfwcyo2r4@lrin5hnsqvyd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0uP27WzQWy28EEKegj99PL56GdP6O9UZ
X-Proofpoint-GUID: 0uP27WzQWy28EEKegj99PL56GdP6O9UZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_234624_971587_2E76E4C7 
X-CRM114-Status: GOOD (  26.92  )
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



On 10/25/24 11:44, Dmitry Baryshkov wrote:
> On Fri, Oct 25, 2024 at 11:38:36AM +0530, Sibi Sankar wrote:
>>
>>
>> On 10/23/24 21:56, Johan Hovold wrote:
>>> On Wed, Oct 23, 2024 at 01:16:47PM +0530, Sibi Sankar wrote:
>>>> On 10/10/24 20:32, Johan Hovold wrote:
>>>>> On Mon, Oct 07, 2024 at 11:36:38AM +0530, Sibi Sankar wrote:
>>>>>> The series addresses the kernel warnings reported by Johan at [1] and are
>>>>>> are required to X1E cpufreq device tree changes [2] to land.
>>>>>>
>>>>>> [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
>>>>>> [2] - https://lore.kernel.org/lkml/20240612124056.39230-1-quic_sibis@quicinc.com/
>>>>>>
>>>>>> The following warnings remain unadressed:
>>>>>> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
>>>>>> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
>>>>>
>>>>> Are there any plans for how to address these?
>>>
>>>> Sorry missed replying to this. The error implies that duplicate
>>>> opps are reported by the SCP firmware and appear once during probe.
>>>
>>> I only see it at boot, but it shows up four times here with the CRD:
>>
>> https://lore.kernel.org/lkml/d54f6851-d479-a136-f747-4c0180904a5e@quicinc.com/
>>
>> As explained ^^, we see duplicates for max sustainable performance twice
>> for each domain.
> 
> If existing products were shipped with the firmware that lists single
> freq twice, please filter the frequencies like qcom-cpufreq-hw does.

That was a qualcomm specific driver and hence we could do such
kind of filtering. This however is the generic scmi perf protocol
and it's not something we should ever consider introducing :/

> 
>>
>>>
>>> [    8.098452] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
>>> [    8.109647] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
>>> [    8.128970] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
>>> [    8.142455] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
>>>
>>>> This particular error can be fixed only by a firmware update and you
>>>> should be able to test it out soon on the CRD first.
>>>
>>> Can you explain why this can only be fixed by a firmware update? Why
>>> can't we suppress these warnings as well, like we did for the other
>>> warnings related to the duplicate entries?
>>>
>>> IIUC the firmware is not really broken, but rather describes a feature
>>> that Linux does not (yet) support, right?
>>
>> We keep saying it's a buggy firmware because the SCP firmware reports
>> identical perf and power levels for the additional two opps and the
>> kernel has no way of treating it otherwise and we shouldn't suppress
>> them. Out of the two duplicate opps reported one is a artifact from how
>> Qualcomm usually show a transition to boost frequencies. The second opp
>> which you say is a feature should be treated as a boost opp i.e. one
>> core can run at max at a lower power when other cores are at idle but
>> we can start marking them as such once they start advertising their
>> correct power requirements. So I maintain that this is the best we
>> can do and need a firmware update for us to address anything more.
> 
> Will existing shipping products get these firmware updates?

They are sure to trickle out but I guess it's upto the oem
to decide if they do want to pick these up like some of the
other firmware updates being tested only on CRD. Not sure why
warnings duplicates should block cpufreq from landing for x1e
but if that's what the community wants I can drop reposting
this series!

-Sibi

> 

