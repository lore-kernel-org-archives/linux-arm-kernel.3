Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23B3D73E83
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 18:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdyCIL4tTO3l5a0xb6nABmf6t3g2idn2qNISzBqXvJg=; b=IlBNVSP4ipJ3y7/95Mfi6U0S6x
	sC95aDDa4WDxsSU6nSqz0dLoCNk47wHdi6QdbF2z9ihyAT2Pf/K88mD5Dr53r3vJJDMVGiGi0Hqcn
	tz+W8ShHa2JBEAtdmFDevub24LO7Wo+fsJeQ1u57ACUyuIhl4wV/7wKAAKlA4AKmqVDrhpY3R3Mvk
	dkdw8V+9lngleMSHZp/Kt/5QuuTVgrmjyuY7GTkylhnBCstzfATNcB7cGeCfIddNGI4tUH/+WpxhO
	Gsq57HC2JBNnwR2ZXZxVRLHSSxQIqcJL/cq8pibzELyRdUA7wf0zJbcwtZhxiDl8tg5D3aQcViLxA
	J8Fg/HWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWO3-00000000Tyd-13nJ;
	Thu, 29 Jan 2026 18:05:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWNz-00000000TxH-2Jqy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 18:04:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C1DDD4E42326;
	Thu, 29 Jan 2026 18:04:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F79160746;
	Thu, 29 Jan 2026 18:04:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A92E9119A884E;
	Thu, 29 Jan 2026 19:04:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769709888; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YdyCIL4tTO3l5a0xb6nABmf6t3g2idn2qNISzBqXvJg=;
	b=OjdMXNxDEjl077eYMhx024SVe6ch2lgEMk0wnPOhlyyfFyQKkGVtNZiKVgwbMOSVLXz+fY
	RUslP7W0xxAQ1kkDfhb1hjzQZpYkLQDy5mJdX3YVxVaYX+GHCbgOBehBJ77ZLN30K0SAYx
	/1Vw2avqaY8Iz5i4Oo7z1LFUnRD6cR2Nt8/cDoPGnLzu3qJOryR6664kFV6LDxYpqtf1Ex
	Owur6zTJuZTm62MyG2LA6PnLwcrYn+s4uz5aAFE4k/S0cfXqLbLpcKFk5IAlKSCGZK/Dug
	Akv6UOHnk5hSwustUsUHvriB1yt8HATSnRSMb91zXNbkd7+/YUhcBuD/0G/TXQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
Subject: Re: (subset) [PATCH v4 0/4] drm/bridge: add
 of_drm_find_and_get_bridge() and a managed *next_bridge, deprecate
 of_drm_find_bridge()
Message-Id: <176970988019.344266.16426730696131836269.b4-ty@bootlin.com>
Date: Thu, 29 Jan 2026 19:04:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_100455_749386_25F872D7 
X-CRM114-Status: GOOD (  11.32  )
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


On Wed, 07 Jan 2026 10:56:25 +0100, Luca Ceresoli wrote:
> This v4 contains the leftovers of the v3 series that deprecated
> of_drm_find_bridge(), added a replacement which handles bridge refcounting,
> and converted some of the direct users. All patches have been applied
> except the imx8qxp-pixel-link ones, which still need a review for the first
> patch.
> 
> @Liu, patch 1 is waiting for a review and it's non-trivial, it would be
> nice if you could have a look at that one at least.
> 
> [...]

Applied, thanks!

[1/4] drm/bridge: imx8qxp-pixel-link: simplify logic to find next bridge
      commit: 96476ab8690290aa27084b12a481e48f3af7afb2
[2/4] drm/bridge: imx8qxp-pixel-link: simplify freeing of the remote device_node
      commit: 42bb487369e56f8f07c82ac11fe771ba2b70cd68
[3/4] drm/bridge: imx8qxp-pixel-link: imx8qxp_pixel_link_find_next_bridge: return int, not ERR_PTR
      commit: 4eda1d5fe99db2a71da0156387b7b69e8e0dc32f

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


