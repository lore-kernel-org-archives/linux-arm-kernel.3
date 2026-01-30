Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDBDE6BF17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2hfas+OWqJcbZ6w1+Kimr6HVSADO3LaGmzUbd8jJBA=; b=YnXOlOxyh0K1A+SPg2yv5hFpMP
	hOLlGxGpAnlJwf/fQNyoPPp5R50hJVuxegw2aHqcaDgYYRpBkkka0tJmHBJq7165SNm2fPinPnxcx
	maTc/+1Rik8YEj/6dVii5e/7Mqs1q5n6rtWez6DaBjAeSgoOKiLPEkw/7ffd/p7Qwn/bJaijdYtww
	P+qaew9jmEZ8SitQegiBoZ2F462x0xtyG/8ZlascEEXvMmYj96IcCGOgaetLEyNGq7QOwbV3YR3o2
	+jrbkhSu1tBGGn/p66sxS5aSmOQzkxDqb/v3oshSFDe1cYEp6VSbXeg4jHpiKdDqYbNwihksKBeAx
	UpCgui7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpmg-00000001bNV-0aGA;
	Fri, 30 Jan 2026 14:47:42 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpmd-00000001bN8-1kCg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 14:47:41 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5033a2c4b81so24787641cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 06:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1769784457; x=1770389257; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m2hfas+OWqJcbZ6w1+Kimr6HVSADO3LaGmzUbd8jJBA=;
        b=PrYZ3Dvez2qqSn4rB5YH17boqU7vm3RwxJB20AYzwhOj1QLq07eI/ut/5PZ1gHOGwD
         zAu2xQ0tqalGUvM983ynwjCC6D0RjUri2KMRiqFKMc9BOm2L/DpUF1PtzcDon0ti/MCx
         dI1hk2dyySy/0C/3ugrWf1lgZd5A7efcyaF1zJqiUoEg6T4FNPk/EoQ7WMMcKKsvMgar
         cyyESY/pK9iDJmj9+sMtbgfnPIEHVUmGFyUCO4O4ms8+kjpzfmahTGa/u9nKT8d7ssts
         c1fKNU+t7MHyKJKggR8urgOY9fpbbcb82xMMD2Ps1VD39RCXy27h9FfVe5RphIlb+qwN
         zclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769784457; x=1770389257;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2hfas+OWqJcbZ6w1+Kimr6HVSADO3LaGmzUbd8jJBA=;
        b=PmESLyIXWcAwzZHuLHtVg0p7d3dobzwu2t+jCkapX5C/FW9wIMNRvVx99PTjTt48rx
         MMMheFW/kUB+tbhYgw/G4SxewKWVZ57Ia5j/iDsoDWJbSVgthpkRtj24LV1/qviG1bHx
         a5IQ7bu7U056JEDNFAml5kFnavVxy4If8niBpOKStg1nCeCOIIAVBb5ZeDOki9CT/aDJ
         6O5Y7CbVswOidFqeeAT8gfxpBwbwBQo7nF+SkLq242NysK4GC8u1KhU8HYzfQ+mBUwdU
         o57IpI+byKdsPPvy06RvRnQ2DFcM4AYMCyv9YDspqUoygJylbinMnbH4h5lMcJlL02M8
         9Fnw==
X-Forwarded-Encrypted: i=1; AJvYcCW0ScdissWt2z0o7iDPPTYeC9dsQb2kt/odEAYImTgXCrzI1SPgL9Rq1VMZdO+bWe9JB1ms2a/1TZ0UJDf7LKZT@lists.infradead.org
X-Gm-Message-State: AOJu0YzFMFmDID7uFp7MEqV/5rQTk12PTVLoLYVwtz/3XBAVL8LxmaNy
	aGvFSCSb8Nb4HQoruggRPzZUyJxXKg2S9M+xw0meah+kBEyMzx0CaNZVu3KDQLZuZZo=
X-Gm-Gg: AZuq6aLTIhcgC2h+4bDPPKKO9+AYLX9QahSo8N04u/uz2bVbhMKn/x+YsRcD8Ovst2p
	YK8aRQlDrSFiL3KK++c/Yslb1HwTgRkoQTdIaDoEWlS6eMQe7endQrzU3b4VLoizBj7iY3XFWJL
	JQfOXDRnGV82hLKE+09EZzO7DY8Q2hBWnFH7PxncNw8mHAKC2UMoQHjsMKnL4PtfSA1B5BHMiD9
	4BuoJLqPRN9fJ1WmBamWuQyP24UxhC5MAUDXZV5/92zgRjxK3DhNUfkynNDNFoykPoa0mtXDuDH
	A4+9+aT0E03ihInVQVDH07nzvgYjTf7erfknyIw6wP7V1tpRsswUWxaPRAc5bgOWOrACyVZUskJ
	1W4XE9wnmGWgO+O9efCjf9F8STCop1oUJ4Vcr41mneIUcfRxMT5NZ6ljNT9UTxqpdCR8ZTk15qU
	JPPiYOSh3thd5gEQQkqcarUQ7MfXI=
X-Received: by 2002:ac8:5a11:0:b0:4f1:ab79:fb18 with SMTP id d75a77b69052e-505d21c6bbemr33783391cf.25.1769784457458;
        Fri, 30 Jan 2026 06:47:37 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337cbde30sm58435431cf.33.2026.01.30.06.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 06:47:36 -0800 (PST)
Message-ID: <df8d5d5f28870752e77ec74f34fea7ceb6e97286.camel@ndufresne.ca>
Subject: Re: [PATCH] arm64: dts: imx8mq: Restore VPU G2 clock to 600MHz for
 4K60fps decoding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	benjamin.gaignard@collabora.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de,
 sebastian.fricke@collabora.com, 	shawnguo@kernel.org,
 ulf.hansson@linaro.org, s.hauer@pengutronix.de, 	kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, 	l.stach@pengutronix.de,
 Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 30 Jan 2026 09:47:34 -0500
In-Reply-To: <20260130084133.2159-1-ming.qian@oss.nxp.com>
References: <20260130084133.2159-1-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-i/sogahe4R0AwUuBxOvE"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_064739_729749_F6601E62 
X-CRM114-Status: GOOD (  21.08  )
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


--=-i/sogahe4R0AwUuBxOvE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 30 janvier 2026 =C3=A0 16:41 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> The VPU G2 clock was reduced from 600MHz to 300MHz in commit
> b27bfc5103c7 ("arm64: dts: freescale: Fix VPU G2 clock") to address
> pixel errors with high-resolution HEVC postprocessor output.
>=20
> However, testing shows the 300MHz clock rate is insufficient for
> 4K60fps decoding and the original pixel errors no longer occur at
> 600MHz with current drivers.

Tested on EVK, with the downstream DCSS driver, and this change triggers DC=
SS
underrun (which is related to the DRAM QoS erratas on this SoC). It also
sometimes trigger the "not all macroblock decoded" warning I added recently=
, and
we can empty IRQs, but these are handled now.

>=20
> Test results with 3840x2160@60fps HEVC stream decoded to NV12
> (the same scenario that exhibited pixel errors previously):
>=20
> 300MHz performance:
> - Severe frame dropping throughout playback
> - Only 336 frames rendered in 11:53 (0.471 fps)
> - Continuous "A lot of buffers are being dropped" warnings
> - Completely unusable for 4K video
>=20
> 600MHz performance:
> - Smooth playback with only 1 frame dropped at startup
> - 37981 frames rendered in 10:34 (59.857 fps)
> - Achieves target 60fps performance
> - No pixel errors or artifacts observed

That probably only true with the upstream DCSS + a small resolution embedde=
d
panel ? Can you clarify this setup, because the display drivers mainline ar=
e
very minimal. Would be nice to show you average DDR read/write bandwidth
utilization during this run for comparision.

Another information that bugs me, in the BSP code, the G2 voltage is increa=
sed
too, which you didn't do here. They also use the thermal 2 zone to kick it =
down
to 300 until it cools down.

Nicolas

>=20
> Restore the clock to 600MHz to enable proper 4K60fps decoding
> capability while maintaining stability.
>=20
> Test pipeline:
> =C2=A0 gst-launch-1.0 filesrc location=3D<4K60_HEVC.mkv> ! \
> =C2=A0=C2=A0=C2=A0 video/x-matroska ! aiurdemux ! h265parse ! \
> =C2=A0=C2=A0=C2=A0 v4l2slh265dec ! video/x-raw,format=3DNV12 ! \
> =C2=A0=C2=A0=C2=A0 queue ! waylandsink
>=20
> Fixes: b27bfc5103c7 ("arm64: dts: freescale: Fix VPU G2 clock")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> =C2=A0arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 607962f807be..731142176625 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -960,7 +960,7 @@ pgc_vpu: power-domain@6 {
> =C2=A0								=09
> <&clk IMX8MQ_SYS1_PLL_800M>,
> =C2=A0								=09
> <&clk IMX8MQ_VPU_PLL>;
> =C2=A0						assigned-clock-rates =3D
> <600000000>,
> -								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> <300000000>,
> +								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> <600000000>,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> <800000000>,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0>;
> =C2=A0					};
>=20
> base-commit: c824345288d11e269ce41b36c105715bc2286050
> prerequisite-patch-id: 0000000000000000000000000000000000000000

--=-i/sogahe4R0AwUuBxOvE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaXzEhgAKCRDZQZRRKWBy
9PeIAQD5M45/PuqurizwtvrI3NE0hSFwAP/bvFLOeVBaM9GzsQD+PGBAYJjzNYYA
DPbDkSTiWXrcCwv7P2Bo3/hz5rdgBgU=
=/XEy
-----END PGP SIGNATURE-----

--=-i/sogahe4R0AwUuBxOvE--

