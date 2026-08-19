Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2EFC5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 12:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YI5+4EM3RFcICzPCDN2acTJfMmmPcKyBf7I7kSJZ/L0=; b=lVaAngQURB3k8pwTbKieNz36nu
	XoQ1E6FKEXuZZOhw1f5rIbVA/87jWIbsR2ORCWaOrN/XZv9VVnNh2LFzfVQ2KQ62hLsxsXBqcLMSH
	iJB1+JAiF0mrZtyXjvvhcaAENy1eOcnYQHMN5ersX24EDWnewr+8yZNTkBX6mvJ/nwHRClUrclZR2
	qQIc5vSkzv+36D7t4pWK2XPliQHNQTbXV7cboUf/vC6nlUJ0YK9Ew5+WI/Pjfrv+ux3E+NthJW2v6
	OWKLSzTvqHQVJ72FJrltp75aTjUSuthWwEcZ5WhIp4pIFEdM73U/p4J9ukTemDI1QdkbJTwOSW1Ma
	F9x2rocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfZ4-00000009l3y-16CM;
	Wed, 19 Aug 2026 12:38:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfZ2-00000009l3n-3oGg;
	Wed, 19 Aug 2026 12:38:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 34EE340F48;
	Wed, 19 Aug 2026 12:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932A01F000E9;
	Wed, 19 Aug 2026 12:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787143120;
	bh=YI5+4EM3RFcICzPCDN2acTJfMmmPcKyBf7I7kSJZ/L0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=fBcmiwCKTMtFxhOHtc9GRiO5wFb8YzJryug+nBPRhbxX0Blx+hzT3vEXbe8wkOdGS
	 yKFYI1ClaHRq+BevdMmiYujzSFX++/qptj30jlVXvilZY6mMGBztqXnP5lFfLnPztx
	 kG5bW5VkiSG8/LIqhupcHBprl1u3wA1coFPoS4d18Kp75h7L4qoczsF6+CHCNeFfN+
	 o/uqNvqwSm79VLyfb263d4TAqVXHxGba+W373PsrLL4cWRPKqV/oZHpX7JmTFxIngF
	 5hvlMAWi4DDiC3WBe2CGHcZF8SbCBJR893oNv06JWQ5G3Pq0saGilyIHFCr0FZF3WL
	 Ycp5KN3+KK/aQ==
Message-ID: <256502b250b2bb7ad413489a9bef0ac4@kernel.org>
Date: Wed, 19 Aug 2026 12:38:38 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 19/69] drm/display: bridge_connector: Wire up HDMI
 2.0 scrambler callbacks
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-19-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-19-294364b2cf15@collabora.com>
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

On Fri, 31 Jul 2026 19:19:26 +0300, Cristian Ciocaltea wrote:
> Connect the bridge connector's .scrambler_{enable|disable} callbacks to
> the underlying bridge's .hdmi_scrambler_{enable|disable} funcs when
> HDMI 2.0 conformance is advertised.
> 
> This completes the bridge connector plumbing so that the SCDC
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

