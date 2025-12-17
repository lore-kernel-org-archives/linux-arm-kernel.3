Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEACD6552C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZgmTPAeMOlNUGInXD4jCnDjAKu2QFFNlX+3u+2jIAc=; b=sqI8YsPKeehqXEM/UkO7g8t/xH
	hJqeWhUaRnbOtAUPPTWu01X/aMRyOT/Ol0/v0Q01JRCnk8l7fX573rNjpvvycffswOEJD1Z2tIWzy
	+zwq4A4k7QWrTGjdHY8P0Y/v7IWdTOvnA+tJ/x/dcWlngYZytPc7GedCNNvgm33IZ9q3Aq9ULzhpg
	j9vyZ+r0aqr3dOiGVNCnGRz1Lw7b2aI15wCTsjdllE9MgL0FaHDCVUCI9wYVyxdydnfFr/diRXKHW
	iLUyUvLWgL/wRTCds63fCZV7SvrrCHolNkQSOE6jNmgR7vwicClQQte3eMdSJNWDOZsE2WggSrowr
	ZZD+2xPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoaj-00000006aID-24kA;
	Wed, 17 Dec 2025 10:17:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoag-00000006aHO-3NV8;
	Wed, 17 Dec 2025 10:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66464423DD;
	Wed, 17 Dec 2025 10:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFD5C4CEF5;
	Wed, 17 Dec 2025 10:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966626;
	bh=mZgmTPAeMOlNUGInXD4jCnDjAKu2QFFNlX+3u+2jIAc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=VyZAKLyFoi3kNFjG5dOkan+Qis7IQcXAKUc7okV15sa3Du0PSNJfnus2iX/r1acOQ
	 26zGZkm7o5M+xp1aBKtVPRBSYi7SgUPYKH5wZQeVv4qy5KEPuvQLyMVPOoeDxPuwPy
	 WTU36fOOpVOxpXa73nbFDyWwksA0xJBLCzX3cC3neAzgWhEyvgGkGfgEiDkNzNnaXj
	 skrcOyBoe+Sh5yLymrrlgsdXfj67lvuljIFJXiZ7y0q1YmFDrA4FV2EvLFSrPeev52
	 49ufHVFENgYAROMzIktwy4ImrH0phkgwUQRt/qrNh9mWTn2uBAq0Av6X7PcxRghwIQ
	 fsL/NCIkBT4CA==
Message-ID: <58a8aea8735f1ec8db23a95da8b7e0a8@kernel.org>
Date: Wed, 17 Dec 2025 10:17:03 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 06/22] drm/bridge: add next_bridge pointer to struct
 drm_bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-6-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-6-b5165fab8058@bootlin.com>
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
X-CRM114-CacheID: sfid-20251217_021706_865083_5BEED36B 
X-CRM114-Status: UNSURE (   5.20  )
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

On Tue, 16 Dec 2025 18:58:39 +0100, Luca Ceresoli wrote:
> Many bridge drivers store a next_bridge pointer in their private data and
> use it for attach and sometimes other purposes. This is going to be risky
> when bridge hot-unplug is used.
>=20
> Considering this example scenario:
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

