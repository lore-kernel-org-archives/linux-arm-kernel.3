Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC33C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 08:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slYJXYayr0rGomugWFVTr2Z5S5ZLiUsJOkvUf/lIMGg=; b=V/y2dbMrkLu089AmhIZX1F00eE
	WGhEv70wLNFcpEcfCcowBGzGe4A1CqquevcEI+xX0vb3ERnuJ3CRxkySYAi3TqJwZ78dJph3bYn7f
	B/4neyH0zF8DuJTozMuPrwsq7yQW44i7heGZcgSgY9Jn57qYDcFyi4ya/PGO2RPBF9y2K26pbKPpB
	iEWv4PBk69MH81S3ZDS7dkC6xyERqrxlJHi63xOMICPbXWN0L1hsx1tfcQEOKclhVh5+m6nA+88Eh
	sf26Wb0Rdfent+mD/sVTvERSLMCOv02fU0n0ZKAovNmGTc8KJc1bSoS+zn3KDibMp74ed2NpR/ye/
	+oxRM2GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFKt-0000000Afrb-3egN;
	Thu, 03 Jul 2025 08:30:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFEh-0000000AeyN-0rqc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 08:24:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5637hxuL032118;
	Thu, 3 Jul 2025 08:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	slYJXYayr0rGomugWFVTr2Z5S5ZLiUsJOkvUf/lIMGg=; b=CV5EY8kWH6JdlOeJ
	2KUiROTId11i4Jqq8tDWx659VEzg/OvF7JqDwk7X85Nf0lrht7GI05Yw1YgVfXHq
	A7NHZk8a9/gqJnMpN3l1Ur3W7ZRkLqAGZ2EmRbd4ZnSJ1DZWvX2EjK0/E0YqfkwU
	nWp+UTGb7hmDFdevrhzq9KQLa39AcbkyyFLMgvqJsL+caxQT8/dwWmYthNp7eALs
	bJ6EwuZ5V8LPQIhEWK+HxhmpTXISTkgxh3kQRSM7WGmsLTLhh7YP3JfVhpbVcp7Q
	Wfs0kKYfNufSYl39GA+dFcLwSb+r6jgOHzNI+jP4Tn2j4am+sRQYVGqcFnEGM1oE
	S5PxGQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kfwhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 08:23:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5638Nt2L030475
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 08:23:55 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 3 Jul
 2025 01:23:52 -0700
Message-ID: <b221cc88-f269-4920-8843-31ab92fcf92b@quicinc.com>
Date: Thu, 3 Jul 2025 16:23:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight-tmc: Add configurable timeout for flush and
 tmcready
To: Leo Yan <leo.yan@arm.com>
CC: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, <kernel@oss.qualcomm.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20250627-flush_timeout-v1-1-2f46a8e9f842@quicinc.com>
 <78f2179d-26c2-47f0-bc19-b72e5e51ad29@linaro.org>
 <20250627141745.GS794930@e132581.arm.com>
 <5f2527d2-be55-411b-a79b-f628e9fe7f06@quicinc.com>
 <20250630110836.GT794930@e132581.arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250630110836.GT794930@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68663e1b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=i40Tm4eTu_XNabV6h-wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA2NyBTYWx0ZWRfXzHOfQABRBosI
 njHoKiB8+gUL5L+ZuhcYrRolEUsVAEt6viB4FIdXHlX1uciYKg8sbocsqgrHjJkCQLKo+gEAAuP
 5jhr9GzcRAbh2ysi9RiQDQtFecRzfajKP+EOcDLKirVRTky5RXD2o4U/WAp+PTTU8CvFVHI9Bry
 ZYatm3xxvQkwV5KVtbD4Cr5RR4y5bgI0KGi9PPklQpcygkxC+Y3ikZ+4VxFnvrfyO8RKZab+K9H
 T5JhfxThz9uQcBgsSgdstQjYlB/yUjjVQUT9QRpVKqZs26WVpItH0PsPAYSx3Ma1W9O7I1FARuN
 8QnZiwOoNZ9MvVbe+rFsjUPJkcpUYeJSjJvUQjeAlXyXLNZm+l84hlykD1ebiSLOyPCu0R7bq/j
 0FGmJRmvh1B5C2aKHb5yAh6MqzQBGkBJhXByVEkT5Of+dQON9F9aTRWkc/mjWCLiz9O7ILgn
X-Proofpoint-ORIG-GUID: msw_2bq5bJAalCVedPQw6mpmxXWsJjli
X-Proofpoint-GUID: msw_2bq5bJAalCVedPQw6mpmxXWsJjli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=901 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_012403_267738_74532F61 
X-CRM114-Status: GOOD (  16.31  )
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



On 6/30/2025 7:08 PM, Leo Yan wrote:
> On Mon, Jun 30, 2025 at 06:40:53PM +0800, Yuanfang Zhang wrote:
> 
> [...]
> 
>>>>> The current implementation uses a fixed timeout via
>>>>> coresight_timeout(), which may be insufficient when multiple
>>>>> sources are enabled or under heavy load, leading to TMC
>>>>> readiness or flush completion timeout.
>>>
>>> I would suggest that we first make clear if this is a hardware quirk or
>>> a common issue in Arm CoreSight.
> 
>> sure, now this issue has been found that not only CPU ETM, but also subsystem ETM.
> 
> As the commit log states, "sources are enabled or under heavy load,
> leading to TMC readiness or flush completion timeout." I would like to
> confirm how this situation can happen.
> 
Enable all etms, then cat TMC without disable source.
> When disabling a CoreSight path, the driver follows a sequential
> order: the source device is disabled first, followed by flushing and
> disabling the TMC. We expect that there should be no contention
> between source devices and the sink when disabling the path. For a
> subsystem ETM, I expect we should also follow this sequence.
> 
> Leo
this issue is a different case: running cat tmc directly did not disable source.



