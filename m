Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F57CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 09:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tC3B6hWsBtkSvoNTvU5ELZanQvPAvCpKhKJcyglbi24=; b=yQunfnaeto35FhUbYrU0oeDQ2Q
	cqRWBxNCmLa+tadJ9cy4Ql90QHNeHEv/f2D915wWfGz2waBStzJ1MiNKji0Hk47jnTgGHvpiLEL2Z
	eBPB21X6Op3QhRDIj1f+SdaqwfbKWKk8ygS0C6FBkABRbIy6BSnePiZ9KYqLqJb+op7x8H14tYC7V
	chT0Yo/5tl7RDV+pO4rQ34C91y/SocNtaubUsMgp16glIUtcXtzL+k+/cApfkT7OJiY316k4lj+xi
	e5qefiIsQw2vSMy5HelY3NKIPGcJZa4/TqVyHvCdjzlCoXjdS9ieklXCvyWbDnWPO1m6Pb1nlUIXO
	Li1hbJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDgK3-00000005j98-0vYB;
	Sat, 10 May 2025 09:16:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDg1W-00000005hF1-2TMv;
	Sat, 10 May 2025 08:57:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BC2244984;
	Sat, 10 May 2025 08:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D51C4CEE2;
	Sat, 10 May 2025 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746867454;
	bh=tC3B6hWsBtkSvoNTvU5ELZanQvPAvCpKhKJcyglbi24=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=E/QyRyCjQphAbk+XXHUyHfDNKmqmLP+fuKyiBUaBSJRMgWKbK/BxB7kKCVlCkUAee
	 KhWHZtXMZZK9YSL7YUmJ7wbmISnbxDgtTas6rIsC3ecP9wZ42phK5mWeaVpWo7vTCc
	 kQOtHS/RZ/pBNIKo17v9GVx/ObRAldtbTdWtQQ9Lta8JE0EA05s1O1eK9D1/HOAOcS
	 spYDNQL96vakm3C6AWadK1lfJHemYZMCEb+7VVpt0SKbwqmW1SZxzs/gbaYNIPU9Mi
	 RGQvM14XS5y6lxUNpazE6YnmVhQNJ9V2cyeynUyYhacCXQoMuhVprp98y3ZsoEqUtp
	 PYvNgc9vtzD0Q==
Message-ID: <c264afd17fb81a5c39e4de6eb903d05b@kernel.org>
Date: Sat, 10 May 2025 08:57:30 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 17/22] drm: zynqmp_dp: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-17-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-17-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Douglas Anderson" <dianders@chromium.org>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Michal
 Simek" <michal.simek@amd.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Kocialkowski" <paulk@sys-base.io>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_015734_645208_0601C73E 
X-CRM114-Status: UNSURE (   6.11  )
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

On Fri, 9 May 2025 15:53:43 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> This driver has a peculiar structure. zynqmp_dpsub.c is the actual driver,
> which delegates to a submodule (zynqmp_dp.c) the allocation of a
> sub-structure embedding the drm_bridge and its initialization, however it
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

