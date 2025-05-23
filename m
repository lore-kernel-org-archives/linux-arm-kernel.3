Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88685C54F47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 08:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUeiwjwwRKCeSzEn89kVpyg8NofPZDIR7gL3zffWsso=; b=U7GaFgGebRaaRs7Zk+UJ1qblb4
	UHgd4K6ldhMT4yMhN+tw6X6dz+DZCVP6ldN5r22iStDKCfB60yA6TixDQ6/rJMgiVDFdmL8cdA/uB
	czooT0KDxw19yg94b/n7gBrJep8e+6aiDY/D9LX1c22XkZeMRYTp+xm3vBomSb45DOV/yAzmEn2Su
	Otx97VjSev967g/B2C6lzeuPnzyDUG0svBJcxoPWT2xov5nfh5953Tq/Ka6OFS1kC2+QtyKuJABW1
	FfjhSo4hjKbtyUYNcyrisEByPAlxD8qRzgPwtuQ6MJbXKGLTL/+XoUqY1hCItzGgVdPoaUFpzKJsH
	qESprtOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIO1V-00000003Kbs-09KK;
	Fri, 23 May 2025 08:45:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINSr-00000003GiI-1hDV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 08:09:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N6Aqlf013895;
	Fri, 23 May 2025 08:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUeiwjwwRKCeSzEn89kVpyg8NofPZDIR7gL3zffWsso=; b=BcECy/0OUo93fw4F
	gZhiI2GyStvzLgqVX6vJU+kVdqtdXt/O9Ne0e0WVl2BqI/IXJHGu1lZtNm/qFRu9
	zTmeamQ14LNlDclW4zl74Q7v4JeSlyib+8CHcq3iacrG2bS6YqwY/RPCTb6vmSHS
	pGA/92wLfRA/BndpU8wWdaHR8D/rAWfiAscigzUT7Zyiid4jvQH9IH/qZMiEVRj/
	5vmFjdC8cGAE62DdYUSQ3jRx+xE+k9PfmVikNCjNH1OrvYwSy6k4AD5qrbrpCiQL
	uGONtVcIPnz1P3aAeIiKqndj0NuD3IOHd3LsrElCrn2GbEsVPXJQc/Tnt81h35mO
	8fjRaA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9h4n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 08:09:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54N8931s004706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 08:09:03 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 23 May
 2025 01:09:00 -0700
Message-ID: <40599afc-4342-467c-87d8-3f53cbcfd242@quicinc.com>
Date: Fri, 23 May 2025 16:08:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
 <3a19197d-b534-458c-b4d7-51fd9d2c954d@arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <3a19197d-b534-458c-b4d7-51fd9d2c954d@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kPgexwW-XHzVu8r4PKlL9oDSSyKwYz7X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA3NCBTYWx0ZWRfX+Mzwh0Kss6rN
 vTf6MSyeGKL6udwQwDHZ0OP9MsaLda+CdExaw3RvabpAx2+DSIhP85YNemtGv2+ZGXV5z0ZrNBi
 hkwNjw9I+dZ2GOAtY5wV40YY6Efo0HORhh06trM/7nE/uq0cPMZWfTG05QpJK8Y9wY+AvoWVDds
 UQiSIk1dxNlulVUgg4qMQDfaDdNG0KI8z6UsS/y3budj9gTGZMKFvHyMTn4AL3Cw/TOMMmGbGOB
 3XpoLslcNvwY1jnIQoPacFnDtBFSxuxZmActJOeM2sqiLVX3UyJvuxxP4WAcuhXvKcv0FipYYxI
 SwEU9tRl6k72cX18LKhsNgckmQLncJp/Bt6YPuEbYKP2AMMlJhnfWwRwz4OISUfN65GhPkYPxGt
 P3Gc0EmZ40UydgCGS914mx+rbuBTM+c5S4u2roWNer1r8vOnbcT+Bkr2z+HgXv2SbJjzvCzJ
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=68302d20 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=tqpicOYo2bCRqsTAqWEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kPgexwW-XHzVu8r4PKlL9oDSSyKwYz7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_010913_572920_62C2DF77 
X-CRM114-Status: GOOD (  15.77  )
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



On 5/22/2025 9:13 PM, Suzuki K Poulose wrote:
> On 22/05/2025 09:07, Yuanfang Zhang wrote:
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
>>    +------------------------+                +-------------------------+
>>    | Video Subsystem        |                |Video Subsystem          |
>>    |       +-------------+  |                |       +------------+    |
>>    |       | Video TPDM  |  |                |       | Video TPDM |    |
>>    |       +-------------+  |                |       +------------+    |
>>    |            |           |                |              |          |
>>    |            v           |                |              v          |
>>    |   +---------------+    |                |        +-----------+    |
>>    |   | Video funnel  |    |                |        |Video TNOC |    |
>>    |   +---------------+    |                |        +-----------+    |
>>    +------------|-----------+                +------------|------------+
>>                 |                                         |
>>                 v-----+                                   |
>> +--------------------|---------+                         |
>> |  Multimedia        v         |                         |
>> |  Subsystem   +--------+      |                         |
>> |              |  TPDA  |      |                         v
>> |              +----|---+      |              +---------------------+
>> |                   |          |              |   Aggregator  TNOC  |
>> |                   |          |              +----------|----------+
>> |                   +--        |                         |
>> |                     |        |                         |
>> |                     |        |                         |
>> |              +------v-----+  |                         |
>> |              |  Funnel    |  |                         |
>> |              +------------+  |                         |
>> +----------------|-------------+                         |
>>                   |                                       |
>>                   v                                       v
>>        +--------------------+                    +------------------+
>>        |   Coresight Sink   |                    |  Coresight Sink  |
>>        +--------------------+                    +------------------+
>>
>>         Current Configuration                            TNOC
>>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> 
> 
>> +
>> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>> +{
>> +    int atid;
>> +
>> +    atid = coresight_trace_id_get_system_id();
>> +    if (atid < 0)
>> +        return atid;
>> +
>> +    drvdata->atid = atid;
> 
> Do you need to expose this via sysfs ? Otherwise, how can you map
> a trace to a TNOC at decoding ?

yes, need to expose the atid via sysfs, but it better to expose it on source driver which connect with
this TNOC. so dont expose it on this driver.

> 
> Suzuki


