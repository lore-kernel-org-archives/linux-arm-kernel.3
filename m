Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F62C71137
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnYVnCCIQqRVwZ0YnEAaW4qHmdsbA59VsqVppYJCjhs=; b=qv+2fuDWI4mu37wlv85C0H7sQl
	8vtJFDj4mt3XhcOcjuSw6zkrl54oeT4BZFTTtSfjTP6Vrx95nTMhSpA4K8/jEL1fMs3h2fF6N4Fu0
	DtKW2Dmhyi4d7YlWYOBV/bkzL2h45vrVIvQqc0wzuD+ZZPN/nLootnqG0kx0WMZ5C/q9w+Zhrn2qU
	GYHDkevoK+qNBj6ZeAkXBMqBMfDOChzB/ZH32Ol7OfBZ+JJcT6A/p+GMXwqPRXgcFKOR9twtv62hx
	zyPuJTCzWte1lAfFWqmX8/8XEYSpqzgof11PBhjmytnaleg6op6dgE/Ih8M95jJ8mNEP4g/7/ytNB
	VGtyQCHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNmK-0000000ATMU-3dVb;
	Wed, 11 Jun 2025 15:54:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIw8-00000009e1K-2Eav
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:44:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DEcl009041;
	Wed, 11 Jun 2025 10:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jnYVnCCIQqRVwZ0YnEAaW4qHmdsbA59VsqVppYJCjhs=; b=VT8Cz+sW6Y7G2nEf
	2TjbuilfmbxyxsdNQwIkgy5SwQ0o1Ys/aXHu0vjGBMY+0vpytXqR9jD6aubo/SC5
	bz6BFZd2Vq+IMnZN7jDJwR1b19AZY4XZDZ34UWfODiprKtEowsfFod6S/byGWaEc
	a+TzsyZeWcD04ZsEK8dmZJOLQZlCdzvZx6PeN9c5NUCri9EneaVoThpiHiykyvrZ
	KWEDpjZ9Y+YilPi0E9/EAW44wNhqMBM1v7JSW/Dyc0ahly2MFNkk+5CQqT7t9iEA
	k2/W8zgEkHE2H3RoONJ7ZjPfQ981JiFA4VxpigAkPRR4QgVDcyahhcoJEQpfdAZE
	cgl0Ag==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47753brknj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 10:43:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55BAhtSA030790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 10:43:55 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Jun
 2025 03:43:52 -0700
Message-ID: <bd9a0216-ea87-4eeb-ac7f-14fcf3202bc8@quicinc.com>
Date: Wed, 11 Jun 2025 18:43:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Leo Yan <leo.yan@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250611-trace-noc-v9-0-4322d4cf8f4b@quicinc.com>
 <20250611-trace-noc-v9-2-4322d4cf8f4b@quicinc.com>
 <20250611100911.GT8020@e132581.arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250611100911.GT8020@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5MiBTYWx0ZWRfX/aHZEud6azW3
 J5d1vgRVbBhVXURcxgs2SUzAUS+Kaczjlia00EcI0On2CZiwrNdC8GqT9iOxMTDngK/uAbBy4/a
 3L118Z0C/uKv0k7kiePSwxsYVj58W/QfcBgASAUUXAwjXPR6mjszJTPYun8l+PVX9mr1CCA40Xr
 H48Eh/eTvQTilFUgWuz1Cm9ZbniR+rOtmmq7000GkbLbQxRy8Yf+FFruQ+d5itwpIWBGb9+Ao7D
 0QF7X8EIahpu9mhwBn2nkmgdPTAumT3CLoJbc73UbrkZBo0UyD+1fuJ70FVBd522OmC4bwDfshL
 U4+hrKIUp473Wo3cvBHlW6xrrKQIAwtHJPCYbRXZCzjruJnlkVVJ6+6yW68lDhf1v/g4uS6Szsk
 weA+a2X6SnxbVYpwRl2wdyZCQjX6v8ZCEobmejInuOVq1HtrGq54wdPY+uDPbW/btJ0Rm2ST
X-Proofpoint-GUID: Yuq0Gr20l7s92BO6MccC_SNRsmzTNsJr
X-Proofpoint-ORIG-GUID: Yuq0Gr20l7s92BO6MccC_SNRsmzTNsJr
X-Authority-Analysis: v=2.4 cv=SqOQ6OO0 c=1 sm=1 tr=0 ts=68495dec cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8 a=WxWR6bt4cCgWsqPF1WIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_034404_703475_B56D2AB0 
X-CRM114-Status: GOOD (  14.24  )
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



On 6/11/2025 6:09 PM, Leo Yan wrote:
> On Wed, Jun 11, 2025 at 04:59:47PM +0800, Yuanfang Zhang wrote:
>> Add a driver to support Coresight device Trace Network On Chip (TNOC),
>> which is an integration hierarchy integrating functionalities of TPDA
>> and funnels. It aggregates the trace and transports to coresight trace
>> bus.
>>
>> Compared to current configuration, it has the following advantages:
>> 1. Reduce wires between subsystems.
>> 2. Continue cleaning the infrastructure.
>> 3. Reduce Data overhead by transporting raw data from source to target.
>>
>>   +------------------------+                +-------------------------+
>>   | Video Subsystem        |                |Video Subsystem          |
>>   |       +-------------+  |                |       +------------+    |
>>   |       | Video TPDM  |  |                |       | Video TPDM |    |
>>   |       +-------------+  |                |       +------------+    |
>>   |            |           |                |              |          |
>>   |            v           |                |              v          |
>>   |   +---------------+    |                |        +-----------+    |
>>   |   | Video funnel  |    |                |        |Video TNOC |    |
>>   |   +---------------+    |                |        +-----------+    |
>>   +------------|-----------+                +------------|------------+
>>                |                                         |
>>                v-----+                                   |
>> +--------------------|---------+                         |
>> |  Multimedia        v         |                         |
>> |  Subsystem   +--------+      |                         |
>> |              |  TPDA  |      |                         v
>> |              +----|---+      |              +---------------------+
>> |                   |          |              |   Aggregator  TNOC  |
>> |                   |          |              +----------|----------+
>> |                   +--        |                         |
>> |                     |        |                         |
>> |                     |        |                         |
>> |              +------v-----+  |                         |
>> |              |  Funnel    |  |                         |
>> |              +------------+  |                         |
>> +----------------|-------------+                         |
>>                  |                                       |
>>                  v                                       v
>>       +--------------------+                    +------------------+
>>       |   Coresight Sink   |                    |  Coresight Sink  |
>>       +--------------------+                    +------------------+
>>
>>        Current Configuration                            TNOC
>>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> 
> I observed a merging conflict. I would suggest you sticking to the
> coresight next branch for CoreSight related upstreaming. Please
> rebase this patch on it.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
> branch: next
> 
> I also verified this patch with static checker smatch. With rebasing:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Done in next patch.


