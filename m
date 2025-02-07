Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4991CC02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 14:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KBZdnubEKdi6STg94A52T5aXYCeylB6o8hYtV5L06s=; b=KUrooYn7GjY52baKgcIqlZk1ei
	wgz5zNBoelfGnuOlRN0ZE1V1zMNPsmADqPjYppEelQMkqANWNoeYXFt8x8AdOiCyClC4oBCeMkgAb
	Ti7H16PmJRcZ9uRD2FYTh3x81oKT2yFikS8otzPTevtTdvm/WqLSM8zfEzj/zNgoe77aCNO2EbikC
	pXZnO72OWJ7i/QNZo3xEat3HC/VrKL6KaOs7QM73+p6XANaX1v7ObuQ23gc2sqZPolx/ael+pD0X3
	ulUsei6+lg7Xek0uPGrN11QlORZ7VqCKKIfX/39gienOClB6Ur7xQb0X3wDGOxfM9dr/Sw/kO4pc5
	OuqIwfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPYn-00000009uMl-18wG;
	Fri, 07 Feb 2025 14:42:25 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPXO-00000009u5H-3oK1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 14:41:00 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38dc1dfd9f2so1118763f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 06:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738939257; x=1739544057; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1KBZdnubEKdi6STg94A52T5aXYCeylB6o8hYtV5L06s=;
        b=Th/I9JBxpPPhffKkG8RqMQ7tHo584G2AfjkEEzfVwIYieT9hidh/XL7TEPiXKInhSm
         fKSFx00Wg5JaT75VGMt9YvmaIXgsd4PQaFzBnw1HlMMBuQQG7NQWdNMd10/Wl4L9cYJF
         FACieBUvZ9KflvTq4ySXbLNv/snBXvm+a8VEfcGqwTnpsIm9ooCi7WTrUcw2yPdZ2ajU
         79U9YXiyufOohmdqJlykTIbU+reUgOr2RYXdrK9lqix6uZOw4jk6Q3WqxxhQFRVk3t8o
         pa8W3dW9UbUCGQnfIQ387NUjL3IX88xQUM8+HmAs2VGBh3VZaafQ6haotazkGRqJZJFr
         4R1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738939257; x=1739544057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KBZdnubEKdi6STg94A52T5aXYCeylB6o8hYtV5L06s=;
        b=jk4ob7bOjgM4YE5XT5RDxNxRoflMVAB+xxk8eyKZ6o+ODy3mRYPovqEmJVZ2S9mOL6
         c9AA5LEv2Up3Z41xxrXiT4cAirEBMZe+AzzWCMIFjs2gfX3Am4LbUryfL25rSrXqFx5L
         8v0gFlg7mO/kD8dK0nJekL+owTu3keQhBY+Xrn+eejK3yx16zQbcYd2XRXGBzIfeRRbH
         /RaM0RqM4dh3IJZZsgezLqYEdnBJKmN/Mvgp75gJ/DuDMxW6P9mK78tbIPHEhw36MTJh
         Lt7lnq9591juzOvT8JkaBbAh5byeWbuABBSxF2WUG9RMM1QuftAr/1k9R0FMLVwq9h86
         NrXw==
X-Forwarded-Encrypted: i=1; AJvYcCUx/jJoML06qXMlcTsTzHy+bovAp5VwBcGE+CIGinNoxB2JZMTMM7zGnFZ+a5zEGY8vgSuioE3Zn4/GO88utAce@lists.infradead.org
X-Gm-Message-State: AOJu0YwhTpleWX++m5Wyi5YlQUiv+CJJM+Aqh+XnosScv2Gn/OZlEUvl
	i+U6Ic5hvvRf8YUov4BHBSEgf4g+jxPhdDrEdEJwKeQ2J8uZTvBkKwgiS7KmOA8=
X-Gm-Gg: ASbGncuWsxiih2lz+hlYOrW6QbBKxU7l7/SZ25dp8wr4IfDtDxd9JIvuyG14vn26skD
	Auh1zJwuk9IuNh5JRpbRRGg++5iJn1zWrgACtDixhoyQHiFIDJa0pUhWfEyfUZJkbJY6l/XjqIR
	D/T8VnAjtVdecI/GQ5m3U+no9zEbeevAN7AtkKaiI6xlArwktj7V6BmwT2oGiNw4IflvpJSJUUy
	Y1wZ5zb1a3vhT6vVnLHcITcdybAvxkfp8sRW6JMWtC0Z8aX4QEmQdtKioCFUKJIXBovCBZrmCt3
	CzapV5wppX8=
X-Google-Smtp-Source: AGHT+IG7EL7Q9V4DQ+o18bpccPBxDu6gEZW584jUcL0IjgWm+axiLmV9dtxCXuoar414LarSWG/NcQ==
X-Received: by 2002:a5d:64a3:0:b0:38d:cf33:31c6 with SMTP id ffacd0b85a97d-38dcf3336e9mr992260f8f.50.1738939256923;
        Fri, 07 Feb 2025 06:40:56 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:3b5a:db2d:b2b7:c8b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc4458d71sm3584817f8f.63.2025.02.07.06.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:40:56 -0800 (PST)
Date: Fri, 7 Feb 2025 15:40:55 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andrew Davis <afd@ti.com>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
Message-ID: <ebsbaaxyatrcikoem75t2blkhhceuidq3wnj3r2hbezfcmtc3u@ptffexrigbff>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
 <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
 <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
 <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
 <639b4e3a-3f68-4fba-aa33-c46dcb6fc88f@linaro.org>
 <d6252b73-0bcc-4724-8144-d6a98c8980f8@ti.com>
 <74ee6d9b-fd78-4d8a-a94f-b2c4dc794b60@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="75tbd5owaa2jk4ua"
Content-Disposition: inline
In-Reply-To: <74ee6d9b-fd78-4d8a-a94f-b2c4dc794b60@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_064058_953196_6BF24AE8 
X-CRM114-Status: GOOD (  48.61  )
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


--75tbd5owaa2jk4ua
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
MIME-Version: 1.0

Hi Krzysztof,

On Mon, Jan 27, 2025 at 01:09:49PM +0100, Krzysztof Kozlowski wrote:
> On 24/01/2025 23:35, Andrew Davis wrote:
> > On 1/24/25 10:48 AM, Krzysztof Kozlowski wrote:
> >> On 24/01/2025 17:05, Markus Schneider-Pargmann wrote:
> >>> Hi Krzysztof,
> >>>
> >>> On Fri, Jan 24, 2025 at 09:22:54AM +0100, Krzysztof Kozlowski wrote:
> >>>> On Fri, Jan 24, 2025 at 09:19:49AM +0100, Krzysztof Kozlowski wrote:
> >>>>> On Wed, Jan 22, 2025 at 11:24:33AM +0100, Markus Schneider-Pargmann=
 wrote:
> >>>>>> Add compatible for ti,am62-ddr-pmctrl to the list. There is a DDR =
pmctrl
> >>>>>> register in the wkup-conf register space of am62a and am62p. This
> >>>>>> register controls DDR power management.
> >>>>>>
> >>>>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> >>>>>> ---
> >>>>>>   Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
> >>>>>>   1 file changed, 2 insertions(+)
> >>>>>
> >>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>
> >>>> Un-acked, I missed the point that you really speak in commit msg abo=
ut
> >>>> register and you really treat one register is a device. I assumed you
> >>>> only need that register from this device, but no. That obviously is =
not
> >>>> what this device is. Device is not a single register among 10000 oth=
ers.
> >>>> IOW, You do not have 10000 devices there.
> >>>
> >>> Do I understand you correctly that the whole register range of the
> >>> wkup_conf node as seen in arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
> >>> should be considered a single syscon device?
> >>
> >> I don't have the datasheets (and not my task to actually check this),
> >> but you should probably follow datasheet. I assume it describes what is
> >> the device, more or less.
> >>
> >> I assume entire wkup_conf is considered a device.
> >>
> >>>
> >>> Unfortunately wkup_conf is modeled as a simple-bus with currently 5
> >>> subnodes defined of which 4 of them consist of a single register. Most
> >>> of them are syscon as well. So I think I can't change the simple-bus
> >>> back to syscon.
> >>
> >> Huh... Maybe TI folks will help us understand why such design was chos=
en.
> >>
> >=20
> > Many of the devices inside the wkup_conf are already modeled as such.
> > Clocks and muxes for instance already have drivers and bindings, this
> > is nothing new to TI.
> >=20
> > If we just use a blank "syscon" over the entire region we would end up
> > with drivers that use phandles to the top level wkup_conf node and
> > poke directly the registers they need from that space.
> >=20
> > Would you rather have
> >=20
> > some-device {
> > 	ti,epwm_tbclk =3D <&wkup_conf>;
> > }
> >=20
> > or
> >=20
> > some-device {
> > 	clocks =3D <&epwm_tbclk 0>;
> > }
>=20
> How is this comparable? These are clocks. You would have clocks property
> in both cases.
>=20
>=20
> >=20
> > with that epwm_tbclk being a proper clock node inside wkup_conf?
> > I would much prefer the second, even though the clock node
> > only uses a single register. And in the first case, we would need
> > to have the offset into the wkup_conf space hard-coded in the
> > driver for each new SoC. Eventually all that data would need to be
> > put in tables and we end up back to machine board files..
> >=20
> > I'm not saying every magic number in all drivers should
> > be offloaded into DT, but there is a line somewhere between
> > that and having the DT simply contain the SoC's name compatible
>=20
> That's not the question here.
>=20
> > and all other data going into the kernel. That line might be a
> > personal preference, so my question back is: what is wrong
> > if we do want "1000 new syscons per each register" for our
> > SoCs DT?
>=20
> Because it is false representation of hardware. You do not have 1000
> devices. You have only one device.
>=20
>=20
> >=20
> > (and the number is not 1000, scanning the kernel I can see
> > the largest wkup_conf region node we have today has a grand
> > total number sub-nodes of 6)
>=20
> But what is being added here is device per each register, not per feature.

The register layout is like this:

0x8010 - 0x803c contains 4 clockselect registers
0x80d0 is the DDR16SS_PMCTRL regsiter
0x8190 - 0x8600 contains another 7 clockselect registers

I see the feature here in the block being clockselect registers. But the
ddr-pmctrl register doesn't fit into this so I opted to describe this
single register as one node as it looked to me like one feature. Of
course I would have preferred this to be different but it is not. Would
you prefer the clockselect registers and the pmctrl register to be
described as one syscon?

Best
Markus

--75tbd5owaa2jk4ua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd8KHufh7XoFiu4kEkjLTi1BWuPwUCZ6YbcgAKCRAkjLTi1BWu
P32tAQDDFpUCXnqpUVFgGzWKJ0+Btby4irHJR5AwUo6TBJspUQEA1cTFCuFIHwd7
sRPwiUaYo5lHGko/LxAGHjz/pMwiIAg=
=EDBB
-----END PGP SIGNATURE-----

--75tbd5owaa2jk4ua--

