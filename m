Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E5710AB807
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 19:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8q1b7BVCr0bxZwKjgU8Z7Ivc8vxFh7zx0HI/IRg014=; b=xdwnJH+HnIFijtYaZwi654MjUr
	qZUh0OQaLXvcazOihFg/aV/5C74fyWHIn+3w6LC4k5e0f/nuyFqRAus6FPREPF9yGI83hXICQsqCJ
	JSvchsI9BBTnO9u/xD871xzAWHDhC9R8BjqkA8elN3C8g1NowTb1lTibOsaJAvqQLAaEURW6MdfcZ
	3T5psifG2/h84eH+6mjwq40sb9SIy/uHyfB/0k/OnmLBz6N8MjcsFQ4UiZEsR/5aGj9GK17XwhWE7
	UderivnESNob5zmiAN5unhTjGweVIJBFnJ5dxq8M1++lx4Mh9GlijNTJaHxN/zGIwPAYCrsFV1BEm
	vHjQxeFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qNd-0000000674K-49bM;
	Thu, 26 Mar 2026 19:28:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qNb-0000000673c-2LY3;
	Thu, 26 Mar 2026 19:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=P8q1b7BVCr0bxZwKjgU8Z7Ivc8vxFh7zx0HI/IRg014=; b=NmXGA9ydxp031MJXvgcF0ptzp7
	XnxCZcHUteZX1hWuh3E/f7+WPpkpdHYHTGAs0t3XHOIesKna/h1MQCEtpDxqq5Aeu64B6rF4zPCHe
	3Jief1YqMvdmf1FSJR7SQZO4vnkflxKLX7b01HSqpmpZXuLZoaT94whOqHimtZQVK0MBKyr/I4ihV
	ed39NYWtlj7ywDMsyZPY58FuQ30fqgI+tCaujN3rw6lCsPbaKVpYzAFIbLxGbY6A8H0U/y9Z5fkpj
	zsHWtwTIhTh2pXZZKcSLlS1xp3b6/DVvcNUfYfxAzMuD7QTCOxCrTUDiaXoco6w/oEPu6I2EghD0D
	4cpvgQ4A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] drm/bridge: synopsys: dw-dp: Unregister AUX channel on
 bridge detach
Date: Thu, 26 Mar 2026 20:28:02 +0100
Message-ID: <2053748.usQuhbGJ8B@phil>
In-Reply-To: <20260310-drm-rk-fixes-v2-7-645ecfb43f49@collabora.com>
References: <20260310-drm-rk-fixes-v2-0-645ecfb43f49@collabora.com>
 <20260310-drm-rk-fixes-v2-7-645ecfb43f49@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_122831_617451_69C7E797 
X-CRM114-Status: GOOD (  13.00  )
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

Am Montag, 9. M=C3=A4rz 2026, 23:44:35 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Cristian Ciocaltea:
> The DisplayPort AUX channel gets initialized and registered during
> dw_dp_bind(), but it is never unregistered, which may lead to resource
> leaks and/or use-after-free:
>=20
> [  224.661371] BUG: KASAN: slab-use-after-free in device_is_dependent+0xe=
0/0x2b0
> [  224.662015] Read of size 8 at addr ffff00011aee8550 by task modprobe/6=
58
> ...
> [  224.662796]  device_is_dependent+0xe0/0x2b0
> [  224.662802]  device_is_dependent+0x108/0x2b0
> [  224.662808]  device_link_add+0x1f8/0x10b0
> [  224.662813]  devm_of_phy_get_by_index+0x120/0x200
> [  224.662819]  dw_dp_bind+0x34c/0xb10 [dw_dp]
> [  224.662830]  dw_dp_rockchip_bind+0x194/0x250 [rockchipdrm]
> [  224.662864]  component_bind_all+0x3a8/0x720
> [  224.662869]  rockchip_drm_bind+0x120/0x390 [rockchipdrm]
> [  224.662899]  try_to_bring_up_aggregate_device+0x76c/0x838
> [  224.662904]  component_master_add_with_match+0x1f4/0x230
> [  224.662909]  rockchip_drm_platform_probe+0x420/0x538 [rockchipdrm]
> [  224.662939]  platform_probe+0xe8/0x168
> [  224.662945]  really_probe+0x340/0x828
> [  224.662950]  __driver_probe_device+0x2e0/0x350
> [  224.662954]  driver_probe_device+0x80/0x140
> [  224.662959]  __driver_attach+0x398/0x460
> [  224.662964]  bus_for_each_dev+0xe0/0x198
> [  224.662968]  driver_attach+0x50/0x68
> [  224.662972]  bus_add_driver+0x2a0/0x4c0
> [  224.662977]  driver_register+0x294/0x360
> [  224.662982]  __platform_driver_register+0x7c/0x98
> [  224.662987]  rockchip_drm_init+0xc4/0xff8 [rockchipdrm]
> ...
>=20
> Unregister the AUX adapter on bridge detach.

that sounds sort of asymmetrical though. drm_bridge_funcs has attach and
detach callbacks and the component-framework also has bind and unbind
callbacks.

This might cause confusion later on I guess, especially as I don't know
if there could be a bridge attach, after the detach that unregisters the
aux adapter.

Looking at the AnalogixDP for example, it does the the register and
unregister in the bind/unbind callbacks of the core driver.

So I guess the in my eyes cleaner way would be to introduce a
dw_dp_unbind() function and put the aux unregister there?

At least that way, everything would be at the same "level".


Heiko



