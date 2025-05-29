Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB4FC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrzF6F7p3iys9ZmtS67LJbnjTQLjnFCV1+9y0CgID24=; b=dTSOqTHrjx1JBXf7CN3KgZV6TM
	FXI/6rqyxcyZQc7DMmcbMSNnuEHNya4xhnwihUpDsiMZWlQjubFU8qGa2HNWVkb+d+9lvcI49uYA2
	C4TgARQqEZhX5IQD+D6VVeTh9ybPdwuWPP2CFlzUXv2EODoZNYnDKJ9k1LMR/95wL85HnczS+AgqG
	gn0EbZmkT67ypIvKpv40a5yVI1xYpu5Cxnv/1EuHocoogtpPwArjMSDv3hX2Ydiqf98HREcGFns2U
	3+3ZcazMEReaCygfEHS29k+1WH0Nm20/Gw+TX363YbTFtdE+rbp5lWUBJRYDh4xIAIbSqjx6S8pDU
	W5xGg/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdNK-0000000Frc1-0mu1;
	Thu, 29 May 2025 13:32:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKccL-0000000FlDF-1cV1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 12:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 83EC3A4F993;
	Thu, 29 May 2025 12:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807BEC4CEE7;
	Thu, 29 May 2025 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748522656;
	bh=/jrSP6yN6Ik99p3pz+dkFU53s4pI3KuRDwCiogvnSkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tETzAO10Nvjt+ZyDwwUYkxnnb7k7IPlXoWK0Ou9nutJvpwHXbL9PQPAIHdQWbW9P+
	 i/eKv/pr7s9QmdP41aPEWgM9A1BLa8m/cyc8El7qvA2GtyQz8PKm1R6yTGLBDyFOta
	 4phECYvwGjO2aQZVaExHqm+ukxROq3sfYT0PRpViXoa4PsSHRijcQ8ckoLMCGNAt5C
	 pBSF4q2gc+fAVCi2rQy6DejsAeJmNHEBWIjD9q2qnt9HpO1OsCTiMY8sBlvhdNCdy1
	 EnEYwiEGclOCWJ6biGq3THhiAJSHHOWU6oMcqqYx4yd0bM+Bhs1Bt4z1x/5Aes4BKR
	 REM8TjLEqH00w==
Date: Thu, 29 May 2025 14:44:07 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, peter.maydell@linaro.org,
	andre.przywara@arm.com
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
Message-ID: <aDhWlytLCxONZdF9@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_054417_576546_26F46208 
X-CRM114-Status: GOOD (  27.92  )
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

[+Andre, Peter]

On Tue, May 13, 2025 at 07:47:54PM +0200, Lorenzo Pieralisi wrote:

[...]

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c8d124c3aa63fd1ec24acb40de72ac2164adeebd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> @@ -0,0 +1,202 @@
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
> +      The 1st cell corresponds to the INTID.Type field in the INTID; 1 for PPI,
> +      3 for SPI. LPI interrupts must not be described in the bindings since
> +      they are allocated dynamically by the software component managing them.
> +
> +      The 2nd cell contains the interrupt INTID.ID field.
> +
> +      The 3rd cell is the flags, encoded as follows:
> +      bits[3:0] trigger type and level flags.
> +
> +        1 = low-to-high edge triggered
> +        2 = high-to-low edge triggered
> +        4 = active high level-sensitive
> +        8 = active low level-sensitive
> +
> +    const: 3
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    description:
> +      The VGIC maintenance interrupt.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +  - "#interrupt-cells"
> +  - interrupt-controller
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
> +      reg:
> +        minItems: 1
> +        items:
> +          - description: IRS control frame

I came across it while testing EL3 firmware, raising the topic for
discussion.

The IRS (and the ITS) has a config frame (need to patch the typo
s/control/config, already done) per interrupt domain supported, that is,
it can have up to 4 config frames:

- EL3
- Secure
- Realm
- Non-Secure

The one described in this binding is the non-secure one.

IIUC, everything described in the DT represents the non-secure address
space. Two questions:

- I don't have to spell out the IRS/ITS config frame (and SETLPI, by
  the way) as non-secure, since that's implicit, is that correct ?
- How can the schema describe, if present, EL3, Secure and Realm frames ?

It would be good if this schema could be reused in firmware to describe
the platform, for that to happen we need to have the questions above
resolved.

Thanks,
Lorenzo

> +          - description: IRS setlpi frame
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
> +          GICv5 has zero or more Interrupt Translation Services (ITS) that are
> +          used to route Message Signalled Interrupts (MSI) to the CPUs. Each
> +          ITS is connected to an IRS.
> +        additionalProperties: false
> +
> +        properties:
> +          compatible:
> +            const: arm,gic-v5-its
> +
> +          reg:
> +            items:
> +              - description: ITS control frame
> +              - description: ITS translate frame
> +
> +          dma-noncoherent:
> +            description:
> +              Present if the GIC ITS permits programming shareability and
> +              cacheability attributes but is connected to a non-coherent
> +              downstream interconnect.
> +
> +          "#msi-cells":
> +            description:
> +              The single msi-cell is the DeviceID of the device which will
> +              generate the MSI.
> +            const: 1
> +
> +          msi-controller: true
> +
> +        required:
> +          - compatible
> +          - reg
> +          - "#msi-cells"
> +          - msi-controller
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
> +      compatible = "arm,gic-v5";
> +
> +      #interrupt-cells = <3>;
> +      interrupt-controller;
> +
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      interrupts = <1 25 4>;
> +
> +      irs@2f1a0000 {
> +        compatible = "arm,gic-v5-irs";
> +        reg = <0x2f1a0000 0x10000>;  // IRS_CONFIG_FRAME for NS
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>, <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> +        arm,iaffids = /bits/ 16 <0 1 2 3 4 5 6 7>;
> +
> +        msi-controller@2f120000 {
> +          compatible = "arm,gic-v5-its";
> +          reg = <0x2f120000 0x10000>,   // ITS_CONFIG_FRAME for NS
> +                <0x2f130000 0x10000>;   // ITS_TRANSLATE_FRAME
> +
> +          #msi-cells = <1>;
> +          msi-controller;
> +
> +        };
> +      };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 69511c3b2b76fb7090a2a550f4c59a7daf188493..d51efac8f9aa21629a0486977fdc76a2eaf5c52f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1901,6 +1901,13 @@ F:	drivers/irqchip/irq-gic*.[ch]
>  F:	include/linux/irqchip/arm-gic*.h
>  F:	include/linux/irqchip/arm-vgic-info.h
>  
> +ARM GENERIC INTERRUPT CONTROLLER V5 DRIVERS
> +M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
> +M:	Marc Zyngier <maz@kernel.org>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5*.yaml
> +
>  ARM HDLCD DRM DRIVER
>  M:	Liviu Dudau <liviu.dudau@arm.com>
>  S:	Supported
> 
> -- 
> 2.48.0
> 

