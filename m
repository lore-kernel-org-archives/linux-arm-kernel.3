Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555E0C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cPfZ/bD6Z97U49M2447wQA3NGD5B4htgMrzWxyPoww=; b=lvYHoU55SpetVimJcHEGhxcrnp
	ZqO1sCzV73HSMASafwE0eByV3/Wp5ow5M4sotcQZwP6CU4g+5iyyPR6UvDY6NF/ucoWESo93zP/T1
	zY0lID/nBbxh1TMv5vZEKJWDXuzbine0xIbV2T1qCbHLGEBIJRcTF68PRb5B78j1SI5ywASRFO1dJ
	qwdWo0wPO4uS83ImO5YRsP532iagN2kt4HI6GCbYmzZlnkNLK0lS8XIDM3u4jgBypoGaRW+qHogp4
	5fb7Cvs8uZZlOkDI0PgHYxvlRTR0lDP2L+u7LHzAHiLcJwh+YN5Q/Aod8kDkFI4zl5TX8rja+Gyqb
	HFK++vZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVk7-00000000mD6-2pGi;
	Thu, 13 Aug 2026 13:45:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVk4-00000000mBR-1kle;
	Thu, 13 Aug 2026 13:45:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 00E8E43901;
	Thu, 13 Aug 2026 13:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A92E1F000E9;
	Thu, 13 Aug 2026 13:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786628707;
	bh=1cPfZ/bD6Z97U49M2447wQA3NGD5B4htgMrzWxyPoww=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=K3Df+RbxgUm4SC4zm2ucVvCWGJb4vf72uz1aaayTkRQLpcuRSaIxkrfB1HWAWHg9O
	 KXPhhHayTkqgGtzOC+gz6MRLRF28zAbJpu5N+voo0Gc2inVoIxiE73icOIDPVNDWSH
	 BigmAUhsF6ptF2TXs5v06LgwMI2rntR79vwvugIgCkUilf6eDVr5ulWnaP+lSjQOC7
	 SO7lIlNqXmsy2O4mempnYH9iSC/NZtjrMRvD0s0APhlTd6Akl9OKSup8DvxVxTJlEr
	 dbyccZe+HL4GEekw+YL7JFSybSDyS2NgZ+VDibBSzz/s8alxSz4/lZ7gZ482/hAqtH
	 7Se2Mw53nZG3A==
Message-ID: <b4902134934e37aaa9b8c0c332324e2e@kernel.org>
Date: Thu, 13 Aug 2026 13:45:05 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 02/69] drm/connector: hdmi: Handle reset() state
 allocation failure
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-2-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-2-294364b2cf15@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Algea
 Cao" <algea.cao@rock-chips.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Phong LE" <ple@baylibre.com>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert Foss" <rfoss@kernel.org>, "Samuel
 Holland" <samuel@sholland.org>, "Sandy Huang" <hjc@rock-chips.com>, Sashiko <sashiko-bot@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Fri, 31 Jul 2026 19:19:09 +0300, Cristian Ciocaltea wrote:
> In drmm_connector_hdmi_init(), if the reset callback fails to allocate
> memory, e.g. inside drm_atomic_helper_connector_reset(),
> connector->state will remain NULL.  This is unconditionally passed to
> drm_connector_attach_max_bpc_property(), leading to a NULL pointer
> dereference.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

