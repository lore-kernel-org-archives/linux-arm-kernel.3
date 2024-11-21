Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505BED75BDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 09:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJzek0bdbC3Ntd/IGsSF3/5x+fHEg6vM7YVqfg+K9ec=; b=CIFSk9exOJkdCsMR71B5mq5Gcl
	0JrsanxxE35lsunxIrYQkwnFBHoFIv1kSoP0PVZSjrc8yDuzSwaypOXeUE5EVYcyn9GN4rzzQj/wL
	aerYIP6UVo+6u2VofeRp6/G4zlmxvickX0o/LFTH9GzQo81DOtF4w3ClyiupIUhnJTqIdFhNRFftI
	JB7VKCtHQTFL0YdWGGLw6uXc1fP1XcjodXro8jDta9a8hi/6fLJTQx1hLFouH12349lA1m1kHHund
	d7lmENaBNFUK2vMEdT7Lzd2FNo3H0aErHdTtKb3p1crRDa2KeZEhZmTDggnnHqclJmKSkhgSP5hcH
	qrwny8gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE3Si-0000000HFFE-3fFI;
	Thu, 21 Nov 2024 09:26:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE3Q7-0000000HEjg-0SNZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 09:24:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL9KiEh007711;
	Thu, 21 Nov 2024 09:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJzek0bdbC3Ntd/IGsSF3/5x+fHEg6vM7YVqfg+K9ec=; b=QsNu8m7A+mTFf1Vx
	03rdLjUJ7NtLTmJTOz+pqeLDvcOWK7N6Hw9hGUsolH4ekUzW/GhugfUltAHPs7Sn
	J7yFSr1wcY4JxGZekFpHN3dzfKiu7ZGuuZtGi/7bpBAUpTrBwv22bp++0zWOGP7B
	gHCIRReUc7lR0nclyIv0IViTgpTnXAN5+6QuNRtrae6EbpKn3pKXQm5T0yym8+NL
	93ZsOWoYfad3Yza+mr1L5vBvH9C6I7iPbe49qadTMxQWsJuFaaYlteQ3c4pfItkN
	7gqQx1q99GjirjfaOvpQVYZOk6XNaUVHhXtGezXJFPzQ80vilMiDvvdVkEOqgWR4
	2g/efQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4318uvm1xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 09:24:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL9O1hv032359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 09:24:01 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 01:23:53 -0800
Message-ID: <ddd6325a-c50e-4602-80b3-848faea6a266@quicinc.com>
Date: Thu, 21 Nov 2024 17:23:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/msm/dsi: Add support for QCS615
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        "Marijn Suijten" <marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Krishna
 Manikandan" <quic_mkrishn@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Li Liu
	<quic_lliu6@quicinc.com>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-6-2873eb6fb869@quicinc.com>
 <404f006b-46e5-44db-9f22-ec2139468ecc@oss.qualcomm.com>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <404f006b-46e5-44db-9f22-ec2139468ecc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fdm6g5vZ7vFP0pGBLjjxZTAH_bUfj3qQ
X-Proofpoint-GUID: fdm6g5vZ7vFP0pGBLjjxZTAH_bUfj3qQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_012415_274964_9E92F1FB 
X-CRM114-Status: GOOD (  14.33  )
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



On 2024/11/14 21:32, Konrad Dybcio wrote:
> On 13.11.2024 12:51 PM, Fange Zhang wrote:
>> From: Li Liu <quic_lliu6@quicinc.com>
>>
>> Add support for DSI 2.3.1 (block used on QCS615).
>> Add phy configuration for QCS615
>>
>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_cfg.c          | 17 +++++++++++++++++
>>   drivers/gpu/drm/msm/dsi/dsi_cfg.h          |  1 +
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
>>   5 files changed, 42 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> index 10ba7d153d1cfc9015f527c911c4658558f6e29e..edbe50305d6e85fb615afa41f3b0db664d2f4413 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> @@ -221,6 +221,21 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>>   	},
>>   };
>>   
>> +static const struct regulator_bulk_data qcs615_dsi_regulators[] = {
>> +	{ .supply = "vdda", .init_load_uA = 21800 },
>> +};
> 
> I believe refgen is also present here and you can reuse dsi_v2_4_regulators
yes, will fix them in next patch
will remove qcs615_dsi_regulators and reuse dsi_v2_4_regulators
> 
> Konrad


