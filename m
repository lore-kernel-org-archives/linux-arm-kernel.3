Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB957CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yO5xD4QvMzHviWtcs8bXvl6N8XiuSE6ZhudVzSa5qP0=; b=JFfoFILscqouOADheYmetJfsxV
	ooFOzwg0F377MiBfHxr9lFRdjLlNL8ab4jDmFIxV9KrLKNoY84yN73wW/2qIkUOas5uz2Yh9vNm2b
	uueQAjl4LHTrMk8WuovfNVZUYDe95/0KuzEvh6qcnbVn4zd7VJjpL+oDYXnNZZ2z/uElFK6hYJvtw
	mcHcv3ihORgcR7hmm4/XIoU652167KqiTyiN//E8Kqe/FcIOa/AYo5T4cnP37qpV987C63W8UAvDq
	LM+b2uOqIWIgZ32NQuxJWtE3IZxtnT2kaJ4BgfjkVbLoeMkRgXPoQ4Jm5QVEbm5QKLoQgczpe8Nzm
	YMaRzbOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDljI-0000000GBpt-0cCi;
	Tue, 28 Oct 2025 15:35:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDljF-0000000GBnx-0qSi;
	Tue, 28 Oct 2025 15:35:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61D3A40669;
	Tue, 28 Oct 2025 15:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF3FC4CEE7;
	Tue, 28 Oct 2025 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761665720;
	bh=idLuRWoO+38vK6VRnFxiDUoDHFUs+D0A09Hb5MHGJrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JGxEJAQMRAoubDH7yBud7nIGS2ACn25Z+fPf0wgYi87/LQq+3Mft4971TG3JdvGJZ
	 S02RRI+YPvB0Y978BvnLdGQ/h8yqR6Ss3Qee6PjNLc9vuiKZ5e5vaP34ouiEpIayua
	 BZwZ91iaLAZVj1u4xWnKFEFFiKarFCIbdweVC/DQ6AdApS2sg9vsXO+POiPfaCss0g
	 GOwKF7vKNKpu6spb36aJ0TJQRDlsAQgelhAEL34MeC0z4bAnV8XdjG2W3qpy33D917
	 seipQ2KgA8N1N+XV9/MitQ2UPPsRx/SNhwIdz8aY5in3awlN2+2K225/MT8Gn/8o64
	 mryuNFfc5QVQw==
Date: Tue, 28 Oct 2025 15:35:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Algea Cao <algea.cao@rock-chips.com>,
	Derek Foreman <derek.foreman@collabora.com>,
	Daniel Stone <daniels@collabora.com>, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576
 SoCs
Message-ID: <21eb9cb1-18b2-4cad-9422-c8e995183d53@sirena.org.uk>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
 <6f3f126d-72c1-48cb-a9c8-8d354af2a3d5@sirena.org.uk>
 <410fa913-e86b-4ffd-9d79-ce804f0271ff@collabora.com>
 <63003a7e-8d3d-433a-8a44-54fe8740bc3a@collabora.com>
 <5678895e-2647-42db-b3f0-86a21b9bc225@sirena.org.uk>
 <13c3810b-8197-4a42-9089-d20a78b8126f@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lf6kj6LVwO02h80q"
Content-Disposition: inline
In-Reply-To: <13c3810b-8197-4a42-9089-d20a78b8126f@collabora.com>
X-Cookie: Your canceled check is your receipt.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_083521_278277_B623ADD8 
X-CRM114-Status: GOOD (  14.66  )
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


--Lf6kj6LVwO02h80q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 28, 2025 at 05:24:42PM +0200, Cristian Ciocaltea wrote:
> On 10/28/25 5:08 PM, Mark Brown wrote:
> > On Tue, Oct 28, 2025 at 04:57:03PM +0200, Cristian Ciocaltea wrote:

> >> This seems to have been already addressed:

> >> https://lore.kernel.org/all/20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com/

> > Ah, good.  Hopefully that lands soon, do you have any idea what's
> > holding it up?

> I guess it's just the complexity, since that is part of a larger work concerning DRM bridges:

> https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/

Oh dear, I'll perhaps follow up there - sometimes this breaks boot
entirely depending on which way we hit the issue so at least getting the
revert in would be good.

--Lf6kj6LVwO02h80q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkA4q4ACgkQJNaLcl1U
h9Cw9Qf/biFN62QMrYgXYDbDsegoqDqqsXcMbeehM/Q3ysme4lJKK5trLO/dF7Tx
AQavE6VnzV0RUdLDEI58E+gA4bQGo+Ox5jnuocJ6P9xN9Bkb1lalO2qQ4WFNWAom
Tn7WNQxynhmHv55tadxwM7oz/24FsvaI5u5y9CY4TlI7KSPhlps7npoBBusvGZkW
RHf2O6oHFI9ARVozT57pYoSmiaaa/F7Kf6JBO9okHu6fouEEWBRDnaaXkDt+ooSF
g7/E8yU8MyapkQCuWdOTsV8DXr0qucasdaAfODubHxv3Y9nRjYt0tL0pyvXKUvCc
irvr/g+8r0jxqUIgrCg2LbfnyEWDWg==
=4VOq
-----END PGP SIGNATURE-----

--Lf6kj6LVwO02h80q--

