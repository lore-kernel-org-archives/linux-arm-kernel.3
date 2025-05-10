Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2397EC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 08:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZP0INqkNVJuqSHAtR4h42xNc68rjVjaWzE+UVHVyVQ=; b=BhER9wpdqKtkWSbI7n9PwksUO5
	Q/6oU49NMtxl7n4JZ7n7LducgTln2CaubnZZrCU2pLyE/rpUyM8Pt04M02LBZUcoXA9XrNEIr7316
	CnqhgXPWJqQ/g+A8/cvk84+7DUzxUqN4xqwFV3TcbDP6nVrlswRkO3B2exXBAnztf/0y4GGKQ0m0I
	aaf1t+/aHI8dKaD9d3DdgrMDilUHbFTZb8qGz9EJvSo23wWaQkkXSJEXg4wN7xeinjA85gu9flh4F
	WkvMx1SA1CbhThJysmJd9lBcb5/mLo3KOAEHwMLLmYy7eUmacZ7+Oymc82Mblrc99Cl4b9zneGCtD
	+HpXesSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDfqb-00000005fz3-0QHH;
	Sat, 10 May 2025 08:46:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDfoP-00000005fDW-1aEs;
	Sat, 10 May 2025 08:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63302450B0;
	Sat, 10 May 2025 08:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83328C4CEE2;
	Sat, 10 May 2025 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746866640;
	bh=iZP0INqkNVJuqSHAtR4h42xNc68rjVjaWzE+UVHVyVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cf25X2DlYFqigNEHaUMVIeSZvZx5mMBMfSzlXZh6IR3yRDGG2JP2se3Xi0GUaRRXC
	 RHAswulPL2o/Pu8CqhMFklkb261bJF7PuKzyTJBFfoQdYMudvn0NQ9MppKC/GoKCMT
	 UxAlc4FeAi19ZF/qEhl2UFsXIhG5PhmX9ubf5wzszMnkQOKxcWJCVDZnJg851wO8U0
	 kTWLIRMy5T1VyNl3f9SWXtOcnJjxbEyqha7GSa79N+AqWLSkNuhVXOE0FS2oMO1JRZ
	 VThrHCnZwR6Rq0g0ELeJB3Pa5IH9mLfbpSLf18puH5eXsNJlQWdWUJPMr/VfA4P9d1
	 m0M5pmefqYnvQ==
Date: Sat, 10 May 2025 10:43:56 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Douglas Anderson <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, "Rob Herring (Arm)" <robh@kernel.org>, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Jani Nikula <jani.nikula@intel.com>, 
	Pin-yen Lin <treapking@chromium.org>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
	Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v3 03/22] drm/bridge: anx7625: convert to
 devm_drm_bridge_alloc() API
Message-ID: <3cccwtayrisa4x6gn4wvmd3unabionun7va3qlh7cmfxf4ukqd@vgwai2ralai7>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-3-b8bc1f16d7aa@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="42gmp23z7tcowblp"
Content-Disposition: inline
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-3-b8bc1f16d7aa@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_014401_457687_A51E9BD1 
X-CRM114-Status: UNSURE (   9.54  )
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


--42gmp23z7tcowblp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 03/22] drm/bridge: anx7625: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0

On Fri, May 09, 2025 at 03:53:29PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

--42gmp23z7tcowblp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaB8RzAAKCRAnX84Zoj2+
dln/AX40pKuqkRhkQVs6JCH/aLBJ1p4FH2jOlqJApLLs496lo7sUBly+1PuPiI35
tNCYL7gBgKXxlSu1iZTnQQ03NSmiS7pU7xW+Lr1Yp4YkNPcG6zX8UJqs8WwQCQyQ
xhT5uOOImg==
=3aXy
-----END PGP SIGNATURE-----

--42gmp23z7tcowblp--

