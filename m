Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBB5C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 13:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RF3wdOFzL4vQqrB1B0vZ2iCYv5b2RA5x1OV5kLSU3FE=; b=SY5OZbrRislM34ZwpWQWL+F4Pd
	4u28Mr+MJVFw1gjwujeH1puO6Yt6OIUnWsLJMbEo8V+XJw6+Tc0rTO5cYRIWHXEKunl3xxHHdscx9
	KXrdFMsLGsqmcCLzjH02hKEFlC54PztseeQoyKESqe7ko02//+fe9KDi2dr/k5qPL7E+WUGBTSsqd
	F7Kdg/T1g8pQG+8oH6zGBpwlXswgmoU3DP7Emx9i/tiM74/ahcK5y5zoiY+gZYfeVuwrbZnXMK9mZ
	g16Q9oam2IcgXt7r4QBZXZ6KQgFe4ICn9e/3RkMiA6RTqBBH4z4YH5729chYgq/VqD+q0bXB320te
	melRu+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txneC-0000000B7kJ-1kle;
	Thu, 27 Mar 2025 13:51:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnZf-0000000B7Dy-3w8i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 13:47:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 772C7A42A43;
	Thu, 27 Mar 2025 13:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91924C4CEDD;
	Thu, 27 Mar 2025 13:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743083230;
	bh=RF3wdOFzL4vQqrB1B0vZ2iCYv5b2RA5x1OV5kLSU3FE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=TRYR+wJJTnUYnvc1ODN4B9vpFKwvFoCczHvPyqf3uyWcee9vc7G3HqduxGVF99hGj
	 2Anar/GswBgL04kQZ9wHQpotK+vz0ZpPE6+J7Eb/VTi2PcOmI2BZq3zNIwPhwtQdXG
	 QbWKDgA4NBm1Wl/MModaDXner0J3IDHY/sZSU8C+1n6tLKZCMO4ElsgXDUpeelYVmE
	 cv8Vp7Iain2yESM5cV0XyZbYHErfh63L4j48/Ex3hgmA1YRD5vqNgxkueELk2ceCHU
	 7vcG8O9KKTohmlyEUFTgtyiTklRJvINQ1fdoDiG+RpkeAFVVaw9+WescKG+IQ5mZKj
	 gfYcPqQWUU29A==
Message-ID: <83d859d94aeedacc2d5fb058a84bfdac@kernel.org>
Date: Thu, 27 Mar 2025 13:47:07 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v9 2/5] drm/bridge: add support for refcounting
In-Reply-To: <20250326-drm-bridge-refcount-v9-2-5e0661fe1f84@bootlin.com>
References: <20250326-drm-bridge-refcount-v9-2-5e0661fe1f84@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_064712_037160_BC83E464 
X-CRM114-Status: UNSURE (   6.81  )
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

On Wed, 26 Mar 2025 18:47:36 +0100, Luca Ceresoli wrote:
> DRM bridges are currently considered as a fixed element of a DRM card, and
> thus their lifetime is assumed to extend for as long as the card
> exists. New use cases, such as hot-pluggable hardware with video bridges,
> require DRM bridges to be added to and removed from a DRM card without
> tearing the card down. This is possible for connectors already (used by DP
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

