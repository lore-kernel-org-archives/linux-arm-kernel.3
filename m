Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E77C3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 20:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZvB8uEgwH3FOtyg8jjKySlsj8oVq373OT0N/xZEySo=; b=i0w6LqH439Y0yMDEV2+8E8oTC4
	1tM66LEqshEUh4E161nSEfXwfcHIttkQTSubHq9B2qOACMb0c4g9WaHcgK9HboYYmB2Q8a8wa7v0+
	SvQuAZmW6zK762VlvcZIHNsoyM6pP67tiqXZTGDnfPZPCUrxNuVlkSGJvlrkJyQVgX6hnEDMWspVr
	t9CMqb0sKehzd3S/noawo84VSHC6Cqr36ZppAZGmi2Snz+DXr1bBEFGqcqFWi3MnRotYws/RL1U/k
	vwHvQmt3SfTpA48r58cGZsmd/Sdf/NoE1yWfjk1kFEsjMCXnwcyfgMqOI9fulNxtdeo4bikbxiAUS
	d9F24g2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5KU-0000000GFXM-20hp;
	Wed, 14 Oct 2026 20:12:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5KR-0000000GFX1-1w0e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 20:12:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so27852725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792008718; x=1792613518; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZvB8uEgwH3FOtyg8jjKySlsj8oVq373OT0N/xZEySo=;
        b=D9eGLIj21bgmQwc4PRbNsFyHaWXSxv/9NLb/HaNCRXBhZruncYq09Vtnxl1hHGlqls
         jB+6BgidWDQcse2UoV04pP4hOs+CBH1nuDtARlk1PHlPEeIDnpt2dShnh44zMjx/QVoc
         vSW2adCnxjX3z0qv+fCT2FHTpyRhQLO6jCyCQuRhBrjKlsvBVlRYlHGAbRhj4BRxW/gw
         vKEePIBcSX9vJf0+uVKmSCDScv3G6XeHFBHHXvPBgIrR+JYV8pXFFTihFUiMM2U1gpzH
         vj36iur9Df2sEou2LEWfnBhGJ+QV3YMFW9xO5TlaTSyBtDIq7vm+W+u2POhddwCoTEyB
         xptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792008718; x=1792613518;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sZvB8uEgwH3FOtyg8jjKySlsj8oVq373OT0N/xZEySo=;
        b=AnB6r3/7tcRIZ3iD0Hk3OKThXZ+ffaB6q90pnItHbuIM2wRnuZP+NPtAzJGb/rqR1c
         URx5bCrE2Hpf91yRepT9rQbYifJLp6Osf7GEdkxDz3VTfu8eTDhh1t69UnowuNw7MnhE
         /uqiLsxidR7uFDSdlOtyTqfIUEYjyDGoVBAqGi68WjbFfu1O0znpuZX8s2cpVUNSAB1K
         YJme519MhotxGqerxymEtLuZeedapBo+ySCouHHqvHkAw7ujbDfUv0MIrdCAb2jmSTgv
         4s9lUG3pA28GBt/SfLiQ0V3MsiYZ4ZwjUmnBrzN3bHoVyiqqsivISPtFSBDHy4qzQyO0
         JsfA==
X-Gm-Message-State: AFq9FYI0Oj46ADOrtAMeTHeIq9ZvKeyspj/uwGlipYjymidksnQ8xIyl
	YHgMGHn3zJNkLCB4Cb7w5hHN+zEK9OL6KCJACux8a29VffTEc4vi3g1jZodHRg==
X-Gm-Gg: AYBFou0E3OHLU3eRejDNXDVdfgpWuCqHf56pFaA5V5u3FDUGrIduhpeF0sNlTJCPWpU
	Q5xpQjUF/urHP4VrLTqOE1nu3FV70xvtBdMXMh3ChIyeeLeVKTMCcGEjeTf66x4VE4ua57HllJB
	DI4m9bVm4tPfNzWNt+223G15ThMOUHAaj2InM6mP5sb/xin/EPP/PAG3vT4sM7mHlx3XXts5/tQ
	3AQPJpDd3gKJNxC+YXgLJxMtBSI3DPz7ju/2g6arTQpYeO3mx6kj8baWZUUdEbJI0QOYrBwHoDg
	EwRTbtNHD560a8QgqDq9d/cbf8F6RmG6rmsMGn6H8VgOdZownMt6swvNnV0E1qlBKNOZbVkx/5E
	LNl0eSxgS6lNeWTAUD56YxQHGjoBB3nYXJVcQPrqqImyEOrpjDZJSzjsh+sljZ/x27T/vk6IbEt
	XVphJoQHMfZugHsVNtK/+qNJBmfM65uszVLTg6vT3eNJqtoCCSoZTJao0Ampu1Pds43iem3eKYt
	RSQWa8PODeJrnuALqw0n0HKibtbPcMT3oCj4VZeFRSelEJXDjw=
X-Received: by 2002:a05:600c:c113:b0:4a1:985b:83a9 with SMTP id 5b1f17b1804b1-4a1985b87f5mr193706685e9.4.1792008717371;
        Wed, 14 Oct 2026 13:11:57 -0700 (PDT)
Received: from silicon.doe.home (91.141.74.240.wireless.dyn.drei.com. [91.141.74.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd5ec195sm18169355e9.0.2026.10.14.13.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:11:56 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: arnd@arndb.de, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/24] MAINTAINERS: Consolidate ARM/ZTE ZX SOC SUPPORT with
 Stefan Doesinger
Date: Wed, 14 Oct 2026 22:11:51 +0200
Message-ID: <f-cR3wroQOKOK55pQOGtvQ@gmail.com>
In-Reply-To: <20261014072109.1759502-2-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-2-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartNxO1axjoTnWkvnYZN3HUUQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_131159_539914_5F2292D9 
X-CRM114-Status: GOOD (  12.28  )
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

--nextPartNxO1axjoTnWkvnYZN3HUUQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 14 Oct 2026 22:11:51 +0200
Message-ID: <f-cR3wroQOKOK55pQOGtvQ@gmail.com>
In-Reply-To: <20261014072109.1759502-2-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Am Mittwoch, 14. Oktober 2026, 09:20:41 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Navid Ghahremani:

> -ARM/ZTE ZX29 SOC SUPPORT
> +ARM/ZTE ZX SOC SUPPORT
>  M:	Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> +M:	Navid Ghahremani <ghahramani.navid@gmail.com>

I am generally OK with that, at least once Navid's patches 1-6 passed revie=
w.

>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-
subscribers)
> -S:	Odd fixes
> +S:	Maintained

I think it is better to keep it ad "Odd fixes" as it is a hobby project to =
both=20
myself and Navid. I don't know where the dividing line between "Maintained"=
=20
and "Odd Fixes" is when it comes to SoCs ( yes I read https://docs.kernel.o=
rg/
process/maintainers.html ). I guess once we have a third developer and/or a=
n=20
openwrt userbase I'd feel better elevating that.

>  F:	Documentation/arch/arm/zte/
> +F:	Documentation/devicetree/bindings/arm/zte/
>  F:	Documentation/devicetree/bindings/arm/zte.yaml
> +F:	Documentation/devicetree/bindings/clock/zte,zx*
> +F:	Documentation/devicetree/bindings/gpio/zte,zx*
> +F:	Documentation/devicetree/bindings/net/zte,zx*
> +F:	Documentation/devicetree/bindings/pci/zte,zx*
> +F:	Documentation/devicetree/bindings/phy/zte,zx*
> +F:	Documentation/devicetree/bindings/reset/zte,zx*
> +F:	Documentation/devicetree/bindings/spi/zte,zx*
> +F:	Documentation/devicetree/bindings/usb/zte,zx*

This should go into or near the patches that add the files in question. ( I=
=20
took that reading from https://lore.kernel.org/linux-mediatek/
2df4cad5e29fbcb4c5c5f59ea0bf322c7a301bdc.camel@gmail.com in particular.=20
https://lore.kernel.org/linux-mediatek/20260506-honest-cyan-cow-d6c5b0@quol=
l/=20
suggests that too ). But yes, that can also cause annoying merge conflicts =
when=20
PR'ing patches to their respective trees.

--nextPartNxO1axjoTnWkvnYZN3HUUQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrP4gcbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoi7zYP/2fAvvx5fPT4SsWjdFdI
ABhAtJyWB4RG60JTfTVzXe5Qk37bsWxDMWZGDS5CCk2223n7pwnAooriQJ5a3Kub
S9GtdDVdDrJrlL1QTxQsyCjoNXFBOC/PxSm8uOwEZ8G27Y/y/HOpGIMXRPKoOHnE
2EMSVeNOgqKNMLtpdR4SqO79G1RazLNhiuVjadX2Xi7gGZ8Lx5Fxybv0+INi9T3n
pA7fw/G48AmrnzXvXniQ0YIZug+sngeIhqekjpRMXoOFJfSQzjFkR9Kihxdj1TuR
LiLnIJxAcNGac7WFuuL2VXpHbhKfEPwgRnmXX7xCiER9GrsU8mX6UvTYXBZrOnRV
xJkGNrOn1E8DVx1BpGdS7WcXJh8wDEoPA7UAWCNSF8AwSHi3enXgboGubXuQHavG
fuXWEx6DxjeNf44GUlA8KnDC1YDvXydyS426Z0oaMH/c/y6rJblBbG8aQA24XMDM
FkgpIt6MlpnB9bd3n4kAP2vq/tf/1Jjr0J9fTq7uOPzya73eAnZeulZKJhTyFBrr
sJzg8p8ix7JlJIlzNA1ucMMg5e8A1MK0OZwvVsQZuHGd+RLYHBUtB+Du5aOhwxnv
7UmvYhazw1O67OcEiSir27cK3aSHv8jXcdlx/lkJpZ4NVBOCGwVcYALCH/RKsoaB
8PBzu6beSOYdYS8pLH6jz6sd
=7Rzi
-----END PGP SIGNATURE-----

--nextPartNxO1axjoTnWkvnYZN3HUUQ--




