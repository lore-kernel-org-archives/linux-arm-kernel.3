Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E99CCA600E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3+40ytroZd8UkOtxyfq7brsgjnTd3IzZPXyHWOv+eU=; b=44l6jk2mJ+QRilvp1TzLxzqdgS
	WdXEEAdzVjSm54m0HY8rO+d9fTxksrWFWmanZiWdQDCA09o0qzuwpIyYsdzc6ny1tQTDE//Qheh4S
	P4I3inURT0LUydFTl/WfE7RVNWvRNfqOj2TfX0Z77+4FvDkNo4A0Fg4Uhc3jAvpp5855gfWK1tVJw
	NHd1jjcXJTfiNqcqFUF0Ghgjj+0EQRdD3P5FwOmSZ0KFLvG/+uU7i46wJFB/zzAOtTxeAfL4WUraQ
	ljJJYlexrZ8cs52fseuoj6CQr4P7zflJfkznIT812pE4czZGXTooLkQCt2obT29KnLCp25vm7kvly
	1nOYTgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjN7-00000003qqF-0Xqr;
	Thu, 08 Oct 2026 08:21:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjN6-00000003qpd-0mKG;
	Thu, 08 Oct 2026 08:21:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9268041AF5;
	Thu,  8 Oct 2026 08:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6871F000FF;
	Thu,  8 Oct 2026 08:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791447659;
	bh=e3+40ytroZd8UkOtxyfq7brsgjnTd3IzZPXyHWOv+eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z6LASO2RSL2hx+ABfURA5fGHZFeuRNItRy0/zGQ9LJJpOlkcX5+gXvQkqauZewCPE
	 VdFiPylQJv4SCSRkUF8UsWuGNYIRTIfuDeYxOWgGG8ruXu56BWocM1IsOEsxsc2ds4
	 qYw7csuoULn/Ib4acBLfAvIhNbfN9046W1oKT4HwHkGU0cVbcsod27RCnIWqPsr01l
	 vSPRNUnly+i/vuci6Yo5FXgcJK/EgrqgZiFM3IrCATo10U2Q7IImerqQfEJItzONtZ
	 6bU0ykRP2j9CRxK42a8gUd9I+lNRAwIo7AQwsrYI2GDS1lm5Eu1w2pfE6tBQvegg8c
	 pvaWxgBLxPBZA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 06E611AC57CE; Thu, 08 Oct 2026 09:20:57 +0100 (BST)
Date: Thu, 8 Oct 2026 10:20:56 +0200
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Trevor Wu <trevor.wu@mediatek.com>, linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: mediatek: Don't keep a freed topology name in
 the static card
Message-ID: <asdSaDwahA5srEqn@sirena.co.uk>
References: <20261003194501.832558-1-michal@nozomi.space>
 <20261003194501.832558-3-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6i3hVWD2P/PaIFQB"
Content-Disposition: inline
In-Reply-To: <20261003194501.832558-3-michal@nozomi.space>
X-Cookie: You will forget that you ever knew me.
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


--6i3hVWD2P/PaIFQB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 03, 2026 at 09:44:59PM +0200, Micha=C5=82 Kope=C4=87 wrote:
> The machine drivers pass a static snd_soc_card, which outlives any one
> probe. With SOF, mtk_soundcard_common_probe() calls
> snd_soc_card_set_topology_name(), which devm-allocates "sof-<name>",
> stores it in card->topology_shortname and points card->name at it.

=2E..

> Save the original name before setting the topology name, and restore it
> from a devm action that runs before the string is freed.

This is valid, but it doesn't feel like this is Mediatek specific - we
should probably move this into the core code.

--6i3hVWD2P/PaIFQB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasdSPQAKCRAv73Ows9A4
iWjyAQCQ5EpsU2uUq6FAFEaxSaDmJrgpBXNidaTsw8CM7GmvIAD+Nq8nai9tUtVC
zgkZwIFH4nOACSEmWBUyknlThZRmXQc=
=71nn
-----END PGP SIGNATURE-----

--6i3hVWD2P/PaIFQB--

