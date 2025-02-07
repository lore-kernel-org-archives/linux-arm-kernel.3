Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDFCC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiPV/oHe7RmZIp/M852C28biSFhSs4bIOllT1QoCRG4=; b=Z9mIiPKFMUz+YY/42rfnJ5A6v6
	Y1+yaI0HIbNHmWdqQTft/U8u2OyRO0wqWe4+nInOZjC+9nq0qPvCXKxUyyZ3OAYsC04DMfzLDAjUp
	qDUqbfu7A8q/Uti+E8+ctpIhwdjLyKAg03XzZDn8KptsNY+nhxxjJc8pRfRSxUofhzG6dJecj2NFc
	A/agGY4Mcdwon86phrip0JahfJ89EoIRz93nXTbRkHjJwdmyWXJdZhUtQFt9R+/ZB13YHonDkFxK+
	nR/Y/4O7riklGKsQ2lWOg0Hgdi2FUf7b1bOh3WQvFlLhXlkLGPqVAJ++gRpUGyjH3Wa1VBWU+DbAD
	7AF9pCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRmw-0000000APZy-3gVV;
	Fri, 07 Feb 2025 17:05:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRQn-0000000AKe9-031Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 16:42:18 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38db104d35eso1864769f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 08:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738946535; x=1739551335; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FiPV/oHe7RmZIp/M852C28biSFhSs4bIOllT1QoCRG4=;
        b=fJhJ6Hk0v17dZLd9TJ4W3gAHIR9qDdFCEOZb+e1FijAwtESvl5rrhIvsss0k+DaAgt
         PnTTnlx/iv7ipVW9peNRbDzpyp19CbLbxH92fajDYjazcoXjCdA9CipGp1peRWAjrvy1
         2t1j45Nswp5UNsA6Udo8mqIbXfWRhUwL2YHSDIQdPqI0942GR8NCjVkoFq05Qnmqkk6T
         id8EctLHU1fcT9V8eQk2lOTMbSgI98ZWrCEuVw8v2RoJ+qHQBbd2tNGvZfvaV5QsMn7X
         E+Pk8aeatmBhwvanEcSSkfosS2lkHmg2NFHJ/27wxWG0Uo/qj90uAkP8McLyyglkMEoO
         GSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738946535; x=1739551335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FiPV/oHe7RmZIp/M852C28biSFhSs4bIOllT1QoCRG4=;
        b=w9WY383gGNmzRxkM15PtPZfEcoL1+MZOfyAXiMeVxdQxN+JLtv3g6uzl4VOOnwHwe7
         rRFeyr57285TccFgF0Ss8yM+YKuQPYACxwPjkKn0HueH4HxKTumuCuQDi4rFdmRNP3Sd
         ++1YrnoK35n5oqrnQP8JDkOed57ij7YGoAv/pQKKTskjq7/gmTE5P8cmXUiW355ICOt8
         tPwjBQqb7M9jQlwFlzJ4dbIwSp4Iw+WdOFODmBYrW89M+/VN1fEfSEZaixCXOjiNjUwa
         NYAEdw7krNamyUZ9URMzwMkgchIYTecNZQa52AqbhyHria4QLTIhp8WhXwwq7AKMJeNC
         igeg==
X-Forwarded-Encrypted: i=1; AJvYcCXz1VIKyGVyTko8KhR4GJrtWLCmvsP1YWFycB5FlZLRJVT5iBXNdUwDMLkkzZ9Mmbc+prQVuo7A/74zgGe+UR5W@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/KC2j5MjsHdPGspxMDMKZeF2BDjmg1BjFYjbIdKvmWyrmyyil
	bEcNkUZDHhF3qYKeF99wo2eh6AkR2hDRSNKgrMPKmDPxFFpKpzB2
X-Gm-Gg: ASbGncsn0ceLyziM8G139c+c46GEYRa2Ogj2RwN+Rv6YtVLZ1Tu+JFZbcLUjhh7+EFU
	78RhsyuX0imVMgQ8Xz2owxzElJcdWhe/2FI7oYQC9TJRh7tFgocFxWtrSQKpkLoPio/OM6w86jY
	SCtRqr+5Lgi6hB6ffG78cKy8lw0wky+C+lMY791GB1A2oSxOGvrXRkKlSrKFBr8Aal1/Gp/FXb3
	aXslznLZQVpvvxITQwmzPx2Gr5obgBjkWC6Co9uWjTL+5JbiQJL5Ae+Oj49E0U7YUJ0EcS+B/U6
	ztY9tner0QjqupOEsEExIJZB0HDjrV5vFdmeC+oUpIkzeg1pobmJmlVGXNMnV9ldjY+hAxVrUL/
	/BQ==
X-Google-Smtp-Source: AGHT+IF7y5ag5xXtJbBXF9RYFf/lu5m+MBmyeyrGK4CKk4esPPFHu01PFcCg+qkitoVRNQ1xblHDPw==
X-Received: by 2002:a05:6000:1863:b0:38d:d0e7:7d5c with SMTP id ffacd0b85a97d-38dd0e77fc3mr943984f8f.23.1738946534954;
        Fri, 07 Feb 2025 08:42:14 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db11264sm94032655e9.35.2025.02.07.08.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:42:13 -0800 (PST)
Date: Fri, 7 Feb 2025 17:42:11 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, xfr@outlook.com, 
	Brad Griffis <bgriffis@nvidia.com>, Ido Schimmel <idosch@idosch.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net v1] net: stmmac: Apply new page pool parameters when
 SPH is enabled
Message-ID: <heg3exbrmo4zt64cdeolououo25lj2idusepuyuu7iggxgn5fe@6bky6h5pe3tu>
References: <20250207085639.13580-1-0x1207@gmail.com>
 <8fc7c79d-ace8-4e05-acef-1699ee6c4158@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fkugobpneo3jjh3p"
Content-Disposition: inline
In-Reply-To: <8fc7c79d-ace8-4e05-acef-1699ee6c4158@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_084217_055037_228CF718 
X-CRM114-Status: GOOD (  29.93  )
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


--fkugobpneo3jjh3p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net v1] net: stmmac: Apply new page pool parameters when
 SPH is enabled
MIME-Version: 1.0

On Fri, Feb 07, 2025 at 01:41:49PM +0000, Jon Hunter wrote:
> Hi Furong,
>=20
> On 07/02/2025 08:56, Furong Xu wrote:
> > Commit df542f669307 ("net: stmmac: Switch to zero-copy in
> > non-XDP RX path") makes DMA write received frame into buffer at offset
> > of NET_SKB_PAD and sets page pool parameters to sync from offset of
> > NET_SKB_PAD. But when Header Payload Split is enabled, the header is
> > written at offset of NET_SKB_PAD, while the payload is written at
> > offset of zero. Uncorrect offset parameter for the payload breaks dma
> > coherence [1] since both CPU and DMA touch the page buffer from offset
> > of zero which is not handled by the page pool sync parameter.
> >=20
> > And in case the DMA cannot split the received frame, for example,
> > a large L2 frame, pp_params.max_len should grow to match the tail
> > of entire frame.
> >=20
> > [1] https://lore.kernel.org/netdev/d465f277-bac7-439f-be1d-9a47dfe2d951=
@nvidia.com/
> >=20
> > Reported-by: Jon Hunter <jonathanh@nvidia.com>
> > Reported-by: Brad Griffis <bgriffis@nvidia.com>
> > Suggested-by: Ido Schimmel <idosch@idosch.org>
> > Fixes: df542f669307 ("net: stmmac: Switch to zero-copy in non-XDP RX pa=
th")
> > Signed-off-by: Furong Xu <0x1207@gmail.com>
> > ---
> >   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index b34ebb916b89..c0ae7db96f46 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -2094,6 +2094,11 @@ static int __alloc_dma_rx_desc_resources(struct =
stmmac_priv *priv,
> >   	pp_params.offset =3D stmmac_rx_offset(priv);
> >   	pp_params.max_len =3D dma_conf->dma_buf_sz;
> > +	if (priv->sph) {
> > +		pp_params.offset =3D 0;
> > +		pp_params.max_len +=3D stmmac_rx_offset(priv);
> > +	}
> > +
> >   	rx_q->page_pool =3D page_pool_create(&pp_params);
> >   	if (IS_ERR(rx_q->page_pool)) {
> >   		ret =3D PTR_ERR(rx_q->page_pool);
>=20
>=20
> Thanks for sending this. I can confirm that it fixes the issue we are see=
ing
> and so ...
>=20
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Yes, I can confirm as well. I've tested based on the discussion in the
earlier thread and had the equivalent of this patch (modulo the ->sph
check, but that's always true on this system), so:

Tested-by: Thierry Reding <treding@nvidia.com>

--fkugobpneo3jjh3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmemN+MACgkQ3SOs138+
s6Fq3A//eleSd2dC6AIYwZSlmN2xxQXFAVjTTNU/LQhRI2PSENWvFHSXJDcGTG+U
OTEIid1JgSaw+/xwshMu0F6lR1OmIeBCMudKmla/AxFUEOYF2JWkYPQgCfGalJxe
Ig9uZMsXmaxIeunEhaRQhYiBU0F9l7+IKe5yr8sFnUNrI1UJUQ23aJqAnCxJmtW7
3w/KbNMMii2TygqUrDaVHaDqOe4azGVzAGNYSd1g1iNpVYiORO8t6VHpiUBtJfme
k3ryZ+ptRKVTJX6pdiUYtjfTlSOW9ncvlgwyD8OGGaLG1RsoOWBiVTdGm13XDbm2
tDEY4ggUyPYUmphjKNsCjivZ9vqeMWoQ35MDCR3/pI6j/RVDkNSQmEH55qLyW4WD
67s3SF4eoDiAQAzzZ1C9vp96I2bm10J/NX2flJ036cw+2SXAl2rprzDrARhTupC9
uKTCXlV7vep2zRRDIljBxZDE90WTUL4fj/u9cKDXjRkkYrf5inVJuMM9zTO56HGn
hyYqmUhDklG4jLYmEp/g2H9pberttT7RCVo6UeI/P+Ms9B5Xszf+tiIzGti/SrDv
pCTV4/2D/wucb7zdNeX+a2j6D1rr6CgITO5sWT7i2w/o/UcHoXQV4E/gY39V4s9O
g1NrNtk9aOd2qalUqpS56aboQSaz04QWnYNubjlbxDgT9R+f46E=
=AlgO
-----END PGP SIGNATURE-----

--fkugobpneo3jjh3p--

