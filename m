Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4594BE7BDB8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 12:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HYMiqx/RmT20IeAzBLFZUcBMz2VWRZ6SMIiOSGNwMGk=; b=y9oIDLDZDoUEaC
	jIUPL6aziAYkjnGWKktJ8w0vLXk7RiqPy2grK/HjkaCSXlJHCozoPDs3pjMyrSJueLZCCPxWxzSyI
	QxIeVrlkHlrMF6Oeu/j4Cqbl/emxgr9vjGP0l7kczCnTgESHaRhYmHpoyk6ThIL+mXNd4pOWRlV8D
	Nk3RdfkOj1SF8zmo2mvVpqpwtch+JtvUKbni5Q+8daA7P5VWmg/WzUaq4TQ5VnHmh9G9rWkzdLQRV
	HIjIYpO1BKWJ4LWj4WgeG+VUW++ue75mBLFehCV+56pFQHAoPUkYEdajY4rif8PrpW4QfBeI11k6i
	ICmiSdOLMAJi7UgMkf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxy7-00000006Xji-2P2f;
	Mon, 16 Feb 2026 12:44:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxy2-00000006XhY-2KE4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 12:44:49 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vrxxo-0002kM-Fj; Mon, 16 Feb 2026 13:44:32 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 0/2] drm/imx: ipuv3-plane: support underlay plane
Date: Mon, 16 Feb 2026 13:44:29 +0100
Message-Id: <20260216-drm-imx-underlay-plane-v1-0-2dcbd1fd4ef5@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC0Rk2kC/x3MQQqEMAxA0atI1gZqlYJeZZhFbaIGtEqKooh3t
 7h8i/9vSKzCCbriBuVDkqwxoyoLCJOPI6NQNlhjnbGVQ9IFZTlxj8Q6+wu32UfGxpnQh5aoDh5
 yvCkPcn7j3/95Xnh548hoAAAA
X-Change-ID: 20260216-drm-imx-underlay-plane-460cbc9dd3ca
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_044446_595101_945B1513 
X-CRM114-Status: UNSURE (   9.09  )
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

The IPUv3 overlay plane may be placed over or under the primary plane.
This series allows user space tools to properly detect that the overlay
plane may be used as an underlay.

The first patch removes the assumption that the primary plane has the
default zpos 0 and the overlay plane has zpos 1. This allows changing
the zpos more freely.

The second patch changes the default zpos of the planes. The primary
plane always has the fixed zpos 1, which allows the overlay plane with
zpos 0 to 2 to be placed relative to this fixed primary plane.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Michael Tretter (2):
      drm/imx: ipuv3-plane: decouple zpos from plane type
      drm/imx: ipuv3-plane: support underlay plane

 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)
---
base-commit: 20e0c197802c545db220157fafd567a10f2b7672
change-id: 20260216-drm-imx-underlay-plane-460cbc9dd3ca

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>


