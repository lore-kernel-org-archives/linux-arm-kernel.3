Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C5DD2F32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyEYv38CjxmJMfeL9PV/m8tOA55M4SODjwx+UAXsv1o=; b=nDP1xjf9BkBDiHWlTZmwMRDIWG
	jIIn1B0M9zsi9Jxv2RWYahGd4Elh153muq28jNcGgTSC5lC91eMnwi6/eqHLhbtwXrShDw9xAqDqM
	sMfZhltT2ALmjG8L3UZo/k5dWLmI+Z/93PMTacazBshcLPWKZsBTZ39Vh/Tc/b6gkxaGz7L9s8giz
	ddRBNn2Itiif3lSMQC9t7/uJSU5OfjestFtQHG1BiPuMsk2P2pKJ0ok4Iq4PDRJP+M4hEb2Nt780k
	Sh9TtVp0/wSaGgsFD2MExBL0nfDKI9XBFNVu96U4zcNhxp7OwTvGfczdUPZUWxN6rq2rPFrdJuT2u
	Yxhc2UmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgAf-00000007LsM-2gIn;
	Tue, 13 Jan 2026 15:19:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgAe-00000007LsF-3gPY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:19:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E066760051;
	Tue, 13 Jan 2026 15:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16234C116C6;
	Tue, 13 Jan 2026 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768317539;
	bh=FyEYv38CjxmJMfeL9PV/m8tOA55M4SODjwx+UAXsv1o=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ZdtH9E+A6WMRwiK/NaAC9VbdFn4GnCEoEmNTjnnWf/p4RbPZrcYQGnW+ja3s/JKmR
	 t0Y7XxpzH4pwzIaDad10XFeFo9rPnTjrhjQF4SjICMJZaSvxREhdD/ErYJyVCBTayG
	 H5zQpW74TNUWS7EbvqCzOM1y0zaGQdlAw6bmRgLVtl/lrvf87b+p+fROZuImS1RyM5
	 u2APQ+UI4vjLx1iO4kzcflA/PSrkHPGTWLmb/OLaF6uZ8QLN+hijTLHHe6YmrustVt
	 8LQmGmuDu+mnjjS2d7dYxIEr2QEZZABOBYj5fPps9YCVkLVUnSG+NkVAVU18yOCgoE
	 qIIQ+IxvNOTDA==
Message-ID: <8818269aa401cc620a1485eb56cb757b@kernel.org>
Date: Tue, 13 Jan 2026 15:18:56 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 09/12] drm/bridge: imx8qxp-ldb: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-9-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-9-8bad3ef90b9f@bootlin.com>
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

On Fri, 9 Jan 2026 08:31:40 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> Since the companion bridge pointer is used by many bridge funcs, putting
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

