Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8C4D10395
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 22:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBr4ic81vTmvN7XRQwq9YY3unq51MMimZGFmIhdyS1w=; b=KI+N1NgR3IfVreZbQjD+ETkqrh
	/rLRZNvinCzIYJFlCkWNNKWi5aXHo8fGQuqWS6r7is7dthv+4x6D4uoMWcxpESQ9XwDhD1AMo5zlj
	pT+Qw0vrflvgPKyP1klVsPZpYf6QebaYvNJyIUxBnEzfryjr7WgqMFp7uP5mEQGkF/dsl5S3uwk3n
	VXO8vm5UVf1NQ3em2RFoY4x2nQSgVirrLu3cihbo93o7gl044KMqJZFDGKQ6UDrN4S9j5/B91yVlB
	oCC3dVu+2YY8wjGG4h/AyHrutUXfAebOhVaXYH7n9SvnPzO5RguKEWAAWd4oFcI9Ja4o2oNHqmFDf
	gEgZKdIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t46dP-00000001zU3-3Sh0;
	Thu, 24 Oct 2024 22:48:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t46bo-00000001zJF-0svB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 22:47:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OLWwx1018676;
	Thu, 24 Oct 2024 22:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gBr4ic81vTmvN7XRQwq9YY3unq51MMimZGFmIhdyS1w=; b=By1e5e+5oNNn5nAO
	o43Ohiy+KFls7LGMpqKGgEyZIVm218pwmVrv3LSDPE4vS0J5XPESWklrJN63Ndex
	oEagm9Od3Muiy1wAQ0IinjyPHRh+uSSx8EcJKeuPxVuBxt+QxVwKKpBTcKDmFfwZ
	HTbgSwdWolvz3CvV7h+bxYl6FLOnnL19uW76q1Cyrm48N7CPGlZoNYPdcMVNdCbs
	l4CXWgU+TGHtswMPtsYVJfgKpexugDol9imBs39EDeMODVOht36fVj6ImDjk9eeM
	Smu6T3/dyqljrCrNyrO1QnjJurgYUFacr37IkIkv7eiKLdlhH5B9C0r2284ysToM
	ILu9Qw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em66f5r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 22:46:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49OMkc1v005480
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 22:46:38 GMT
Received: from [10.71.108.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Oct
 2024 15:46:37 -0700
Message-ID: <d6452efa-5d97-4c29-a2ea-8c97569dbdb5@quicinc.com>
Date: Thu, 24 Oct 2024 15:46:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] dts: qcom: Introduce SM8750 device trees
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rob Herring (Arm)"
	<robh@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Lee Jones <lee@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Will Deacon <will@kernel.org>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <172978739477.623395.5604249801475913676.robh@kernel.org>
 <3ca1f7e8-1204-4898-9e7e-cb6423c122cc@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <3ca1f7e8-1204-4898-9e7e-cb6423c122cc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 867ay8EuuWrW-d_ts8xBu19lu33tUxZV
X-Proofpoint-GUID: 867ay8EuuWrW-d_ts8xBu19lu33tUxZV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=856
 suspectscore=0 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_154712_297592_F22AC86A 
X-CRM114-Status: GOOD (  16.92  )
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



On 10/24/2024 10:22 AM, Konrad Dybcio wrote:
> On 24.10.2024 6:33 PM, Rob Herring (Arm) wrote:
>> On Mon, 21 Oct 2024 16:21:09 -0700, Melody Olvera wrote:
>>> This series adds the initial device tree support for the SM8750 SoCs
>>> needed to boot to shell. This specifically adds support for clocks,
>>> pinctrl, rpmhpd, regulators, interconnects, and SoC and board
>>> compatibles.
>>>
> [...]
>
>> New warnings running 'make CHECK_DTBS=y qcom/sm8750-mtp.dtb qcom/sm8750-qrd.dtb' for 20241021232114.2636083-1-quic_molvera@quicinc.com:
>>
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: domain-idle-states: cluster-sleep-0:compatible:0: 'domain-idle-state' was expected
>> 	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: domain-idle-states: cluster-sleep-0:compatible:0: 'domain-idle-state' was expected
>> 	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
> These were recently dropped across the board, please drop them
> here as well.

Ack.

>
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: pmic@7: 'eusb2-repeater@fd00' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
>> 	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: pmic@7: 'eusb2-repeater@fd00' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
> phy@ (as seen in x1e80100-pmics.dtsi)

Ack.

>
>> 	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-0: Unevaluated properties are not allowed ('vdd-l1-supply', 'vdd-l10-supply', 'vdd-l4-supply' were unexpected)
>> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-0: Unevaluated properties are not allowed ('vdd-l1-supply', 'vdd-l10-supply', 'vdd-l4-supply' were unexpected)

These actually needed to be combined; they should be 
vdd-l1-l4-l10-supply. Will fix.

>> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
>> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
>> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
> These need bindings updates

Agreed; this regulator is not documented correctly. Will address in a v2 ps.

>
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: 'power-domains' is a required property
>> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
> This I'll address when reviewing the dt

So for this, let me know if the following seems about right.
The rsc node needs a system-wide power domain defined. To accomplish 
this, I would define
a system_pd node and point both cluster pd nodes to it via 
power-domains, similar to what you did here:
https://lore.kernel.org/all/20240102-topic-x1e_fixes-v1-3-70723e08d5f6@linaro.org/

Then, extrapolating from that, I can define a system-wide idle-state 
under the domain-idle-state node as follows:
domain_ss3: domain-sleep-0 {
     compatible = "domain-idle-state";
     [...] (omitting a bunch of details, but you get the point)
};

And then point to that from the new system_pd node under the psci node:
system_pd: power-domain-system {
     #power-domain-cells = <0>;
     domain-idle-states = <&domain_ss3>;
};

And then of course in the rsc node, have power-domains = <&system_pd>;

Is that correct?


>
> [...] (skipping a bunch of duplicates)
>
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: timer@16800000: #size-cells: 1 was expected
>> 	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer_mmio.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: timer@16800000: #size-cells: 1 was expected
>> 	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer_mmio.yaml#
> #address-cells <2> is fine, #size-cells must be 1, apparently

Ack.

Thanks,
Melody

