Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28BCC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 06:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwnCXb5J3d5nedzVUrVNYMUsqBCkn8NNvKJiPcVbUdk=; b=GKl7mc8mLAIoPkxV//3TdTqGjZ
	H4g/RrvMztJL8MvS5msP36fGiOdBX59NR2uovXzDaV729XWGo98LGBCo5YgwU6wp7p4aB8lcc30tK
	fdZ7L7ooQwYBZSFfdrxLMqyUNq+ZuofemVFLCU7m0h0s3cPDOXtm/n2CjJLQtTkQ//9mX4z575beu
	ls36MxLB9dKaZSKZi23q5goO2B4bpIkyMXYFIFeveYEu3L7JEIL1sV4DyRW/AvnwdBM4Q2AWeOxVD
	NKOXqG/+JE5RpQhVmDs69/GwPY3fJg0pOwUFLASKZa2ENGMGyjX3xlG/T16FSA01SrdhbdO/gkSbG
	dhq0vR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twblc-00000002Ny9-2eN9;
	Mon, 24 Mar 2025 06:58:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbjQ-00000002Nl3-3BAL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 06:56:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6c2cw021847;
	Mon, 24 Mar 2025 06:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rwnCXb5J3d5nedzVUrVNYMUsqBCkn8NNvKJiPcVbUdk=; b=SHTai/twgyM7gb8g
	5cKZjNrePvVziUcqz4uQzprwcB0IzDQ9ekiVsvndF643cQmk5lhmfMGgFrgGPwh0
	4LpH4Z3ODbkBjRZXLHD2MGtqODQyUDoE7pCH/9HwZZXXWKKdLiWOAdXJPuYNIT4f
	kVeyvXoVBZ3arqm4qyQ+35/XNos+SwEoWch0w/RLMoDFFkiEryGLivMQ6FniwvY6
	lwove6JiyB3pW4B+dv7mBWL6uhbr67uXftnTgSptzKyxXQymevyIh+5dpSlTwLef
	eB8tqZDHaOi5kHv+rV7wpNciH7qPwnALdUfikwwZCTMz2TqI77r7s4KQ3xcxY8nJ
	jvIcZA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hmhk3cpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 06:56:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O6u4pL006717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 06:56:04 GMT
Received: from [10.233.19.224] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 23 Mar
 2025 23:56:00 -0700
Message-ID: <6964f197-07c8-469c-b4e5-710a099752b4@quicinc.com>
Date: Mon, 24 Mar 2025 14:55:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: defconfig: enable PCI Power Control for
 PCIe3
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <quic_qianyu@quicinc.com>, <sfr@canb.auug.org.au>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <zqBb_94gbwLzHgbAiLqgbuGg9wmeV1jUxHOsMXDdZToeTtRrtUimm8ra7GB48DXWU-ZOvC5mO8EY0uvxz46ISg==@protonmail.internalid>
 <20250320055502.274849-2-quic_wenbyao@quicinc.com>
 <fff943a6-4322-43d0-9821-08375bc5376c@linaro.org>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <fff943a6-4322-43d0-9821-08375bc5376c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=C4PpyRP+ c=1 sm=1 tr=0 ts=67e10205 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=lMbmitncurX1WqZc_pgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: V7AIMNvHzfeIzE9tqeottGNncaAJM3tb
X-Proofpoint-ORIG-GUID: V7AIMNvHzfeIzE9tqeottGNncaAJM3tb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=962 priorityscore=1501 impostorscore=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_235620_916924_EC7AEFC4 
X-CRM114-Status: GOOD (  15.58  )
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

On 3/21/2025 6:01 AM, Bryan O'Donoghue wrote:
> On 20/03/2025 05:55, Wenbin Yao wrote:
>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>
>> Enable the pwrctrl driver, which is utilized to manage the power 
>> supplies
>> of the devices connected to the PCI slots. This ensures that the voltage
>> rails of the x8 PCI slots on the X1E80100 - QCP can be correctly turned
>> on/off if they are described under PCIe port device tree node.
>>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>> ---
>>   arch/arm64/configs/defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 85ec2fba1..de86d1121 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -245,6 +245,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
>>   CONFIG_PCI_ENDPOINT=y
>>   CONFIG_PCI_ENDPOINT_CONFIGFS=y
>>   CONFIG_PCI_EPF_TEST=m
>> +CONFIG_PCI_PWRCTL_SLOT=y
>>   CONFIG_DEVTMPFS=y
>>   CONFIG_DEVTMPFS_MOUNT=y
>>   CONFIG_FW_LOADER_USER_HELPER=y
>> -- 
>> 2.34.1
>>
>>
>
> PCI_PWRCTL_SLOT is a tristate symbol why be a "y" instead of an "m" 
> i.e. compile this into the kernel instead of having it be a module ?

It can be compiled as module if this is preferred.

>
> ---
> bod

-- 
With best wishes
Wenbin


