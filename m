Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045C6E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTo/P7f/upBFio9J5H+90ORp8e2JdLD5o/PbOI6evEI=; b=Sjh8qCTyPipdXUnKCMHKbJiVzG
	tjDWxxqWydtd60W+iw3E9wX9ptyvEBKfYBtUa3Cs+f5VV+GgzFwrjFKrNfcnpEpu9u2aWSfc7+jcz
	OAN0qEP0p6oRRmEcdlaIcZaqdZgW4cg3UsEd4dfbEjAsH6A8fWZTDZw/TOPrBBwpXEN08bGiZHH9r
	cGGD2STU0GbO84R3XHe4O2ZxrrM6NhsWaOSTGvgYg4iyuDqjHpZzUxr4MclxsI/rpJhPETo4gXOLG
	ewzbhr6kWySYstRyzVpdK36QMkvhiRkBIPoE73DyTtCo9dzYqtmr64b7NnEHZ40A9TV/i0BSQTFzV
	7bhtguKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSJe-0000000CcfW-0WeX;
	Tue, 17 Dec 2024 07:48:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSIY-0000000CcVW-05YM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 07:47:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH61s9n005066;
	Tue, 17 Dec 2024 07:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YTo/P7f/upBFio9J5H+90ORp8e2JdLD5o/PbOI6evEI=; b=KeCt8YlFhB2x1rGb
	27DZOyy2UAFu1DvLwhs4rWGKCrr1BPmofn9DSZIu527upggXVFmpfjJH+sX5TwOv
	XM6J4MKYa//ayP8dOzPGLce85L8jl5sxh2R9u7WeyK5Th13rFON3xFYyptdsljfr
	RyxNtm4e33tf7GwfdIUM8lg16q6PXFScfmCmKLEYH4M3hOTINA2ABL93S3D6Ni2m
	cijymIv5Z3YIyO8EtWeBevaySc0Q9LErcAA95fMPcJy4NZ27z2q1KlosEifvrk/D
	nqRuWGhbZkKisiarhSaoKnC5L1MBmi1F7yFi6rURpDN9c2xLPdS8d9fs1f44Dv/1
	ZEQUlg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k3p488ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:47:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH7lAO7003168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:47:10 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 23:47:08 -0800
Message-ID: <65de323b-ee7f-41cf-a300-1cf883494d1d@quicinc.com>
Date: Tue, 17 Dec 2024 15:47:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add support to configure TPDM MCMB subunit
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xojj7zGYs_Wm-DhaeECuX7FKFb8Asblb
X-Proofpoint-GUID: Xojj7zGYs_Wm-DhaeECuX7FKFb8Asblb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=920 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_234718_202317_050E4B24 
X-CRM114-Status: GOOD (  16.97  )
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



On 2024/11/5 20:39, Mao Jinlong wrote:
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
> Changes in V2:
> 1. Use tdpm_data->cmb instead of (tpdm_has_cmb_dataset(tpdm_data) ||
> tpdm_has_mcmb_dataset(tpdm_data)) for cmb dataset support.
> 2. Embed mcmb_dataset struct into cmb struct.
> 3. Update the date and version in sysfs-bus-coresight-devices-tpdm
> 
> Mao Jinlong (1):
>    coresight-tpdm: Add MCMB dataset support
> 
> Tao Zhang (2):
>    coresight-tpdm: Add support to select lane
>    coresight-tpdm: Add support to enable the lane for MCMB TPDM
> 
>   .../testing/sysfs-bus-coresight-devices-tpdm  |  15 +++
>   drivers/hwtracing/coresight/coresight-tpda.c  |   7 +-
>   drivers/hwtracing/coresight/coresight-tpdm.c  | 124 +++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-tpdm.h  |  33 +++--
>   4 files changed, 158 insertions(+), 21 deletions(-)

Gentle reminder for the review.
> 


