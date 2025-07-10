Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FD7C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvFyBYxEpy9Sn7Einro160cdlw9VKDe5feG5m85a5bA=; b=l4PvdORllW0/apWIuuhaFE4T9o
	BLKlpTwgf3QeKl+zfGEux8nd3fzygoa3bWVYIPnR6OypPQQ48wj/uzCbM7UnBwbTgv/8jXFbtttCN
	dYClPZR1Y/heyPN6oIRGZ9wnmDVqYolMVoHuULz8la7bBgiDqxU3mzCyUFMwjfmEAOkteiYMzOq7O
	6J7ZsxzWvGONwYKkH24Ll4XP+8YVNWpHFRsiFec0V8vP7ehvfAsJzBiQzOnhYAdnTciVzxpYLFmmQ
	wiOhIIzIMY0L4CqDUJFIusovreXuSSnE0U6r5X4X3lt+oJ1z34NAfLNpeAALMasOYdpOmYlSITB77
	XVnt3EqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmO8-0000000B85v-0D9d;
	Thu, 10 Jul 2025 08:12:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlUT-0000000AyCK-0Qrq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:14:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 750C4A53BBA;
	Thu, 10 Jul 2025 07:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3DAC4CEE3;
	Thu, 10 Jul 2025 07:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752131684;
	bh=FvFyBYxEpy9Sn7Einro160cdlw9VKDe5feG5m85a5bA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=KhXAvlda8kGZUzTXYkhLg3om+Qo32HaFYb14lK9fV4FGNBGD7XebP+umP0MEXay13
	 lw5BeT46/tqhFmHXABvGhETF8s/yPBhXwqA3TleECzaorb2joMVovTZ42Rkf3Mso/q
	 hFrDdruiJnJ28JfKbla+Ypq4zDGsG7UTp6+ICk997Kbn0lP4vp1j+8Bk9yAdGoMLh5
	 HZLvuTNeU2gMoi4s1BdRRojbsK2wv3btMSk0QthDZ6wyoF4Sdflh7Y5Hf35p/SvcVc
	 rxlgxw0D+4DTo95e8qolkjude05rg1SvTWBPS1W5IhDc4JuuseQqp2ilnPJae14MiF
	 F0YUPxTzxf6pw==
Message-ID: <966d844a84836a47ddcc49da0c779633@kernel.org>
Date: Thu, 10 Jul 2025 07:14:41 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 7/9] drm/bridge: get the bridge returned by
 drm_bridge_get_next_bridge()
In-Reply-To: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-7-48920b9cf369@bootlin.com>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-7-48920b9cf369@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_001445_202428_3155E9B0 
X-CRM114-Status: UNSURE (   7.30  )
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

On Wed, 9 Jul 2025 18:48:06 +0200, Luca Ceresoli wrote:
> drm_bridge_get_next_bridge() returns a bridge pointer that the
> caller could hold for a long time. Increment the refcount of the returned
> bridge and document it must be put by the caller.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

