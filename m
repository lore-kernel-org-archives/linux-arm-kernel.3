Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56045CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AH2UirJCWDjtQ8R32qv313a+sS+NLZo8fy7CiVjRpSU=; b=vNEOEghjy5M1qvOBgBOOJ5NzQW
	xK6Ji71nSrREqigFcqMI7rlGcCPL13zyo2awrDX21apUkfu2dgDdXeGqTXnmh4UCfs2rBZFbO2jVb
	hSFioZdnE3egnKXUQHWWJS8Ym9Kw+D9j9dJ0fi975btLRXdKgBbB0rd7+0RnCqEiSxL/Jx/5Dj9x5
	0TlHUZgnlhSKwVZ2XxE/3wDcKRtT57glsNuWhxyxdp4atQswNRoTb48vu9qOgZIKGehmqdsdygM53
	dmxbIKe2jprte95353l944sz7LapTvI6yNzX5pRKw3JBLCsLqf7Tu9DZQ/DWHLo4Bm9b/H/Sykdov
	A2tTrArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLOJ-0000000BMEK-487V;
	Mon, 12 Oct 2026 19:08:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLOI-0000000BMDz-3OWQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 19:08:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D08842E5F;
	Mon, 12 Oct 2026 19:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40A31F0089B;
	Mon, 12 Oct 2026 19:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791832134;
	bh=AH2UirJCWDjtQ8R32qv313a+sS+NLZo8fy7CiVjRpSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kQ+QH3abMyKT2hbftVxX9XFZgH/GiMSWph9bG9HxraLBUjQ0N+StNB9KsQYvvkwiV
	 Pg5zYOmXvvYa3Pav0CLHRkwPPtTepSUXakhiy+ISkksn3WlIRe6epE3tuPBsZD9E4+
	 T4UVCCqYso81hQAHLKcsK2wPvigYccynGcCJo7c/Uqw0lyw2X0CPRH3fr4jJgQtmjQ
	 OUL4qwzUOKo3LY1N/bmEAKbXPpAD99z/H59Ll/FIYaLMbHm8xTH515OFgUxmPdgPPr
	 lhv91rM7LpVaGtuyhW96p//w/btde2nlH81Bun4BOAP31gSqHn8Q52bsNA6PamT9c3
	 scX6AQLgNr2wQ==
Date: Mon, 12 Oct 2026 20:08:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: bridge: simple: Add the
 Toradex Apalis iMX6 VGA DAC bridge
Message-ID: <20261012-overtly-powdered-c8c2869e4319@spud>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
 <20261012-v1-apalis-imx6-enable-vga-v1-1-8905d8746504@toradex.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cfz7Ef1U0dsCKRCm"
Content-Disposition: inline
In-Reply-To: <20261012-v1-apalis-imx6-enable-vga-v1-1-8905d8746504@toradex.com>
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

--cfz7Ef1U0dsCKRCm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--cfz7Ef1U0dsCKRCm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0wPwAKCRB4tDGHoIJi
0jlnAP4yIPeZyDrdvqTGaV/8ySZ5uj9SUbamP+03AnBdo4AXpQEAzZ00qNI8KiIV
oDO4vZxCIctnH5UQGVexvOnOtgOWYA0=
=W8Vk
-----END PGP SIGNATURE-----

--cfz7Ef1U0dsCKRCm--

