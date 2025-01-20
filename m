Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF96C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 11:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PNNl+Yf4kXRCZiUvWLBcmVi34q6bvc8a/VLVrBeW10=; b=lgqkf5o/1+zfFJzYSag3JF35eL
	rLLZGeS2y47wVsrPpsu4oMyJbcr1obBm8gPB/FHZi5/rJaQfCpNtjsBVfwH3LJ+VnuNYyUqH16N4j
	QBj7MrF3fT0D3UPx/tYjmMkI4WCG2/Aioa/HMsy9coYRR54PyuNROFj6z/n8tuJZNGWfwQ4tfKDuO
	DyyeRHogayk1dqcz3uFa5yxTPdDDY85XOg8E/gr2goU0J1OQ7a7wUzVG+DKePY8jUYXYHLtTHuoFw
	NAovBHNtoGznmvEYxRK6i+GGr/UAO7NoU3gkVp/h1s11jvpiGBwqraj0DIiSVXHAyyVtC43QBOFWS
	5rMmSImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZqRV-00000005UOO-3OU3;
	Mon, 20 Jan 2025 11:59:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZqQE-00000005UCC-2DDW;
	Mon, 20 Jan 2025 11:58:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KAAfT5020728;
	Mon, 20 Jan 2025 11:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4PNNl+Yf4kXRCZiUvWLBcmVi34q6bvc8a/VLVrBeW10=; b=eCmyoic2nVv8Imhh
	oRqklrUzGpMm3iCa9hBfXNgzBUOI99H/rU0wYPpJfGyliMyiNJP+oopmLqbt1aHm
	LWGeKDA1R7bdBYJa2ymAcct9lIKFDbKy721gUZ1pDjYI0mr7prZydkAC8uYFc8HX
	/9L1sWUWVK+uL5tmF1FH/XeQQX1LRVFqV3Z9+8kNbnh4LmHGwuUFqXJlkoQwe9cm
	atZHqN+ae5XXcIoLemK4cp4fJeQ6hSTfcCVipDJbyLkTt8+/bqaK4Dbz4I/NB5+H
	4TKO3K0n6bmYdP/dkqOGGL3Op23KpXNhIGNITk8URFSAyo70iHbX0mRE3uXb3SsR
	fmtC8g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449mgpg7yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 11:58:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50KBw8J9004599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 11:58:08 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 03:58:04 -0800
Message-ID: <1b66aeda-b04f-4502-9e41-e3eeacdb74ed@quicinc.com>
Date: Mon, 20 Jan 2025 19:58:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Support Multi-frequency scale for UFS
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <quic_cang@quicinc.com>, <bvanassche@acm.org>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <linux-scsi@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "open
 list:ARM/Mediatek SoC support:Keyword:mediatek"
	<linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>,
        "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
	<linux-mediatek@lists.infradead.org>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250119075736.cyjgpglf4azrmprv@thinkpad>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <20250119075736.cyjgpglf4azrmprv@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: suU-JLrEa2xj2GcdxBeo2r_gDYx-l7NW
X-Proofpoint-GUID: suU-JLrEa2xj2GcdxBeo2r_gDYx-l7NW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 priorityscore=1501 mlxlogscore=980
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_035826_584208_1B5D2C03 
X-CRM114-Status: GOOD (  16.72  )
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

Hi Mani,

Thanks for you review~

On 1/19/2025 3:57 PM, Manivannan Sadhasivam wrote:
> On Thu, Jan 16, 2025 at 05:11:41PM +0800, Ziqi Chen wrote:
> 
> You missed CCing linux-arm-msm mailing list to the cover letter.
>
Thank you for reminder, I will cc this group in next patch version.

>> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
>> plans. However, the gear speed is only toggled between min and max during
>> clock scaling. Enable multi-level gear scaling by mapping clock frequencies
>> to gear speeds, so that when devfreq scales clock frequencies we can put
>> the UFS link at the appropraite gear speeds accordingly.
>>
> 
> But the UFSHC PHY settings are not updated for each gear speed, isn't it? Then
> I'm wondering how much we get out of this 'multi-level gear scaling'.

Per design, we don't need to update any PHY setting for each gear speed 
mode.

> 
> - Mani
> 

-Ziqi

>> This series has been tested on below platforms -
>> SM8650 + UFS3.1
>> SM8750 + UFS4.0
>>
>>
>> Can Guo (6):
>>    scsi: ufs: core: Pass target_freq to clk_scale_notify() vops
>>    scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
>>    scsi: ufs: core: Add a vops to map clock frequency to gear speed
>>    scsi: ufs: qcom: Implement the freq_to_gear_speed() vops
>>    scsi: ufs: core: Enable multi-level gear scaling
>>    scsi: ufs: core: Toggle Write Booster during clock scaling base on
>>      gear speed
>>
>> Ziqi Chen (2):
>>    scsi: ufs: core: Check if scaling up is required when disable clkscale
>>    ARM: dts: msm: Use Operation Points V2 for UFS on SM8650
>>
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 51 ++++++++++++++++----
>>   drivers/ufs/core/ufshcd-priv.h       | 17 +++++--
>>   drivers/ufs/core/ufshcd.c            | 71 +++++++++++++++++++++-------
>>   drivers/ufs/host/ufs-mediatek.c      |  1 +
>>   drivers/ufs/host/ufs-qcom.c          | 60 ++++++++++++++++++-----
>>   include/ufs/ufshcd.h                 |  8 +++-
>>   6 files changed, 166 insertions(+), 42 deletions(-)
>>
>> -- 
>> 2.34.1
>>
> 

