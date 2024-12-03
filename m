Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1675E64ABB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVsAf3br7q2QiAZQkRJosEe0peHLoK9e9ACnt+YXgwE=; b=u+1pD8azmmfoEQGMr9pbp64QG1
	WXEQbripYi/6CPrMzr+xSQXsjchAsj46eEIOjPFQXYqyigIHVIW2eaoZj+qIFk/nxH//OIH+/Xtd/
	VIOsoCbNY0ZGTSrh/7EEKTVq9dXTM/TGTJLEUwNsPFgZGnbKE50TRpBMAKvTXD0O8dYmtwVnazyTM
	1D79ieOk5Rl8DaZNVaPY00gW3FtK1Ad+a6INwf+Xvns+psOh5LQcpCa64Q3HL8uFrPx87qltbcd4C
	b9pGFmTRACIMzJRQSooEruTQi7jN+9sWmyg3n0PZb0gHurp6lAHzouPl60Yzz53TFvAT83V1wdi1h
	KlemoABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIV0R-00000009xx6-2Rk9;
	Tue, 03 Dec 2024 15:40:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUxx-00000009xVW-47k7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 15:37:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37oIJJ008710
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Dec 2024 15:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WVsAf3br7q2QiAZQkRJosEe0peHLoK9e9ACnt+YXgwE=; b=XD/PUHdv0pH24DGj
	QktgXOvaT1YY7+tqc+sgFM6pJkrFYRvvxXEqjtw1dSD7jCicsW4iTFdW3HiSbkTV
	ASikHoLrlvz00Cm+zbDh1SHI6CQeEQiRIL9c2SSAekoxzsYOuw+w2DTtKzm612mk
	r/uu/ASE56q8BW3hia+/A2B42PTA7tN/HaR7r/2MCVY/V2/GeHeooLnZJlPI6eaj
	kAij6dxg7dAJiq1qGxSk+etXFAnwNzrDjI+vjitoWWqy038DcNEytwb14Vztyt2y
	Z6gLrF4nsybrJsXcqnbNlpmwFGPIhdlYlaxHydpZEaWCko4sD5fU5cdx2HAi1xpi
	yX/3Iw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437tstgg4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 15:37:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-7f8b37ede6bso5932932a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 07:37:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733240251; x=1733845051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WVsAf3br7q2QiAZQkRJosEe0peHLoK9e9ACnt+YXgwE=;
        b=XvUNMG2NbSvGUYqGsqlbQkQ/q9QXcSJqTnL4ZfYKZa4Sv63xruxwLCrXpUbfGkdTvl
         ydgRaz95M1z8MrZ4N9EtmpNGskm1oOUnj0RG/09JfkNko5W+wRgtrI2DUhKYlqgR9MWm
         xOkhsoTFzKp26zMkt8ZmwcctRDmDnpS8BX7t6qzNQyCVlOhMmOy0FbU7Q9JODAL312hB
         zulYu+ZpMWytWV4Ov/xGJfj1RiWm3hrMaihx1IRC7yyZ1xQYh9Or/wG2acMfvllVL8yc
         SLiEHdUDQzEL9bHWGSvPOmPFkP0t1EdKrB62C2dXIjnojLf5VtOc3Q4IXk/986km2716
         PQzw==
X-Forwarded-Encrypted: i=1; AJvYcCXfBCvlhmgU4D7qFv1VQRTBSAfNuFcSm+vnRv1HWTusTt9hufYIpZ3I49PehYSiuVrZFOKLWSMZobewLhf4gOX2@lists.infradead.org
X-Gm-Message-State: AOJu0YzE4bvcvkkYdi+YX9REBWSI8lo9cxDeSHLYM/MnWBQvYEPdCrS1
	znttN9Ul6txzoGJlFpGQSwo7CrFF+LnmzOzY93jvQFDBd1gCKoMjMqKyUU4V3Hg1o70443kwztl
	2UJVQcUqCX86Ufvz92rseX3/WOedTtlWXZPaiFlJlG0rAEyIoDkllaFQAz3sb3LP78bC4LNcDJw
	==
X-Gm-Gg: ASbGnctrXJnvi6hpKWV8qTwvWPyrCM4sVfdGCI+GifNKtO7AyvMZnhACWqJfEnFkwHs
	Xr27NdIdacphzKxM0M3qKfyoBlhqzma/jHrDWwfCWWXrcXrRJmp/bPYj8pq/toD4kxBVB1qo4zn
	vu9nJtYJqGTT+dmVcOp5lK/XKbO7jljWUfU4nC9eEwCKVtNJx+CLinFjCaFVRiRA6X80zoCojgh
	V8D5vnWo70hmDwMX5aYAb6QU+haMKu8CpJ7aIq7Z4yxV7Kx0JzP13HMlC57UqscBmSw//DbS0jW
	mY0ybMOGLhCa
X-Received: by 2002:a17:90b:4e90:b0:2ee:a58d:cd96 with SMTP id 98e67ed59e1d1-2ef01204128mr3593127a91.18.1733240250762;
        Tue, 03 Dec 2024 07:37:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1wCFkJuDY3iAo1YW3xzVreeVpHJUxKTejY6gq824aM6cXlEoKfgBRQ345ghJyDtEXjV2f1g==
X-Received: by 2002:a17:90b:4e90:b0:2ee:a58d:cd96 with SMTP id 98e67ed59e1d1-2ef01204128mr3593087a91.18.1733240250314;
        Tue, 03 Dec 2024 07:37:30 -0800 (PST)
Received: from [192.168.31.128] ([152.58.197.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee488af41dsm8955256a91.28.2024.12.03.07.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 07:37:29 -0800 (PST)
Message-ID: <41106fd7-5348-4d21-9ae7-8466f5634b4c@oss.qualcomm.com>
Date: Tue, 3 Dec 2024 21:07:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint readery
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Johan Hovold <johan@kernel.org>
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
 <Z07bgH5vVk44zuEH@hovoldconsulting.com> <Z07r3Upr50vLluyn@linaro.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <Z07r3Upr50vLluyn@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ftj9TqxSVVQp4XKpCnT5rTJQf-mGv1wJ
X-Proofpoint-GUID: ftj9TqxSVVQp4XKpCnT5rTJQf-mGv1wJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_073734_148668_6E3CB93B 
X-CRM114-Status: GOOD (  47.16  )
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



On 12/3/2024 5:00 PM, Stephan Gerhold wrote:
> On Tue, Dec 03, 2024 at 11:20:48AM +0100, Johan Hovold wrote:
>> [ +CC: Krishna, Thinh and the USB list ]
>>
>> On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
>>> The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
>>> multiport controller on eUSB6. All other ports (including USB super-speed
>>> pins) are unused.
>>>
>>> Set it up in the device tree together with the NXP PTN3222 repeater.
>>>
>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 +++++++++++++++++++++++++++++++
>>>   1 file changed, 48 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>> index 39f9d9cdc10d..44942931c18f 100644
>>> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>> @@ -735,6 +735,26 @@ keyboard@3a {
>>>   	};
>>>   };
>>>   
>>> +&i2c5 {
>>> +	clock-frequency = <400000>;
>>> +
>>> +	status = "okay";
>>> +
>>> +	eusb6_repeater: redriver@4f {
>>> +		compatible = "nxp,ptn3222";
>>> +		reg = <0x4f>;
>>
>> The driver does not currently check that there's actually anything at
>> this address. Did you verify that this is the correct address?
>>
>> (Abel is adding a check to the driver as we speak to catch any such
>> mistakes going forward).
>>
> 
> Yes, I verified this using
> https://git.codelinaro.org/stephan.gerhold/linux/-/commit/45d5add498612387f88270ca944ee16e2236fddd
> 
> (I sent this to Abel back then, so I'm surprised he didn't run that :-))
> 
>>> +		#phy-cells = <0>;
>>
>> nit: I'd put provider properties like this one last.
>>
>>> +		vdd3v3-supply = <&vreg_l13b_3p0>;
>>> +		vdd1v8-supply = <&vreg_l4b_1p8>;
>>
>> Sort by supply name?
>>
> 
> Ack.
> 
>>> +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
>>> +
>>> +		pinctrl-0 = <&eusb6_reset_n>;
>>> +		pinctrl-names = "default";
>>> +	};
>>> +};
>>> +
>>>   &i2c8 {
>>>   	clock-frequency = <400000>;
>>>   
>>> @@ -1047,6 +1067,14 @@ edp_reg_en: edp-reg-en-state {
>>>   		bias-disable;
>>>   	};
>>>   
>>> +	eusb6_reset_n: eusb6-reset-n-state {
>>> +		pins = "gpio184";
>>> +		function = "gpio";
>>> +		drive-strength = <2>;
>>> +		bias-disable;
>>> +		output-low;
>>
>> I don't think the pin config should assert reset, that should be up to
>> the driver to control.
>>
> 
> I can drop it I guess, but pinctrl is applied before the driver takes
> control of the GPIO. This means if the GPIO happens to be in input mode
> before the driver loads (with pull up or pull down), then we would
> briefly leave it floating when applying the bias-disable.
> 
> Or I guess we could drop the bias-disable, since it shouldn't be
> relevant for a pin we keep in output mode all the time?
> 
>>> +	};
>>> +
>>>   	hall_int_n_default: hall-int-n-state {
>>>   		pins = "gpio92";
>>>   		function = "gpio";
>>> @@ -1260,3 +1288,23 @@ &usb_1_ss2_dwc3_hs {
>>>   &usb_1_ss2_qmpphy_out {
>>>   	remote-endpoint = <&pmic_glink_ss2_ss_in>;
>>>   };
>>> +
>>> +&usb_mp {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&usb_mp_dwc3 {
>>> +	/* Limit to USB 2.0 and single port */
>>> +	maximum-speed = "high-speed";
>>> +	phys = <&usb_mp_hsphy1>;
>>> +	phy-names = "usb2-1";
>>> +};
>>
>> The dwc3 driver determines (and acts on) the number of ports based on
>> the port interrupts in DT and controller capabilities.
>>
>> I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
>> that would still be there in the SoC (possibly initialised by the boot
>> firmware).
>>
>> I had a local patch to enable the multiport controller (for the suspend
>> work) and I realise that you'd currently need to specify a repeater also
>> for the HS PHY which does not have one, but that should be possible to
>> fix somehow.
>>
> 
> I think there are two separate questions here:
> 
>   1. Should we (or do we even need to) enable unused PHYs?
>   2. Do we need to power off unused PHYs left enabled by the firmware?
> 
> For (1), I'm not not sure if there is a technical reason that requires
> us to. And given that PHYs typically consume quite a bit of power, I'm
> not sure if we should. Perhaps it's not worth spending effort on this
> minor optimization now, but then the device tree would ideally still
> tell us which PHYs are actually used (for future optimizations).
> 
> For (2), yes, we probably need to. But my impression so far is that this
> might be a larger problem that we need to handle on the SoC level. I
> have seen some firmware versions that blindly power up all USB
> controllers, even completely unused ones. Ideally we would power down
> unused components during startup and then leave them off.
>

This question might be a dumb one, if so please ignore it.

But if we skip adding unused phys in DTS node, the core driver wouldn't 
have access to all phys and we wouldn't be able to get references to 
unused ones (un-mentioned ones in DTS). So how can we power them off 
from core driver if we don't have reference to them ?

Regards,
Krishna,

