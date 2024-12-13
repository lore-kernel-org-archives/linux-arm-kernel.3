Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC6FE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+NlxZSUAzQpw/DPspRPS0yu5G8WCJu2cZhtajXHw5A=; b=1UrMZQ7tYVDckWRwt+iaWyQ+GM
	dChLgZKe7RrQTFzN788uvR8vX/yw1D0/RYx/gh3eIrXF2XFg0SsvorMNWjkH8CyG2uvhIZUYFASUb
	l1ebhyZSscBX3bzXywrkwrUjOKbSIjcsjSayZJGtVKbGduAFw5sKbxIR7Aeq7TQf5aXV0rygKo9l7
	vgZPwmBgQMotN/W8t3k8YAtpZdbNnDLMf2yRKeCVU+28FfygOKlpfmrfdB6X3IImnW2j4nnOBendM
	357MeMJbugSDw83gh5QvWidD289i2F7ZLhnHgiozU3Rv4A7FnE6RIK0WB3JXKDGEJ7Yup50pRIr/U
	RHVR8oLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM5Qe-00000003nHp-3ewG;
	Fri, 13 Dec 2024 13:10:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM5Pa-00000003n9n-11tS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 13:08:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAjGHN030144
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 13:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+NlxZSUAzQpw/DPspRPS0yu5G8WCJu2cZhtajXHw5A=; b=PxfcN9+zbMYNg/5Y
	BYM0jLlVc/lfMy7ObXEe0jcFYlzYmHD51IPGj0UP3TYdyCBJf6J2iZVTsItua+cG
	WNlMDmfi+PaZfHvo/FOKvsiDqBkQtCYUju6kWIW2H79SCcKXlNPyMi0syqfahQeY
	4eMYiA9otzB6bTZwmDZb5AYQps3ET56SBvBpttCcFaGg04fwCi4brRaISy8HIiD8
	P+gECVXp1q/xB+EH9tIpmycOdBMXhfQ3rhSRmkS2zw1IeyRuNlnqk0XprPG/IC5B
	z8GtJFUUmzypD8SLN4F0Ew5Z0Ia5IYkSeXVfrMe6Ur9jp++ZpgpZ/1cG+/BzQPXK
	JJsIVQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgekwxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 13:08:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8824c96cdso4770236d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 05:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734095332; x=1734700132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+NlxZSUAzQpw/DPspRPS0yu5G8WCJu2cZhtajXHw5A=;
        b=tmesWUrCfm2CK2hCovymHgeX8EqD1GYZ4dkmBmm7AgYGlYyzM0WxvcmnaVMbsXBNM4
         O4eIQLCoXDZ7QzxxZyUNuJIZzl2MQaKumEZwUEHWXDSsZmfQBmcaNwDjjaIpxd8SmCtY
         vB5Hp0oG6LvQBr/LDh5v8uWTiNFjB+BI662o9Va1pltpkxCq0BSSBbvVYBuOsK33yFJ3
         SB5rDOLMLxt5jDpwehj7mO5DN0++2ytysdfhvH0GYbM7b3f/ap5exW8DhAl+jhlWVKzL
         D/cVmNJnRnj7V+hj61bYhCVChTkOp20tzGANKYmSPrNFU3rkPA7dUQNpVV5Abbkct+ay
         ZQxA==
X-Forwarded-Encrypted: i=1; AJvYcCXx1Vpu4lU+sb3dvxelvckHCzw+0mhk3hlEGsRhVrtGNaZ8+OGD9cbqLNceNs6PaGwMwJjL7QL0RyvcKuuRSWpg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8Rjc5SG3fVxIy1fo6CzntexTU1CRIFgOk0nsJVsZO7xCgtIDI
	Tgg1jIOvv4OKvIRLl7uMRiSZqs12X0UHSK3XrYMaCGraBg07P0YsB3xre0NdYEgMQs7B9tcznCl
	XbtZry8n5qj5obLaYNl/ugedHR8fPZQxM2/vlBxFkZMe/UvcLESUn2B7w546OPt8zD+4M7xUEoQ
	==
X-Gm-Gg: ASbGncsSHJrKVmZFhtpbOStq0/ouocC5J8jQPYE5Wm4ZxI93iLo0OxofDSC1S5njcj0
	mc7TV83fwAGVRYBNo6D8Rm1uzYGkpIvtx/lx0INXuG1/KSjVENNYMbJkVWHYQdJDNw374ZzeNUU
	Jb8E0cHtVrbQXhY/K0J2NUgALjOVw/DFmC2JL+rrbRCHNQhfPcyr5o/IoecHW5w4iPHerQXouvg
	X8t2doJT30On+naoZslUCSUbghxri02bPHMtJ259cDH5fvaU384Ts9zwiEvKavYEvD3Wl01QzPB
	CoNK37IQ/GnEwGnnh5iHQ+GXT9eWE688bbuq
X-Received: by 2002:a05:620a:2482:b0:7b6:e9c0:9c3b with SMTP id af79cd13be357-7b6fbf08162mr129331985a.8.1734095331960;
        Fri, 13 Dec 2024 05:08:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFLzgc0KWUHtMB4AX6NRhGSzdp+8nXQHv2f9Rwn0/0hSQQwbzZVKV9uAlixhsyWs44W2qiZw==
X-Received: by 2002:a05:620a:2482:b0:7b6:e9c0:9c3b with SMTP id af79cd13be357-7b6fbf08162mr129329885a.8.1734095331458;
        Fri, 13 Dec 2024 05:08:51 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6ab44e881sm419566066b.26.2024.12.13.05.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 05:08:51 -0800 (PST)
Message-ID: <04e489be-231a-43b8-a701-1173ea744bae@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 14:08:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint readery
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
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
 <41106fd7-5348-4d21-9ae7-8466f5634b4c@oss.qualcomm.com>
 <Z08sMkbLF0b1DZTp@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z08sMkbLF0b1DZTp@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y6Xz3V7tZpqTwecrWFiWcrz-l8QkVmWZ
X-Proofpoint-ORIG-GUID: Y6Xz3V7tZpqTwecrWFiWcrz-l8QkVmWZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_050854_293330_6B7CA9E3 
X-CRM114-Status: GOOD (  33.94  )
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

On 3.12.2024 5:05 PM, Stephan Gerhold wrote:
> On Tue, Dec 03, 2024 at 09:07:22PM +0530, Krishna Kurapati wrote:
>> On 12/3/2024 5:00 PM, Stephan Gerhold wrote:
>>> On Tue, Dec 03, 2024 at 11:20:48AM +0100, Johan Hovold wrote:
>>>> [ +CC: Krishna, Thinh and the USB list ]
>>>>
>>>> On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
>>>>> The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
>>>>> multiport controller on eUSB6. All other ports (including USB super-speed
>>>>> pins) are unused.
>>>>>
>>>>> Set it up in the device tree together with the NXP PTN3222 repeater.
>>>>>
>>>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 +++++++++++++++++++++++++++++++
>>>>>   1 file changed, 48 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>>>> index 39f9d9cdc10d..44942931c18f 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>>>> @@ -735,6 +735,26 @@ keyboard@3a {
>>>>> [...]
>>>>> @@ -1260,3 +1288,23 @@ &usb_1_ss2_dwc3_hs {
>>>>>   &usb_1_ss2_qmpphy_out {
>>>>>   	remote-endpoint = <&pmic_glink_ss2_ss_in>;
>>>>>   };
>>>>> +
>>>>> +&usb_mp {
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&usb_mp_dwc3 {
>>>>> +	/* Limit to USB 2.0 and single port */
>>>>> +	maximum-speed = "high-speed";
>>>>> +	phys = <&usb_mp_hsphy1>;
>>>>> +	phy-names = "usb2-1";
>>>>> +};
>>>>
>>>> The dwc3 driver determines (and acts on) the number of ports based on
>>>> the port interrupts in DT and controller capabilities.
>>>>
>>>> I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
>>>> that would still be there in the SoC (possibly initialised by the boot
>>>> firmware).
>>>>
>>>> I had a local patch to enable the multiport controller (for the suspend
>>>> work) and I realise that you'd currently need to specify a repeater also
>>>> for the HS PHY which does not have one, but that should be possible to
>>>> fix somehow.
>>>>
>>>
>>> I think there are two separate questions here:
>>>
>>>   1. Should we (or do we even need to) enable unused PHYs?
>>>   2. Do we need to power off unused PHYs left enabled by the firmware?
>>>
>>> For (1), I'm not not sure if there is a technical reason that requires
>>> us to. And given that PHYs typically consume quite a bit of power, I'm
>>> not sure if we should. Perhaps it's not worth spending effort on this
>>> minor optimization now, but then the device tree would ideally still
>>> tell us which PHYs are actually used (for future optimizations).
>>>
>>> For (2), yes, we probably need to. But my impression so far is that this
>>> might be a larger problem that we need to handle on the SoC level. I
>>> have seen some firmware versions that blindly power up all USB
>>> controllers, even completely unused ones. Ideally we would power down
>>> unused components during startup and then leave them off.
>>>
>>
>> This question might be a dumb one, if so please ignore it.
>>
>> But if we skip adding unused phys in DTS node, the core driver wouldn't have
>> access to all phys and we wouldn't be able to get references to unused ones
>> (un-mentioned ones in DTS). So how can we power them off from core driver if
>> we don't have reference to them ?
>>
> 
> The question is not dumb at all, it's a very valid one. :-)
> 
> Perhaps it's easier if we keep them all listed on the USB controllers
> and have something else to mark them as unused. The downside of that
> option is that we might not be able to have a complete description of
> the PHY with all resources. For example on the CRD there is no eUSB
> repeater we could model for the first USB port (usb2-0), but it's needed
> to enable the qcom,x1e80100-snps-eusb2-phy.

So we have the choice between a silent failure or a loud non-failure wrt
acquiring the repeater.. not sure which one is better

Konrad 

