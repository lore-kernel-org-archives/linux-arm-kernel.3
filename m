Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C1DFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 11:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XRJaWFbqSFsmBGRLBmlvpPymX1vBXalsYhJharnm3k=; b=N1pjGWMcz2izk/UdfSw8hhMXGS
	WTtZfYozB43SxEzNwofor4C/tXfm5+FdWoST3j4fFUYW70JUoDkeg22B3kkbq96dcEO3EMw1PWhAO
	2SXwN5BfWEE+dH7zV3I221Z4numlRWEqn0fa7NRnE2qWg4D0au+3M2K2tb1GheWCb+fBnOgJ4eFt2
	iM6nYlbxIgcFPO/EvaxS0xtan5ToP5N098Ljlk4zCosVDeAK3Tn7Z+X6LXt48fqQO9t+vQz0FvT9F
	aifM6A1Pu04U/RKbjQIzyZFD+o7mUv3QvXLCMFwuq4WcbU5b7I8Ff7RLmaL74csWY5ml7ytS+fyTy
	T3LiSeMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJhx-0000000GkBc-13L4;
	Mon, 27 Apr 2026 11:00:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJhu-0000000GkB8-3wGE;
	Mon, 27 Apr 2026 11:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4XRJaWFbqSFsmBGRLBmlvpPymX1vBXalsYhJharnm3k=; b=V4zLCz3ZLjDozLT4o/LAggRxW+
	/7tTwM/7AIduZZExmA/N0ISPGIhudlvQr8OIZLfqqpl3dZzFBMZO1+CHO4S8/p8hIQThRYm7H+6Kw
	qUkz/RARTegoCwhvGlEh1G2dMvmMhgeaxaOhhWF1lOqflCgkHilvK6JFcoBJJcc6z7QZTy5pHVYxG
	W9MKn34IY0Srn89vDSGxcQR1sfCsVcWFb3In1Ti8EhUxZReRvvRM0/7nKkCmR621tabBfYgWvbiql
	WQsl/2EmAYv0jtLQJdv8PT+fJNaOnJl8mfbz3nHEmX1FbNG529k3mzs/2eOoeE1awhg2afR8w/mLW
	oKv+HpAA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH v5 02/10] drm/bridge: Add detect_ctx hook and
 drm_bridge_detect_ctx() helper
Date: Mon, 27 Apr 2026 13:00:35 +0200
Message-ID: <11399494.CDJkKcVGEf@phil>
In-Reply-To: <20260426-dw-hdmi-qp-scramb-v5-2-d778e70c317b@collabora.com>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <20260426-dw-hdmi-qp-scramb-v5-2-d778e70c317b@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_040054_979574_77645D77 
X-CRM114-Status: UNSURE (   7.12  )
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

Am Sonntag, 26. April 2026, 02:20:14 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Cristian Ciocaltea:
> Add an atomic-aware .detect_ctx() callback to drm_bridge_funcs and a
> drm_bridge_detect_ctx() helper that accepts an optional
> drm_modeset_acquire_ctx.
>=20
> This enables bridge drivers to perform operations requiring modeset
> locking during connector detection, such as SCDC management for HDMI
> 2.0.  When both ->detect_ctx and ->detect are defined, the former takes
> precedence.  When ctx is NULL, locking is managed internally with EDEADLK
> retry.
>=20
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

while this looks sane to me, my drm insights are spotty, so I can
only provide the lighter

Acked-by: Heiko Stuebner <heiko@sntech.de>



