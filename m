Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8219ED1CA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 22:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tt807o6JdzN3CcSuYLasKXg5k4EIONlXGEsrwB97bbM=; b=eMMh4w7tYDa/jIPuYG/d2fwNiA
	c4H2rGUxdfzAVKASK81j6GvMoX0gu8lgAfZJcnKUWhVaZwIvl4ncOu5GXmz6t2gvYF3UVVTVznLWn
	qU+9sVOL8Zb2DbGqYVOnlOXa+sQFWVNvd1XFK28r8MSmLgYFGn2RppTG1chyZyYx+sheH6QErwIxw
	w/uY+TvuKdQMRollxjPrDQZS2Znrk++Qz9j5YZDjDokQMUgwyKleCft81UsnEo8MkrowFjtjj+mUY
	UoTAL4HU8uJNU2i70t2YaLWzswd39VLjEt5VscviIVoBTu5ISxYnJBcgfVZY5HFtTpTnDdZzKHDhz
	0m/8rggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t85Qk-0000000FHa4-0FvP;
	Mon, 04 Nov 2024 22:20:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t85P1-0000000FHJz-1TAa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 22:18:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIoBV021589;
	Mon, 4 Nov 2024 22:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tt807o6JdzN3CcSuYLasKXg5k4EIONlXGEsrwB97bbM=; b=kjx+V1agbn3w4mi9
	NSSa5IOf6v0Efju6R9QMzXib47eobqFyF/LTxfCTQ07NneAiHf6w9W6CWAD1H6Jw
	YUG2r1QVgyH34tvO2ZjQUGsaLFlQP3RI+K2M4JMZBkyUtxW0VUzWO4uCf1+49xLa
	nUoDZLgHz/BXsinXWs/ej8/ivi52ZAHNK4iRAwaYk/rbD4/bG3IclkqoZZ7oAx8+
	egaYc4YjSAF9ZWHQ3JzKk4FTLVzodP8Apw33gqHis0558iKFNj2Z1DhFbjUOyYVt
	nm+pKxuqavzPLYBgqKBUOtp6pfVngz7TqNZC2cTUYjrzy1pb70R3EjgEzI1aD3dH
	jyN/ag==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ncyxwjk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 22:18:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4MIBOR013462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 22:18:11 GMT
Received: from [10.71.108.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 4 Nov 2024
 14:18:10 -0800
Message-ID: <a2d34549-b433-4126-b61b-912109de7d33@quicinc.com>
Date: Mon, 4 Nov 2024 14:18:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add base sm8750 dtsi and mtp and
 qrd dts
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
        Stephen Boyd <sboyd@kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>,
        "Satya
 Durga Srinivasu Prabhala" <quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jishnu Prakash
	<quic_jprakash@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <20241021232114.2636083-5-quic_molvera@quicinc.com>
 <c4407327-1060-4805-abb8-0c7bcb067ee4@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <c4407327-1060-4805-abb8-0c7bcb067ee4@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qihZL2cftjhuKzEzmqRwHr6EBJMQ36Gi
X-Proofpoint-GUID: qihZL2cftjhuKzEzmqRwHr6EBJMQ36Gi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_141827_561378_0CAFC6F4 
X-CRM114-Status: GOOD (  18.70  )
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



On 11/2/2024 2:36 AM, Konrad Dybcio wrote:
> On 22.10.2024 1:21 AM, Melody Olvera wrote:
>> Add base dtsi for the sm8750 SoC describing the CPUs, GCC and
>> RPMHCC clock controllers, geni UART, interrupt controller, TLMM,
>> reserved memory, interconnects, regulator, and SMMU nodes. Also add
>> MTP and QRD board dts files for sm8750.
>>
>> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> Co-developed-by: Jishnu Prakash <quic_jprakash@quicinc.com>
>> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
>> Co-developed-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
>> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
> [...]
>
>> +&spmi_bus {
>> +	pm8550ve_d: pmic@3 {
> These usually go to a separate file each.. But I see why that would
> be difficult here.
>
> Lately I've been a fan of <socname>-pmics.dtsi. WDYT, Bjorn?

SGTM, if Bjorn is fine w it, I can make that change; I'll do it similar 
to x1e80100-pmics.dtsi.

>
> [...]
>
>> +		apps_smmu: iommu@15000000 {
>> +			compatible = "qcom,sm8750-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>> +			reg = <0x0 0x15000000 0x0 0x100000>;
>> +
> [...]
>
>> +			#iommu-cells = <2>;
>> +			#global-interrupts = <1>;
> This is usually dma-coherent, you can determine that through a smoke
> test

Ah yes good catch; this is supposed to be dma-coherent. Will add.

>
>> +		};
>> +
>> +		intc: interrupt-controller@16000000 {
>> +			compatible = "arm,gic-v3";
>> +			reg = <0x0 0x16000000 0x0 0x10000>,     /* GICD */
>> +			      <0x0 0x16080000 0x0 0x200000>;    /* GICR * 12 */
> These comments are copypasted gen to gen and don't bring much
> information atop what's in bindings
>

Ack. Will remove.

Thanks,
Melody

