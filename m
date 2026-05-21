Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20826CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqI6vh+WLkfGwtZ7w9kdY7+93wc7lSm+3beIEWvGDJc=; b=4eCuAIqpRqegH1Q/mrCSyFtPHy
	q6uyhBzOXPJNPwzXIl44iMuALyfq0B7v8G+X765ftwlicSjFGVMYc7AgH8QnApqthpN8nfoSeBB+H
	i7Bjk+ZZ150BhLqBiJ94Q2JkBiLKsnrU0hP3mcgtjLVryO20c1pqZAc2Zs0dI3f14Y6IJzRRPf3od
	E9EByOJfJ+PFOxDkjnew9s4MNnCwKzM/nnPZSkCZv57Ub3NAonzTmmUqGlr3LtFI+UgVgv93R8as4
	dGbdxypb4Pl0Qe7YxL77zDjorYS0xqCxoNNLYfLphJYRo7mqcbBUGzXrPmkqqPaxFGMFuZGLCm4BZ
	rRlWLzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzU3-00000007GwF-3VzJ;
	Thu, 21 May 2026 09:14:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzU0-00000007Gum-2qKd;
	Thu, 21 May 2026 09:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=RqI6vh+WLkfGwtZ7w9kdY7+93wc7lSm+3beIEWvGDJc=; b=guwmnCLeCXw4BCcRlPU7lYatnl
	sZ/Nc87kEeU7S7IZqvbdwDPiYFJTjE74sti2902t8TOYJhE09mcvx2aicZepZ1U8bjhVHSh3TcZGg
	Y7fM3/5F6hseiuztXmxfbroXQQbM1+lUN1ZkEZS7mipNp/JuFNt40leR8kI9tt5bwyAOk9MjT1Mah
	fcDdyPRGk+GtfFRUn3R1K/3+Wo1fjTkrfsctUZfeNV3O7MJXg2KcaQGMHEV3YddrXsXQor8s3Jw51
	vuV05V9yKOQnUMa5ll/QPX6+CwfbL3npFjv8zCCwiRIWvLvkYYcGxAfEpI9ZahULoTQdlVMPeomaE
	rAUX5teQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Chen-Yu Tsai <wens@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v7 00/23] drm: bridge: dw_hdmi: Misc enable/disable,
 CEC and EDID cleanup
Date: Thu, 21 May 2026 11:14:07 +0200
Message-ID: <4998578.ktpJ11cQ8Q@phil>
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_021424_715731_9D8C19F0 
X-CRM114-Status: GOOD (  12.94  )
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

Am Montag, 18. Mai 2026, 20:01:36 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Jonas Karlman:
> This is a revival of an old dw-hdmi series and is the first series part
> of a new effort to upstream old LibreELEC HDMI 2.0 patches for Rockchip
> RK33xx devices.
>=20
> This series ensure poweron/poweroff and CEC phys addr invalidation is
> happening during normal DRM funcs, ensures EDID and CEC phys addr is
> updated in detect() similar to how the bridge connector works with a
> HDMI bridge attached, and also changes to debounce hotplug processing
> to prevent a full disable/enable cycle during a HPD low voltage pulse.
>=20
> After this series HPD, EDID and CEC handling should work very similar
> regardless is the dw-hdmi connector or the bridge connector is used.
> It should also help ensure a smoother transition when dw-hdmi is fully
> converted into a HDMI bridge in a future series.
>=20
> These changes have mainly been tested on Rockchip RK3328, RK3399 and
> RK3568 devices using both the dw-hdmi connector and also using a basic
> convert to use a bridge connector. The changes has also been tested on
> Amlogic S905X, S905Y2 and A311D devices that uses the bridge connector.

I now also gave this a spin on a rk3328 board and hdmi still workx :-)

Tested-by: Heiko Stuebner <heiko@sntech.de> #rk3328




