Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115B8CE8E9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmVEUo/xABf7aaYqxBjxjdmRkGZGXBcqXrb3toHDVYI=; b=v/5L8AID2TI8++15ftguzQbORq
	/sDGwxIeHUOGcsiCunq7AwlBZEeENKx5EwGZSWDJu6RMc2rW8dYpKCmVr2HjYMy/tmdcBZK1qFgP0
	aYwDZN5quHhohudoTGjgjDX2j8joX66uhRmfZ1kjpuaX2KEXgNR3/OrbJIJixSO4xJ59O79Vk6ujH
	1C6zp27w0Ng9dLBRbSASx0OHQ/85825iNh4pY8L+BC9MS+VwS6e+SiitWrWSmK/m6ZW6Xe8iej2d0
	FMl57+Dh263ohFg+oME6nlx2dWii5w6lOyqKVUioVWU7gt+KgwK712wSc+70jc38UAeG7+uEooD8p
	WMtqYGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41rG-00000001KD4-1tEQ;
	Thu, 24 Oct 2024 17:42:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41XO-00000001GR8-33V2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 17:22:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O8sxtK007551
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 17:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xmVEUo/xABf7aaYqxBjxjdmRkGZGXBcqXrb3toHDVYI=; b=JMioIBhJuSq3cCQI
	HoCmlzvjHhLaERswC8WRy2RrY6SdtQ/f+CH7XhBWAYRMWLCyXHFVjuRznquDJ5OO
	gbneUnpZMCUlw4BiewSiT9G2aODo2jwYiTepo0sg5bArwlaXoCqC/Bri863KUj4E
	YA2wqAQ2AGbXur4eeSdSchPPd2qcgmEnU9Dgz0NAA+tnjh7FU4rYenCp0FgcCwTz
	fSnqkZdH9RWegeVtrdpa876Befn/YWgopalZLRMLoIHQe6pt4On40E4Xjq5u7+PU
	aInmLGWr+XgYuDSa39KCq1IYZr194g+CQBUuDLa78VFfSeYjk6otbjmO4Tc3AIH3
	ppiA4A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fk52hbvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 17:22:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbccc4fa08so1463116d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 10:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790534; x=1730395334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xmVEUo/xABf7aaYqxBjxjdmRkGZGXBcqXrb3toHDVYI=;
        b=wRgKgyWLO+lrNvD4co8FzjfrN02hB23quSOPWfynhDvO1WdoZBp7+BKajzOi9uWvaN
         JI4Vi9EtXliVuINkFCYT+0RHpyhGN5LhRHIB+fL4xXZ4/DZWu8KtCbJve/SkO6c1nZ70
         yGWbvlGtQael0Qrih7Ke7NYkANZDvl+Wl9hZTvZqwRgGvtLPidNLBSDguMbakd80tc9y
         9m0RYgjR4WCNJz7CORI0wUvGPzUWtuTnZvIKOhDe2njE7a86CtbbiYToEmtj6IC5r9pF
         mUENaAELuolbW7uIYd2idop+CZvodvkH9RR9Q9dEGHKqwSb+lok0dSziDInLyAXjxFdo
         2yMw==
X-Forwarded-Encrypted: i=1; AJvYcCVe4UhGfM+W6sQD/Ldqj8StgIpwaJnoFyh6g3+LkjuX5WEFQabTpYtI1kaRdp4zG+3Gq+xrasmUaK+1Q38Hkce1@lists.infradead.org
X-Gm-Message-State: AOJu0YwWoP5mEnGzBy+soHtTqlauTLJvc4C1IY/EZO1hF0M7r673XTLd
	FZtcZGi8/TLOd4AChICjmy0hNuqiJLm1egHVT9x8cXxrmRdmv9f69HTeYQW7fm1nUWZHdtt95Sf
	UVbuhm20QPBagEzpVHaeTZcxaD7VHvfGtHNWuixHpujS9RqrID0klm/k6ZG353ScXvp2KJytzww
	==
X-Received: by 2002:ad4:5d67:0:b0:6bf:6d90:c084 with SMTP id 6a1803df08f44-6ce3413aee0mr45567446d6.3.1729790533885;
        Thu, 24 Oct 2024 10:22:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmDElvF4WY48ZSYmmi6ZIlDkPoW8/hW61PfyViulWHB9Uu9cc4VmhgeqWWdIDvsMeYtmFOgg==
X-Received: by 2002:ad4:5d67:0:b0:6bf:6d90:c084 with SMTP id 6a1803df08f44-6ce3413aee0mr45567156d6.3.1729790533451;
        Thu, 24 Oct 2024 10:22:13 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d63b1sm645658266b.42.2024.10.24.10.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 10:22:13 -0700 (PDT)
Message-ID: <3ca1f7e8-1204-4898-9e7e-cb6423c122cc@oss.qualcomm.com>
Date: Thu, 24 Oct 2024 19:22:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] dts: qcom: Introduce SM8750 device trees
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Will Deacon <will@kernel.org>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <172978739477.623395.5604249801475913676.robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <172978739477.623395.5604249801475913676.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3IEcuS78XANEKLTIvYFJADWlCIp8NNP9
X-Proofpoint-ORIG-GUID: 3IEcuS78XANEKLTIvYFJADWlCIp8NNP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=678 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_102218_925084_15669079 
X-CRM114-Status: GOOD (  14.55  )
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

On 24.10.2024 6:33 PM, Rob Herring (Arm) wrote:
> 
> On Mon, 21 Oct 2024 16:21:09 -0700, Melody Olvera wrote:
>> This series adds the initial device tree support for the SM8750 SoCs
>> needed to boot to shell. This specifically adds support for clocks,
>> pinctrl, rpmhpd, regulators, interconnects, and SoC and board
>> compatibles.
>>

[...]

> New warnings running 'make CHECK_DTBS=y qcom/sm8750-mtp.dtb qcom/sm8750-qrd.dtb' for 20241021232114.2636083-1-quic_molvera@quicinc.com:
> 
> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: domain-idle-states: cluster-sleep-0:compatible:0: 'domain-idle-state' was expected
> 	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: domain-idle-states: cluster-sleep-0:compatible:0: 'domain-idle-state' was expected
> 	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#

These were recently dropped across the board, please drop them
here as well.

> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: pmic@7: 'eusb2-repeater@fd00' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
> 	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: pmic@7: 'eusb2-repeater@fd00' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'

phy@ (as seen in x1e80100-pmics.dtsi)

> 	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-0: Unevaluated properties are not allowed ('vdd-l1-supply', 'vdd-l10-supply', 'vdd-l4-supply' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-0: Unevaluated properties are not allowed ('vdd-l1-supply', 'vdd-l10-supply', 'vdd-l4-supply' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#

These need bindings updates

> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: 'power-domains' is a required property
> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#

This I'll address when reviewing the dt

[...] (skipping a bunch of duplicates)

> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: timer@16800000: #size-cells: 1 was expected
> 	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer_mmio.yaml#
> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: timer@16800000: #size-cells: 1 was expected
> 	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer_mmio.yaml#

#address-cells <2> is fine, #size-cells must be 1, apparently

Konrad

