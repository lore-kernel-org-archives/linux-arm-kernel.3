Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7377BCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 13:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnFay5PIcb5rM2eujuo4gD1l7YH3IarEX6qo/MN+h1g=; b=AkHDXWpnf5qdHQiJT16tk1IJO0
	hVkA/MhYXkCH8s7FZK0cwN9wbrybOroxbMseGa0uf50goOKhFzKmp14mvFdcNvxG9QggVoid0UTxB
	2ueTzrUN6CTeqT1/0wYrMpa5JgpU5CZPGZ101cQu19MSxjoEyrYjphpjUN+op3y3l8/j+Hoenszl3
	sCOd9RBK3151/l2PhJZsdMT7TpChzpiyNeM7h8CBXE17mnvPSV9VitbRyS6LMXaoXsNpWeZlfufrI
	hDuOKznJj98KGMS9S7ZzqOf6hp+UQJlyoVElfXLgWf1KuV7E16V1O4yJbbAJ1AjzFV7XcrJfNOT72
	KlFl3T/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVRQ-0000000HKAz-25Qo;
	Mon, 25 May 2026 13:34:00 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVRM-0000000HKA0-3Stk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 13:33:58 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-13621cca8f5so7679069c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 06:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779716036; x=1780320836; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnFay5PIcb5rM2eujuo4gD1l7YH3IarEX6qo/MN+h1g=;
        b=WCCDM17NDhmQnG40rYrmRu0a/pmQA4CExYuwEZpV96ONw/LtldV9CTsFpjd6xpIgci
         lo16lucOc54ZA9REexnhLlDd+4gRYwkOvoEbGRIbvOhnCeF9Ep3MX+q+cxyKBTZ15+7d
         oly+t5bZJRg64/IfIy7MvGGQIHE8YsF8pDn9pdwkWXUUSyvxZUBqG3038uyiosB7qjCp
         CcDQEeVhxV6pVgMPXQx2dYXBV+7OFTt5a+rLd3BEyJlbaE63wk+qUlCsUoKU53SRJnSV
         Kzki7F/WvPocYM661MQsgRf7ggsfzAeH4ebjMvUYlBdrAb9Y8iSSopSPvwqH0komSTIo
         vTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779716036; x=1780320836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WnFay5PIcb5rM2eujuo4gD1l7YH3IarEX6qo/MN+h1g=;
        b=b7eFbA/zIg94NbldSNIZC0W34k5SFsX6mDQVfjPu+TAfmMlPTICBu3WLo+KFjXqZSP
         xa3LPZG9EiJz2VdqoXEp1fORJegFGYJ77ev8fKetfwrI8dQyU8TA1F16utxE951kue17
         nuGpj3rtzRh+kq1ALhheGnSI1tTYae/lDqU6PcMdGrTEMMOeS8iOJpmmm6/HChUEdoGa
         iN4qWV6uJQd7rHG1ozbg8rRPxFROh+vb0M+RmU9COwxFpZyKqW9OJ+t/Pq1WHofQG+c4
         3G1+lfFozEMrxyb3tITAeh9OuYvGwysFtWt9eOJPaFEBJuXFR/yMh+ziZx5M4aDgSiB/
         F1fw==
X-Forwarded-Encrypted: i=1; AFNElJ8rMtQoEFvkKPuOJtWnWyzGSgu64W+gbFUxfbyMLhPbRoM6WyJAjNF+/R9OGlrIv04Lxl0kXTquoFG9N0gOJ1gr@lists.infradead.org
X-Gm-Message-State: AOJu0YwQRhc/dTGhxIH6tyBFp4bNxvO0YJQYbSmsDM5OyobeEq6vSUZ6
	WCToZVSGU3V2BLOQ05D2vO+ahiP2a+LwvYAtaFjqYkGlS8I6NSH2pcSv
X-Gm-Gg: Acq92OGrWF+uDxMkavHc1rg/7apx9XN6WTRdRgbozUCV0o7PP1Gp0SMEZ900iyiiiWI
	1fPdBZmr/q5nblvsNcBc6U6kPk+j29XfQqMOorIfI3XIvWa18BMsS5dzKY689pkgTPLcrbBEf+N
	dVq7tzYVtQWlY4hMr09y+V+5lwvEvdhVQsqbRG412CpDZ4LpBIcxTc0n3vDq0VBakA5lxZn8dG4
	le+1t5kVsynJX0FFcu7ahYNuAQO0li3fD09kmgAazzbBMJbdIdElnrbcU/8ggXqY3dQe2Rw29NZ
	Pp0IZPgosYHuChTblPj1OQ81Kq9aLtGaHfP/B7Yio8rhhmQaZGfZ8BfJGhkzh1qw+aL+h7eF4tX
	l9tZMcysQfS+VV0QO3Ho3QDooVsPIJRNXao4Jy9UAsmazYRWxoL5AT2ILiwM5LF5NkRG9xzoe0x
	vzwz3PRf3fJmGMaVaAbk6Z7nos6iiqsoVm+PDm
X-Received: by 2002:a05:7022:4393:b0:12a:949b:b9b with SMTP id a92af1059eb24-1365fb526d4mr5122952c88.23.1779716035456;
        Mon, 25 May 2026 06:33:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-136b3706ad6sm3785990c88.13.2026.05.25.06.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 06:33:54 -0700 (PDT)
Date: Mon, 25 May 2026 06:33:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Message-ID: <2571c780-7bb7-4519-92bd-52b82ae6a965@roeck-us.net>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-2-728e4b91fe81@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-macsmc-subdevs-v5-2-728e4b91fe81@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_063356_871036_FDF2A19B 
X-CRM114-Status: GOOD (  32.25  )
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

On Wed, Nov 12, 2025 at 09:16:48PM +1000, James Calligeros wrote:
> Apple Silicon devices integrate a vast array of sensors, monitoring
> current, power, temperature, and voltage across almost every part of
> the system. The sensors themselves are all connected to the System
> Management Controller (SMC). The SMC firmware exposes the data
> reported by these sensors via its standard FourCC-based key-value
> API. The SMC is also responsible for monitoring and controlling any
> fans connected to the system, exposing them in the same way.
> 
> For reasons known only to Apple, each device exposes its sensors with
> an almost totally unique set of keys. This is true even for devices
> which share an SoC. An M1 Mac mini, for example, will report its core
> temperatures on different keys to an M1 MacBook Pro. Worse still, the
> SMC does not provide a way to enumerate the available keys at runtime,
> nor do the keys follow any sort of reasonable or consistent naming
> rules that could be used to deduce their purpose. We must therefore
> know which keys are present on any given device, and which function
> they serve, ahead of time.
> 
> Add a schema so that we can describe the available sensors for a given
> Apple Silicon device in the Devicetree.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/hwmon/apple,smc-hwmon.yaml  | 86 +++++++++++++++++++++++++
>  .../bindings/mfd/apple,smc.yaml          | 36 +++++++++++

I see that the rest of this series is going to be applied. This patch
touches bindings in mfd, which I can not apply.

With the assumption that the patch will be applied through some other tree,
presumably mfd:

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter

>  MAINTAINERS                              |  1 +
>  3 files changed, 123 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> new file mode 100644
> index 000000000000..2eec317bc4b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/apple,smc-hwmon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SMC Hardware Monitoring
> +
> +description:
> +  Apple's System Management Controller (SMC) exposes a vast array of
> +  hardware monitoring sensors, including temperature probes, current and
> +  voltage sense, power meters, and fan speeds. It also provides endpoints
> +  to manually control the speed of each fan individually. Each Apple
> +  Silicon device exposes a different set of endpoints via SMC keys. This
> +  is true even when two machines share an SoC. The CPU core temperature
> +  sensor keys on an M1 Mac mini are different to those on an M1 MacBook
> +  Pro, for example.
> +
> +maintainers:
> +  - James Calligeros <jcalligeros99@gmail.com>
> +
> +$defs:
> +  sensor:
> +    type: object
> +
> +    properties:
> +      apple,key-id:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: The SMC FourCC key of the desired sensor.
> +          Must match the node's suffix.
> +
> +      label:
> +        description: Human-readable name for the sensor
> +
> +    required:
> +      - apple,key-id
> +
> +properties:
> +  compatible:
> +    const: apple,smc-hwmon
> +
> +patternProperties:
> +  "^current-[A-Za-z0-9]{4}$":
> +    $ref: "#/$defs/sensor"
> +    unevaluatedProperties: false
> +
> +  "^fan-[A-Za-z0-9]{4}$":
> +    $ref: "#/$defs/sensor"
> +    unevaluatedProperties: false
> +
> +    properties:
> +      apple,fan-minimum:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: SMC key containing the fan's minimum speed
> +
> +      apple,fan-maximum:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: SMC key containing the fan's maximum speed
> +
> +      apple,fan-target:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: Writeable endpoint for setting desired fan speed
> +
> +      apple,fan-mode:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: Writeable key to enable/disable manual fan control
> +
> +
> +  "^power-[A-Za-z0-9]{4}$":
> +    $ref: "#/$defs/sensor"
> +    unevaluatedProperties: false
> +
> +  "^temperature-[A-Za-z0-9]{4}$":
> +    $ref: "#/$defs/sensor"
> +    unevaluatedProperties: false
> +
> +  "^voltage-[A-Za-z0-9]{4}$":
> +    $ref: "#/$defs/sensor"
> +    unevaluatedProperties: false
> +
> +additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> index 0410e712c900..34ce048619f5 100644
> --- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> @@ -49,6 +49,9 @@ properties:
>    rtc:
>      $ref: /schemas/rtc/apple,smc-rtc.yaml
>  
> +  hwmon:
> +    $ref: /schemas/hwmon/apple,smc-hwmon.yaml
> +
>  additionalProperties: false
>  
>  required:
> @@ -89,5 +92,38 @@ examples:
>            nvmem-cells = <&rtc_offset>;
>            nvmem-cell-names = "rtc_offset";
>         };
> +
> +        hwmon {
> +          compatible = "apple,smc-hwmon";
> +
> +          current-ID0R {
> +            apple,key-id = "ID0R";
> +            label = "AC Input Current";
> +          };
> +
> +          fan-F0Ac {
> +            apple,key-id = "F0Ac";
> +            apple,fan-minimum = "F0Mn";
> +            apple,fan-maximum = "F0Mx";
> +            apple,fan-target = "F0Tg";
> +            apple,fan-mode = "F0Md";
> +            label = "Fan 1";
> +          };
> +
> +          power-PSTR {
> +            apple,key-id = "PSTR";
> +            label = "Total System Power";
> +          };
> +
> +          temperature-TW0P {
> +            apple,key-id = "TW0P";
> +            label = "WiFi/BT Module Temperature";
> +          };
> +
> +          voltage-VD0R {
> +            apple,key-id = "VD0R";
> +            label = "AC Input Voltage";
> +          };
> +        };
>        };
>      };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 51942a9a9b43..6e5e219c5fe6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2422,6 +2422,7 @@ F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
>  F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
>  F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>  F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
> +F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
>  F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>  F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

