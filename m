Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E18CEA8545
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 21:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/5v+Crp++VTBrLnHYqmqlg39N1g9UgV39jx8JRu1pY=; b=ew+GtP9lfobhJrmNS21S6hBNQ0
	PCyUJQYIUr/Qax4oNDFbU27jhRO/cHkb+8e1XCEJk6kZvXnWhim5LC24RJdOadNDVoT+3YtJDpxXO
	MAGko3DbhZt33nqRgCQ9kjktC6MXYqShBK2SXPXWHwvqgyMe0a9V1vOwDjaCs1FIs7QEc2PgFG940
	sTtfkKFImoGEk662W6B9bIi4G78BuUgiM/wR/w1jtdUcjVv2LmtN+VevMCgsvDyjEO4fB/IUrvfPd
	ruHO29doORcvp2HFcfI03bC+tAd8p34zLWmh+lnwTPpw6LEbySgNWqY4MtRhx7+gRQiX5Adnc0QN6
	ZnPAB1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzLrL-00000006NYW-0yPM;
	Sun, 08 Mar 2026 21:40:23 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzLrF-00000006NXi-0g1R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 21:40:22 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-8cd73c4a827so211791185a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 14:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773006015; x=1773610815; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l/5v+Crp++VTBrLnHYqmqlg39N1g9UgV39jx8JRu1pY=;
        b=mdnnqSmCE65ls9SX9WcggWshLNHdeloZbEk5KllajWjFiCO16lGO8HQStfi6ej8Ncz
         WNLgAXvYCc0vyu89CCVn5b8f+X52wA0O+Ha6roA7RUyGiXJ8o1tD4qTxrX4EKLzzRvqb
         YJ+VIzwzxzgCrXJ2YYxC+oUIgaiYQ4VS4wTkZ75VDv3C6LI+yElsNopCOcZOFiGjuzv4
         qrQxGazvfIeOd6z3bIoFBZ/eAZks4qdllJ9P7MTE+ECTdojPWm6knSL1e5a1m1uyfp83
         NWWBuyTaYqMg/36NUKmG06maH6Uovr7CNoL37HwyA2W9imv9skpHF0Q0cexA8EtyZQey
         oAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773006015; x=1773610815;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/5v+Crp++VTBrLnHYqmqlg39N1g9UgV39jx8JRu1pY=;
        b=jR/NBhlB5xPgT+MN64zVaqPOY7r19qTc+7gbZGro+NQG+pTARN69HcFYyluwKr+ZnK
         LIVWuhKq5BYKUGkld/9HjDi14M4eXI3S7QxmbT5Z255ZhEdwbc1ZmhGah9f3eB3flmTA
         rsJMrnOwISa6Th3oXyvWjQ6ybnGNVH0/iBNTs70itAAp7lQetw3dl3G9qO04Enw8R417
         LMKnGOxA7aft1Nz+v1v9ydzIo1A6nAJxdog7fNLcJX72RHONh0ZMVkGonycydImYUHie
         nOr5S68CPmtz9GljCpGGldt/RCoSFGDbK4qI25YkuA2ocxeCn9P59B1lgCF7a709e+5R
         0EBw==
X-Forwarded-Encrypted: i=1; AJvYcCUJlBL5FMYoIuESHl7jMY2a5s3CrWT9oUcR+ZLz9EOzpwoDsl2YVOKwp973Z/FRV8sIIoIwLAiZzLnz3+fiS70Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1WbZGZ9vznpYDKRbxGVPwRx/mYmcQ78iow9C6IE96ccMpTJNW
	lQsEhfR7kdC3fG5NIcVfFa79u3TPqp06RNsjbbTSI53Z2C2/ZUY/PouedS+22dUUFD0=
X-Gm-Gg: ATEYQzyk2ey90sUztRT8S1+NJXdor6OFfgZvcn7M4Y48PiAz4wW0Pcn1UWyJrF0dCVl
	ASeRzMw8OUOPkgDbeLeWagYzH6WlnOpjTswDGdBlC5q43e8XGhHda76eEQKP+s5cPzZczYvEQu4
	FTdnxCJ1Yq+66MmZ1EG9HOug4jPIfGVhP9tmATsZ7iaUw4JKzNqux1jvJuG3QVHPDcwbfWXC9Hr
	eW9mQsa9LsuU+SXNkfPghchtQbDW0/cA8jbPFHA7yJnEXiuyHMXGjCzXqsI6rrgMfXVuQsU5uVx
	h5lgyd3lac+qlQCp5TM/T6r1Nmr/AJzEM1MR5TQ3ScT7TazP0bNQTLK99o908j6L45rOOXykBb5
	HY9g9K1n8OEDjX3PYqEPhcsZwk5krdoRjc3IRuA6v+XjDDCphkouasLtZaY1vCsiSRVvLUO8bS2
	L4y5ll3hqbv4ydx01bPfvxooeA81gr
X-Received: by 2002:a05:620a:1a9a:b0:89e:99b3:2eaa with SMTP id af79cd13be357-8cd6d40d37fmr1134703485a.8.1773006014866;
        Sun, 08 Mar 2026 14:40:14 -0700 (PDT)
Received: from [10.120.58.110] ([192.252.136.7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd8cad692csm21257585a.19.2026.03.08.14.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 14:40:13 -0700 (PDT)
Message-ID: <ee0fd1ecc6c940811cae743f087e96d348909c9a.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/3] media: rockchip: rkvdec: add support for the
 VDPU346 variant
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian Hewitt <christianshewitt@gmail.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Olivier =?ISO-8859-1?Q?Cr=EAte?=	
 <olivier.crete@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner	
 <heiko@sntech.de>, Diederik de Haas <diederik@cknow-tech.com>, Dmitry
 Osipenko	 <dmitry.osipenko@collabora.com>, Thomas Gleixner
 <tglx@linutronix.de>,  Dragan Simic <dsimic@manjaro.org>, Chukun Pan
 <amadeus@jmu.edu.cn>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun, 08 Mar 2026 17:40:11 -0400
In-Reply-To: <20251226113140.573759-1-christianshewitt@gmail.com>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-8MH3FGNDEj7hU0SQaMwz"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_144018_737928_2B243549 
X-CRM114-Status: GOOD (  23.30  )
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


--=-8MH3FGNDEj7hU0SQaMwz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

Le vendredi 26 d=C3=A9cembre 2025 =C3=A0 11:31 +0000, Christian Hewitt a =
=C3=A9crit=C2=A0:
> This series depends upon Detlev Casanova's current v7 series for VDPU381 =
and
> VDPU383 support [0]. It adds support for the VDPU346 IP block used for H2=
64,
> HEVC and (in active work) VP9 on the RK356X boards. VDPU346 appears to be=
 a
> close relation to VDPU381 used with RK3588, except with a single core, ou=
tput
> limited to 4K, and minor feature differences, e.g. HEVC level 5.1 on VDPU=
346
> vs 6.1 on VDPU381. To handle differences we declare a new compatible.
>=20
> The device-tree changes are derived from prior-art in Detlev's patches fo=
r
> RK3576 and RK3588, the vendor kernel [1], and some earlier patch attempts
> from Piotr Oniszczuk and Diederik de Haas.
>=20
> The register differences between VDPU346 and VDPU381 appear to be minimal=
 so
> we currently and intentionally reuse the VDPU381 h264, hevc, and regs fil=
es
> to avoid duplicating code. There is some evidence of buffer size changes =
in
> testing which still need to be explored. If further register analysis nee=
ds
> separate files for VDPU346 the refactoring will be beyond my current n00b
> coding skills and I will either need some coaching or would be happy to p=
ass
> the series over to a more experienced developer.
>=20
> NB: Testing with the v1 series showed lower mbps bitrate performance. Thi=
s
> appears to be resolved though it's unclear to me whether this results fro=
m
> kernel changes or the ongoing reworking of ffmpeg v4l2_request support [2=
].
> However with my current Linux 6.19-rc2 test branch [3] I'm now able to pl=
ay
> Jellyfish H264 and HEVC test media over 100mbps.

A fluster score and explained error report is missing your this cover lette=
r.=20
This will probably highlight some of the instability issues reported in thi=
s
series. I'll mark the series are "Change Request", as you have few review
comments and now this test.

Overall, I'd like to see probably investigations of the problem before goin=
g
ahead.

regards,
Nicolas

>=20
> Changes since v1:
> - Drop DO-NOT-MERGE patch as changes included in Detvlev v7 series
> - Adapt to variant/capability changes in Detlev's v7 series
> - Add bindings ack from Rob
> - Add rkvdec ack from Nicolas
> - Rebase against Linux 6.19-rc2
>=20
> [0] https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D10=
34794
> [1]
> https://github.com/rockchip-linux/kernel/blob/develop-6.6/arch/arm64/boot=
/dts/rockchip/rk356x.dtsi#L1539
> [2] https://code.ffmpeg.org/Kwiboo/FFmpeg/commits/branch/v4l2request-v3
> [3] https://github.com/chewitt/linux/commits/rockchip-6.19.y
>=20
> Christian Hewitt (3):
> =C2=A0 media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
> =C2=A0 media: rkvdec: Add support for the VDPU346 variant
> =C2=A0 arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X
>=20
> =C2=A0.../bindings/media/rockchip,vdec.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |=C2=A0 49 +++++++++
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 | 103 +++++=
+++++++++++++
> =C2=A03 files changed, 154 insertions(+)

--=-8MH3FGNDEj7hU0SQaMwz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaa3suwAKCRDZQZRRKWBy
9P8tAQD6X8K1OVv800JKuX4SsoOPaPlRfvbbnmOa6xHYfpuvYgEAuMC1QOrMqK1D
hcJLVPMGRf61xg3w0Zlr9mqYZ8vjFAg=
=8LZ4
-----END PGP SIGNATURE-----

--=-8MH3FGNDEj7hU0SQaMwz--

