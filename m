Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED6AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fQOMq6JhnmsvgxFUq50HdHYFmRTYxKZ4vzuLcA43T8=; b=ygHkJJvyNZK7re5SsXKbBILniP
	4Iai4Yj3TrwAngkJbcZcqbeJ4+rQ3I6X3jVM3Zma/mx4TKDyNoda+5jub3bzixDOND+1XVR6nczGI
	0kGuOw/F9wtanTV3vu/FgO3yj/MIpUsOMUcZwyxC65Z86Sz2Pr+bYZYnbZa8RSY7bftbeeJ7L65M+
	GnUt1hDmrEnfyutj3X6Bz2WS4USQew072xI4vDML68OpkFQgFK3K9XvZscIgW3DwEtwzo2NWFA2af
	hSnVt+le0JRK4wELLhekeIG/Aw5vLX3YNRFHkC7UTIb6O+OfyFgAN0GP8oYaa2HVwRxAUYy5xfAI4
	T6XlDMsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmJU-0000000B7CR-1qQT;
	Thu, 10 Jul 2025 08:07:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlTt-0000000Ay3Q-2FsM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:14:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9466E6146A;
	Thu, 10 Jul 2025 07:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7351C4CEF6;
	Thu, 10 Jul 2025 07:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752131648;
	bh=5fQOMq6JhnmsvgxFUq50HdHYFmRTYxKZ4vzuLcA43T8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=PyoHTKL6leJ/3r46CMvcb9x3yEkmOgmD0iPkLzmdxI8nr11KCQmcZjZnyHeLlCgUY
	 T9RyJxG1XNbav/TcKr39X//7FmHctBpGz5p4/57EpAaCZEzi1lqiyoXEkXzqXlg4MZ
	 jfWweMXOlVzX7SU2fpK8iqmglVC9892dJUWkIrRe5DEX39IFmxBNi+RbhO5nSglO0K
	 A7Tg1Fclz9vB/gB5T2fBHd1Hv1hqfE6PO+ZBfKdczCmdH7XZSrTj3TqKtvCr8BCm08
	 vbfPmauCLRQAe4yQhJsjHeubM2HPPsnjkGUQuH/i/l2wLF+NbgnUIf90BtecgLVQBe
	 4VdKBFc6Shl5Q==
Message-ID: <ad4f5b60c0fa5c2936713c93a9c17591@kernel.org>
Date: Thu, 10 Jul 2025 07:14:05 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 5/9] drm/bridge: add drm_bridge_is_last()
In-Reply-To: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-5-48920b9cf369@bootlin.com>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-5-48920b9cf369@bootlin.com>
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

On Wed, 9 Jul 2025 18:48:04 +0200, Luca Ceresoli wrote:
> Some code needing to know whether a bridge is the last in a chain current=
ly
> call drm_bridge_get_next_bridge(). However drm_bridge_get_next_bridge()
> will soon increment the refcount of the returned bridge, which would make
> such code more annoying to write.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

