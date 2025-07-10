Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6DFC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFnHeKjYwssMBqNsSCx/tbpAP09mcF3vy08zlbhU0Tc=; b=i5iNGYj6vd0Q46nXuqNm9dWZSb
	lbUbZAunMKAgZNed8q283bzSPeRe47NamjTNgyIpbPvvqxlAul3FnQnWnTN+ksCSKBeX2vfRFWkwR
	uL7WIMFcRTCemRxj+CodbuSlLl/D5XRqStOiRjD200gzcKkW82HVp9pqp37C4wwAx2xogbU8LuvL5
	WotaDfO5UISRn36pdlN/aFH8Msz38E6mazqDc++gd9PeTuXT3Z1lCJSZpHb862hEwYbl1Us7DpJPp
	3scncxJcDDj38mTZ+0+/XU2FmsRZfGkD3EIwkXCANpowoP8OZa8nTP94As1HKpu4BelhcKKBcRZ8t
	E28qWdPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmLp-0000000B7co-0xqB;
	Thu, 10 Jul 2025 08:09:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlUC-0000000Ay8W-43KK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 654026146A;
	Thu, 10 Jul 2025 07:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D15C4CEF6;
	Thu, 10 Jul 2025 07:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752131668;
	bh=tP+8bldkAQNqJdv4sqZNu7H5cEZhw5wYrPA9vUNr0mo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=sFiMwCD0Y2Z9UW0eLCtW626dxI748arN+PuRycIknSn+6NkgxZqVDaacCIVF/QlJK
	 OUIopgZEnY6OEBcGbsMJGQ8tU0kO1iUhRyoJ+bP+Pf8Id9qPHRGxh06RSS0VfbJlak
	 +lg50+GFgLIUfAyhSG9XGmvA8FGJO1o4Tpxl91RHewW22qA8KHtK7fmOkBUirI98Zn
	 7kJsOWH1URzv1l/RNa4CjJN54FX4KntaPz5wMOG+XbPwerR/y92+9+j1UZ0h5MhtKf
	 IVYhZ1Cpoi6D2IrEvMD2PcmnvXOaXP0Jl3aw7HcrZFDqLVyEgt1DiYpyLQR74uxzqq
	 zaijhGa6tO1VQ==
Message-ID: <64be94fba98675539bf02b1dc4c66e0d@kernel.org>
Date: Thu, 10 Jul 2025 07:14:23 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 6/9] drm/display: bridge_connector: use
 drm_bridge_is_last()
In-Reply-To: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-6-48920b9cf369@bootlin.com>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-6-48920b9cf369@bootlin.com>
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
Content-Transfer-Encoding: 7bit
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

On Wed, 9 Jul 2025 18:48:05 +0200, Luca Ceresoli wrote:
> Simplify code to know whether a bridge is the last in the chain by using
> drm_bridge_is_last().
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

