Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2F1CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 19:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7F4n8mgpmXvR1ZomD7s5qVMQgPf2THfCdABQ8kzmgU=; b=zXPh/1wvC9XumyngP3pdEWswK+
	91zuRMyXkbFvUDPYqHnYkVGQTsY/pWici6QHReBvJn+1G8nvPxzcveyUQbhz11oMI6f0X7vStj0ii
	w2yKPrBtRRRk9ZhQ+1bz5JCh2AIgL/u1iT17WJJgj2Q73+jk89Ozax0Rt3aXp687mS1T0nr2Sk3+C
	ZUxdpcDH+n3kiNXU10E7BxCy9vJrZ4GrLLCvWDgqFWkZmCaoQqKWEoGoNxv+wi3HuQtEOnYf1inX/
	Ig0Br8PxQcBjxYB+MXkiKXyXyCUM42jC+yjjEv3OzkVuPDHrzNjS5tudj/LyN+aExRjLgLO+fE8Cx
	3YEctH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waIPY-00000001k4W-2BHE;
	Thu, 18 Jun 2026 19:28:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waIPW-00000001k4B-2oKO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 19:28:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso10567615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 12:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781810901; x=1782415701; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7F4n8mgpmXvR1ZomD7s5qVMQgPf2THfCdABQ8kzmgU=;
        b=eHQRBSKDWIV7PDaZbh7XxZVUZ89MSoj7BsITwyzds/1w3IBtzWkINPsu29whgikksJ
         9kQ7SCfdpBpcDsEjLZQDQbLb6BkY3n9f/CNVLBV/dK+cbQZGinuxRaOkPjAFNit6ZerW
         JePhl5grsIxRhR1aF3EETOsosNWArz4SyE6A8+D7DaiW4E3jEmY3ysCyYKn/fHet/338
         xuKAlBrvkvVABELBywa/mGU3HCuYgPPw0NgHLXPhqSu/dFV7xOCyZp762Glkd1TIcVaK
         QYYvkvEnHiqeIyrRw495/n2VWGHvqhjUtxnF3TwTmfyLwWnCT9qg93ri7xQoSHsa4vSS
         xYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781810901; x=1782415701;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7F4n8mgpmXvR1ZomD7s5qVMQgPf2THfCdABQ8kzmgU=;
        b=Pu/4x3Oy7rgmHizvNw01AUk+Z+lcv0JlTRZdne86DeOCKrgO01jHWfJUMit+XUBayg
         m9tVUfpT0OjXOY+AmU3681824p6UFIC2MXr88lgbIg9OiEtNfko/BR6Ze0gQUfvjqL6d
         q9u1EhHfPkd8xktRc/k0TpK5T58ZkfvHkH9RJfCJ4GhVPrhwwxvi1vxPPAnaXykpm5Z0
         6owuJ16zVLcHrqFRuG50N2pnAU17N6wNFuRo2QBtrmge5uvA1+KzUhBPvt73f0QdmuJf
         /EA9ZFb+eli/u3lRs/NOhYBHsDuE5QhKTWMDpCXzfqngMcJuJ2FpOvlkOj8lPOsoMtiw
         w7Cg==
X-Forwarded-Encrypted: i=1; AFNElJ9OMcpQB8Xi6NjhodAK4e6k+ANOzL8qoL3JiPPvvcVvDHEvB/qgM99iOKx120L6p6MYECWyZFXt4UqocOWU9f4s@lists.infradead.org
X-Gm-Message-State: AOJu0YyRGofL96mnLHPMX1b5bu5s8k+Ux1UHqXz39OKTxFBa9M00O3ZD
	GO4aJOAQ5Et8sBbNjFFAp2KKL1msgNbxDc82bw2tfgBxoXvsUet3wuel
X-Gm-Gg: AfdE7clB4JvSFOvDJUV2OFpMGCpWZ7OjKYddFReV7zMi+ILd8T26v4MinQijrNZlLyl
	tikkCQLlSrHUY9v89i1v3YPuIIjfaOzCoMOsj9s6CKZQe1ipGkqnl8A0xCGhq6n5gTfT6uCNMw1
	SZDOAdeEuhtgHX2+j9ZFdVwCaPFL/jvZCmGqhfQQS0hTq7bjyo9yF3xFFC8Cezjt63w5RqG7nBT
	VdIhE/Q4C7d8g0oBQvha373E/QhEBGAf1LF7U80dKzlQXTXJK9ro1TGwW04j40/VlkBaO/s9V4P
	MP2fVsLSODIKTMAejLH5Al2mLPTZdYqPKQws5g9reYyhxfyEMuMhvlamfFKJgKaBpPpDcTD8h7C
	sNPl/1XvmYoJkf6lQ0ubaJdGE/SV6xGVcPzK5xOr668vX8ww9N2NUeZVT+dq2Azowe5N/dcZUlM
	UIhMHbXSUjQSaeGYg4uAi+2A==
X-Received: by 2002:a05:600c:4745:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-49240a051c5mr5075335e9.5.1781810900283;
        Thu, 18 Jun 2026 12:28:20 -0700 (PDT)
Received: from strix.localnet ([197.250.96.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd29883sm11319845e9.14.2026.06.18.12.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 12:28:18 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v4 10/12] reset: zte: Add a zx297520v3 reset driver
Date: Thu, 18 Jun 2026 22:28:01 +0300
Message-ID: <8K1EfEWITAurt--cymuLyw@gmail.com>
In-Reply-To: <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <20260616-zx29clk-v4-10-ca994bd22e9d@gmail.com>
 <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7cqxV3SpSTKGVocmuEIt-Q";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_122822_744324_E76B325B 
X-CRM114-Status: GOOD (  28.95  )
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

--nextPart7cqxV3SpSTKGVocmuEIt-Q
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH RFC v4 10/12] reset: zte: Add a zx297520v3 reset driver
Date: Thu, 18 Jun 2026 22:28:01 +0300
Message-ID: <8K1EfEWITAurt--cymuLyw@gmail.com>
In-Reply-To: <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
MIME-Version: 1.0

Am Donnerstag, 18. Juni 2026, 12:24:26 Ostafrikanische Zeit schrieb Philipp=
=20
Zabel:
> On Di, 2026-06-16 at 23:26 +0300, Stefan D=C3=B6singer wrote:
> > This drives the auxiliary devices created by the clock driver.
>=20
> Which auxiliary devices? Which clock driver?

The ones from patches 7-10. But I guess you're telling me to spell this out=
=20
for readers who see my patch in the kernel commit log rather than the=20
submission series.

> > +	[ZX297520V3_UART0_RESET]     =3D { .reg =3D 0x78,  .mask =3D BIT(6)  =
|=20
BIT(7)=20
> > },
> Is this a single reset line controlled by two bits (do you know what
> they are)? Or might these actually be two different reset controls that
> are just always set together?

Most devices on this SoC have two reset lines. In most cases asserting one =
is=20
enough to reset the device, and consequently both need to be deasserted to=
=20
bring the device out of reset. In some cases both need to be asserted to re=
set=20
the device and it keeps operating fine with only one asserted. I believe I=
=20
documented some of that in comments, but maybe I forgot to move it from the=
=20
clock part of the driver.

Exceptions apply - some devices have only one reset bit and for some I have=
n't=20
found any. USB as you noticed has 3.

I don't really know the difference between the two lines. I don't have a=20
datasheet and ZTE's downstream kernel only operates on the USB resets. The =
old=20
upstream zx2967xx code had no reset driver at all. So I found the resets by=
=20
setting the registers and then single bits to 0 and seeing what disappears=
=20
from mmio space. Everything on this board except USB comes with resets=20
deasserted on boot.

I'm pretty sure that what I identified as resets are actually resets and no=
t=20
extra clocks because previous device configuration gets lost after assertin=
g a=20
reset, whereas it is retained when disabling pclk.

I absolutely expect to run into surprises and epiphanies in the future and=
=20
problems on as of yet untested types of zx297520v3 devices.

> > +	[ZX297520V3_USB_RESET]      =3D  { .reg =3D 0x80,   .mask =3D BIT(3) =
|=20
BIT(4)
> > | BIT(5), +		.wait_mask =3D BIT(1)},
>=20
> Same as above, are these actually three separate reset lines?

It is likely a combination of the same 2 indistinguishable lines (4, 5) and=
 a=20
separate USB PHY line (3) - this is what ZTE's code suggests, but it is a m=
ess=20
of #ifdefs and redirection, so I don't know if I isolated the correct=20
codepath. (No, a kernel built from that ugly code doesn't boot, so I can't =
add=20
printks).

The PHY reset line does not do anything observable on my device if I recall=
=20
correctly. It might be nonexistent, it might be a leftover from older=20
revisions or some devices might have different PHYs, similarly to how Ether=
net=20
PHYs differ.

I'll double check those USB resets before I resend. It's been months since =
I=20
looked at this particular part of the board, and maybe I missed something. =
On=20
the booted ZTE kernel and in the bootloader, when booted via USB, all 3 are=
=20
deasserted. When booted via the NAND boot chain they are asserted when the=
=20
kernel takes over.



--nextPart7cqxV3SpSTKGVocmuEIt-Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmo0RsEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiEm8P/AvHfClRvmy9YL9udTPC
Z4QCPIQLCeqVhdF7G8jxr++QtOAWGVMwzMmhkV/HjMOZKzngI/79K7GOXh+ZWacu
8urWF49rVNSwd66BJAspTEzrhAFzDKyuqRni9MxHUKUZQhwHR74mB3jbvJN7Ro1T
ivQumkIS2UvKvSXrrn5jN3oy/Nyrvp7D+18fd6olrwCBAqxufx2XnUStim/unV+j
EetwGC0+OFgDrN3baOlhVHbZpa3sf1R+K7VfUp83K1SaAIil0DbmXho49O6AnV58
4x8xOXR+e7cJn9Wwal90xb6uhNumK/Pcg1JfxazDu1r3LoO/zNeBuQPhVipny1/L
5rScYzShnt6RwEhn97EY1+JIUcFl+sSfcsLrM0g9N8IRY6ZF86xwK1uhzZtHVhqa
iduxPvaxGWzK/I4VO9gLVQ+SzI31jX13AquwVe1wMzR4aWJlBVDqV8eyzDT3xQpT
pM88XTEW8HucCi8UNTM1UuFwiaEmKBjyp7zRCci16eRY9RkzlADhCT2oQ5SXGaf2
uy6ke7LyzUvSN4HUzUhN5RY/Kt8qaDi9V/K9yKYc8w/k21N/hdfryJEsouPfmGJq
EzjOugd9lByljMjhYc2sj6xazXsNLKNNounCgqw2hUyzg5OAdQZRB+fV/c19/QCP
AIr5phGYT29fwL4Rd0gyO5GJ
=KeDM
-----END PGP SIGNATURE-----

--nextPart7cqxV3SpSTKGVocmuEIt-Q--




