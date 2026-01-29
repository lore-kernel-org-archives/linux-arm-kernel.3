Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D306D73E84
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 19:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t86CR7+9yfrVNBsgovnJ8FKAIyElMk+cczKwlZov8Ck=; b=v0LeHZ+ITX+I0+wgI+xKo2NTdv
	hZZrOmOIUi1LIhymwFEBt7Zj39Z1KKaNHy98+LUR5xQyixVYwmm4yCCrnBQWaNQChN1NugvMP0khL
	HbVvpX0xut5knUMWbWXrNNWX/WbJ+alPV4NMTwkHBj0IQEjB8/u4smChdO2+AUr80VDQbz64IEHqM
	PwrZQe0aseMog8qPoCcSiX27QiGebxMH5kNpCytAzA2bvWdljUIXTW8GWxN1zbUP6ex7RLxsvj4Oc
	OdVm0E3ulbtbMmNHUoTdi+iXr2S8eHiqq+eCaZDdC7ZHduQU53CTuyyzZos/p5pTBzAClKPuDbmF5
	zH3JhhHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXry-00000000ZbZ-1IbF;
	Thu, 29 Jan 2026 19:39:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXrv-00000000Zak-319U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 19:39:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4806fbc6bf3so14151105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 11:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769715594; x=1770320394; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t86CR7+9yfrVNBsgovnJ8FKAIyElMk+cczKwlZov8Ck=;
        b=Ys54llmh79lra4zeBOGnPnvJTRQxxKb7d1K7Et+jgf3MXWmRaRHVi0zUGAKKnrtNms
         CmOh0IwHWtDKp7SjQPMCxqCTPUidtinyif1Hbv5YFjvuENyRNdlzTQy4p6CHIwhL32IT
         xvdCKcfHwxf6ptlavWqGq/YclSAfHThL2LdtAX5/ZbYCjvG1ZA9rHstFud1Zmfc8afK+
         uCKOiYDMwX2IaCtLb1qLZYAUc3RsmzXICyCZl4ECgoU1v3OIK/EGvDDtlw6Ttj97YoTv
         QvsoXq6Cb9BkQVLnv/nK7vg9ZEJpGrTC/iKwr9xH7EBPA5UYFS4+EGMEovqdAPZIhgnu
         x6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769715594; x=1770320394;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t86CR7+9yfrVNBsgovnJ8FKAIyElMk+cczKwlZov8Ck=;
        b=CGELmep3eKb9BgXHo5EbxIZ0Y4tfWBCxMurHF+o6jMl4tfuuOAVuE1rzGeUFy05CSF
         RUepyJzJpqFVXijdRh8SlUGTV+XT1O9rRdokZuan1bMCDuCdhwqFKZ63NdsVYKm9ddSt
         gNbubG3CElj3hjN2EiH05YdlxO7rPXyqXEf6lyFow6ORK8dUSkgvRptrC92OMsPZ8iSo
         BG7FwR6DxXvtkzPt/9UtDGyPF1hvlJAngPYGTHA2nw1uVVp8M/p8aFyBaCwTG8liha/i
         SJxpcR2HyrQUc3WsnI4l+SqL6AEBMn0nLFLaf46enKdetZXrkuvotTOZTJg3g1vc5kcS
         oKmw==
X-Gm-Message-State: AOJu0YyeXXKnfZeDrnBeBW9liGMzctU1nRts5017re7HAnSjhiLDzn5T
	e6ABHpVto5p/TEJL4nZdZZJFVJJQU48YF4Xjd5q2MiwmsqxADBxW+CSrbNL4dOhq
X-Gm-Gg: AZuq6aIu6C3r3o6VN9pizjesnXSpR7sMYrIVw3ysGR2tZtDtHA8DtIzu8CqHwbhc7eO
	2/VS0j1IMQwYd9nYjRDqLZgIw4W/GnscNVCSuyjs0ObqPy3B2RoFXfrKxmeSTDd+vrV1HFKvVDN
	+nB1EXIXWlXULm17LvN00WF/ZzYohHs2XuDpzLFOEu48U5pTNS/nZmFHDFxKxQgsNTc12kXAfW3
	+AqvAeTd6emb14LoNZ6Zd+PkkMIJK/sH4W3K30DWIQ/Q1hiXnITD2R3k0TOwztPwX0CFJ6LDx7m
	lnJwcDMhh0EtyKPwp71RNGPzSkKL2ijUdITScbqb+TDjAYTHtec97nopJWu9fZtm7JF6314DTdH
	BR4Jr4DA+IdOtp2qmje5wGwJp9dizj6Hoa52drJJYX/Vq6YCJVrCP2eFtHWiT3Y9d2E9ogS1Nc1
	u2ws6pg4gY9tI9uYNm9gA6YX6Oi5/IhP3t+w==
X-Received: by 2002:a05:600c:1549:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-482db493944mr3617565e9.17.1769715593527;
        Thu, 29 Jan 2026 11:39:53 -0800 (PST)
Received: from grey.localnet ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cefdsm16504443f8f.23.2026.01.29.11.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 11:39:52 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, Jun Nie <jun.nie@linaro.org>
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
Date: Thu, 29 Jan 2026 22:38:51 +0300
Message-ID: <2936803.ElGaqSPkdT@grey>
In-Reply-To: <b94d1ea2-8092-4692-a5ec-02d83ae1c1a2@app.fastmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
 <b94d1ea2-8092-4692-a5ec-02d83ae1c1a2@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5583984.GXAFRqVoOG";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_113955_784790_73D3B547 
X-CRM114-Status: GOOD (  27.02  )
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

--nextPart5583984.GXAFRqVoOG
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: soc@lists.linux.dev, Jun Nie <jun.nie@linaro.org>
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
Date: Thu, 29 Jan 2026 22:38:51 +0300
Message-ID: <2936803.ElGaqSPkdT@grey>
In-Reply-To: <b94d1ea2-8092-4692-a5ec-02d83ae1c1a2@app.fastmail.com>
MIME-Version: 1.0

Am Donnerstag, 29. Januar 2026, 01:00:08 Ostafrikanische Zeit schrieb Arnd=
=20
Bergmann:
> On Wed, Jan 28, 2026, at 21:34, Stefan D=C3=B6singer wrote:

> I assume that you were in EL3 when you tried to write to NSACR?
> From EL2/EL1 it would still appear the same as not-implemented
> even if it is there but disabled in EL3.
Yes, and I just double checked, it does read 0 in all cases. Here's what I =
did=20
=2D abusing the head.S error handling code a bit for printing:

cps	#MON_MODE
mrc	p15, 0, r9, c1, c1, 2
b	__error_p			@ abuse for print
Error: unrecognized/unsupported processor variant (0x00000000).

cps	#MON_MODE
ldr	r1, =3D0x63fff
mcr	p15, 0, r1, c1, c1, 2
mrc	p15, 0, r9, c1, c1, 2
b	__error_p
Error: unrecognized/unsupported processor variant (0x00000000).

And just to make sure I didn't get __error_p wrong:

cps	#MON_MODE
ldr	r9, =3D0xdeadbeef
b	__error_p
Error: unrecognized/unsupported processor variant (0xdeadbeef).

I am certain switching to EL3 is working here because I am using it in the=
=20
same way to set up ICC_SRE_EL*. (And yes, I know this code doesn't belong i=
n=20
this place. It's just more comfortable for my development tree for now)

> I've never seen a Cortex-A53 without FPU and NEON, but since this
> is optional, it was a matter of time before we got one ;-)

The ZTE 3.4 kernel code suggests that there is/was a zx297520v2 that was=20
Cortex A9 based, and then ZTE replaced the Cortex-A9 with a Cortex-A53 and=
=20
left the rest of the system unchanged.

A later version of this SoC, zx298501 switched to 64 bit, including kernel =
+=20
userland. But I don't have any hardware based on either of them.

> Support for 64-bit cores is actually quite rudimentary in 32-bit
> more, as we are missing a lot of the errata workarounds and ARMv8
> specific features in the kernel. If you can figure out how to
> use 64-bit kernel mode, that would be ideal.

One of my co-hackers is giving it another try. Pairing a 64 bit kernel with=
 32=20
bit userspace seems reasonable. Of course the other question is what quirks=
=20
are hiding in the hardware when we run them in a mode the vendor never test=
ed.

> > 6) The old removed zx29 code used "zte," as the vendor for the
> > compatibles. Sanechips is a subsidiary of ZTE that designed these chips.
> > Are there any preferences for either "zte," or "sanechips,"?
>=20
> I would stay with the previously used one

Check

Cheers,
Stefan

--nextPart5583984.GXAFRqVoOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAml7t0sbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJED0TvMhUTxoism8P+QFSQGrDOtw9AhxTyEAu
BdkXfStJ8njk4kPHGeXN+YB92aJ+SOLAF8kK6Xdtm9Xo3oRAKtv76+FPtzU3A0Zh
RzJmS418aehsbXktaz+0pHzzOwGynjtTDNPYvioiC/6wnNN1dW/cz+SIJOxOhT4Q
VuYjt09ugt06rKCkphE3XRn+ATAb89967Nn6X+4jJigpFC197fi564dctuzPEWQa
e+nRxHCZdxr+ots7393wJRTQTFTzI0lcZr6XDhPk3xwfsofLdh+P379fS6DKwpD/
lzV+IufgyfvL7g5m+e7/5eYUTotbi3cPqNtP57YcQ1R+2LhLS057zx32aTQKYqbe
nlLrTz/NPswSVe/YjsRBDxFflQUpho12cxvLLP0DKBKFbA8b9fJEnWYDUYSIjn5R
SwPyLWRgEXnRLIRCpQ87nWVrI3Yal9ZybebxMtF9ENFftZPZgwsKdCaMGThkzKM4
OjmdVLzoVha59A52RAUu0+vmayU6tMAF1U2UmDiWoOJW37WmsKmeMzEee4hKd/RS
+kBNuICVn609UFUN7iiV0FzNfPEsu98rsyCGVqwHISh6hQ1OG32ZYQMGB5kdcOCj
KTOiowTdPKXHyMmf1FKHFUX8S10E7BXNuBlouBqOglnu8bDeAa71oFxtj/nFUmfE
qjKTODDI9F5Ka9skDQfHOWv2
=LjqD
-----END PGP SIGNATURE-----

--nextPart5583984.GXAFRqVoOG--




