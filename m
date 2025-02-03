Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E324C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BXrdJDAlUgRqrgaymmaSYWRF0wWfscG1nGJMjIFxBE=; b=pphc7A7OphK1oPkYJziHkJM2ae
	n0pnU50onR2i9mLdlt1AkWhusTXoi67gKpzoku3IP/+hzGmDpv6cR/KSvjypMhQWcebFVQpuBPk2Y
	GfwFg6VYcypAUaX6ttvF7lp+83gsGXMH+cLAHv4CXvdzR8Qt+wPjOLehEAhP3N7fuU4Cl/Ktg9FOs
	+/RXq2PcalPxWsCDCNu7U0EeYwpWCNP1T1Yjk1WozucwOgZV70rpKAqlwVmyLSJHxj5vJfrXMdO8B
	0280zpCpfuJlesF2jjnzbSFzTWZmYelUw8pxmCOqGzwradGJWc8avjFGlo/hEY4YPBZaU/0Y7tq2c
	WJXd+jlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teupF-0000000FG5I-2Ded;
	Mon, 03 Feb 2025 11:41:13 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teunv-0000000FFuO-08Yg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:39:53 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5dca4521b95so2296000a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 03:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738582789; x=1739187589; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8BXrdJDAlUgRqrgaymmaSYWRF0wWfscG1nGJMjIFxBE=;
        b=d/ZIPYqfploYjN1pBPNMEl3GMspCYNiflPt24doURUbtrmvpcQDcJwHLGFpJi8YCQ8
         kqpXysIiQVT8g+t7UiGvT4t5B75G/hA+Pyrx+/pVpMjgpNXpXfqBYOl3y9K/nsYmubFa
         vOvAxZmHafEk2TE+2lbmmg7jSEz2LxjQIAN8tOA0XKTdrPgD/XtlehvZq6Ge+TD8tQc7
         4Knp6v/ND2n5kSb5WDd72drlQZiInPa5Tw91pfIwy2ZzS/NItmIF02RJMthQJPwa1IqW
         B5xigk4qCFfgZHj+UjrWYwqEpI2Up0chlkH/V0sradLUKyaCVYm4racLp/viY/olcYXG
         ph0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738582789; x=1739187589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BXrdJDAlUgRqrgaymmaSYWRF0wWfscG1nGJMjIFxBE=;
        b=DHsDsvicWYu3bBllN82was15sx+u8KGVwVWrbqXSUJTrJ5eLLIctzNRUoWwMQMjczT
         rKXKGMHrDVAgvEyFDt2SvxYzJjCA1PDZHx5ElO6bUtpxICxwR2lMPwl7ZBEkbzGUQD2s
         smS1Nbq4tNkjPtvrWUZR1MuINdOzKWbY/1iBB+9cFpVBwnOfcMLhNssE0LvVTZWYc3WA
         vEe0YzkJO9/c7ZUzQ2wHDRtvGDm2CQnvNT69DJf8wYUK9loY12EwPxrJuBH5YNy2+e3L
         4ihXDONYLM/YePX8gXOB+educp5hMD5974n249Nk8bPpUJdvavbRKKAHwB2SRUcl0lKU
         gmuA==
X-Forwarded-Encrypted: i=1; AJvYcCXkYCRe9Iw7BZuOtFYy69IHG6gJWRjdYGzKcdMsWRWN23URqxPrZe2Spb9yfgsat5+T+RhtGcmEJRkqE0+MA4b5@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo9Nsgh9TsBADYpYnb7BkpaAlvJ0ZT0CwbeGLCIwlZ0qKeVed+
	LvTDDwQ/CV2suisUOWuv65fi+lhGvDcf4s/VWd6t/AQGL8sVUkUiGifFXo3MSNY=
X-Gm-Gg: ASbGncuPn+XS4oKvbewDZu0St1ifrDSFBJx9b/HEfyzNDBdzKKFrXlrwqHLOz/eKnDN
	URU+BNwWW9gFNX8L9vRgwCSuItLyb94jCZhW0S6t8rc9vEWhFMFjZhGL9ddS6froXEI7hRKcOlQ
	NAe6i3AayoQFJliwyMGyA4/zVLrq1UBK1/cUe1NDztPL1Y7bFQ+gZsZVjMLmRyZzkUkNHz6ynAz
	tvN/XfaWjhb1uUIYKBixjHOVayOrmmVg/7OjkNE/xNyTz8rWvVkNFMP2Wep3BPpCSCgeVe5eWn7
	I+TGj3c12sjNV8HCHG101gAsdsQvAkqf2hRpMWtpl+to0Xh/VZJ0dierzQ==
X-Google-Smtp-Source: AGHT+IGZzhEabUTBviGKkUWT4f2kPeGhVUMDYNNfH6ue3t02mzfYOitus18sFXW7L4kB9Hc5CNqASQ==
X-Received: by 2002:a17:907:9622:b0:ab3:3184:6890 with SMTP id a640c23a62f3a-ab6cfceb881mr2384239366b.33.1738582788923;
        Mon, 03 Feb 2025 03:39:48 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a3145bsm743494366b.135.2025.02.03.03.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:39:48 -0800 (PST)
Date: Mon, 3 Feb 2025 12:39:47 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: dts: socfpga: Add basic support for Terrasic's
 de10-nano
Message-ID: <6r4gx4r3yjefo2zhjfoq4ebozcjbkozaof3imouub52f4o2ebj@i7ajlqhs7zae>
References: <20250130074553.92023-2-u.kleine-koenig@baylibre.com>
 <173828013131.1872475.6879199940703724951.robh@kernel.org>
 <qkruehkvdduotjzhut3w2fpbr364dtd2vztpewoy3h3j55bqxt@e5niklwtpuue>
 <3101a214-1498-4671-9062-89d2f9d8369b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uvp6oc667tbjxgbl"
Content-Disposition: inline
In-Reply-To: <3101a214-1498-4671-9062-89d2f9d8369b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_033951_341351_ACBE9AFF 
X-CRM114-Status: GOOD (  26.66  )
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


--uvp6oc667tbjxgbl
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] ARM: dts: socfpga: Add basic support for Terrasic's
 de10-nano
MIME-Version: 1.0

Hey Krzysztof,

On Fri, Jan 31, 2025 at 10:28:52PM +0100, Krzysztof Kozlowski wrote:
> On 31/01/2025 17:47, Uwe Kleine-K=F6nig wrote:
> >> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnin=
gs
> >> are fixed by another series. Ultimately, it is up to the platform
> >> maintainer whether these warnings are acceptable or not. No need to re=
ply
> >> unless the platform maintainer has comments.
> >>
> >> If you already ran DT checks and didn't see these error(s), then
> >> make sure dt-schema is up to date:
> >>
> >>   pip3 install dtschema --upgrade
> >>
> >>
> >> New warnings running 'make CHECK_DTBS=3Dy for arch/arm/boot/dts/intel/=
' for 20250130074553.92023-2-u.kleine-koenig@baylibre.com:
> >=20
> > Maybe I can learn something here: Is there a command that only checks
> > this single dtb file?
> >=20
>=20
> You asked about this and I gave you the link to blog describing this twic=
e.

Ah, I thought I knew that blog entry and have to admit I didn't recheck.
It seems I remembered wrongly. Sorry for that.

While pointing to the docs only is legit in a review, I think you could
reduce the effort for patch submitters (and so maybe also the number of
patch submit iterations) if you mentioned the command to run that lists
the problems. Of course not completely reading the fine documentation is
no excuse.

A bit related to that: I think

diff --git a/Makefile b/Makefile
index 4117cc79748b..e6bde20152f4 100644
--- a/Makefile
+++ b/Makefile
@@ -1759,7 +1759,7 @@ help:
 	@echo  '		Multiple levels can be combined with W=3D12 or W=3D123'
 	@$(if $(dtstree), \
 		echo '  make CHECK_DTBS=3D1 [targets] Check all generated dtb files agai=
nst schema'; \
-		echo '         This can be applied both to "dtbs" and to individual "foo=
=2Edtb" targets' ; \
+		echo '         This can be applied both to "dtbs" and to individual "$$v=
endor/$$machine.dtb" targets' ; \
 		)
 	@echo  ''
 	@echo  'Execute "make" or "make all" to build all targets marked with [*]=
 '

would be an improvement now that vendor subdirs are usual. I didn't know
that worked and I was annoyed more than once about that because I expected
the right command to do that was

	make [...] arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb

which doesn't work but is (only subjectively for me?) more intuitive
than

	make [...] intel/socfpga/socfpga_cyclone5_de10nano.dtb

given that the full path is also what you need for compiling individual
C files and having to specify the full path of the file to build is the
norm for the make build system.

Best regards
Uwe

--uvp6oc667tbjxgbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmegqwAACgkQj4D7WH0S
/k4FFAgAkfDqn54EWZPlQVy1U9gd2RWgd5pU1tzUZW6nxyxJ5isULdlDmXBYlQLb
2Pcc0LHmnLPKBfVAh7xGjBzXrrltYMi9sGjWVgLpvAC0cnn+5rs+6xudd7REtiFM
tj7xTEpwgrzYQGLOXPzOwfqMIA94/CWtfMq0JZtrvdCQgzu81Z6J2meZFBqx6o7Q
alNNiTkMuWFqX1yKmfi+RUtHZIcGF5gXoiJ5Qfsp7skZaIgvxcy3D4KUncNNHRRf
2VQ1sln64wxkR89f0AJgO80u3Wpa69fiRQU+7qNFtltNELvPtoFuwVNiIQUQlnVL
1qbt5OSvouZHawwRUGHaZSlj/qS5SA==
=MY9T
-----END PGP SIGNATURE-----

--uvp6oc667tbjxgbl--

