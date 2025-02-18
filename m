Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EEAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 11:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OfFu0RkbbUZXKY+wlw4vZE7RYzdrPOYjbu2BnT5c6Y=; b=Ml61/0UnQ1iUxSNPFMo5GZGM4x
	En/qOGnEHFGweU8IwiFSWfZZ7UaoHZ2qVcBdP4T3q3i4yqx7kA8viAHRqi2R8hJaW8lP1b1xrLpw7
	yhuBqm4sS0mwaA80u8f8gb5RjaSAvX1hXudLd8txLvDVvDRjqvAVRlWG3EwtOvOzFcBd7rrQlClx/
	yoX39uua04mcklTXLzMAO2HUa6ljY1zamCs52PGrfsCBCA0ey0mDgOxoU05FDOeecD6LOPM5C+gy6
	qGBhpsPFJwmRZTjdTsbslYVBV/vrfeBZY6jh5JfexjA+2aFantWvzVmbx+y1F6tcN/tev9D2fUpsg
	6J2j9Ofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLrm-00000007ys2-3KoJ;
	Tue, 18 Feb 2025 11:34:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLlh-00000007x8H-1Frq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:28:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HNmHMn004131;
	Tue, 18 Feb 2025 11:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5OfFu0RkbbUZXKY+wlw4vZE7RYzdrPOYjbu2BnT5c6Y=; b=PvtAQfNWI3yUvGM2
	Dd0P6GTjmPE1mlYQa5mhDKT+hFVhmIVHJCznIxxQ7RyKA82HCT46KJhK1KBadAzj
	goXnUWyyCxFQ1FaR/Yjq+TMwcg0ijMH3jsqCaGj1mM9e79AXbYyw4hpv76fQbc7F
	l/szK2KjM/PamX7SCCC6FEx5uFTYjyeTxLt4x+CuyGK0MgjJx7reZjx7uS5FxcOg
	/Xq4W/bTIA65Lrrs7qbZMUesPjnjEw2ahRApkv849l9eesvkmHh5wN3cpR0x6ITE
	lx2wXDiw6ZAwBFvhPifKxTlZjOf2k48gENOhEMEMm2PEHiA3WXzvldYoqy94dvt/
	EUNuvQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7uvmq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 11:27:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IBRPD8031473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 11:27:25 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Feb
 2025 03:27:15 -0800
Message-ID: <25e5840d-a9c3-45fa-ae06-e18c387f1efc@quicinc.com>
Date: Tue, 18 Feb 2025 16:57:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] arm64: dts: qcom: ipq9574: Add nsscc node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>, <p.zabel@pengutronix.de>,
        <richardcochran@gmail.com>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <biju.das.jz@bp.renesas.com>,
        <quic_tdas@quicinc.com>, <ebiggers@google.com>, <ardb@kernel.org>,
        <ross.burton@arm.com>, <quic_anusha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20250207073926.2735129-1-quic_mmanikan@quicinc.com>
 <20250207073926.2735129-6-quic_mmanikan@quicinc.com>
 <ee166cf3-4486-4172-a510-bafa1624ab79@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <ee166cf3-4486-4172-a510-bafa1624ab79@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8uUAcfAcj6CylrdPtUO1K7NHTHtu96ta
X-Proofpoint-ORIG-GUID: 8uUAcfAcj6CylrdPtUO1K7NHTHtu96ta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_04,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_032801_459388_35A4E780 
X-CRM114-Status: GOOD (  15.59  )
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



On 2/10/2025 11:47 PM, Konrad Dybcio wrote:
> On 7.02.2025 8:39 AM, Manikanta Mylavarapu wrote:
>> From: Devi Priya <quic_devipriy@quicinc.com>
>>
>> Add a node for the nss clock controller found on ipq9574 based devices.
>>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>> Changes in V9:
>> 	- Rebased on linux-next tip.
>>
>>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> index 942290028972..29008b156a7e 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> @@ -1193,6 +1193,25 @@ pcie0: pci@28000000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		nsscc: clock-controller@39b00000 {
>> +			compatible = "qcom,ipq9574-nsscc";
>> +			reg = <0x39b00000 0x80000>;
>> +			clocks = <&xo_board_clk>,
>> +				 <&cmn_pll NSS_1200MHZ_CLK>,
>> +				 <&cmn_pll PPE_353MHZ_CLK>,
>> +				 <&gcc GPLL0_OUT_AUX>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <&gcc GCC_NSSCC_CLK>;
> 
> This last clock doesn't seem to be used in the driver - is that by design?

Hi Konrad,

Initially, was under the impression that the GCC_NSSCC_CLK will be enabled by the Ethernet driver.
However, that is incorrect and this clock is needed for accessing the NSSCC block itself. Hence restoring this.

I will enable this clock by using the PM APIs (pm_clk_add()) in next version.

Thanks & Regards,
Manikanta.

