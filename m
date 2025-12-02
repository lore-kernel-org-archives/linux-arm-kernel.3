Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA8ED11700
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:CC:To:From:References:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWJFndHajcSihw89TvKE2v/cuACaYcbNWEULCywGGHI=; b=l9j0k7iEVAfbDLYAVFmPJ5YqbW
	BTcEE60K5Wqj6T6K65qtjplIBnkqrQLl0oncC7dxp052lgI3LvB8MrBHjmzXBQFLQaC5ZP+bvIWA9
	NM36UN4in65ib0vrb4DfjEgTXPElbkMOKGWG8PdwtFBMKjMCsY3ADbV6mzXzMyckmxs4ubanKAAnN
	ueFTV5BLrkZea1gAUgHWi3LmBDwXP81G4smF5blGpgFOsuk1i1USv0BWg0mwYrWsVfYGVAv7N98ka
	eu+kvgqI4EvVpE8w5rwcbcvxGPa16f+22By5RToZp624hMp6jU75Y460oljE0wkksorkIMnP8GgOC
	z294HA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQKvj-00000004xbu-0qXb;
	Tue, 02 Dec 2025 07:36:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQKvg-00000004xbA-3R7y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 07:36:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B24CIFh1590754;
	Tue, 2 Dec 2025 07:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWJFndHajcSihw89TvKE2v/cuACaYcbNWEULCywGGHI=; b=YPdnqScdQ+uRh4yb
	+bWqqEk27APvALgnIomOKqBXICP760k84+M5/vNNofyGv3ahn+pEQ3apiZ1zUikS
	Ad/2woiPLit3QLNhE/yacR16h+IITdVZVW3Kh/zrQDTnEoPjqrJrdzO0tbdkTg7H
	hGlCWY+MbezGtxhOd3eITLbt4Z1XJs7ixEnaApXSd8PgPVwQkK0ah9qPuYHBSuqZ
	Im4yW3d5Nkbw/GmpjSxBdiXLT5M78uUujdj3q/GiFMdmv/WEkxOeBymd7NxKTctf
	F/k+jjL5voHO5Ew9cpDTe4K3ticaEENTPWlIJnsRxyiMu+Lyc6/YhxXGS3EJHUFG
	0BscEw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asrvr8htt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 07:36:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5B27Zx0d023017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Dec 2025 07:35:59 GMT
Received: from [10.216.33.247] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 23:35:52 -0800
Message-ID: <3f1dbf91-f967-44dc-bb21-25fdcbbc8db2@quicinc.com>
Date: Tue, 2 Dec 2025 13:05:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
References: <DS0PR02MB11311CE33DFFE0739BE747590E3D8A@DS0PR02MB11311.namprd02.prod.outlook.com>
 <d49920eb-0b4e-4042-b0c6-28d1ba348ddc@quicinc.com>
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: Vikram Sharma <quic_vikramsa@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
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
In-Reply-To: <d49920eb-0b4e-4042-b0c6-28d1ba348ddc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=D5VK6/Rj c=1 sm=1 tr=0 ts=692e96e0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=yv61VyXJEuW5_bWReSAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2IAK7mSb01TDkoV9MhbyA1W5jNtyE3u2
X-Proofpoint-GUID: 2IAK7mSb01TDkoV9MhbyA1W5jNtyE3u2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA1OSBTYWx0ZWRfX/vpbMyslI4p8
 8E4vAY6on/WYnN6cpNLwRsYklKt1m8wXuD0w/NFAIv80E9g4cnJ9fzDgkhKpZau2IoX6Ye+pIcj
 DCjyruI9UYr1D5ADHga6NmprfZcG2gamAz46NIO7KMCbhK1S82xz1EznUYzTtPoXmr1EF59Wltj
 ZME+wKNu05Jt72XCfa0bugsq/j502odGRDQwCom3Pg/S+AXb4YDipr9cMn5QlbLGQWs6LhOx4hS
 OmELr85DbSJmPGKfu8rLtCIFLLnBnpbOffShRrBZ8fjdfvvxNbdDc100VDBejrmhjJhu5r5wWi/
 Ng/Wyy9iKDDYbVWvUHx5K/1i8JMXMlSXQkycnbdw3z5erAnlM6/MhTyaT60CWG0fDkxXyObzDqT
 K4PB3yIQGkt6wIbY20raeNVfoOpymQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_233608_866229_5A9A0F3C 
X-CRM114-Status: GOOD (  12.19  )
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



On 11/26/25 9:10 AM, Vikram Sharma wrote:
>> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>
>> Qualcomm QCS8300 SoC contains three Camera Control Interface (CCI).
>> Compared to Lemans, the key difference is in SDA/SCL GPIO assignments
>> and number of CCIs.
> [...]
> 
>> @@ -5071,6 +5182,240 @@ tlmm: pinctrl@f100000 {
>>                       #interrupt-cells = <2>;
>>                       wakeup-parent = <&pdc>;
>>
>> +                     cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
>> +                             pins = "gpio73";
>> +                             function = "gpio";
>> +                             drive-strength = <2>;
>> +                             bias-disable;
>> +                     };
> I'm not sure whether I was unclear, but my intention was to ask you to move the MCLK pin definitions to the SoC DTSI, because that comes from the design of the platform and doesn't vary between end products.
> 
> GPIO_73 being related to a voltage regulator is strictly a property of the EVK.

MCLK pin definitions are already present under the tlmm block in SoC dtsi(monaco.dtsi) as required by the pinctrl subsystem(qcom,qcs8300-tlmm.yaml).
Are you suggesting they shouldn’t be part of TLMM in the SoC DTSI? This doesn’t align with the YAML file.

Regarding GPIO_73: Noted. I will move it to monaco-evk.dts under the tlmm section.

Below are the example snippets:
In monaco.dtsi (SoC level):
tlmm: pinctrl@... {
    cam_mclk0_default: cam-mclk0-default-state {
        pins = "gpio67"; 
        function = "cam_mclk";
        drive-strength = <2>;
    };
    ....
};

In monaco-evk.dts (Board level):
&tlmm {
    cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
        pins = "gpio73";
        function = "gpio";
        drive-strength = <2>;
        bias-disable;
    };
    ...
};

-- 
Regards,
Nihal Kumar Gupta


