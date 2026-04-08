Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537581073CB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6LbHcTTP9FZbItc1diImmtUZwjMhLQ4smYNl2k6uQo=; b=I8YWZQvWZ6lEarp+u0vkuu10y4
	OaxoQ0/LFl55IrKppJ5vcM2k+uj55vQXrm4kmbPG93zpI/WoCKis7LE9Yrpemb0lVfW3eMBuqRPPk
	Tt5dJOuoxFOz3xsHHAkqBccg3TgSYMQESM3qHhNxPZ7L3HDoiDkH7zwidJE/KrUYluZUtImMYMVM7
	eaVU0nzvdGlxgPPxMQkYBzpe0aAV/kXhPl3owTx6b3MVAp+jrGGKJGE6b+T4tCEJVPMqyiQFmfGkK
	vGfPxccpkVE5qWfVAFgAC2Wt/2tYr9vNh6zvII8kbyStrzdjkPAgLhNVdxJVT5ERjPMs65D7qLkFC
	3yLrk8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAT06-00000008upd-29uS;
	Wed, 08 Apr 2026 13:31:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAT01-00000008unz-1UWN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 13:31:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E3194452C;
	Wed,  8 Apr 2026 13:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7A3C2BC9E;
	Wed,  8 Apr 2026 13:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775655076;
	bh=sqUO8WthhJzcAvxM38OAUGehd9oMK+15WBmzaWNn1p0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtN7MGYBrPtoBdayEGA8Bnd5JDJvLqhc+pJsd5pw0aUN5CcVQ2NLuFngCfmnH5qv0
	 iefrYkl1O+7pu18psbX3QN8D4M0iDwlJ3909aUSS3aPVNKUtF8YAB06ZiNj+G57h7X
	 EUDkawGKS+itWyQRGJCn2GDmU1bBZhnRusnH+GDjHj0JvVBlCS7LJMSfU+zpH2Vsc+
	 nZlsRiPeyTA9ygmbXB5NjRNzIRCxFmhRDmrZd6yAzzu87c5hIJ5tF2SooEn+uLHLD3
	 tfvz6+2KrpaupePD8ZBHGDPh7tHbtppsgqO6U7k05O8cKHBGKlZdzds0DfddJ35sX0
	 1M1uXixj4VREA==
Date: Wed, 8 Apr 2026 08:31:14 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
Message-ID: <20260408133114.GA1938858-robh@kernel.org>
References: <20260331-upstream_pinctrl-v5-0-8994f59ff367@aspeedtech.com>
 <20260331-upstream_pinctrl-v5-2-8994f59ff367@aspeedtech.com>
 <20260401-adept-zebra-of-bloom-5bb68b@quoll>
 <OSQPR06MB725204B2FAE543A71AEA52C38B51A@OSQPR06MB7252.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSQPR06MB725204B2FAE543A71AEA52C38B51A@OSQPR06MB7252.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_063117_443472_EAC37DE0 
X-CRM114-Status: GOOD (  20.13  )
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

On Thu, Apr 02, 2026 at 06:14:06AM +0000, Billy Tsai wrote:
> > > AST2700 consists of two interconnected SoC instances, each with its own
> > > System Control Unit (SCU). The SCU0 provides pin control, interrupt
> > > controllers, clocks, resets, and address-space mappings for the
> > > Secondary and Tertiary Service Processors (SSP and TSP).
> > >
> > > Describe the SSP/TSP address mappings using the standard
> > > memory-region and memory-region-names properties.
> > >
> > > Disallow legacy child nodes that are not present on AST2700, including
> > > p2a-control and smp-memram. The latter is unnecessary as software can
> > > access the scratch registers via the SCU syscon.
> > >
> > > Also allow the AST2700 SoC0 pin controller to be described as a child
> > > node of the SCU0, and add an example illustrating the SCU0 layout,
> > > including reserved-memory, interrupt controllers, and pinctrl.
> > >
> > > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > > ---
> > >  .../bindings/mfd/aspeed,ast2x00-scu.yaml           | 117 +++++++++++++++++++++
> > >  1 file changed, 117 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> > > index a87f31fce019..86d51389689c 100644
> > > --- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> > > +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> > > @@ -46,6 +46,9 @@ properties:
> > >    '#reset-cells':
> > >      const: 1
> > >
> > > +  memory-region: true
> > > +  memory-region-names: true
> 
> > Missing constraints. From where did you take such syntax (so I can fix
> > it)?
> 
> The intention was to constrain these properties conditionally for
> AST2700 SCU0 as done further down in the patch.
> 
> I can update the binding so that memory-region and memory-region-names
> have baseline constraints (e.g. minItems and maxItems), and then refine them in the
> conditional branches for AST2700SCU0, AST2700SCU1 and others
> 
>   memory-region:
>     minItems: 2
>     maxItems: 3
>   memory-region-names:
>     minItems: 2
>     maxItems: 3

As of this patch, you don't need that. You can just define the regions 
and names at the top-level. And the conditional schema only needs to 
disallow them for the appropriate case.

Rob

