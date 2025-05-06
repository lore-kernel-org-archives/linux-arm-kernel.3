Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0CBC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqSHoy7mtoHPZpIwe8/9kBtVgv05oyq3k6LkCHI5Bfg=; b=w4D/bbVFTPoGV8BDYSEN3Y8RAN
	+X0jttTQuLpMYwOULcsj+isAoGmZkpFcNClWy1jC5bOgB0O7uS91SfKJloRQz9v5TeaLbbxS8WUVM
	k2OA2M2V1OxgAlctxACkSrS/1ZhYC8KrWJqyrdjfOBQgc3GISaaOZP9o0IjFaVjj5EwH7oK7+8xFD
	cjijBEAfgey9yZZ6wi3EbI6DeLjuefhE/ymi9TcSHrxBg+TqHWVN33i/nCrMf2qWb52ssn/RfpZd5
	5tz172GFSS3IveG7/dB7oqf537jvjtQNcUNbGMu1YJfZEoyZPEtenVVHAgBXPvi2VtOkflprhdVrm
	t4xQZ+XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRvF-0000000Dj0T-24Wx;
	Tue, 06 May 2025 23:42:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNeJ-0000000DC2p-1iUZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 19:08:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1721C4A0F6
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 May 2025 19:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA286C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 May 2025 19:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746558495;
	bh=paTUFGSz04LNT/C2BDv0ImA0O+MsG2kBS12SleaLNnc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I9aSzr+d7TvJ8+VZIYDsy4Qd4D7ms6PhFKPytwqXf3tcpz0vTmUVBmDbKVUN8jsdT
	 5hgresaB2j5y2P/PGsmqKbrg1DnyKeLPaKSehmiszyNMg3k88XudVUD1OfpjE2yfqo
	 5tOfyjHdcKkBjaQBZSJp0cuBxzMrmkVMGfwDKSRP20JWfMNnAouOJ4rq7oBo0yUtIh
	 Il8Ip1yhDaJNK3kEP+BWiWJ7D3xZmtZ0TGbpqumaX0Oxz/h+uOr/xPZ5mC2SL5pSVc
	 w6izSPKxfKmv3Nld9tteAoyra70lVdoJrX9yZfP4BxxTSKbYg06/qpDYbR75aEXa/l
	 bhwuDBW5s4V5g==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac25520a289so1025951466b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 12:08:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXvGQChF/QS4N5v+Wc3HkoE/3FiI9mEUqJxBdL2Oaqq+rTB3bpGCl4InSq85j8Ojm2pMfkKlBRdMI0vpj46iwB@lists.infradead.org
X-Gm-Message-State: AOJu0YzUFVaoqhOLF9OvzwLP6JctstsMqOtN0y4nT0v4s63ckdSloLN2
	bjHuljroNE6Wq9MVJyab5LMDaZVht8zpn8BYm3+091PGewt3ce31cQqCKsW8hvA8jtbOIMwTV6Q
	d0kaAzKEkv1xWnCyxyT4wU6v1Zw==
X-Google-Smtp-Source: AGHT+IG5bV9HHgyKjBFnzwp3/cOgl7x43ZVv1upSuafOcFeM+MkAJOpTlLULzDn1VWlVKjUkxUfXOhQM9k4na2AbsX8=
X-Received: by 2002:a17:907:6d19:b0:ac6:f6ea:cc21 with SMTP id
 a640c23a62f3a-ad1e8e6b66emr57640566b.55.1746558493511; Tue, 06 May 2025
 12:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org> <20250506-gicv5-host-v3-1-6edd5a92fd09@kernel.org>
In-Reply-To: <20250506-gicv5-host-v3-1-6edd5a92fd09@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 6 May 2025 14:08:00 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK1mTrj4tG_D3sjXdE_jbpHG_o79ReDpZNCH44wXiBj2g@mail.gmail.com>
X-Gm-Features: ATxdqUFkwx6wCHrwPzmvPvVj7GYAyB5eNUDayhhnrDe_pr1MLa_iWy-GVbQk6vI
Message-ID: <CAL_JsqK1mTrj4tG_D3sjXdE_jbpHG_o79ReDpZNCH44wXiBj2g@mail.gmail.com>
Subject: Re: [PATCH v3 01/25] dt-bindings: interrupt-controller: Add Arm GICv5
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_120815_503512_4E7C93E3 
X-CRM114-Status: GOOD (  33.70  )
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

On Tue, May 6, 2025 at 7:24=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>
> The GICv5 interrupt controller architecture is composed of:
>
> - one or more Interrupt Routing Service (IRS)
> - zero or more Interrupt Translation Service (ITS)
> - zero or more Interrupt Wire Bridge (IWB)
>
> Describe a GICv5 implementation by specifying a top level node
> corresponding to the GICv5 system component.
>
> IRS nodes are added as GICv5 system component children.
>
> An ITS is associated with an IRS so ITS nodes are described
> as IRS children - use the hierarchy explicitly in the device
> tree to define the association.
>
> IWB nodes are described as a separate schema.
>
> An IWB is connected to a single ITS, the connection is made explicit
> through the msi-parent property and therefore is not required to be
> explicit through a parent-child relationship in the device tree.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  .../interrupt-controller/arm,gic-v5-iwb.yaml       |  76 ++++++++
>  .../bindings/interrupt-controller/arm,gic-v5.yaml  | 196 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   7 +
>  3 files changed, 279 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,g=
ic-v5-iwb.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm=
,gic-v5-iwb.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b3eb89567b3457e91b93588d7=
db1cef69b6b9813
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-i=
wb.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v5-iwb.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Generic Interrupt Controller, version 5 Interrupt Wire Bridge=
 (IWB)
> +
> +maintainers:
> +  - Lorenzo Pieralisi <lpieralisi@kernel.org>
> +  - Marc Zyngier <maz@kernel.org>
> +
> +description: |
> +  The GICv5 architecture defines the guidelines to implement GICv5
> +  compliant interrupt controllers for AArch64 systems.
> +
> +  The GICv5 specification can be found at
> +  https://developer.arm.com/documentation/aes0070
> +
> +  GICv5 has zero or more Interrupt Wire Bridges (IWB) that are responsib=
le
> +  for translating wire signals into interrupt messages to the GICv5 ITS.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: arm,gic-v5-iwb
> +
> +  interrupt-controller: true

Move next to #interrupt-cells

> +
> +  "#address-cells":
> +    const: 0
> +
> +  "#interrupt-cells":
> +    description: |
> +      The 1st cell corresponds to the IWB wire.
> +
> +      The 2nd cell is the flags, encoded as follows:
> +      bits[3:0] trigger type and level flags.
> +
> +      1 =3D low-to-high edge triggered
> +      2 =3D high-to-low edge triggered
> +      4 =3D active high level-sensitive
> +      8 =3D active low level-sensitive
> +
> +    const: 2
> +
> +  reg:

Generally, the order is compatible, reg, common properties, vendor
properties, child nodes. Related properties grouped together and
alphabetical order (ignoring '#') within common and vendor properties.

> +    items:
> +      - description: IWB control frame
> +
> +  msi-parent:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - msi-parent

interrupt-controller and #interrupt-cells should be required

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@2f000000 {
> +      compatible =3D "arm,gic-v5-iwb";
> +      #address-cells =3D <0>;
> +
> +      interrupt-controller;
> +      #interrupt-cells =3D <2>;
> +
> +      reg =3D <0x2f000000 0x10000>;

Use the same order as the schema.

> +
> +      msi-parent =3D <&its0 64>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,g=
ic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic=
-v5.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..1ba0a2088e6d15bacae22c9fc=
9eebc4ce5c51b0b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.y=
aml
> @@ -0,0 +1,196 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v5.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Generic Interrupt Controller, version 5
> +
> +maintainers:
> +  - Lorenzo Pieralisi <lpieralisi@kernel.org>
> +  - Marc Zyngier <maz@kernel.org>
> +
> +description: |
> +  The GICv5 architecture defines the guidelines to implement GICv5
> +  compliant interrupt controllers for AArch64 systems.
> +
> +  The GICv5 specification can be found at
> +  https://developer.arm.com/documentation/aes0070
> +
> +  The GICv5 architecture is composed of multiple components:
> +    - one or more IRS (Interrupt Routing Service)
> +    - zero or more ITS (Interrupt Translation Service)
> +
> +  The architecture defines:
> +    - PE-Private Peripheral Interrupts (PPI)
> +    - Shared Peripheral Interrupts (SPI)
> +    - Logical Peripheral Interrupts (LPI)
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: arm,gic-v5
> +
> +  interrupt-controller: true
> +
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
> +
> +  ranges: true
> +
> +  "#interrupt-cells":
> +    description: |
> +      The 1st cell corresponds to the INTID.Type field in the INTID; 1 f=
or PPI,
> +      3 for SPI. LPI interrupts must not be described in the bindings si=
nce
> +      they are allocated dynamically by the software component managing =
them.
> +
> +      The 2nd cell contains the interrupt INTID.ID field.
> +
> +      The 3rd cell is the flags, encoded as follows:
> +      bits[3:0] trigger type and level flags.
> +
> +        1 =3D low-to-high edge triggered
> +        2 =3D high-to-low edge triggered
> +        4 =3D active high level-sensitive
> +        8 =3D active low level-sensitive
> +
> +    const: 3
> +
> +  interrupts:
> +    description:
> +      The VGIC maintenance interrupt.
> +    maxItems: 1
> +
> +required:
> +  - compatible

If you always have an IRS which you say there is, then #address-cells,
#size-cells, and ranges are required. And interrupt-controller and
#interrupt-cells.

> +
> +patternProperties:
> +  "^irs@[0-9a-f]+$":
> +    type: object
> +    description:
> +      GICv5 has one or more Interrupt Routing Services (IRS) that are
> +      responsible for handling IRQ state and routing.
> +
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        const: arm,gic-v5-irs
> +
> +      "#address-cells":
> +        enum: [ 1, 2 ]
> +
> +      "#size-cells":
> +        enum: [ 1, 2 ]
> +
> +      ranges: true
> +
> +      dma-noncoherent:
> +        description:
> +          Present if the GIC IRS permits programming shareability and
> +          cacheability attributes but is connected to a non-coherent
> +          downstream interconnect.
> +
> +      reg:

Move after compatible

> +        minItems: 1
> +        items:
> +          - description: IRS control frame
> +          - description: IRS setlpi frame
> +
> +      cpus:
> +        description:
> +          CPUs managed by the IRS.
> +
> +      arm,iaffids:
> +        $ref: /schemas/types.yaml#/definitions/uint16-array
> +        description:
> +          Interrupt AFFinity ID (IAFFID) associated with the CPU whose
> +          CPU node phandle is at the same index in the cpus array.
> +
> +    patternProperties:
> +      "^msi-controller@[0-9a-f]+$":
> +        type: object
> +        description:
> +          GICv5 has zero or more Interrupt Translation Services (ITS) th=
at are
> +          used to route Message Signalled Interrupts (MSI) to the CPUs. =
Each
> +          ITS is connected to an IRS.
> +        additionalProperties: false
> +
> +        properties:
> +          compatible:
> +            const: arm,gic-v5-its
> +
> +          dma-noncoherent:
> +            description:
> +              Present if the GIC ITS permits programming shareability an=
d
> +              cacheability attributes but is connected to a non-coherent
> +              downstream interconnect.
> +
> +          msi-controller: true
> +
> +          "#msi-cells":
> +            description:
> +              The single msi-cell is the DeviceID of the device which wi=
ll
> +              generate the MSI.
> +            const: 1
> +
> +          reg:

Move after compatible.

> +            items:
> +              - description: ITS control frame
> +              - description: ITS translate frame
> +
> +        required:
> +          - compatible
> +          - msi-controller
> +          - "#msi-cells"
> +          - reg
> +
> +    required:
> +      - compatible
> +      - reg
> +      - cpus
> +      - arm,iaffids
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller {
> +      compatible =3D "arm,gic-v5";
> +      #interrupt-cells =3D <3>;
> +      #address-cells =3D <1>;
> +      #size-cells =3D <1>;
> +      ranges;
> +
> +      interrupt-controller;
> +
> +      interrupts =3D <1 25 4>;
> +
> +      irs@2f1a0000 {
> +        compatible =3D "arm,gic-v5-irs";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        ranges;
> +
> +        reg =3D <0x2f1a0000 0x10000>;  // IRS_CONFIG_FRAME for NS
> +
> +        arm,iaffids =3D /bits/ 16 <0 1 2 3 4 5 6 7>;
> +        cpus =3D <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>, <&cpu4>, <&cpu5>, <=
&cpu6>, <&cpu7>;
> +
> +        msi-controller@2f120000 {
> +          compatible =3D "arm,gic-v5-its";
> +
> +          msi-controller;
> +          #msi-cells =3D <1>;
> +
> +          reg =3D <0x2f120000 0x10000    // ITS_CONFIG_FRAME for NS

Enclose each entry in <>'s.

> +                 0x2f130000 0x10000>;  // ITS_TRANSLATE_FRAME
> +        };
> +      };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b82704950184bd71623ff41fc4df31e4c7fe87..1902291c3cccc06d27c5f7912=
3e67774cf9a0e43 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1901,6 +1901,13 @@ F:       drivers/irqchip/irq-gic*.[ch]
>  F:     include/linux/irqchip/arm-gic*.h
>  F:     include/linux/irqchip/arm-vgic-info.h
>
> +ARM GENERIC INTERRUPT CONTROLLER V5 DRIVERS
> +M:     Lorenzo Pieralisi <lpieralisi@kernel.org>
> +M:     Marc Zyngier <maz@kernel.org>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5=
*.yaml
> +
>  ARM HDLCD DRM DRIVER
>  M:     Liviu Dudau <liviu.dudau@arm.com>
>  S:     Supported
>
> --
> 2.48.0
>

