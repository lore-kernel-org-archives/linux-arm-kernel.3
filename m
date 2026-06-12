Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30518CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 00:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDFF/uetcCRW1wRDCYb9fakGqH6rrdtEO+ThtsQms1Y=; b=3EatKGQcJx7NgpaM49f8R04QLb
	LqqyKNlLEUO+f6f4jB6KrnruP8a9E3oYHoUzoG4KhuINOwgZZQKhAyQAnjbD8TTje9XJzG1xycWZ8
	5pg/1zKu23Ofm7OkvGCLkw0Jb0HVc1bpj/jMGSUodSHzTj85BauzB/3j+hlIG45P0i8/x8+WzTAhC
	MBpqp5KXMbhSaI46v2haffsdt9QtBS91ktEQNDABOqjzOC1VkRyfcnw4hLzCrG+xksAkhQQO2pVhM
	8tbqh6xwe3IG908bYp495Nnq/zXQ3X0pgq6SsDCsMR2bqiTCUhmgDeQxb4vDa70Lo7RSdC2sSJQlM
	uVrfGgVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXppe-0000000ADqX-27Cw;
	Fri, 12 Jun 2026 00:33:10 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXppa-0000000ADqC-2f4C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 00:33:09 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c132ac5ec2so4263325ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 17:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781224386; x=1781829186; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PDFF/uetcCRW1wRDCYb9fakGqH6rrdtEO+ThtsQms1Y=;
        b=ILvrKXzFvprzUh2d8gp112sdw/fGebR5kNpNyuE2KBjPtjAh3Svo23vFbRn3dSvBDV
         6Zz3TWLQN5jWElusw+AJBr3EWKxlksFBMHIN/zKV5Bz6EUWVJ/ZndLOyDjTdQ1nBCURc
         /DtLDmMeJ9GkvKTFV+VLhhRMGezewp+SaHTRQK/I0cNnGeoR7BL9DOorRsmGKE3UpvQ4
         FwQLSnF/OC8buCLISDoI+PZtdDip4HomcttXwUxBRxq6VS/VLHqMoy2Y4LExVOGn3gOw
         usBYXlJk8Xic6dmkbOoikIEiQqsgjHkHD3qdNnrXq/8k+Gi8p2u/BS4xA5Bd34njNLBk
         cZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781224386; x=1781829186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDFF/uetcCRW1wRDCYb9fakGqH6rrdtEO+ThtsQms1Y=;
        b=ZpIDFxOF7blE4+NZRFnxQhfOu6riZGf6XKRmzRYCOmbvE7uGxALZ5jvnAFahDSVXTe
         CkFGG8Fv/5FE1fsWlrgTWriWPHl42oRs6n4eYoWAdlbzIrYEgBrib5Qorm+ghVRftuCE
         jRnp818vamP5V/01CjPX5g/wqqUJf0geP2l9bF6Pauh8xytW7RkDA1IF6xnkbAaZS1qD
         Pr61SBkcUbpp+G4xDuK6oAaqb14A61bZW2390YiPSKoCBdwm37D4+OCUqy3OY/Ir3V9n
         7rEhK3JEeQ7iRsGezHsWKWiJ1DOlxnp3NBzGRKVf4WCrW31pXjYErD4PuxGracGHYpK6
         4n/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+CojcZ8KC4umyvVOWkgdXeinJOHhBaqBJcv9VKK3pe2x/+Irwqx6fxFGidw/I5MDqN+/8WSyqfw7xBJfgZITck@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6osoOJrRtHD0jBTlSmyXws9pSEkMdHafkYnNN1Exq5kPcmTsS
	pIJ/Bhh0ET7D6JoesO65OlaoC0dmVW7aYOK4/1ZCa7Mb43om3vq0GZmi
X-Gm-Gg: Acq92OH3ijtzW9659zszpJdd9pFbUBav4ESN93nDlEUCOjT0X4sK7fBG+lpLF+nHn5F
	+uNY341ol1XQLHWAbzU4XfPV5V0CdKR7pIEOgwsxKObkYO1B28Jyer1Isu1AFVmCtCsVVg4AT6g
	NE8Kubp6HjOJtg0OPEHEU80uzaKONEkYrBGVulMJuKiZPKpQ5YC1MnVfB8pz/+rVvWvV1olt8oA
	R7E4DnwXh/weGS/y0m2emXjFdcSPgVAwM/PWN7vyAHtR3tZI6e+jKlj4iY2FmsJufxqOogTNgOw
	3WXtQ+opPN6sUAHvfHdcPmsIIi9t5O08nvWZsQNmW8VFbsz5oI1HE4p7elmkJk4xlrBluiRCh0/
	YlCY2CqhBayTUymJS8psBTdhduETH++opxQDh1XZyzYwk4OpkEZwEBbcy8APekp8mfJD1l4IcM+
	fBMmk6WTM/0AC0ZOW6Qr6yZUkJ1R9M94jklMiv7o4WxDK5lyWLiHBrdwd3dQIQLXzFFTelXJLtr
	RI=
X-Received: by 2002:a17:902:d58a:b0:2bf:21e6:baee with SMTP id d9443c01a7336-2c411f73c91mr7474725ad.28.1781224385550;
        Thu, 11 Jun 2026 17:33:05 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6511sm1291275ad.24.2026.06.11.17.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 17:33:05 -0700 (PDT)
Message-ID: <0031379c-0cc3-40c8-8145-5b1991b42f05@gmail.com>
Date: Fri, 12 Jun 2026 08:33:01 +0800
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
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260611-decoy-glamorous-81903a5fd1f9@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_173306_679713_592B064A 
X-CRM114-Status: GOOD (  16.36  )
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

Thanks for the review.

I will add a default value for num-cs in v4:

   num-cs:
     maximum: 2
     default: 2

The controller has two native chip selects and the driver currently uses
that hardware default.

Best regards,
Chi-Wen

Conor Dooley 於 2026/6/12 上午 01:34 寫道:
> On Thu, Jun 11, 2026 at 05:12:45PM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add a devicetree binding for the Quad SPI controller found in
>> Nuvoton MA35D1 SoCs.
>>
>> The controller supports SPI memory devices such as SPI NOR and SPI NAND
>> flashes. It has one register range, one clock input and one reset line,
>> and supports up to two chip selects.
>>
>> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
>> ---
>>   .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 62 +++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> new file mode 100644
>> index 000000000000..d3b36e612eb0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> @@ -0,0 +1,62 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-qspi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 Quad SPI Controller
>> +
>> +maintainers:
>> +  - Chi-Wen Weng <cwweng@nuvoton.com>
>> +
>> +allOf:
>> +  - $ref: /schemas/spi/spi-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-qspi
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  num-cs:
>> +    maximum: 2
> Missing a default of 2, unless you make the property required.
> FWIW, your driver doesn't appear to read this value.
>
> pw-bot: changes-requested
>
> Cheers,
> Conor.
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - resets
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        spi@40680000 {
>> +            compatible = "nuvoton,ma35d1-qspi";
>> +            reg = <0 0x40680000 0 0x100>;
>> +            interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clk QSPI0_GATE>;
>> +            resets = <&sys MA35D1_RESET_QSPI0>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +        };
>> +    };
>> +
>> -- 
>> 2.25.1
>>

