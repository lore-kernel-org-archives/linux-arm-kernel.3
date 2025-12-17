Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBA7D6552C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3fa3ZW7Btz5urPS10XReNhAoJDTbHbKM52vabWMgfI=; b=Cr503xuco/iLryVaspb15SF825
	cCDxPQc7XXw1Q+q43e8HiLfkPF33is38LrqGmnl87xnDBnl2bf/mQ/paITeVgetFExC1CUek/5eOr
	1dZq4eh0/wU518Q92cni3u/DQby31r3oKnGMcQstqFrGTghGw1yyKUaL8QWrJiF06N0LFAxYwj5O1
	1fJl5MvH/iVsGy7xbXWA4X/SJlC+udJLGLKl8u18RwdgWBTicanOBbjTdu+YlurZQs+LZvqAT0b/C
	h00Co0MUd0U/iTqef3jorbIBeQo+3qj6SDalinZA+INrPxNJI1LwUNpQZMDREt9kvl1HCerxQQzD3
	dXjyOLJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVocR-00000006b1l-3z8m;
	Wed, 17 Dec 2025 10:18:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVocN-00000006b0a-3W9N;
	Wed, 17 Dec 2025 10:18:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DED4D40171;
	Wed, 17 Dec 2025 10:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C015C4CEF5;
	Wed, 17 Dec 2025 10:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966730;
	bh=b3fa3ZW7Btz5urPS10XReNhAoJDTbHbKM52vabWMgfI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=f3kcH5UWPQk5umEClpVniEspgHBzoJL8PmCMlcHQWbehjUOrxiYt8L5rHadEJkd2x
	 ImU7pskBgAfdRoxBw3hX9YLbjiu3j+YClj+XyH1sOi34ekmWp/xY3NdNbkyWR5GaaV
	 e62mQUecv476zqqxajER7Qyw6tIBsBjG5sD+3+XVPhyeTq/BM3s+HDU/qSYMsUE4cv
	 hqixaDHD01uyhVXLm0SC0F76xFqjyRNQ7jf3jNTQAAkZzEJz+UUkVbkjxpZIY5t5SA
	 ZDEoBMG+Gz65hkUePrn67AOjou0kecYxqrTrM59XAv+0uo2IqmPPt78UacMsM7rgHT
	 Ak20kSNG1/nfg==
Message-ID: <36c9a024a4c96830f13bc1e7c005f231@kernel.org>
Date: Wed, 17 Dec 2025 10:18:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 13/22] drm/bridge: imx8qxp-pxl2dpi: simplify put of
 device_node pointers
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-13-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-13-b5165fab8058@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021851_894056_7F2E8660 
X-CRM114-Status: UNSURE (   5.09  )
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

On Tue, 16 Dec 2025 18:58:46 +0100, Luca Ceresoli wrote:
> Simplify the error-management code in
> imx8qxp_pxl2dpi_get_available_ep_from_port() by using a release action for
> the struct device_node pointers.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

