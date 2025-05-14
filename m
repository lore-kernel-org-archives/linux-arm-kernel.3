Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9007C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJ0AzCyNbBw7LmTlYnlYRUZRvc6BiWujoVO60kyzOiU=; b=rBdRAZLbErJwDuFvn7tZx80q0V
	LXH7GJl2nceNuLDRBi567fUphqGOjbLTUEJYE5C2kR7EvorMrcSfvv/h/VaY9HoCV41KH6h0RezzY
	1reMnauttrj9omMN96yJ9xS2579VJV9J7kSyO98YH2PQT42l4zFgHIXApYePZAvkOFo2o7U9kUc6c
	1LrCjtCHN22EK6zE7c6zTEYWK5ggRuaoBracbBB12RvvFgizudBE/HR/+F0pJg/Udv3ad1frlCKl4
	se3dIY+kccYleGER+1QAPKbj6XOIbcbWDExEBeBejPMGeiLaT7I54Bxwc/HarbrAwjl4aRg2skBR1
	3lC0ZMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGCa-0000000FvYO-2STq;
	Wed, 14 May 2025 17:47:32 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEwV-0000000FkR6-3o2E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 16:26:53 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e78e53cc349so15813276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 09:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747240010; x=1747844810; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJ0AzCyNbBw7LmTlYnlYRUZRvc6BiWujoVO60kyzOiU=;
        b=l0594tsTA0QEMkxwyK9H1nA9dCf/vgFmTIz74LT+wuB5Gm2E9FzXTHXkj4Y51QffzY
         YRX9QAoijJSPJGaY+kA1ysSbaG3Hc4/X9ES5rdq39rR9/g7PP5y8nSDnokm+9N6lkMNk
         3Udk76SIiJkaCjSlTpIlF63me9IJfdVVk2danP7leRsOZwNIwT5qi8ZNr59S6MQ2UgR9
         ZITRa7sDfx5be0cZ21kpkBVDfX7pc03VEddg7RFrzEkuuCzTcH2UJbymxg7kEhXPVBvD
         LjtxUzd990Bxgqx9qPdmnHUMwzkERzeh/qg3HtVzwHgU/47fob5rFUqPh2gn1gGyskIg
         Q77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240010; x=1747844810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJ0AzCyNbBw7LmTlYnlYRUZRvc6BiWujoVO60kyzOiU=;
        b=bw0EBjjc5d4zdsmc5ExIv3wDoM8PiXDLa8Cbx6rnd0NoQK9F18RTk1rG9NXG/RJZtS
         SfyPGaCPPgSc4svHC6+UtU5UtI2g56tSUmmiLJTnXEIKOo4pBP3TcQwK7OGjX1OrJXcW
         Qe7QeKM8Fnqq2C2K+1WQ4thj89ND7/Tb5CBmeNKyn7NPvHfjMJiUJN+HJYJZNYQBSmRl
         yBO4jD/P73UFbCdVxkMINbHNNgtnyHj2u1qcUoURQh9LoMpjwhvl5cgng0fGohyIoo2M
         P4qiBskgAHmBZLWloIsi5flNyK5k2M6vebCcAoxcZtxQo/h4ZZM1bDtZUPfQsIvP7Ek9
         qeRg==
X-Forwarded-Encrypted: i=1; AJvYcCU7dY7/wxG8XHYuujs65bX9al0z/EX1U37j9CaJ/modOIMYuHfkOhQvpyVhyca1GjZvbQTek/Y7gBzcBe11Or+u@lists.infradead.org
X-Gm-Message-State: AOJu0YxOvzS8owQxsZz40sm8nJvhUzJH76bGP0aYK0wCPUfYaoOW5t6M
	GKX+CIgOATKQXMcEiWvT1pEMAlxeyMRPfX9F54Q6pMwDYYb2xDkr5Ub7WOeIat4uLp2Z3jXLaki
	yfuFWgA==
X-Gm-Gg: ASbGncvnQBYljXdns1CCusX5sXrYYMfkDU5LNQ8Y2nc5iPH29uP2VDQCe/182s5RbVr
	Oh0wuHWJY22ksUFPAiIXVbxFR/w/E7qwkk2ct4m6tCv7dxjb0XaAqjoZa6S8uemMsGMCVS+TcKi
	yt4GeUVcW3iejmu1ZR2F2eUM8ApM1wapJ3cK8ZPi34oZm90kwXDfbsgtNuJVFUfJUqK4W7DiHD6
	mMPeE11lFmLC+P3YbrYirFNJSEjFDxZfKJlprvUw8OWaQcdvxKAx9PYhkrfZviF3mFKUsQMLJ6r
	N2Dq72/vRHWP9vuSwXp9bV4xxwBuPIwXpWdD5KZqoHc108+7kVCRg5wty23sW66J47oFp+hgQRV
	K8MrUGUx6cxrnVDN0gVxi7vFDbCj1SA==
X-Google-Smtp-Source: AGHT+IGyJJqeLbGFbdu0jUiMbQ8MS/+krZmZ4B2gKaulmEYSutqD92H0qOaelfMmzi0Qbw92xDdCMA==
X-Received: by 2002:a05:6902:218a:b0:e78:f6b7:f74a with SMTP id 3f1490d57ef6-e7b3d4b97a1mr4638443276.4.1747240010608;
        Wed, 14 May 2025 09:26:50 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7b30a6e7dfsm892486276.53.2025.05.14.09.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 09:26:49 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e694601f624so429276.1;
        Wed, 14 May 2025 09:26:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhHC+m0zTtAcr7Y8hNnjWRhnHGC1+f4dmKsAH6Qu6v0EkPVeKZdVDVmObo0koTpHL2gzbYiCJN5ZkccMRH7EPq@lists.infradead.org, AJvYcCX4JaWeYP3KspI1kcIdxf/bGqC8wxb2lQsF4x3sAImIIs0iWwsDNlIxR0kad92/eJXoRagfc4wqBsKV292x30g=@lists.infradead.org
X-Received: by 2002:a05:6902:1202:b0:e6d:f160:bbdf with SMTP id
 3f1490d57ef6-e7b3d59ae2fmr4832866276.36.1747240009056; Wed, 14 May 2025
 09:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-1-d4dbcfafc141@tomeuvizoso.net> <20250225160248.GA2563229-robh@kernel.org>
In-Reply-To: <20250225160248.GA2563229-robh@kernel.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 14 May 2025 18:26:38 +0200
X-Gmail-Original-Message-ID: <CAAObsKD01rdYf0E6Vev6oFRZEf1f006oi+ghgVUn+h=aRx-hmQ@mail.gmail.com>
X-Gm-Features: AX0GCFvDEBwxCoW2ZGLJEEIKb_2H5q_lCEI2NWi7ZFVAMNUkSoshPa20AanOMV0
Message-ID: <CAAObsKD01rdYf0E6Vev6oFRZEf1f006oi+ghgVUn+h=aRx-hmQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: npu: rockchip,rknn: Add bindings
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_092652_212369_0743A595 
X-CRM114-Status: GOOD (  26.68  )
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

Hi Rob,

On Tue, Feb 25, 2025 at 5:02=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Feb 25, 2025 at 08:55:47AM +0100, Tomeu Vizoso wrote:
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> >   IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++++++++++=
++++++++
> >  1 file changed, 152 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.y=
aml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f166cf13a=
9f4aa7c1901362a3f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > @@ -0,0 +1,152 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Neural Processing Unit IP from Rockchip
> > +
> > +maintainers:
> > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > +
> > +description:
> > +  Rockchip IP for accelerating inference of neural networks, based on =
NVIDIA's
> > +  open source NVDLA IP.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^npu-core@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - rockchip,rk3588-rknn-core-top
> > +          - const: rockchip,rknn-core-top
>
> Drop the fallbacks unless you have some evidence that the IP is the
> same across a lot of SoCs. If you don't, then
> rockchip,rk3588-rknn-core-top can be the fallback whenever there are
> more compatible SoCs.
>
> Or if there's version/feature registers that otherwise make it
> discoverable, then a common compatible is fine.
>
> > +      - items:
> > +          - enum:
> > +              - rockchip,rk3588-rknn-core
> > +          - const: rockchip,rknn-core
>
> I don't understand the difference between core and core-top. That needs
> to be explained in the top-level description.
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: npu
> > +      - const: pclk
> > +    minItems: 2
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  npu-supply: true
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    items:
> > +      - const: srst_a
> > +      - const: srst_h
> > +
> > +  sram-supply: true
>
> Group supply properties together
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - iommus
> > +  - npu-supply
> > +  - power-domains
> > +  - resets
> > +  - reset-names
> > +  - sram-supply
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - rockchip,rknn-core-top
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 4
> > +
> > +        clock-names:
> > +          minItems: 4
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - rockchip,rknn-core
> > +    then:
> > +      properties:
> > +        clocks:
> > +          maxItems: 2
> > +        clock-names:
> > +          maxItems: 2
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/rk3588-power.h>
> > +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> > +
> > +    bus {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      rknn_core_top: npu-core@fdab0000 {
>
> npu@...

Can you extend on why you would prefer to have npu@? As each node
corresponds to a core inside the NPU, I went with npu-core@.

Thanks,

Tomeu

> > +        compatible =3D "rockchip,rk3588-rknn-core-top", "rockchip,rknn=
-core-top";
> > +        reg =3D <0x0 0xfdab0000 0x0 0x9000>;
> > +        assigned-clocks =3D <&scmi_clk SCMI_CLK_NPU>;
> > +        assigned-clock-rates =3D <200000000>;
> > +        clocks =3D <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
> > +                 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
> > +        clock-names =3D "aclk", "hclk", "npu", "pclk";
> > +        interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        iommus =3D <&rknn_mmu_top>;
> > +        npu-supply =3D <&vdd_npu_s0>;
> > +        power-domains =3D <&power RK3588_PD_NPUTOP>;
> > +        resets =3D <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
> > +        reset-names =3D "srst_a", "srst_h";
> > +        sram-supply =3D <&vdd_npu_mem_s0>;
> > +      };
> > +
> > +      rknn_core_1: npu-core@fdac0000 {
> > +        compatible =3D "rockchip,rk3588-rknn-core", "rockchip,rknn-cor=
e";
> > +        reg =3D <0x0 0xfdac0000 0x0 0x9000>;
> > +        clocks =3D <&cru ACLK_NPU1>, <&cru HCLK_NPU1>;
> > +        clock-names =3D "aclk", "hclk";
> > +        interrupts =3D <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        iommus =3D <&rknn_mmu_1>;
> > +        npu-supply =3D <&vdd_npu_s0>;
> > +        power-domains =3D <&power RK3588_PD_NPU1>;
> > +        resets =3D <&cru SRST_A_RKNN1>, <&cru SRST_H_RKNN1>;
> > +        reset-names =3D "srst_a", "srst_h";
> > +        sram-supply =3D <&vdd_npu_mem_s0>;
> > +      };
> > +    };
> > +...
> >
> > --
> > 2.48.1
> >

