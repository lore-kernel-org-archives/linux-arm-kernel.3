Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6656E77171
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqbqqcJulAmbWewF5le6MsZzz4kokdCOT6f67ZVo8NM=; b=iuDAbsb42xqZjlwp4xA8J6756S
	qj+C8fqOAoAb1fuRiTaJGX+OcBwH4haBSb61onL723N5oFizUY4DL/YoFBBv/xojS9kgwO/2itoJi
	+fMRuAiwqbHeHKy+UidK8OemFDNWfaYWHWXw0+TkwseCjBx6PxdIcuu3o+MdEgD9QvU24tTw5sPFW
	wvlEWyv32+lvqzJJfvli2akGWnWqJd1C0lJFIoVH/HDC38/Im3Gj32N7CnSZ+6SoqrenWaUKHYKzP
	e7n2rjBjdxZhYAxfuw1HY7+PwC3pXY0QcMs7UsRLeaQ14Nc8DETuEHf6dKSRwH92DaaWy5dBlU9n9
	iW2P82BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6ps-0000000F6vU-26qp;
	Thu, 05 Dec 2024 08:03:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6oq-0000000F6ms-0Y9Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 08:02:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4Nt2s1014524
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Dec 2024 08:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqbqqcJulAmbWewF5le6MsZzz4kokdCOT6f67ZVo8NM=; b=ocVCW4fa/Q1LgQWQ
	bdgwCfPTS0t6awWhQu+TRKU6UgdPcDCIKYZJOgk7klFa0diIGbp5PXqQI45DRTgZ
	sUiE8NZU3LPNUWMlSRNjtzVu5ieuZy5FxJqMumDFC3iN+jcVZ0kOTnz/XDIkQyPa
	xcEiLlfxLj1iXnK7ECN+laP6mYq4RKwgqHfOupENK0LtGgZkWbrC3Y8C4xXXKH8O
	HpW0nrAp3/QCn7kAQp1I/MMBW9WBtoadx9PCPFrRj9AoblbXRWnGBemDMi8Y1Ok5
	mNtCXJQFFq/KY73YzNp/Ho55jvbdoyIanohg+c09hYupoVj8RynxEs30B6RB64lV
	X8rJEQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43b15d90cn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 08:02:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-7f71e2fc065so516723a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 00:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733385756; x=1733990556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqbqqcJulAmbWewF5le6MsZzz4kokdCOT6f67ZVo8NM=;
        b=UHclEfV5GiNyVwDQYREcg+p8eRu2ufATm2CuxVrortHv7ee0cpHXxSFNv93GbX2OwG
         +GgsnZSUTph8ssNo57o6jwKlQz9CiOAxnZa6IELL+1EeIQttIR8QOLzsy2zTYoLveGma
         d5n1qoc75Legl9Qy5k8OXRpEK6VMvGZJhli5c0MdkzvonvgTxlTlBPDOvjSK89jlo/pI
         tHFF0fjqL9vUlvNQDsnvAHGwi8NwDh6KU/gkOqu95Ys/eX+rUtQvxLPa/SucIPSxaMSi
         V7v0bhcASLKeMtWEOcnsXIaOTD4ieTTsvl5fIzxo2KylQUOdUcY6ZDPkOAO/1K1imoAq
         9KtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPt0erveq8Cwf4LnUm5NDAa+qmJoDPj07rp0XlHF//c6OCX/xDPEXavdffR4OeZq8jPRMy+fdzL3W9OY8AFKq+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8F0M0fyLeNaBABXkp0C+igAxIkphrxi5pKZwLKMIiC5DhHaJA
	URnoc6e71QpmWSfECwK5INUPCxvpdwc+ER5qeds9flYf+BXlkPIkzk+zgmDluRDsger5Y1XtU0t
	TmXiubgFpoWjm+kqo9I9M0+bEDR32peqlfbsvpV6Pmjr8EpQ+HwZZ9nz547UBdWOq8zTIlUORKw
	==
X-Gm-Gg: ASbGncvFWeVp0U6DDQvJk1L2eLyGI3UoXhikrpgXf/nubBY9RyJ0O7RvprWLEH3Q43q
	HjbWljGyKLGctmFCQ7Lvrv+1crJKjS1ENW6Q8KCdk3Dan7sFvs/Z8K1GMvjPuzgI5xuN9EWTXTi
	UQUutAJCR4xEviw5+kmk2N+76m8MIlDx3vaEs1vgCG3Phsz+u6WZG0LiD8JnlL66KeDipSIRsrv
	R9+j9EGn7fx0nWJYLxzoDUxla+js4Y1f+PkqnQEhjxK8yEPhK6RCcJ1lTAgLzZj7HxbcWruZ7br
	PPlQYg==
X-Received: by 2002:a05:6a21:3941:b0:1d9:3acf:8bdc with SMTP id adf61e73a8af0-1e165438833mr16445329637.46.1733385756351;
        Thu, 05 Dec 2024 00:02:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFerYsbdp1Pj/tRpDFeOsFzKZusCyeQcW368bYmYk17ZSI8YNxJAIjpZrugnZOIdSlvtWUTQQ==
X-Received: by 2002:a05:6a21:3941:b0:1d9:3acf:8bdc with SMTP id adf61e73a8af0-1e165438833mr16445278637.46.1733385755960;
        Thu, 05 Dec 2024 00:02:35 -0800 (PST)
Received: from [10.92.169.167] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd157b229csm735543a12.52.2024.12.05.00.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 00:02:35 -0800 (PST)
Message-ID: <98b2b88b-9690-44a7-9b22-2f23e6606e82@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 13:32:29 +0530
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
 <d095ae2a-3f9d-464c-9dc8-a3e73eac6598@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <d095ae2a-3f9d-464c-9dc8-a3e73eac6598@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: enRVRE_Xpmwr4tH3mlCxvJekdnKWlN-Y
X-Proofpoint-ORIG-GUID: enRVRE_Xpmwr4tH3mlCxvJekdnKWlN-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_000240_178913_062C25AA 
X-CRM114-Status: GOOD (  30.90  )
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



On 12/3/2024 6:45 PM, Krishna Kurapati wrote:
> 
> 
> On 12/3/2024 3:50 PM, Johan Hovold wrote:
>> [ +CC: Krishna, Thinh and the USB list ]
>>
>> On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
>>> The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
>>> multiport controller on eUSB6. All other ports (including USB 
>>> super-speed
>>> pins) are unused.
>>>
>>> Set it up in the device tree together with the NXP PTN3222 repeater.
>>>
>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 
>>> +++++++++++++++++++++++++++++++
>>>   1 file changed, 48 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts 
>>> b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>> index 39f9d9cdc10d..44942931c18f 100644
>>> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>> @@ -735,6 +735,26 @@ keyboard@3a {
>>>       };
>>>   };
>>> +&i2c5 {
>>> +    clock-frequency = <400000>;
>>> +
>>> +    status = "okay";
>>> +
>>> +    eusb6_repeater: redriver@4f {
>>> +        compatible = "nxp,ptn3222";
>>> +        reg = <0x4f>;
>>
>> The driver does not currently check that there's actually anything at
>> this address. Did you verify that this is the correct address?
>>
>> (Abel is adding a check to the driver as we speak to catch any such
>> mistakes going forward).
>>
>>> +        #phy-cells = <0>;
>>
>> nit: I'd put provider properties like this one last.
>>
>>> +        vdd3v3-supply = <&vreg_l13b_3p0>;
>>> +        vdd1v8-supply = <&vreg_l4b_1p8>;
>>
>> Sort by supply name?
>>
>>> +        reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
>>> +
>>> +        pinctrl-0 = <&eusb6_reset_n>;
>>> +        pinctrl-names = "default";
>>> +    };
>>> +};
>>> +
>>>   &i2c8 {
>>>       clock-frequency = <400000>;
>>> @@ -1047,6 +1067,14 @@ edp_reg_en: edp-reg-en-state {
>>>           bias-disable;
>>>       };
>>> +    eusb6_reset_n: eusb6-reset-n-state {
>>> +        pins = "gpio184";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-disable;
>>> +        output-low;
>>
>> I don't think the pin config should assert reset, that should be up to
>> the driver to control.
>>
>>> +    };
>>> +
>>>       hall_int_n_default: hall-int-n-state {
>>>           pins = "gpio92";
>>>           function = "gpio";
>>> @@ -1260,3 +1288,23 @@ &usb_1_ss2_dwc3_hs {
>>>   &usb_1_ss2_qmpphy_out {
>>>       remote-endpoint = <&pmic_glink_ss2_ss_in>;
>>>   };
>>> +
>>> +&usb_mp {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&usb_mp_dwc3 {
>>> +    /* Limit to USB 2.0 and single port */
>>> +    maximum-speed = "high-speed";
>>> +    phys = <&usb_mp_hsphy1>;
>>> +    phy-names = "usb2-1";
>>> +};
>>
>> The dwc3 driver determines (and acts on) the number of ports based on
>> the port interrupts in DT and controller capabilities.
>>
>> I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
>> that would still be there in the SoC (possibly initialised by the boot
>> firmware).
>>
> 
> The DWC3 core driver identifies number of ports based on xHCI registers. 
> The QC Wrapper reads this number via interrupts. But these two values 
> are independent of each other. The core driver uses these values to 
> identify and manipulate phys. Even if only one HS is given in multiport 
> it would be sufficient if the name is "usb2-1". If the others are 
> missing, those phys would be read by driver as NULL and any ops to phys 
> would be NOP.
> 

However do we need to reduce the number of interrupts used in DTS ?
We don't need to give all interrupts as there is only one port present.
We don't want to enable all interrupts when ports are not exposed.

Regards,
Krishna,

