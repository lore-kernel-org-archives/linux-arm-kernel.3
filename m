Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4254D132DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5/tFLU69/UFF/BD0W5IOkxB/dZK4b8EjhKL4PhIeUM=; b=flrjmxfg8gOg2jKSprPgjMI3hu
	LiWIVm+69doXIZM9NzRI8tA2VwdVF6LRA/PvRRHAjX/b+OqcMKLTznJVG7NUEwFwTvfJs8L+i3oxm
	Krdd5w0p8SJSdn+XkQsR9zp3y5AkUFw1/0+EZqorSldOcizhwCX8JjYHeDsg9SRBRABTyOvTl1Zyj
	LnQ5bwGiC2G7GpWFXhqbRJSM0dyChpCN+RW2SXdCR9IgFYZ9KrC8MHHREArOLQBp2D/VYrijXNKgU
	6A03Gkzjs6gEudJwA40Du1HhBk7r2vrRnRNEsoW3fOF0sXy6NXctIoj2dDH8tLob61nCTlygoF4WS
	jyityviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7z7R-0000000EE44-0IpW;
	Mon, 04 Nov 2024 15:35:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7z1O-0000000ED5S-0ZsG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 15:29:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9EAA35C06B8;
	Mon,  4 Nov 2024 15:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A19C4CECE;
	Mon,  4 Nov 2024 15:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730734177;
	bh=ybw9MdStKY2mRG6BGWhQCORt2W0/m+A5jKvWJdS35aI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JkkOTtAZnqsqLQxgMZ9zqdLHGZV2m4R8q8yoCq2sOb+9I/iO+GJlCs+BXHFXxuHU+
	 8431uFMaql4kFK9Z6QKDt3SqAIQFOS0OpJWc2z1T4qE5wUEiHLGVwKgZbJ/EfQYHT0
	 zwkH7v4pBO26Q0ROHltm4F7qP+Jyspcwb0IFWxFEuTkD90bDH8XGwak/MLGW3Naemb
	 YWlB65ATkajZnNiZ2CIA0cSY4z7xoV93NceuXwofoO18f12SLLPiZPbtbrCngEEzwq
	 9/HN0UVCKjb2cUsD/q1+efS7KgY9+n8vQSI7Ikm3qc7BD4IsLm06rNb2apFD5mnDxF
	 WjQpOC7vLG5ZA==
Date: Mon, 4 Nov 2024 09:29:34 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
Message-ID: <20241104152934.GA129622-robh@kernel.org>
References: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
 <20241015105133.656360-2-ciprianmarian.costea@oss.nxp.com>
 <20241015211540.GA1968867-robh@kernel.org>
 <20241015212717.GA1983714-robh@kernel.org>
 <20241016160823c22ccb22@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016160823c22ccb22@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_072938_286468_353DF243 
X-CRM114-Status: GOOD (  42.49  )
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

On Wed, Oct 16, 2024 at 06:08:23PM +0200, Alexandre Belloni wrote:
> On 15/10/2024 16:27:17-0500, Rob Herring wrote:
> > On Tue, Oct 15, 2024 at 04:15:40PM -0500, Rob Herring wrote:
> > > On Tue, Oct 15, 2024 at 01:51:30PM +0300, Ciprian Costea wrote:
> > > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > > 
> > > > This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
> > > > 
> > > > Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > > > Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > > > Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > > Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > > ---
> > > >  .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 102 ++++++++++++++++++
> > > >  1 file changed, 102 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > > new file mode 100644
> > > > index 000000000000..3a77d4dd8f3d
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > > @@ -0,0 +1,102 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: NXP S32G2/S32G3 Real Time Clock (RTC)
> > > > +
> > > > +maintainers:
> > > > +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > > > +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - enum:
> > > > +          - nxp,s32g2-rtc
> > > > +      - items:
> > > > +          - const: nxp,s32g3-rtc
> > > > +          - const: nxp,s32g2-rtc
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  "#clock-cells":
> > > > +    const: 1
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: ipg clock drives the access to the
> > > > +          RTC iomapped registers
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: ipg
> > > > +
> > > > +  assigned-clocks:
> > > > +    minItems: 1
> > > > +    items:
> > > > +      - description: Runtime clock source. It must be a clock
> > > > +            source for the RTC module. It will be disabled by hardware
> > > > +            during Standby/Suspend.
> > > > +      - description: Standby/Suspend clock source. It is optional
> > > > +            and can be used in case the RTC will continue ticking during
> > > > +            platform/system suspend. RTC hardware module contains a
> > > > +            hardware mux for clock source selection.
> > > 
> > > If the RTC h/w contains a mux, then your mux inputs should be listed in 
> > > 'clocks', not here.
> > > 
> > > > +
> > > > +  assigned-clock-parents:
> > > > +    description: List of phandles to each parent clock.
> > > > +
> > > > +  assigned-clock-rates:
> > > > +    description: List of frequencies for RTC clock sources.
> > > > +            RTC module contains 2 hardware divisors which can be
> > > > +            enabled or not. Hence, available frequencies are the following
> > > > +            parent_freq, parent_freq / 512, parent_freq / 32 or
> > > > +            parent_freq / (512 * 32)
> > > 
> > > In general, assigned-clocks* do not need to be documented and should 
> > > never be required.
> > > 
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - interrupts
> > > > +  - "#clock-cells"
> > > > +  - clocks
> > > > +  - clock-names
> > > > +  - assigned-clocks
> > > > +  - assigned-clock-parents
> > > > +  - assigned-clock-rates
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > +
> > > > +    rtc0: rtc@40060000 {
> > > > +        compatible = "nxp,s32g3-rtc",
> > > > +                   "nxp,s32g2-rtc";
> > > > +        reg = <0x40060000 0x1000>;
> > > > +        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> > > > +        #clock-cells = <1>;
> > > > +        clocks = <&clks 54>;
> > > > +        clock-names = "ipg";
> > > > +        /*
> > > > +         * Configuration of default parent clocks.
> > > > +         * 'assigned-clocks' 0-3 IDs are Runtime clock sources
> > > > +         * 4-7 IDs are Suspend/Standby clock sources.
> > > > +         */
> > > > +        assigned-clocks = <&rtc0 2>, <&rtc0 4>;
> > > 
> > > That's weird...
> > > 
> > > > +        assigned-clock-parents = <&clks 56>, <&clks 55>;
> > > 
> > > I'd expect these should be in 'clocks'. I don't think this node should 
> > > be a clock provider unless it provides a clock to something outside the 
> > > RTC.
> > > 
> > > Looks like you are just using assigned-clocks to configure the clock mux 
> > > in the RTC. That's way over complicated. Just define a vendor specific 
> > > property with the mux settings. 
> > 
> > I just read v1 and got told use the clock framework...
> > 
> > I disagree completely. Tons of h/w blocks have the ability to select 
> > (internal to the block) from multiple clock sources. Making the block a 
> > clock provider to itself is completely pointless and an overkill, and 
> > we *never* do that. Any display controller or audio interface has 
> > mutiple clock sources as just 2 examples.
> 
> And in 6 months, we are going to learn that the rtc is used to clock the
> wifi chip or whatever and we are going to need to add everything in the
> CCF and we will have an unused property that we are going to have to
> support forever to avoid breaking the ABI. This already happened...

For that to happen, the RTC needs to have a clock output. AFAICT, from 
the series it doesn't have any clock output. If it does have an output 
clock, then yes, I would agree with you. But I only know as much as what 
is put here about this h/w.

Rob

