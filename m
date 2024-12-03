Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EEBE64A8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOK0liPv4TVk7FI2JPCBS/XyPbuhpQDC9APsqCH7Jao=; b=fkeEnMreuPnuFj1v/p9MgTbrE0
	5ZOtv6OSqADYCi1UMBVyR+jCjbUL7YQjb+dack7lGgmMFws9dV/CbDTkFRbg+bWyGKLNApw7Wy+ad
	W8SaKKeWXXSMFmj7AgshmHhzsI8nlU8fBGBOs13KRdBD0ANkuo2a1QwV6M9nGYeoDgSQTFi5XmZpy
	cCzgq3YAfuMF9U2wkSFjZX30oPsYntkgTb52ktlEGL9cl8di7heHBueVg4PqfWlUZC8N98gwHZqZV
	nEDqNtKTruEwZqci99kiq+QGmpAFzawNiZjD1rToMLbxdolaxAxUdmhSWo3CQXNN7bxDODXMCjoUb
	Jia7lpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISoy-00000009akC-11KJ;
	Tue, 03 Dec 2024 13:20:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISkb-00000009ZgR-3xzy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 13:15:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B36NDcv024766
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Dec 2024 13:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOK0liPv4TVk7FI2JPCBS/XyPbuhpQDC9APsqCH7Jao=; b=NWRDQpjo8TUHBjas
	6wX2UFGulEFhPXQSMbRpLfPTD1I/1wZFftSDrMMWOsCFa77vwY0ofW2H8UXvEvCX
	0Al3LihgCq0MfL5HQPskJmG8fVuof/orUbuzSF7f48+iclRS7b0O5cspzC95vsig
	X4qXnx3WFIAwttOIGJveva7EDwfI1G150HI1AnlYDNctZT2MIhsMt6moae9iemsk
	yM7puynGVQOmKqTBGHjTknwVptfOGOD9g55cDNtEpR2N0KZjhJY/sw7CPz+PPljs
	nQpb9WqcNZEhMrFh2NflwZEu10I0eb1Y4QFYFNWMlpjW6TbNuOc/x22qA4VWQKVS
	9Idqfw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vnyrykn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 13:15:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2eea74eb7e6so2585961a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 05:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733231734; x=1733836534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOK0liPv4TVk7FI2JPCBS/XyPbuhpQDC9APsqCH7Jao=;
        b=udTiDQn+sHoRAI25fNfzXjMM/G/JA/L/0FrzEWYdCqQkCUXHNh7NAiEiEPp3NUMOui
         LiH8LpoCxS8WtvrOZ9BRkN86i6jO0+oX90umFqlqSPrx68roDfep63E5dLrng+ziZPba
         s7475+VFLV5qzNWxvmbKt1M5hC4cBPnomHlhgIL7qiF0NGbiPEHueJmVGZ1H9n/HpYTJ
         uwdup4xBpWdqDI9Jf0AvxW2ErSPQVurGS44E+RI1DkPo2aFKuLWkRY873rbUwkOakTMv
         Moppsea0A6yyFrDBuHws1vqXv33fvTLTnHOV5fGLkeB2h3C27VlYTh10wM6ipyPw30aa
         wruw==
X-Forwarded-Encrypted: i=1; AJvYcCUyuIMAkDthmbAWYVRyjkKOXnXzY3kCD+8UUwGYsQaOsqhfKghZw1vXjM1PDxU+SqRtjHovAn2GV+4tZyQo+M3C@lists.infradead.org
X-Gm-Message-State: AOJu0YyZz++GMAe5MIk6pVDWAApI4FzKRHYIe3laIFC4j6OICC8HWXR2
	VoPMFQ/xCEsWccUWABLDGSJk30/kXofIORlL3ic+Yx/TwigUYWRhwv8wXfaoaB6lTHJfZ7I4/+a
	ZXvcoZTXPwd1j308vIu7ZASkD94HDEOt0YlPDgbq9Im18NVIRX2tc0xr4mUkhqzcKTiDVbKvUfQ
	==
X-Gm-Gg: ASbGncvPjX9nPmTAz6FD09Ba0wZkJ9CmrtA7VGPLqWQ+Wp7KvpPpclA7WzZK+E/XQ99
	Zb50E+e4uonxIovIUoojxyzrbq2eOz9HDlJPZAg4n4b5uQT7M6FuzCQS05e3xBV2BMS9BSwasjj
	yXOlASwhruaV89VaSHENFQVdS2EDgIEmX1T3S9cTAgcU64QTHDwLt4Z/6hpJ8OE57j3EpBkwC+X
	VwFK5PQlbkJq23gAn/G6ZEc2WvlNbQPwgUrAmdlPZJPNqOEQSIdLWcuIRvMGn+rhHYNrDbb9XPP
	gQRzvCqn6sje
X-Received: by 2002:a17:90b:1c10:b0:2ee:94d1:7a89 with SMTP id 98e67ed59e1d1-2ef011dedcemr3026482a91.1.1733231734088;
        Tue, 03 Dec 2024 05:15:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGw64pLfrf6J3m44FM7ZHDGjsd9KKn4g/o9z71wBvUR/1fQLyIXagLUL9Sj7vaQecZGFOnF7w==
X-Received: by 2002:a17:90b:1c10:b0:2ee:94d1:7a89 with SMTP id 98e67ed59e1d1-2ef011dedcemr3026432a91.1.1733231733653;
        Tue, 03 Dec 2024 05:15:33 -0800 (PST)
Received: from [192.168.31.128] ([152.58.197.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eea91a5ac8sm4722451a91.41.2024.12.03.05.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 05:15:33 -0800 (PST)
Message-ID: <d095ae2a-3f9d-464c-9dc8-a3e73eac6598@oss.qualcomm.com>
Date: Tue, 3 Dec 2024 18:45:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
To: Johan Hovold <johan@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@linaro.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <Z07bgH5vVk44zuEH@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -k_ZQK0KLxMoNotigq3-vnG6XXCPlyHe
X-Proofpoint-GUID: -k_ZQK0KLxMoNotigq3-vnG6XXCPlyHe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_051538_114450_D4D54C4B 
X-CRM114-Status: GOOD (  36.06  )
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



On 12/3/2024 3:50 PM, Johan Hovold wrote:
> [ +CC: Krishna, Thinh and the USB list ]
> 
> On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
>> The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
>> multiport controller on eUSB6. All other ports (including USB super-speed
>> pins) are unused.
>>
>> Set it up in the device tree together with the NXP PTN3222 repeater.
>>
>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 +++++++++++++++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>> index 39f9d9cdc10d..44942931c18f 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>> @@ -735,6 +735,26 @@ keyboard@3a {
>>   	};
>>   };
>>   
>> +&i2c5 {
>> +	clock-frequency = <400000>;
>> +
>> +	status = "okay";
>> +
>> +	eusb6_repeater: redriver@4f {
>> +		compatible = "nxp,ptn3222";
>> +		reg = <0x4f>;
> 
> The driver does not currently check that there's actually anything at
> this address. Did you verify that this is the correct address?
> 
> (Abel is adding a check to the driver as we speak to catch any such
> mistakes going forward).
> 
>> +		#phy-cells = <0>;
> 
> nit: I'd put provider properties like this one last.
> 
>> +		vdd3v3-supply = <&vreg_l13b_3p0>;
>> +		vdd1v8-supply = <&vreg_l4b_1p8>;
> 
> Sort by supply name?
> 
>> +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
>> +
>> +		pinctrl-0 = <&eusb6_reset_n>;
>> +		pinctrl-names = "default";
>> +	};
>> +};
>> +
>>   &i2c8 {
>>   	clock-frequency = <400000>;
>>   
>> @@ -1047,6 +1067,14 @@ edp_reg_en: edp-reg-en-state {
>>   		bias-disable;
>>   	};
>>   
>> +	eusb6_reset_n: eusb6-reset-n-state {
>> +		pins = "gpio184";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +		output-low;
> 
> I don't think the pin config should assert reset, that should be up to
> the driver to control.
> 
>> +	};
>> +
>>   	hall_int_n_default: hall-int-n-state {
>>   		pins = "gpio92";
>>   		function = "gpio";
>> @@ -1260,3 +1288,23 @@ &usb_1_ss2_dwc3_hs {
>>   &usb_1_ss2_qmpphy_out {
>>   	remote-endpoint = <&pmic_glink_ss2_ss_in>;
>>   };
>> +
>> +&usb_mp {
>> +	status = "okay";
>> +};
>> +
>> +&usb_mp_dwc3 {
>> +	/* Limit to USB 2.0 and single port */
>> +	maximum-speed = "high-speed";
>> +	phys = <&usb_mp_hsphy1>;
>> +	phy-names = "usb2-1";
>> +};
> 
> The dwc3 driver determines (and acts on) the number of ports based on
> the port interrupts in DT and controller capabilities.
> 
> I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
> that would still be there in the SoC (possibly initialised by the boot
> firmware).
>

The DWC3 core driver identifies number of ports based on xHCI registers. 
The QC Wrapper reads this number via interrupts. But these two values 
are independent of each other. The core driver uses these values to 
identify and manipulate phys. Even if only one HS is given in multiport 
it would be sufficient if the name is "usb2-1". If the others are 
missing, those phys would be read by driver as NULL and any ops to phys 
would be NOP.

Regards,
Krishna,

> I had a local patch to enable the multiport controller (for the suspend
> work) and I realise that you'd currently need to specify a repeater also
> for the HS PHY which does not have one, but that should be possible to
> fix somehow.
>  >> +
>> +&usb_mp_hsphy1 {
>> +	vdd-supply = <&vreg_l2e_0p8>;
>> +	vdda12-supply = <&vreg_l3e_1p2>;
>> +
>> +	phys = <&eusb6_repeater>;
>> +
>> +	status = "okay";
>> +};
> 
> Johan
> 

