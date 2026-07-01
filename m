Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FD8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 15:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTbkb9PNizd9LGcvfest9O/hgUQd1NGIQ+sGEr29HOQ=; b=aUQHC28hcEv+mAXBa23M6s00oT
	zm2qcSIDEFO+HJbdc793j4qRlLcoLrPqtPD9GiJYgd/PpJ33Bl1Xxf1p9nZf5iJIP9/GZhqtxTlRx
	3lA8WxtPO4fC8sahC/e+s7MDD6WZaPsNYAc90iiOOCmzyYmhTQplxqU9IvZzZ/dFyyd0ep8bVpSRD
	MW9eOYe8dR64CGqRmD3YHaL4i46/+SU0VsJV9VECclCN/Pbk3QwdG50+rGsMrIg53OErwaM6nivsQ
	FtZDZDvkvPUQF8BkPE411dfbspmzzO9TBYczQ+mAB08lxM9TGkCr62aYdyR7i+06kpfFC9MFLfwL8
	DJVL7GMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wewb2-00000002NBM-2JeJ;
	Wed, 01 Jul 2026 15:11:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wewb1-00000002NB8-2hVs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 15:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lTbkb9PNizd9LGcvfest9O/hgUQd1NGIQ+sGEr29HOQ=; b=YHMBAJAhWfpuUSwrKH0lfcnt5x
	6AFawMi4+C/strSRsUDFgQcaiKZNU1RH/1dP7pQn7QkKEes4YXObO2IwskozETpjSfxhJO5JzAd9b
	y0lWnEsAPvilAaX0eJXIoou3vUkiBV3IQnJWi+O4vZgQxQacpKr3cGuE17GBhzU5xTzmMwFfUQsV4
	N95gxOw1bQsY1kYplNltwlo55MSbCcZip4JkATLzWa0bd7dKsLXEcRepwSGMEtkE58RjGGPOz4Nl0
	JFx3T7bFnKaFr6yl8E00lsOcoAntyor/8fWNlDsZF5wMClbHu5dnKhE3ojBderBMSw8SM8cBkhFES
	nZPWeKVQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weway-00000002vEs-0kLd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 15:11:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 941691A0DBE;
	Wed,  1 Jul 2026 15:11:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6225360288;
	Wed,  1 Jul 2026 15:11:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83A59104C9645;
	Wed,  1 Jul 2026 17:11:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782918674; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=lTbkb9PNizd9LGcvfest9O/hgUQd1NGIQ+sGEr29HOQ=;
	b=bmYSG8aPQ1KMoP6ZmgZ1bSZof92ublO7R9gPm+t76+Y5Njw35/HF8NL9fWBX4LUVcZ/ryT
	6Caxt2QsZnoYLoV7Gdz4LvdciZdayzpRxMD4jGAsmKQgBVED5om661WmI1a8sfjsu+ZxWD
	Aq7qAb9DOK4EKmMlMslyYVpfpHHdpqkFeXn8qHvARnsO3uw9HdZRRQunf9/wIc5sp1dbsr
	sc/5tppUdga8i6Xq4nJuoVTFDkSUmFWddsATN1vCT9f3K/JSOn8oUC7slzxuyp4Gynt1rI
	ZxgKQIvWjNbeUc29j2jG6VmcsKXa8x3S4dX4qmIclyjvC9pSDspGw0zlBpzX4A==
Date: Wed, 1 Jul 2026 17:11:11 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add sii,wakealarm-output-pin
 property for S35390A
Message-ID: <2026070115111192951db5@mail.local>
References: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
 <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
 <20260701-bronze-jaguar-of-perfection-028bac@quoll>
 <45e8157be53c3d8827fcccece7f706968bc056d3.camel@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45e8157be53c3d8827fcccece7f706968bc056d3.camel@posteo.de>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_161124_332704_7B32FA94 
X-CRM114-Status: GOOD (  30.96  )
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

On 01/07/2026 13:25:41+0000, Markus Probst wrote:
> On Wed, 2026-07-01 at 09:35 +0200, Krzysztof Kozlowski wrote:
> > On Tue, Jun 30, 2026 at 07:22:21PM +0000, Markus Probst wrote:
> > > Synology NAS devices use the output pin for interrupt signal 1 to wake up
> > > the system.
> > > 
> > > Move devicetree bindings for sii,s35390a into its own file.
> > > Add sii,wakealarm-output-pin property to enable the use of the output
> > > pin for interrupt signal 1 for the wake alarm, which makes it possible to
> > > set an wake alarm on Synology NAS devices.
> > > 
> > > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > > ---
> > >  .../devicetree/bindings/rtc/sii,s35390a.yaml       | 54 ++++++++++++++++++++++
> > >  .../devicetree/bindings/rtc/trivial-rtc.yaml       |  3 --
> > >  MAINTAINERS                                        |  1 +
> > >  include/dt-bindings/rtc/s35390a.h                  |  9 ++++
> > >  4 files changed, 64 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
> > > new file mode 100644
> > > index 000000000000..31a578673870
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
> > > @@ -0,0 +1,54 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/rtc/sii,s35390a.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: S-35390A 2-WIRE REAL-TIME CLOCK
> > > +
> > > +maintainers:
> > > +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> > 
> > This should be someone caring about this hardware.
> He does have the majority of commits on this driver (excluding merge
> commits and commits not exclusive to this driver), although most of
> them are pretty tiny.
> 
> Who would you suggest instead?

I can take it but the point of Krzysztof is mainly that the ones working
on the driver don't necessarily have to be the DT bindings maintainers
as both are well separated.

I mostly did clean ups in the driver, Lorenz Brun submitted something
way more interesting.

> > 
> > > +
> > > +description:
> > > +  The S-35390A is a CMOS 2-wire real-time clock IC which operates with the
> > > +  very low current consumption in the wide range of operation voltage.
> > > +
> > > +allOf:
> > > +  - $ref: rtc.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: sii,s35390a
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  sii,wakealarm-output-pin:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [1, 2]
> > > +    description: |
> > > +      The output pin to wake up the system.
> > > +      Default will use the output pin for interrupt signal 2.
> > > +        <S35390A_OUTPUT_PIN_INT1> : Output pin for interrupt signal 1
> > > +        <S35390A_OUTPUT_PIN_INT2> : Output pin for interrupt signal 2
> > 
> > Does that mean device generates the interrupts?
> Yes.
> 
> Thanks
> - Markus Probst
> 
> > 
> > Best regards,
> > Krzysztof



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

