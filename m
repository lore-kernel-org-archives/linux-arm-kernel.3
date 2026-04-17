Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC33F8DFE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 17:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6tVQ0pUQqp8YvBCfgccdHLoTS042A6J2tPjUSrHHQY=; b=ReLgfoDCPAu9Hd5zgwl/l3OILE
	R7fOMocYe1tFFH/9i9IhuAs0IvPGpCOqZpO/sPmm+ADrrmc94p0BoOoD1JbcoB+zw9xmRK5sK/YyI
	qDX47AKAkXVU9I0saHgv7GY/idUdCVBgVwY67ZTMLZg+W6gSGZ3u8S7wglwdKuSNBMJH4G9iUKdNX
	aLeywvtVNe/gY/uwCIJuClhBapMhY8IyeNhO5PprIOOkYA0P4QeRko8qimYesSzNplhYcAziCnLxO
	f4grO1k6c15HBp2HKyWniA+tdokrc4vnj8Xvxv80wZQQTysjqgx1mql3RU8U2ACfJpg0k4W/OcnIJ
	C1Pj1uwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmvd-00000004JjW-0JfM;
	Fri, 17 Apr 2026 17:24:29 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmva-00000004JjB-3P8H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 17:24:28 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-671ff4b716cso1526901a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 10:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776446665; x=1777051465; darn=lists.infradead.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q6tVQ0pUQqp8YvBCfgccdHLoTS042A6J2tPjUSrHHQY=;
        b=DhZbdR68newfxQsaMlbj3VdbSNh/PiksHYHI1ADCefpSoqL4zeyP0om6i5l/Vg1tey
         Uz9phxrfWk0V712Gg3GVZcJbj/RiKZcsh8leojDFaiejXigeyhcXdQw5kklHbcMYGi7f
         mLWNexZD8dJjOVn6xQm++qiZQ1kwu2PVcI7YClntNRzEyTiJ5Oyg5yHvY/qVf0hAILn2
         9FHmu4QPtjeThqm5t94ky1CdG2rdnz4dNxcgcdjt1ymAyLloXa1yzs9Sctb1Y7R1fmkk
         DMVOc62KzbTfUkqUmGBcx+BYcFn1E5OVJ6JNZqO7KEwZR0Hwrpx4eTcULCTRaDGpOhAj
         ih9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776446665; x=1777051465;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6tVQ0pUQqp8YvBCfgccdHLoTS042A6J2tPjUSrHHQY=;
        b=dfuds5toCYoMyd7zMKlc/aVVxMMK52ExA5VXUN+GA2Ls3TZCrEB74CvyY9Tnr9eMQX
         QbBZnGU+n5YOOjMSFxlJS1rby99rdO/u//rOrR4y87Id9wPR+48xn2KWBKlNJ1KSfLhn
         ZuWICmpU02KL8yOJk32E377gptI6W3MBH623ylwQIqi9PHzhEpvx65vrYTKTCq8S1vaa
         O0CisQcnjqIuXqXTb29cFons52q42b/AU6VeUAhqZ9zkbNhnj9N4zA9yUdFC6jI04hNx
         Vv6HrWc7IR2zsZgttL+CkHpYhG5Y+hGWJ4cky8c85MUexUS5k2NRo5GEsUoSq1vb3Tdd
         oElw==
X-Forwarded-Encrypted: i=1; AFNElJ/eCsUW6akbwi1QBo7r8vHmIPu4TGXmAvYkUKTQhzRz0tBcIv/50i292l8EC7pmwml/td9SbTnVgm+Dt/iXcWkU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0zWYeTdw5xNzQz8xC2IQD0M0FxA2UjLllVVh0o10B/dzIoCxK
	PIU7eqQZZ5Fd+Xy/eSW902yHrsEzjQO+PfFc/MBAyfQu5wXMzfZR8IGLwrJPMrMeLXk=
X-Gm-Gg: AeBDiesIxBP6hbui8Go4UT6X4CrbSAoLdG59Znkc1sbDr4OnymgKZdz7rvwO+TEp/eZ
	Ypopr77Z4lfs//Btdp1Sy7Dvy07eNkMSL2O/Td6lk+/j3akX4558umaXLsq4VOSdBtVfac7ym+o
	aq3HM/rnrxzHddmFiNEMdvq+jPf44UHXlEXKmCP80Vrm8AFyL0f9ZDmi2T8mjsogByfc/WatT/T
	FEuEnc7m7I34j3QtLA819TqU6YEYFuC3sogfMWLZ15WQcpcd59wCPpXqS7pbwz14MDIlYFcQqq+
	gMHEFcxNboy0l9x3u1zVSj7D9YjlTaXTdZr7aCxZRdTKQ/d401IlFEGi4aCdB2/5b3R+D/82bpI
	61fva//9SFYWx/qrhwAPPNg/Vff5VLXh1DuFdPW41AhLy268fh2wYJQDL4ZtZR8+Rcx3/fK0GTs
	iQqwPGP/1sL+eQhG118pxaWYliTi4gi/Pz9IotuIpmE7xcagl5PSVPrb0RgBT7RZ5R
X-Received: by 2002:a17:907:9495:b0:ba2:48d:a95c with SMTP id a640c23a62f3a-ba41a04cdccmr206095866b.29.1776446664275;
        Fri, 17 Apr 2026 10:24:24 -0700 (PDT)
Received: from smtpclient.apple ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45503c435sm75465166b.43.2026.04.17.10.24.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Apr 2026 10:24:23 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6363C69E-ACB3-474B-9473-521CD530D032";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v4 7/8] ARM: dts: Declare UART1 on zx297520v3 boards
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <0d80dcbe-cb46-45e5-821a-de5299d6a663@app.fastmail.com>
Date: Fri, 17 Apr 2026 20:24:05 +0300
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>,
 Drew Fustini <fustini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 soc@lists.linux.dev,
 linux-serial@vger.kernel.org
Message-Id: <D3228B7D-0C11-4087-9547-0D1F7D5FB628@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
 <20260416-send-v4-7-e19d02b944ec@gmail.com>
 <0d80dcbe-cb46-45e5-821a-de5299d6a663@app.fastmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Mailer: Apple Mail (2.3864.500.181)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_102426_898234_996FA144 
X-CRM114-Status: GOOD (  26.17  )
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


--Apple-Mail=_6363C69E-ACB3-474B-9473-521CD530D032
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Arnd,

Thanks for your comments.

> Am 17.04.2026 um 11:59 schrieb Arnd Bergmann <arnd@arndb.de>:
>=20
> On Thu, Apr 16, 2026, at 22:19, Stefan D=C3=B6singer wrote:
>>=20
>> The reason why I add the serial1=3Duart1 alias is to keep =
console=3DttyAMA1
>> stable regardless of the other enabled UARTs. UART0, as the name
>> implies, has a lower MMIO address, but uart1 is the one that usually =
has
>> the boot output and console.
>=20
> I'm not sure I'm following here. You generally want to either make
> sure the alias matches whatever number is printed on the product
> if there are multiple numbered ports, or you just use 'serial0'
> as the only alias if there is only one port.

Not all boards have their uart pins labeled, but those that do have the =
pins that connect to the UART at 0x01408000 named UART1RX/UART1TX. Most =
boards have only one though. I have seen a picture of only one that has =
UART0 and UART1. I could not test that board myself yet.

My original reason is one of developer convenience: If I have

uart0=3Dserial@131000{
    reg =3D <0x00131000 0x1000>;
    ...
    status =3D "disabled";
};
uart1=3Dserial@1408000{
    reg =3D <0x01408000 0x1000>;
    ...
    status =3D "okay";
};

cmdline=3D"... console=3DttyAMA{0/1} ..."

changing uart0.status between disabled and okay (e.g. to experiment with =
uart0 and pinctrl) required changing the command line to match. I found =
that pretty annoying and the aliases seemed like the best way to avoid =
this.

Either way I am open to do whatever. I can keep the current naming for =
the reasons stated above, I can name serial@1408000 "uart0" and leave =
the others without an alias or I can drop the alias altogether.

> Either way, the alias should go into the board specific file, not
> the general SoC file, as a board might be using a different
> set of UARTs.

That works for me, I'll move them. The aliases will most likely be the =
same for all boards based on this chipset, meaning duplicate code, but =
matching the alias to the board labels makes sense to me.

> Since you know the addresses of the other uart instances, I would
> suggest you add all of them at the same time.

Will do.

I'll hold off for a bit before I resend the patches to see if some other =
comments come up.

Cheers,
Stefan=

--Apple-Mail=_6363C69E-ACB3-474B-9473-521CD530D032
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmnibLUACgkQPRO8yFRP
GiIKTQ/+NaGjhii1hGtfVI27m5B7xvrO45mnvMkcV0ceIDc63OvWS4qRsBlOJnwF
9pjaplL2Kbm4sf/uPfQnAE0BviBly1d/14riJjJmEr4G4re2+Q/c9BeCxazBDbDJ
tjODl+Ajwiu273EcwTN4ZU28p/80oJjmuEEAHsL8crw7d8rhnOjrwY/Ige9HgcBl
BYlJRjunX6SxHxGNH/eEfrwrABGjHVD1ya8YjQ9NIZnkEEub9lRZO4v3gr3mU0F1
tjATbZV1BL1SQ3/Zld3BNzYkj7JzCmiEH601T3RZittY4yZBDefYMFantWcrq8Ug
nVM3or6OxSiKoLQ6vak5XVW9ks1iX1k+jU19AUN71/VIvWQ+zTVnO9c1wJae/eEe
SMeyP/Kt4bOGDi1Bq22aD+nv2lJ8wo/4l3k9vDv8vJDECg6UxjLFgYPbtJyEV/wr
mTaODzo1XDfo4PXQD5x0bpgYrguK4X0wVM5Yu/+x/kZLKrm+TWfXN4exCwO6WJPW
sZ7mj6ksI03MTxB5XpBKeoaruf//hQe3lhLDJ837SaDq8xCekCsldXyMop/qQ92a
HBwMG6hD3kLzxRjClYksypijVruKHNcHshp0imqt1Hhs5wXNbaEsTQOqRUgSWj08
Yb2Veu9YNoQcnrIK0Kh0YtoHMDb29uagvWkRg63fyD40m56GPyA=
=CzCY
-----END PGP SIGNATURE-----

--Apple-Mail=_6363C69E-ACB3-474B-9473-521CD530D032--

