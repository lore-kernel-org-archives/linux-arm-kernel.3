Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7965CD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFC1w7p/0qB073AfNGNffsBQG0WW8QDMDzU+cxdEF3I=; b=v0V9M2EB8/t8pjuR5Mp+WCiBBU
	UjD25CQ9Rftpc3/p8V959mz9P+CNS8+wLISodMKOP1MMTvUhSTUU0Exe9fueoyuOsMX9OqSuBIlof
	Xcb/fM+wsVSm4R36fUE55WG5A/2S5dZTwqtNU5VO0WZsnwXZhLDdGr1JKFgm8jy6srziQT7LIIN/c
	rBlG9bGNcR4qiYAhTbkyDhhpVn9p2H4G6anxZeaq+7wqIVJL8iEg3AwUjg/hbJgpqP9bkPOwPXJEA
	dQBRqw1f3yi/fTb1SPwyvCtZWpzJMQAQlTQdtdyhRBU5FqzUgSPoiYjORlzg/H6K6c88ch1sf4f/Q
	ob0EwEcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSV0-0000000DWp0-3eDe;
	Tue, 02 Jun 2026 17:01:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSUz-0000000DWnu-1CJL;
	Tue, 02 Jun 2026 17:01:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B6D2660098;
	Tue,  2 Jun 2026 17:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3568C1F00893;
	Tue,  2 Jun 2026 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780419712;
	bh=DFC1w7p/0qB073AfNGNffsBQG0WW8QDMDzU+cxdEF3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bky1Jb/NZnBNnpwQWDthgWcFz+0+/2sBzSQPyI4DBzbC+DqHPsQmwq0TIDeA3S8YQ
	 4GztI70qPsv4c3cr5aC9lAbt9fvpuEXpELLyzEc17RtM1X4AQ0n58ujkkJRUENg1D5
	 9wu/KclcM6CCvBteSIE0h4HHUOHL1NChBZsVLDtJAAEphTkxQcHBiivFS9f+9tFvrA
	 ZIQjPG/h0IYzH10Q7LnC4m1+j3RhmjVqGPcAAW0deWQCP/Iw6YnShJVWe9nxvH0c3G
	 3UeILGuiQ3G2yL7WwjrlStDjgys4kA/sU0Lrn3ALZ2c9yROXndGMFuL0RZ3LcyzYla
	 dVsXrxwU/V46A==
Date: Tue, 2 Jun 2026 18:01:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com, cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com, dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com, dianders@chromium.org,
	m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 01/11] dt-bindings: display: rockchip: analogix-dp:
 Fix hclk as third clock for RK3588
Message-ID: <20260602-cranial-aerobics-9db5af2159ec@spud>
References: <20260601065100.1103873-1-damon.ding@rock-chips.com>
 <20260601065100.1103873-2-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tXJ/OuPN5ucFNEVK"
Content-Disposition: inline
In-Reply-To: <20260601065100.1103873-2-damon.ding@rock-chips.com>
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


--tXJ/OuPN5ucFNEVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--tXJ/OuPN5ucFNEVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8MeQAKCRB4tDGHoIJi
0qXGAQD9vbj7tixbtiXhoJz2EzXrSh78kjxJNRDo8PGjKDfIbgEA2afp9CeVcHz9
lbuu8IN7ZAF7QMTIEkFKWyqOc2Z6rgQ=
=7N8P
-----END PGP SIGNATURE-----

--tXJ/OuPN5ucFNEVK--

