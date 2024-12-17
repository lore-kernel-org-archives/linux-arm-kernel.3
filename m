Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAA9E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQL5qS2pe+X8kDeHnQVqNSkQhE3qui4U3YosF4AomTs=; b=LgEnDc3J/+YNyNemRxa3NfIH4W
	J45USCtjKSQY+dp/gslC1NS7qUaeIZmaOaNV6flJbmSHchfTQYuwi0q+niwl0dbE5pDZswmJZwaR3
	WEvnZre30Mi8vqyKHDRb9lx7vng5Exq6hmEi3HQj7aHlE3r4Jp/hwW30S1L362yuSrogETbs3OVLI
	jiBdLKnEpWnZd+9cC2YLunbghkXi6toVcUr0cP76jQ0J+4Ym+60i4Va3EEYHvYOruxBt7hLw16tu1
	MsS0OWOhq18RhqcUixFDN3n+8o7ka3YdWAt40Z4YVIxCEmZCiRX9UszGEGbXFMxVZfzAbsW10K4hf
	GHvbWXlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSNs-0000000CdK1-270t;
	Tue, 17 Dec 2024 07:52:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSMB-0000000Cd2I-0SUk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 07:51:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6231h005880;
	Tue, 17 Dec 2024 07:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQL5qS2pe+X8kDeHnQVqNSkQhE3qui4U3YosF4AomTs=; b=OZ8yJ3Ui89Z5Uhi/
	hG8EzDrXmLKBaWRwiFLOaf8rzxUlqMe2t1X4hxPR38Av+6ip/R0oldSRCP69dYx2
	geMNfS518MXgen3E/CZ/3ClOCXUlPJx31CbQZ1f5pvz8YMliJwbuVmdie9XE9XXi
	H5afzyZhhISur0pXSnsP7wN6bBw80Kpa5WFbsMu2LBS+YIHO7LpigQS1y0fYVagU
	xEp4390g2kObKdUuvKCEjM80AnB7H6vlVBZM0bPgnoF0sgfh4N6FYAuDe++EmBzP
	hiAnjEcOt8RQ5JHvcIzjsUec6f5eOK13jKkNxy1S+C0XM24oNzY0jJYFZ1gcuILv
	6f3AFw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k3p48908-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:50:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH7orrD021258
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:50:53 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 23:50:49 -0800
Message-ID: <f839a280-aa76-4963-9580-a6e089136bb5@quicinc.com>
Date: Tue, 17 Dec 2024 15:50:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Add Qualcomm extended CTI support
From: Jinlong Mao <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240903121847.6964-1-quic_jinlmao@quicinc.com>
 <742d1cec-13ec-4f08-b7f3-611c6d602b3b@quicinc.com>
Content-Language: en-US
In-Reply-To: <742d1cec-13ec-4f08-b7f3-611c6d602b3b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GLJg2LnoYiq9y_XL-l9hMt1WX2YF8zQO
X-Proofpoint-GUID: GLJg2LnoYiq9y_XL-l9hMt1WX2YF8zQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 clxscore=1011 suspectscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_235103_265498_C69139E1 
X-CRM114-Status: GOOD (  19.03  )
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



On 2024/10/10 17:49, Jinlong Mao wrote:
> 
> 
> On 2024/9/3 20:18, Mao Jinlong wrote:
>> The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
>> It allows a debugger to send to trigger events to a processor or to send
>> a trigger event to one or more processors when a trigger event occurs on
>> another processor on the same SoC, or even between SoCs.
>>
>> QCOM extended CTI supports up to 128 triggers. And some of the register
>> offsets are changed.
>>
>> The commands to configure CTI triggers are the same as ARM's CTI.
>>
> 
> Hi Reviewers,
> 
> Could you please help to provide some comments from the design point of 
> view for the changes ?
> 
> The main difference of extended CTI to the normal CTI is that the
> address mapping is changed and it supports a max of 128 trigger signals.
> 
> On one soc, there will be both normal arm CTIs and QCOM extended CTIs.
> 
> As max trigger number becomes 128. So triger registers becomes 4.
> 
> Like CTITRIGINSTATUS  --- > CTITRIGINSTATUS_EXTENDED(n)     (0x040 + (4 
> * n))  n is 0 to 4.
> 
> Thanks
> Jinlong Mao

Gentle reminder for the review from the code design point of view.

> 
>> Mao Jinlong (2):
>>    dt-bindings: arm: Add Qualcomm extended CTI
>>    coresight: cti: Add Qualcomm extended CTI support
>>
>>   .../bindings/arm/arm,coresight-cti.yaml       |  14 ++
>>   .../hwtracing/coresight/coresight-cti-core.c  |  75 +++++++----
>>   .../coresight/coresight-cti-platform.c        |  16 ++-
>>   .../hwtracing/coresight/coresight-cti-sysfs.c | 124 ++++++++++++++----
>>   drivers/hwtracing/coresight/coresight-cti.h   | 123 +++++++++++------
>>   5 files changed, 253 insertions(+), 99 deletions(-)
>>
> 


