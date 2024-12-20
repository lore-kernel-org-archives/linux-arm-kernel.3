Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C386E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2reHl71yPviop2jw11dCLzSPN7jxrfNGGXDev2cP5SQ=; b=W+LdSF+95TTQm2gUTvYHvh3T+t
	Y6I8z87yxK3E0B83eWR4wCCDQD0QwxOm53MWCNeDRanNzqETE4ZbN1Loc9vEoIIhzK7kdIc4wjuIG
	TUzJX8oOB6rbU402ESrajnkskUqSK3reDhXTLuLWHxH6GZEJEDtHlZbU10Ou4UvQZRZpr6CcnmxeT
	unl5TyYrbMXs2S/k3mLMKMb3mc2HcAX2aLMnHD5snOUO6IMzi2lqLg4A+78qgDqoby/c9kHyvLQ4D
	C1MrZOu5ALHfPrpGc3SBiWtbxL4N/3BB0tkBRLhOMFrgOTW5+AqlsgXqMqo9pmeHH9AQaLlcuQRVN
	zkG1eXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObMm-00000004ngb-00Df;
	Fri, 20 Dec 2024 11:40:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObLb-00000004nWO-3TLP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 11:39:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKA4WXe016197;
	Fri, 20 Dec 2024 11:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2reHl71yPviop2jw11dCLzSPN7jxrfNGGXDev2cP5SQ=; b=g6ZpuQE2NxWe7h5H
	CTRvMDxIY0U1YtDKYlekTwkiVjmwAV9HwgPkJ7OsRgOjrVB/iHMerqRvALdiQC20
	wQF3oOaVei35Pq/SCShMmll+CTrd0WjecEFao/64JNS6L3abteyDiEH25clmu0lN
	ZQYPrEWPM/F5H2Vq9J2EoMKe9VRVc2Y2QJjOy3DUTOf05jdn8VRGq6NeqcSG7d5h
	4N18hoPU1L+kwYC6vnFkqi47WMXaJZw4wsDkM9q3C+jKRFVX6HfNlIDHs7itz/vg
	h5/XniQgnKsoWHbQNT3tMQUMXabP9bzyi7wKU4hqnYWb7VuV3Tdi/9K/skLdWNex
	FllvxA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n6gug7jd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:39:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BKBd4ag007308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:39:04 GMT
Received: from [10.216.16.88] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Dec
 2024 03:38:57 -0800
Message-ID: <b98cc6ea-d215-2200-1537-1a53c2587c81@quicinc.com>
Date: Fri, 20 Dec 2024 17:08:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 6/7] arm64: defconfig: enable cpu idle injection and
 cpu idle cooling device
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Wasim Nazir
	<quic_wasimn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@quicinc.com>
References: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
 <20241217064856.2772305-7-quic_wasimn@quicinc.com>
 <59e96784-9efc-4958-baf0-a51e766e47e8@kernel.org>
From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
In-Reply-To: <59e96784-9efc-4958-baf0-a51e766e47e8@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UMBrxD59iLYTlJhHSVNlXpfTRgB4c2cW
X-Proofpoint-GUID: UMBrxD59iLYTlJhHSVNlXpfTRgB4c2cW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1011 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_033911_993051_2A52FB19 
X-CRM114-Status: GOOD (  13.72  )
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


Hi Krzysztof,

Thank you for reviewing this patch.

On 12/18/2024 1:32 PM, Krzysztof Kozlowski wrote:
> On 17/12/2024 07:48, Wasim Nazir wrote:
>> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>
>> Enable cpu idle injection framework and thermal cpu idle cooling device
>> to throttle the cpu by injecting idle cycle during high thermal condition.
> I know what they do, but why do we need it in the defconfig? This is not
> a product defconfig, just in case you mirrored downstream patches.

We believe these defconfigs serve as a generic framework rather than 
being tied to specific product features. Therefore, we have enabled them 
in the defconfig to ensure the end-to-end feature is available in the 
pristine upstream build. However, if you think this would introduce 
overhead for other products, we will exclude this patch in the next 
revision.

Best regards,

Manaf

> Best regards,
> Krzysztofthe

