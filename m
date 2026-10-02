Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EDBCA5FE5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xr7pX17mvH2aCY+fCJUZRujhX//jXl3D3Nc+GjIbpY=; b=nk9WD5Vslgad2pIbWSUFZB+Jvf
	T+BUFLtUojoJRhMBq7P+23pd9uIvPVJMun5/P8EUc0EXyj884nZMdnEa0ox22bQRCMZfUlNSEdfBj
	kJgHKwcUmdzQ0BB0pYbJd5OJiLK7+AOWNsE5HMjxupm/5aWaxenxvov+xwMu5f1mfDgc6FV4Jhdw8
	7VqFnnN8552cULRDRLcWFDOmjcFeR6DV1RkXyxofwdrijwzeZDxIwkLw5hOy7icr0IJ8qsN/Ah0Fu
	dHpoYvzvk/GyaXOAt6IpBWXWUDZbjlMKE9iavaPNmXbvER0SEgLQ5kZ7hbfWFos+A6UkJjTTy1zkE
	BUGg9lxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjNW-0000000CRhs-25Yf;
	Fri, 02 Oct 2026 19:57:10 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjNT-0000000CRgr-1qxg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:57:09 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-917a9f42283so1671046d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 12:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790971026; x=1791575826; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5xr7pX17mvH2aCY+fCJUZRujhX//jXl3D3Nc+GjIbpY=;
        b=bifLD7dTFtaE9OoG/QAs2uwCw2GdJRkkdP5qCL3l+KULWCCNzaLFJnqwISeWF8X7JL
         TXrwC4Azjx6uZVljBOQbcK9sSapcHd/CrgPMs18ikW2LxI4B6316wSDA0w74dXHDS//W
         HzV8D4hQxPO5+i1yF29r8mQXWSuJqBYH+CUpL1clzS/KfqsCXvcNF3bMczbQeSg2SrfJ
         P8zGsQw92vMqHWHL4aQk3FPa/b7woaL7Qo4Tf1+ClX8I+p+sFFJZNFCVnSxVqXICKWWs
         MHrSNzRgrM+o4Xkp44dBNvP5iRnsSQJ6Q0MeU4RBzbuKOcFb03UUZCm5e5DOjJaMWFUj
         ZZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790971026; x=1791575826;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xr7pX17mvH2aCY+fCJUZRujhX//jXl3D3Nc+GjIbpY=;
        b=PTWk7mxPD5GTz56rnthPvXHEc3oK40IZMY+9FPBHxax/yqSV1SC0FFN51OrfpmXGHg
         bdCJhggMu3xz4DP/NNSCtav16PNdMZo3k3ykX3YisraZr9O63o8vLXvbdPm/opy6/Wpi
         RKcLePbLHhRcpX9HdN6gVv6u1jN+pVz+18kaW/tj07oFo0kYl2AjZ1qcp3o0896P6ykG
         647dc0d90mE6FEf/smGxqUY5wyPr8Bx3SUxeP8H7DUx6IqsOUBdYS4YKhz/RYy+Yl1ZJ
         jG67r8cmkoOFmlsN/G92o4sRmCFQq6XBDpzm/epiz4MVR0PvYvvIiUVOSOeRSv/HXkjC
         NIsA==
X-Forwarded-Encrypted: i=1; AKwUvBy1lYMsw0AjHDcs7PA8SzZ4BE2NdiugNGYwjMV7R62j5q7MeACYZy+588MeiRNwwzpPvds5514yMod9zYfW61DT@lists.infradead.org
X-Gm-Message-State: AFuF++nwPnfaTI0pSj/ZtGhj6ZdSij5VnWhPuuXwffWQ5eGPhHr9r9xj
	14MANImg3p+6iFTPxxqp3x1dxI5Ghq9GuEV6/9qs2L/jYG4W6RFsAwZZk68eWCDuwsM=
X-Gm-Gg: AYBFou1YUz5DqHWZrqPi24lAemL+x/d78fB3mkQ0hdr2J48NBS5/zG524raNPwMTn5+
	1XTM9NKKyEj0hAmpQ/Y9aZCJFFFXj8kqq6Fz0Pox7h2fWgSU28rtyUmiF1wGtK13gVDokaxTi2W
	1ip35NGV+fQAuwFP883IhdeLHPS+0vzZFETRQgbeARwkr1wOnNXw5UYCgBCdfeys08anWTMgsAU
	4TzeU1XW0ayesN5f/4qFA61Qkd09UCAI45CWeld2PoSuDgJSAzJJM8kMdhTuvfEN9CW/+sItxWG
	goKwQg6cDGxM5u2b1ooi9UtUtjxyPUCBhD4RCalnkIOEjk7w4Ps9ldS3rma2X4Wf84rq4kpqIf6
	0Yc/qiX+6JSazGj2nuW+1o9+g6OOrsAfJl8CwZMshbd2JZWhAp4k0Bwfxa+Tq1XY/1Dv328stKP
	8ZgFYB+J4GS4Fz3K7tIfihY2atv83rqm88+RPgaRgsPqrc6bcP/icryp4++s8IM8xPE/++7Mioi
	t8mzEjIQFRvgg==
X-Received: by 2002:a05:6214:d46:b0:917:a8b7:c824 with SMTP id 6a1803df08f44-9195d0a24fdmr7529476d6.7.1790971025988;
        Fri, 02 Oct 2026 12:57:05 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-919442ce1c4sm20271766d6.3.2026.10.02.12.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:57:05 -0700 (PDT)
Message-ID: <60c0db37aa1ba8674a0b205473075ab6cb0ed39b.camel@ndufresne.ca>
Subject: Re: [PATCH 0/3] media: rockchip: Modernize PM_OPS
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Diederik de Haas <diederik@cknow-tech.com>, Dafna Hirschfeld	
 <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab	 <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Detlev Casanova	 <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,  Jacob Chen
 <jacob-chen@iotwrt.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 02 Oct 2026 15:57:04 -0400
In-Reply-To: <20261001173610.158931-1-diederik@cknow-tech.com>
References: <20261001173610.158931-1-diederik@cknow-tech.com>
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
	protocol="application/pgp-signature"; boundary="=-4HyN8OfCN+SaQY/bAsCV"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_125707_490001_C8EAD2F0 
X-CRM114-Status: GOOD (  16.49  )
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


--=-4HyN8OfCN+SaQY/bAsCV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 01 octobre 2026 =C3=A0 19:34 +0200, Diederik de Haas a =C3=A9crit=
=C2=A0:
> A bunch of new PM_OPS macros got introduced in commit
> 1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")
>=20
> Straight up copied from that commit message:
>=20
>     These new macros are very similar to their SET_*_PM_OPS() equivalent.
>     They however differ in the fact that the callbacks they set will alwa=
ys
>     be seen as referenced by the compiler. This means that the callback
>     functions don't need to be wrapped with a #ifdef CONFIG_PM guard, or
>     tagged with __maybe_unused, to prevent the compiler from complaining
>     about unused static symbols. The compiler will then simply evaluate a=
t
>     compile time whether or not these symbols are dead code.
>=20
> So convert the rockchip media components which used the old macros to the
> new ones.
>=20
> Diederik de Haas (3):
>   media: rkvdec: Switch to modern PM_OPS
>   media: rockchip: rga: Switch to modern PM_OPS

I'm taking the two first, thanks!

>   media: rkisp1: Switch to modern PM_OPS
>=20
>  drivers/media/platform/rockchip/rga/rga.c           |  9 ++++-----
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 11 +++++------
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c     |  9 +++------
>  3 files changed, 12 insertions(+), 17 deletions(-)

--=-4HyN8OfCN+SaQY/bAsCV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasAMkAAKCRDZQZRRKWBy
9LnsAQCEQh8/fK0EjxA2qyBxHJJCZTj66w+XssQ/r5decbAYxwD+NAlRMgWmM5Q8
DCLHzSESx4CgbNEx6od60qqNuMc9Bgs=
=z221
-----END PGP SIGNATURE-----

--=-4HyN8OfCN+SaQY/bAsCV--

