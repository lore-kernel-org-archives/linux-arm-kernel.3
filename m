Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D38C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 05:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LO1hZ5QXZ07rHxOlnZYLZWziODF69u3ncZnlC3UFwHU=; b=ZHKTz+ikM3dBA+MIiI+sRtdEQT
	gpCAikYyids10nqWb+uX2q96PdKNwlPzLlWQzgHtMTYioSvZmMszOEl8cdOeYQBjg8zlPZ7wYQ/JU
	CZCPQPnvd2Lz+BKGqj1x0rVzrSirr8BMm5MBkviHLrEemul4ZdL94dYzcjg8kJzVg6YHH2Te++3n0
	jgV2OHqvMSqEdN6XA1PxU0s0VrqYTOP2JxCgI858ygWs+zpnZ2++D8R8F8ys18Ts+m+/ieaJCmjTX
	0OJPhwRWIbq2GxkYMCl20oIk/yOn3LzlGqhLJde7f60evOUCJGZ4+c20L/zDdqYJT7cqCJUS0rcmB
	SX3eJjEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti5CC-00000006E5s-3eAF;
	Wed, 12 Feb 2025 05:22:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti5Ae-00000006DvF-0chu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 05:20:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BJWurd024321;
	Wed, 12 Feb 2025 05:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LO1hZ5QXZ07rHxOlnZYLZWziODF69u3ncZnlC3UFwHU=; b=DhqhfngnfcAUO1K7
	Lc0EfHPYMHI4ae0dn+TULM/GiV8I0A5Lq9GXj7K0PyRcnr3++eshDip0lj9bG3HM
	0gYwtZ+JNq+9u+0A7LVFdoxQlllDBOtfGCwqckDsI53+CPeuFVKn5+0Y7OCmvkRC
	6SNqaS/Mjuy9zJXjo7LFGNDxABK6Po72opAzGrZ4iLPX0cB6lmLeuqca1nuDlxKt
	/aPicavxX/cQH5wEOakLcxETPiDZDBFjbXTbN0tVC8u7hMa4DgLeGkv/dNtklk0m
	tyaiq5CQGG2Y+LwsXNxragusHTFvm6XNNNjeJ9aJPcDzdWRC/p80yqIAb0Wepivw
	v1iNcA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r4b5tuh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 05:20:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C5K6vG027315
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 05:20:06 GMT
Received: from [10.216.0.248] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Feb
 2025 21:20:01 -0800
Message-ID: <075588ff-77e5-4b01-8c67-8fc30e51b8a9@quicinc.com>
Date: Wed, 12 Feb 2025 10:49:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konradybcio@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com>
 <20250211-b4-branch-gfx-smmu-v5-2-ff0bcb6a3c51@quicinc.com>
 <3158e911-c771-4186-b287-50d2395b8c94@kernel.org>
 <138b1c42-9580-41f4-9079-87740568b79c@quicinc.com>
Content-Language: en-US
In-Reply-To: <138b1c42-9580-41f4-9079-87740568b79c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2gaEzYFD5KsLXdsOPxP8DPtgDHJDbK1n
X-Proofpoint-GUID: 2gaEzYFD5KsLXdsOPxP8DPtgDHJDbK1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_01,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_212024_209675_D00632B2 
X-CRM114-Status: GOOD (  14.72  )
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


On 2/12/2025 10:09 AM, Pratyush Brahma wrote:
>
>
> On 2/11/2025 8:45 PM, Krzysztof Kozlowski wrote:
>> On 11/02/2025 05:45, Pratyush Brahma wrote:
>>> Add the device node for gfx smmu that is required for gpu
>>> specific address translations.
>>>
>>> Signed-off-by: Pratyush Brahma<quic_pbrahma@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 39 +++++++++++++++++++++++++++++++++++
>>>   1 file changed, 39 insertions(+)
>> As pointed out by Rob, this wasn't ever tested. One more example of work
>> where you have the binding in the same patch but refuse to use it.
No, I had tested these patches against the dt_bindings_check and didn't 
see these errors.
It seems I need to upgrade my dtschema as Rob pointed out, reorder the 
clocks and resend.
However, I guess I need to update the clock list in the bindings file as 
per the order suggested
by Konrad in version 3.
>> NAK
>>
>> Best regards,
>> Krzysztof
> -- 
> Thanks and Regards
> Pratyush Brahma

-- 
Thanks and Regards
Pratyush Brahma


