Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BCEE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 10:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dit2XdV4jZIb+L6jEF8gWfIehhTuSojBtBDYrG6sMmI=; b=3Nhxst7swHDQHQc95xlCuUX6kX
	p+Z726FUnocBKO12ZIAxpK8HNBb0VQvLxbuEnCHvrV9lhuq1ks3/zZczkaLyPBMilKk7TK8yGWXAF
	NB8xF1RyyBX18LKIfiZkzEIpFwJlqTT9z4pQP5QpOZiwck74aAoy1OrIqTkWKqV+SBmUkgrBzYuNK
	T1xY8u7nnUrFZuHeu5VjL7TsAGsITAnFgltxSzi2eXSsnL2WMoZz2IYqsh59V+7v8YlekuSt4xeyu
	+HzA+pl23VDcaZ00KJT/b7qL8B15fm+WZYt47mVwLvZp5DdIdBfsZoJtK30O2NOghv8cwWbWhF8nP
	HxJYlEKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8wQ-0000000FU9B-3n4r;
	Thu, 05 Dec 2024 10:18:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8vK-0000000FTrI-3Hxg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 10:17:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B57UxGp025018;
	Thu, 5 Dec 2024 10:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dit2XdV4jZIb+L6jEF8gWfIehhTuSojBtBDYrG6sMmI=; b=ZX1Dx79TqwzKLo3U
	mGA5Z9aJbhUDzHhKOma/mqMlGNdGK4T+gKs9uLPZC4fzgY36K4B3vkmBhCMBkeHq
	mTu0gSs4Q3scZHRNMYB4ulS+wO+9s1RqtytgL9lVBtSRjcDFaG642qrFJL78Jphn
	VDzKaM9OT/o4MRw9XzBvT5TZc+8WDxJPyUIW44q860ZAy/mKCOzxf1pLhurUjP0M
	NBScpNp9P2MpuCYnmnNyTVnMjcTLdbadv82wsEc0J54ji/HclVFhetOeaqEXLEHZ
	/HHF7/UMf6isDbsBGeQYnwG7z6vZ3XklnbA4aZFZNtEu745Ne8YHlNhKkCAJXg7u
	M/oqDA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43aj42bvf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 10:17:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5AHNdU020454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 10:17:23 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 02:17:17 -0800
Message-ID: <6356241e-6bfc-c4dc-1fbd-cd92f1b236ba@quicinc.com>
Date: Thu, 5 Dec 2024 15:47:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Content-Language: en-US
To: <myungjoo.ham@samsung.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Kyungmin Park <Kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
CC: "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
        "cristian.marussi@arm.com"
	<cristian.marussi@arm.com>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>,
        "robh+dt@kernel.org"
	<robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "quic_rgottimu@quicinc.com"
	<quic_rgottimu@quicinc.com>,
        "quic_kshivnan@quicinc.com"
	<quic_kshivnan@quicinc.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
        Amir Vajid
	<avajid@quicinc.com>
References: <ac655bdc-5ccf-c6c6-3203-659f1916c53c@quicinc.com>
 <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-5-quic_sibis@quicinc.com>
 <2aycrvnvivcrqctqmweadcgenwugafdr6ub3bzkscterpenz32@bzabln2hkral>
 <29eef87e-96f6-5105-6f7a-a8e01efcb4a3@quicinc.com>
 <k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7>
 <CGME20241114041419epcas1p3b52bb9795ffd9efa568bb106ba268e02@epcms1p5>
 <20241115003809epcms1p518df149458f3023d33ec6d87a315e8f6@epcms1p5>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <20241115003809epcms1p518df149458f3023d33ec6d87a315e8f6@epcms1p5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j-5sSJzGurTdnMTU9b402_166u-cHYBA
X-Proofpoint-ORIG-GUID: j-5sSJzGurTdnMTU9b402_166u-cHYBA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=981 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_021730_946682_68EEB6F3 
X-CRM114-Status: GOOD (  20.10  )
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



On 11/15/24 06:08, MyungJoo Ham wrote:
>>
>> Hey Dmitry,
>>
>> Thanks for taking time to review the series.
>>
>> + Devfreq maintainers to comment (I thought you already added
>> them by name)
>>
>>
>> Hey MyungJoo/Kyungmin/Chanwoo,
>>
>> Can you weigh in here? Does it make sense to add a new
>> class of devfreq devices that don't have governors
>> associated with them just for them to export a few
>> essential data to userspace? In this scenario the
>> scaling algorithm is in a SCP and we just start
>> them from the kernel. We do have ways to get the
>> current frequency of various buses but does this
>> warrant adding a new class of governor less devices?
>>
>> -Sibi
> 
> If voltage/frequency is controlled by SCP
> (it's an SoC's internal hardware IP, right?),
> it's good to have a userspace governer
> with the driver not accepting updates from userspace.
> 
> E.g., Let "target" callback not update the frequency value,
>   or let "target" callback always return an error with
>   a dev_err message that you don't accept frequency changes
>   from userspace.

Thanks for the input. Will implement something similar to
what you suggested for the next re-spin.

-Sibi

> 
> Cheers,
> MyungJoo.

