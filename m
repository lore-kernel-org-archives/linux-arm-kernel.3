Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F389CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EX9W5RH7bDkLX7Yf39fu1DvtbQ2nox1FjQReRMWn7TU=; b=ESkj05UyrkDel3fh5fX1Qq+JJB
	/rWyLPW1CNhbvnYv4njVLbc3oUtxc78rhKUjyZXyO5ebUQFdJwAMgoVF8m6P8LIGs9IueKg0b4+ba
	T6WjpwxbpoxoV5MehrvfJgixgI7ILFcFgvT7g3qr8KO0alUR8hfX4jdGHBOjtFupEq4LmUvBMJgFH
	+aynmTDq8vaC0PEaEuXaFdIL9iL/jzUE9A5UuJxHlK7d55iY4fuDelYMCWQ1Sh57LZc34amD4Cazp
	NNuYSyweHsEGD1DPznWpVDso20U/Bj5fVL5qxHDS2aYQjIVyIoLIsn2j/yxfOfSvyZNPwv7OxH+3h
	3nMHrnEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKBj-00000009o9D-1lSs;
	Thu, 01 Oct 2026 17:03:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKBh-00000009o8T-2xsS;
	Thu, 01 Oct 2026 17:03:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3963E40127;
	Thu,  1 Oct 2026 17:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957F21F00898;
	Thu,  1 Oct 2026 17:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790874197;
	bh=EX9W5RH7bDkLX7Yf39fu1DvtbQ2nox1FjQReRMWn7TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OS3trrN5b8W9fLou1Z12+BrRokT3+5lHTvluXexWclVL7xq2EcnSBAPW32lYJeQdO
	 zghxHKTCh/sDQIDqYKZDwhOWD3y9DaYG2sYqxTYBgRLRASEpGfQsJXocSa8t2hsWyy
	 G+p1PUH8k95nCe3AtV5co1nCAqR8B0EdZQmc/azcwbFJuWIW3FIRW5amhVP9TwmmS+
	 iPFv+bmaeTfkG7xjr6sGD57gRTB2fGyt7l8Xw2+AUPmJn+8nQQXRzlP5ED8SKJAKT5
	 KwhTlWo/W3qc06kx8DaYNFt1SMW5ZG+Dp0T4aw4ND2VuohGzUh7gcnf+P5759FkQPz
	 M4XhExyAsOeQw==
Date: Thu, 1 Oct 2026 19:03:13 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve <aesteve@redhat.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
Message-ID: <ar6RSRd99jbTdYOR@houat>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org>
 <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org>
 <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org>
 <artpBMeM13Dd0lLy@houat>
 <fb7ed8ab-8aea-4731-a5e5-c9476d8bfd38@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ddbx65bfv53pj3da"
Content-Disposition: inline
In-Reply-To: <fb7ed8ab-8aea-4731-a5e5-c9476d8bfd38@linaro.org>
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


--ddbx65bfv53pj3da
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
MIME-Version: 1.0

Hi Neil,

Stripping the rest of the discussion that hasn't been great...

On Wed, Sep 30, 2026 at 03:36:36PM +0200, Neil Armstrong wrote:
> But I'm open to discussion, and I'll talk about display Panel in
> XDC today, Plumbers and ELC next week so I hope we'll find time to
> discuss about this in person!

First off, I'm sorry things got that heated, and for turning the heat
up. I definitely overreacted there, and for that I apologize as well.

I really like working with you in general, our relationship goes back
quite a while, and it deserved better. So let's indeed meet at Plumbers
to clear the air, and hopefully patch things up.

And maybe discuss these patches, but that part can wait.

Maxime

--ddbx65bfv53pj3da
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCar6STQAKCRAnX84Zoj2+
dspTAXwMWHCEjivmSoqKAtnrOVOnY++dhvP2+IzSZvOQ+QVbR38foJ0sc702HamI
EP4rCl8BgKU1nXSjeAmaqM/chc9mDBRhTiWgmCSdnMOcoBacQUClBAXumDOiQitP
K30m9foI+A==
=fjZs
-----END PGP SIGNATURE-----

--ddbx65bfv53pj3da--

