Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E696C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 12:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWzC+cpScHArEofhHNJdNazquTsIhUyNEhIyJg+5Scg=; b=jQAZbQZaeLvUjhPQxPekky2JVN
	WRylA+jalFY7px7UBH2THPwG/uMYQi+pWLzcmIb6h49M9eUyNBVhhYka6FWZsqjge9/l0h1tU3MGs
	g4cbLefsfgZWEOctOcuUt1HA6Ukpq8JLzdt3xiHWx2HOTYAqMW9LmGBEl9WHLwA3Lf3xWYP6IVVXl
	BHf25HTmjkk9+zh9gHIG9F6i6dAmryiN/512COj8W/HFPAMFitU2EZaZ3Xlms6n/6H3cTWf21V6kF
	0acSOsSohsTOwwM6vxE1e3gnxlztKSGgDoN6YV8yZIEE6jEbT1bKRvQWM1zHm95C54v/X/NPC7+gA
	NdC0WsCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vFq-000000093uB-2jQR;
	Tue, 08 Sep 2026 12:48:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vFp-000000093ts-1DOj;
	Tue, 08 Sep 2026 12:48:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB98D4036B;
	Tue,  8 Sep 2026 12:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33421F00A3A;
	Tue,  8 Sep 2026 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788871728;
	bh=IWzC+cpScHArEofhHNJdNazquTsIhUyNEhIyJg+5Scg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=GGVT7l2S4dESIgGS20pfkuiT/kBX5QGIuTktZdB39zP73d8Yu9LrsKJWJam7JYlk/
	 wqE7xxZs8nprYX0lgaWzT5BiQz0xSZONqZms45Pl8vfxUOALaer+pOXuPnO/FolRGK
	 wYHlDGo3ER9gSlUomxfRNcRhT98rS7Yf1ZKhaGAfMxi5JPTUMjj0OkDIcS21/t0YYS
	 dTkBVl5wr2BkzbLaSAvbES7tpVbATHIciB/NGmbG/6pE7YJj+sLNCY3frTCNbdim89
	 aKaWPeUg7YyGcxX7EktwlvKhfj+M/l9ZBO9L0yUE1cKiT1l4FIOawGB0t1Mle0kI3z
	 4Xd38HFf0Fvsw==
Message-ID: <35fa469d86b8dfba50d755c525dac0e9@kernel.org>
Date: Tue, 08 Sep 2026 12:48:45 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v11 23/74] drm/display: hdmi-state-helper: Sync SCDC
 state on hotplug
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-23-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-23-bc12954a0688@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Algea
 Cao" <algea.cao@rock-chips.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Diederik de Haas" <diederik@cknow-tech.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Helge
 Deller" <deller@gmx.de>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maud Spierings" <maud_spierings@hotmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Phong LE" <ple@baylibre.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
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

On Tue, 1 Sep 2026 21:50:47 +0300, Cristian Ciocaltea wrote:
> drm_atomic_helper_connector_hdmi_hotplug() does not currently
> synchronize SCDC status on hotplug events, leaving the scrambler state
> potentially inconsistent after (re)connect.
> 
> Hook drm_connector_hdmi_sync_scdc() into both the connect and disconnect
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

