Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2D6F588EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 16:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpZ7ncDNJr9ziiS+LAieulgSFEo8xxAIbpPMQA4F9mU=; b=n9Y2m2nW3dNpo71CtG9Rp4FpRQ
	OVUw6tkeME3jHd8Tk44Gx9q951xw8nsiuDX9CwT/gD2VqXMvCKHAO/NsTXGV3XKb6hKSZ6nFZfg6T
	7PHwLfi3HyxYA1YaCrPLZDJVb+qApPBKSYbNmorVwT3v+xeU1pnSdvCAKQHALol77U6g0BffR61Re
	3y85q3ikAPd63yjvNuZuT5FZK+zuWyjEsBqgYxWkAo62xuCOFeUwmVEA7WgKUA0kCaJFeqjPQxmI4
	FsQSUzk6Fu95JTy27+RoVcyMVZi3nGgp2+7wxnCqsPwWs6Wi6P8ax8NvGuYK/2kDIyI4xGRyPO6vO
	ZiRB8rYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErFo-00000007PDm-2yHh;
	Mon, 20 Apr 2026 16:13:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErFl-00000007PDP-3snp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 16:13:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C76E402DB;
	Mon, 20 Apr 2026 16:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D94BC19425;
	Mon, 20 Apr 2026 16:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776701621;
	bh=qpZ7ncDNJr9ziiS+LAieulgSFEo8xxAIbpPMQA4F9mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GCyZafo9Fh/dEQP8jQ4T8sWyAUyJHulyQiSm09OXDMB/R4IbmiYf6xsJvHLRdqwo1
	 0jfy6MwgMWpQVX01lpDvwflFlluEV1a2RTdTLbUaCefLKt7HNClZyW8M/vx5y8TQdn
	 +UMQu6xbNY4JPECRT/P/iqcSdZNYYlObDQ5wYl9MTcBlQqQ4HRZn9NUYdjQzZuMRXh
	 TbGzQLN6MiE+5kTHeCPWNMnq7cOK4qR4tGUTV6wkuP6VU6smyd5dmJjO1N5Kw3qIww
	 mlJjrsBan6puI5myoUQ05311quXsvxO9AQTXdMSbKqVVmqbjpM1pptOBNtJTVNMh7c
	 kwUjFcKP5wk+w==
Date: Mon, 20 Apr 2026 17:13:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: clock: cs2000-cp: document CS2500
Message-ID: <20260420-silk-reshuffle-5cebd4e9b3eb@spud>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pUBdod/Tj2QGPXtO"
Content-Disposition: inline
In-Reply-To: <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_091341_985070_9C71ACCE 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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


--pUBdod/Tj2QGPXtO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 09:35:34PM +0200, Marek Vasut wrote:
> Document backward compatibility support for CS2500 chip, which
> is a drop-in replacement for CS2000 chip.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--pUBdod/Tj2QGPXtO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZQrgAKCRB4tDGHoIJi
0pjsAQCA49Pk0dsLboQWtCSvqUAqlzI1AA+W9v49L7Jrjx+s9wD+PH5THnhWjMV3
tKapKVmvGgUb9hPLap9b+GLi4MSdzQs=
=SY59
-----END PGP SIGNATURE-----

--pUBdod/Tj2QGPXtO--

