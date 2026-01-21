Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCDCC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znL3FqJFgoZQ+jYpVJQrZRlVvx/qWn+dpE3wYAdqHK0=; b=wjc7yD8OppAHEu7XOYOJU7jgMm
	k2eqMHm+odGixI58BhlRCZTY9Ixyi16+2g+f11L+2h1El80TxJbywi8GIWeG/Ul+7jAhCFcQz4s8E
	Hv149qfEz8tfEPsIH6cNo96BfGktraUIKxZcIGIE6NQbjvorUPlI5th965YVX+CRMFV329Sv2fMTT
	YsjGIPrq9uOMow+a5NUZPkqy+rZOwiSP+xnRpxrtclPNtPZTE9XtOJI/8fmkgB64A0Yy6oWF2X5j5
	nwdoDvdjbkBpQYOvTxFR0fo3ySNALdam0I1azkQl+OPLGGwxLGdzyjQ3XFtQx9HAsaPV5QUlLhfBs
	OnimeBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaxI-00000005mrX-2Kf5;
	Wed, 21 Jan 2026 16:21:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaxE-00000005mqh-3Lw2;
	Wed, 21 Jan 2026 16:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDD414169D;
	Wed, 21 Jan 2026 16:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97712C4CEF1;
	Wed, 21 Jan 2026 16:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012471;
	bh=NGyz5uwtzeGyvCVcwevBJVgXM2mV1JFZjaxPNVyzlf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cFjVUj4H0wsckTkiSoxCEJxs+g1YF+sMLWNTHKCN39KcZ9O/bqtqPigbyqBHcrl6N
	 3hG/VgHHw8puwjROLu4lRTxSQpWTe/Cjs6i2kC6GYqqS2VIZEymFmeLkboIuxnyf3F
	 K8OYBfpuLkC8lVrd1wruo+keYfzUfqkD6uccp+TGLQ6v31JrUFlzWilKaBFXtIu/lH
	 O664njCntVWQIdJx/nLzAbpY2KUQxxwCk4WVXgK3pINcQ96LXfWJrKZqg2kq38r4cC
	 /6L4R9+46JTP7u5WegP+KZCt3suZdhkwS3TzQeLvVmzX4tROTrrGM7V5HItgn6mKYb
	 kfuFuG65fgl5g==
Date: Wed, 21 Jan 2026 10:21:10 -0600
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: net: Add support for
 Spacemit K3 dwmac
Message-ID: <20260121162110.GA3314848-robh@kernel.org>
References: <20260121071315.940130-1-inochiama@gmail.com>
 <20260121071315.940130-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121071315.940130-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_082112_887685_7D28D4E6 
X-CRM114-Status: GOOD (  21.31  )
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

On Wed, Jan 21, 2026 at 03:13:09PM +0800, Inochi Amaoto wrote:
> The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
> MAC (version 5.40a) with some extra clock.
> 
> Add necessary compatible string for this device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
>  .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index dd3c72e8363e..3c2c6cb6b10b 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -34,6 +34,7 @@ select:
>            - snps,dwmac-5.10a
>            - snps,dwmac-5.20
>            - snps,dwmac-5.30a
> +          - snps,dwmac-5.40a

You don't need this in select as the spacemit schema references this 
one.

>            - snps,dwxgmac
>            - snps,dwxgmac-2.10
>  
> @@ -108,6 +109,7 @@ properties:
>          - snps,dwmac-5.10a
>          - snps,dwmac-5.20
>          - snps,dwmac-5.30a
> +        - snps,dwmac-5.40a
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
>          - sophgo,sg2042-dwmac
> @@ -653,6 +655,7 @@ allOf:
>                  - snps,dwmac-5.10a
>                  - snps,dwmac-5.20
>                  - snps,dwmac-5.30a
> +                - snps,dwmac-5.40a
>                  - snps,dwxgmac
>                  - snps,dwxgmac-2.10
>                  - st,spear600-gmac
> diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> new file mode 100644
> index 000000000000..e69f3b60c51f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/spacemit,k3-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Spacemit K3 DWMAC glue layer
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: spacemit,k3-dwmac
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: spacemit,k3-dwmac
> +      - const: snps,dwmac-5.40a
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: GMAC main clock
> +      - description: PTP clock
> +      - description: TX clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: ptp_ref
> +      - const: tx
> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: MAC interrupt
> +      - description: MAC wake interrupt
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: macirq
> +      - const: eth_wake_irq
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: stmmaceth
> +
> +  spacemit,apmu:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to the syscon node which control the glue register
> +          - description: offset of the control register
> +          - description: offset of the dline register
> +

Drop blank line

> +    description:
> +      A phandle to syscon with offset to control registers for this MAC
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - resets
> +  - reset-names

spacemit,apmu is not required? Looks like the driver requires it.

> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    eth0: ethernet@cac80000 {

Drop unused label.

> +      compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
> +      reg = <0xcac80000 0x2000>;
> +      clocks = <&syscon_apmu 66>, <&syscon_apmu 68>,
> +               <&syscon_apmu 69>;
> +      clock-names = "stmmaceth", "ptp_ref", "tx";
> +      interrupts = <131 IRQ_TYPE_LEVEL_HIGH>, <276 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-names = "macirq", "eth_wake_irq";
> +      phy-mode = "rgmii-id";
> +      phy-handle = <&phy0>;
> +      resets = <&syscon_apmu 67>;
> +      reset-names = "stmmaceth";
> +      spacemit,apmu = <&syscon_apmu 0x384 0x38c>;
> +    };
> +
> -- 
> 2.52.0
> 

