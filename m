Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33881C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ts3dnJC+uruboeeufdDbrG+MSHz7hrc+y5uIHr8oVng=; b=0/IVJYT7/0Fb81VgANJz2k9J8+
	J3w/kaEFBcp+U+XPY4AEjWQYT/to3gdY7IaScxApY7hy54Lk0HwpPrYfwF9upsTZ/FSMPxXyZ8/6X
	UI9BG9PMiJvklGeQ/N9l5SauAtOvebrf5WXboo/I8yzkjDSYUa44MZR6Xugy5GKWS5mxoqyjsPBJW
	KxLDXEygv65mAxcrmUkIk8Vx/KpTvTNFMWcvL/9gsVd28CtD6oXgQye8OHH4gIzw0oE4V6YRhhr9n
	BTNr3PN/omAnMJtHcKTBYG8RUAOS0MEnjYaibyIT3i6X7bxF9+bDYKs8wD7QtfrAh4GcReDTrbJfo
	Lr66/1CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HyW-0000000BkPQ-0Gh4;
	Wed, 09 Sep 2026 13:04:28 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HyT-0000000BkOJ-242B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:04:26 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c25420fe973so1033656466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 06:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1788959062; x=1789563862; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ts3dnJC+uruboeeufdDbrG+MSHz7hrc+y5uIHr8oVng=;
        b=WuJL/JVUYWP56xhlFZTzlfjDK8ADnXlapjkWiJ2aMV64+7DodtYEsflaWIALHBUxJD
         QQp0TvKjno92KG2zu5m1Zyvci8cHnSWudr82UBP9xXm3o6P6Pd+fIAUtb7flevRMqSh2
         aef0DrFVaWEblxUi859SzVYJNaJFCUGdz0iXMyPnfXhvZiXreaJa+UIUFzwvBnnpgEWz
         GfO880zZhMB/cy/AoVvBeDi/1Grq0xcPozQ+12n5m5HQc8meH35iwXftcyTDLjuhX+j9
         /O+h3yagLcxi+QhTA0frov94WCwAwz6IoZ6aihjRfCMHSvjD1VZLmJuoQRrBkAU4Ca05
         ktPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959062; x=1789563862;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ts3dnJC+uruboeeufdDbrG+MSHz7hrc+y5uIHr8oVng=;
        b=Ki3fbTOJpJ4q8IiIoWGp1t4y3PqYQTKdHeUOINybIHs1LsG7ikX1MrxOAoryBA92W9
         rSRg2kLE3UKosztYyGLqoE0sg+RkgF6ZrXLfvZ2YOWDT0en68OKJxQVQxOH82BC8WcKz
         oW9JeqteOPiNa6Cfwh0FzHOj4TiDUOrsq1HqD+DYoQNPjXTmSAWYP8jzCnvxvWdqgPnC
         T4L4ZEstY4An4WLgrFuI/wvgEHMgGvFIOAnzBN+JjXof1dQp9N4YfPkgZQrslP40Yto5
         FK++DFElaC1eV5zv4GK6M3tBrR+0g8tW5rdevGX2lthk1MGZTG2wcGVKp0/MMRNkXQBj
         PuxA==
X-Forwarded-Encrypted: i=1; AKwUvBwTRNgpNKSno/urXYjt57b8IHchPhkl2TmMgVPCFkI5fNgoyM9SVD9SUUHtqJPnEAg0hAC0n/eWJchfbozvFRMQ@lists.infradead.org
X-Gm-Message-State: AFuF++nbHurkhVzSuC2tjgc9Uzwc9aFefbgusWTgLzmc1OM5Zzxcvga/
	B5LebuWBb9DzMQz3uiA3/MHxUUEG1AdGJR7jr4LjF713ZnGsY6eC/ee/FnCHKUt/zqs=
X-Gm-Gg: AYBFou06IVAMY+wcAWwBZyU+UMY9jIo0gR4YuiwFHSoFlHQzcgok7jHZ5gaZy+ptLYC
	8kjmpPbn/qVK3b33Utn5c8Ng74NIBqxxchIbmH7oPCTZ/BnrbAQmaczH7WKvquOF5dp4ZHR7L4e
	pLVKZKb9s0e5IqC0vCqzTA9MN12l1oAxsphxULlLcifmaBrK5ZvfT0meRIk3tKvJI7vDUUSz2HW
	GdeeneAF0S7/mKGuI4jKnI2smJad8Jw3+XG+CMnmCRbayR4TzUPTFaiM2ntM0oVkCVvbFAXvzIP
	cHqQYVwokq1bAtjC1pPn72x0oDfaGW7Qov5ub7xrpWuFPXmzVxoq3DsD24fRp/44yI0aPEYggjH
	GI86OUnUclg1q+HjSB0DNWuUxXv0eeMNHocgHozPyYGZIJ/NBMNTPfAqf4xZL63bUI8ZGypbBNJ
	B8uWue5aLhTDHrKzRfI9pEFmKb4hXGUfLeQReDiAWQO9qiwmhWlAtT0Cs0MGqpFGhxXqEAYcJCG
	joD2oTf+0UVJbijNIApTv0oK+FA4Hssk5Y4dQNFDby/7cX5b1pqJ76l5PJFNNA=
X-Received: by 2002:a17:907:1c09:b0:c25:8878:3e09 with SMTP id a640c23a62f3a-c260ca1f44cmr1371266466b.22.1788959061478;
        Wed, 09 Sep 2026 06:04:21 -0700 (PDT)
Received: from [10.86.8.48] (static-101-125-100-159.thenetworkfactory.nl. [159.100.125.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa01dsm770252766b.15.2026.09.09.06.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:04:19 -0700 (PDT)
Message-ID: <9af28de2a07f7965300b898994481ccf194a30da.camel@ndufresne.ca>
Subject: Re: [PATCH 3/7] arm64: dts: rockchip: rk3588: add an OPP table for
 the NPU
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Igor Paunovic <royalnet026@gmail.com>, Tomeu Vizoso
 <tomeu@tomeuvizoso.net>,  Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Sidong Yang <sidong.yang@furiosa.ai>,
 Diederik de Haas	 <diederik@cknow-tech.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>,  Jiaxing Hu <gahing@gahingwoo.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 09 Sep 2026 09:04:14 -0400
In-Reply-To: <20260909091825.10838-1-royalnet026@gmail.com>
References: <c58d711ff5c9a01cfd69c2ddf86bfd969b36cc63.camel@ndufresne.ca>
	 <20260909091825.10838-1-royalnet026@gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-vMgI82IkHW7sjh+hqtEY"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_060425_572435_2967A899 
X-CRM114-Status: GOOD (  51.83  )
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


--=-vMgI82IkHW7sjh+hqtEY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 09 septembre 2026 =C3=A0 11:18 +0200, Igor Paunovic a =C3=A9cri=
t=C2=A0:
> On Mon, 2026-09-08 at 15:44 -0400, Nicolas Dufresne wrote:
>=20
> Thank you for taking the time on this - and no worries about the PoC not
> being posted; the credit in the commit message was deliberate, the rates
> and voltages really were arrived at twice independently.
>=20
> > My impression, and I was to study this properly is that having the same
> > table on every core and adding the opp-shared set on it was actually
> > probably the proper way to describe this "single clock for all"
> > relationship.
> > [...]
> > I'm curious what's the right approach, and what is the real meaning of
> > opp-shared if I got that wrong.
>=20
> You got it right, and I got it wrong. The binding says (opp-v2-base.yaml)=
:
>=20
>   opp-shared: Indicates that device nodes using this OPP Table Node's
>   phandle switch their DVFS state together, i.e. they share
>   clock/voltage/current lines. Missing property means devices have
>   independent clock/voltage/current lines, but they share OPP tables.
>=20
> That is exactly the hardware here: one compute clock and one supply for
> all three cores. And it is not only documentation for non-CPU devices
> either: in drivers/opp/of.c, _managed_opp() only lets several devices
> share a single opp_table instance when the table node carries opp-shared;
> without it each device that points at the same node gets its own table.
>=20
> So the accurate description is the one you had: the same phandle on
> rknn_core_0/1/2 plus opp-shared on the table. Putting the table on core 0
> alone describes core 0 and says nothing about the other two, which is a
> worse description of the same hardware. I will change this in v2 unless a
> DT maintainer disagrees.

Great, let's hope a maintainer talks sooner then later, but it really looks
like the right approach.

>=20
> One consequence is mine to fix on the driver side, not yours to work
> around in DT: the driver currently picks the core that carries the table
> by taking the first core whose node has operating-points-v2. With three
> carriers that choice - and with it the name under /sys/class/devfreq -
> would follow whichever core bound first. That is a driver bug the moment
> the DT stops being lopsided, so it gets fixed in the same v2.

I was not aware of the component framework, but some of the gpu driver, and
recently some of the media drivers are using this framework to facilitate
the initilization of n-cores in one combined device. Just food for the mind
here.

https://lore.kernel.org/all/20260810-rkvdec-multicore-v2-4-986f89d22cdc@col=
labora.com/

>=20
> > We must not justify our DTS choices based on driver behaviours (or miss=
-
> > behaviour). We must justify it based on how accurate the hardware
> > description is.
> > [...]
> > It should probably be fine to not use opp-suspend, if transition back t=
o
> > 200Mhz works. It not fine if its to avoid a driver deadlock (argually d=
ue
> > to a bug).
>=20
> Accepted, and it is a fair hit. The paragraph as written justifies a DT
> choice with a driver limitation, and that is backwards regardless of
> whether the limitation is real. It comes out in v2.
>=20
> On the meaning: your interpretation matches mine, and it is stronger than
> "descriptive". The binding says opp-suspend "marks the OPP to be used
> during device suspend", and the devfreq core acts on it directly -
> devfreq_add_device() reads it into devfreq->suspend_freq, and
> devfreq_suspend_device() then sets that rate.
>=20
> Which leaves the question you actually asked, so I measured it rather tha=
n
> argued it. On an Orange Pi 5 Plus with this series applied, in-tree rocke=
t,
> the OPP table of 3/7 read out of DT, simple_ondemand with min_freq/max_fr=
eq
> left alone: 25 s of inference, then 60 s idle.
>=20
>   - The governor takes it back down on its own. trans_stat records six
>     transitions for the run - 200->1000, 1000->800, 800->1000, 1000->900,
>     900->500, 500->200 - and then 60129 ms at 200 MHz with zero
>     milliseconds at any other level for the rest of the window. The step
>     down happened within one 250 ms sample of the load ending.
>=20
>   - The transition completed, it was not merely requested. vdd_npu_s0 goe=
s
>     700 -> 850 mV under load and sits flat at 700 mV for the whole idle
>     window. In _set_opp(), when scaling down, config_regulators() runs on=
ly
>     after config_clks() has returned success, so the supply could not hav=
e
>     come back down to the 200 MHz voltage if the SCMI clock set had faile=
d.
>     All four voltages of the table were exercised: 700, 750, 800 and 850 =
mV.
>=20
>   - The clock summary in debugfs agrees, reading 200000000 for scmi_clk_n=
pu
>     after the load. I only sampled it after the load, so I am offering it=
 as
>     consistent rather than as an independent check.
>=20
> So the transition back works here, and by your own criterion it is fine n=
ot
> to use opp-suspend. This is one board and one part, so I would not call i=
t
> more than that.

If you can script the test, I can run it on Rock5B later on.

>=20
> Two things I want to keep apart rather than join with a "therefore", beca=
use
> joining them is what made the original paragraph wrong:
>=20
>   - What guarantees the rate across suspend is the driver, not the govern=
or
>     and not the DT. rocket_devfreq_suspend() in 5/7 sets the recorded boo=
t
>     rate itself on the system suspend path, and 4/7 restores it before th=
e
>     last core goes down and on .shutdown. That is the answer to "is it sa=
fe
>     without opp-suspend".
>=20
>   - Whether the governor walks back down to 200 MHz when the NPU goes idl=
e
>     is a separate fact, and it is the one you asked me to check. It does.
>=20
> opp-suspend acts on the first of those. Since the driver already puts the
> device back at its boot rate on that path, the property has nothing left =
to
> do here - and that, rather than any deadlock, is the argument v2 will mak=
e.
>=20
> Worth saying plainly: every number in the cover was taken with the limits
> pinned by hand, so this is the first time the governor was left to decide
> anything on this board. Your question is what exposed that.

I don't want to pretend the doc is ambiguous for this one, but its not 100%
fit, but is not 100% unfit either.

- opp-suspend: Marks the OPP to be used during device suspend. If multiple =
OPPs
  in the table have this, the OPP with highest opp-hz will be used.

I don't think we had to transition to 200MHz before suspending, but it
will be at 200MHz once resumed. I think some maintainer feedback here would
be helpful.

>=20
> > This is irrelevant, I think you can drop this paragraph.
>=20
> Agreed, dropped in v2.
>=20
> > Ack, this is safe thing to do.
>=20
> Thanks.
>=20
> Regards,
> Igor

thanks for working on this.

cheers,
Nicolas

--=-vMgI82IkHW7sjh+hqtEY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaqFZTgAKCRDZQZRRKWBy
9HjyAP4vbUUwrczBVQK/M6Ks4OklPUf8WieQQH7iOFv/VnvRAgD/cqMxwQeiF6s2
zTobwvQD9DoWkqU89RkQBfE66maJcA4=
=1ROv
-----END PGP SIGNATURE-----

--=-vMgI82IkHW7sjh+hqtEY--

