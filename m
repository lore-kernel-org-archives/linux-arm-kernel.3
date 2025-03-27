Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71889C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXUGkIG9qSC7lef7+AoZ7FyBZ5mgWE2JuikfNIBpo2Y=; b=egaOja17bapQ5kHkgUv2gP92wD
	1rEmWfko6p8iSkwj6xAl9Iz3yNzh9ATAdcYGxMIDpPODEcDCGpOg5152YRlCc9lJBd//t8GKj3Bk5
	C3gRMPRE7BhyiqbUAKcKgHUP3siqgfrgh9FaP9e8g1EWD9M6aLdSt+qMZiYQcfGD/592HLUcrUHWg
	lSc4BR6Dm+qC45hqk5druARn5NgKn+MyB7AopFeI0/s8QEnojp7ANMbV1R9PbLG8BfXDM0Bna3BwN
	Hd2JH4G4T3rzLLNHCFXqzcvRNDrO8g1Dho17L9NnbsYJRFfm4BjlsRXaoeZaDwSJ2Cqck+kIzTMsp
	6tv+s9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnao-0000000B7Mz-0DJ1;
	Thu, 27 Mar 2025 13:48:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnZ5-0000000B75z-13Tz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 13:46:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44C1F614B1;
	Thu, 27 Mar 2025 13:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2B5C4CEDD;
	Thu, 27 Mar 2025 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743083194;
	bh=fr5eXsH4ELM22q1VLft6cUDbRKWKY32EKB07b+nOwck=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=fPkC2YPUg6U1AWk9VoIftitF2W8fruvym/IKkmjX44261oCL16avJfPPvNR+jI5Tb
	 UsL2oVSbef3S+bgau3fT50BH6OGqrb5X6T/WYREVoCsx07BeG5G2xpqzjTbs5APdbZ
	 H9wMIkF+Fln42CnAhH4aP0Cb29myQ7YecUgJMKUMSz5HWB4SPP/8WBOMhfR3B3lAyn
	 VXzFJ1XllztFp7fpDSIpHm88cB2DdTHrgZadIz67ZmEsjW0PJ0h0IcWlDEhGWujPMU
	 np0GeMOYWCBV4qZDS3XQzG24ZbafxAmmjZeY6ETvZM/PBYbtHx9O6I3ZCoXAoj7pDM
	 6gVvqZ/3LM6zQ==
Message-ID: <cdf2955f1b9143566ba4eb7b87551441@kernel.org>
Date: Thu, 27 Mar 2025 13:46:31 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v9 3/5] drm/bridge: make devm_drm_bridge_alloc()
 mandatory for bridge allocation
In-Reply-To: <20250326-drm-bridge-refcount-v9-3-5e0661fe1f84@bootlin.com>
References: <20250326-drm-bridge-refcount-v9-3-5e0661fe1f84@bootlin.com>
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

On Wed, 26 Mar 2025 18:47:37 +0100, Luca Ceresoli wrote:
> All DRM bridges are now supposed to be allocated using
> devm_drm_bridge_alloc(), which is cleaner and necessary to support
> refcounting.
> 
> In the absence of a drm_bridge_init() or such initialization function,
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

