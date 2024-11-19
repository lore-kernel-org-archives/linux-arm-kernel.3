Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87705D60D1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 05:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hv1D952XZu0INoj8er13xPaMFhIq6jJe13wta8/S16o=; b=4FnPxw5N+WB4VhDAptIr8BpV5y
	zOqTmLP6e8+qB8+c9puxiUzJJIEA3vOddXnptPiSLRf3tpnZDEcOWq2VzrOJpcqp8dld+doEFfSoJ
	aXQ6WfSomFaeWgw4DVPr6suceijJD3EIWFwO4tqQub+nLcHv9rZKangrPjjPUrP/zHwvy0o8oqlqI
	JuLuEn5igPenPQe+45VcCO21lfuSuak0vPeW6xDxrc1ggv/hGFrJb2nlg0Ygo06T7m+C7OWqnpjsH
	HTQrBXZCuEWirYg3PNhlBbAfvbSffnksDt6YY3zJ7A4C64BusppnfaRRCpEQY5sYM19jIeI4pWuH+
	dZoWEFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDGRf-0000000BOwe-0CYV;
	Tue, 19 Nov 2024 05:06:35 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDGQi-0000000BOqQ-41wl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 05:05:38 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ea527ae14aso337159a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 21:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731992736; x=1732597536; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hv1D952XZu0INoj8er13xPaMFhIq6jJe13wta8/S16o=;
        b=cv5we7SZlL0Prrbt1dUq2zFOVO3d01qoTjlcejTTchWUU1ocmbB/IlBf325SKi8oOy
         jsJFM7RTdg0b+DHs0seQMPpwkjEorMdxpWODiABBFwKRPNXe+2XAa+VOPW7mMephl4N+
         rKzJBr0+I6xQWPL9rawOKXqy+tOFm2U+wjf7NK1tEyo7oNdgBwBhPv/X+rKkizt+1DLW
         nesTxh1ZfE7vGs1gUyeWjsc2u0yVsL020BdmSLXrUylk1N98HrKA2fD5xKoN1lK6aa5K
         QGGgrWStxRHue1AVKaABcbnFvEonJf/bKa9/NPA2pGW2bqnfuo+zAe/MvfSrVvCjVwE+
         3TPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731992736; x=1732597536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hv1D952XZu0INoj8er13xPaMFhIq6jJe13wta8/S16o=;
        b=EDQnIpwtrh+d9X2hIfqvoUUlOjXcMI79y/m5buxh7sYc3ovOvHl2RprupxhftIaYtZ
         SI3k2Jy13o5WZd2F9fsON4zXNwFKgS1uiv/pI3s2B+z1WwBKDJ7ssRnarRF5yVfS/a9C
         ODE+SfNQ9HNbuFKQ6AjZs8oPoavJtO7GrzsVWVoU67n+TSL0tSpLa91ym0wqWGgS8Q7C
         D1FWD1mabLK1nFCBxehgPkOpI1QsrkqivQcl2dk7VVV/JD5b++X5eFsI8otoY6DHVtBD
         uaGkWcxEMKPacxlTFeIv4f9tOB9pdwHTMeXpB83Bs+cp0k+FxBCsjaD19tzI8m9P/gz5
         HXAA==
X-Forwarded-Encrypted: i=1; AJvYcCW5Y7S8418b9+xIgNrAIA0lN7SfucscBy1Jdxf04k3sdidOCV8Sfuorl+pJ8QSUdH98vdMbk90Pp8JK2b5QgDKY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7O0MKQxZbEV4SvdymKwOQ9KmSdCyFro52LB+U91FqHUfWSvMa
	rVn8vUIRYkztxeEgFqDa4+yd2QO5I7iZl881GnoD7bdlXdtsMPpU
X-Google-Smtp-Source: AGHT+IFCnOMGgi+h5K1zmS9n4KartDEt6KlxQsyf77WKX1/k4ZXu/194Qh9Es/obgXJXAWt9Olaxbg==
X-Received: by 2002:a17:90b:3ec8:b0:2ea:aa69:1067 with SMTP id 98e67ed59e1d1-2eaaa691107mr2340690a91.3.1731992735860;
        Mon, 18 Nov 2024 21:05:35 -0800 (PST)
Received: from [172.19.1.43] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea2dd87897sm5559361a91.24.2024.11.18.21.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 21:05:35 -0800 (PST)
Message-ID: <9e7d23b2-4228-4694-b455-b32e4be7b1f9@gmail.com>
Date: Tue, 19 Nov 2024 13:05:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sudeep.holla@arm.com, arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
References: <20241119025954.4161-1-mjchen0829@gmail.com>
 <20241119025954.4161-2-mjchen0829@gmail.com>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <20241119025954.4161-2-mjchen0829@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_210537_000588_E5969BD9 
X-CRM114-Status: GOOD (  15.21  )
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


Hi:

I apologize for the oversight in my previous patch where I forget to 
include v3 in the subject line.

The content of the patch remains the same, only the version label has 
been corrected.


On 2024/11/19 上午 10:59, Ming-Jen Chen wrote:
> Add YAML bindings for MA35D1 SoC keypad.
>
> Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>
> ---
>   .../bindings/input/nuvoton,ma35d1-keypad.yaml | 69 +++++++++++++++++++
>   1 file changed, 69 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>
> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> new file mode 100644
> index 000000000000..9ccd81a2574d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Keypad
> +
> +maintainers:
> +  - Ming-jen Chen <mjchen0829@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/input/matrix-keymap.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-kpi
> +
> +  debounce-delay-ms:
> +    description: Debounce delay time in milliseconds.
> +    maxItems: 1
> +
> +  scan-interval-ms:
> +    description: Scan interval time in milliseconds.
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - linux,keymap
> +  - keypad,num-rows
> +  - keypad,num-columns
> +  - debounce-delay-ms
> +  - scan-interval-ms
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    keypad@404A0000 {
> +      compatible = "nuvoton,ma35d1-kpi";
> +      reg = <0x404A0000 0x10000>;
> +      interrupts = <79>;
> +      clocks = <&clk>;
> +      keypad,num-rows = <2>;
> +      keypad,num-columns = <2>;
> +
> +      linux,keymap = <
> +         MATRIX_KEY(0, 0, KEY_ENTER)
> +         MATRIX_KEY(0, 1, KEY_ENTER)
> +         MATRIX_KEY(1, 0, KEY_SPACE)
> +         MATRIX_KEY(1, 1, KEY_Z)
> +      >;
> +
> +      debounce-delay-ms = <1>;
> +      scan-interval-ms = <20>;
> +    };

