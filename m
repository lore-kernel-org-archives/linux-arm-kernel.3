Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F071C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssfsPCsBLCz35Jf8lbYJnVGRPUluymWTo2E6cM1OV8Y=; b=dQQc1Z11bb9m8hmGdPT+B0MnoU
	/8evx3cef9c9EdLpPTjQSw46NLsWpGf55B1ngUfjZ768TBaVlqlZvlgtBdJqRRV/kunWIEpChejLX
	p/SPyemXUsHdyN7ZafCkFrlbogf1FHUmMYTw1dCXE/OtscdABMimZXu8FODGWUDasfCnZ3LreYaUY
	ga0wfgddjpj/gFhuy9A33D9/g3TFXNmDiVNMIr9zUg+G5GE565yk9snysmRf4eSHMXqoBrGpCYbQj
	Kmh4aQL+w62eyGBwljHV9tyV270krWSzdAOnShkCOl6A7hOWf6gsiE+BbjWiLJF2BS2nQQtPS+odp
	RQ9DcoIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ELN-0000000BkQy-01uY;
	Thu, 17 Sep 2026 15:48:13 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ELJ-0000000BkOG-3OtE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:48:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1BE571A0936;
	Thu, 17 Sep 2026 15:48:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC43F60580;
	Thu, 17 Sep 2026 15:48:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4ECC11C7B08E;
	Thu, 17 Sep 2026 17:47:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789660082; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ssfsPCsBLCz35Jf8lbYJnVGRPUluymWTo2E6cM1OV8Y=;
	b=e3X8JRPfeqvC+gDpr+zTPo8isxTF9b0OLruJXI9mZfMKdVyPBYF68RVHFsFy4BgBFdrEZ5
	WtmEnxOheTyoUCd+nBey/jwRV1ZTLUnTeYleDoYgQEgsucKqzY9lCdC0iSWjemCajZv9z9
	5CYFMqOUI3TH8Fouexr4RgHre93Vqp1q5M6lJcpAlLAcR5Tn8b/3glXkZuiJlITOmBgKqV
	RttkBZHdPtc/FnQ8wmjaqRaqCGT7tGR8kxdoKz5RhPNaGr20RaNkBW/b7bo8dSVPGHgM8W
	L9PE2zfpwn6UOgN5ZSzgZYCJtZ6i3k4uGG1q7XTJaeXsKV7ggUusyTVUHO0/WA==
Date: Thu, 17 Sep 2026 17:47:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: i3c: Document the AST2700 I3C controller
Message-ID: <20260917154754dd1eefbe@mail.local>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-1-19909e7cbd7e@aspeedtech.com>
 <20260907-imaginary-economic-oyster-57cdd6@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-imaginary-economic-oyster-57cdd6@quoll>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_084810_137101_FA73F35C 
X-CRM114-Status: GOOD (  32.46  )
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

On 07/09/2026 08:28:38+0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 01, 2026 at 07:35:28PM +0800, Billy Tsai wrote:
> > The AST2700 I3C controller implements the MIPI I3C HCI programming
> > model, extended with an ASPEED in-house control block and a PHY
> > programming window advertised through an HCI vendor extended
> > capability. Follow the existing aspeed,ast2600-i3c precedent of
> > describing SoC integrations of a common I3C IP in their own schema.
> 
> What precedent exactly?
> 
> Are you now bringing some LLM slop arguments here?
> 
> > 
> > The controller takes a core clock for PHY timing and two reset-names
> > lines: its own reset and a DMA engine reset shared by all I3C
> > controllers on the SoC.
> > 
> > The PHY timings derived from the core clock and bus rate assume
> > nominal bus loading. Boards with long traces, weak pull-ups, or
> > capacitive loading need different ratios and setup periods, so
> > document properties to override the push-pull and open-drain SCL
> > periods, the SDA TX hold time, the tCAS/tCBP periods, and the SCL low
> > period used for a repeated START or STOP.
> > 
> > Boards without external I3C pull-up resistors can use the PHY's
> > built-in pull-ups instead. The achievable resistance depends on the
> > voltage domain of the pins (high-voltage vs low-voltage), which can be
> > determined from the pin group assigned to the bus. Reuse bias-pull-up
> > (pincfg-node.yaml) for the strength in Ohms; it is declared on this
> > node rather than a pin-config node since the pull-up switch is part of
> > the I3C PHY, not the broader SoC pin control IPs.
> > 
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > Assisted-by: Claude:claude-fable-5
> > 
> > ---
> > We considered formally expressing bias-pull-up's dependency on a
> > pinctrl state in the schema, but couldn't find a clean way to say
> > "depends on whichever pinctrl-N is active" without hard-coding
> > pinctrl-0 specifically, which would be wrong in general (a node's
> > active pin state doesn't have to sit at index 0). We've added
> > pinctrl-0 to the example to illustrate the typical usage instead,
> > without a formal schema-level dependency.
> > ---
> >  .../bindings/i3c/aspeed,ast2700-i3c-hci.yaml       | 133 +++++++++++++++++++++
> >  1 file changed, 133 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2700-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2700-i3c-hci.yaml
> > new file mode 100644
> > index 000000000000..19ecb5b15038
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2700-i3c-hci.yaml
> > @@ -0,0 +1,133 @@
> > +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i3c/aspeed,ast2700-i3c-hci.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASPEED AST2700 I3C controller
> > +
> > +maintainers:
> > +  - Billy Tsai <billy_tsai@aspeedtech.com>
> > +
> > +description:
> > +  The AST2700 I3C controller implements the MIPI I3C HCI programming model,
> > +  extended with an ASPEED in-house control block and a PHY programming window
> > +  that are advertised through an HCI vendor extended capability.
> > +
> > +properties:
> > +  compatible:
> > +    const: aspeed,ast2700-i3c-hci
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    items:
> > +      - description: Core controller reset.
> > +      - description: DMA engine reset shared by all I3C controllers.
> > +
> > +  reset-names:
> > +    items:
> > +      - const: core
> > +      - const: dma
> > +
> > +  bias-pull-up:
> > +    $ref: /schemas/pinctrl/pincfg-node.yaml#/properties/bias-pull-up
> > +    enum: [177, 231, 261, 317, 400, 470, 550, 600, 750]
> > +    description:
> > +      Enable the PHY-internal pull-ups on SCL and SDA and select their
> > +      strength, in Ohms. High-voltage pins support 400, 470 or 600 Ohms,
> > +      and low-voltage pins support 177, 231, 261, 317, 400, 550 or 750
> > +      Ohms. When absent the internal pull-ups stay disabled and the bus
> > +      relies on external pull-ups.
> > +
> > +  aspeed,pp-scl-high-ns:
> > +    description:
> > +      Push-pull SCL high period. Overrides the value derived from the
> > +      i3c-scl-hz bus rate.
> > +
> > +  aspeed,pp-scl-low-ns:
> > +    description:
> > +      Push-pull SCL low period. Overrides the value derived from the
> > +      i3c-scl-hz bus rate.
> > +
> > +  aspeed,od-scl-high-ns:
> > +    default: 380
> > +    description:
> > +      Open-drain SCL high period.
> > +
> > +  aspeed,od-scl-low-ns:
> > +    default: 620
> > +    description:
> > +      Open-drain SCL low period.
> > +
> > +  aspeed,sda-tx-hold-ns:
> > +    default: 10
> > +    description:
> > +      SDA output hold time relative to the SCL edge.
> > +
> > +  aspeed,cas-ns:
> > +    minimum: 39
> > +    description:
> > +      Clock-after-start (tCAS) period driven after a START condition.
> > +      When absent it is derived from the SCL low period of the
> > +      applicable bus context, clamped to the protocol minimum.
> > +
> > +  aspeed,cbp-ns:
> > +    minimum: 20
> > +    description:
> > +      Clock-before-stop (tCBP) period driven before a STOP condition.
> > +      When absent it is derived from the SCL low period of the
> > +      applicable bus context, clamped to the protocol minimum.
> > +
> > +  aspeed,sr-p-scl-low-ns:
> > +    default: 40
> > +    description:
> > +      SCL low period used while preparing a repeated START or STOP
> > +      condition, kept separate from the push-pull SCL low period to
> > +      satisfy the MIPI I3C clock stalling requirements.
> 
> Probably I3C maintainers should weight in here and help - should these
> be made generic for all I3C controllers? I am surprised some "standard"
> I3C controller needs to configure this as the single one. No other ever
> needed...
> 

I guess we need to make them generic. Probably nobody needed them yet
and not all the controllers will have support anyway.
However, I would like to make sure we get enough commonality between
controllers that support setting the timings individually, can you
check?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

