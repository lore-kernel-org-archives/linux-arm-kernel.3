Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C59D6552F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6fWBAYEXtE3Kd4XTM6pOK9YC5GmGveHQTJogZwLkDQ=; b=EkFMZ2hyWrRlABCfWpgW0zl7Gx
	CoPheZVLs8tQOLfMtcEZ1/eAmW9twxFZTvhqLBYSmT+1t0sx+snmxe18pM1xX+zXlLgQoaQ1UUQUg
	RrdtvKWDwfoAhujI3T6hGPmqx2A4Er9GNfLdstqSjVz/pStpGIkwdWkX/LT/AswSzCCfufra+ogX/
	hMQEMGBZjFbAXqYVmObR18j+lhuc7GfAz6bgRDlp1mznSiE/DM/yy9gABNtdZXFJza9nCfU5B3LZA
	kzMXERxMtEyeTvFzKZIT5dK1e4Krt286vmzonuFGb5MA5EsHwcX3ntLo/LaC4Murrg2kFrSDaMxoP
	FZSqrytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoii-00000006dty-1po4;
	Wed, 17 Dec 2025 10:25:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoih-00000006dsv-0m8Q;
	Wed, 17 Dec 2025 10:25:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4036C6018E;
	Wed, 17 Dec 2025 10:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699B6C4CEF5;
	Wed, 17 Dec 2025 10:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765967121;
	bh=j6fWBAYEXtE3Kd4XTM6pOK9YC5GmGveHQTJogZwLkDQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Rm2NHFhSLip7bSLXiPGfLGtjzkUVxs6dUDd8ey0B8wNTOtLmMaxmzMTTKRHEFzBWs
	 sdBBztUA8NDkaASfgt12Wb2zY3TIJdMJ9ZynH+qEpRy1GR9do4WKZMQIlJZeauI5Se
	 tXkstKJunbralmVZCVBcCXkWZeXUKvqZ56Vh/PLOObvKo05r8ZuWzAxbamZnSPdBx2
	 a+BViYe4R8LELixb5GNRs1I9i6d2zY/2ebsdiYDAyDpACOnCQfUmE8H8Wps81ikznb
	 +SPzb+Awo+LWePjP+k2iqoC3iBH8GNM7xvAoIYZTu9TJjr3BpObrFmqZ0kEyRbUgYI
	 /512xnZHl1/RA==
Message-ID: <b95966ec5cffced78db429efa87dcf95@kernel.org>
Date: Wed, 17 Dec 2025 10:25:19 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 19/22] drm/bridge: imx8qxp-pixel-link: simplify
 freeing of the remote device_node
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-19-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-19-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:52 +0100, Luca Ceresoli wrote:
> The main loop in imx8qxp_pixel_link_find_next_bridge() requires calling
> of_node_put() in multiple places, complicating code flow. Simplify it by
> using a cleanup action and making the 'remote' variable scope local to the
> loop.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

