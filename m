Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE039D1267E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 10:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnhOcDqM62BM39XeYtBpS6hPjPuyhp80jJ6lENbc2lQ=; b=q05PoxiCLK9t5I+krHH3atcwb4
	wTN/rCqvxcZG2Hv7x76/F6MEX3+bEjGO4OHK7mMaGt4keRuXWQsvyh2EZA4apCJUvJsV+tBtdlc3J
	7+1OwmHOE3WAu8cXoL02lCov8PMaE45AaGxUJiWplGO2pC+LRPTNpiImVepfLOk4GpISOmxoH3f1z
	m/f1lEf6GoQZ7SA3LrRLFN6NIViIDTw+8N26J2nHnOX7OrKcuQLFzmgDkQkuJiNVMUAhrxxN9tV9n
	PhY1eiPY5rtV6EDiIG0iOupH8PwFwpJM7vwLlBFrz6o8jmp+DURODBahNdEiT059AQ6OyNan6Cfac
	QTXKf37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8H18-0000000GhZ8-20uc;
	Tue, 05 Nov 2024 10:42:34 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GzA-0000000GhIE-3rSA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 10:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730803232; x=1762339232;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=HnhOcDqM62BM39XeYtBpS6hPjPuyhp80jJ6lENbc2lQ=;
  b=LEB1Q9d+qDW6OAgtE9QRElFKpXTq2oLWYKI552S0AxC6VNM9faaPIXIB
   If47PiHw0kHONsWxp8iIBpP4/bUAdbK8Ei+SiEFzuUmVkm51zjM6UhHo9
   m6uHj5G1o4sf/hVVIEST1+/y7iN8FwXHB6FZgzenm8l0pcVYvqxoURsvU
   DxGKrhaG9gDRCfIyJF3NPe5ZYNxiEBzkI35V1wKEMx16RVgJrkwsTqE6E
   dZ/E9xMLiy/LHmoh6afkl82Yom5idMy8gg0ithkYod+wt5JgMO1B9xzG8
   nhIHGpfJ3vlFnOpJ7+rQIkOGbqfvjoNjmf2dq7k3mhyvKEfcBCzPKW9Zd
   g==;
X-CSE-ConnectionGUID: AIkgqKuXSf2GqGYxRnWDAw==
X-CSE-MsgGUID: vkGBDWlmR2O3XtYPq2HK6g==
X-IronPort-AV: E=Sophos;i="6.11,259,1725314400"; 
   d="scan'208";a="39855291"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 05 Nov 2024 11:40:28 +0100
X-CheckPoint: {6729F61B-23-5736D786-D50827BE}
X-MAIL-CPID: 51C17FF78442E03FAB7181DB78149BC6_2
X-Control-Analysis: str=0001.0A682F22.6729F61C.004F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62129161302;
	Tue,  5 Nov 2024 11:40:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730803223;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HnhOcDqM62BM39XeYtBpS6hPjPuyhp80jJ6lENbc2lQ=;
	b=f3iygS1GUJvasDTnbGPHuttJdMX/2lqYoS/6+vCQ3Th8WLd+VqtaZU/BSlaJ4s76JNRSAd
	4AVJQzH467QFo8Vhb1O3Q5/0cXAPTZQXXN2QGfFk+aPT4ZCQgrqnmFE5SCCLwBv+oBHMKu
	6ZgBPDlVNnTJG/RauHtIV6h7Hw7SFQBOFzIV31ro/lK61PgD3/x09ma3pA4vqtLyhubA/2
	2ooJNAQpQUUkFORsFBckki5hutdrOo+0Zx488XI3HBHwWXZEsiofyFfZjFVGy6zF8DrFQT
	bDsPF6dlPkdL//VXddmybEYk1ZSkiApd7QJAaMaD1mH6DRCGsI8wYfXoTAgp/w==
Message-ID: <c73cac598788ccabd1791b1232e8fd9d7ce23ac6.camel@ew.tq-group.com>
Subject: Re: [PATCH 2/5] dt-bindings: arm: ti: Add compatible for
 AM625-based TQMa62xx SOM family and carrier board
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Conor Dooley <conor@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Felipe Balbi <balbi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>, Hari
 Nagalla <hnagalla@ti.com>, linux@ew.tq-group.com
Date: Tue, 05 Nov 2024 11:40:20 +0100
In-Reply-To: <20241104-floral-dexterous-7d3fee2ff616@spud>
References: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
	 <4f5ad877f44df35a3b2c7f336647f057c4e6377d.1730299760.git.matthias.schiffer@ew.tq-group.com>
	 <20241104-floral-dexterous-7d3fee2ff616@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_024033_699611_F5F2CBF3 
X-CRM114-Status: GOOD (  18.28  )
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

On Mon, 2024-11-04 at 18:47 +0000, Conor Dooley wrote:
> On Mon, Nov 04, 2024 at 10:47:25AM +0100, Matthias Schiffer wrote:
> > The TQMa62xx is a SoM family with a pluggable connector. The MBa62xx is
> > the matching reference/starterkit carrier board.
>=20
> Why all the wildcards? Why isn't there a compatible per device in the
> family?

For the compatible string we've chosen the TQMa6254 as the representative f=
or the TQMa62xx family.

MBa62xx is the proper name of the baseboard; this board can be combined wit=
h any TQMa62xx family
SOM.

Best,
Matthias



>=20
> >=20
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
> >  Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documen=
tation/devicetree/bindings/arm/ti/k3.yaml
> > index b0be02f9d1253..d8b52b95fba7b 100644
> > --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> > +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> > @@ -73,6 +73,13 @@ properties:
> >            - const: toradex,verdin-am62          # Verdin AM62 Module
> >            - const: ti,am625
> > =20
> > +      - description: K3 AM625 SoC on TQ-Systems TQMa62xx SoM
> > +        items:
> > +          - enum:
> > +              - tq,am625-tqma6254-mba62xx # MBa62xx base board
> > +          - const: tq,am625-tqma6254
> > +          - const: ti,am625
> > +
> >        - description: K3 AM642 SoC
> >          items:
> >            - enum:
> > --=20
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > https://www.tq-group.com/
> >=20
> Achtung externe E-Mail:=C2=A0=C3=96ffnen Sie Anh=C3=A4nge und Links nur, =
wenn Sie wissen, dass diese aus einer sicheren Quelle stammen und sicher si=
nd. Leiten Sie die E-Mail im Zweifelsfall zur Pr=C3=BCfung an den IT-Helpde=
sk weiter.
>   Attention external email:=C2=A0Open attachments and links only if you k=
now that they are from a secure source and are safe. In doubt forward the e=
mail to the IT-Helpdesk to check it.
>=20
> =C2=A0

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

