Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B43BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 09:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFXTBiRNyQQWNgSwzsvENgCimi3y6Xr1Z4FM79/PNPM=; b=YgzcQMkHvfnMNo9Yx7EL+UbJOS
	2G/PO1QG6gLWkqhD7JI5ErrEeeFlTnRZv3kIkHjjtjVB2X/uvuLS4MnuBnYgws/uYl1f2cCC1vUXF
	t7R7y1YYifR5WJHnA9J6YBPDk00WbD3O1ZZDthFb5mX4vrYAI5dSZ3r9U12znAV+0fwHHpB88ClZR
	qqcPUmUs3TGWUUN9Bu9erRgMbmI8RyfWHRplqEWnNq8qIiYzQmVQgYy8BLUOUlv7bkqex2hG74IAp
	QOHpmza55E+s5Yb3jcGy88wvj6/28NdX9EPG6QKQ+ELDKRhmw5A+cDIEvvcf17QKff5VR6GS7+Bdb
	+LUEVqDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdhg-000000080r8-19dC;
	Tue, 14 Jan 2025 09:59:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdfM-000000080Xx-2pv4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 09:56:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E25Vas020853;
	Tue, 14 Jan 2025 09:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rFXTBiRNyQQWNgSwzsvENgCimi3y6Xr1Z4FM79/PNPM=; b=LOQNs46zuHyJV5tA
	7vLZM6lWRa4pEXel9bfbl6hUS6kYIYsMiNWQcvTMZPyGEO6UFw0+GsCn7CFGfDge
	1ZsV/2PwfOVtvUKSFBCApl8FeGahmYECtZ0crZw4/k14rhN/5/1jn68kgZlk13q0
	76TcOu5fUStgT9qcu/x43JaxiqHSrtQRAqrhUbp+eVVM59X/UJXGtde+ERVhWoR6
	ZZLWTIIPC0Y3K96fYh+N8eOQo7WQwBc9QEiy8tZB3fLxDeHw81tWjqQzL8i5y/Ha
	lnGPFvpwtWS4VmQxX3tm2aSRb4sin4FSwvv/U3chYTab6uqzZpCqGeYagv5/5Ed3
	G/BLyw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445eu48wm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 09:56:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E9unnv005255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 09:56:49 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 01:56:47 -0800
Message-ID: <55cf5c56-3841-4b1d-9d8b-7b88b8bcff96@quicinc.com>
Date: Tue, 14 Jan 2025 17:56:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight-etm4x: add isb() before reading the TRCSTATR
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>,
        <james.clark@linaro.org>, <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20241206080240.59313-1-quic_yuanfang@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241206080240.59313-1-quic_yuanfang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -f65y2qI1Xll0TlwDZUVNO7CN98LFVpg
X-Proofpoint-ORIG-GUID: -f65y2qI1Xll0TlwDZUVNO7CN98LFVpg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 mlxlogscore=914 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_015656_733348_D44723F3 
X-CRM114-Status: GOOD (  21.94  )
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



On 12/6/2024 4:02 PM, yuanfang zhang wrote:
> From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> 
> As recommended by section 4.3.7 ("Synchronization when using system
> instructions to progrom the trace unit") of ARM IHI 0064H.b, the
> self-hosted trace analyzer must perform a Context synchronization
> event between writing to the TRCPRGCTLR and reading the TRCSTATR.
> 
> Fixes: ebddaad09e10 ("coresight: etm4x: Add missing single-shot control API to sysfs")
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
> Changes in V3:
> 1. Remove dsb(sy) after polling TRCSTATR.
> 2. Add isb() after polling TRCSTATR.
> ---
>  .../hwtracing/coresight/coresight-etm4x-core.c   | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 66d44a404ad0..c6ea00bba0cc 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -531,7 +531,6 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>  	 * As recommended by section 4.3.7 ("Synchronization when using the
>  	 * memory-mapped interface") of ARM IHI 0064D
>  	 */
> -	dsb(sy);
>  	isb();
>  
>  done:
> @@ -906,10 +905,25 @@ static void etm4_disable_hw(void *info)
>  	tsb_csync();
>  	etm4x_relaxed_write32(csa, control, TRCPRGCTLR);
>  
> +	/*
> +	 * As recommended by section 4.3.7 ("Synchronization when using system
> +	 * instructions to progrom the trace unit") of ARM IHI 0064H.b, the
> +	 * self-hosted trace analyzer must perform a Context synchronization
> +	 * event between writing to the TRCPRGCTLR and reading the TRCSTATR.
> +	 */
> +	if (!csa->io_mem)
> +		isb();
> +
>  	/* wait for TRCSTATR.PMSTABLE to go to '1' */
>  	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_PMSTABLE_BIT, 1))
>  		dev_err(etm_dev,
>  			"timeout while waiting for PM stable Trace Status\n");
> +	/*
> +	 * As recommended by section 4.3.7 (Synchronization of register updates)
> +	 * of ARM IHI 0064H.b.
> +	 */
> +	isb();
> +
>  	/* read the status of the single shot comparators */
>  	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
>  		config->ss_status[i] =

gently reminder

