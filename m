Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B63C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAM7j5fQB9lPdjO1SSxK15JUZTKVRDEjwTyBLBLdbg0=; b=S/Ozo88oP3dR8kZBNcAfqr60OQ
	HBUn4M7b2DnPZHFDn4Avm3I8UcqoF4cY80Ib5vMRyvW+Jxq1SP4PLwsyg26imlJ+/DKytNLFMKaQW
	dbmYhByG0rRMjAWG5yKex5TqW6PBy2DVd3qiuHy3hyirjIKt9DsmWiI6J78846i2gNxnnyWAaG/gZ
	E10q/uOVlwK7R2jHggJMEh+UJWeJ+w5r7HEUKfjAup8PgDGESs8FN1UC4wsjj4jiqbsfkhP4v9pGA
	LTuvWDpHON/S7UbsiKnOOVzwqrsfKjTZV49yjVZvJPBZ3xhuthH0kbc4vwM27M95bRcgJqFvmgQs+
	KJZ+1TCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNVz-0000000GbhT-3Avl;
	Wed, 08 Jul 2026 08:20:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNVx-0000000GbhD-37H3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 08:20:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32C9C60008;
	Wed,  8 Jul 2026 08:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5931F000E9;
	Wed,  8 Jul 2026 08:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783498816;
	bh=tAM7j5fQB9lPdjO1SSxK15JUZTKVRDEjwTyBLBLdbg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aiHjG5FoMWjwkqplKSyC6Z0HRMTU0vi8VYoM0h6WQEMyNkW0Pu6OBQs1hn4xHwsJZ
	 WS2AFd1+l9Lo/dfo3xF2PvvVPu77/LmSweFm/64r0iT04caYhKxCl52rGl/zKuEnKG
	 2Qi7h2HKLOLGKbaLrT75Rpxjoj+iSFy1IaVV2bP0Nf+2GKDWNllUuxcmvkZKQ+zU3E
	 2vkf74sW5VJa6qdZY7sMfoct3fmm7u1rnR9UKI/1cQtDDdWAMURHFOsJDvzgE8XsfH
	 FZdMym29eHeeBNDHgVQnjCKLQWHVH7TRkUalXVugiwUs7hHkRQW0rCvmj+0ixxJABh
	 3ipFl2YVX7xBg==
Date: Wed, 8 Jul 2026 10:20:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 04/12] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
Message-ID: <20260708-glorious-electric-octopus-e80abe@quoll>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-4-6c3e706e27dc@bootlin.com>
 <20260706-elfish-cornflower-bullfinch-604e0a@quoll>
 <DJRCWXDUGFY8.1AIUFSEBFTG94@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DJRCWXDUGFY8.1AIUFSEBFTG94@bootlin.com>
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

On Mon, Jul 06, 2026 at 10:48:32AM +0200, Paul Louvel wrote:
> On Mon Jul 6, 2026 at 8:52 AM CEST, Krzysztof Kozlowski wrote:
> > On Fri, Jul 03, 2026 at 03:30:12PM +0200, Paul Louvel wrote:
> >> Some QE GPIO pins have an associated interrupt line in the QE PIC to
> >> signal state changes on the pin.  Add the corresponding
> >> interrupt-controller / nexus properties to the QE GPIO binding.
> >> 
> >> Because the GPIO controller does not perform any interrupt handling
> >> itself, a nexus node (interrupt-map) is used to map each GPIO line
> >> supporting IRQ to the parent QE PIC interrupt domain.
> >> 
> >> As the QE PIC can be configured to generate an interrupt on either a
> >> high-to-low transition or any change in signal state, three
> >> interrupt-map entries are needed per GPIO pin that can yield an
> >> interrupt (falling, both, and the "none" case which defaults to both in
> >> QE PIC).  This overhead is necessary because the interrupt-map-pass-thru
> >> property is not part of the DT specification.
> >> 
> >> The interrupt-map property is optional: it is not required for GPIO
> >> banks that have no interrupt capable GPIO line (e.g. port D on MPC8323),
> >> or when interrupt functionality is not used.
> >> 
> >> Update the example to show a scenario where each bank supports a
> >> different numbers of IRQs, or no IRQs at all.
> >> 
> >> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> >> ---
> >>  .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   | 69 +++++++++++++++++++++-
> >>  1 file changed, 66 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> >> index 1af99339ff40..0c849a5698f4 100644
> >> --- a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> >> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> >> @@ -27,6 +27,17 @@ properties:
> >>    "#gpio-cells":
> >>      const: 2
> >>  
> >> +  "#address-cells":
> >> +    const: 0
> >> +
> >> +  "#interrupt-cells":
> >> +    const: 2
> >> +
> >
> > If this has interrupt-cells, then it is a nexus, thus why isn't this
> > also a "interrupt-controller"?
> 
> Because these these banks are not interrupt controllers.
> Interrupts are handled by the QE PIC, and the GPIO controller does not do any
> interrupt handling itself.
> In this setup, does it really needs an "interrupt-controller" property?

So this is interrupt-nexus, but not an interrupt-controller. If that's
the case of hardware, then it is fine/correct.

Best regards,
Krzysztof


