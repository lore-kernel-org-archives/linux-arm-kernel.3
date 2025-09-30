Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE323CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 00:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2aCUV6OLkXwTtwNzSY66MPjJRvAozma0kNGW9LaNrE=; b=v2LEwVfVYtLiygtuVgJtWOGEkZ
	6uhkPhACYHme9k2k1EBnv6ZiLlInVLq0qnWrPzQ/KL5Wd0Vg6NPAA4BrpWavZ72cJk4Z7VHjpDup1
	d0Ihz4jWAbEFx4MVebEVPwz2/tzKiKN9zV17WTDkSXSgmKvuUqaeDay8wXP1wJVAHOdI1AxyMaydd
	pI0QrZlVAs3HRpnLa35vqD0v10IbjtN8DY21CiQW4y5lfoOuGHhb5x8xUW2idFe38YRibdG3Ep67O
	sMYHlK3B8DOdi1pCByo5WilK7uju/Iaz52JSVJQhQU0T0LaUJFPoSdTq3Y2Wg6itpiX3TQZRKnY6D
	g22+dh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3O6H-00000003flZ-2DEs;
	Tue, 30 Sep 2025 00:20:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3O6F-00000003fkl-1yys
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 00:20:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e3af7889fso29331695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 17:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759191610; x=1759796410; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2aCUV6OLkXwTtwNzSY66MPjJRvAozma0kNGW9LaNrE=;
        b=LeNNbn2igfpVvRFGiG/tJgZ/2MM6tMFmdFko2f/01EJGKV8x/bAe/YdThtvoUUCrcf
         nQPVHmmjU3jK5bRVkOt9A1H+zSGs8RGKztVn+9fuGNlYLH1P9S2VHZcLVj9rlWRMy7cW
         un6nwTtn5e8TiKmwBmHKH2kk7GXDAoOswgV7e2aB2uIfMdhWHiSdqEqix9MMuYMo33Vf
         C7TsNssrrTLZ+RgU8uJXiJzXVfenCTDiXOFl460P9bbPjGtWM2ZfHFu2giRO+Sh9+fpX
         lGpC6U2KmLQb/UBkphMVezlr2bFU1lxSR8c3ttNQOzgOJAmWLFxRQZDBAUS6au62X1HY
         XuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759191610; x=1759796410;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2aCUV6OLkXwTtwNzSY66MPjJRvAozma0kNGW9LaNrE=;
        b=Ehe50R5TLDgie306flCP/HEzXpTF4kVL2kMSr4VqQmTFPfmi+L6c2cOVRKfaFZDQpH
         /xQPGy7cBL04kNlqjfrDh1m018zDeM+Ifp3JPxy/dj1auCEQkSN+yC70XfYeFOUL5KVL
         jpIA2TQjSTzEeQY8qvSwPlDKzZkITloXp/V2bu2zwFEjtgk9+MargscRyNoG3qwGUNTC
         LJvezKY5WMsV+9/SurDHdEJYcaJrnhslmjh1H21X6RSCdPQ99R1FhY3h7gymEEx9Flkc
         iqZMWI7HJugkCKHwDMK7myPYpoEqnBhtGZGjZPuGszFmZvSaCl5424Nyr4hcqJgfqiZI
         1Nxw==
X-Forwarded-Encrypted: i=1; AJvYcCWHzwq3EXC6tgbBG2MMcxcrtSintn5bKq3Um91Q8y1ebxRt5QdeSNgQbWp2tUg/kTOKJLHCLk0KcI9jIVMtFEfv@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ4jo3+5C4UL4yGMOTpoKG5LH+Utavyn8l/IUITi9tyOxYT6kN
	dKAcRcVFYHNAcXRGoU9BFrLQCNeLcdBZbdGug9xL3CHvSuyvHJ+zr0QIDrX1biTITv4=
X-Gm-Gg: ASbGncvv+jcFRf8MhmFUo8bN9JEE80WZwMqjuXE97dnRktXKC+L+FxM/WsMUcbZgYKs
	ojRlYdWlYwiabDWCiXKmMwel3yG0ufa3O50QSD7bo5JjHCyDcWJjSmDpcl5DpERSfcChk4+WVh9
	7WL25idfBoB5uG5uMAFnH9p7lZ3ZVyJ/5D02qygjv/qPcPXD0UwNJ88g8rOtDlz46P2kpv+rgvH
	cJQ8gkPek3pxT84z6576IKLZY491xZnOf3H3du2RRD9myBRgkVaiJcT5rCRhxqlHflnK+cE0u32
	Oia9yl73kVXBV42ZUkHVtbTrzE4PLjYUj2OQWqPOr2C9KCigYTeJbxv8IyqsZ6sSck2vS7gxzL4
	A6k3g8GEAbz1WmVI6ev/2N3MBtFlfidhdZft+9l5WM3aBZ+JEwVhGo05k3tZOWTtR02uUs9foAg
	/TBmOIZL568nTUEtH3vEQFVDuZYrnz1Kk=
X-Google-Smtp-Source: AGHT+IHXl9KNUIAY5LT7IQhdhWGKaz6kpmbHg2ltlnlV5LX2piwjkJPMXt7gP1unlCKB0JI7t/YWLA==
X-Received: by 2002:a05:600c:8b65:b0:46e:36f8:1eb7 with SMTP id 5b1f17b1804b1-46e36f81fbamr160812465e9.10.1759191609420;
        Mon, 29 Sep 2025 17:20:09 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e56f3dcacsm33715495e9.2.2025.09.29.17.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 17:20:08 -0700 (PDT)
Message-ID: <1ccec2cd-0290-4804-b274-b3dcb481449e@linaro.org>
Date: Tue, 30 Sep 2025 01:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/17] media: dt-bindings: add rockchip rk3568 vicap
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <20240220-rk3568-vicap-v11-4-af0eada54e5d@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v11-4-af0eada54e5d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_172011_554283_A07DFE41 
X-CRM114-Status: GOOD (  16.62  )
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

On 17/09/2025 16:38, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   .../bindings/media/rockchip,rk3568-vicap.yaml      | 170 +++++++++++++++++++++
>   MAINTAINERS                                        |   1 +
>   2 files changed, 171 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> new file mode 100644
> index 000000000000..99861d236f5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-vicap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3568 Video Capture (VICAP)
> +
> +maintainers:
> +  - Michael Riesch <michael.riesch@collabora.com>
> +
> +description:
> +  The Rockchip RK3568 Video Capture (VICAP) block features a digital video
> +  port (DVP, a parallel video interface) and a MIPI CSI-2 port. It receives
> +  the data from camera sensors, video decoders, or other companion ICs and
> +  transfers it into system main memory by AXI bus.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3568-vicap
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ACLK
> +      - description: HCLK
> +      - description: DCLK
> +      - description: ICLK
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: dclk
> +      - const: iclk
> +
> +  iommus:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: ARST
> +      - description: HRST
> +      - description: DRST
> +      - description: PRST
> +      - description: IRST
> +
> +  reset-names:
> +    items:
> +      - const: arst
> +      - const: hrst
> +      - const: drst
> +      - const: prst
> +      - const: irst
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to general register file used for video input block control.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: The digital video port (DVP, a parallel video interface).
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum: [5, 6]

I meant to add my nit-pick comment here as I added my RB.

Its not important though.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

