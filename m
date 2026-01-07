Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8084CFD63C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=is+q/rGp91VXaPijC+q4cj64jd7mGpSySGNDyI9q+mg=; b=Tcz3zFojK/pvitOglCNfzsb3i9
	W27ZudPM1UKwIG5u6Tv4FPk1PiJ/hN4qZDntE9xPZqmc+V6K/NiyMKwfhxhhHfNWz0k+8hCx0LHtq
	YpttXcoOiM+mHJRGH/AYXSSQe/V8C5ab1CwmjLlKwuiXMEwcIVdpQ/ZHiVMKnli6ob8dZaIrfgINB
	MlB+ZX4K1qOA35LBWHDmHW4aPCFSi6FQKV5dJGP+lo+eyKcvTDM7o/2VOAxAYKxeDLBSV43pGT5xZ
	XbPDtuoLBIe1a+7KM+WMqkjcre4f58j0tEy+g9SDW/43R5/gC/RAPD7zSf/HUnmmDugLUNxU7AWdN
	YkTbq+kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdU1l-0000000F2Nt-1vSh;
	Wed, 07 Jan 2026 13:56:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdU1j-0000000F2Nm-2mJK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 13:56:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A936E60007;
	Wed,  7 Jan 2026 13:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80D6C4CEF1;
	Wed,  7 Jan 2026 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767794202;
	bh=is+q/rGp91VXaPijC+q4cj64jd7mGpSySGNDyI9q+mg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=U3GY/QvcyWmbXZeQ9v6SGEQMjvfLVh20Z62ki8Tf9dzfKJET754JDghzGb+Nd5Dz5
	 Vv5Zu4g7TWqz0suD8gP1N0yMEve5gmuFYdP3CI/CGFCAZitnQ0rzsxw0oKkeDLZEgj
	 XkZSIORN85IJg0iuV/GZyDdfl+PZICrqaGGIMFGLXJkAqMjNTlUP6NtL/JXiVDoZtn
	 ccKweo3sOYUcYpNAPpJyRW6LdL0DyQntjZQy5LxMZnGSxTEqTkAC1dm0KbxA1nHxWo
	 zbYtmLKsOIIMBFIp2guflw0pWEO045X/QoAkDeQoQVbXQQd0pbWcRfJGA9gGpVYPLY
	 Wcp64O+70hyzQ==
Message-ID: <d06f91d487a616258431aa0b8b615b05@kernel.org>
Date: Wed, 07 Jan 2026 13:56:39 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 07/12] drm/bridge: lt8912b: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-7-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-7-283d7bba061a@bootlin.com>
Cc: benjamin.gaignard@linaro.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philippe Cornu" <philippe.cornu@st.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
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

On Wed, 7 Jan 2026 14:12:58 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done by using the drm_bridge::next_bridge pointer.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

