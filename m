Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE2DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 18:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUW1+wM6wE9E5sI+N8I+dqVg9GKImy6JdTSSO/EwCtg=; b=hoOYQaAPMkJg3QpDTEVoYx8we8
	kzSFkChHIrEhgvWiXxRfpne0VfoSl9ChCv9IQrsnNxPrV8+FtYocCHNe7LpnKtD+w5npMXFDzudH9
	KzO+mXHI+rbvL+HVtsHIe3x06bwBxEt3P2T6aT3n310LaI/PQHxJzdrV0TY/Eu0FfnQNZ+RNoGap2
	JwyRG61mwu1oQz6Pu0Z2HSf7O/p1OtkZe4OIQEsim/v8UwvibXLb8g5Fl8OyMLdgNeJX9N+ye1oA7
	r0R2A3yzxeV4umH6nnmGviAvxCbZ/ypa75AXnLIjuLZBS9376uSwhzxktxUU7cHsw4lZO8jLWuoIS
	hOcs722w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81f0-0000000F51b-48oU;
	Thu, 24 Apr 2025 18:50:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81T5-0000000F39L-1Htp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 18:38:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso15689575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 11:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745519917; x=1746124717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUW1+wM6wE9E5sI+N8I+dqVg9GKImy6JdTSSO/EwCtg=;
        b=kKiTtbZ0z1yQYH59Gw4dGNajItHhnxfsZXE5/OJMX+8GmaUFH9/DIRPzpj8V5z2Oc2
         k+K2hNDhjHR/4iJY3Priu/KkA7uTu5lWzM33jUBhtNr85qJVagR05U68sQ4tcA07vg0h
         L6+70ORXW5dCiwsUWsd7ogbYhO8YlMctDFyM/sSTIqw3YcLBIMQExTsBHET2oMhNsVBk
         PYGEYITKw8IVNw4I7977ZzVBQshA4mIM+QcoJUYM0qZT8VGRT8DgEl625Y9ChO0NMhX0
         XE1GRig9Eoe6dEx4NBiQir310YMAOFoM9Ebjp0c/HwIv86g0eLRzk076B+ZF/zSejkYF
         Yu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519917; x=1746124717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUW1+wM6wE9E5sI+N8I+dqVg9GKImy6JdTSSO/EwCtg=;
        b=YK3aMAmFRn+9d0zxejhldfwN+rpAFRMJvAZPagJqyBylfG3msvaQXtGqj+aUVMCumF
         L3l3dGDd7XFLE94THTOm8qnUnrOgZ5laX4Vmm2myIfmgg4rDigIigKvgjbLwIb9GxKmf
         4vWdyNXA9IxCDuo0mHwLWfmOc0ixqaQgljtIzsxP8ru/YkY0I/mKoLDkzu9N8KET8/XT
         /SpMbE/NCidi7zAoghgO+RDTet5AoaJjQHkqvlVKKQviMvT6diL400grBrFsas72Vxtz
         lYVa5BiOtdqidzQsnSZgGjqbFXJ9yZnSBGyPEyBG3K1XWm+jKwty+KPpwPHgReRyqDnp
         8sQg==
X-Forwarded-Encrypted: i=1; AJvYcCWoPV4Na+l9DLJX+toMKPFgSouvGO+A1ml13zVk3NSbk6h8FHnPp/taI7G3Uh4kXsjfjU1NozGuRpTD63aSBw0d@lists.infradead.org
X-Gm-Message-State: AOJu0YyVdc4IuMmq398uNwddaHU2HPPvWNGODhNZXsJniaU0+kCix1lB
	voANCn5vPIEOfOk3C7uJnjz20s9NS6h/Z/ZRC90BdZ3i2o49pXRu
X-Gm-Gg: ASbGncsLfZDc/5gANz7JBU4a5cW1kPkuWrU9tKVXLOvSLgrNeFHeWWlvH79ale64CUR
	vNMIIb3E14cn5aZiPo2nfm3joXwvS2aUC02ubSqtGqMV0ZPMph57MZToiaKw7gaPSHc/VPxvSbt
	yI4D80BiQjBbYzOuE3Ibwt8PfyHeJJUPcYExkXtzokM18F8d14dzOMHtKCTe2vagC6SLlpd9NwM
	ao+SX2am72pPA61GIwuUN7peCwFQxGi7+75vZMNklp7CHuE95T9mPFyIly0OJOz8iXrX3GVrMeH
	qg49EGJQZJkbST55ZoW+DsbsP+cbFIyqr7wb0UbKoJX0++dfqUthAceNQJSAdqJIl23FaqXsDxb
	KtSyH0pNdQgpmWTlH
X-Google-Smtp-Source: AGHT+IEpAoErom85lXT+Ms+IZ5Pa5nv4OGyWLcc9eT62MXW2E/nESWqqbOj69cX0qNLPlyMUh70Wzw==
X-Received: by 2002:a05:600c:1e0a:b0:43c:fe85:e4ba with SMTP id 5b1f17b1804b1-440a3112c9cmr7440655e9.15.1745519916942;
        Thu, 24 Apr 2025 11:38:36 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e464eesm35491f8f.68.2025.04.24.11.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:38:36 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Andre Przywara <andre.przywara@arm.com>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, clabbe.montjoie@gmail.com
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board
Date: Thu, 24 Apr 2025 20:38:34 +0200
Message-ID: <4643958.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20250424150037.0f09a867@donnerap.manchester.arm.com>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <4ba3e7b8-e680-40fa-b159-5146a16a9415@lunn.ch>
 <20250424150037.0f09a867@donnerap.manchester.arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_113839_349595_D9C26173 
X-CRM114-Status: GOOD (  30.91  )
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

cc: Corentin LABBE

Dne =C4=8Detrtek, 24. april 2025 ob 16:00:37 Srednjeevropski poletni =C4=8D=
as je Andre Przywara napisal(a):
> On Thu, 24 Apr 2025 14:57:27 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
>=20
> Hi Andrew,
>=20
> > > > Just to be clear, you tried it with "rgmii-id" and the same <300> a=
nd
> > > > <400> values? =20
> > >=20
> > > Yes, sorry, I wasn't clear: I used rgmii-id, then experimented with t=
hose
> > > values. =20
> >=20
> > O.K, great.
> >=20
> > I do suspect the delays are not actually in pico seconds. But without
> > a data sheet, it is hard to know.
> >=20
> >        if (!of_property_read_u32(node, "allwinner,rx-delay-ps", &val)) {
> >                 if (val % 100) {
> >                         dev_err(dev, "rx-delay must be a multiple of 10=
0\n");
> >                         return -EINVAL;
> >                 }
> >                 val /=3D 100;
> >                 dev_dbg(dev, "set rx-delay to %x\n", val);
> >                 if (val <=3D gmac->variant->rx_delay_max) {
> >                         reg &=3D ~(gmac->variant->rx_delay_max <<
> >                                  SYSCON_ERXDC_SHIFT);
> >                         reg |=3D (val << SYSCON_ERXDC_SHIFT);
> >=20
> > So the code divides by 100 and writes it to a register. But:
> >=20
> > static const struct emac_variant emac_variant_h3 =3D {
> >         .rx_delay_max =3D 31,
> >=20
> >=20
> > static const struct emac_variant emac_variant_r40 =3D {
> >         .rx_delay_max =3D 7,
> > };
> >=20
> > With the change from 7 to 31, did the range get extended by a factor
> > of 4, or did the step go down by a factor of 4, and the / 100 should
> > be / 25? I suppose the git history might have the answer in the commit
> > message, but i'm too lazy to go look.
>=20
> IIRC this picosecond mapping was somewhat made up, to match common DT
> properties. The manual just says:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 12:10  R/W  default: 0x0 ETXDC: Configure EMAC Transmit Clock Delay Chain.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> So the unit is really unknown, but is probably some kind of internal cycl=
e count.
> The change from 7 to 31 is purely because the bitfield grew from 3 to 5
> bits. We don't know if the underlying unit changed on the way.
> Those values are just copied from whatever the board vendor came up with,
> we then multiply them by 100 and put them in the mainline DT. Welcome to
> the world of Allwinner ;-)

IIRC Corentin asked Allwinner about units and their response was in 100 ps.

In my experience, vendor DT has proper delays specified, just 7 instead of
700, for example. What they get wrong, or better said, don't care, is phy
mode. It's always set to rgmii because phy driver most of the time ignores
this value and phy IC just uses mode set using resistors. Proper way here
would be to check schematic and set phy mode according to that. This method
always works, except for one board, which had resistors set wrong and
phy mode configured over phy driver was actually fix for it.

Best regards,
Jernej

>=20
> And git history doesn't help, it's all already in the first commit for th=
is
> driver. I remember some discussions on the mailing list, almost 10 years
> ago, but this requires even more digging ...
>=20
> Cheers,
> Andre
>=20
>=20
>=20
> >=20
> > I briefly tried "rgmii", and I couldn't get a lease, so I quite
> > > confident it's rgmii-id, as you said. The vendor DTs just use "rgmii"=
, but
> > > they might hack the delay up another way (and I cannot be asked to lo=
ok at
> > > that awful code).
> > >=20
> > > Cheers,
> > > Andre =20
>=20
>=20





