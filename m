Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7852BD2F33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHGVjit8VwhbShRK0/bCyoMxk6VdPqYNKqTmhctqjgI=; b=yBf3Pxu4yYUNqSAg6tMbbLZ4aT
	6ZFZgaYZ0Txl88JeftQ8q+gLg6Osw9cBglc4uEbPmuluXT3HAoDdw8EpkZXUNMMRU2diSE+jmyFnf
	02Y31RAz5LTBkOpaq2WtDq+fWsQTKc8dCUWyVsltIs8CTExf8svurfR2VHiAqlTd0m5OJIzzUXwmZ
	8t2M48+NX+Ma5IZDo/kRj3+QwndBrbolxJVV9gLRJDezGCvXDWP6LUDr3GXbiFlp6WGxBP+5wLtZU
	3ykV64++9jJpZ9nOub9d37nxCSFQc7TLwL9TM9qANvs9RAixtXuPZ8TP9EiJrgVWPwVpkyoGgKO21
	ken2ZDpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgaN-00000007POb-0B27;
	Tue, 13 Jan 2026 15:45:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgaE-00000007PO5-048C;
	Tue, 13 Jan 2026 15:45:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44A1E4425B;
	Tue, 13 Jan 2026 15:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E26DC116C6;
	Tue, 13 Jan 2026 15:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768319125;
	bh=QHGVjit8VwhbShRK0/bCyoMxk6VdPqYNKqTmhctqjgI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Vj8jfYtwVpN34UwgShpcL1FzDSlbpS4bQm/7dqRQuoY033E5XM6Ez+rNImqngRxaB
	 nACj9ts4NjsXPOn6EI8eK2xmCitwWCkFZ4Y6xRKBW7pACKehM0GcKToi2UWCQXMxSF
	 ALNGfep40AaS5dnCgcrxri74TGGyx8aj4aKHim2wtG64SFu+zmj3Zk1BPgB5ry6A+g
	 sQUuF5paG+KZiBnPIXtW6y3Vl9cYgfEXAJsC38IoaXWC5Fy8rTH+Oe/wnzRAgr8BR1
	 DhE/OshV7DBef0v+a+FogMakqTnHanKfmyFi84uzDFx5lJekUOyGnmb8xmUvOU484p
	 tIUyS5z5f9x3g==
Message-ID: <f83f12627d2e010007b84931049632f1@kernel.org>
Date: Tue, 13 Jan 2026 15:45:22 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 3/6] drm/imx/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-3-8d7a3dbacdf4@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-3-8d7a3dbacdf4@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Kevin
 Hilman" <khilman@baylibre.com>, "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Magnus Damm" <magnus.damm@gmail.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_074530_634688_90686848 
X-CRM114-Status: UNSURE (   5.40  )
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

On Fri, 9 Jan 2026 11:02:52 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

