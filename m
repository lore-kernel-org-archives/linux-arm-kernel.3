Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B14C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 05:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:CC:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVOD3v3Y0g5LF/Im4pbOfEYj3LcSGcmxUrJET2J/F/4=; b=MmKWx2gBI/jxv7HyFx+HzixJBw
	NgH4Pa8Vh6zycpdqzd5um0G0eJ/4zvzau+lIL3KJTmELXrvH2wITCAt2jUtC5Fwoy4rovckT/4q/U
	YI8Oi5XAaj0wo7Sxd6ckU+zF7IAgFXtsleNdDAjr6tD13LKR4ezr+kXbjZyu7yXj7Stz/WsmKi4V4
	kMfLCB2fppq18RrafBCKvuXRg/vFVFWs7Mla/omyeWJfrKaB/rn0O5GK0mstaABEkfdJhKVa2vLj7
	pxanbeM+vEUfZ5VJo86l67mTlNWD5kabFoqJvtEDIBURV4bd1Ky/UhDNwSRBooN2qbNS50uEfiSw1
	yztskkHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thLuT-0000000GDe6-0mv7;
	Mon, 10 Feb 2025 05:00:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thLt4-0000000GDWw-3ZNB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 04:59:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519MUw9E014239;
	Mon, 10 Feb 2025 04:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVOD3v3Y0g5LF/Im4pbOfEYj3LcSGcmxUrJET2J/F/4=; b=eSpH/wKC2FyLBjfE
	NsK0qLxuUccCudgQouHqdY8GhessNlA8Zb0EwGA08k9GMRnpOqZzMpvyXBluAuaC
	XK1u4aaL5Gx+H8ey3o4y+O6X1P0et5/fq/c+44w7BnMkEDIVIp5B96+C0MGG9Tq+
	+76XM1segOVGDxC+cAlBzsNwRVuef4zO6IT0GtyEW1tQfz/3ZvNaA6Bj+FjBWUYz
	zgzmvsbc7BgCAUIveNEeW3WMkl/X9sZl+J69JswZh72UInj1a+SdIEXKLO+FWEeP
	q/BK69d/mpu1JIi0eBvnoF7XRRjm6k49/fv11qZz4ylcLIPCVbmZJ64wS4NOIfzA
	/4kylw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0g8u3kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 04:59:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51A4x5t6010009
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 04:59:05 GMT
Received: from [10.219.57.57] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Feb 2025
 20:59:01 -0800
Message-ID: <ed3cc71a-426e-4044-86dd-945751e282d5@quicinc.com>
Date: Mon, 10 Feb 2025 10:28:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <quic_pbrahma@quicinc.com>
CC: <andersson@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <iommu@lists.linux.dev>,
        <joro@8bytes.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <robh@kernel.org>, <robin.murphy@arm.com>, <will@kernel.org>
References: <20250203-b4-branch-gfx-smmu-v4-2-eaa7aa762f48@quicinc.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <20250203-b4-branch-gfx-smmu-v4-2-eaa7aa762f48@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5gzjTQFf_GJj_MveMIDpprdBFE0l1iGm
X-Proofpoint-ORIG-GUID: 5gzjTQFf_GJj_MveMIDpprdBFE0l1iGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_02,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 mlxlogscore=727
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_205914_921670_1A696B40 
X-CRM114-Status: UNSURE (   7.01  )
X-CRM114-Notice: Please train this message.
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

Hi

Can someone kindly review this patch?

-- 
Thanks and Regards
Pratyush Brahma


