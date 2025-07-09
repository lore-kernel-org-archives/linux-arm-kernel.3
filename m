Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780C1C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COZ2Sh8sxgfBJ7zX3NCff/RrAJHNSAnAxPWUBtHFUog=; b=eHqOfMSLv9LwmiUcLjfi7vlDLS
	OLpE5eHgSBgo6Gs8iOee4t7ufbZcA+2AWcka+IJ/o+uIZUQJ+il6u0H3zS54WkycZsAMoAL1pTCqD
	VQLMG7JAnTxYZBb2M3yLJbg4dWftzXk2O4KNxO6b5pbBSIV/+3yyHxrk1Z2HWq3G67IxF0M5YU3Js
	247h1wuM2J8dJ6SUcNAp+xf3X2kpACQ8JBgYFeJAlIhXOKX73HcLY9DroYGrKtpHuZHtl/3OBOyle
	G2j8cq5gHNDoUzxzSLGI2D477G14xvG4FDzfV59zi+60RSIOT+O6oxtd58SGNpJ3EZLZQvQ1Gg8uS
	BdF4t4jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRqz-00000008HTg-3U47;
	Wed, 09 Jul 2025 10:16:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQ7X-00000007xl4-2arl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 08:25:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697mBnU024365;
	Wed, 9 Jul 2025 08:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COZ2Sh8sxgfBJ7zX3NCff/RrAJHNSAnAxPWUBtHFUog=; b=nyCbAk926zsau2SP
	mJvfxBRtOB72Ar4axeO5P4YE24XUL8E5DeVRR5Z3gx0RUjY0wEU01dOCacmVZf3c
	6bYfLdX3iHQ4Epq8O9wZpvdQhP3hvVZp3EpiioBzPkyTb0wMyQInHfR0KZ6WcChp
	JEkbSC60UjpysnQRGl4Y5RibKiAMY5oPOyDPjCzTUkHoxowyTup4J5FJW1p9sdX5
	z5UZXzOJ3vDT4292P7xL4zMMLNKafsGto0WZhtQiog7E6tqtVXPDyDVbX4ib9vSR
	sw70Bar9vbKvUfmKUgOQtCDY4m9BZoEjX/OEOQQcYUh/k/cz8tMtmFtSMovd2DKz
	0llc0w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbnr3pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 08:25:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5698PUG1032555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 08:25:30 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 9 Jul
 2025 01:25:26 -0700
Message-ID: <c6cfc51b-ca0e-4eac-8462-00dcbc136afd@quicinc.com>
Date: Wed, 9 Jul 2025 16:25:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/2] coresight: Add Coresight Trace Network On Chip
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
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>,
        Leo Yan <leo.yan@arm.com>
References: <20250611-trace-noc-v10-0-a83b5c63da34@quicinc.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250611-trace-noc-v10-0-a83b5c63da34@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA3NSBTYWx0ZWRfXyx+D+kMo8223
 4eoDswe4moMyOwyx0wburBNMbnB1aTQXTun3ltK1ZZpNOjZcHFCFKcottbVMxagf7nW0gVB4ihr
 xG5b43lgtn39gHuDXJh1pNOllBlcL9RATeFQs0nmtj3cRp9HTx8YNNlwJFhBaNLKEJOM1UfMd7e
 LqzfGvHGx/t0adL1n+gGwezi9FoyF/xuJu0P54q8GIBvyf4B+RD7kXQVaQwiFTmPMnK5JN92xme
 Z6FFbTEblJZfxrJCst3YSN8omXZvV5mlTjhhT1ZQiRoURIDkwfxrh55/LGLkEkHdpGCsUPb9Nwd
 ROkoTM4X0Wn88oQrBDTDSQc1C8EjR0+nBbfLjAAaB3KnsOT3J7b7G7X96uO43DHjnuFL/h7cj9O
 oGSIRB2kSA2Hg3A6UFZI8kyMnfsyM9pCYWYj9vQN9yPJhlQQlsUM+qhTzkgWgu1AwgnQynVv
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=686e277b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=6ZaSXbcDHRiDiM3bpcAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fn5V7WnPvgFSAqDRf_6MBVoPXphwGdGX
X-Proofpoint-GUID: fn5V7WnPvgFSAqDRf_6MBVoPXphwGdGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_012539_682663_71324A0B 
X-CRM114-Status: GOOD (  23.92  )
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

On 6/11/2025 6:42 PM, Yuanfang Zhang wrote:
> The Trace Network On Chip (TNOC) is an integration hierarchy which is a
> hardware component that integrates the functionalities of TPDA and
> funnels. It collects trace from subsystems and transfers it to coresight
> sink.
> 
> In addition to the generic TNOC mentioned above, there is also a special type
> of TNOC called Interconnect TNOC. Unlike the generic TNOC, the Interconnect
> TNOC doesn't need ATID. Its primary function is to connect the source of
> subsystems to the Aggregator TNOC. Its driver is different from this patch and
> will describe it and upstream its driver separately.
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
> Changes in v10:
> - Rebase to coresight/next branch.
> - Link to v9: https://lore.kernel.org/r/20250611-trace-noc-v9-0-4322d4cf8f4b@quicinc.com
> 
> Changes in v9:
> - Mention the binding is only for Aggregator TNOC.
> - Link to v8: https://lore.kernel.org/r/20250606-trace-noc-v8-0-833f94712c57@quicinc.com
> 
> Changes in v8:
> - Add sysfs node to expose atid.
> - Link to v7: https://lore.kernel.org/r/20250523-trace-noc-v7-0-d65edbab2997@quicinc.com
> 
> Changes in v7:
> - Move the content in header file into coresight-tnoc.c.
> - Use scoped_guard() to replace spin_lock().
> - Invoke coresight_trace_id_put_system_id() for registration failure.
> - Link to v6: https://lore.kernel.org/r/20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com
> 
> Changes in v6:
> - Add a newline after return statements.
> - Use 'x &= foo' to replace 'x = x & foo'.
> - Use 'x |= foo' to replace 'x = x | foo'.
> - Link to v5: https://lore.kernel.org/r/20250512-trace-noc-v5-0-f2ef070baee5@quicinc.com
> 
> Changes in v5:
> - update cover-letter to describe the Interconnect TNOC.
> - Link to v4: https://lore.kernel.org/r/20250415-trace-noc-v4-0-979938fedfd8@quicinc.com
> 
> Changes in v4:
> - Fix dt_binding warning.
> - update mask of trace_noc amba_id.
> - Modify driver comments.
> - rename TRACE_NOC_SYN_VAL to TRACE_NOC_SYNC_INTERVAL.
> - Link to v3: https://lore.kernel.org/r/20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com
> 
> Changes in v3:
> - Remove unnecessary sysfs nodes.
> - update commit messages.
> - Use 'writel' instead of 'write_relaxed' when writing to the register for the last time.
> - Add trace_id ops.
> - Link to v2: https://lore.kernel.org/r/20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com
> 
> Changes in v2:
> - Modified the format of DT binging file.
> - Fix compile warnings.
> - Link to v1: https://lore.kernel.org/r/46643089-b88d-49dc-be05-7bf0bb21f847@quicinc.com
> 
> ---
> Yuanfang Zhang (2):
>       dt-bindings: arm: Add device Trace Network On Chip definition
>       coresight: add coresight Trace Network On Chip driver
> 
>  .../bindings/arm/qcom,coresight-tnoc.yaml          | 113 ++++++++++
>  drivers/hwtracing/coresight/Kconfig                |  12 +
>  drivers/hwtracing/coresight/Makefile               |   1 +
>  drivers/hwtracing/coresight/coresight-tnoc.c       | 242 +++++++++++++++++++++
>  4 files changed, 368 insertions(+)
> ---
> base-commit: 408c97c4a5e0b634dcd15bf8b8808b382e888164
> change-id: 20250403-trace-noc-f8286b30408e
> 
> Best regards,

Hi Suzuki, Mike,

I wanted to check in on the status of this patch series ([v10 0/2]). I’d like to confirm whether
it is planned to be picked for this cycle, or if there’s anything further I should address.

thanks,
Yuanfang.

