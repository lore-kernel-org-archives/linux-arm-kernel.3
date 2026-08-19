Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AB0C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 09:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsPdTqWQt9EZk/eeiAqslxNuDLvoJkFFPkauf4L5tk0=; b=Ug+fEKwpo6F4R6evSLx79B1WAN
	0ExjV+6QJ8DNRVaJZeJ0T+1ge1OEbSmH5sZRLAsDanKIwDTw0Kp06Cs2rzBp5CoB8NIDJPHKRYGRd
	V9sY0GDw2gT9HPZkCFLhxhl/s/khy2tC0tcIzfZbWpHofShaZokVMT0y+LGG/+wJFvTo39bvsqvh0
	RFJgEwDl9TXf54lb6yyigtTTUNAr4g1KFEkBH19epcJ/C+V5bJ3IkHsQoW/B8/gbkWg9wIFTwdo3x
	7433ilqBfOmpAEQ+rNIOnTkL1wajaL/Vpo2IdiLoTZIveKUQi55mV/0VrcQyNEH9QJCFxrLPWd7lg
	2kng64Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcze-00000009STp-3epw;
	Wed, 19 Aug 2026 09:53:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwczd-00000009STd-3e1Z;
	Wed, 19 Aug 2026 09:53:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F1DD4036F;
	Wed, 19 Aug 2026 09:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1DB1F00A3A;
	Wed, 19 Aug 2026 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787133237;
	bh=bsPdTqWQt9EZk/eeiAqslxNuDLvoJkFFPkauf4L5tk0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=c2hhq5OkjEM2LNDasG7lPfDRbVfEJif6bxj67WGTbBdHTiadFvQQXoA2fQ0neQT6T
	 4i5qwwO0M9gG5noky+pLzjJ93ar/MwHRTZ0J2iGINErNFH1lQr0HSSY+MMCU4b5+W5
	 X12t7N33ycJ8qV3O5EhF9sN5cOPySXovsWtlKicQBWqFuFCaEsqRoxhjGzdcnvY6gq
	 CGsVIjkg/lmiPfMXBLXuJfYj9oKu/2dLY2SS0uUuCVXOVzUETXpzCusGzY25FuSk2+
	 3r17g6OhrO1AYrp0AqLmj0qDB1TiEtpINzpHbzc/ZNy0GMIKj7fi3mnIw4iE4NsQ7Q
	 TFhoDui7dzr+Q==
Message-ID: <f969e994fa74d4e376c6c8f4a705c7ef@kernel.org>
Date: Wed, 19 Aug 2026 09:53:54 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 06/69] drm/probe-helper: Introduce .force_ctx()
 connector callback
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-6-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-6-294364b2cf15@collabora.com>
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
 Holland" <samuel@sholland.org>, "Sandy Huang" <hjc@rock-chips.com>, "Simona
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

On Fri, 31 Jul 2026 19:19:13 +0300, Cristian Ciocaltea wrote:
> The .force() connector callback is invoked by
> drm_helper_probe_single_connector_modes() while the modeset acquire
> context it created is live, but the hook signature provides no way to
> pass it down, e.g. to support implementations needing to lock further
> objects.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

