Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ED2D1171E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7IRHCiYcoaw9jtO5vigiOEHerBRKYUUQRuDw5/DXG8=; b=eY96inSJJFBhaeBfMcdLDhVzJU
	izC2PgQY9uwO1ibDzzDZ3FG1v8/rcpjcQBipxX1+/l5QP+Sd7+P/lzTLBZwIjgZrkgeG3eYSiQOs+
	V1MA0RgRTrSuMPVInqaU0KMu3Ycahn7yVQbvK+uqniKwlFuxDJaWwxmGQBPbKm/B8RLg3jY1kdjsA
	nxbl8lCm5sfptOxRM5nYj9+jlaIMgzR3WAULno7Nea/xg2eX5Gp4OM5fjmsGxu4aShGmF11yOHG3b
	XEXPVYDkH7UP4d1vvNsfeD3s7hPFauZPrUFZuYcOtH6zRH+KHdpPb9ypJDSSFDFTJVoUnF6McQPx+
	KIx6EjBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FXm-00000002xaq-1FkQ;
	Fri, 25 Oct 2024 08:19:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FPj-00000002wG5-35wG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 08:11:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OKIl7Y031140;
	Fri, 25 Oct 2024 08:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e7IRHCiYcoaw9jtO5vigiOEHerBRKYUUQRuDw5/DXG8=; b=K4fC/WGi98wX9uB2
	fVafKTflUfcRumDUUZjK6f1zEVy2DWxmhzgXpwbt16oDkFNfDbdAfTsWiDqJ67Ji
	7cF7LSMPzTmh5C+dh6ZATWB0bJqzRr/ZqhmBsHew+U1gDRsxZSqosWB0t+urFxRJ
	/bocPua1t7uWhEOGQbM1tFehAuy+YPNGPBFWcBFrUwTsf/jGthi8Vpz1btNlUEH8
	1wzPyXbxbIv4uFiNJWKaGAiJjDM78lxd9QVCWZ9t/j9REwqe/jwGnO37LPItMNbP
	5iU81YVFzcplE4iR5shl24Ggl3Y8xHI7Zl1XWBVboQqofAOA+u4Fxg9zpf8r9H22
	igl7sw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w09js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 08:10:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P8Auh2021635
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 08:10:56 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 01:10:49 -0700
Message-ID: <de0f9f1c-9d5e-492d-b7fa-cb7e9d05ae10@quicinc.com>
Date: Fri, 25 Oct 2024 16:10:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add initial support for QCS615 SoC and QCS615 RIDE
 board
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        "Will
 Deacon" <will@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson
	<andersson@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Swetha Chintavatla <quic_chintava@quicinc.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com>
 <172978739698.623494.13901719999982782781.robh@kernel.org>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <172978739698.623494.13901719999982782781.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CTbYYdIaI2Cq2J-7SVRATYo4BDz2HKXb
X-Proofpoint-ORIG-GUID: CTbYYdIaI2Cq2J-7SVRATYo4BDz2HKXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_011119_854289_0F8CEA1C 
X-CRM114-Status: GOOD (  24.82  )
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



在 10/25/2024 12:33 AM, Rob Herring (Arm) 写道:
> 
> On Tue, 22 Oct 2024 16:54:28 +0800, Lijuan Gao wrote:
>> Introduces the Device Tree for the QCS615 platform.
>>
>> Features added and enabled:
>> - CPUs with PSCI idle states
>> - Interrupt-controller with PDC wakeup support
>> - Timers, TCSR Clock Controllers
>> - Reserved Shared memory
>> - QFPROM
>> - TLMM
>> - Watchdog
>> - RPMH controller
>> - Sleep stats driver
>> - Rpmhpd power controller
>> - Interconnect
>> - GCC and Rpmhcc
>> - QUP with Uart serial support
>>
>> Bindings and base Device Tree for the QCS615 SoC are splited
>> in four parts:
>> - 1-3: Binding files for QCS615 SoC and PDC (Reviewed)
>> - 4  : Soc table entry (Reviewed)
>> - 5-6: Initial DTSI and RIDE board device tree
>> - 7  : Enable uart related configs
>>
>> Bindings Dependencies:
>> - watchdog: https://lore.kernel.org/all/20240920-add_watchdog_compatible_for_qcs615-v2-1-427944f1151e@quicinc.com/ - Reviewed
>> - qfprom: https://lore.kernel.org/all/20240912-add_qfprom_compatible_for_qcs615-v1-1-9ef2e26c14ee@quicinc.com/ - Reviewed
>> - tcsr: https://lore.kernel.org/all/20240920-add_tcsr_compatible_for_qcs615-v2-1-8ce2dbc7f72c@quicinc.com/ - Applied
>> - tlmm: https://lore.kernel.org/all/20240920-add_qcs615_pinctrl_driver-v2-1-e03c42a9d055@quicinc.com/ - Applied
>> - interconnect: https://lore.kernel.org/all/20240924143958.25-2-quic_rlaggysh@quicinc.com/ - Reviewed
>> - rpmhcc: https://lore.kernel.org/all/20241016-qcs615-clock-driver-v3-1-bb5d4135db45@quicinc.com/ - Reviewed
>> - gcc: https://lore.kernel.org/all/20241016-qcs615-clock-driver-v3-3-bb5d4135db45@quicinc.com/ - Reviewed
>> - rpmhpd: https://lore.kernel.org/all/20240927-add_qcs615_qcs8300_powerdomains_driver_support-v2-3-18c030ad7b68@quicinc.com/ - Applied
>>
>> Build Dependencies:
>> - tlmm: https://lore.kernel.org/all/20240920-add_qcs615_pinctrl_driver-v2-2-e03c42a9d055@quicinc.com/ - Applied
>> - rpmhcc: https://lore.kernel.org/all/20241016-qcs615-clock-driver-v3-2-bb5d4135db45@quicinc.com/ - Reviewed
>> - gcc: https://lore.kernel.org/all/20241016-qcs615-clock-driver-v3-4-bb5d4135db45@quicinc.com/
>>
>> Patch made the following verifications:
>> - Successfully passed dt_binding_check with DT_CHECKER_FLAGS=-m for earch binding file
>> - Successfully passed dtbs_check with W=1 for dts
>> - Verified CPU Hotplug, idle and online CPUs on QCS615 ride board
>> - Checked pinctrl-maps path
>> - Verified watchdog functionality with "echo 1 > /dev/watchdog", can trigger
>>    a watchdog bark and later bite
>> - Verified functionality with UART console on QCS615 ride board
>> - RPMH controller driver probed successfully
>> - Sleep stats driver probed successfully and checked qcom_stats
>>    node on QCS615 ride board
>>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>> Changes in v4:
>> - Configure vreg_l17a to High Power Mode (HPM) as it supplies power to UFS
>>    and eMMC, which can be utilized as boot devices.
>> - Link to v3: https://lore.kernel.org/r/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com
>>
>> Changes in v3:
>> - Added interconnect, GCC, RPMHCC, QPU, and RPMHPD related nodes for UART console
>> - Enabled UART condole on ride board device
>> - Link to v2: https://lore.kernel.org/r/20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com
>>
>> Changes in v2:
>> - Collected reviewed-bys
>> - Removed extra blank line
>> - Removed redundant function
>> - Renamed xo-board to xo-board-clk and move it and sleep-clk to board dts
>> - Renamed system-sleep to cluster_sleep_2
>> - Removed cluster1
>> - Added entry-method for idle-states
>> - Added DTS chassis type
>> - Added TCSR Clock Controllers
>> - Added Reserved Shared memory
>> - Added QFPROM
>> - Added TLMM
>> - Added Watchdog
>> - Added RPMH controller
>> - Added Sleep stats driver
>> - Link to v1: https://lore.kernel.org/r/20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com
>> ---
>>
>> ---
>> Lijuan Gao (7):
>>        dt-bindings: arm: qcom: document QCS615 and the reference board
>>        dt-bindings: arm: qcom,ids: add SoC ID for QCS615
>>        dt-bindings: qcom,pdc: document QCS615 Power Domain Controller
>>        soc: qcom: socinfo: Add QCS615 SoC ID table entry
>>        arm64: dts: qcom: add initial support for QCS615 DTSI
>>        arm64: dts: qcom: add base QCS615 RIDE dts
>>        arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS615
>>
>>   Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
>>   .../bindings/interrupt-controller/qcom,pdc.yaml    |   1 +
>>   arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 219 +++++++
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi               | 688 +++++++++++++++++++++
>>   arch/arm64/configs/defconfig                       |   3 +
>>   drivers/soc/qcom/socinfo.c                         |   1 +
>>   include/dt-bindings/arm/qcom,ids.h                 |   1 +
>>   8 files changed, 920 insertions(+)
>> ---
>> base-commit: de938618db2bafbe1a70c8fc43f06ccdd60364b2
>> change-id: 20241022-add_initial_support_for_qcs615-2256f64a9c24
>> prerequisite-change-id: 20240919-qcs615-clock-driver-d74abed69854:v3
>> prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
>> prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
>> prerequisite-patch-id: a57054b890d767b45cca87e71b4a0f6bf6914c2f
>> prerequisite-patch-id: d0c5edf9c06568ae2b3ffacba47e57ebb43acb15
>> prerequisite-change-id: 20240920-add_watchdog_compatible_for_qcs615-eec8a8c2c924:v2
>> prerequisite-patch-id: 3a76212d3a3e930d771312ff9349f87aee5c55d5
>> prerequisite-change-id: 20240911-add_qfprom_compatible_for_qcs615-e3b02f6fa71e:v1
>> prerequisite-patch-id: 8a2454d5e07e56a6dd03f762f498051065635d85
>>
>> Best regards,
>> --
>> Lijuan Gao <quic_lijuang@quicinc.com>
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y qcom/qcs615-ride.dtb' for 20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com:
> 
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000: 'clock-names' is a required property
> 	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
> 
Got it, it will be updated in the next version, thanks!
> 
> 
> 
> 

-- 
Thx and BRs
Lijuan Gao


