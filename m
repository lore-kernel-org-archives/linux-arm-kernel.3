Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71910D44C5D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHHyxMePqBdKnAeFR/9faD5DxG5+hRTAA8ppV4k9N0M=; b=EKFHqnTxem9HOoOoI4JSWdRfgm
	RIud+kWMf5cpEMkfTKiw5NBctypelm/6iSC/h99FbtD0YVUbj+gqocV7DpeieMhYdQhFoSXQOBl2D
	v5WVnqELOXttdViLZ/7dhgPQwKM6IKnkYyEFalnrOnOC+WRz01uovUJGULjIqt1mE27tNTyvJhGxc
	i+EqfTEQBJYMVvsEzfwiSpUvD4Ryp3KXzn2rmtt1tzF+Qq0GfahLzVl2xh0SAb/gZ5Fw7+oEXLmPn
	EQHeefMkTqnQpGnRGGRSK/ydsp8Wewx2M+nADQtXWrFWbOYzS2NZNOTx7Mc+B1AAr8h9uNtUfsaba
	UoJHPk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOjJ-0000000CXVn-0n8y;
	Thu, 15 Jan 2026 14:53:45 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOjF-0000000CXVC-2Qsi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 14:53:44 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42fbc544b09so722920f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 06:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768488819; x=1769093619; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mHHyxMePqBdKnAeFR/9faD5DxG5+hRTAA8ppV4k9N0M=;
        b=KMj3EruWdDRksnE4voYVOPXBHZUnOavMw92rOwXkXhq/uc4yQwcWA2OEYE20lvhSK/
         lAqA0aW5lHBD4OOu4Z+HcGalwe9JuXnyQn05zQtGew3fdIwoIP0xLHQRa01bBckXrkez
         sOjK+wP7AeQ6p7rYus6swinRgUHAJRm+yCDGh/Zai3BzgbdVMFJM5oZ6YhLhoXMBvjon
         efCu+c3LgXM8u6Yk3nr6PqivGVUJ7PNnIT5rxeeZMa3n2F+PF08oEYSt1+fep8GdQnxU
         V9RU353NmhMlUTO1nIDnPSxHIFpRMC3FyFEcQXFwfOyKnl6oaUh60ZJgTwLmJbJLzsUt
         RJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768488819; x=1769093619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHHyxMePqBdKnAeFR/9faD5DxG5+hRTAA8ppV4k9N0M=;
        b=nn4YJ3NOi1mk9gYRQUUGBlybAf3adygfhLN2STHZN2XSQxqpTqRmdAc1gTU8UAtLbF
         OVxqwg+L+bdYrimQATNr0SdgB+nwvrcYMX710Cq2jLb4h7B49hpLP4rtjdzmLXoPNo91
         Rbgg8xQQSTOJxwz6L7ADwJaPUxDq2KA+e3dNU0qTF4KzbUMu7BqZ0kGK1c6y1urVOxjX
         W/QZrC68g+QS9KQXhdxsSMaO5MK+2bGpGvWGfECbFjgIP6kDVSa8TIjEG4j9N24Yr2cE
         dTc+j0/ZKXUQsYiX9uuH2p3vePURlNoBC0Stnn4r8s/9a9lc00F6xKW6XsmbVqTje9tB
         76yA==
X-Forwarded-Encrypted: i=1; AJvYcCVdHPwXkqHsjOdykk4xrmR4pZdTYMi9/MLWfUGAk8Y9V83UYkCJtOqfU4e9zjXRqKyt+fOXfrwz5P3Spc8tHZlF@lists.infradead.org
X-Gm-Message-State: AOJu0YzIrZziR43OI/yWalIFpZD27Vrkobm2tQGoHQWIXPuK6ioOf6Br
	8lV272wS0s0IfG963oJgR/gjjFRJj0L0Lo0zzmIjLJaywzPr/xjyRUZEY6Z42FJSE5o=
X-Gm-Gg: AY/fxX7Z7UYDjD7CSJMxcvrp6sLo6FfeG8Q4OxcPfWWuFaLIsT8KWfjjLjqyXpc7s3o
	ny8FC58/qE5VGFzV3WlXjN6cHhB+wDpDZbZ61N8HSoL0vc6SQfIN+sm5wGeGfjgBzysqX1Z3HJY
	ksRRLmieKEB/kHiVXGFB3533Ba/ArO0TBKTLHuNZttkg7afVGTE6yJTEmd1TLN+iqWbHMsoqeEK
	s42OaMBDltSTQ2wZJZNSLA69vQGehfi/+77EqjtNba81bRjvlBtXB9anDlxCI2YIaE4o/GUMsHc
	8vWIAD02NdTwGdjNARrvr1ZS/9Ru+4Q0dg6dXDQyvspP/uiwLc+GjsXFyAzey6bwERcLuMUkGdr
	7Qcld0uRcZ8Bxt/EFjA60zC2NgGlItAKOwl4Du5LBOvpFjfNek5LwAyM9mviJcJ7SNBXY1vHq2M
	slWRM573AeccSfHiFmhg==
X-Received: by 2002:a05:6000:26c6:b0:431:9b2:61c8 with SMTP id ffacd0b85a97d-4342c4ee902mr8010060f8f.10.1768488819096;
        Thu, 15 Jan 2026 06:53:39 -0800 (PST)
Received: from [10.11.12.107] ([86.127.43.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6e09acsm6183638f8f.35.2026.01.15.06.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 06:53:38 -0800 (PST)
Message-ID: <200d34bf-150e-4f8a-b400-2f54863502ac@linaro.org>
Date: Thu, 15 Jan 2026 16:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] dt-bindings: mfd: Add Google GS101 TMU Syscon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, willmcvicker@google.com,
 jyescas@google.com, shin.son@samsung.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
 <20260114-acpm-tmu-v1-3-cfe56d93e90f@linaro.org>
 <20260115-slim-denim-potoo-cad9cb@quoll>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260115-slim-denim-potoo-cad9cb@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_065341_656607_047DFF40 
X-CRM114-Status: GOOD (  24.20  )
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



On 1/15/26 3:36 PM, Krzysztof Kozlowski wrote:
> On Wed, Jan 14, 2026 at 02:16:31PM +0000, Tudor Ambarus wrote:
>> Document the bindings for the Thermal Management Unit (TMU) System
>> Controller found on Google GS101 SoCs.
>>
>> This memory-mapped block exposes the registers required for reading
>> thermal interrupt status bits. It functions as a syscon provider,
> 
> I don't think this is syscon, but the actual TMU. Syscon is various,
> unrelated system configuration registers.
> 
>> allowing the main thermal driver to access these registers while
>> the firmware manages the core thermal logic.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  .../bindings/mfd/google,gs101-tmu-syscon.yaml      | 37 ++++++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/google,gs101-tmu-syscon.yaml b/Documentation/devicetree/bindings/mfd/google,gs101-tmu-syscon.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..6a11e43abeaa23ee473be2153478436856277714
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/google,gs101-tmu-syscon.yaml
> 
> Not MFD either, but soc.

You are right, it's not a syscon, it's just a normal thermal IP block
from which I need to access the interrupt pending registers.

Then I guess I shall describe the new binding in bindings/thermal/,
please correct me if I'm wrong.

> 
>> @@ -0,0 +1,37 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/google,gs101-tmu-syscon.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Google GS101 TMU System Controller
>> +
>> +maintainers:
>> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
>> +
>> +description: |
> 
> Drop |
> 
>> +  The TMU System Controller provides a memory-mapped interface for
>> +  accessing the interrupt status registers of the Thermal Management
>> +  Unit. It is used as a syscon provider for the main TMU driver.
> 
> No, it is not a syscon provider. Entire last sentence is incorrect. You
> must describe here hardware and this hardware does not provide any sort
> of syscon to any sort of driver.
> 

Indeed.

I'm going to link the ACPM TMU child node with the TMU node via a
"samsung,tmu-regs" property.

Some concern that I have is that I describe the clocks and interrupts in
the ACPM TMU child node. Usually the clocks and interrupts belong to the
node that contains the reg property. But I guess that's alright because
the interrupts property is expected to be in the node that the driver
binds to. For the clocks, by placing it in the ACPM child node, I allow
runtime PM to manage it.

Do you think the below description is accurate?

soc: soc@0 {
    tmu_top: thermal-sensor@100a0000 {
        compatible = "google,gs101-tmu-top";
        reg = <0x100a0000 0x800>;
    };
};

firmware {
    acpm_ipc: power-management {
        compatible = "google,gs101-acpm-ipc";
        /* ... */

        thermal-sensor {
            compatible = "google,gs101-acpm-tmu-top";
            clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
            interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
            samsung,tmu-regs = <&tmu_top>; 
            #thermal-sensor-cells = <1>;
        };
    };
};

Thanks!
ta

