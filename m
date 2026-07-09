Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5150CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hu7RJDXVjMt/MUj7Dde25d8+nHf2eRwwqw8qorwPda0=; b=Ya6rRjMVEBDPmLRGVSuJ4E8GVl
	KSGffPsCAXDlmnEi8xaD818qr7kv8F+bA0kxBUSFJklwgeb/soACbs0KvysReEjcBsm5ifU4AvZDy
	2HV4dYMZPvkKQmoQqynXmofOIbSK+TYlBZ1wd2pFfxD0TUpwCbueBjm/GoFR8zZJhKFheIdl/N04d
	gI+037S/pAURrVb9usWOvcqTIGhxkSyWWZB5S0sBpdLtC9deX/shPsCUncoUKbOjTLodClflCn7ho
	4y94hdY0hpYSY7Ef5c8Ahmkrr5Q5g+kzuPCnCDAMI+HRwHHHcRk5u7y3ZluGfpY4lMEpjdhn9Vm4p
	4X0hoOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsNd-000000036tB-1dR7;
	Thu, 09 Jul 2026 17:17:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsNc-000000036sv-3tq7;
	Thu, 09 Jul 2026 17:17:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0339561381;
	Thu,  9 Jul 2026 17:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E220E1F000E9;
	Thu,  9 Jul 2026 17:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617463;
	bh=hu7RJDXVjMt/MUj7Dde25d8+nHf2eRwwqw8qorwPda0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hrWVg5NdnRkfv23bl3dStmf6K1bZbQqAsdmgNROeNtC6upsn+egi3YbvnFMxKnQDm
	 EFkTAuE/iRyWUBEKW1ukVsYOfLnX+BqFIj3gErTfolCNBgw2Dmf/ZC7qgiE5zHXbST
	 Z9XcuXXBW9BiUexjO5oA+SFpupSCIbb/LJ5cNe86ys1GEJSUEMuSgdJRvBF0T0rovi
	 1z/CReHMtCa2sijCoZaGkO1kxt36d9H90Dkf8uFQWITEHFDDT+4nbXxgVIexzRHv3X
	 csaAfEMHXaIILJJ1gPuWgBkLbP+4592aFblDIGNdWGLG2dXCG10YsYgyxoOCn4/uUU
	 gaicFrvskiLRQ==
Date: Thu, 9 Jul 2026 18:17:34 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
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
Subject: Re: [PATCH v3 00/27] ASoC: codecs: Use guard() for mutex & spin
 locks - part 2
Message-ID: <c74c52c5-91b3-4764-a7a1-26fc940bf735@sirena.org.uk>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="61d5AFFcly1gk4TJ"
Content-Disposition: inline
In-Reply-To: <20260709045902.498848-1-phucduc.bui@gmail.com>
X-Cookie: MS-DOS must die!
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


--61d5AFFcly1gk4TJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2026 at 11:58:35AM +0700, phucduc.bui@gmail.com wrote:

> bui duc phuc (27):
>   ASoC: codecs: da7213: Use guard() for mutex locks
>   ASoC: codecs: da7219: Use guard() for mutex locks

Only the first two of these seem to have come through which has rather
confused things?

--61d5AFFcly1gk4TJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpP164ACgkQJNaLcl1U
h9CXVwf9Hi+8k/grZJpWPryXkF9eQnmQKdVD9kTokae7G8oJR/aQEzZjTiF475Tk
pc+ahjdUoUcnZYBQLiaqQTJTnWvQW62QrUAGVXOzPv8KWas47Wd3Jd0LmWpgDpYv
MfzehjZyymLLmCVN8oImAvE97g7oUmbILYWnfkjfSMANhkSjbEHi/+VXT+tmxCzs
ihiM5Chu+C65wTbVjLw2c6ql/7p2aE61fnYsr2RCrFaV/1Xwbf+rO9AQIAdomo9w
nLP/cAg+fau0Wo6W44Pd1p8wWL0Bt6CR6QSgCRhv258l5YZWxS/uK5HNypSPnA9e
gNdNfKpYEndx7XQWxZrIeV7iSdzNNg==
=rheX
-----END PGP SIGNATURE-----

--61d5AFFcly1gk4TJ--

