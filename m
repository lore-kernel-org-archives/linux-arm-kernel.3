Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30630CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfNREE1NRpLohbGRAU4pi3ndwFMWBBmz2ZzA0sg2qiY=; b=X2AVZKHNo3LeGNz4VcMudxzmlB
	cZ5Ps/3DdIkFVi7a1VIYj/xzClHchFQG8Wlmg3FMQ2EMXfl0vszeOvdr+aAB+3/+F49u6dzWJg9eL
	D1UPgoYOu7Ym7uaWKv4RUnZXp6BgSdbB63AfA9ei0FGNyJaFCZsUOd+v2Y8zK2ZIbhv0LsQRAgW0z
	4pHx9BqrGrokZwjyceG8R04nbmcW8OWwt147Cg0kqgsOAXizWzwrMlsuvY9KToidtV+tNpzpojTDV
	tD42I8vu2kBL7UUNNybNIZMIh88uZYN6sv06fU28QIjJYUraQTqRclrpiQBGBQei2FnMCMf8PRW+F
	Kjej4k4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQrL-0000000BEXe-29EO;
	Tue, 19 Aug 2025 18:14:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMr9-0000000AgG4-471V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:58:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F7694404A;
	Tue, 19 Aug 2025 13:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9844C4CEF1;
	Tue, 19 Aug 2025 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755611911;
	bh=VfNREE1NRpLohbGRAU4pi3ndwFMWBBmz2ZzA0sg2qiY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=LbP2odHcaQtLA+mKrpqzrHaSnPgZ9K5DfdbCkbBIfuO+XH0YWQD6ef3Hmn78pyEiQ
	 R1VSgY4WPySRI1pZLKRDF57zx17P5KaMUCqizWKDdSfmaCGF1/J2bSf1OQsXktaOzD
	 gDlRnrD6HJ+QRfuVuQSFFG/OVB6vtIkVJmQw+GtgvZ9Vz+fh+WdOBp5SRVJJRXPJgB
	 Z+CyqfFZEVVNzCRVMtgTl/n4vLewOYM0GKk5UhsHfwUf127ZMYHJK74cCsqah8/oBW
	 AR9YG5VWp2BA4QL84FuP7ZeiQbqvN8+Oz9ipcx6pahQs8FDJKnz21iOfceHsbPvAnE
	 k/gHjXwYFmcHQ==
Message-ID: <1950cb116ce138970b79559c7b078c09@kernel.org>
Date: Tue, 19 Aug 2025 13:58:28 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 8/9] drm/bridge: put the bridge returned by
 drm_bridge_get_next_bridge()
In-Reply-To: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-8-888912b0be13@bootlin.com>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-8-888912b0be13@bootlin.com>
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
X-CRM114-CacheID: sfid-20250819_065832_035045_84E3E40D 
X-CRM114-Status: UNSURE (   7.20  )
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

On Fri, 1 Aug 2025 19:05:30 +0200, Luca Ceresoli wrote:
> The bridge returned by drm_bridge_get_next_bridge() is refcounted. Put it
> when done. We need to ensure it is not put before either next_bridge or
> next_bridge_state is in use, thus for simplicity use a cleanup action.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

