Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE334C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ac1w5UDndWpfCVQuaUsP7m+pP7PCwbr3gsBFVFw2qGA=; b=v8meZ5waBzo1HyW39Fg3SEn95/
	rT5hFfo3F1u3N4wYyKbd5Txmu11LhYb3SYyxiyernYyUM3v6c/VdyXHvHc5Oh4ika6N+Wy5YTO/Ap
	Urz6jHN+SHWTDI9ga3cBG/mnmcHxEALeptIr5D3Xe8l5uJIVIixIAU3WNi5CGqDSB+KriCiV2K2wW
	lStemZcrHCNN3HFTGaXNMZCiVMr7tK5UElA+Kb7ZbCvVw6u9001w70sjtjr4o/2g0X4xJUmI8tgtz
	2Ln2u2jwfqA4nPONykjiEZW4AXbUFuZgHRHxnfcQ/RrdMMJQSZTVMtiwiuwoxL8T/l7lAM+JrVvOG
	lAT7r4XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYWO-0000000HACp-0lhl;
	Tue, 30 Jun 2026 13:29:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYWM-0000000HACS-0lTQ;
	Tue, 30 Jun 2026 13:29:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9941413E3;
	Tue, 30 Jun 2026 13:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105D11F000E9;
	Tue, 30 Jun 2026 13:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826141;
	bh=ac1w5UDndWpfCVQuaUsP7m+pP7PCwbr3gsBFVFw2qGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QKmCj9qbPK0we9uPiMzsH/1QI6avTbJheXUhzVhwkeaYfI+Jpd3HS4x2mbeB0dwYn
	 d8w/RNPjSGg1L53htA99jxAztPNEoxgurte9Ag5XBLdJWWnV6pfG1EK1qEySHdavGc
	 ngO2XsQhNwQBud6rWIBkjjZGZvfYKPDjXo9OPJZ77+7lInP4qC6tu8kNDBlWOCoQzs
	 9Fa24EWY9G8HarZsR3tucNx7Kw+HzhBCAUZGAWMRaH6vbicVMmsu16Kk2c6l9peDWy
	 TATPkcMk7V/VBzym6rD71QDQlndxoibjFncQuW9RyKVxpgnzkHkRqA2B+Z9WKIaJRp
	 S3lJH2JULnXDg==
Date: Tue, 30 Jun 2026 14:28:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com, Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/27] ASoC: codecs: idt821034: Use guard() for mutex
 locks
Message-ID: <f5ab965a-9640-4df0-8108-7877f34b6950@sirena.org.uk>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
 <20260630063449.503996-10-phucduc.bui@gmail.com>
 <20260630092821.650c30ec@bootlin.com>
 <CAABR9nG5Wo1Wb+2_T6dR+6XTw8Vs9awSpQrSZ+k6=jp_ogoGCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YvGUs531CHtahqis"
Content-Disposition: inline
In-Reply-To: <CAABR9nG5Wo1Wb+2_T6dR+6XTw8Vs9awSpQrSZ+k6=jp_ogoGCw@mail.gmail.com>
X-Cookie: Air is water with holes in it.
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


--YvGUs531CHtahqis
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 04:14:33PM +0700, Bui Duc Phuc wrote:
> On Tue, Jun 30, 2026 at 2:28=E2=80=AFPM Herve Codina <herve.codina@bootli=
n.com> wrote:
> >
> > Hi,

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--YvGUs531CHtahqis
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpDxJQACgkQJNaLcl1U
h9DhNQf/XmcvwsWjntcyq28UDoJfIndKAZ0IelWf8Emc+uAmXZNPOWpTM0uqDZes
/u7MDWAJqUVrhYSkVnpJHeqxagbMgkx8LTWcL9BnkPiUdZCLvpEdsUFp/JUQv6pO
G8cTLXcjn6emBGCu8fhDirNEMVIAc9OU2Sck85rDBWPz2TCNklkyQs4/7OJCLFcL
zMkFBQviyoWI3SmaGdbyfEBaC9bKtnapaXKXHNaf34EBXup36NEgzi5akVxGZ1Au
ZLbaF0yTkzZ1amPpEz3/apXiNcqeqX4XkBDT7VrtCHCEWwL5opd3/Y/JPPy6zeZP
iOKnlSkh2KUc6XIBbcGg+ofuL0J8+w==
=Bcef
-----END PGP SIGNATURE-----

--YvGUs531CHtahqis--

