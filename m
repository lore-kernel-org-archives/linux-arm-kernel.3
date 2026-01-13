Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C47ED2F338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+Xm2qMGnA5x7FszB8uRvS9zkV/vE1jZSaeLyHnYWl8=; b=X3hdufC2MlCbw4QRxJgZZ9plF6
	BYf1hvWIs3Eayla1g0UdqG2KuTqg3o4gL3RoscD3VHJaIUPMS2n4MoISs+2YClxw9diDF9giCUjb5
	9P0SJmP2AvlXLGKidurjlqYDjahCY8y6EFMFQqnI/WwCvGdKFGT6mm1QpumXpBTLgJz03Cfm1u4e9
	Hfw8ZaMEn+1/GDB+dmcRncVg7/I5xeuQSpjKL3Juxnts9riUX1e5zEM03S7tqte9j10umPYu/EPqF
	QFsxWiewWY/v73v6cw/Ejm51Qjp1xMhstIqm1tFPGjbQgKNHcWtrWXHckjDudzbPte/cvn5nGVI3k
	WqCU8WGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgap-00000007PUi-10YF;
	Tue, 13 Jan 2026 15:46:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgai-00000007PSB-3yG7;
	Tue, 13 Jan 2026 15:45:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F5D84425B;
	Tue, 13 Jan 2026 15:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C339AC116C6;
	Tue, 13 Jan 2026 15:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768319156;
	bh=h+Xm2qMGnA5x7FszB8uRvS9zkV/vE1jZSaeLyHnYWl8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=HMyBMdgK8BXz+mo5Mwd2Kqeek8eYBxL+YibX03/VBOFChyul9JzNXslmZumjgxUbb
	 8kfX6ODB7lXircFx3eLcfbFCDB+8RJLTsVQHRBiXcLjXyDj4tx95cZdOd7cEJEInTW
	 hDtaYfiGImcMOzG3RthcWeQ/XY0tToCYAVDln6P7gAiZ+HELZNV9e6QHToEtuvWkzj
	 wUj820GdMq2tuDMOCZMzHXMqGaPgkUZzYTNY4O/2g6MGluLFf+K00uetORWg+ruDtH
	 PKL1+uVYOFpBrV484prKk1StFnUAN78ptPSrru3FZgTzmy70QOgj8T9ElZELEvMeW9
	 Zm0Gk9BEpvaKQ==
Message-ID: <891932fbbb8fdb13285ac2055685eaec@kernel.org>
Date: Tue, 13 Jan 2026 15:45:53 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 6/6] drm: rcar-du: lvds: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-6-8d7a3dbacdf4@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-6-8d7a3dbacdf4@bootlin.com>
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
X-CRM114-CacheID: sfid-20260113_074557_161993_846AB76E 
X-CRM114-Status: UNSURE (   5.75  )
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

On Fri, 9 Jan 2026 11:02:55 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> Since the companion bridge pointer is used by .atomic_enable, putting its
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

