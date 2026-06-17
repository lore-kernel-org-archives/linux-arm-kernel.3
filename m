Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA7FCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 17:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZR64uMa2bAG9g6xt9cb3u96jXreT/Fybs92ONnyRO6s=; b=ELxUUBJoTKR9+x/7IXiVTXzPjW
	t98jxUZDcZtUcn3ZDUwbEOm97LQwWcJ+BsRTbz/lJwnyx3s4tgq1X7TRZv0H0uMFZhlpdNQFLdTRL
	nRvhcQxazKzJVVflXd9XRn9bbEHV3A/2ph9ne2JvufphZSX+u32MIjLwLmGvPF1TP5yLoi4ufYO2g
	dq3M99J1zYw2FulXua4Ep/q3YPO7UJFs/wRdroy1Q7iz/+Wj6X3ioSdH+1rmX+Evu6BnZ8M9iR8e/
	MdHeyMBCD7TgA8cX3nbUQwJ6EuNdK+d5fxGy4NuUq9vcFv7ibK0MfWDp9rTB/MrGDEKhAHFk3+Fwf
	mDWryT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZuN0-000000008FQ-1iCx;
	Wed, 17 Jun 2026 17:48:10 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZuMx-000000008F0-3shN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 17:48:09 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-462342ac290so101862f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 10:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781718486; x=1782323286; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR64uMa2bAG9g6xt9cb3u96jXreT/Fybs92ONnyRO6s=;
        b=UhzKGcL7t0Ux2A/7stqK3o2jzXur1T1/fyNokY6S2zWXsgVXVvzZQm6wQLLuR1+C8B
         RaUfIQfziBlg0tl0kbXFtwcQ3xaatWj4n9OV5yr26jXU1UMn5cHpXn7ptc3tT86fv9EZ
         IwYvfab1ZW1V+0726zWQ4SzZwN42sLXYAwrYvi/YhnNHtjg+ePmi1S+loBm9xj8BP6fg
         eotNFyy8ABkRueODFwH2QJgHASxl+SReuofmkErZ7ejA/hQYKXUnohIu5y8VSKRuKy+S
         dg3tP1QMr56LGYtI9skQg5K7ntoUBbI95UDgm+73COvNvcqhL+1v32I6i+y9vnGhyy4N
         FF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781718486; x=1782323286;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZR64uMa2bAG9g6xt9cb3u96jXreT/Fybs92ONnyRO6s=;
        b=lZ3UbABTVMhesqaLxyZ9bWGSxIalF1FdGHxpixcWCiM/yPpS99JLit9YbqkL0c3/uh
         9ShBEp0+PR0rpZqjFNyNavAkeYz7dc1f3d8TkYyctNmMPgS/+JNjOzj+iLhou8atnrHE
         o0Vdm4S9OjjodXg9KE3XB/vXc+/XDdQrs5/POJWNlpYg+IKgQZj1ECLPunLV/mw7YD6f
         kUhYrnf6qeAO5V9GmOz+d701rLcF8PaIiZe8U6M99LA0TDN0mVxX34UsDqZojKA9YIXn
         dNJ8Al7MWiadJkIlKPP19Cr7GuGUta6iHFFn0qz685QpX7KDHNt0RzEqD8nmwAIWbENE
         xipg==
X-Forwarded-Encrypted: i=1; AFNElJ/nMylwf/dg8hhCCkGplHfJm+QlqbFFObJ2E3jeXKVRa3iVR+scrJrGT7oKgMrokw0TNOUM+soUFSUSCrZwA7j0@lists.infradead.org
X-Gm-Message-State: AOJu0YwMEFxCOqHI3UP6Hnfj3z5hLH1QkiRtHAcf0J1q2B/QJSMXATHV
	DB3zETdhM3zmU92SnvnBMk8wdvRCWLGoAWEMRNaNOheL+T0WDBylMoCH
X-Gm-Gg: AfdE7cmLKu3ShtZzOyjv3mslp73RFDucTO7I9L1+t2A1nNq62R/NIlZg4RA+KTnHoEk
	zXP28tt5A5NKf2kxYUhdPX0Wa6MCug66SiIUxqp7nwV+PQdxoETAVfDsvzQIcueyAvEFP8e6ZRH
	UJLd17er3kL5RtaZcDCcB2TPPlECPNtlruBUbwesmAyhWMgpyDENHY1QgfRQHoaIv0MlBZoZOh6
	623hkXoHlem0lDsNU/MakrCO95D8qFfMK4bMvY3DS9bzP2C5oWjrIPMIc2wsG9DCm28SXVGyYQc
	S6rwjOgF/NYEDL4yEOiaoSfEvcMvbbI4Y6lOfkljmvKutEizqwDBZpvF0eleGJF0p6ZAr6PUla/
	JWtJ+HiyuR773UCiKoJ6nXioRez3iEv1nb5cHBPHY/SuHBray7y62ULvpxpfouKFwUGISBJ/eLc
	c+xLZ6K5XL1unZU2z4A+AYp3IC3Q==
X-Received: by 2002:a05:6000:1789:b0:446:db72:e8ec with SMTP id ffacd0b85a97d-46240cf95d5mr8421507f8f.23.1781718485787;
        Wed, 17 Jun 2026 10:48:05 -0700 (PDT)
Received: from strix.localnet ([197.250.227.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263945sm57712415f8f.8.2026.06.17.10.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 10:48:04 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v4 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock and
 reset bindings
Date: Wed, 17 Jun 2026 20:47:53 +0300
Message-ID: <-l2OM6P0RNSYRQfOSObOyw@gmail.com>
In-Reply-To: <20260617-tabasco-pulsate-454ed3f8f0b6@spud>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <20260616-zx29clk-v4-1-ca994bd22e9d@gmail.com>
 <20260617-tabasco-pulsate-454ed3f8f0b6@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartJBti3yevQCyGA81fgJgUkw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_104807_991125_C1D4BFB0 
X-CRM114-Status: GOOD (  14.77  )
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

--nextPartJBti3yevQCyGA81fgJgUkw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Date: Wed, 17 Jun 2026 20:47:53 +0300
Message-ID: <-l2OM6P0RNSYRQfOSObOyw@gmail.com>
In-Reply-To: <20260617-tabasco-pulsate-454ed3f8f0b6@spud>
MIME-Version: 1.0

Am Mittwoch, 17. Juni 2026, 19:08:02 Ostafrikanische Zeit schrieb Conor=20
Dooley:
> On Tue, Jun 16, 2026 at 11:26:21PM +0300, Stefan D=C3=B6singer wrote:

> > +F:	Documentation/devicetree/zte,zx297520v3-*
>=20
> Sashiko complaint here looks valid.

Yes, it is valid.

It also brought up another concern in patch 12 that has an impact on this=20
binding:

Am Dienstag, 16. Juni 2026, 23:42:19 Ostafrikanische Zeit schrieb sashiko-
bot@kernel.org:
> issue(s) to consider: - [Low] The `syscon-reboot` node is incorrectly
> defined at the root level using the explicitly deprecated `regmap`
> property. --

And indeed "regmap" is deprecated and I missed it somehow. As far as I=20
understand, to put syscon-reboot as a child of the clock, I need to add the=
=20
simple-mfd .compatible:

Either

topclk: clock-controller@13b000 {
	compatible =3D "zte,zx297520v3-topclk", "syscon", "simple-mfd";
	reg =3D <0x0013b000 0x400>;
	...
	syscon-reboot {
		compatible =3D "syscon-reboot";
		regmap =3D <&topclk>;
		offset =3D <0x0>;
		mask =3D <0x1>;
	};
};

=2D-- or ---

something@13b000 {
	compatible =3D "zte,zx297520v3-topcrm", "syscon", "simple-mfd";
	reg =3D <0x0013b000 0x400>;
	ranges;

	topclk: clock-controller@0 {
		compatible =3D "zte,zx297520v3-topclk";
		...
	}

	syscon-reboot {
		compatible =3D "syscon-reboot";
		offset =3D <0x0>;
		mask =3D <0x1>;
	};
};

I see both ways in existing DTS files (e.g. imx6sl.dtsi for the fomer,=20
uniphier-pro4.dtsi for the latter). Is there a preferred way? I have a mild=
=20
preference for the first, as it would keep all 3 clocks in the same way. If=
 I=20
go for the second, the clock driver would have to query its own node and th=
e=20
parent node for the regmap.

AFAIU unrelated to syscon-reboot option 2 would give me the opportunity to=
=20
have separate clock and reset nodes and bindings and skip the aux bus, but=
=20
this would not be a correct representation of how the hardware works.

--nextPartJBti3yevQCyGA81fgJgUkw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoy3ckbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiYhsQAIShhN0EMMLivsL4YTkw
5v1LXpB2e5pyTGJADq4zJ7jpoL5M5U66D/blUzW3M2QmTsbt5PpE2QrKp/mgImGI
TM3prev1qjMzHYov/LErP4wEcvShHPacjc3h2AFslmfJslU4iLOplzaHqxoJ2C4O
SqK8M6h9ggZofVn5f9ykwFu3/3OTWOrQD/vLO4PffYZPFzZn8d4j8gnUxDVio9yY
L9iVGedu8gvqMSCT2RGVeVsKFdXefaJXR7noAWvjyDusgzpiQX0HRYy8zEYcDcl9
sp0vGFq4lKNQlwkR5a1cU71m5HVegyq7E6BqC4zxVSCe7AcV2B/xYu5bRz7+fwi6
WEKdaafl8XvxtchAQyAG8prLZ722Fc1iNzE/Aa9adZBJA8BtxmNj/0Q1DmKT1cEe
0vjDwsN1brxvOuIoadocDxhfcD8CjBmDuUl+P9EPBzrOMicZchr7rlELZ/gTjqy1
fRebnrPsjspoc8LsvXPnuzNvVhxDIS69w7rQd74yu03SsMDzuJsYc39oYAuYWTpk
BcgrjlfMuiPDmGGnHEgUMtJDmzbyy9nfoiZXHpbD+V7KbD0Yv8hLdvjFbGaDDP9z
HOLdkQt4SKBTG4pAGym5UR5ztF2bvTSVAJedmacdn0dhkx7GcPu9hR5fvQMsbgQt
nf+USg3fU6CKa5Ynka2KN3Cx
=mLYQ
-----END PGP SIGNATURE-----

--nextPartJBti3yevQCyGA81fgJgUkw--




