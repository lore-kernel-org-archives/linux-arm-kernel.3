Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543A0D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 10:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JxxmkTi4FGoSoE6oHcsfNmtpGy25wMUBs6fj3QNMwA=; b=oJl/TH+7fAXhr6t5IWiyOBAF3D
	xEPpafluf4oLE/LD5NtToo1cMBJVpu6SRS2T6uSbu3cFvE4ZPVlPSrYjMzyZRhOZBiyMb/8yKFg8D
	dble+ziCyuGwS8DxewloVaUbDGm2YfSwaUxfd30bN4Ql7k8VWhQKQR85hT8pM/zH8e7mj4fo5kGeS
	gpV80PESyO1SquitYAKLFWDy8Lv2mvX3gSY3P4Na4ofZmDbSGqW3Dm68aG+qEhUqgDTo36gjPnp+A
	ex/CLHnDbeYGNFaZVcluI/uA8DXG9tbEGOd3r66U+5cb1RsXnenfrjLuBnsKZzO6/0+Vjw/Sz8AsJ
	6entfPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZo6z-00000002dff-3bEl;
	Sun, 28 Dec 2025 10:34:57 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZo6x-00000002df9-1ffQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 10:34:56 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-37a2dced861so88781851fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 02:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766918093; x=1767522893; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2JxxmkTi4FGoSoE6oHcsfNmtpGy25wMUBs6fj3QNMwA=;
        b=gqTfRBkxfOzuxDCufbIHXIJap9MUsCXSycX632K/m2rAEftYMy3rknv0BMAOYQWxuP
         grmLoBb2Gs/P2A7ED4WW4SUxiFKnT335G+qayrpBDXte59sL1Ar98rfO7IE2Ba7j1y7w
         BXnzBlcXTX9fcmeujfm+6AUDMjVSkpnZMpxs5sGqU0N46s9jcSYKFQaoR/pCXhTVeYZ2
         t0/83Iprs8uG+jKvrhRlB3sihOi0v8e0Fp0phF3+3LiLtlM98NHW9gAWn4c9Xv+9uHIH
         CRBBIpGBvmdHYtA88xiaKvqZO8ijn4eS6qHm6C7WQSLU5JySx9UX6mSppWXD8kUhAz/T
         672Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766918093; x=1767522893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JxxmkTi4FGoSoE6oHcsfNmtpGy25wMUBs6fj3QNMwA=;
        b=aY6YJgkDEQKUkU7b+CzuVzlBG7m71HdGkBWN68hEPSSRhI2jzh0BdTiQ84ne7nmrmD
         6HAKPaxZzDgaHSMCVxDxOLLtSETfrKvwBIAEyd6gRIj9veY3zNkxO/OZu/3aR/LCtPvV
         zF+4Iz8ntMdggeWbs9Trvrx1OE3CoW0F8kx3mpVBDzDVqdOXzwastnSQSxHFnyvxhFCy
         nvaJJR50xyOxmumwSWGfPBl4Rg5A4HKJmvnQAwQWMvHdQtP4U59v5Oxnqr5fPZGsIfBH
         rhlW8VPF3jlDr8t7dPGXLC2ksaqslylTXmyGEg294yF+iob8p4x9M+L6jf8fKvQNUQGk
         ZeRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4cIgkwTMEnLWFyb744ef69fROKOLbJuMXjlqXMrM1y/wHcNdJAUxbMgZNG4iQz4EO+wloiot+jiZYpNGjT8oN@lists.infradead.org
X-Gm-Message-State: AOJu0YyCsKun/7U3WvcqAFiGHkwwsnSEgv2KCNBF/hREXmHAfL6Cfaa1
	WLd2WYyrcIpw69aJGae5JLfNB2tr46kE/PTVV4eyHGNB8v/QXE6CTR0iCwd3Fw==
X-Gm-Gg: AY/fxX5h29S6yrU8jeSwi4y1BKLjyrN3NZAxmHvWu/Z7yFdCzgoZCw1D2OJrWd0cHQE
	42GNpChSfMAe6XBlS96O0+1savtUGhNPRwszgiLPuS4doHg7nbOKk/Suvq20ZElAwtpMzLdNUjd
	vcBa5xN1VbzpKvI5yBYJ84qamUFTOvF/H5Hd4VdHmP6TCnOo9DWuQKNBAoJaVv8M0V5bC72Jr/0
	+3HZe5R0/k/DaUi34OEIJ9YYyC9rOFSQpe0atA4G2Jr59myaYAd6riz8ar3jnJuhIwKT25Myksk
	IVQ6EzQKm2S0TY2SA7A4PiHBs1TEydnFJxEX43LL4pIk25t8RbcmnHKRKOuJaH10gH3xzvTIaOe
	VAkGUqen1Q0SpNrTY2mu/uKSCrnkJ+9iLH0V2iPwPMtOP5XqJRFY/1Pi6XiitmUWqMvn7LUwLOd
	xedkOkOzk4JrbQ9EN5xu7aRTH0F67v1Qx4vZwZ0LJlgQ9srDqE
X-Google-Smtp-Source: AGHT+IGnORvckzTpLa52QolfTAqA8mGzGUAPMaAuOTsKJD+KE4VlIltzyntZT3IUZ+4D/FxrPPT7lA==
X-Received: by 2002:a05:651c:1506:b0:378:f3b6:f762 with SMTP id 38308e7fff4ca-3812079a3c5mr84928361fa.8.1766918092714;
        Sun, 28 Dec 2025 02:34:52 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251b2b0sm75897681fa.18.2025.12.28.02.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 02:34:50 -0800 (PST)
Date: Sun, 28 Dec 2025 11:34:49 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND v3 0/5] I2C Mux per channel bus speed
Message-ID: <aVEHyUsijrnFUWfD@gmail.com>
References: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7rFkj6zIm9eFzZmB"
Content-Disposition: inline
In-Reply-To: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_023455_454287_E25C83AE 
X-CRM114-Status: GOOD (  21.00  )
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


--7rFkj6zIm9eFzZmB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 02, 2025 at 09:09:47AM +0100, Marcus Folkesson wrote:
> This was a RFC on how to implement a feature to have different bus
> speeds on different channels with an I2C multiplexer/switch.
> As no major complaints on the design came up during the review, I
> decided to submit the series without the RFC tag.
>=20
> The benefit with this feature is that you may group devices after
> the fastest bus speed they can handle.
> A real-world example is that you could have e.g. a display running @400kHz
> and a smart battery running @100kHz using the same I2C controller.
>=20
> There are many corner cases where this may cause a problem for some
> hardware topologies. I've tried to describe those I could think of
> in the documentation, see Patch #5.
>=20
> E.g. one risk is that if the mux driver does not disconnect channels
> when Idle, this may cause a higher frequency to "leak" through to
> devices that are supposed to run at lower bus speed.
> This is not only a "problem" for changing bus speed but could also be
> an issue for potential address conflicts.
>=20
> The implementation is split up into several patches:
>=20
> Patch #1 Introduce a callback for the i2c controller to set bus speed
> Patch #2 Introduce functionality to adjust bus speed depending on mux
>          channel.
> Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
> Parch #4 Implement set_clk_freq for the i2c-davinci driver
> Parch #5 Update documentation with this feature
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Ping on this series.

Best regards,
Marcus Folkesson

--7rFkj6zIm9eFzZmB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmlRB8MACgkQiIBOb1ld
UjKa/w/9EMK7/UO6JtAlL56xG5HWlpyOxFHWUAO9UIWno2hVyQynqNH4v7diLRBc
BsDhmURF6cuyUB+vmhczfA4CKXRSPiVju8mWMBu4XP4s3hGg7HTIezwxIFUwGHWN
hsLRWYFIJXcxXmM+kc0/GUdxKtZnB/LtB/vBtt/hP1PqCy2PXgDoohrRoziudpcC
c2WfApN1ouNEWggVNlvHLYks+IKY/KDDRU8K00uhqLtVLeBeHXZbn2l2U3vBAxw9
UFjBGOTCIlSHKOQ9WXOqBo0UkiAsgAokWVn2RQ31NJHkBZpW8U/XYeYPIbjulUB8
V8FRwEy1az7dPIGRybgl1OA3DSQxxI76KMBoUZCWXRxZUKtnVoOd72b//TUvsJ7C
wtdRjslcTWInxdOS3n+muvaH+oOHuoUw1lidEJWF5V0z840VPFDl/IJHETIRj0AP
9EWrz2bPlMQYi8WcwKmKmpTybU9cytA5N1uaOHUKKqYDhAFT+TQ8zAXvPN4tQJgR
Kt5hJ+TxtzU7mHp/Q18K1T6V/Mp0SGAhysNdjEUzgSEyngN462tirHrIRIqQ54Y9
iSUkIx3faPeQOttSzlwrW68gVxhqb+m/CGR0oLFtQ4J1gC+qP8dghQ2+NCQImIYd
JdFL5CaaSBphpsbYDgDL1Is5APPRoURE5zCqzmqBgwyemOQXUY0=
=kP3i
-----END PGP SIGNATURE-----

--7rFkj6zIm9eFzZmB--

