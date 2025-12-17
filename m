Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46082D65C49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 14:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXkjmaeJXhi313Y9q+FKwmvBFYzW11FHKjbzhm/D7OU=; b=uhTLwgIigVqDhFAZC7mWioA8dA
	N+HyZgAxccdlpYXlYTcHqEJ0555Yxio7AkrP5vM64RyYDWnuf4jZefXJ6NpPnJDXTZMjXveNi5+z5
	y0oqn32cM2A9UTroMXY1qctQ7TqNIaRzKbxuJ+7rfAi/nKrE7KHlA6G5QfyfYaytSSPu/+PPKJM5H
	okp7s25jkzacBmxJZusUB2spRuCx/GgLhp+FcHVCEt+ceyeeYl9IT/Bv+YZZU33sHcGm6tdyekTH1
	iFYsnYRK1tDK7t8RjBRfvpt3rfRrHm+yKL2m+1U8rnL8/9ZRPiXYWk6UbN6bD8YsdjX03+DiksHm0
	V95gNR8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsMf-00000006uey-2Pgl;
	Wed, 17 Dec 2025 14:18:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsMd-00000006uec-3ml8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 14:18:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKqEc2390544;
	Wed, 17 Dec 2025 14:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iXkjmaeJXhi313Y9q+FKwmvBFYzW11FHKjbzhm/D7OU=; b=I+Kp8n3xtrgX6eht
	6vVsAF3YTjZ0RfPav+zJ81DoTojpKWItH8zM0c8T2zjP/lEklF4+R/guB+CAdvs8
	LEefTsR3T7l2J3oivi1OROO2s+SZKd5+d/CuSnFYiCOEb47UdKdOlT8U2PwEnntq
	A+Tft+tAJy0fuu0H6IjHgOQcT70tLEkWctXAwSSdTlbtDD+jvW7y1ZzmloMdCHcm
	FwLA8PKor/E8NrBkxBbqPJMIunuJu1B9ffPeaUBT7INeSTk+o/D9hXd1ZrGxtGHP
	xf93sOktsDZA6ddqcjhBEgYHfR7IQ4nEw5EcPmeXeVDGxiDBDqkAd2KXAVt/xSct
	QXBNQw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g3ht5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 14:18:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BHEIfOP011359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 14:18:41 GMT
Received: from [10.206.103.106] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 06:18:36 -0800
Message-ID: <2e14bc60-8cfb-4710-bcfb-d2cef8f370b6@quicinc.com>
Date: Wed, 17 Dec 2025 19:48:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: monaco-evk: Add camera AVDD
 regulators
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-5-quic_nihalkum@quicinc.com>
 <19bf8b37-4b40-4825-a8be-a94139389c69@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <19bf8b37-4b40-4825-a8be-a94139389c69@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8Ktjcy-lhBAmmHEQw9iDdF62WUaCmsOU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDExMSBTYWx0ZWRfXz1QIF5DyeCpT
 LXa8n09uF922YM3lCDy52vewDoE6hhfAtJaH/fglPc81TprIm8cp6o2CXyR8CVvRgZcz25NVKgn
 TbIjhKkY/QbrzOMWmauP9DL8CmN1f2WcBBc2dDLAwNma+fbklLtxPlM4wwQmN5wqm2Mheb4yiO6
 ylu5T/aUdV15e2atpqlZAY2eXETbrSIPuPMOXr1dM81kmXtMGeYwfu357/xLBCBB9dvdsHzx7Wm
 N2LBhVbSEN0dAWsWzoKBHCJCE54L4b32NwYuTiHGj51Gp+7ScutIdHpm/mjWe9w37O/+ho+m+oz
 fB/q2MveplKDe8k2Sd3VrJqvYDZ3FPXXtClWqjzldlqlh+5eqJ01E2to0zTVzkEauYkuhC0n61p
 L5TO+tVq+KqNq7x1taHDku4BlqD+Tg==
X-Proofpoint-GUID: 8Ktjcy-lhBAmmHEQw9iDdF62WUaCmsOU
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=6942bbc3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fuV65yvZV9PlKjkSEkoA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_061852_092990_A8D0AA8D 
X-CRM114-Status: UNSURE (   8.58  )
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



On 17-12-2025 16:44, Konrad Dybcio wrote:
>> +		bias-disable;
>> +	};
> All other entries in this scope are sorted wrt the pin index..
> Please take care of that and add my
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 
>> +
ACK, Will address this in the next version.

-- 
Regards,
Nihal Kumar Gupta


