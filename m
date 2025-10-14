Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3460DCCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2MtCooci01DsFhVORv2Xd0IZSv5uSvTDLsmJesa9HE=; b=uGMTWqkezuoXr2+jxri3p3uJsn
	O8/TRvZKq2tANLdYeqgNSU9+srIZu18eGBFIcifQ0xkAsTHH3PaAMifZRrJUm8mGVSguU/QPHViQF
	JMVW1iWNDDa3QASVZSS3Fsx8yXXLV3OAlcuePsoSPFB0glzXpmJXKfVUxfpnYmaQKrMlLc/hyVt7u
	S1ILYvmDqtqVIFqpdftW1b8YmGuspFN99LaEkgjsFikTXLhD5u4UpstO8jJwgCP5MGTBNmkMRy0Vy
	VEo3RkVMm+e3aENUENsqy6m6R/nYy+Zs5JYnRzegF3Q7UZ0YpOj1ZBBSd7OO/BMoOiw+Lslpzuo4h
	4W9VdxtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8fmJ-0000000GaRg-0OBI;
	Tue, 14 Oct 2025 14:13:27 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8fmF-0000000GaQP-2rqn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 14:13:24 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-36453927ffaso49965001fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 07:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760451201; x=1761056001; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z2MtCooci01DsFhVORv2Xd0IZSv5uSvTDLsmJesa9HE=;
        b=LyBKjjy2WzbvdtxcHeU3YQ2JoJZU9nCkA8sdF9fmU2WQB17VNt+wV0IVUFvYQDc/mI
         qg8IbWPW9zJ9sJBsXEWveZroc9vuT6B6fj71W9N7Ja5RmK0xsyPpDxKWHGnBp8r/zSWx
         GE4RqfN5f0hrqzNfxauFjy7wkQuOj6daYxhbamTIJWk0KgQrC87f72Nb3Ol3Aq/8TxCG
         w0A4Ec313X35dcqaEu9mrtxVRf+1Y5eG/7j79/SowVsdNkHnF6R+4/EdSlVyUaaS9Lml
         TLkAUb21sHVZ/d/qgm1Bjre1zIBxaCVU9YE4PcFtX43jj0pJurA6zbSknVRkNO7MogbH
         Gs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760451201; x=1761056001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2MtCooci01DsFhVORv2Xd0IZSv5uSvTDLsmJesa9HE=;
        b=G52bSMX7KrBaN+MGbWCj9DB5F5yQzpi6+m8ZpXwk7P93WRkRlC27LGXSPOwHVhjDQy
         2Vw03NaL3S+ThrIk+OfSONTRgdWqB8weDCjI7tzerZYZgNGE4ZVjGFYSQe5uL5v6V9WL
         QlLFs+6IAGbXO+Fffocyqqridri6p58ii03MEsTjWFJXJ6oLHJcnpAizmijMm6Fx1R6R
         vt2hiXGFU/UoGKxJPMEiXbKxxmTEroX91MHeeOPTrXXCGvK+OD8vqfTeWILmSgJkGLza
         +ET9tYIiUAwQIbGaCS3qHRpK+GKYOh08eF4hkSOL/Riwq79PAqbNZqV1q7779TQTHaQG
         HCUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrZiBJZb+UZuWGxZS2hgU6rmr61iowYnim9049Gf65LaqEzMiQ3W92hy3UpvZBLfsPut5cqlkbqltoHSt/s/dz@lists.infradead.org
X-Gm-Message-State: AOJu0YzvzMz8mY8u4XlyqowQ0X/mkcZsesizq7Kpaerh+AeM8S2LwU8d
	zh8aDwbV4qohqMxdNNhnskg08H1GyAZ1QVqqFpb15KoS5STB8c/VpdRi
X-Gm-Gg: ASbGncsL1bF8lHUVdNSrsNCr/8m8kNTWTWWHhkpzhQJ3C8oN0uak2yTMmgWeO1KSO9z
	foUvIHvxQ9dOaW4QhplOHMQUCne+iJ0LfwfAnXd8dYhCnnrJjjgmeNp5/kZTu6ZZLaql04VfzjR
	wQqJTOGTDekV3N+ASeg49LutdSRfFUcM+Ckedy2Db5fBEuO7sLFrL8NaYvMBHfkIfq/BehXwH0F
	31Kens4c1A+LHKj9PuIbo/SYNdiIJ1WyMHc0eRRleUj3F62beQbkL7UuHgSPcXIaoLvXKdpBcHV
	giovgnMl5TFkMwNtP3FvdCcUhw8S6tJZE9KazS4FqH/4fw3wdagrb1k/GW2sz8NGvcqok1Tdk0B
	bjV95m1DvOvt/DGIi9OOmQr6uQwAMphqyWpZWUc3PZFyK3Y3lLkCJLqsn7yKc27pwQQvcdg0We9
	++WIiDcT1oxAuF
X-Google-Smtp-Source: AGHT+IFeEMUY1hlZMIO7vaQDHfSuMopLPItnuGA64biSepIE+VCQtt3fHMYNGXlZMqO0KMdKPxM+lQ==
X-Received: by 2002:a2e:a9a8:0:b0:355:e2d9:9c83 with SMTP id 38308e7fff4ca-37609cea115mr65031261fa.8.1760451201065;
        Tue, 14 Oct 2025 07:13:21 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37634aed265sm38378101fa.8.2025.10.14.07.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 07:13:20 -0700 (PDT)
Date: Tue, 14 Oct 2025 16:13:18 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/5] I2C Mux per channel bus speed
Message-ID: <aO5afkSgjvDViMId@gmail.com>
References: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UtyZG84lIxvJbmRv"
Content-Disposition: inline
In-Reply-To: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_071323_776268_98344954 
X-CRM114-Status: GOOD (  23.82  )
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


--UtyZG84lIxvJbmRv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, Oct 02, 2025 at 04:41:31PM +0200, Marcus Folkesson wrote:
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

Any more comments on this series?

Thanks,
Marcus Folkesson


--UtyZG84lIxvJbmRv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmjuWnkACgkQiIBOb1ld
UjKh+xAAkkGlqFuabpDZx0DeOU2tT5KZTfA5XMjR9YkT64Z+9kug4zZ4NxpjjnrN
2+zg81cG9ca1QqErpq0jM5SSp+KxhZJLFElsecig905+4D+oSsDL4XyU59Krwv/s
M59mcKQMKRTsr9D+J7WWoNuPa84qbG3nNusgqZRmHaS/59B5FGOtmWwnpkDbEyg5
sgBupn0y0idAIV+RDoh4YjFXZsXndEmr9lkRDHhmChL5tHC970dsq183ttJSG/tQ
K0kUQ3ilst6ZnDoZ+VIdsTRX60IRzxntAL6N2cay+NNxk1J7NGX2CDZUJpllmzhJ
JER+LjODXPGz86zi7yRCYRiLAQvZbCgrElk0IglfwdGpFWohh+9LD8Q5gmh8Nn9P
X1eDcrR+FFzmSkBt9O4BGsuBZ6U/Op62fpccLooibFbFWuCyKjfZHxVn3MgeJveY
Z9spR5F/G117fESQj+Dn8daAQCwjmMbgUtPKvPSoeh0mPoTXgk8lWx1twsAl9gzL
qJ4/AHjkH0M4bjUkxC6RL3p+GbF/22jgig176Fu3WUSnfjceZK96EmuCsAslGTBC
itO0Grs7yFsWBa5W/EmYKEktqUnrbRPkNkBvqt0Hq/czG88/HkJc0WucI3y0njX0
1vD6sIQ+wdRvx1C+fjVJC5wmGYOLX8VTpuVj0r0vvOQBWry3wEU=
=4xG5
-----END PGP SIGNATURE-----

--UtyZG84lIxvJbmRv--

