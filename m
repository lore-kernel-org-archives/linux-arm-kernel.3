Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3876CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 12:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8UnPcHh8kcwrSfAcGYTzDXv1L8RUlX1O3Kk3RXFStU=; b=zTCU0/Ja+zt9dS6961scXOtPAW
	CKpuPiD+8JrpceILct97WucpqkW4dOa5d73fpCL7/sXfKkme60W3vr6KvBNwdSIuG7TtUMF8PuZxC
	yjkIsl0kUBOXKq2dlmu/1CVgh+P+b3myxvh5NzMqZSm5Vms3Tj7WSoCSzw8Zi/bJZeDUSxzcCwVmr
	LnPA4nbW6Ro01rzrj5PXndk0n4dGIgrioFeRI9mhReBgLaHth8NxxBub8cjX6vQyLCIQ10A5lXS+h
	VVIxAMcFF4WoCruBnHRKG/M7K7sfhpTGOBv5kh/wDApgb94wuZPCc9wZuRxFcuDnmDK6Mo7ckZnR1
	5Zv/0NHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9NU4-00000004n4h-2FHh;
	Thu, 16 Oct 2025 12:53:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9NU1-00000004n3H-3J0y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 12:53:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7ks50016276;
	Thu, 16 Oct 2025 12:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b8UnPcHh8kcwrSfAcGYTzDXv1L8RUlX1O3Kk3RXFStU=; b=i2LfPzHABBf26XBu
	vqC0xFUplzYzmHoKgqtcWauwWsbIRQ9uAOikv99AVY2ncaLQ4LjeCehhYlog6wFe
	YYcY247InTChJrg+nXz3IEWqDOEbfzcz7JVHMf3Zu2AAY2owl53C+yB2G0d2Q+fP
	6RrKwGLx5YRbW1Q9rkx069eZUWo0COydE3Z0BH/IY5gMO5HI6mCh6DriDjcVnNiY
	GYUmqtTBfgBg/AQ3Tj571pN6dVLN+wW4zdxfZofFE3MwpLJ3n2GoBdRSkqjVZO/y
	hjJ9npnA5ZVGi1ek8nFYNM9ZcUKtHeRkaWH4XEIWDm4K6EfKIxqyBIUZ2rWSCzTu
	3+eACA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkga3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 12:53:22 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59GCrLak032071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 12:53:21 GMT
Received: from [10.206.103.106] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 16 Oct
 2025 05:53:15 -0700
Message-ID: <564165ba-38ae-4c86-a980-b2342aa20695@quicinc.com>
Date: Thu, 16 Oct 2025 18:23:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vikram Sharma
	<quic_vikramsa@quicinc.com>,
        <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ravi Shankar
	<quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-4-quic_vikramsa@quicinc.com>
 <ec23a3b2-fb50-4da7-8912-512b0a741ecf@linaro.org>
Content-Language: en-US
In-Reply-To: <ec23a3b2-fb50-4da7-8912-512b0a741ecf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: odQb8elHaFhJptGVdwMceWWzXct9Is-S
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f0eac2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=4uKfaDAKpMznJALyaWEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: odQb8elHaFhJptGVdwMceWWzXct9Is-S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX6zGPZNqJl59G
 s8ESr0GZMW16IRYwpG+LcHv1qx/Rou8m+Ozcp9A7l2CWkKJMzQI9Wbn4OxJZlRsRZyuRoUc+LxL
 lm8hZ9WKXT+/Xm0ciVzxkgVklgfQ6qNlet6v1PMf+eds6B2tUMOAcQdTY+vCf3klOrNBgzJf6n1
 R2UL/5CyCdFvBUFE5tikKX/OIO+tx1hC6NciH2onqF0ebOKo6Wewt54c8egLtZunBV5IGmc3Hxf
 g0C2gi7n6fpAtl6mhLdZJzdQlreWvP3y/goiPYfcLhkTyK9Nk0dn6jR2NIoTiP8zOt4V4nah80n
 CExRENyXgHySmCLOC509/xkc1DQsjIDkLsZe2YsmuJUb/dacSlNJxXWbGSI00vb7FK5aq2deor5
 2SmdHkSjdHoef3xI7l74EpuB55GmNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_055329_939800_2406F829 
X-CRM114-Status: GOOD (  16.44  )
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



On 16-10-2025 00:45, Vladimir Zapolskiy wrote:
>> configuration. Introducing a device tree overlay to support optional
> 
> s/Introducing/Introduce
> 
ACK

>> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
>> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> 
> The first expected Signed-off-by tag shall be from the change author, and
> it is not.
ACK

>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> Year is missing.
> 
This is as per new yearless copyright format.

>> +        avdd-supply = <&vreg_cam1_2p8>;
>> +
> 
> Please remove empty lines between individual properties.
> 
ACK

> Remove 'clock-lanes' property, first of all it is non-configurable,
> and definitely it's hypothetical value can not be equal to '7'.
ACK

>> +        };
> 
> I'd suggest to add a description of pins with MCLK function in a separate
> change to the SoC specific .dtsi file. It will cover gpio67, gpio68, gpio74
> and gpio69, so here it's a MCLK1 pin for instance.
We are currently enabling sensor only on CCI1.  Pins gpio67–gpio69 are used by mclk for cam0–cam2, and gpio74 enables the regulator.
Since mclk is sensor-specific, it's added in the sensor dtso.

Would it be appropriate to extend mclk support to all CCI instances, even if some are not actively used?

@Konrad, @Bryan, Could you please share your thoughts on the above?

If valid, then cam0_default, cam1_default, cam2_default should be added in SoC dtsi, with references used in sensor dtso.

> 
>> +
>> +        ldo-avdd-pins { 

-- 
Regards,
Nihal Kumar Gupta


