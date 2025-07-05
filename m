Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FC6C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhXa9esT/5VXql/uG7nuK4DRUevXL199pPe0ERZ9KrM=; b=E3Xg9e2gyJsTVZfA10EMKBJR6W
	lTf2NJcCcFnocCRFh+sFjha+o4QE6fIx/n+csyw/IdVv/NQl0hHvTF1tHBnyOXtOSrl16k0G3xqtf
	eXGMEnKMCCr3ckPym6WiS414IPcQ0WPuOMmmjv54XB08vf40BjPbXZtBS2UFyOELXVv1e0sUA8drE
	3Iug/jPMs1KSw2qY4Y1cgaKWqq8jQcFDm02nMXX6AbiNMcRDBkOKOpKjE8Wd49UT06m9euV4S3P7w
	GS7vuXoqYJf/NKviM8QWMvlXnae4O3T4xv2CkNacQkUxjxYD+/v0N9Xnl+DxpMrvsgxWaNwqYffFD
	LMhk2qgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXzZJ-0000000GMdk-02d4;
	Sat, 05 Jul 2025 09:52:25 +0000
Received: from m101-out-mua-6.websupport.se ([2a00:1968:0:9:109:235:175:106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXzWx-0000000GMQ3-3LjI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 09:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=palvencia.se;
	s=mail; t=1751708736;
	bh=uhXa9esT/5VXql/uG7nuK4DRUevXL199pPe0ERZ9KrM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bXkF61hdjGYlYWI7fRAibPkbjV8n1SIWfk5H2xp0LjiOTtSSyNipITFlEldslm6XR
	 NL9lHwpvEoxFWIdhZMsO8dsRo4R9FjCvrnauBbnR2fUof4OA7Qf+md1EqsFnbDIlWP
	 lA3FCvK9wy8+qCNgs3Z6zWTCA2jEpaed+IdMyl5xMXlLNwgp02mtFYEuMAW73A4yX+
	 diuvVGI66XejLonv7oR06HTMMEVVgv03mDqGuBVDNeNEjDuWg1YHXkz+tscKC867ei
	 OVgWPnFf7abysW0LLxDFe1Xf+TjfzHFOu71XfAB4SBnHFHNdgPyzgi5x1v7/3dS+yq
	 HDTjRn5tptW3Q==
Received: from m101-u6-ing.websupport.se (unknown [10.30.6.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m101-out-mua-6.websupport.se (Postfix) with ESMTPS id 4bZ5GS2fDHz1Ym9;
	Sat,  5 Jul 2025 11:45:36 +0200 (CEST)
X-Authenticated-Sender: per@palvencia.se
Authentication-Results: m101-u6-ing.websupport.se;
	auth=pass smtp.auth=per@palvencia.se smtp.mailfrom=per@palvencia.se
Received: from rpi (unknown [213.204.219.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: per@palvencia.se)
	by m101-u6-ing.websupport.se (Postfix) with ESMTPSA id 4bZ5GN71HQz17mm;
	Sat,  5 Jul 2025 11:45:32 +0200 (CEST)
Date: Sat, 5 Jul 2025 11:45:27 +0200
From: Per Larsson <per@palvencia.se>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland
 <samuel@sholland.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH RFT net-next 04/10] soc: sunxi: sram: register regmap as
 syscon
Message-ID: <20250705114527.73b15356@rpi>
In-Reply-To: <CAGb2v646HvqipGd_C=WJ4LGsumFfF5P9a7XQ7UGO6t1901DDiw@mail.gmail.com>
References: <20250701165756.258356-1-wens@kernel.org>
	<20250701165756.258356-5-wens@kernel.org>
	<CAGb2v646HvqipGd_C=WJ4LGsumFfF5P9a7XQ7UGO6t1901DDiw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Out-Spamd-Result: default: False [1.90 / 1000.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:35790, ipnet:213.204.219.0/24, country:SE];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[netdev,dt];
	HAS_X_AS(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Out-Rspamd-Queue-Id: 4bZ5GN71HQz17mm
X-Rspamd-Action: no action
X-Out-Rspamd-Server: m101-rspamd-out-4
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 928
X-purgate-ID: 155908::1751708736-048FF069-EA712F3F/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_025000_125984_CCD03CEA 
X-CRM114-Status: GOOD (  12.39  )
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

On Wed, 2 Jul 2025 13:01:04 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> On Wed, Jul 2, 2025 at 12:58=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
> >
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > Until now, if the system controller had a ethernet controller glue
> > layer control register, a limited access regmap would be registered
> > and tied to the system controller struct device for the ethernet
> > driver to use.

"Until now"?=20
Does that description (i.e. something that used to happen, but not
after the patch) really match the change?

- snip -

> > +               ret =3D of_syscon_register_regmap(dev->of_node,
> > regmap);
> > +               if (IS_ERR(ret)) =20
>=20
> BroderTuck on IRC pointed out that this gives a compiler warning.
> Indeed it is incorrect. It should test `ret` directly.
>=20
> ChenYu
>=20

Regards
Per Larsson, known as BroderTuck on #linux-sunxi

