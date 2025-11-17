Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76ACCCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtQClQj27s6zv9IA4AhMxU7/PHrcAy8OI38mRHxa9s8=; b=ujPoeSz+Wo1+iZ6A5L9OM4QrL3
	HxOXpGIOFV68CHeNre4BzO613Jf0fTgddT+URxHDjX9krsGfDDAp3haL3EWN63CKam2EyPVs72rab
	OJ3i+LhBxGhxDiKBdHeUVYeubEKkxqVSD5jGgGvU7WDywpFLL9x9U9cALzr0fwPKyY8bvsgzqe41T
	KIkKcvfUW3HJ9RuS9W+RrKs7eTKq/NA8JlcOg5xlxxl+3W58p7gjvamFkoUvX3RAZOLfqCHIrxAIs
	ojiRsq2ywtRdH/hAEjB35tGjb3/Axv93kNmqKzkArKitPBvD/capPfAUHhu8KZw9oG7s6nbOBzIPw
	9Dx+SMFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKymJ-0000000G8V6-2nJ6;
	Mon, 17 Nov 2025 12:56:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKymH-0000000G8Uh-1VrH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:56:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-477a1c28778so13058515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 04:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763384175; x=1763988975; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UtQClQj27s6zv9IA4AhMxU7/PHrcAy8OI38mRHxa9s8=;
        b=PuFnon/+PEt1xj9o9gfGaAoLf3KdpCXtivx+ARedbUqkpDfNEHtEMGVkqaoGDlyxSx
         O901P3xRuaPGNVXYoHS/wPHwp+aiQBivi0RF8DwQT56Q/iyEig9rXcqqH/Tq3P1dufhE
         Z6WEMTwzOgziflHB1e71T8TW/aWNBYA/w5zvNiMmJB7uRBIr3llYuTGhbbg/ZC7KvlyE
         qvV0ygptgx8IKwMUoK8R1SYVeackqbD8ttZhjPgaS2onWuthssyXf16Ki8oR+gLTp0tm
         dCocEH13U4nmeSI7O0+51D8gTVk9geJvW42B2VBei3BOxMZYCl3vaFlyl8c8ZHnnH3z6
         mbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384175; x=1763988975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtQClQj27s6zv9IA4AhMxU7/PHrcAy8OI38mRHxa9s8=;
        b=oIKqqJ2egE9uI8AZ09+1j6bh2xs+O9DclThZha9jGTXEIrT4rULZFLo47t32j4K/J9
         i8MfMD1SzuUvWhIjIiORkqN4IcAbapodM5jf03uXbo6eZTMicbm4g3PPUUlPqZ8ungrh
         kbXAJU6RwMpi2x/WobQCAP77TO8qDhTkrVvfJjTQn4FewqsJDo89bZ6beQluizIKtDX1
         cO2DpGG8KjMoz/Fi2CijMaUURC2AZRicupXQXJmTkjLGY2TQNYF4NlO9SU4rxSRxvNfF
         vKfxXZP0l/UiGBkxQ3AZ03/Pk6jRtTBK6VIf+u+HMYp5FYPRXBnrAI/xhw6zb2rMzd6g
         ftKA==
X-Forwarded-Encrypted: i=1; AJvYcCV3F36cgX/BeqLoifjo+pVsVG82n9PslyPngTtK0E+fCAvRLZi3RUv6ygHhlkFTf9JRmtoP+LZ7l6gOreYnE2Ty@lists.infradead.org
X-Gm-Message-State: AOJu0YyGj/Emqjml3p+kPsBk9xgjcEosWU5bMmgqME1mc3XLeRsaTV8S
	44lmBBQ8lfPPNtVXrYkj4s1xeQmdnyUxy5qlfS4davSElbFxIjiH13oH
X-Gm-Gg: ASbGncuuhcvsiVNVDfOEgR8NLehYbGi6p67wHELvvv66/cylnSVkiV77w5Qb1vpLzwt
	G+ceRO8kZ5PsSPRb+WEsPjr13SJ8d4eftiXD6hGrVAVafGK4D84EZVduDzMNgLfA06uRM/y8pFY
	5w5b+8dK8Aslr8bp5hbB/iIlwYLJvR5AGvVZBuayWVaN4QRn3lhSlb2N4oWpSU2u7cJvo55IcWd
	tSLSFmLt93UW5F56Xo4dktG0jEgBcu32TMgOq3aaA0Y64gkpv8K0v6RNuzZ+hF7vhkQK/Ry4QRy
	dRakGj2Z0X3+GO5WQLS4HH2NmIF7hcAYuxss5DGilO/YHc/krUS/AP5puYPEkL7CbA2D0bmx9wy
	Al46YnSOiIzrRGZgUh2tgqJ0iGjmYEW/FbrEmv4xRLkgnSOlKgxrCiiKepPMAOWOlH7Os2qlQtp
	//4AHzc8lJ9iFNLZD3AHcBzbMQmYkPRNM/Vy2v3Z5GxGIpPKiAJvWr63AclQb3f/CHq30JNrxbq
	g==
X-Google-Smtp-Source: AGHT+IH57ecXdIuEBtdHqbof8FxE77BlxQn90vBWkhWWPRNuN2jxvquiJGk+VRf0FNachim8KEymaA==
X-Received: by 2002:a05:600c:6052:b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47799866420mr47099985e9.28.1763384174937;
        Mon, 17 Nov 2025 04:56:14 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477969b3c12sm141496285e9.13.2025.11.17.04.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 04:56:13 -0800 (PST)
Date: Mon, 17 Nov 2025 13:56:11 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 6/8] ARM: tegra: Default configuration changes for
 v6.19-rc1
Message-ID: <la6n4yiqekpykfkt2d5kdt2px6vnz5djge7hstjs5mu7jnved6@6tdr4yggfkmx>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
 <20251115090044.3140331-6-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sberisgpriyevh74"
Content-Disposition: inline
In-Reply-To: <20251115090044.3140331-6-thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_045617_440538_CCC5BA52 
X-CRM114-Status: GOOD (  12.58  )
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


--sberisgpriyevh74
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 6/8] ARM: tegra: Default configuration changes for
 v6.19-rc1
MIME-Version: 1.0

On Sat, Nov 15, 2025 at 10:00:41AM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.19-arm-defconfig
>=20
> for you to fetch changes up to 23a29a81b44e3a7a139fee4d3eada5f299d8985e:
>=20
>   ARM: tegra: Enable EXT4 for Tegra (2025-11-14 18:05:14 +0100)

Looks like a fix for this is already in Linus' tree, so you can ignore
this pull request.

Thierry

--sberisgpriyevh74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkbG2sACgkQ3SOs138+
s6FuihAAws7+fjys36vJMOzOHFLEBas9dF7S+5AuTIaZGhZtxTmjaILVyWTycZJ5
PeWB56yTkpRPkHFw5aIuF6nvy8rOp6vYRCmMRZPdVADBCkclFdnDyKjb628QAPz/
pda88AkbCre4nHZWPXvOy4cuw10c9aERK+8C2RD9BFft03kX/hqMuzdo9NbCCq2j
puNPW620/Xd/lu4tEHqNeaEejbV06J5yrbvxRU7Yw3Im1KsVmKrzSlLm9eE4tfFp
eRV2T/aUqXEVKUJNEXaTYWyCg7GIrsW41ZgLLRNOVj6acFZb5VPHfD9dB+QB4oSg
JdeYssNwytIh8lS0cLBcIQVUAPuSUR/mTsa4XVzo5dh0/HqZIXTg4g23/5yoLkxs
tGjWtY6iWDBenFSTbis8yDkNhX/4b8XD8G6adfAGU9u9qxYHucc8fLD2GSDWA2en
gN1gYCD4hTj9g2rrZpF+oaNoFmHl3kaojZ+n1C8kj4M/WMxy2ngMlxA6eGM4ysHA
ywehnhP7c3iRQV9Zfn54cUyjpU6sx/gekSzZC2qvBYq0N+Koss0VvgES6ENaUNi6
k4LgS9RGWL7BGCmBF7dmXCVexn0CkppspJl2Lzz254COJYUxbxEhddjb3RHmfYbY
esCZlyqtLcg76ccZxmAHwSMEIPNyN4jSqSQWIAYUkP3Fjj0cIM4=
=k0z1
-----END PGP SIGNATURE-----

--sberisgpriyevh74--

