Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878FAC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 12:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CD5OwstgpMzIDB3nnm8lm8+2h5M23PSx6Nv2d5oaTxQ=; b=GQuSlFG4RgGJaB/nGzCUuL3ijn
	Rxq7sc+Hwftdp5Mqo1h84E2vRjCE2BM5uCB0oMsQSsf3ayFnq/WSYEmt4xfOgH521Ru7Y+bAOVgGx
	QubBEPy5a5gsD70Im3z0W+ELu7hcU2oUmwOCegcU21UHtJXei+pNJ0HORompxkNCBraIh11Waf8el
	TsElTdcAJjyz/J/uYQfsByL4HHSe9U23y50k5XF37Qcjl5aWayFxp7eS/D2pIWVaO8x9C8bpiDjGw
	sY6uZRzw+qA7m6pvs0YmYK6PBmWDiGm9tsUThPbE7LhnyOLi3RVlQ4ZRXUFXvkDLiHmkmU3Gn9K3m
	KOt8e4bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10sD-00000009GqO-0lrC;
	Mon, 31 Aug 2026 12:12:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10sC-00000009Gq3-071x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 12:12:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AED04400E;
	Mon, 31 Aug 2026 12:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6AC1F00A3D;
	Mon, 31 Aug 2026 12:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788178343;
	bh=CD5OwstgpMzIDB3nnm8lm8+2h5M23PSx6Nv2d5oaTxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZdU8CmXVJuFSlUO5l1upNskR7bhYgWDGj/pOcPzrorpWb+1NP7Nc2/2fxfwwISBkI
	 hzV19TwFueXpWVwYcgchB6ri4oy39dqJ9ZDeSYwfeL5VpZvqO4pe75s24s8om1YwWw
	 TlbtmxbXbAc6e36avHg+ZxVGawsu/5p1qh/NWBLY7f4YkQye/M0jqEhPs9g197vgpy
	 nd4+hFZU4acblvqUXuZagYq0dJNPmgF+dqX5d+K0qj+EjlrY8OttzKdFc308W3yxc8
	 2hpTxS5Y955lPr060lcCKED5r/HhpGUBRO09j4S4nGNZIhwxAk+7n9zigf+DCk3e4w
	 sWF1/PgE0D64Q==
Date: Mon, 31 Aug 2026 13:12:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 8/9] spi: dw: Use dma_slave_caps bus width helpers
Message-ID: <820f9317-8457-4041-8f94-5f5f75e7afc8@sirena.org.uk>
References: <20260831-dmaengine-support-wider-dma-masks-v3-0-507d97496f2d@analog.com>
 <20260831-dmaengine-support-wider-dma-masks-v3-8-507d97496f2d@analog.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+AhjCYXbI1r3nDs8"
Content-Disposition: inline
In-Reply-To: <20260831-dmaengine-support-wider-dma-masks-v3-8-507d97496f2d@analog.com>
X-Cookie: Sell by date stamped on bottom.
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


--+AhjCYXbI1r3nDs8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 12:46:45PM +0100, Nuno S=E1 wrote:
> Store the common TX destination and RX source bus widths in a
> driver-owned DMA bus width bitmap and populate it through the
> dma_slave_caps helper.
>=20
> This avoids depending on the legacy src_addr_widths and dst_addr_widths
> masks returned by dma_get_slave_caps().

Acked-by: Mark Brown <broonie@kernel.org>

--+AhjCYXbI1r3nDs8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqVb6AACgkQJNaLcl1U
h9ClLgf/VHBuWh4bKapW/V9pta/hHFd6AdEC3fSQe3piNqlsxij13907eXkDp5vK
49rYbjuUKofwlFtkL1iqWkbfwMLiZKB3Svg1aZIZ2vCmEHLNiYsn7aOZBr9QfbPZ
Xa0b0gL7qDlbjlnI/aVxdeNrG+lJPCOdXXbw2lyTU02JrFe616Kvw13M3X/oRZgc
1ApUKhWS+cNbymddHSiRqg+Xp7FZqsB/XqeoxI0jI6QTa0y9HN7YDaIb0mjk1nEF
rJd9cfabjSWy1n1SfBsKQpaOWn4AfHNdpI31RPjauLbRJPei3NokTkAWsfYmW/92
w0ChV1u7IFXxu0o9ZglrW9zt8VbrJA==
=qaNr
-----END PGP SIGNATURE-----

--+AhjCYXbI1r3nDs8--

