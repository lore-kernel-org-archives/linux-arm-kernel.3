Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0BBCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 01:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xD2K3MV/ImpTfNxgjLbCTNSQAYJN87stcDsw5szY+bI=; b=H2V2v6NNpCkv3+YRrAVGj++/1O
	ghLwt0gF1C7whpoGQc/OLtjPp7AKiRyAdzfjMfUlncNZnzCu5OE/gK285DpRbzsxViXW9aKdOhCVW
	h0aACffjeUMSax9PMSTNuPaIvf5iEGzr+2IgtentUmRDCHEQ7qLiZjy+hiTdfV/y2lpOYdphXx8T5
	wf97ZimBQvA7znXRAz0+pBPDYvpO8qoltaS706+oIRg6wLkyGNp8dWEyNnnry9TjLywTWftxGbnx8
	Hal2ytyv3wrX84skX4ZFTQ2gpgVLA/uwvKWq0jCJ0cyPKDry+zkEzlv1+f0xLf/POdCP01zRZMyxi
	OLVGCy0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYvy2-0000000DR7H-2s8V;
	Mon, 15 Jun 2026 01:18:23 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYvxy-0000000DR6w-3xGX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 01:18:20 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1397e093f90so1118649c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 18:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781486297; x=1782091097; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xD2K3MV/ImpTfNxgjLbCTNSQAYJN87stcDsw5szY+bI=;
        b=jURSIxqaiHKzbt2AsHKTlBUE5bwFY5N/0lJIMazs7UBpHdP1kBVqJo4hJpDvP1Xmcd
         BGZUtV2I2QddQhUxY1WDCqtr8ryow30uF/HiuOHsW1Agut4ZhiRTf7pfet71cbiQSSQP
         py9z5MQ6kOVSY1HbifizQI2mKzrtzQ1u/vV+9Ngwx/SfJG9B2MIKWGwUs/jtiZQx3ZfN
         sL9hJFDlrlTaaRosfKzwZKMIjgx8vMvFGKjkEEO5kqPFUgez5Z8NONqbhcu7g+MNKZOA
         2kZVwQYF6ZjgKRIgIUW8Lext5vfJp1/KcgB6M/qG25IxwFW2zo1MKG8sX0M8DN7zVdcl
         SkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781486297; x=1782091097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xD2K3MV/ImpTfNxgjLbCTNSQAYJN87stcDsw5szY+bI=;
        b=pxrvlQdSWP9Wmo6h9i4dhpkRSRQ/wq3QiJ6s0K5iOPft6u4zhpZcSTEMDjAs1ExUuH
         jGx05IilFRRHG1jKPusSDONfIAmcCLlOqz3zWV/tVLNiA42iDrl5NfR8wCd5LAf8RqDB
         D9yO7SjH7ze/kijJzhcv/LX+0w8rrS9uX3ej5APEW5S9nWBhmpF5ux2x6XTUQMNaBuTB
         b4Jq4W7mVdcR+W22qFlrOT1w10P6csC5+VvaYnF8Q4XPHsdALZ7V1FG/Lgh05t9PiazL
         J5b17BsI25O/HRt1fBiGfLSUCxYP83A6I3MrZ+qeFKtsON7TOCDHQ9L/JbkfdXdMRVQr
         VAyg==
X-Forwarded-Encrypted: i=1; AFNElJ+sFvscjDCkQWV3qzN9qu+7MTKrNbQABCfqWu+qDBLijUyFmc1hhUlAcdf3rpuQL0ii0ErDXLo64euKpH7+M3Jx@lists.infradead.org
X-Gm-Message-State: AOJu0YzE2Qj2h9ahwsnlmJf0lxOgO/aeyhBHBQCNCRwg7x+k9/2U77K9
	dFbxvJDlP1Lyjl8lKnihLtbvP03mbnTpu7mZ5mnj7GOVHZ/YtnbBiRAy
X-Gm-Gg: Acq92OFQ9rYYUaiwIw+DQJboN32D1bt2df6ZDfgvvm1rJlct93AN7TIqiD6hg5JBtwK
	uZyG/C6OxtYzt+6lh4ghd+oBha/eqAdRlSP5fXaBu0IXqko23ibtR4lUz3o7QsgpUwhn9O0+Cqm
	DQd2WtRkIPvgQgaOPZyj8svgP5p7Xhl/cn2hBZtx4Je/0N4V0Y70RBDgku3mkdHfRTolffP13vB
	e1ZfXquT+nTo+AyRAGAsA6PBizGbteVZmjhfnRLY7TE2Ao4mO0ylNUxDPsMeNl4zV12G+O4R9oB
	h5wQ2n8hd0vV/JIUirnPFVR/B1W20zx8J6kdXIgBPzkns+FSwYaT2HpmrhpT5fmcx/ofRNqP6s/
	O7SWvvckhI8raADQmfLyGLtqJoXreKaOAYDAiiOE36yYWu9AHORXrveIuXl5duqCQFIKU9fzD+x
	7qixLVr621nw/kv6CilI5JbwDQ7BgGUIiky58vQKSP5ZeU7/pUQLEVOypB28C0NAzVwJrf7bWY4
	yQ=
X-Received: by 2002:a05:7022:629f:b0:137:6bdb:5842 with SMTP id a92af1059eb24-1384b97f25bmr5877161c88.0.1781486297416;
        Sun, 14 Jun 2026 18:18:17 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b964862sm8982362c88.10.2026.06.14.18.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 18:18:16 -0700 (PDT)
Message-ID: <59dbf955-56d5-4d72-85ca-0ed8407de295@gmail.com>
Date: Mon, 15 Jun 2026 09:18:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton
 MA35D1 QSPI
To: Conor Dooley <conor@kernel.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260611091246.2070485-1-cwweng.linux@gmail.com>
 <20260611091246.2070485-2-cwweng.linux@gmail.com>
 <20260611-decoy-glamorous-81903a5fd1f9@spud>
 <0031379c-0cc3-40c8-8145-5b1991b42f05@gmail.com>
 <20260612-diagram-florist-01a0e8f923d8@spud>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260612-diagram-florist-01a0e8f923d8@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_181818_987544_59BB5BC7 
X-CRM114-Status: GOOD (  19.47  )
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

Hi Conor,

Thanks for the clarification.

I will make the driver read num-cs in v4 and fall back to the hardware
default of 2 when the property is not present. I will also keep the
binding default in sync with that behavior.

Best regards,
Chi-Wen

Conor Dooley 於 2026/6/12 下午 11:48 寫道:
> On Fri, Jun 12, 2026 at 08:33:01AM +0800, Chi-Wen Weng wrote:
>> Hi Conor,
>>
>> Thanks for the review.
>>
>> I will add a default value for num-cs in v4:
>>
>>    num-cs:
>>      maximum: 2
>>      default: 2
>>
>> The controller has two native chip selects and the driver currently uses
>> that hardware default.
> The driver should handle the property and fall back to the default.
> It's not complex to support, so surely there's no reason not to?
>
> Cheers,
> Conor.
>
>> Best regards,
>> Chi-Wen
>>
>> Conor Dooley 於 2026/6/12 上午 01:34 寫道:
>>> On Thu, Jun 11, 2026 at 05:12:45PM +0800, Chi-Wen Weng wrote:
>>>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>>>
>>>> Add a devicetree binding for the Quad SPI controller found in
>>>> Nuvoton MA35D1 SoCs.
>>>>
>>>> The controller supports SPI memory devices such as SPI NOR and SPI NAND
>>>> flashes. It has one register range, one clock input and one reset line,
>>>> and supports up to two chip selects.
>>>>
>>>> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
>>>> ---
>>>>    .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 62 +++++++++++++++++++
>>>>    1 file changed, 62 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>>>> new file mode 100644
>>>> index 000000000000..d3b36e612eb0
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>>>> @@ -0,0 +1,62 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-qspi.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Nuvoton MA35D1 Quad SPI Controller
>>>> +
>>>> +maintainers:
>>>> +  - Chi-Wen Weng <cwweng@nuvoton.com>
>>>> +
>>>> +allOf:
>>>> +  - $ref: /schemas/spi/spi-controller.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: nuvoton,ma35d1-qspi
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +
>>>> +  resets:
>>>> +    maxItems: 1
>>>> +
>>>> +  num-cs:
>>>> +    maximum: 2
>>> Missing a default of 2, unless you make the property required.
>>> FWIW, your driver doesn't appear to read this value.
>>>
>>> pw-bot: changes-requested
>>>
>>> Cheers,
>>> Conor.
>>>
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - clocks
>>>> +  - resets
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>>>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>>>> +
>>>> +    soc {
>>>> +        #address-cells = <2>;
>>>> +        #size-cells = <2>;
>>>> +
>>>> +        spi@40680000 {
>>>> +            compatible = "nuvoton,ma35d1-qspi";
>>>> +            reg = <0 0x40680000 0 0x100>;
>>>> +            interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
>>>> +            clocks = <&clk QSPI0_GATE>;
>>>> +            resets = <&sys MA35D1_RESET_QSPI0>;
>>>> +            #address-cells = <1>;
>>>> +            #size-cells = <0>;
>>>> +        };
>>>> +    };
>>>> +
>>>> -- 
>>>> 2.25.1
>>>>

