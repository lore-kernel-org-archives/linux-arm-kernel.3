Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6522BC71133
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lceMfIGYuCPCZ+W3coEkS0Ut+HidNJnVCjzT2QYpkyc=; b=I70YsBOg1xBxSmmQYlZvNzfy5k
	TE+6AOXKw0w5fGx5M1EFDyOr9vUd1BZC8Ow6mvLHy9D+HHZYERRVVQs49EaT2LbFGRLDzU93uGKn/
	e5vi0ARBxZc80Guxfuo07abuQ2gJd+s03Yxjeu4fuCRu6gLv0xnHHXkW/dQ8mJfgbe8Pw9wSooXWy
	AqiVE9L7vilVOIVlYs7ZWjWemG3P22HE3MoJlM8kuZSpPBJsONI0tU/40bdD4fTnRik6QXieehTLi
	vmszw6Tf1FI9Lg4yIIzS37xXCLXOula4HreBII/3Vfyql6oJUpK1pQ452S7LooZlzAVoigYW0OE1V
	+v44Gqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNgR-0000000AS5W-2770;
	Wed, 11 Jun 2025 15:48:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKaD-00000009qbC-2zrV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:29:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DEBG029570;
	Wed, 11 Jun 2025 12:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lceMfIGYuCPCZ+W3coEkS0Ut+HidNJnVCjzT2QYpkyc=; b=m4QutV/xaKTpKISA
	NOwmIrj73dsc3KE2A3orL22BZtxj66vP/LhJHNPXNSDxoCBhsfUWXRfqcHZmXJxc
	NSHBVV5/ciMSesHHPlF2yiIhkZx5hZvwX1I6WB6Mm2SUA6b3iziXEM+X2Jz7XuNN
	CxdkVsuTWXNq1SJ23PZHm7OSh12YcYZ4k5RipN/vzXCm9SttyJ9yG2hO2HrkBg0L
	qrZ+YAZrIr+6OGdRfDjaoqfQtpf7TnQ70o+gaRmnzH0XbU2Z4UMwUji23leDIVTT
	TjGdWt0RdRgmHmqHfu8I9L1VOw/66MAGtlhrov+yOeopM8mFUnSl2k+LDIwdI1lV
	YciKMQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d124y0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 12:29:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55BCT1Xi020022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 12:29:01 GMT
Received: from [10.216.28.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Jun
 2025 05:28:52 -0700
Message-ID: <80dae86f-fb3b-4469-9322-7996811d33cc@quicinc.com>
Date: Wed, 11 Jun 2025 17:58:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: defconfig: Enable X1P42100_GPUCC driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Akhil P Oommen
	<akhilpo@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will
 Deacon" <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean
 Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry
 Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth
 Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-pm@vger.kernel.org>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <20250611-x1p-adreno-v2-2-5074907bebbd@oss.qualcomm.com>
 <810f7614-ed73-471e-bc5b-3305816737da@kernel.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <810f7614-ed73-471e-bc5b-3305816737da@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xvORiqpGvBtv2J1sNLJ6NcrW_sSxcy2e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEwNyBTYWx0ZWRfX6S74eAHxepUr
 DKO7C/ah9ofD43oLGaXM/WDQTt6dBTT4+CthKexuMHKsaRmv+IxRMl4kNygf9T8BldHdFVztYRl
 XXWC2i9tmGleOrLnFh3oa/tLlFquN0K3KZ/XhM0rXUdf08GskL+L0+xQQoEAmHgTEIJIx8snut7
 Wos9ulCOCB2QReriLLbHz3jFAlCYtRRnNv4NmLjSBz4NYR6oOmyKVsdn2NCQeq4JSvpN8s8z1Fi
 ZpQELKsNK48FQvo338aE6WMnvNPsDzOkVqI/4MW3aghAAxUV/zU5KL8qPJuVe4KKQ1RIS9D4m4u
 nILZ+yvWO5kNiUXjSaaM/NvFFtA68BY5b9X1VhhI5BUhJbq/DKBe/yVJXi/ztW7LLy+iHFF1e6y
 Je67yY3fTdTwLBzAbT8skLYeVbZbMlG7HLYeVgq1N4G3CiODf+86ULL4PnbVGNsHDz4b/SAo
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=684976a4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=cSTdfOdMco8EzcehTqUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xvORiqpGvBtv2J1sNLJ6NcrW_sSxcy2e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_052933_876408_FFCFDF5D 
X-CRM114-Status: GOOD (  10.31  )
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

On 6/11/2025 4:55 PM, Krzysztof Kozlowski wrote:
> On 11/06/2025 13:15, Akhil P Oommen wrote:
>> In order to enable GPU support in Snapdragon X1P42100
>> (8 CPU core version found on Asus Zenbook A14 and other
> 
> There is no A14 upstream board DTS in next. Your commit msg should
> provide rationale for this, e.g. which upstream boards use this driver.
> 

Will replace "Asus Zenbook" with "X1P42100 CRD" which is supported upstream.

-Akhil.

> Best regards,
> Krzysztof


