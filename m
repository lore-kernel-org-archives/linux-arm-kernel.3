Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D83606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WP0fF8cJ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WqsXTXVi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eh+qRbA3bME5c1pRaWcGmkrqsIv0w4n8JsQ57iK626g=; b=WP0fF8cJrYDmYcdriiLytX1GRl
	sNLegdUv2wjG1WT3GcK+YTa2toX5l77HeF4thxuPIt6qMzq/v5Zhd/DqwH6A0AWYtmlthYKavcl8U
	nehLn1hJ6rm4zTqZPCo1CtwfVNwwgzo8PS/EI3FRhbe0XZX79axgl5TTu/3dKpTHqJHul6wLBzS8/
	h+sliBb9DwkuympUrxtqoIlIXoFAGt7yRS9syNhEc2mh8DNt+x3nDZIriUplD1a/eU5wgVaEZBvx7
	iDAIimd6sUCcc4STaKQYOGNNpzEPpOGW6qs8aR62E3EhirE7JNayx5vORCsaeCBUEiygIJCeg+7/P
	nYJNcqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMCx-00000003jGU-0rTb;
	Tue, 03 Nov 2026 21:38:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMCw-00000003jGO-0WNt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:38:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B323E43047;
	Tue,  3 Nov 2026 21:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACF81F00A16;
	Tue,  3 Nov 2026 21:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793741897;
	bh=eh+qRbA3bME5c1pRaWcGmkrqsIv0w4n8JsQ57iK626g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WqsXTXViNTQMa1esxLkXmZKYQh60GbH5Vpc58FocGNIpzbKlxVlV+lbThPu42BTik
	 VvjiLOUtGZxey/krutJ6N5PVXvR6/r55+9zqUR8RsgZZOW07WsP0eXMrsxUmoFBZKn
	 m9avJ3O6/DbYBE5tN8iduUYqwTAjOJ1rnPWKYpNmmOPQjfRfAxkB3RUfBToB/YjT+y
	 AY6n4d2Rna5BTnHGfYLMlS9Cfy0MFaCzb9SOtWf9R7mdXUHskjbNn9ppMCtp88R9JT
	 ihzPVSxMhChmLQ16m/krXpummoBj0b5/eQ+hUdJtJz0Sa0YsAv/GQ6rIVKley/gTe1
	 xw+KNHIlruQDQ==
Date: Tue, 3 Nov 2026 15:38:14 -0600
From: Rob Herring <robh@kernel.org>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: cpus: Add brcm,bca-smp enable
 method
Message-ID: <20261103213814.GB3951195-robh@kernel.org>
References: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
 <20261021-genexis-xg6846-smp-v7-3-rc1-v3-1-7c871f1755db@kernel.org>
 <20261022141541.GA1009304-robh@kernel.org>
 <CAHi4H7FpJJs0FqfCV=7bT26J642JTMgJ860hsDezKRET7q9TeQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHi4H7FpJJs0FqfCV=7bT26J642JTMgJ860hsDezKRET7q9TeQ@mail.gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 09:20:06PM -0700, William Zhang wrote:
> On Thu, Oct 22, 2026 at 7:15 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Oct 21, 2026 at 05:09:52PM +0200, Linus Walleij wrote:
> > > BCMBCA systems booted through CFE can release a secondary CPU by
> > > writing its ARM-state entry address to a 32-bit MMIO mailbox and
> > > sending a wakeup interrupt.
> > >
> > > Document brcm,bca-smp and its single-cell cpu-release-addr property.
> > > The boot CPU does not need a mailbox; secondary CPUs do. Add a
> > > Cortex-A7 example showing both CPU nodes.
> > >
> > > Suggested-by: William Zhang <william.zhang@broadcom.com>
> > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/arm/cpus.yaml | 36 +++++++++++++++++++++++++
> > >  1 file changed, 36 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > index 5be89c584026..6771b85f757b 100644
> > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > @@ -255,6 +255,7 @@ properties:
> > >            - amlogic,meson8b-smp
> > >            - arm,realview-smp
> > >            - aspeed,ast2600-smp
> > > +          - brcm,bca-smp
> > >            - brcm,bcm11351-cpu-method
> > >            - brcm,bcm23550
> > >            - brcm,bcm2836-smp
> > > @@ -471,6 +472,20 @@ allOf:
> > >      then:
> > >        required:
> > >          - secondary-boot-reg
> > > +  - if:
> > > +      properties:
> > > +        enable-method:
> > > +          const: brcm,bca-smp
> > > +      required:
> > > +        - enable-method
> > > +    then:
> > > +      properties:
> > > +        cpu-release-addr:
> > > +          $ref: /schemas/types.yaml#/definitions/uint32
> > > +          description:
> > > +            Physical address of the 32-bit MMIO mailbox read by CFE after
> > > +            a wakeup interrupt. Required on secondary CPUs. The kernel
> > > +            writes the ARM-state entry address before sending the interrupt.
> >
> > required:
> >   - cpu-release-addr
> >
> > ??? But cpu0 doesn't have an address. Is there really no address or you
> > just omitted because you don't really need it. Should still be there in
> > the latter case IMO.
> >
> > Alternatively, add the enable-method value to the existing section that
> > does this. Also, there might be other cases that are a 32-bit address
> > and need this same constraint.
> >
> Cpu0 does not need release because it is the boot up CPU.

I get that. Is that convention or h/w restriction? I seem to recall the 
arm32 kernel might require cpu0 booting, but I think other arches do 
not. What if you support power gating or hot unplug of CPU0? Then you'd 
need the address.

>  But there
> is no harm to add it to be consistent.

If there is an release address for cpu0, then yes, you should have the 
property. If there is not and you just have to make up something to be 
consistent, then you should not have the property.

Rob

