Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D30AC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3njpwnWBUHdyjgi8K2/1wk/9cMLPfkLXGNSkvChm3CY=; b=Wh/tr/jy31JuIGei25CDicRpMc
	0GTaIhSLL0bpUYVlWdDHKlZiVcQDJdZjm09gF9poAD9Q8ZaJr5evkLbDnd0UscKcJFDs/KFDWtybA
	b+DJV/GqlIutgF098BGZCYeXqUK9OjRR2c+sm73Uh4qbS1ZSBiRuBtQVKbgLHpTRr4xPPVapCghRt
	DAqe2xATWfzZDN7XhgSu96wyXvlxLkZzRXdx+U7BOsbfBrPd7rnoNb+tkAbf4PhRtTSdDuOJV938T
	e5veY8ZxvzDX5qri7x0xEJSZ/UsKgRAF2ZKoB/vhIHlVaMvQ8OPQkiyT6iXHXltJtzHIE3XRW0GUZ
	oq2ag3QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxfy-00000000H43-3kEQ;
	Thu, 08 May 2025 09:36:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCx5m-00000000Brx-3rSa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 08:59:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a0b9af89f2so400682f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746694737; x=1747299537; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3njpwnWBUHdyjgi8K2/1wk/9cMLPfkLXGNSkvChm3CY=;
        b=IbwxeoOwc60KlXpXdQLyqWjXS1pcv1cP6npMgT1CG1N/k0AihlOjOrmI9ZjTrS8TAe
         rPMlWjkhNTNBvUFF1AM+J+mT00gGggYBeSlUOC+SpRI6Sxl5YfgZuQf99fvjPEpqNCfO
         eOl1yp23RFFRDm/XtWtXrNIC6IHqRVKs+ccxzHu/8uFaxIux1goE2AuuBwCxLg8GQcRg
         Zhho9h9bX7KL3vI+Ku7z0CdSVC3UAwLrJ7HYSXc3wIGjii+NjQjnXopvjVG12tZGXnr3
         fXlQZWqkGSfUoNu9XQ1QOfVIdbDgAebG9hFH+3u5rbHq9LWRnHCUkBuzucdl2Cs7EjVx
         eAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746694737; x=1747299537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3njpwnWBUHdyjgi8K2/1wk/9cMLPfkLXGNSkvChm3CY=;
        b=IzdGOGESzAVNwTKYi1GkgH5e0HWHN/Pw3xn02nrOlrqtXty++XF9HKAGbRmLotLycB
         0SNgX2mmJgcEJz4LMFHZiPmbuchuYWYy3zhiY7uQOb1sMYt8Tx2m9ccxtEWHrwo+PSQd
         tB17uCvKGlAzXhl8l8ihXdBlR5HIIBBNsb3E+yr/Hn4Vb488U95qoNDKNPSULDxlrfrH
         euwbUZWgSJ1hex35pQCZt7xFmM+KbxDW0bxl1GL1LSsbYLa9Kt04lxOziVWqcE1PlGFJ
         TfpIYp8dBTEZrMrBI32PkxuxAd8WzLKCUoZAYbebagMTfD71KSwrCWwbNOSIjmGNbfd1
         dtUg==
X-Forwarded-Encrypted: i=1; AJvYcCVd/5qcIWoc6uKWrY9bGR36utEuEOW/Zyj7XHhXxGVrpOEa+zQ+fn7CvPP56q6z+qeEvpPUB6MC3SB04KIlobkY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/cRdWPDVdCWjdN3SzrYl6K+LgrpNdcKa1QSgkil9BKfc74xrD
	q1Iocmc63Ru7IcXXXUgJavQmF25KDyIzEQ1J5WbHj80lpp6kqz6kpkAe1g==
X-Gm-Gg: ASbGncvLegMkkhFLYfCPA+HmKIZRiMf7pW27KLh37nrRWCxGgzsOdHzvSyViLQIEGmC
	ryFi/w2KL9QraEmfKGxk8foN+A3A1sZroPsPftAYykoz+/GcdSPcdYjBU+urQEiIUxPpbAyPaXr
	z6lFomzYqjWPJl9DcO44agvGWMAeZqEUte98UuWHvmdmnTp65jAVMaINT6Dnd6+znl9oAHt1nRL
	5RSSeN561d5LeRvdwZUW8vbMQUyc3dChIafZlvOajOeOi/AJHpW5+dtc+2ytMUAujWAalqH+xNe
	nnH1IFfF30D1lFOh1q/f5Y3jurbd6zlOPCOvZuWe9l5K1jHDIWB75ASOhIJPXOq9Q3iahYZs/JL
	5Da/37VB5ZwNpOGyTsXKFW97n4bVfd4oysyIPiQ==
X-Google-Smtp-Source: AGHT+IHRENLBMEe7YXiOL5c7kFEzTbBPsJlvi9dkV+r0VPyt0g4hUHwZfO3pKS1hsn8AmhRaqsQ5oQ==
X-Received: by 2002:a05:6000:40cf:b0:39c:1f19:f0c3 with SMTP id ffacd0b85a97d-3a0b4a39f62mr5477643f8f.46.1746694736993;
        Thu, 08 May 2025 01:58:56 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3bc0sm19961157f8f.35.2025.05.08.01.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:58:55 -0700 (PDT)
Date: Thu, 8 May 2025 10:58:54 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
Message-ID: <ry3rfjn5owscxkwf2ouqdc4rsdvdh6hi2bi7rqeiufh2oekakz@6eqkbwkumdcw>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-5-thierry.reding@gmail.com>
 <8a26a37a-26ce-41ef-96e4-10ee09ebe704@kernel.org>
 <12d0eac8-545a-4595-a1df-1dc52728ef54@kernel.org>
 <rz64mnhdb5vu42tcerlobmulkyxvpqgeeer43t57thwzxnrcou@6xcpuiiru66b>
 <0501c0b2-df78-4c93-9ca1-7f32767b0225@kernel.org>
 <kut7odtjumfmqia7to75yda4qwtsyhwmm3xejkwtfm7yxyap5t@icfpljkitpwp>
 <321bf682-71b4-433e-ade4-97e8c9839564@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bxazby72sxylsoos"
Content-Disposition: inline
In-Reply-To: <321bf682-71b4-433e-ade4-97e8c9839564@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_015858_960884_B9A02685 
X-CRM114-Status: GOOD (  33.75  )
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


--bxazby72sxylsoos
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 10:51:57AM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 09:59, Thierry Reding wrote:
> > On Thu, May 08, 2025 at 09:49:12AM +0200, Krzysztof Kozlowski wrote:
> >> On 08/05/2025 09:46, Thierry Reding wrote:
> >>> On Thu, May 08, 2025 at 09:40:38AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 08/05/2025 09:39, Krzysztof Kozlowski wrote:
> >>>>> On 07/05/2025 16:37, Thierry Reding wrote:
> >>>>>> From: Thierry Reding <treding@nvidia.com>
> >>>>>>
> >>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>>>>
> >>>>> Missing commit msg
> >>>>>
> >>>>>> ---
> >>>>>>  include/dt-bindings/clock/tegra264-clock.h | 9 +++++++++
> >>>>>>  include/dt-bindings/reset/tegra264-reset.h | 7 +++++++
> >>>>>>  2 files changed, 16 insertions(+)
> >>>>>>  create mode 100644 include/dt-bindings/clock/tegra264-clock.h
> >>>>>>  create mode 100644 include/dt-bindings/reset/tegra264-reset.h
> >>>>>
> >>>>>
> >>>>> Filename equal to the compatible. That's the standard convention fo=
r all
> >>>>> the headers since some years.
> >>>>
> >>>> Huh, I cannot find the binding in this patchset. Where is the actual
> >>>> binding added?
> >>>
> >>> The bindings for this are in
> >>>
> >>>   Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> >>
> >> There is no tegra264 in that binding.
> >=20
> > That's part of an earlier series I sent out (and linked to from the
> > cover letter). It's here:
> >=20
> > 	https://lore.kernel.org/linux-tegra/20250506133118.1011777-1-thierry.r=
eding@gmail.com/T/#m96bb396b352659581a9e71a4610c51e6ab4d5b6a
>=20
>=20
> Then this patch belongs there. Standard rules apply: binding headers go
> with the binding itself and the binding itself go with driver patch via
> driver subsystem tree. At least usually. Nothing here is different than
> all other vendors who follow such convention.

This has nothing to do with the bindings. We add clock and reset ID
definitions that are used by the device tree nodes added in this series.
There will be other patches in the future that add ID definitions to
these files when they will be needed by the device tree nodes that will
be added at the time.

> >> The header always goes with the binding and the drivers.
> >>
> >>>
> >>> There's no 1:1 mapping to a compatible for this because BPMP is many
> >>> things. It's a clock provider, a reset provider, a power domain
> >>
> >> Sure, that's fine.
> >>
> >>> provider. These definitions reflect the IDs assigned by the BPMP ABI
> >>> and we've used this structure ever since this was introduced back in
> >>> 2016.
> >>>
> >>> I don't think changing the convention for this is a net advantage.
> >>
> >> Headers still should match the compatible one way or another. Can be
> >> nvidia,tegra264.h
> >> (because -clock is redundant and you do not want to use the actual
> >> compatible)
> >=20
> > I get it. You want consistency. But what about consistency with earlier
> > chip generations?
>=20
>=20
> I will fix them after finishing my time machine. :)
>=20
> > Do you want me to go and rename all of these files?
>=20
>=20
> No, I don't want to change them, but I would be fine if someone does the
> change (although someone else might claim this is a churn). That ship
> has sailed, but at least we can start with new bindings.

Totally pointless, but... whatever.

Thierry

--bxazby72sxylsoos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcckoACgkQ3SOs138+
s6HuxQ//ac8xfzjdddtwASnBo3ZzwSG58AAMitjqUhOimrqLRXMqSTlPkD3QXvcl
VYB8JpRW0KYjo60nzf44noGlvi1y6hq0vspwNd43rjKm2wfyXfx+bsFwK4aOajFE
q+JG9/PBk0fFBcAEHj7wQG3iVA60bBFXp/6EQbiDcvvrjyl1Oysr7lmmAWVO1zuU
6JamkZJSt7nL7BNr8UbeCd9zV9r5M83L/vx2iX2ZLjt/4ekFUR/PKXwuHO+kDomj
eXU7hJTMlMzYZczHGZFSRGetnjYFwNw2nhngq5rNNOJPMBCjky6r53Ay5kKjWj7p
JGfE7u9jLwPvEZ8NkN5p4BdijUohmxsPMHhYAd0OJ+/3A7GVeBOM8BJgmKh8oeof
dFSqRinhsvJv8BN23yPEgUnB00PykvuPoe4qBKxIYlaQSzeNzL6HYYnDsBgu3HAc
UYDGl3cwYcbKsFJ+qm/u3BP0j+XNjnOKsjlAWjlPcPaNZMbYGryQUFn1UyIRR9jU
/Z4aQ3Mvl3qfLx3AhcsSis00IK0OAp7WG7FzcWALaseN5qlh0flKx87gFT8DMXLQ
T0nuh9Q8aR16RcTy5uzy+y8ymDUI74G9x0pImmut/tNhGgxlrrvBlKfexZ/0Qbng
vRqsBhAwm42rM0ff3XhtLDzhYlEo2Qfjs7wPUagHvY3nGg/Vl+Y=
=k/X0
-----END PGP SIGNATURE-----

--bxazby72sxylsoos--

