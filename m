Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5AAE9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 11:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xjXmKu9xvf1FTFjgMYQ9ROjlvvidNcVSe5KX0OjU3U4=; b=3pXHrSgtNVb+fl
	KMAACRB39aalD2qKWrEsKlcPoJ6z0QHTSITka7fW14YvkE5D5K8UrVWzoF46xnFwtV0x+UuGAJduM
	4pqlmaJXDZ7+XRhHC7dghuLrl2UBedRl3dkQafIkjVQ1tLrX5JNl9RhBasd4R0MTQGrDsVaRizEyN
	ePm03zt5rJ8z8Ch1A8Unm3gXwGArFO1JLu9PlOjNVFF/nYvtk4T5eiv0OnL9IWJvCJd8eLnX/uXA8
	Mcb0x0Cj/L3lqA5Ae8J0z2GaPC+wsLrLCE3NMYdptg3vN8Uv3Ed9prPkgp0sfLSWK/cNewbvamUGL
	4QqCZUUNzRperBCRn/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2HO-0000000BHr2-16Zh;
	Thu, 19 Feb 2026 11:33:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2HJ-0000000BHpj-2jYE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 11:33:07 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vt2HH-0003qW-DF; Thu, 19 Feb 2026 12:33:03 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 0/2] drm/imx: ipuv3-plane: support underlay plane
Date: Thu, 19 Feb 2026 12:32:56 +0100
Message-Id: <20260219-drm-imx-underlay-plane-v2-0-26ef829c5483@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOj0lmkC/4WNQQqDMBBFryKz7pQktUK76j3ERcyMOqBREhVFv
 HtTL9Dle/DfPyByEI7wzg4IvEqU0ScwtwxcZ33LKJQYjDKFMrpACgPKsOHiiUNvd5x66xnzQrn
 avYgezkIaT4Eb2a5wWSXuJM5j2K+fVf/s3+SqUaEhV5NuKOfm+ZnYt8scRi/bnRiq8zy/6fhSE
 8EAAAA=
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
X-CRM114-CacheID: sfid-20260219_033305_714623_A4F51032 
X-CRM114-Status: GOOD (  10.55  )
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
Changes in v2:
- Simplify check for primary plane
- Rephrase commit message of Patch 2
- Link to v1: https://patch.msgid.link/20260216-drm-imx-underlay-plane-v1-0-2dcbd1fd4ef5@pengutronix.de

---
Michael Tretter (2):
      drm/imx: ipuv3-plane: decouple zpos from plane type
      drm/imx: ipuv3-plane: support underlay plane

 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)
---
base-commit: 20e0c197802c545db220157fafd567a10f2b7672
change-id: 20260216-drm-imx-underlay-plane-460cbc9dd3ca

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>


