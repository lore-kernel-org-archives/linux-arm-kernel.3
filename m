Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154D5C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJ8X5HHLYHRd3Rsk9popednopgUL8bXt5+/MmAQMSNo=; b=Q56wY0sY7uBLxGJsyvQNCL1bu0
	FdpLoMoCb1lmVN3sZGP3i9bCqhI6lT3dNZGgq7a5ud7fM85JTZo4I1sAvga1TB4XRtcUwG8v9vJ1t
	5PiwRQMOPsQ5MotlTB9kDv0h67pYuMkX+8ePNJn9RqIJcfxV4SLP79xz0ZzUC1jFmXBMaZPME+JGv
	+unbb4vHSVdRY4AF3JaKNXhw8xPfm8+4rE1kI7wDPr7xijlpS6HlthiCOIUBOI13asrw6HWsOWioT
	oJFyhb9srkhS7LidmrdkFk6KzdSBQ7dmP0FGn9VV5RFEzepUv/nMgVRBnqEhJmerDsiMc0uFS699j
	n2Cv0hMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVlj-00000003g8Y-3DG5;
	Thu, 27 Aug 2026 08:47:31 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVlg-00000003g7o-3oSu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:47:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1465316f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 01:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787820447; x=1788425247; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJ8X5HHLYHRd3Rsk9popednopgUL8bXt5+/MmAQMSNo=;
        b=k7nnYkWPfRHx0UwVGvmQtP6qfFpgZJYeVVct3W5NimZWpAsUBMbQ+MPVCTJMNqGZEW
         Ajy4nk9jEM1avHV+uMyFYYHoZYQPi6CrtaRREN5sqhKYboLbspXc6uFRgESZeABmGIz4
         TGqrWS6kJv9dfLX1TBTqIwHn0rbhRpXp0HEePHNqjAmQDtAuIgu6GojqGEu5iyYbNV1q
         YgQLrMDY5PDEqz11hwitXo7qFSJv4kwLLCqiDETpKAXNhCxXLbz+7c8ZgKktBQhsEXzM
         QtOE/x1WeUl3xb2912MYRPlmu6h1JUQWksJTj2cO19kWbL4hyh6xzh1QJnWLr3ELv2tU
         Nhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820447; x=1788425247;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJ8X5HHLYHRd3Rsk9popednopgUL8bXt5+/MmAQMSNo=;
        b=kM730qvFIWWqLpkO871Zn2UY7MMJfHmI47UOUrZzDtzPOqCw55h6izXSm2IUnfSUlx
         UVRGnGb4IKUDJiXE/ODxOy0RS3fSIgyHRlfFHs6ojn52GQp/jZpy3qazuheT0cLDJR4z
         fycafe1y7mZtvdukgYEU26Cf3UgZlpi9RNPVjS1XNgQO0qynkD5kMSys3EYj/XxhEeSM
         +VuhyMuMnO17Lpld8DFA3g/A2/Efzi6a4yXelx5bUaCzGuu4L+mrLDTiRMdRfR/oST55
         nob7+HVliZH1KBSb/hkNzSfahBuQ6QX8V8JAgS+4VGE826BdA9D7d1+hNdNUCA+qS57p
         pkIg==
X-Gm-Message-State: AFuF++k4UeVVhQPLutTiTGkJ35KBK4bkWVWnINC3SYJgSJRZM06rWFpd
	bsOQnwzYnTmUIOfe2CnQAazRCyxCoD/j0sZ003l8qiYTZ8o62X0yUsW7BusWjGKbctoHuwl2Arf
	pXDbwo6U=
X-Gm-Gg: AR+sD11MBrP6+Lk6I1IWovu/7Ulc+tTkjFznGmk0xejHmgJb/ODIqtW2oFXt4jDMeKg
	Etu6fWVRlxPfEWMov/Uf4SpG1DJE+gv6BWQ8412Wq+tcdqPAHDz5tFSVNpKI6PnPL1eutQ7dFnX
	OP6x7xELuzSB0Ira7vJJuRfOazEJcm5YwFYs7fDQoCQ8LpFlPcPcNZAqV76w9PLSuS+dXrOMX2j
	0OxPNLGq0G1tcl/U9/isTSKmEKSkEaOV47pD05DDLLhShfIzZ0at+/jHDeNPpnYIj3thyE9Q5/Q
	yUD9io7eOwIN530wHxopV7bleabWCkTY480lK+52DPTqg6EOuavYSMC0yKDlPjQheHYPJSmxggr
	Qgmipqli1wsiUVCoFh6JHorEwrGaZ2fyNrRcJnLOn4iZyYbwbeP4tusxt/Jubh9aVgD6vh1DQ6S
	swpvY3GrhDiP+SwMQzcllvj7nzjTQdI8iQcZ7zTW4lOu8ncPADI83omnLBQbvaidz+9Itb
X-Received: by 2002:adf:e002:0:10b0:482:e1ce:d45c with SMTP id ffacd0b85a97d-482e26fbe90mr13212969f8f.21.1787820446621;
        Thu, 27 Aug 2026 01:47:26 -0700 (PDT)
Received: from [172.20.10.4] ([37.165.68.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dc134sm7420726f8f.20.2026.08.27.01.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:47:26 -0700 (PDT)
Message-ID: <7c6b5334-c0ce-42d5-8548-c025acdc895b@linaro.org>
Date: Thu, 27 Aug 2026 10:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Lucas Tanure <tanure@linux.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260818191159.11523-1-tanure@linux.com>
 <20260818191159.11523-2-tanure@linux.com>
 <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
 <6673edea-6822-4368-9374-29f92195fcf5@aliel.fr>
 <0969d872-faff-4b0f-81ad-972b7aa9bb7f@linux.com>
 <78721fe3-d9d0-4f85-a1ec-a01ebbf4f9a3@aliel.fr>
 <7c7f447d-8796-4f6e-b607-5251d9129665@linux.com>
 <5c8babac-0434-46fa-8919-a527d4179f7c@aliel.fr>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <5c8babac-0434-46fa-8919-a527d4179f7c@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_014729_009652_82701CCB 
X-CRM114-Status: GOOD (  28.42  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 8/25/26 10:54, Ronald Claveau wrote:
> On 8/24/26 11:32 AM, Lucas Tanure wrote:
>> On 24/08/2026 10:15, Ronald Claveau wrote:
>>> On 8/23/26 1:39 PM, Lucas Tanure wrote:
>>>> On 19/08/2026 08:25, Ronald Claveau wrote:
>>>>> On 8/19/26 4:39 AM, Xianwei Zhao wrote:
>>>>>> Hi Lucas,
>>>>>>
>>>>>> On 2026/8/19 03:11, Lucas Tanure wrote:
>>>>>>> uart_a lists the 24MHz crystal for all three of its clocks, because
>>>>>>> the T7 clock controller driver did not exist when these boards were
>>>>>>> added.
>>>>>>>
>>>>>>> That leaves the real UART bus clock without a user, so the kernel
>>>>>>> turns it off when it disables unused clocks at the end of boot, and
>>>>>>> the board hangs.
>>>>>>>
>>>>>>> Point uart_a at the real clocks, the way meson-s4.dtsi does, and drop
>>>>>>> the placeholders from the two board files.
>>>>>>>
>>>>>>> Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add
>>>>>>> initial device-tree")
>>>>>>> Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
>>>>>>> Signed-off-by: Lucas Tanure<tanure@linux.com>
>>>>>>> Assisted-by: Claude:claude-fable-5
>>>>>>> ---
>>>>>>>      arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>>>> | 2 --
>>>>>>>      arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>>>> | 2 --
>>>>>>>      arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4
>>>>>>> ++++
>>>>>>>      3 files changed, 4 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>>>> index cab2ee9ea0d3..dcbcd08a78b9 100644
>>>>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>>>> @@ -33,7 +33,5 @@ xtal: xtal-clk {
>>>>>>>      };
>>>>>>>
>>>>>>>      &uart_a {
>>>>>>> -       clocks = <&xtal>, <&xtal>,
>>>>>>> <&xtal>;
>>>>>>> -       clock-names = "xtal", "pclk", "baud";
>>>>>>>             status = "okay";
>>>>>>>      };
>>>>>>> diff --git
>>>>>>> a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>>>> index c41525a34b72..677069e58f30 100644
>>>>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>>>> @@ -266,6 +266,4 @@ &sd_emmc_c {
>>>>>>>
>>>>>>>      &uart_a {
>>>>>>>             status = "okay";
>>>>>>> -       clocks = <&xtal>, <&xtal>,
>>>>>>> <&xtal>;
>>>>>>> -       clock-names = "xtal", "pclk", "baud";
>>>>>>>      };
>>>>>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>>>> index cc371fcd1896..7847582e77ed 100644
>>>>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>>>> @@ -587,6 +587,10 @@ uart_a: serial@78000 {
>>>>>>>                                     compatible = "amlogic,t7-uart",
>>>>>>> "amlogic,meson-s4-uart";
>>>>>>>                                     reg = <0x0 0x78000 0x0 0x18>;
>>>>>>>                                     interrupts = <GIC_SPI 168
>>>>>>> IRQ_TYPE_EDGE_RISING>;
>>>>>>> +                               clocks = <&xtal>,
>>>>>>> +                                        <&clkc_periphs
>>>>>>> CLKID_SYS_UART_A>,
>>>>>>> +                                        <&xtal>;
>>>>>>> +                               clock-names = "xtal", "pclk", "baud";
>>>>>>>                                     status = "disabled";
>>>>>>>                             };
>>>>>>
>>>>>> I agree with moving the UART clock configuration to the DTSI file.
>>>>>> However, it seems a little odd to keep the XTAL clock definition in
>>>>>> the
>>>>>> DTS, as the alias may not be consistent across different boards, which
>>>>>> could result in compilation errors. Could we move the XTAL clock
>>>>>> definition to the DTSI as well, similar to other Amlogic SoCs?
>>>>>
>>>>> It seems similar to changes in this series :
>>>>>
>>>>> https://lore.kernel.org/all/20260420-add-bluetooth-t7-vim4-
>>>>> v4-0-9505df0e7016@aliel.fr/
>>>>>
>>>>> What do you think ?
>>>>>
>>>> Thanks for pointing out that series, though I wasn't aware of it.
>>>> And after reading I don't agree with it. The clocks are not redundant,
>>>> they are there because we agreed sometime ago that xtal belongs to the
>>>> board files.
>>>> So I still vote for my change in v2, that I will send in a few minutes.
>>>
>>> I don't get why it would be better to define the exact same clocks in
>>> each DTS file.
>>>
>>> The xtal recommended characteristics provided at the SOC level can be
>>> defined in the DTSI and overridden, if really necessary, in the DTS.
>>>
>> Hi Ronald,
>>
>> The preference for keeping xtal in board-specific .dts files rather than
>> the SoC .dtsi comes down to DT hardware modeling principles and upstream
>> maintainer guidelines:
>>
>> Hardware Topology: The xtal is physically located on the board PCB, not
>> inside the SoC silicon. The .dtsi file models the SoC silicon internal
>> architecture (clock controllers, IPs, registers), whereas .dts files
>> describe the physical board layout surrounding it.
>>
>> Avoiding Implicit Assumptions: Defining a default 24MHz xtal in .dtsi
>> assumes every T7 board will use the same oscillator configuration. If a
>> custom board design uses a different crystal frequency or an external
>> clock generator/TCXO, overriding a .dtsi-level node can lead to messy DT
>> overrides or silent clock rate mismatches if forgotten.
>>
>> Upstream DT Maintainer Policy: Kernel DT maintainers consistently push
>> to keep board-level hardware explicitly declared in the board .dts files
>> to reflect actual physical board components.
>>
>> That said, I acknowledge the trade-off is minor boilerplate duplication
>> across board DTS files. If the Amlogic SoC maintainers prefer setting a
>> default 24MHz xtal in amlogic-t7.dtsi to match older SoC generations, I
>> am open to updating it—provided the maintainers explicitly prefer that
>> tradeoff over strict DT topology modeling.
>>
> 
> Hi Lucas,
> 
> Thank you for this detailed explanation.
> I was referring to the last paragraph of the DTS coding style:
> 
> Hardware components that are present on the board shall be placed in the
> board DTS, not in the SoC or SoM DTSI. A partial exception is a common
> external reference SoC input clock, which could be coded as a
> fixed-clock in the SoC DTSI with its frequency provided by each board DTS.

This is what was done for qualcomm SoCs, we could do it for Amlogic aswell.

> 
> I understand going to strict topology is better, that means we must
> apply the same rules to new Amlogic SOCs, right ?
> 
> Do we need to move other clocks and assigned-clocks properties which use
> the xtal to the board DTS as well (such as clkc_periphs or sd_emmc)?
> 

No since it describes a SoC configuration using XTAL, it should be in the dtsi.

Neil


