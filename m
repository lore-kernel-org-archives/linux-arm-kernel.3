Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96E8CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzCB8jIK8FF50evWPCp3i6KvsKUySMbzRnMGfOqE7VU=; b=oXStJWArE19G/lrsDHQ5BYrONK
	9i1pSk4fW1rem2ex45BxCWRjNAIqTIt3pTkpkUKQEAN3Nr6GH9AXM2WcbA4HK+VIbxF10tErEbddK
	aqiEKP35KhQ412ExEWT4Qr4vKAjJ2FHEOxWcuXJgF+7IYINPYWG9bEwmfzq1hF0aBuiH3HLJrNanN
	bnT6WNLsazG508VxoIUUh2kjDasS1DO+acdeh8wyKcMLAlWZk0gd6UMK/arXuqvvz1wk8AXaLXOfg
	AGgXbxl1xo8tIT/WIysp+SHl6jLTiwuWfNS9RLRp9Jh/wmbGmPKR7jWoOsYNXbBkhBqcymgP3IiOM
	Rye5lsKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYGJ-00000004fnF-1PEg;
	Thu, 30 Oct 2025 19:24:43 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYGG-00000004fmP-2qpl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:24:42 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b5b823b4f3dso245170066b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 12:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761852279; x=1762457079; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qzCB8jIK8FF50evWPCp3i6KvsKUySMbzRnMGfOqE7VU=;
        b=Fc5jLP6XnPVq4TwbHEc/uaPFbdkKo9CE2lnafVdfz8qk7PRx/siITElunWQYLzPYef
         JwHYotFlTMMB47Ej64nJv7JHBPPL04DjErpEMbOWaPGAFxWWGMoB+n5e7pEV1eoUhkOf
         Gex3eeF6HjwNpAvfxKhb/CkeCzV/5u4BSxAGKEHxRtaffv2uRa5rvIu0MJOueX5OqUV/
         jAx4Wa2c2va6wr4KpPdxXpwpI7jGl942MPPsYi9YvvAFGCIU/cA9A95YGDpw9WCWsRLl
         JeZTmo3IvN6e6u+Jde5B3+Lm/UCrSn1/+6h9lZmRgtoH4zZWGLEunEEPAvnkotHc5gzl
         Dfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761852279; x=1762457079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzCB8jIK8FF50evWPCp3i6KvsKUySMbzRnMGfOqE7VU=;
        b=tQYJ7xfbLl+xEOvk7uG72JazBABuBtEXoBFridhM0mFbvGSMtXPlS0X+OVGBfE0p1P
         KQbHj+bmigY4jyHUoVC6l6NNVINOXEdfYM7v/BNztDWjK11cKHpeNGZauxMD2HNtlWnC
         uHmttg/7H1cQQXyXXTs+ftHLFInIfK/pnZWRbfajNbBb7b50bwX0QBPmEkdEy5qZJmtc
         Rgc9G3a+TnkoxrW4pr+4B7x6/XC1kizTfItklsVuiSluolCM2zL6ib7bX0gXn1hf8bkZ
         GZ/NISN+qSUf5VGMXlzB6miLMrl3QzS/01WuRFtkS5Apc394wT/MeynfuXI9rxPMndYK
         muMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjvxJGqMLmW1KNaIVD+T5sDj5zddtQCYhPhbtI7Q3I31v9hoC36uaMbO6CKI4fYQ5t7BmNvvjP04xdlT8om3AE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+ic4Y0wLMM+Tqc2aIvpiadyStfnR/0lwXLejYrbXzHYWOoMzR
	5QyDh9LerL5dVLxhBc3PTTeNNZh5mhDDz4qX9yCjOLy1StnrsmDjTGf6
X-Gm-Gg: ASbGncskShK6HXUKFoRLmFZ3sANXSDK8NmHU83KPStOFpcGfGkDS4ozRReRa11E52ui
	z5KcFsQ0YRnoZl52TymrkhiOWB7xCND7lsD0bbUobsXjzQkvdFXLFA1OsZaJ18CNtaGhTsJF6K7
	d2T8b+iblW1zNOxBBkxeWchzgbf4ld/CLPa8FZdrYEF//nBFlSvWKqZ3g85wKjnF8i6qua85mYe
	L1A/4S17QL9TrljhciwSwZo03p4EI3soG3IZHS/AYnT+H+ZgEwO2tBIX4d5WMqj4P2oqgoKtJbp
	hEg1eM5pyTthoda4I+MtZLGoadn3vFWRuPkLKpGHiSOpOrFbQwswkTzP3Bo8buQi1/FBZGxxD6W
	15mkNVYTfBVAF/LGX3npiHiowoxruQA3eSc4I//a02T6/yQaNVLTX2a7drs207awYuzrvXvd9+M
	pk76bLyyMkWcA6vUrWqCuTJe2XquOX3UUcZ91t+z8WK2wGG+IEDzBsoXrVpzYabY1CDzplFBSbw
	Q==
X-Google-Smtp-Source: AGHT+IHAE2zfsvxg+WnKGQngg9O6/M2cc0o7OkY6Hhcq5Dlt181nXlixhzrIiYnYnVNrtbX+aXzOuA==
X-Received: by 2002:a17:906:fe41:b0:b3d:73e1:d809 with SMTP id a640c23a62f3a-b707061fd71mr80792866b.48.1761852278602;
        Thu, 30 Oct 2025 12:24:38 -0700 (PDT)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85445e81sm1827260866b.64.2025.10.30.12.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 12:24:37 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:24:35 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH V2 4/4] arm64: tegra: Add tegra264 audio support
Message-ID: <zxcety2tqsv6p5p2rqaa3e4un44m2loo4zm5goeansuf5zdly6@jqeg2hm5rmcz>
References: <20250929105930.1767294-1-sheetal@nvidia.com>
 <20250929105930.1767294-5-sheetal@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="istw733rho4drg3w"
Content-Disposition: inline
In-Reply-To: <20250929105930.1767294-5-sheetal@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_122440_735938_81F4E5D1 
X-CRM114-Status: GOOD (  15.62  )
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


--istw733rho4drg3w
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2 4/4] arm64: tegra: Add tegra264 audio support
MIME-Version: 1.0

On Mon, Sep 29, 2025 at 04:29:30PM +0530, Sheetal . wrote:
> From: sheetal <sheetal@nvidia.com>
>=20
> - Add the audio devices for the tegra264 SoC in the tegra264.dtsi file,
>   which includes sound, HDA and APE(Audio Processing Engine) subsystem
>   nodes.
>   APE subsystem includes,
>    - I/O interfaces such as I2S, DMIC and DSPK (all the available
>      instances).
>    - HW accelerators such as ASRC, OPE, MVC, SFC, AMX, ADX and Mixer (all
>      the available instances).
>    - ADMA controller and Interrupt controllers.
>=20
> - Enable the audio nodes in tegra264-p3971.dtsi platform DT file.
>=20
> Signed-off-by: sheetal <sheetal@nvidia.com>
> ---
>  .../arm64/boot/dts/nvidia/tegra264-p3971.dtsi |  106 +
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 3190 +++++++++++++++++
>  2 files changed, 3296 insertions(+)

Applied, thanks.

Thierry

--istw733rho4drg3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkDu3MACgkQ3SOs138+
s6H7xg//eVts+nMHcP4RRSRZowrB9Hev9Ui98kXJyEnnlm0YVJ1AYLz7kUIHXMVk
gwdifz6s85sfO+nufj469hlCm877zZwW+gO2gTwF3t7hh0mZ6tRVT0qqgI9phsM9
IkBFhAlmqFZeznEUhYQ0RktdN1h0RW0nWhG7fzyUMLS9RltTMHCDgbl8ckXoTLBn
9i1coz/Zm3puDLiPDE/LsmASeYXhtaB5bbkNLlbdN7yrrWOSEJMXTFbllErAv37b
Ycaa7gyZJviyjOO0/245sg4QO+PHcPFdBbxtV4CaON96uSdlIWqAcQUZKUvAKPMO
4OJ2pKTo7VIMzvXmkcqpbPWySOrFj2sfLTb3jQX+W7KTv2R9n9HxkANbJ0rQn7+z
rr4xzQFVfsTd2LP6Mr84wStmyDdlXF9+kwVnH/F7tKT3ZAj3bL93Q77W1tPduHwz
qlRLtQgCVX0KuTb7Tezs1IXbxgaetulHzWRa8ayIYhb9gNf7gZi3C0PUSPP7BtWF
p7cMVV7yq0bqRZ2q+PanKUvNUzNS4zJJoAuMHGtXdR6pedUq+T3SHoqdmxmRo2bO
5gTYoHd18rOs2+43CqRmgfHmqm+Ei4k4pJSVmIIQMKGbzHvn2Y3uPgugI4GUPP2P
KxhijmcU+KzqlklSQ/xNrTdLYyoLiOWdCi/AFzSbRoc0TsfT+oU=
=sxTn
-----END PGP SIGNATURE-----

--istw733rho4drg3w--

