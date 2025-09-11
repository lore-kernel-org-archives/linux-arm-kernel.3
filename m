Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BACCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FQn2gddC3/DV2qgU8ynuCwiXmOYDmwte8ix1cOJuVI=; b=RPA6a6YotW9EeFqSvrTqGHb9Ng
	uEpwJ+htAJ7D+5GS3Lh9LBasdQFJadICCJHl4nmcACWz54spGmaF/sZ4AJFK/nRrQL4m1HTIExSqO
	78QNwEkLBbu1G8O7oNs+2PbuqjFr05UQO0w3jUNnvZGbZikXx85YRGTHE76DxCO2jzC2I0ZoKlWAP
	OEJHAeQzRSB0HqPVh5TZJFyxtOjNprC5QgLOUEyHeApEQgk26Z5NBNcauF7jfpryLvXGJ20x4j9mI
	KZDZRaVu/BcGAZoBXASTrtwQPeX/y+IccToO2qTN0mBcLNF7M2eeuNdrZZ6IICN2zAUEBCGTFIuWe
	FYROZpvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdTo-000000024kq-1VJD;
	Thu, 11 Sep 2025 09:20:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdTl-000000024i2-2djR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 09:20:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2Ibjw002402;
	Thu, 11 Sep 2025 09:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4FQn2gddC3/DV2qgU8ynuCwiXmOYDmwte8ix1cOJuVI=; b=PFpBBV/tjlu/7YXZ
	jow7Nr/OzibvH69nPjfAZpZ9BRBJ0XdEuoXaQ8X3+4fiVcxERpcj4tymfL3/yiHi
	GByJBvQaW3N2/ysWInpUUom6Rei82m5L/6ZWqhuHJK6yUz0Vpvs7FqMjOMeSwXT6
	MK+/IoKmE2RI831D/1PuSghr8pc2LTVhW/pWcniXFwi+SXCxU5rvduP83g/SLWV8
	0t8/Zvk5HK/QMSsZVzuRDnK6ZoXRWfKqurVTgAySnHNxkZ6PIulbALQr/LK8OoyG
	mueSUhXk4IP58FlR0RZJUznlrNDF6LDA8/KgQlDfrd+JF4YW8GzdmGqAOHCN/p4j
	jIil/g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsf6va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 09:20:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58B9KP1u029809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 09:20:25 GMT
Received: from [10.206.103.106] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 11 Sep
 2025 02:20:02 -0700
Message-ID: <3d26b554-727a-44cb-a1a9-56f49775ba3a@quicinc.com>
Date: Thu, 11 Sep 2025 14:49:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
To: Vikram Sharma <quic_vikramsa@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com>
 <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
 <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bvSiUd5GLpTMlo4CYzoLmf7J1E0A9a6m
X-Proofpoint-GUID: bvSiUd5GLpTMlo4CYzoLmf7J1E0A9a6m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX/rhFzt0/h4Y8
 BkpTEowefkYsh1VecQco+uKmxpf5mFLU7S/9U52e5KrjN9CLbBvLGvYYsniy9sz9fIZouNXQwSW
 tJEBCQHWJRisF4Ix/Z75MY6cQszzDcenQPLQ6S8VTUwSd3WStu9nd8c5KdEfPA3fYzyxrxzSvz4
 +GTAW1k22WuuVYiM7h4xAG5Ajx5P6nJbstroT2PnRKIn/XYZ6vdqvG4x5VrMnwEsWsfxd/9iOzZ
 CzdOAOYAENf4Fjl/r590INhhXkfezPQxG2HQn8qZcG4Q/iTizNEXyDynnTjyX8z1CjR6zKMeSf5
 VS9x26S8Ea35dONBuE8eSrCV4WtauqlEO11lUyq7sAw9cfMO9p+H2WTDx5xeBA9J4HBW3bS/rOw
 Xf9uf+NC
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c2945a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=eIUALLlfMK20frBwWbIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_022033_682518_CC8D40E4 
X-CRM114-Status: GOOD (  19.90  )
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



On 10-09-2025 12:33, Vikram Sharma wrote:
> On 9/9/2025 7:31 PM, Dmitry Baryshkov wrote:
>> On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
>>> From: Nihal Kumar Gupta<quic_nihalkum@quicinc.com>
>>>
>>> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
>>> Camera reset is controlled through an I2C expander,
>>> and power supply is managed via tlmm GPIO74.
>> Why is done as an overlay? Is it a seprate mezzanine?
> It’s not a separate mezzanine; monaco-evk does not come with an attached camera 
> sensor by default.
> The overlay simply reflects an optional camera sensor attachment (e.g., IMX577 
> on CSIPHY1)
> That is why camera sensor is configured in monaco-evk-camera.dtso instead of 
> modifying the base monaco-evk.dts.
> Please suggest and alternative approach if you feel this is not correct

Dmitry, Do you agree with this justification or you have a follow-up comment?
Can we post v2 with the same change addressing other comments.

>>> Co-developed-by: Ravi Shankar<quic_rshankar@quicinc.com>
>>> Signed-off-by: Ravi Shankar<quic_rshankar@quicinc.com>
>>> Co-developed-by: Vishal Verma<quic_vishverm@quicinc.com>
>>> Signed-off-by: Vishal Verma<quic_vishverm@quicinc.com>
>>> Signed-off-by: Nihal Kumar Gupta<quic_nihalkum@quicinc.com>
>>> Signed-off-by: Vikram Sharma<quic_vikramsa@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/Makefile             |  4 +
>>>   .../boot/dts/qcom/monaco-evk-camera.dtso      | 98 +++++++++++++++++++
>>>   2 files changed, 102 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
>>> new file mode 100644
>>> index 000000000000..5831b4de6eca
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
>>> @@ -0,0 +1,98 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +/* Camera Sensor overlay on top of Monaco EVK Core Kit */
>>> +
>>> +/dts-v1/;
>>> +/plugin/;
>>> +
>>> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +
>>> +&{/} {
>> Is this a different product than just Monaco EVK?
> No.
>>
>>
>>> +	vreg_cam1_2p8: vreg_cam1_2p8 {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "vreg_cam1_2p8";
>>> +		startup-delay-us = <10000>;
>>> +		enable-active-high;
>>> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
>>> +	};
>>> +};
>>> +
> 
> Best Regards,
> 
> Vikram
> 
Regards,
Nihal Kumar Gupta

