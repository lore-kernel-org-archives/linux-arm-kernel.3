Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26969C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 05:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeGX4xJ5N5ByevcQku8kEm7rK27JtOgdg1gtNXvEUV0=; b=zn5g0royeDcTB26y1kgcIf7KiR
	kuP8/gHWUM2cXgFmTvN1oDKO3n/8sBNxlBgecmKqOiKiX8ztvrEPIGcX9GekowjQ/6XvyxTVPxsMn
	GqCYHjnB+fkXWtp+GoHz8F4h53dSF2iZnv8iJdKj223NTe4ec6IojCXr6denmn80xd3Endkxes0wA
	OkYrdRjHAXVqy1cVHxs3vmeJ3YHqITpYLv0w8RH4bbm3BbXXXLPBQ0CLEv6uAnCHXrqgh/zXHMC8V
	XB8LYSNRyYqvECgCuGlhAJ1uQElQ9JKCx+tbw694mhtX41+5uQdatkOyij4LKrYO4ma1CDVQ5EopC
	SxgAk7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXy7-000000044gz-03tN;
	Tue, 15 Jul 2025 05:12:43 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXve-000000044TN-1UdR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 05:10:11 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso4919406a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 22:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752556209; x=1753161009; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeGX4xJ5N5ByevcQku8kEm7rK27JtOgdg1gtNXvEUV0=;
        b=WirI/gWYuOJfC5iIVQbCcCJhVjGczX4AX3MObBiE9CJklmzhbaQ/x3JCyYf+wOJYWm
         R5JwfwLVtND0iAvFGCa6foKpQ2sST3AQSbkDIYOKs2AfcPM6qaexMBCKX4UGUZOzpL/a
         clzDMmZLK/G/jH+mkgG3fXQn8yA9+OFSrzslc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752556209; x=1753161009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeGX4xJ5N5ByevcQku8kEm7rK27JtOgdg1gtNXvEUV0=;
        b=bURUlZL1LOc6e43Jv55GgUIR/CTvFJO/7oI4NX8ZqPvAKaPs3AXaB0n4xqD5Pi7NQz
         fDkQ+H6okz0Cc/dU37r/kt3Lc6elY0GCRCPz/bErkUHKsZT4BG0tIj+N+0IKp+IWTZ64
         N7ZOPDHoH07XV3UhYPpsunvzRKeMnk+ju9qipM72Mfyca3Mo6Rt1aB9RORLTWsv+XuJE
         4v+IqtBl7GkVMqm9LF9eX7OzjuKttEuqzhK5B5gQLRM/AN29UwD4lCvz2KMtt1dHpwX8
         mey85vff1/v5W0DDfCB0obN5WsAv0mWGLaUDKir/9Xm5yGbL/asnY91HyMyQ9ZVK64M7
         AnCA==
X-Forwarded-Encrypted: i=1; AJvYcCV7qoagVX89h8eyxSacvbMHB43IDxScoC/dWOzg90Hv04MvqsIilQGPJ6W9aC0CddcM/T9rxs/u4qw3AcMmRUFr@lists.infradead.org
X-Gm-Message-State: AOJu0YxFW/jD1NnEsdfOZMlJy0qJQ+uuolEOA6EXwbpMOFNnf03hv7sN
	4NVrZzTYKKeI7DXQTsG7wb0AzScFJO3f8ae7X/XF1DQIFsxNqHgSMGxKxqdP+r3io1v908gcUnE
	ceFI9LUwtiChqDpGkO8Y79V3dCnVNurzCCKLFE9Op
X-Gm-Gg: ASbGnctUXh/0dAHRVhGkFxVMs6HjJJtIbL/otMPLEBKRK/xPZHNhpHjsRvkiOLeKbtc
	uZT9h5pycAeXlhCRmvYnUL1uihIaohVYn6Kw5OWNTOyhSGzxJ1RXwt9ClRvGHGGaHqpHk2Fe5sH
	tevrnoyXhUByD1opIwf1A54Y9MhAeZRw82r21YXhEYq9ZRE5H4unkbe+E7BPXV+cT8b6iLPUqIX
	r2tplfy0kOHKTC8HaTAcg2pMGCHpex8EBI=
X-Google-Smtp-Source: AGHT+IGrIcOwDhM8zFLR2Fqez+cP69AimTGRX9UTuj46iIg3ngozIxMahvLMKAAbIAUfN79z9ia/qiM2tlmpcP9JdRs=
X-Received: by 2002:a17:90b:3942:b0:311:c1ec:7d12 with SMTP id
 98e67ed59e1d1-31c4f591c3amr21704790a91.23.1752556209442; Mon, 14 Jul 2025
 22:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-9-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-9-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Jul 2025 13:09:55 +0800
X-Gm-Features: Ac12FXywxlo-FwGCNxuHlfnNYdXpmdX-6gC7L6-g8yB4I0r8fcMqx-Ix866UZAU
Message-ID: <CAGXv+5EufDuxLMnwMaCqtWFZpVMNMxi-5OwCyO4a+KD2T+2NYA@mail.gmail.com>
Subject: Re: [PATCH v6 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_221010_477797_B77E96A2 
X-CRM114-Status: GOOD (  23.62  )
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

Hi,

On Tue, Jul 8, 2025 at 7:35=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:
>
> From: Darren Ye <darren.ye@mediatek.com>
>
> Add mt8196 audio AFE.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/mediatek,mt8196-afe.yaml   | 157 ++++++++++++++++++
>  1 file changed, 157 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt81=
96-afe.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.=
yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> new file mode 100644
> index 000000000000..fe147eddf5e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> @@ -0,0 +1,157 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8196-afe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Audio Front End PCM controller for MT8196
> +
> +maintainers:
> +  - Darren Ye <darren.ye@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-afe
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  mediatek,vlpcksys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: To set up the apll12 tuner

Looking at the implementation, the configuration is just a fixed value.
Can this be moved to the VLP clock driver instead?

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: mux for audio intbus
> +      - description: mux for audio engen1
> +      - description: mux for audio engen2
> +      - description: mux for audio h
> +      - description: vlp 26m clock
> +      - description: audio apll1 clock
> +      - description: audio apll2 clock
> +      - description: audio apll1 divide4
> +      - description: audio apll2 divide4
> +      - description: audio apll12 divide for i2sin0
> +      - description: audio apll12 divide for i2sin1
> +      - description: audio apll12 divide for fmi2s
> +      - description: audio apll12 divide for tdmout mck
> +      - description: audio apll12 divide for tdmout bck
> +      - description: mux for audio apll1
> +      - description: mux for audio apll2
> +      - description: mux for i2sin0 mck
> +      - description: mux for i2sin1 mck
> +      - description: mux for fmi2s mck
> +      - description: mux for tdmout mck
> +      - description: mux for adsp clock
> +      - description: 26m clock
> +
> +  clock-names:
> +    items:
> +      - const: top_aud_intbus
> +      - const: top_aud_eng1
> +      - const: top_aud_eng2
> +      - const: top_aud_h
> +      - const: vlp_clk26m

> +      - const: apll1
> +      - const: apll2
> +      - const: apll1_d4
> +      - const: apll2_d4

These are parents of the top_apll[12]. They do not feed into the
hardware directly, so you should not be including them here.

> +      - const: apll12_div_i2sin0
> +      - const: apll12_div_i2sin1
> +      - const: apll12_div_fmi2s
> +      - const: apll12_div_tdmout_m
> +      - const: apll12_div_tdmout_b

In the clock bindings sent by Collabora, these dividers are no longer
separately modeled; they have been combined with their respective
top_* clocks.

> +      - const: top_apll1
> +      - const: top_apll2

These two are parents to apll12_div_*, do not feed into the hardware
directly, so you should not be including them here.

The clock tree for each audio interface clock looks like the following:

    apll1 -> apll1_d4 -> top_apll1 --
                     /               \
              clk26m                  --> top_fmi2s -> apll12_div_fmi2s
                     \               /
    apll2 -> apll2_d4 -> top_apll2 --

Only the final "apll12_div_fmi2s" should be referenced.

On the implementation side, it should simply be a matter of setting the
required rate (24.576 MHz or 22.5792 MHz, or some multiple) on this leaf
clock, and let the clock framework figure out the PLL and dividers to
use. Same thing for enabling the clock.

> +      - const: top_i2sin0
> +      - const: top_i2sin1
> +      - const: top_fmi2s
> +      - const: top_tdmout
> +      - const: top_adsp

> +      - const: clk26m

Is this one directly needed? It is similar to vlp_clk26m, and I suspect
only that one is needed.


ChenYu

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - memory-region
> +  - mediatek,vlpcksys
> +  - power-domains
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        afe@1a110000 {
> +            compatible =3D "mediatek,mt8196-afe";
> +            reg =3D <0 0x1a110000 0 0x9000>;
> +            interrupts =3D <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
> +            memory-region =3D <&afe_dma_mem_reserved>;
> +            mediatek,vlpcksys =3D <&vlp_cksys_clk>;
> +            power-domains =3D <&scpsys 14>; //MT8196_POWER_DOMAIN_AUDIO
> +            clocks =3D <&vlp_cksys_clk 40>, //CLK_VLP_CK_AUD_INTBUS_SEL
> +                     <&vlp_cksys_clk 38>, //CLK_VLP_CK_AUD_ENGEN1_SEL
> +                     <&vlp_cksys_clk 39>, //CLK_VLP_CK_AUD_ENGEN2_SEL
> +                     <&vlp_cksys_clk 37>, //CLK_VLP_CK_AUDIO_H_SEL
> +                     <&vlp_cksys_clk 45>, //CLK_VLP_CK_CLKSQ
> +                     <&cksys_clk 129>, //CLK_CK_APLL1
> +                     <&cksys_clk 132>, //CLK_CK_APLL2
> +                     <&cksys_clk 130>, //CLK_CK_APLL1_D4
> +                     <&cksys_clk 133>, //CLK_CK_APLL2_D4
> +                     <&cksys_clk 80>, //CLK_CK_APLL12_CK_DIV_I2SIN0
> +                     <&cksys_clk 81>, //CLK_CK_APLL12_CK_DIV_I2SIN1
> +                     <&cksys_clk 92>, //CLK_CK_APLL12_CK_DIV_FMI2S
> +                     <&cksys_clk 93>, //CLK_CK_APLL12_CK_DIV_TDMOUT_M
> +                     <&cksys_clk 94>, //CLK_CK_APLL12_CK_DIV_TDMOUT_B
> +                     <&cksys_clk 43>, //CLK_CK_AUD_1_SEL
> +                     <&cksys_clk 44>, //CLK_CK_AUD_2_SEL
> +                     <&cksys_clk 66>, //CLK_CK_APLL_I2SIN0_MCK_SEL
> +                     <&cksys_clk 67>, //CLK_CK_APLL_I2SIN1_MCK_SEL
> +                     <&cksys_clk 78>, //CLK_CK_APLL_FMI2S_MCK_SEL
> +                     <&cksys_clk 79>, //CLK_CK_APLL_TDMOUT_MCK_SEL
> +                     <&cksys_clk 45>, //CLK_CK_ADSP_SEL
> +                     <&cksys_clk 140>; //CLK_CK_TCK_26M_MX9
> +            clock-names =3D "top_aud_intbus",
> +                          "top_aud_eng1",
> +                          "top_aud_eng2",
> +                          "top_aud_h",
> +                          "vlp_clk26m",
> +                          "apll1",
> +                          "apll2",
> +                          "apll1_d4",
> +                          "apll2_d4",
> +                          "apll12_div_i2sin0",
> +                          "apll12_div_i2sin1",
> +                          "apll12_div_fmi2s",
> +                          "apll12_div_tdmout_m",
> +                          "apll12_div_tdmout_b",
> +                          "top_apll1",
> +                          "top_apll2",
> +                          "top_i2sin0",
> +                          "top_i2sin1",
> +                          "top_fmi2s",
> +                          "top_tdmout",
> +                          "top_adsp",
> +                          "clk26m";
> +        };
> +    };
> +
> +...
> --
> 2.45.2
>
>

