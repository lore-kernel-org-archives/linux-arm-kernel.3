Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F1BC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOKPmpWRmdDBglqf84YkB3HAz/fgt7fFnGQ4z3lV4J8=; b=lGe+9qS24y6TdHFOSbMRlz2PPV
	LfOTO/QNUxWqxP4n8qXcpw5J3PzopHJaCRkJ4Hdqy4re/mEo4toiSvjdDhA9WVRDo15Uh0+ysIZQt
	rb1+IYMVJhxlym4Re38pGzzk1vkfaWudzHkEzzvhq9FHfc9ZpwBMlLx+HtbKeB0CV/rlUIlsVKKBe
	L+fGLQJMFobXlHD4zZYy7iEwfLAmBadxu69yjdiuxKmGqxBzx9Fz0lj6tkEIVEPuTn1tdTQuqC/JH
	BKHfFvijez9ccd/+CNZTpqcA+gczL+nbSo8RS13Bz7SPDbw4hHhABSM0/tSmG0oxFNuEmwHkSkMnX
	SwVhImHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40w0-0000000A0dS-0cSK;
	Tue, 08 Sep 2026 18:52:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40vy-0000000A0dJ-2wh5;
	Tue, 08 Sep 2026 18:52:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AC796437F3;
	Tue,  8 Sep 2026 18:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CE51F00A3D;
	Tue,  8 Sep 2026 18:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788893561;
	bh=DOKPmpWRmdDBglqf84YkB3HAz/fgt7fFnGQ4z3lV4J8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ieq4JLaRtlT92Yg0dCEjo4VFE7X1234dNn5s2zUPIZ7NiNXSGmSkQQFccLQBYWHhr
	 RYN3F1nROxCUN1B3nbU1qcvdS/fARGMxeXIBC0M3xsXKUfhNOP0y0lBj7ZuD80FyrO
	 YYD7Eni5KPI+8MP7nSsd/ANAyvZKOVnW4XlIQFXohh/yW3P/gwqVMp9XgrgrpIWGrM
	 Kvwmv2mW3Zn7/utqqBEybj89h+2cbzaTqGwYaRW9WfZl62QybKty/KBfX+89QKf8dg
	 YhnfVAqb1MqfylRhqRxXbuWa/SWl5KK5X12z097zGYHnCehSs1UY4qQ+WS+B8L/Nly
	 Fclmqr2A1t+eA==
Date: Tue, 8 Sep 2026 19:52:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: phucduc.bui@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 3/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate
 regmap update errors
Message-ID: <a88fbf17-faac-4902-bd39-ff0a616a7d2d@sirena.org.uk>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
 <20260907120310.135693-4-phucduc.bui@gmail.com>
 <e011cd74-7c5a-4cd1-b412-ad11765ad11c@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JWy8Wwp5/yGMiUOU"
Content-Disposition: inline
In-Reply-To: <e011cd74-7c5a-4cd1-b412-ad11765ad11c@intel.com>
X-Cookie: The world is not octal despite DEC.
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


--JWy8Wwp5/yGMiUOU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2026 at 07:49:00PM +0200, Cezary Rojewski wrote:

> I'd expect someone from Mediatek to verify this.  While I agree with the
> change, some drivers follow "ignore register update result" arch and,
> what was previously ignored will now cause basic operations to fail.

We don't really get any review from Mediatek, AngeloGioacchino used to
try to cover things but it seems he got busy recently :(

--JWy8Wwp5/yGMiUOU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgWXMACgkQJNaLcl1U
h9Ccvgf9Ggr9gv/6qkfKjZsgCMk8lQLLYxhJ/1oG28aS2ODQznEVI0n/o3onhTSp
9sWz6l6XoSuTlM0+U+89WVv2HZFTcs0wsaA+pE+OGa7diIQxlVE2+V5AgbbdLPHJ
h5Lhk2fB/Qubw+9taoXc8pT2Jmt/L89dCkVTgysWcDBJ+t0/2zhRB5YHSrsYiqbQ
fgbnFPbf6JVIOqaCm20N1AAPm0cqbXi3+/TAqVmuHXpIOccFDiy/NrwG5BZj2JDk
LySiLFKawdzJBIRjeP9EO46fau/vwCeJQbtsD0qdS4HAzi2FAtj+WZGjwS2Y9kJf
Muc8BwBg69bA6BnfHttIdruciJ41Bw==
=1Y36
-----END PGP SIGNATURE-----

--JWy8Wwp5/yGMiUOU--

