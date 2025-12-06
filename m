Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A729BD3B7D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 11:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54ozK3Z1QShV9IRHsBfnCuV50Wy1Uh8rW7bx3u1PONQ=; b=EHfI84avMrmxOK7l/dxmwRrbjC
	ivR1408U2y+E9TwQM0gzkoTGC8fPhdqZ/fPPa+6CaGxYLaYNJT98l63UqXfqQv8sSn1R2xlMNV1s7
	rx0t3oM94752be6Md2Qv8w6yUt70b1EzIMp0fZoo881EwiWX49SoTLdkrZncM6aqA5J5uXYZdDWIS
	Q5OM4D7aJTL37iD6ssqyzxjEcNIkL8eKp/p84xJcPWi6ik+e15ZmO/irYDEhoWbdOdgeytaOorAe5
	qpPCPY/7/w/iOQy/LC39/I8LQfVkNwZBfTFE17ta/BYc3kbSez5IK2AUSrQ+ietoMYIUO832x1NRW
	Pz2xdIVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRqSD-0000000Arvv-3E4o;
	Sat, 06 Dec 2025 11:27:57 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRqSB-0000000ArvT-0lDQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 11:27:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477770019e4so30079735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Dec 2025 03:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765020473; x=1765625273; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54ozK3Z1QShV9IRHsBfnCuV50Wy1Uh8rW7bx3u1PONQ=;
        b=lVwETsJg8IutLR5iefR6YkvH0RfhoWSBEdKGRRdNwJI8zYtk64uFUOjBpGaoK18tAc
         vrKt/zcwoN+hneQ0dT/4Mx8qGEN26jMdiJfHs9zgDw6rlR5ytabghQos/Scjn9LXo4eE
         vxHIaY1sC8G8/sggpPNXSRzMlkp2tlUmxUDThM1e5UvhmGgEQqJhUoN8SqtQUZm9wLxa
         rIPkvtOzDxSzNB+6fo5KOpPHjnwfgOM9rO6a09vofS0E3ym+9DnkH0wuLaE/14gom6NO
         0Y2fPQqeMXeT7aZMJoyF1CXzZi5S5h7Y4g37SEg1Dlj0YhTL9wNZcGNOyPt7I8r6UF+5
         njaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765020473; x=1765625273;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54ozK3Z1QShV9IRHsBfnCuV50Wy1Uh8rW7bx3u1PONQ=;
        b=BOzDpuHoOK9jPYNQJHtutpaK/MgOQQtviO6HreNfHthkYECiAEe8JBD3wXmnDkuE4k
         XpInYeOQMK7C8kgBV7ak3U6b6yQ0+vnC3xvzsK7Zy7d0WlPa8PtzGUCyCGLW0hY+xOjw
         lNeXGMEtpHEWV9x8a+Bt9TWoodPfdSJ1IdsGZdX7753HuLH3dLgiP+YfFUuGXYo7jUsv
         UbehIJD1rwTgduGNYa/nlsQHr3/6Wcg406ZQhZHMDc98rdQ8AbHlYQPNVstBApRNxRuS
         kf+WcL2imVYz/dhI4XxY2fzpNcULfrLVmASYwC4GvSI4aT8A/tNEbeRk8Tf8IX1Pte6F
         KvDw==
X-Forwarded-Encrypted: i=1; AJvYcCXBIsO2+ly2zi98Vi3CKMhgsm+/jEpI5qWGqbSSlHziyd34jmyxiuMSzS/hdwZTTPbdMIvmTzAyEaXat5Fmy7yx@lists.infradead.org
X-Gm-Message-State: AOJu0YyL09nc3YDjaIdxRqR2WnITPmUyxwD2cKAgxJxqiepyBhXVsY6S
	0UVu3fTCuzoTloUclpDCMl90ai2GSHzaoyDR4m357BLexg1IU/+U8U2OVpqMarMBRBo=
X-Gm-Gg: ASbGncs3RurZDyuJlDzQRg3O0m49os5TL+ahrap0mi6uUQvgiQHPaCycOPbFhXKl9+W
	fj1N5fJVR6ozAm+VahYkRoRFgVQtL2ieoqu53T4FfpqP28VMl88VOymfyAzRa9SRzQ/DfxDgL3C
	KhGVah+VyXEV6B3T/OaoTjDSg3p2iTAi/SmT9wXi+jj1o5WXTRmDVx50G+Bjj2jycZHOpU9+7Eb
	XUWULXz/F/fwv2KRT8Jq3f4JXGads7WyV6rkx4u/MLte5vbDhdqi3JWFg/v284dNngGy5OExC5Z
	iGzRWY4WsUM/k/R/2bSZ1x/vpd2d6XVBvsp/Zh0bq6Fhao6806WqYEZ+9wajMeDDEGgG4MTttFQ
	94AtuCYqiY79E0HLnpXVJtbNTFLZWc10KCzvDGb/EXV4L4yB4jK2CZfq+Qdneiqre9UpL4ioHdN
	36RTYa+Twa/WZfAKi/lEw=
X-Google-Smtp-Source: AGHT+IGuJHqRDLXzE6pBV+O5clnghz1M3R3qGXhTy8JipjIwofYQPlM3zKjZV4m7mJ7/Nt62yMVZiw==
X-Received: by 2002:a05:600c:8b34:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-47939e49385mr21133625e9.33.1765020473081;
        Sat, 06 Dec 2025 03:27:53 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f80sm14204709f8f.41.2025.12.06.03.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 03:27:52 -0800 (PST)
Message-ID: <99b0dbae-0014-4d09-8724-092c03393dac@tuxon.dev>
Date: Sat, 6 Dec 2025 13:27:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: usb: Add Microchip LAN969x support
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
 nicolas.ferre@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 richardcochran@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com
Cc: luka.perkov@sartura.hr
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251203122313.1287950-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_032755_264001_0F194019 
X-CRM114-Status: GOOD (  12.73  )
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

Hi, Robert,

On 12/3/25 14:21, Robert Marko wrote:
> Microchip LAN969x has DWC3 compatible controller, though limited to 2.0(HS)
> speed, so document it.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../bindings/usb/microchip,lan9691-dwc3.yaml  | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
> new file mode 100644
> index 000000000000..7ffcbbd1e0f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/microchip,lan9691-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip LAN969x SuperSpeed DWC3 USB SoC controller
> +
> +maintainers:
> +  - Robert Marko <robert.marko@sartura.hr>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - microchip,lan9691-dwc3
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - microchip,lan9691-dwc3
> +      - const: snps,dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Gated USB DRD clock
> +      - description: Controller reference clock
> +
> +  clock-names:
> +    items:
> +      - const: bus_early
> +      - const: ref
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - $ref: snps,dwc3.yaml#
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/microchip,lan969x.h>
> +
> +    usb@300000 {
> +      compatible = "microchip,lan9691-dwc3", "snps,dwc3";

AFICT, the examples should be indented by 4 spaces.

> +      reg = <0x300000 0x80000>;
> +      interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&clks GCK_GATE_USB_DRD>,
> +               <&clks GCK_ID_USB_REFCLK>;
> +      clock-names = "bus_early", "ref";
> +    };


