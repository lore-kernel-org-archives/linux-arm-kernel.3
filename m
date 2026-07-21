Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413FBC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 12:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lArIhcHzAKqXSmaKgvnqbdST5dwwZncsJFNsUoeIWDY=; b=AE3wh8I1icBCnVnlFvLYcwMdPL
	xtUMrDRAHLP1PKQ734G4uDJYMeWPxHnTA+GJakNhk+zYi7L5zYtVe2gaqz6/O6ulNbjKXqrc3zQEn
	jMA5OdzwpZV9IZu4eE2BwWXmUn1dvMkBJ2iajyeTkWwxB1AQqATvfeDyyYABWd4sJhrS/yHGoZ24i
	x3r/9juoWiFy5sh1dPu45yzVflx+1SxTgNIUHnNuC6BJtDo3UNkfntNmRcKtHrYFfjHGGJjNKkSbL
	7onJ+Sr/9maGQJqtqbHeoZjC1Szve2n0sMzvJhkU1YlcYm+HIoOlqT5Lun+JX+f2T0npWhDnFqhOi
	BdxjbTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9ng-00000009RkW-0E3C;
	Tue, 21 Jul 2026 12:42:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9ne-00000009Rjs-3hl8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 12:42:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66EB540407;
	Tue, 21 Jul 2026 12:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36621F000E9;
	Tue, 21 Jul 2026 12:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784637738;
	bh=lArIhcHzAKqXSmaKgvnqbdST5dwwZncsJFNsUoeIWDY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=VqXsEZpH7AfMNnxdHZSnsbuT+XCpnEX1d/fTyW4vUHHDCgnaMmCpQB5cGvYbpMorB
	 0I7DXt+zR4DwyYpgO3ak6F5Lybbbng/Etks+dEkK3cbZE42Ii4RdtgcvsETsAfX+hf
	 DFqlm7pUWbKUQ7CHVqyadjU2NZobAXmN/3xFvZUYtjgmSXPNe2slpr5S0JoAiBO49+
	 uHVOHb6mg0QAiu8iKVktzOebhHnC20PBq48YN3Jtfc9ESUiFwhqUQwEfOkaXuaJ1Cm
	 rkQFn3m6ZpqVHH5EKXLS30Beai4wqSUI0Rz3AIA9OJ4iVOmd63mdfWo05JqVBx79Iy
	 ZwaWQO2aZ2sIw==
Message-ID: <9afcb7c026bdd910082b95eeddc939ee@kernel.org>
Date: Tue, 21 Jul 2026 12:42:16 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 3/5] drm/scdc-helper: Implement parsing and printing
 HDMI 2.1 fields
In-Reply-To: <20260721-scdc-link-health-v7-3-92df1b6ad5fc@collabora.com>
References: <20260721-scdc-link-health-v7-3-92df1b6ad5fc@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniel@fooishbar.org>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Hans Verkuil" <hverkuil+cisco@kernel.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Simona
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

On Tue, 21 Jul 2026 10:58:59 +0200, Nicolas Frattaroli wrote:
> HDMI 2.1 redefines previously reserved fields in SCDC for various new
> uses. No version check needs to be performed, as an HDMI 2.0 sink's
> reserved SCDC fields are well-defined to be 0, and any zero-ness of
> these fields for an HDMI 2.0 sink is not a surprise for SCDC parsers for
> HDMI 2.1.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

