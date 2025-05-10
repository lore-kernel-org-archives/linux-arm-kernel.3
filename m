Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4154C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 09:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQZXL+8mSvjE/ffDNqcBTcqjRRAsjW7xKRH4V1Yhz3g=; b=mx119dR3ldpq9NVznqfiEMYAJB
	wofDq0MCEGsQ9x4FUMFghWX6EBZKuBJaGNaK+ir2RuRid16EGUc0P4qswZueZ+xKeCHG+/h/ftviV
	3z6cvCHeSujLm3jEXS5DdB6glb6ocCzGLB8ZJg9BfY2AIXIvglso5sFxVsIGM6fxEK7HYW4Wm3pgI
	lM4vIOH14xt5uEz+eITX6yrBop5vu8KRsp1GLWo7GwxBfiqpImK18NAx2KXT/lYBuXyJ2/poq/WiZ
	lidiy8SBDoEYUPYonpRvh3045DCNTY77YR0A0KxZWro1DhmNlp3+j/djeRRBsThQqLIO8E2vNWiQq
	Wh+nWEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDgM0-00000005jIM-2Z9d;
	Sat, 10 May 2025 09:18:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDg2M-00000005hKl-3mdf;
	Sat, 10 May 2025 08:58:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2994BA4D7AC;
	Sat, 10 May 2025 08:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDE7C4CEE2;
	Sat, 10 May 2025 08:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746867505;
	bh=KQZXL+8mSvjE/ffDNqcBTcqjRRAsjW7xKRH4V1Yhz3g=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Hn3ETCkgrLKLiIMOIHgmHZ0GK9SwwrPLV0AORbbNC7iRm8NgjaFFdGZDc4Dtk2Vkb
	 ILpF5jgJemxZm3tBLCXYuylreXKQOedbjrYPf0dX0D8Gwil+GrvA0d/N+MjuTsSPi0
	 pPXGD42cx5PYor7h5EmMwlIF4f95fjfhiVhe/LB/cRGe/t9k+6FmfPtxcc5lPcfE33
	 53jRp5zSdpPN5PTvZm6DUFfd/lZcF7sQUUw97FMRgTz2HVr2bOvL/wyG6QmRSnCVOS
	 bRBedGbL4x3zcX/cDykTDe+pno5Sl0lYyGXnm97mAT/4Iy50StfDILe1nmNMV8bsfE
	 2UD6ihELv+fDQ==
Message-ID: <5573173c96551b51def2ec8806f297be@kernel.org>
Date: Sat, 10 May 2025 08:58:22 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 12/22] drm/omap: dss: sdi: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-12-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-12-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Douglas Anderson" <dianders@chromium.org>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_015826_999310_750A8788 
X-CRM114-Status: UNSURE (   7.08  )
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

On Fri, 9 May 2025 15:53:38 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> Switching from a non-devm to a devm allocation allows removing the kfree()
> in the remove function and in the probe error management code, and as a
> consequence to simplify the code flow by removing now unnecessary gotos.
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

