Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C36CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbEPrVN5uf0fCmTEAFFEClipAR87NGz/18xMdKAg5s8=; b=YnvfgjFl4ds8EtTW4TEOYo3SoF
	ZzQJgdVtPGl7CRF8dJ5aFKwvbP+n2ZvQfgAuZEVDw5cwtlPiEwPjmU9Cs0EA1L9ks1wdBFfZkTiyN
	oHOyUYlmvMOCJCIaUmTM0K+LKUXZ0l1SlHSlI/m1VotigLFKfWeC075+bGP/6uA9xqj9IpNu7TcW1
	k8ktwIsMLLpFTKByBZJAaTCH5fwqi8t34CQiBhTtKYFbnA9TIkcKfyLRHfgBo3DQYTEmRVl9SS7sM
	wOE5wKqGl5x5nudJ8sl8hQU9eNpNTbFiq+jrqV94XC0N/Sm2t277oDPSAUmkYlZGBeN08YT9JWLZb
	/+aPDo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmWi-00000005uxV-45TN;
	Fri, 31 Oct 2025 10:38:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmWg-00000005ux4-0bVu;
	Fri, 31 Oct 2025 10:38:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A0B8436A8;
	Fri, 31 Oct 2025 10:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372BFC4CEF8;
	Fri, 31 Oct 2025 10:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761907113;
	bh=pCW3mqiYKpJ+hdcxPaMD/6xe2J8m7xgEe48dlvDZ3gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JTUrI/kpTP1FK7p2e+8hPfAZy7ga0BoJ9cSl7qZorGTNxxiKLgt6MZyK57ZH1Lr07
	 6tcdKn+x6niUhnZl8r++Hx6gZMQvGcURlMLzPbdJefISbiIGWao0PzaldpHaRet2Pi
	 Cq4+XtreH74oI49663XJEq8RhZy81HhMOo7ZF/v+h4a6GB9KlbXGyTSpmtPy28ONnE
	 jR8BK8GJZqikTWRoRhv8xMpUxdqL6rTxF7QAawZaDAAcj8QW+gwoolUfWPi8C5eKSL
	 s3Cenygcd5JjViuZ8K86iaUzocAk7iBxH3mc40jbKfBca0ugRTaQX5nIvmzjKiblQq
	 H5F94Oe9DISAw==
Date: Fri, 31 Oct 2025 10:38:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jack Hsu <jh.hsu@mediatek.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, srini@kernel.org,
	ukleinek@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
	chunfeng.yun@mediatek.com, wim@linux-watchdog.org,
	linux@roeck-us.net, sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com, andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com, jitao.shi@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 07/11] dt-bindings: usb: Support MediaTek MT8189 evb
 board xhci
Message-ID: <20251031-overbid-renounce-e6f3b03ee18f@spud>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
 <20251030134541.784011-8-jh.hsu@mediatek.com>
 <20251030-underwent-courier-1f4322e1cb34@spud>
 <20251031-nifty-sticky-hoatzin-eeafeb@kuoka>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YeQbD5mvaLkqbUCf"
Content-Disposition: inline
In-Reply-To: <20251031-nifty-sticky-hoatzin-eeafeb@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_033834_262634_D4DA5C84 
X-CRM114-Status: GOOD (  18.46  )
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


--YeQbD5mvaLkqbUCf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 09:19:26AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Oct 30, 2025 at 07:32:26PM +0000, Conor Dooley wrote:
> > On Thu, Oct 30, 2025 at 09:44:39PM +0800, Jack Hsu wrote:
> > > modify dt-binding for support mt8189 evb board dts node of xhci
> > >=20
> > > Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>
> > > ---
> > >  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml         | 7 +++++=
+-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.=
yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > > index 004d3ebec091..05cb6a219e5c 100644
> > > --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > > @@ -34,6 +34,7 @@ properties:
> > >            - mediatek,mt8183-xhci
> > >            - mediatek,mt8186-xhci
> > >            - mediatek,mt8188-xhci
> > > +          - mediatek,mt8189-xhci
> > >            - mediatek,mt8192-xhci
> > >            - mediatek,mt8195-xhci
> > >            - mediatek,mt8365-xhci
> > > @@ -119,6 +120,9 @@ properties:
> > >    resets:
> > >      maxItems: 1
> > > =20
> > > +  reset-names:
> > > +    maxItems: 1
> >=20
> > Is this reset required on mt8189? Does it appear on other mediatek xhci
> > controllers?
>=20
> reset was there, it is the name added for some unknown reason.

Ah, so not helpful at all since no name is defined and therefore making
the property unusable :)

--YeQbD5mvaLkqbUCf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQSRnQAKCRB4tDGHoIJi
0kPCAP96dXVUKgWcbJl1yhQ4f4EkFhlKfrn2Z7Gj6M2yxhUAZwD/XjwGvcKdjEOk
OaeQJhtXQLUywWYtJY6pBr35YwUCWQo=
=AXz7
-----END PGP SIGNATURE-----

--YeQbD5mvaLkqbUCf--

