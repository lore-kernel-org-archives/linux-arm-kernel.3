Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46925C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SJDci72DHvw6hfOf16b/mu4mjpV03bmBfH0FYFM67k=; b=i6Wwif/eZvhjo5OK9ujeoVxe64
	YOSOkAOakzdrdNwdxggayRMFtykSpL3Q8FVxKMXjWUBX3ZAwVy/McIFJ4vcHbgpbZ4eKIPjoWworo
	Y3uu16T4QwBb1N7PkVZ6RTnbYB3PUbmE6eCSpHOJwpRfs6Pv/+4rF/WKutuCJJmlqhY2MjbDBhrE5
	R/zZ629iWxNQadnW4WNz6WK4A531dz4FDLWR6su5Seh0cMQcXhcLGkYSq6qt5zS4J4D2oM7t89OJD
	nXNsKsLnPkxVi4Z354xklHx2UyPR4YN1H5e3sA+rz89LxgzTtZ6hpzdth3d4WC6VPywdT+TaPwkDM
	oAxwqudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9mX-0000000F1RN-1vSv;
	Fri, 14 Mar 2025 18:29:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9W4-0000000EzQU-05lo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 18:12:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 77D25A4886D;
	Fri, 14 Mar 2025 18:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978FEC4CEE3;
	Fri, 14 Mar 2025 18:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741975935;
	bh=BctqkYo2GOjqZQkTh09D8VX3tCtmfb7LPK3ctO2t+vU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=U6JAwhgVTRgbNxmvvPxxXMYTyVP24msU5iabUCxVLo9/OF/ZFSoOHaj6KV6EiF02E
	 BWVK5OWUq408QJ1AjLxi+TdJWPQ+JoDQtaHsmQ1k77Jf8Yl91QLzUIBTzqnBvh9RXU
	 BTIlavnBHmiYpXu/DHZm6/0ok/6mQ6JqN5C52MePVuf4AQpoWl0kGA1a+NipR/RRHn
	 4i4vSSmAHYDjYscRv3I1Ek6mH8O+AM70+eswkGbGABh7x+nKGY3pGiu5WuxLo32HIY
	 macBE23mghrdHgYo46GBrW0LslYO0WoPJosqrevcgxPKdUJ9mhNdO6/kkpM8+OPCnw
	 YZ8bauKXnyHFg==
Message-ID: <1da3c1ee7b8c39e200437ac622238221@kernel.org>
Date: Fri, 14 Mar 2025 18:12:12 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 08/11] drm/atomic-helper: put the bridge returned by
 drm_bridge_chain_get_first_bridge()
In-Reply-To: <20250314-drm-bridge-refcount-v7-8-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-8-152571f8c694@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Fabio
 Estevam" <festevam@gmail.com>, =?utf-8?b?SGVydsOpIENvZGluYQ==?= <herve.codina@bootlin.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Inki Dae" <inki.dae@samsung.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Marek
 Vasut" <marex@denx.de>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Stefan Agner" <stefan@agner.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_111216_126583_3233BDF1 
X-CRM114-Status: UNSURE (   5.90  )
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

On Fri, 14 Mar 2025 11:31:21 +0100, Luca Ceresoli wrote:
> The bridge returned by drm_bridge_chain_get_first_bridge() is
> refcounted. Put it when done.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

