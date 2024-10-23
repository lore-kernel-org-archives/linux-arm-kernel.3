Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E95D2E01E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 07:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9Na+WxXU1SflIhWIkTHTxtN0sG/Tao5iQA9/MjVKlQ=; b=yNvE18cOrmf3p2TkH/sc0RsjoI
	4HJlCR4iFnVz0MZMfTFFpB5WTDtXz0ubEeDdtdNk0A3GQFGG502Gu1MzAyxGGQG/UxoVEIN1rMG2r
	xrBdfzN5yq35m+rT5uUpZOoJGTDwbAVch869fGNWUynqjAEuXLSa9bLGHGzMYpPniChD+6NTsp3zH
	gl2unKWYDxUVUimVDAgvQqxeDZvHh6vG+UqTtvjOb4F//UT0fNNjHOK5B1hn2XglLlX/haShjVUHr
	aEBxktGKEAJvKI4dNSc9L/vpqUhjCfI2U1f/0p9bT1GLaTYsvO6b++Ab5sMQOuVtGqKgmKiB/jYUi
	78sCw3/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WCb-0000000DTFW-1vQK;
	Wed, 23 Oct 2024 07:54:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WAj-0000000DSlG-1b5B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 07:52:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLaHYJ024689;
	Wed, 23 Oct 2024 07:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9Na+WxXU1SflIhWIkTHTxtN0sG/Tao5iQA9/MjVKlQ=; b=m/gvKWua9oRq+qKT
	5kWt6do7Soh5j8mB3SlmKZJgoWaaoJRFHOQfoUSo4U1oK5MWbV37u98/+CddjU2S
	DMjh/49lUa5Pmh20XMfNN6LvGz8vqn5MZ+bM/zHD+RdmwF7Sg0kWAcGIKnPJN3hT
	bjgRmcEwlzx9ukFQ8JL8QNweJkIO4qoWKcOeR08uBZVmgRjo7HWbRzOdSCSkALBk
	ohbM96g6sQREjRh7y7NdafCky6e8+b0Jdj8lBDtOtDqwHGfKVITShLPYMKahaOP6
	nVpYKCwt9EiTc+fDa0d5xrsDFMIJT993GWnUQ/ox9cRBZzKEA6KvHcHhGacwni1S
	nzRbDw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3uhb6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 07:52:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N7qcn0030906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 07:52:38 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 00:52:35 -0700
Message-ID: <ac95359a-9717-46e2-b3b3-3b040de83a1e@quicinc.com>
Date: Wed, 23 Oct 2024 15:52:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND 0/3] Add support to configure TPDM MCMB subunit
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20241011064732.8480-1-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <20241011064732.8480-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oKWwp7d4CRdJaQsoB91mFpczPbKtPoZr
X-Proofpoint-ORIG-GUID: oKWwp7d4CRdJaQsoB91mFpczPbKtPoZr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1011 mlxscore=0 mlxlogscore=766
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_005249_467294_998B97A3 
X-CRM114-Status: GOOD (  15.94  )
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



On 2024/10/11 14:47, Mao Jinlong wrote:
> Introduction of TPDM MCMB(Multi-lane Continuous Multi Bit) subunit
> MCMB (Multi-lane CMB) is a special form of CMB dataset type. MCMB
> subunit has the same number and usage of registers as CMB subunit.
> Just like the CMB subunit, the MCMB subunit must be configured prior
> to enablement. This series adds support for TPDM to configure the
> MCMB subunit.
> 
> Once this series patches are applied properly, the new tpdm nodes for
> should be observed at the tpdm path /sys/bus/coresight/devices/tpdm*
> which supports MCMB subunit. All sysfs files of CMB subunit TPDM are
> included in MCMB subunit TPDM. On this basis, MCMB subunit TPDM will
> have new sysfs files to select and enable the lane.
> 
> Mao Jinlong (1):
>    coresight-tpdm: Add MCMB dataset support
> 
> Tao Zhang (2):
>    coresight-tpdm: Add support to select lane
>    coresight-tpdm: Add support to enable the lane for MCMB TPDM
> 
>   .../testing/sysfs-bus-coresight-devices-tpdm  |  15 +++
>   drivers/hwtracing/coresight/coresight-tpda.c  |   5 +-
>   drivers/hwtracing/coresight/coresight-tpdm.c  | 121 +++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-tpdm.h  |  32 ++++-
>   4 files changed, 164 insertions(+), 9 deletions(-)

Just a friendly reminder to review this series. This is the final piece 
of the main function for TPDM, which was initially sent in June.

> 


