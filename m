Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0F2D6B07A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xPewrTnC4l+CyqXM/D4+J5wgsUznZXa4GHAq6URBUw=; b=GP+o8RyAxgOpcdWhwIbsDpMzzq
	VVCVo3d4m+eccEBi7j/1zTfVGTNwHoEfXMzd7WTbdnv+hjB6WqvpcClZQqTnGdCBfZ+6GIP6oeugA
	2JVXfqA7npwpzMECubIvjCg6q9YSK26upvuAZD6UCdgOQMhh/c8lvA0apTgZdHtXDXY1Z+WxXJIeA
	0qyRZdQeOdMgqB7jDcPwFN6s+eyeA3sOIDuC1Y1+/Zyyasz3kAqpmQMcXQjAVRiN8Mof/3HeJV2bw
	/+e9CNNRspUlL75YSHVnPzl4qol4z2ExVDYA2A9JGuBDDIuTSU9uIPe8ZcmkgHDEk8r/mCdIXyq4z
	I6SeJLrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUhP-00000000KWE-36vb;
	Thu, 29 Jan 2026 16:16:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUhN-00000000KVt-2P98
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:16:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C34A54063B;
	Thu, 29 Jan 2026 16:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85063C4CEF7;
	Thu, 29 Jan 2026 16:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769703408;
	bh=ZKh+gwOXIrHUXWgIsde1vq5TQv6RVWGnWv4kiXsAKJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPBuSKsG8T4BCOrEBRaDWr8MG+IzuvfSTZjfiuYNld26Igdxvp+JkV67AHJHQMOjE
	 tcfnvilda9aCiR4vVSui0M8WxMjSRcVJSKjyE8pH8VdR9RiyEof8qoQftVKMWKuLUA
	 VMwEpMoBhxgTZj/epqG8Ds9XLp5IWMW/039AmDx898PWnf05qKj4EPNVo0d7ReszNV
	 L1COCTOGuT7VB/RLypoukJb/HjQz84NoC1+0+WWDUMeF5/hxM2fwD9EFxXzyxt/UA/
	 Sg0aStCqlUvW3E3MtZmzIn3zwXbAsDxfjr2KqjGQTZ1yNyAJnkx25yX750PtdkcBef
	 8DyFa8g0/YEEA==
Date: Thu, 29 Jan 2026 10:16:47 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	jens.wiklander@linaro.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 03/12] dt-bindings: bus: document the stm32 debug bus
Message-ID: <20260129161647.GA1176398-robh@kernel.org>
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
 <20260123-debug_bus-v5-3-90b670844241@foss.st.com>
 <089559fd-3c9a-4ff4-8732-bb23fa907be8@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <089559fd-3c9a-4ff4-8732-bb23fa907be8@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_081649_650122_565168E9 
X-CRM114-Status: GOOD (  19.41  )
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

On Wed, Jan 28, 2026 at 03:23:45PM +0100, Gatien CHEVALLIER wrote:
> Hello,
> 
> Does this binding file satisfy the feedback received?

Please check patchwork if you want to know the status of your patch.

> 
> Thanks,
> Gatien
> 
> On 1/23/26 11:39, Gatien Chevallier wrote:
> > Document the stm32 debug bus. The debug bus is responsible for
> > checking the debug sub-system accessibility before probing any related
> > drivers.
> > 
> > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > ---
> >   .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 76 ++++++++++++++++++++++
> >   1 file changed, 76 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> > new file mode 100644
> > index 000000000000..6c74433efbe3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: STM32 Coresight bus
> > +
> > +maintainers:
> > +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> > +
> > +description:
> > +  The STM32 debug bus is in charge of checking the debug configuration
> > +  of the platform before probing the peripheral drivers that rely on the debug
> > +  domain.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - st,stm32mp131-dbg-bus
> > +          - st,stm32mp151-dbg-bus
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  ranges:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  "#access-controller-cells":
> > +    const: 1
> > +    description:
> > +      Contains the debug profile necessary to access the peripheral.
> > +
> > +patternProperties:
> > +  "@[0-9a-f]+$":
> > +    description: Debug related peripherals
> > +    type: object
> > +
> > +    additionalProperties: true
> > +
> > +    required:
> > +      - access-controllers
> > +
> > +required:
> > +  - "#access-controller-cells"
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - compatible
> > +  - ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/stm32mp1-clks.h>
> > +
> > +    dbg_bus: bus@50080000 {
> > +      compatible = "st,stm32mp131-dbg-bus";
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> > +      #access-controller-cells = <1>;
> > +      ranges = <0x50080000 0x50080000 0x3f80000>;
> > +
> > +      cti@50094000 {
> > +        compatible = "arm,coresight-cti", "arm,primecell";
> > +        reg = <0x50094000 0x1000>;
> > +        clocks = <&rcc CK_DBG>;
> > +        clock-names = "apb_pclk";
> > +        access-controllers = <&dbg_bus 0>;
> > +      };
> > +    };
> > 
> 

