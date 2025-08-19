Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD369CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGALG2x3T//Hs0NSa99qVBWekgVznZxRh9n5n0vE+ME=; b=DtscwlZdUKZ7Kcpjf3DAZXnu9C
	ucKVJOpZL3oAN1bPwidfxVc+oPniWfW04x8/ZwFBaOtI+Z9eZQWg/OoRTRivHpz8sadsSuRs9gXSJ
	26o3PnqeNxklhDSfvbj6ji9SeEjrYvvi7GL4ggUkQKcX68STa6YbXngVkstAjmu4qkDxeYhKykIWx
	yVwNzvEvOZSDlQ+kS80TVC3Ye3eMJ2ueTAd5+Ydu6GnD+YKL0NUKlssCzGxHIPJZ8rUzm+Bn52ydk
	VRmZaeU6TKqetSUg3WipREFCybJ3lZPbGyNAudx6JvDrNrszcXJJg1F8LmAfSzV5Uh+ZDDn1B4oR1
	eaCNZ+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQrO-0000000BEbw-10KT;
	Tue, 19 Aug 2025 18:15:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMrW-0000000AgLw-3WUz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:58:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 359E36143C;
	Tue, 19 Aug 2025 13:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4CAC4CEF1;
	Tue, 19 Aug 2025 13:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755611932;
	bh=lGALG2x3T//Hs0NSa99qVBWekgVznZxRh9n5n0vE+ME=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=i3nxfmbWhXRRp9ugYwK2TdPPUdQf1WlzVb4O/5XokxjtTbmAJADofa8z96YOVWwxD
	 SYffRWoG7t6brh3eLfyZ+AGacdnSyolOLCvlE2dj60GHnbQMOfhg1pJp+Wsi1NAVDm
	 WeaNzcJIQRbHGz5DAE6HQGPEFvPmA1tOlaAnrAEntx3Tuvg40MBXDr/xlglec8sfPF
	 /XH80kCaKV7PNziV3N657nm6TldxWyjhjZh/xeoOAAI8ocjagPwi19/s+BLSVZzZa+
	 +E29gJTNyCbIbpnxirGn10W3/7dhW6vYTygKtvbvuX7k7pjLo4Nex4h1SIHktERV9u
	 ngB8pcTA0HvCg==
Message-ID: <078a95b5a85cbf73bcbeb9e110b2bac2@kernel.org>
Date: Tue, 19 Aug 2025 13:58:49 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 9/9] drm/imx: parallel-display: put the bridge
 returned by drm_bridge_get_next_bridge()
In-Reply-To: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-9-888912b0be13@bootlin.com>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-9-888912b0be13@bootlin.com>
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

On Fri, 1 Aug 2025 19:05:31 +0200, Luca Ceresoli wrote:
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

