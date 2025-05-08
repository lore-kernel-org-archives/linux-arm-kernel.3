Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB86C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 07:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjCNEO6c43Jy15stRDpxryP+REb893ZkVxfJRigOY9o=; b=PxN+vdliWm2d2xt6QIcm1kqgyy
	hg32xR5xqhjtof3zKl/hernUtky08DQ+tVGPQNPAkdsguiPNQJtkj6lVs8pZlSGyeffbrLSiQQVe/
	GGmQdhO/AmQmd1v3ljgXensfI1F+zfhhBE71Ngw6ZzigJ0puiswOq8L4lvPl3xMaUBSnnuCPFVPcI
	NbFEoSb7LaeH0iYOkSqynXAyQ1zLEScIVWdWLkAOG2rX/JdiZd6nAMXUtnTzyOCr4qL6qU1pO3Ebq
	230oWckV88y0aqhNGf/zpj0d1Y6h6cjS6ACqZHriEyIwDfZ5ArOnHZrgmJ1pleWjykunwOYmDOo2N
	2FeB9M0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCw6J-00000000374-0U1V;
	Thu, 08 May 2025 07:55:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCw4I-000000002to-0bMh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 07:53:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43ede096d73so4612165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 00:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746690800; x=1747295600; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjCNEO6c43Jy15stRDpxryP+REb893ZkVxfJRigOY9o=;
        b=L3G3ejVjwxw4V/eXRVvpiDcSRc2odzVDs+fSEFZb87g42mu+6rOnQfiFZDjNJoih/X
         pvTEEr7QLL5EqszrceE4fUkgmeUThWEIjYXImuFwwDJJYa7xhLvlVLP5jWDE7bu1RHu0
         bLWVwZmfthy5m4us15/g9cf1b7wKx6TyOCrzCAfM9oKzi25z6vMnkn+0AUrylw4uFCSK
         C59Tal75glOkKaJp4V77bfkkH4d0UACerXzUpdkST0N/Q2c0uvAkxnUudKnm5LqLpVYe
         DB0LKwK09RHaQPc1fZkgRIF5atY2ti5UK/1k5iAAOE+k2wKpP27vh4Tw4+G8E2H1dtS7
         TEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746690800; x=1747295600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjCNEO6c43Jy15stRDpxryP+REb893ZkVxfJRigOY9o=;
        b=jAvAyljKuWsi6I1AbaQXJmOsHQE/3L0/hzgBsWE/FDsFzmU2b4etH4zA/+eUIrqpZT
         f6Ocbj8HW/qeIGLeXwPcqHOEqQg8ocMBywxXs+dket8aRL83F+b3fHML0GVTCmR3tE+b
         oGrWw+v3IBsGZnp1yjJIqMXUQAVNDNnf9qgciS3pJib25yfQi2ruPNCmJQZg6y8BR/25
         1lfv0hsVv+o81NrDaGUfRsRknwdp3nYxkz+iJdI8+Erjq3T4HXIWb6kuFDR/P/O0/uTx
         3FSsMghfDOIV4bgWrjnuKe4uujhVXrSSpFSVQ+PyyXogkgMpzAB+wLOFm+H16vZ+piga
         8XOA==
X-Forwarded-Encrypted: i=1; AJvYcCXEuyXM/KdhfZozbMk2kHQNaFv20MGy7SVtI4xKty411k6vefQGBMoEC2L7lB1b53+JuqZR2Vh0t3nu9/D7cWEK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw631imPBYSp+LGj9+Ra39InfPEhA8FpsN9D+sfZFPU7e8izIWm
	wA3/iQP9HZNcJms0GgQrZsorgT9+Zqq3Hwu642QqKVyzSXj/aBy0
X-Gm-Gg: ASbGncvJh+kuLq141rUYLv5YT4LDft6AYIbkQ4ho0QPhgIfmLOq1OqJ9DqobimZXlfS
	0cn22LiWvMQSmCJUjlPfxPqcS+EQBTZ/A/aCR6B5X7hVfpAJ8czUx7y3zOTqYunOqiF1h1JOuvE
	FdBHUcloRsyONvfWvoMIyNf8PGj6uZYdDZt8JQzQBhBzKi0FBRpmLblIHagGEaoLTO5cT9n0FLB
	eDd0i/DeOxlC9LqWxh+8aGLwOzQn5E8UP9UwDP6u1wUlSw5V4OyAuTK6zULahpd+aV4xsYckdzF
	jr+gyV1ya3xS87CzgZ2eTcTu66HWF06cVRz9v/1qURkLkOMNXjzpkCZ4tSwLFZ6oc4srnygxY+G
	dUZaADpXg51rhkUCwWr5J38HhH5o=
X-Google-Smtp-Source: AGHT+IEkK6XgFL1w7UDh06L0Z3MP75/mJB+jf599RZcC5KOle0Xkg/Tk+xGPkJOdI/Jkn+XogKb5+w==
X-Received: by 2002:a05:600c:608f:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-442d02ed5abmr20082695e9.14.1746690800158;
        Thu, 08 May 2025 00:53:20 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7b83sm26816445e9.33.2025.05.08.00.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:53:19 -0700 (PDT)
Date: Thu, 8 May 2025 09:53:17 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
Message-ID: <3gpirue4rr5hpgynzzadzlr6i2fvdhaugcutyqyfoeix2zf3fu@xpbdadb5nynu>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-5-thierry.reding@gmail.com>
 <1ec7ed24-a4fe-450b-8f99-34aae6ed2c4d@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zuyd7grcpkx6nwpm"
Content-Disposition: inline
In-Reply-To: <1ec7ed24-a4fe-450b-8f99-34aae6ed2c4d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_005322_187986_01B05A8C 
X-CRM114-Status: GOOD (  20.66  )
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


--zuyd7grcpkx6nwpm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 09:40:02AM +0200, Krzysztof Kozlowski wrote:
> On 07/05/2025 16:37, Thierry Reding wrote:
> > @@ -0,0 +1,9 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved. */
> > +
> > +#ifndef DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
> > +#define DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
> > +
> > +#define TEGRA264_CLK_CLK_S			2U
>=20
> Abstract IDs start from 0 or 1, not 2. Also drop "U".

These are not abstract IDs, they are defined by the BPMP ABI. We cannot
change them, otherwise it'll completely break.

For similar reasons I'd like to keep the "U". These definitions are for
the most part directly imported from the BPMP ABI headers, though we do
try to be selective about what we add, to avoid adding hundreds of new
lines in one go, and several safety-checking tools run on these headers
that happen to require the "U" suffix to make sure these have a defined
type.

> > +
> > +#endif /* DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H */
> > diff --git a/include/dt-bindings/reset/tegra264-reset.h b/include/dt-bi=
ndings/reset/tegra264-reset.h
> > new file mode 100644
> > index 000000000000..31d89dcf62fa
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/tegra264-reset.h
> > @@ -0,0 +1,7 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved. */
> > +
> > +#ifndef DT_BINDINGS_RESET_TEGRA264_RESET_H
> > +#define DT_BINDINGS_RESET_TEGRA264_RESET_H
> > +
> This is empty, drop.

We have three people currently working on additional drivers for this
SoC and they all need to add to these two files. Adding the empty file
here makes it a bit easier to coordinate things, making the resulting
conflicts trivial to resolve.

I know this looks out of place, but I promise this will soon gain
content and won't stay empty forever. =3D)

Thierry

--zuyd7grcpkx6nwpm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcYu0ACgkQ3SOs138+
s6GlvA//TzkpS/Nemjcf+t1Lue6ZKkM63tyULSWi2sNg+LkhfmxFLykgv2SvNo/r
pydd39bVODAD2U6bSDRj6JPADOrbiVJgt4s193nCOzANQeGHjHdgOlJYqApa7Qq4
NufMJOCrqkKDTiRlkVDZ9jqfa5TFgL3aeo8WbUDy9gbGXbrmU+4S+Sh1Mz8HfeTR
FyRqKNjwRdkk6S+yIMrKAOduaIUFua9i3Ysjid6rl9yHBWejINPduthxWo/F9Fgm
fviIn2w7Vb6sVtxon2EAOvtRaG8bEcqJMiwl5XNOqai52rBUectR/D4GxFUrOr5C
2C5XUKmRCz3w+wSamsWQHPZWYhdsbxP5wpMr09DIiQFcAPgqLjKFWYkMtQbuMqZM
k3LaTIGnYJgsbVo9rqJDERhMU242F4f0ci0Yr49bbx5walyoeJ5XMWdqyDpbSu4X
GGTNEjdD0hsYXtt8FXx/vbLPNRHYmnWzqj+slH7mhjE10L4ArOZSWUGiN4PZ9+8K
k2pscGa1pQ08wyXQPvboitMrV73BY+jdbFB2EU0bhV6S4ByiwHL624hj/0bcchRb
5K3kiWfeCOriN9+mGtotvPQuuWVeM9UNhLEOotlx63rt76Z0NGUwo6pMICXTSyUK
sWz982natgliIbnbLvzF1ujgFy7i17dA4L3sCcr5CvaF1g9vk4Q=
=9v4v
-----END PGP SIGNATURE-----

--zuyd7grcpkx6nwpm--

