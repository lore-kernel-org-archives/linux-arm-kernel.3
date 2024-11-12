Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFC3D41D60
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 06:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joM3NYmnrdckWAtqAAeMbz3+XvM8HAXjuHhuPldrIhQ=; b=Y5xj+HaefIQRLV9Q981V1xbj29
	cPJgFiT22rltGbSYmO4Zc4H19zdqlGcWUvJu/rhSJWHGNpd4RdQgbgWW0v6JrTbLLAcLMofx2SHp3
	AqKzSK+Km4hDQpi08B44q6MsrNs8StagQYrF2qpLolZaozDPsOhSVaPcA9OLC0fGIbNeR1SH5fLBa
	XEaHMleuuIsg/Cpcs7LMP/FAmz8cqXIZ5W7SSxCT6EMUAhfmfCSPxZm3p1ifSauw/PqLwPW8pRG3w
	0iuv8OUVooDqn1UfBUqcV7j3p374QyMnVUPiK42bsUyewzNxB0ijK7zIs2nlwQxmUm7y01/8A9if3
	A3nrwxag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAklU-00000002NQe-3D5q;
	Tue, 12 Nov 2024 06:52:40 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAkgq-00000002MuO-0giO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 06:47:54 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7f12ba78072so4007949a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 22:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731394071; x=1731998871; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=joM3NYmnrdckWAtqAAeMbz3+XvM8HAXjuHhuPldrIhQ=;
        b=iVdc+Hu+qyX7/6OOXENQTVgkYOvzWKlc/zVwaQt5qKjtkB4R0vwitT3vpSJZ8rWown
         0Z1ENK2yZTeO81HqWqyJ/FI5kNWS1ySEzYJ/SMIPr0mOCl65A1LfQlo9xhpRIRRq/pTL
         hd4LMNwrzvjsTbhbyn6uRAigdvL6OG2QSk/tYegX4TWZq6X5/qDa6mT0QhufBZORFtDL
         Mxl7p8VEGt2+Jy2l3U4FIGqFpu5oHNzMOtgHENYvHtwopV2cRSYQm0T9Zi1SRUACP9Qm
         32qeBXdGJn83HpQHkLv+g6tsn0hXNYUK6goLwrGolh3FYuQA5lPNozFuzmMbsv0E6aou
         FgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731394071; x=1731998871;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=joM3NYmnrdckWAtqAAeMbz3+XvM8HAXjuHhuPldrIhQ=;
        b=jU7O+LmjNXdnxJn5bQvz4Yl+bZ8nCBhETWPU26aTcYwEkcLYVpA5fir3kw4K7xad3I
         ugUn2BeM3QpG2xWAvHc5XSEkHwlZE+4nPpcKViHRFMVoAlh7NMj/G/BAb9SXiE9cOB/N
         2GPHbxpSjHgtXGHObrUfxgZw8fRsBX/QEKW36ze6InoiWGsrd/s5FTJpUhk+ktgGWU2N
         49SczjIsj1TH1o7FBwtsm52PRZIoXeORtPGSNWh6P4/ytGWazAJVFwm5w4jUVkNIpru6
         qGKUA0rq8uvPElqvNuRBTgwnCaAwXy6pa4lKYEMhikwEKthszB2yU0qQhmedwPNoZwlf
         we6w==
X-Forwarded-Encrypted: i=1; AJvYcCWRYFYf3vl2QH+6pT4w6xwbBwWx9Zep1oxwGDcoOsR/EnQ7KpFPpn0zPkl6Xk7Lq58aVpCi7Qob0k4WrLYDeKpe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Ddcnsh+yG3wy+mpBpXj8GsYmhgUrv9clM+OlHOO/RhOLgJ01
	2lSeb+n7CBlDHvsdQ5FhkpBDvf48h6y7L6lW0id9deY006MhsjoydN8/4h6y1g==
X-Google-Smtp-Source: AGHT+IGmt6jecpj8o1YtItnfhiloe15JbFW/GZxGthEiDM/nykWYtzusHMMBkQlC4Te2n8f4030aRA==
X-Received: by 2002:a05:6a20:3d88:b0:1d4:e68c:2eb9 with SMTP id adf61e73a8af0-1dc229afb71mr23328487637.20.1731394071234;
        Mon, 11 Nov 2024 22:47:51 -0800 (PST)
Received: from thinkpad ([117.213.103.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078cd28asm10382819b3a.85.2024.11.11.22.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 22:47:50 -0800 (PST)
Date: Tue, 12 Nov 2024 12:17:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: clock: actions,owl-cmu: convert to YAML
Message-ID: <20241112064743.7qriuo2f26yq4jev@thinkpad>
References: <20241107143431.728669-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241107143431.728669-1-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_224752_239398_4BD840E6 
X-CRM114-Status: GOOD (  29.51  )
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

On Thu, Nov 07, 2024 at 04:34:31PM +0200, Ivaylo Ivanov wrote:
> Convert the Actions Semi Owl CMU bindings to DT schema.
> 
> Changes during conversion:
>  - Since all Actions Semi Owl SoCs utilize the internal low frequency
>    oscillator as a parent for some clocks, require it.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks!

- Mani

> ---
> v3: list the headers in the description
> v3: match properties: order with required:
> v3: add clocks as a required property
> v3: drop unused example node label
> v3: use the preferred four-space indentation for dts example
> 
> v2: drop address and size cells from example
> ---
>  .../bindings/clock/actions,owl-cmu.txt        | 52 ----------------
>  .../bindings/clock/actions,owl-cmu.yaml       | 60 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 61 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt b/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
> deleted file mode 100644
> index d19885b7c..000000000
> --- a/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -* Actions Semi Owl Clock Management Unit (CMU)
> -
> -The Actions Semi Owl Clock Management Unit generates and supplies clock
> -to various controllers within the SoC. The clock binding described here is
> -applicable to S900, S700 and S500 SoC's.
> -
> -Required Properties:
> -
> -- compatible: should be one of the following,
> -	"actions,s900-cmu"
> -	"actions,s700-cmu"
> -	"actions,s500-cmu"
> -- reg: physical base address of the controller and length of memory mapped
> -  region.
> -- clocks: Reference to the parent clocks ("hosc", "losc")
> -- #clock-cells: should be 1.
> -- #reset-cells: should be 1.
> -
> -Each clock is assigned an identifier, and client nodes can use this identifier
> -to specify the clock which they consume.
> -
> -All available clocks are defined as preprocessor macros in corresponding
> -dt-bindings/clock/actions,s900-cmu.h or actions,s700-cmu.h or
> -actions,s500-cmu.h header and can be used in device tree sources.
> -
> -External clocks:
> -
> -The hosc clock used as input for the plls is generated outside the SoC. It is
> -expected that it is defined using standard clock bindings as "hosc".
> -
> -Actions Semi S900 CMU also requires one more clock:
> - - "losc" - internal low frequency oscillator
> -
> -Example: Clock Management Unit node:
> -
> -        cmu: clock-controller@e0160000 {
> -                compatible = "actions,s900-cmu";
> -                reg = <0x0 0xe0160000 0x0 0x1000>;
> -                clocks = <&hosc>, <&losc>;
> -                #clock-cells = <1>;
> -                #reset-cells = <1>;
> -        };
> -
> -Example: UART controller node that consumes clock generated by the clock
> -management unit:
> -
> -        uart: serial@e012a000 {
> -                compatible = "actions,s900-uart", "actions,owl-uart";
> -                reg = <0x0 0xe012a000 0x0 0x2000>;
> -                interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> -                clocks = <&cmu CLK_UART5>;
> -        };
> diff --git a/Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml b/Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml
> new file mode 100644
> index 000000000..1717099b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/actions,owl-cmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Actions Semi Owl Clock Management Unit (CMU)
> +
> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +description: |
> +  The Actions Semi Owl Clock Management Unit generates and supplies clock
> +  to various controllers within the SoC.
> +
> +  See also::
> +    include/dt-bindings/clock/actions,s500-cmu.h
> +    include/dt-bindings/clock/actions,s700-cmu.h
> +    include/dt-bindings/clock/actions,s900-cmu.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - actions,s500-cmu
> +      - actions,s700-cmu
> +      - actions,s900-cmu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Host oscillator source
> +      - description: Internal low frequency oscillator source
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@e0160000 {
> +        compatible = "actions,s900-cmu";
> +        reg = <0xe0160000 0x1000>;
> +        clocks = <&hosc>, <&losc>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 420d06d37..652c9822a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2016,7 +2016,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-actions@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/actions.yaml
> -F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
> +F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml
>  F:	Documentation/devicetree/bindings/dma/owl-dma.yaml
>  F:	Documentation/devicetree/bindings/i2c/i2c-owl.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

