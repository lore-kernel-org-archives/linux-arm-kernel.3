Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3801FC36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 06:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BmV3u593lkICMeXn4dWt/GaEgIv7UlyJbMeXZJm6fI=; b=1OpgT30rRHtRtSd4ZUjRghiOQw
	EQAADIvy/gB6LokL2YKjfJ7YaYT91923OP3Q88DNDtr/2FEs/zaZbGKIxArZEUlfniX2m0GFAJ8rn
	AiojSeyMaTp/jVe7aQ8wS32CrLM6Ei54AwJVl11ZTHvKuqFnnJDj3y0HxJHY378RS44OKB6a8I6Xl
	VGvCsvfegdm2poTwpLjEYLfMpFE1MASBbOyHeExzN1ingGlsKMP641UYMTzEH6ffqlWJfyqa8fj2I
	jSQcqz7Suhltsf8+8moD8x100Bk4YS5juCW5RZKmvTdCaWAeMHcZ5cy2biNkmszKVNmdi/wYZA/bN
	IQE99NCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbjv-00000002Nqq-3tPu;
	Mon, 24 Mar 2025 06:56:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbet-00000002Mw3-0bfu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 06:51:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6bw3k031457;
	Mon, 24 Mar 2025 06:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2BmV3u593lkICMeXn4dWt/GaEgIv7UlyJbMeXZJm6fI=; b=g27OB5ToXp+PQrY+
	uet1pFN++tbqHinlKlJOwvgVxw8+n0w5cupMhw5ysx8kK3Tw9FUHru3wDSM4nWmu
	u44rhtaMxPcCuG2XRi03plqdqXBny3fm5TeQAjtFViTCYirAZ0e8Spq/LbIva50t
	+F9cpNMnf0/fVTAR5Y6v9zvOwc6aKVDG6cGRmn8RBppfAL+2+lC9ldtYk/PpWCoM
	qd+jQvnljfjuzphhqpme71/teR8m6LzFmfzvq0MrseotDxYxJHYkD6jYF1Ta94ns
	e5rtZI8MyCYk7PJs19uEQKBW8rdQlA9M7yw4N6/BztnjrNQ6vCIP56H0e6U+uPqX
	Ec1JuA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hne5ua6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 06:51:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O6pNJ6004644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 06:51:23 GMT
Received: from [10.233.19.224] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 23 Mar
 2025 23:51:18 -0700
Message-ID: <f4cc9d3e-0079-47a4-bee7-32221b37df65@quicinc.com>
Date: Mon, 24 Mar 2025 14:51:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <quic_qianyu@quicinc.com>, <sfr@canb.auug.org.au>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <U9NTFHDe_r-uUozJFJGmc7VpxMDx39onKby4M3B_sy0jJ2fr7-iXkS801m2slu8PXanf7Y7faBxuZ8fzWiKxTg==@protonmail.internalid>
 <20250320055502.274849-3-quic_wenbyao@quicinc.com>
 <7dc8700f-0d53-45f5-bfff-2bec71c7053e@linaro.org>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <7dc8700f-0d53-45f5-bfff-2bec71c7053e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4bZ011oTBBWHLyE3D42KmUuTLccUKLHG
X-Proofpoint-ORIG-GUID: 4bZ011oTBBWHLyE3D42KmUuTLccUKLHG
X-Authority-Analysis: v=2.4 cv=JvPxrN4C c=1 sm=1 tr=0 ts=67e100eb cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=Upqwyp-cVDBhw83K_eoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 clxscore=1011
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_235139_192413_F28C9C6A 
X-CRM114-Status: GOOD (  15.88  )
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

On 3/21/2025 6:06 AM, Bryan O'Donoghue wrote:
> On 20/03/2025 05:55, Wenbin Yao wrote:
>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>
>> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI 
>> slot
>> voltage rails can be described under this node in the board's dts.
>>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi 
>> b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> index 46b79fce9..32e8d400a 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> @@ -3287,6 +3287,16 @@ opp-128000000 {
>>                       opp-peak-kBps = <15753000 1>;
>>                   };
>>               };
>> +            pcie3port: pcie@0 { 
>
> Missing newline, please check your dtb checks.

Will fix in the next version.

>
>
>> +                device_type = "pci";
>> +                compatible = "pciclass,0604";
>> +                reg = <0x0 0x0 0x0 0x0 0x0>;
>> +                bus-range = <0x01 0xff>;
>> +
>> +                #address-cells = <3>;
>> +                #size-cells = <2>;
>> +                ranges;
>> +            };
>>           };
>
> Why is pice3port the only port to be enabled ?
>
> What about the other ports ?

Only PCIe3 requires PCI slot power driver to power on its slots, other
ports don‘t need it.

>>           pcie3_phy: phy@1be0000 {
>> -- 
>> 2.34.1
>>
>>
>
> ---
> bod

-- 
With best wishes
Wenbin


