Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57857C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/QNXzsOaE2suX66IMMLbQ/FeLVy8GcdhacP7ftayeM=; b=4XSR5f3dPU1Z2FPho8w2oDYgPV
	Ilt6FTv29F1RBzA+xnyCw22HXoqQwYnGM4Ukiphf3eccLzARoOPo50YhkY4qRVwVTvBWQXxA7egB7
	er169HMZKgyJSmmmRLE+tds25fCVCeUfHzjOkEHZKikJR3dg2MxS6HOk+092OMwxyU3Pljg3IJaCN
	yxgnB0u4nujyn25tYo4WfuS5U0e4mqFDzhJjpkMn2tUx+URF6uhxdM6ASfKPguo4uyq2cS09Z/NND
	6n1wIM+igl4/4DDOeSdRFDzYo3ycsqL5owfiTIjyMDeoFiFrw8YmPpacdEoh/z2gbNxK0Pujh+GoT
	PZVFa19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVav-00000000lGD-0ZTc;
	Thu, 13 Aug 2026 13:35:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVau-00000000lFU-11sx;
	Thu, 13 Aug 2026 13:35:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A2AB1405C9;
	Thu, 13 Aug 2026 13:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F7D1F00A3D;
	Thu, 13 Aug 2026 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786628139;
	bh=u/QNXzsOaE2suX66IMMLbQ/FeLVy8GcdhacP7ftayeM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=P3q5vIKYkO+QFEOTZ/q9tTT8RIztZL1ripaVIZXGvUNRXzITdErUVVhW0wwHEf2Iv
	 qIqrF6DwiTxpwNPlf0CpaYgzEWUYAaAM/XX9vkEdmiZ0817ZjGhE/ROuMDi4zsikQt
	 1YMRJW96FTuG4pVqSq//uXBgsqpzaguvqEf+MWXHn2gG5K2nerfXuBwV6afKQ7vXM4
	 vSBf9YCjCDMhMCV3HmpbKOeWjCaMnP5W7cUKiw233n4ufLrZg6gAWegEWq03oZcxgh
	 1OuTn+yOMKDmzb2EElmcTABf0p+NrFplMfEaFekJC6Dfi3YIUWydkqJZG29VMfHJYm
	 iVFjgW8B7/4qw==
Message-ID: <59d73aba5b4fcaa2b645a433821ea7aa@kernel.org>
Date: Thu, 13 Aug 2026 13:35:37 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 20/69] drm/display: hdmi-state-helper: Add source
 TMDS rate validation
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-20-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-20-294364b2cf15@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Algea
 Cao" <algea.cao@rock-chips.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Diederik de Haas" <diederik@cknow-tech.com>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maud Spierings" <maud_spierings@hotmail.com>, "Maxime
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

On Fri, 31 Jul 2026 19:19:27 +0300, Cristian Ciocaltea wrote:
> Validate the computed TMDS character rate against
> connector->hdmi.max_tmds_char_rate, when provided by the driver/source.
> 
> This gives HDMI connectors common support for rejecting modes whose TMDS
> character rate exceeds the source supported limit, while still allowing
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

