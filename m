Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA37C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swtW+ZXga7xhQRN3PDVAmuLXUcGh09yYcwhConUBkmM=; b=zphUentLZNdeTLYMIFG+YWmXqS
	N8jVnajGP2u4mv9rnUfS1yIKqdkxst5tE01ckJtFkQ4Md+1QfaVssnbxtiKVb/qaEqdz9/D7TrmKx
	9USf5ihI611bYUSi/zJjKHfjQa74LqX7avc57OMNODhzS5fRexBAXTmwPXyHUsARbSVSpoQQFq0io
	x8+vyxTvhCT1mHkVoPsT+l9SkKjg1obEfaygJr3Yq6f0ly4aS7GZrffX5Qjba1IBnLh6yo3F0pqg9
	d5UTrvrl4W9C10yf3jx2k8svuhMPhHO8G05fJzGupubuSqz9ubCVMPuw6cs5GcfPdB3XucbG+vQfz
	T2ZUN4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmnX-0000000BCtP-30Rf;
	Thu, 10 Jul 2025 08:38:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlSy-0000000Axn6-0KDv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:13:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D12F5C6366;
	Thu, 10 Jul 2025 07:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96832C4CEF4;
	Thu, 10 Jul 2025 07:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752131591;
	bh=swtW+ZXga7xhQRN3PDVAmuLXUcGh09yYcwhConUBkmM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=nKAuITkqsb2naB9snjWW/pHegn8VLqiYiNKoXBP1sMkdgv20fOZu/V4I5IzMrkrR1
	 WYv0c9SpDAGlQ/kk0Cth27W7FY+pU1DBvFFPyaf02FeGjbgRaWxEcdkdTlHM2gO3qA
	 vyLpnfU8euZ8q9sGt2HvNho7vHQGvvm3DNzI/OwkOhjm1McL9wfaOMyu6zyneDNPyX
	 KwyqdUsCGt8Q6jnvBucJXf3I0xw2kQVzbne2/aUuQ11pPb/5Vti+uw17YpvSXVytv3
	 XAOJsIzxQxXuhGCgVGpEXn0ZcZogiPOs1IIssH50SCpsSO2ZGTEws2Y/TG448M6g+n
	 N6od825biFIYQ==
Message-ID: <85f1ee594f02802fd5a019fa5ade999a@kernel.org>
Date: Thu, 10 Jul 2025 07:13:08 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 3/9] drm/bridge: imx93-mipi-dsi: use
 drm_bridge_chain_get_last_bridge()
In-Reply-To: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-3-48920b9cf369@bootlin.com>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-3-48920b9cf369@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_001312_158666_C0D7668B 
X-CRM114-Status: UNSURE (   6.51  )
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

On Wed, 9 Jul 2025 18:48:02 +0200, Luca Ceresoli wrote:
> Use drm_bridge_chain_get_last_bridge() instead of open coding a loop with
> two invocations of drm_bridge_get_next_bridge() per iteration.
>=20
> Besides being cleaner and more efficient, this change is necessary in
> preparation for drm_bridge_get_next_bridge() to get a reference to the
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

