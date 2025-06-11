Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A07C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fw0ROdeFkh9FWMHJ/DqYZHwPq7uqPvziD7anVpTSv94=; b=W+A5DrXgy9IY14NfAP36uEjhJ9
	TebBUAduAtYrktaaCaZp/qkl2jqNaL/AqK/rt9uE/T2LRt9ZMHZjyDz+oI9yBzCI1YL2hMA/AvB+j
	hbv81MxsogKeq8FtquTrYDFVfePP49PdX130rCLB4fOxeZbSdm7b03RXNt1QsGqTlyWSHrR1usm1H
	GBzuv7/ayn3o1hBjlITHJyzYn3zw5KG9/N3j56d46J2S/OOPpY1xADyWSASQz3KbxKOjeGf03ipYz
	ZKz5yAMkv2XRPGJKdQZLO9qEMopfQ73fBJZknrKvKbBCh4kVQONkfbol/QWCFPzI/TADhE1AwjaTX
	Px001Chw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRWu-0000000B1yQ-45Ru;
	Wed, 11 Jun 2025 19:54:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPN8e-0000000ALXN-2use
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 15:13:17 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-441ab63a415so71210945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 08:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749654795; x=1750259595; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw0ROdeFkh9FWMHJ/DqYZHwPq7uqPvziD7anVpTSv94=;
        b=meQud4petqoUl0g0roJITaARqK1qK/4Mm6Go5TcXvT6w/51LPXLogDtHwnx1W0qUgc
         A6u0Ouo89ABCtBDZZdxsLO6Bs20LEXdjLrEvq4v4qEjmVbdqKPyCr5n0kUsdxWEgEQ0U
         D7+9doUgC6v7R6BlhitfiPEiHHSYYPAiUSQoPEFcjsOoXEsdJcD9wE47NdMZ5Mj4DoKg
         Q1IBzdFfid8n6vwxiOGiJwST5Ho44HGD5qZ1hBdeX+udCG39G3tebRu3ObEV8rm+QWl4
         dE5VWus86f+17z8+tZDlyuP+AK5jHvhofHD1caSIRQXw8lvmK7yz69TrBpvyTwUq8BU8
         FPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749654795; x=1750259595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fw0ROdeFkh9FWMHJ/DqYZHwPq7uqPvziD7anVpTSv94=;
        b=fAo7gVrI6SggJa4Ui/9S3Jw2c+exnVx497G/NY4DiPRXI8TSkddbgxxMLTvCClgBVs
         TgypkOaUVsYrwJXb52mm9fMpYf/dp0fjqMDm31ahzJ7kZFKd4i6vT+U5HEr7H/cjHxwJ
         lLJoJuYH0snb/rk5gPSfv/wzOF73mKUaV95yOVTlWF+EYi38GKljEtPq5ctGbsr4kbZG
         wIBmjZ/kKL+8PFYcG3m2Q3uUyDOCPyLudmisvGJ4YXTepLNVPBiWkR/0ZVJoWPXxcqBQ
         ru5CF7NhOK1Nctw4iKhjmNWZH1BxSyLtd5UU4BvmIH8w6IH1RT9JICT3xWejNjSOT/Jc
         /i0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGGzHpmV1mi2xBUS855Fj8fUpIOAD+JiGLeYBsecZxhY9kaLoXQCw/xFrn94BLUElMT1pPfifN3wV8bU/Q3MwH@lists.infradead.org
X-Gm-Message-State: AOJu0YxzNFBchN0DeETYRbjH13gQGxiX0kGgGtaRIWKL0wHdv0TFcmY+
	U3yk35gF4CbP5vAy8s6SK2KFIpM7OgB9dJaiYWu7VVKk/XjtYrxi3r9Q
X-Gm-Gg: ASbGncuw8xkfV/HN0PfwhmwZQuEhtWj5RNdwilgWJ7qb1go6lAD6MQdpijqA0MWVsV/
	Fd+LjC6cF1nvNfqHj8+RCOR3SW6Oz4w//DANzxebzpA6ioTr3kz8TkbVXhdn09tHF+qwTcZs/4g
	feZszcp4ym4XzhdNtUvRid6HU57vlEx0h0/y0NnTbf/Zuw6/VIA+xL8oJDJjCvvlBh3x2/BTKOT
	Pg+SPUPTb23gSAH5eq2qst3pauD63dwzItNe/9R4lS/Y0fdAR9Tr1kslCcMlUW6uDCwM5y/sU8X
	54vea1kRmfq0NOYgsMTSK1Mm+Lye1Tf1OpuzdRYPWVqAlotMiYxy79R7hhxM+lejKOGasjo4Zjj
	Ccd+jjhW81YoREPSQKsaxJPlBCvWuLtxmxjIUqCprcxID8g3Q
X-Google-Smtp-Source: AGHT+IEDVsHtC1GbgmVXkrBhi7qP89VRSAHqsPRw+3TK8NgfPIpRXp3HCwEkAPPqvPVqYIRwks0NVw==
X-Received: by 2002:a05:600c:3b1a:b0:450:d012:df7a with SMTP id 5b1f17b1804b1-453248cfda0mr30513625e9.28.1749654794417;
        Wed, 11 Jun 2025 08:13:14 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45325171412sm23865525e9.17.2025.06.11.08.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 08:13:12 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:13:10 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] soc: Use dev_fwnode()
Message-ID: <nrukbxvov3vgyqtanxqldtnovzhhijpzamxhj3bqrouqbx3tlf@3stf2h62h56d>
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-19-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6vwrysg6fi76oazm"
Content-Disposition: inline
In-Reply-To: <20250611104348.192092-19-jirislaby@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_081316_733876_F64B6401 
X-CRM114-Status: GOOD (  14.16  )
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


--6vwrysg6fi76oazm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] soc: Use dev_fwnode()
MIME-Version: 1.0

On Wed, Jun 11, 2025 at 12:43:47PM +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
>=20
> So use the dev_fwnode() helper.
>=20
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Qiang Zhao <qiang.zhao@nxp.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
>=20
> ---
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/soc/fsl/qe/qe_ic.c | 3 +--
>  drivers/soc/tegra/pmc.c    | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)

Nice.

Acked-by: Thierry Reding <treding@nvidia.com>

--6vwrysg6fi76oazm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhJnQYACgkQ3SOs138+
s6EVqhAAwl9x/C2bZ95K26Ya7KjGd12r+UguN2KE+Ox5oVvGiXJqH01jlbLNQQNd
e2dWs7Ab/Pm6GDWPizV/3GDmtAjl/VTosIk68fHIfgn+lbOuPCIbF1357hby0EoG
EsiZkTH37DPAHssGvu8HQvc2dcdrIAY0l8CMDF/02q0rEudONhfR2IdYuUrdQ+2s
nTXWdU3WyJhznnB+a0RZMZTjqzR8uac7xkAJxoflrCBBfVlJqibqzFqqkjQihAQC
P+/YoQ6k5S+E2PHm4hpSsYKlgT++RKWIhiWM/TfWdwRqUv8FRQVdGzfh/NrnVJB3
2/QClOh5C5d+V5NOJPsuZLt/aJNoAcOaHcEP10hxmM4uR7cyKMz6mcB5mxVQ/+eJ
EQLIhUPtBQQjUO9438neInn5zIv3ASFpLodyMuZQHGuHbD/kcifBX1sPqrFa21yC
ifK20ep2CQugVVWYR7oYtcylFXLdWtjag46oGtMikG7ym4t/5mEeNhhuh9FmiJ1w
uYS0ei+jnJSb6fQsmwlZyxvpqBS0XIakoHL+/ZTA/UVMwUenRcQ+mJGI83k6m1IR
ajr1OdeB9FR2D95Tmi3WlQFsiO/vhi0D0Hg4leYelvUtwrN0y0PCuqJbF6A4lUNi
i+n2VZDdEsaQSWTwn6S4FRhScCYlb3AALXE43F+jTwR6xbEIXQc=
=w/HU
-----END PGP SIGNATURE-----

--6vwrysg6fi76oazm--

