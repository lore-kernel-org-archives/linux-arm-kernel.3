Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E835FC72C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WyenFkskQRviNgIdSNi6d7LvQNFj/WN1yDFKmE61aM=; b=XLDwliusQ0rmjrE8Fd13jQK51r
	yxZJc8t7TVvxigy4PcCsnRxLrQAB8ckbq1Npcb7iJIXqYFEGqQRfqNPV03zLL5T6CPuZJBhMKEdDt
	TUZSFLWauVS2YdaflXok+0oMbDf/pUSPE8nnAHbSvyaVX3Xmqn/mTuQzrYZrLy3OxxcbXS2MIkN+i
	MM6X/enT63T/to+GPrgV5P6yoSNpVsDhJhkQ49XYrJhfjtsUePhs8OdezLeUfs1XLGLxGG+s7XXPy
	9nLlp3zVRhTr6SrOLoHsb3RMRJ2GnjZ9mrFZZIa49IE/Wst+nXCXEoR7BzD4DCWcGp2UZ0af2uOiW
	ZVt4vS8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JYV-0000000FOYf-3xhi;
	Sun, 22 Mar 2026 14:13:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JYV-0000000FOXk-1Mjx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 14:13:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BE1C60141
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 14:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3FCC2BCF7
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 14:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774188806;
	bh=6WyenFkskQRviNgIdSNi6d7LvQNFj/WN1yDFKmE61aM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m1JSvO3vBoAW11h+1jUFpD4M3o87pi5WVIS30EG+IpjrhSbVVm0n+a1tBuAfjEvBt
	 DUqzvAtEE8KJ6CZfJtmKqQq9BVDuNmVeWZsoYGhGiqY+t+Q6RwWFQc5ZQdL1p/KZIY
	 UFQwKK08jzzYTvqEXZ4Ac8G4DE5xsSYsUXc8IfhWTBw9DfA2DD2C6LLzRNU24IbyFb
	 lrOIf3a8BJJBT9sBoXhMHNUMb8I5hhEpcoV0xfuwNuKiNcSCrIcGPuQKtmayUZ9HXR
	 hFKtrSq+WjK11fCbeC076eyEPEXZo0kTu3ZozNAe6J8tQQi2tgc/U6j9xLH40yQ+qZ
	 AsEOEj7QkGiCQ==
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-127380532eeso1358903c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 07:13:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuWLb005mgv5/Nb4y1aTcKMU6Wu5IDlxx6CMvEygm8IK8uax8Dp8m5gL+KK0cVOIxCk7Y9PI9IazrnMhM5TyC4@lists.infradead.org
X-Gm-Message-State: AOJu0YxpanRr5of8EJ5bpRAJ0oM25iO/NuutU8Ivmvg6U+g3Ig58qtHJ
	XFya1FZ4u6oKOfXR4eLx5LRNsCer6L26EV2hdi+JKUJUN59fjFaQdwNBUK8TqE3d3jHYbMxFj9P
	+tRXcEKyieKpZ2tMveTaUcmBbI0xr0Q==
X-Received: by 2002:a05:7022:629f:b0:11b:9386:7ecd with SMTP id
 a92af1059eb24-12a726e3eadmr3908663c88.42.1774188804941; Sun, 22 Mar 2026
 07:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-4-ef48a517828e@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-4-ef48a517828e@bootlin.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 14:13:12 +0000
X-Gmail-Original-Message-ID: <CAAOTY_9PH4yV-mDFZ+mkNRT7R9qoZOtjQhhqmyWjx1LWSu=giw@mail.gmail.com>
X-Gm-Features: AaiRm5108rX0H_CDRkg1jedFrdyn5bPiHycKlLMUICMJdSqU48gN54_ILYySwo8
Message-ID: <CAAOTY_9PH4yV-mDFZ+mkNRT7R9qoZOtjQhhqmyWjx1LWSu=giw@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/mediatek: mtk_hdmi*: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Luca Ceresoli <luca.ceresoli@bootlin.com> =E6=96=BC 2026=E5=B9=B41=E6=9C=88=
7=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:22=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done by using the drm_bridge::next_bridge pointer.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> 2.52.0
>

