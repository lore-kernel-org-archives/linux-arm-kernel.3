Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E666CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBAXAZAAK2FtxoDd2n15ZSuLuPQ6DYQX29tnPTf6I0A=; b=p1sa5g9iVNwTwOAEZwSSj7nwCk
	Eaaehe+lPG4dVdIbleES3VVQGU4XD5eTuDkA7HLt7uf/9xhIinuW3W+2jRWHGDuKR61JtQiSRq9sr
	14hiyw7S2I6XwAe0tzJ6kJqw/gw5NyrgTbURhF/rNWGwMw8utJHRXKBoXPI9zzdt85md6npje2atD
	BfdZL03AUzyONnWMWBzT/tRSW303tbOCzYqHoi4+sJR/Eie7gHsDPaDKhFQ5/VFFs0DEnKgSYOMAy
	r/nEIA0AapVph6aRc/5AWGxqwmzmEXL6hqwjwgQnHjGe5dnxSLw1UhW/INuef9FAI8AT+FDDqW7nU
	Nj7RLvAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2Oh-0000000Avj3-2Ned;
	Fri, 26 Jun 2026 08:58:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2Of-0000000Avii-0Zjd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 08:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782464330; x=1814000330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gBAXAZAAK2FtxoDd2n15ZSuLuPQ6DYQX29tnPTf6I0A=;
  b=b5yLiE9KGoLpZB8eBxh1L3jSvDwpTfpeSU9r9Qygf4D5UJooi8RZLaKG
   qvEwTK+cn0GsBtR84QxNxcdKjWPPrYV017T5TS+AGY3fSYG6lJV+cULAA
   ArpBxnIduE57y//KJsIzvwOrBsnobHoEEsHNB0doCyZayvi/7r0nmZYWt
   n5W9gSxLyL6UemwSbHAk2JQL9v9T+v10YuIzrsmWGWNko6UNRs7tdTa2U
   FFyM4742qZnvZuHVR0i0yzM0MyAS+Vs5+Y6VLfHSwZndw5AMYIUkGI5n6
   Uip5NV0I6AZihznWUXOHGUn1OSHZUKUkqQ9uWTKksePE9AgfY9eiVmwoF
   g==;
X-CSE-ConnectionGUID: IvWDA/V0S8+NXI2DA7OsIw==
X-CSE-MsgGUID: W/2gxdW/TaO6gXqF0Utz7A==
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="asc'?scan'208";a="59724797"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 01:58:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Fri, 26 Jun 2026 01:58:47 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 26 Jun 2026 01:58:43 -0700
Date: Fri, 26 Jun 2026 09:57:53 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
CC: Conor Dooley <conor@kernel.org>, Joey Lu <a0987203069@gmail.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<ychuang3@nuvoton.com>, <schung@nuvoton.com>, <yclu4@nuvoton.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
Message-ID: <20260626-agreement-express-b16c71315f7b@wendy>
References: <20260625094449.708386-1-a0987203069@gmail.com>
 <20260625094449.708386-2-a0987203069@gmail.com>
 <20260625-bobbing-annotate-d1c4d6874ee2@spud>
 <20260626-zit-amuck-e743e58d2e15@wendy>
 <84b93c496fabdeee05d2f962a1b764fdbfaacdb7.camel@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oMGcdFhNmrqDF+5V"
Content-Disposition: inline
In-Reply-To: <84b93c496fabdeee05d2f962a1b764fdbfaacdb7.camel@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_015849_187408_5CA74499 
X-CRM114-Status: GOOD (  28.18  )
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

--oMGcdFhNmrqDF+5V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 03:58:14PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2026-06-26=E4=BA=94=E7=9A=84 08:22 +0100=EF=BC=8CConor Dooley=
=E5=86=99=E9=81=93=EF=BC=9A
> > On Thu, Jun 25, 2026 at 05:33:37PM +0100, Conor Dooley wrote:
> > > On Thu, Jun 25, 2026 at 05:44:43PM +0800, Joey Lu wrote:
> > > > +
> > > > +=C2=A0 - if:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 const: nuvoton,ma35d1-dcu
> > > > +=C2=A0=C2=A0=C2=A0 then:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 2
> > >=20
> > > Anything that updates the minimum constraint should be done at the
> > > top
> > > level of this schema. The conditional section should then tighten
> > > the
> > > constraint, in this case that means only having maxItems.
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 2
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 - const: core
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 - const: pix0
> > >=20
> > > Does this even work when the top level schema thinks clock 2 should
> > > be
> > > called axi?
> >=20
> > Additionally here, only have core and pix0 seems like it might be an
> > oversimplification. I doubt removing the second output port means
> > that
> > the axi and ahb clocks are no longer needed.
> > Is it the case that your device supplies the same clock to core, ahb
> > and
> > axi? If so, then you should fill those clocks in in your devicetree
> > and
> > this can just constrain the number of clocks/clock-names to 4.
>=20
> The clock controller of that SoC is quite weird -- it has only a single
> gate bit, but controlling 3 clock gates. All core, ahb and axi clocks
> have gates controlled by this single bit, so it's why currently it's
> modelled as only core clock supplied.

Yeah, then what's in the binding is definitely wrong.
Even if the same clock was provided to all clock inputs in the IP, all
individual clock should be listed in the devicetree - although it will
look a little silly to see clocks =3D <&foo 2>, <&foo 2>, <&foo 2>, <&foo 2=
>;
In this case, 3 clocks controlled by 1 gate bit is an implementation detail
of the SoC's clocking hardware, and not relevant to how the dc instance
should be described.

> Well it might be worthful to supply the bus clock before the gate as
> ahb/axi, especially axi, because both the AXI clock and the core clock
> constraints the maximum pixel clock.

Right. And looking at patch 4/7, and the wording:
| The Nuvoton MA35D1 SoC integrates a DCUltraLite display controller whose
| AXI and AHB bus clocks share a single gate enable bit with the display
| core clock, so the clock driver does not expose them separately. This
| patch makes the axi and ahb clocks optional in the probe.

It sounds like there's probably some issues with how things are modelled
clock wise in this device, unless this is not an accurate statement and
there's actually one clock provided to all three inputs. If they're
distinct clocks, with different rates, only having one exposed has a lot
of potential to be problematic!

--oMGcdFhNmrqDF+5V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj4/EQAKCRB4tDGHoIJi
0sgLAQDTZ355M4AEO2uZkBGTQ7oEMZkFXQdFbefyp5zI+AwZFgD9FvkomdGAUC4V
3G3h0sz6Ep5t2DWWrSj9oLBU7J3uQwo=
=jvWv
-----END PGP SIGNATURE-----

--oMGcdFhNmrqDF+5V--

