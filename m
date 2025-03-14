Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF79BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZepI8LPNaIPgCHzOcgRGZobZ670sZugs/z/7viGW38=; b=e9m8q0MbIbbVgO1VnO+vc44vmu
	2zsQqn3ZOo3t18bmb2pNlYybMhVEbRD1h7oRmH4jHptkoA5Vh/BMa5LBGP3RKwxjjTNNJB0QrEiTs
	GzXsa9cG0XmtYCStZp6EVFDtjP15gblZRJKzyGKb2RlL8H2UyYpiB2DmEy6evQHFo/1MDmln/05VU
	HMZ/qQKMpXp/B1mu1esaWn2h12Qidwns42lO+D0HDeYdIhVgN6fsT8UB54rhUGotmJXw+c1XdsFKV
	U0EWMX6lsBq+5bJPFr7h9QAVTr7i6NwwDyj/idEmdK3IUFidQZBZA0oWiW3RkyHYbgN0EjYRWmBmw
	PIbkxH/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9rT-0000000F20U-2I6s;
	Fri, 14 Mar 2025 18:34:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9bv-0000000F0El-0u1t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 18:18:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF8CE5C1075;
	Fri, 14 Mar 2025 18:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A648FC4CEE3;
	Fri, 14 Mar 2025 18:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741976298;
	bh=ZZepI8LPNaIPgCHzOcgRGZobZ670sZugs/z/7viGW38=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=T+M9C0wOPRULtny0dMIpwd1MQh6HhJIspUv2IWXZUEb/eyNziep/h+bAMFF0ciyrc
	 gqQnmpoPsiqBcTf9jmWtvBDJU7fUQsOuDoei/DxS89x/Bwh8rYWBAfH/yQZH5w/RE3
	 W2V5+iejNtwvnHVNGudeKC5J4AzgreZEu203VbUD72MZ9wXrb89KsGDVBExc2oFjB2
	 81pXQSWHH733fLwNZdbTI7Pp7CXveyo1XKwL5XlOzroTaBIn2JWUpegy2ecmLN26iy
	 Fc6yhY31xoJydnY8CoC/HzADCoH1EiH6riWuqnhnvlpxECDLki9uN3FyWI+k7LlLe/
	 kYGiYv4VtgmSA==
Message-ID: <6d7ef2d51bc98436fcfc7fa9076514ec@kernel.org>
Date: Fri, 14 Mar 2025 18:18:15 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 11/11] drm/bridge: samsung-dsim: use dynamic lifetime
 management
In-Reply-To: <20250314-drm-bridge-refcount-v7-11-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-11-152571f8c694@bootlin.com>
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
X-CRM114-CacheID: sfid-20250314_111819_307600_8EE11212 
X-CRM114-Status: UNSURE (   5.52  )
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

On Fri, 14 Mar 2025 11:31:24 +0100, Luca Ceresoli wrote:
> Allow this bridge to be removable without dangling pointers and
> use-after-free, together with proper use of drm_bridge_get() and _put() by
> consumers.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

