Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0171CD5826
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O03c43fGSEZQVQFtpxF/DS+c2fwG8qAt2Ztdrucq5N4=; b=MQV9suThggw5f7
	orSt2JEkDrY10pS21lY+j4HML8BbYi4ZIQoaNkRAU9r95cE6S/EoPMdLlUk2u2bwL/by73eykunyE
	AloK4185rBbN4A45Ug1q9wUgzNyL7R/qt15z5MKXjz1+YGqcVgYgEPyEIziCCaY55Qp6Wn09P83HY
	5IEbpdC1HsRp9MeNVI18DEX2gIS6L13z3KSM2knvh59YSQFHLjxvP2OuA7r5CO4HQoBFF4DEvimBS
	JoA2Xcx2AZic3eghyBm2Lj5CpRz8g+hl/xh/NOzJuFTDtZ0MDt3tCXpYDVWevvlokoFyjPKRypEpD
	YxYgpMUjYoGI8vKZCQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQI4-0000000EcBW-1PO1;
	Wed, 07 Jan 2026 09:57:20 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQHx-0000000Ec5s-1N5J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:57:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 88F14C1EC90;
	Wed,  7 Jan 2026 09:56:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0D83606F8;
	Wed,  7 Jan 2026 09:56:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD731103C86EC;
	Wed,  7 Jan 2026 10:56:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767779814; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=O03c43fGSEZQVQFtpxF/DS+c2fwG8qAt2Ztdrucq5N4=;
	b=ttIFfJExO8R0+j/MBjTDXlt5oCnOVH/dS3CH5t+Tm8HuEe72JjygFxkgrptLvYiaLQPzmc
	BoYNiCTleSaPninD3b+ypiOm2QAl/QEhgRAtT8xdaeR6iTX+jIYY7o6/QFUPNRCYd57eLr
	JI3Yobl7llt8iKmvlcQQnmCYuj6vcLKvK60+1q2Uati53oMgpeRBBGfJ5BF2jj5vjrbAt8
	YaGkNlkwclCfhQnnq/qZUm9EhPI0sCkfqdkkBbj2LQqBWreFgDvZWggdGH8PRDCHd5FNYZ
	oiqDWOVtWMzsarBt5Jd/dkxi9IGnIwiSM9Llgk4kXXgoNKKpmfbaSUXUmvhRkA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v4 0/4] drm/bridge: add of_drm_find_and_get_bridge() and a
 managed *next_bridge, deprecate of_drm_find_bridge()
Date: Wed, 07 Jan 2026 10:56:25 +0100
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMktXmkC/5XN0Q6CIBTG8VdpXEcDRMGueo/WHAjk2VQcmqs53
 z10tWpdefmds/3+E+ptANuj425CwY7Qg2/j4PsdKivVXi0GEzdihKWUUoFNaLAOYOJH1bUv8dU
 O3W1Y7oV3hYPWFK+/4DlJkkxwLg2KYBesg/saO1/irqAffHis7ZEu13cm35IZKSaYGJ1LJZzlg
 p+090MN7aH0DVpCI/vCmdyEs4hL6aSiRNhSsX88+eCMZpvwJOI6pVnqlJYklb/4PM9PvZGf7KA
 BAAA=
X-Change-ID: 20251117-drm-bridge-alloc-getput-drm_of_find_bridge-74903367448d
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_015714_950676_27122BFB 
X-CRM114-Status: GOOD (  13.24  )
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

This v4 contains the leftovers of the v3 series that deprecated
of_drm_find_bridge(), added a replacement which handles bridge refcounting,
and converted some of the direct users. All patches have been applied
except the imx8qxp-pixel-link ones, which still need a review for the first
patch.

@Liu, patch 1 is waiting for a review and it's non-trivial, it would be
nice if you could have a look at that one at least.

This is part of the work to support hotplug of DRM bridges. The grand plan
was discussed in [0].

Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges struct drm_bridge,
      based on devm_drm_bridge_alloc()
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. ➜ add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
       2. ✔ drm_bridge_get_prev_bridge() (v6.18)
       3. ✔ drm_bridge_get_next_bridge() (v6.19)
       4. ✔ drm_for_each_bridge_in_chain() (v6.19)
       5. ✔ drm_bridge_connector_init (v6.19)
       6. … protect encoder bridge chain with a mutex
       7. ➜ of_drm_find_bridge()
          a. ➜✔… add of_drm_get_bridge(), convert basic direct users
	         (v6.20?, one driver still pending)
	  b. convert other direct users
	  c. convert bridge-only drm_of_find_panel_or_bridge() users
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. … handle gracefully atomic updates during bridge removal
    A. ✔ Add drm_dev_enter/exit() to protect device resources (v6.20?)
    B. … protect private_obj removal from list
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. finish the hotplug bridge work, moving code to the core and potentially
    removing the hotplug-bridge itself (this needs to be clarified as
    points 1-3 are developed)

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v4:
- Added review trailers
- Link to v3: https://lore.kernel.org/r/20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com

Changes in v3:
- Completely rewrote using the __drm_bridge_free() idea to prevent
  use-after-free of the next_bridge for the common cases
- Added needed cleanups to the imx8qxp-pixel-link and imx8qxp-pxl2dpi
  drivers
- Removed various patches converting simple cases, to reduce the number of
  e-mails sent; will be moved to the follow-up series
- Link to v2: https://lore.kernel.org/r/20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com

Changes in v2:
- All patches: renamed drm_of_find_bridge() -> of_drm_get_bridge()
- Various fixes and improvements to patches 1-6, see individual patches
  changelog
- Removed bouncing recipient: Edmund Dea <edmund.j.dea@intel.com>
- Link to v1: https://lore.kernel.org/r/20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com

---
Luca Ceresoli (4):
      drm/bridge: imx8qxp-pixel-link: simplify logic to find next bridge
      drm/bridge: imx8qxp-pixel-link: simplify freeing of the remote device_node
      drm/bridge: imx8qxp-pixel-link: imx8qxp_pixel_link_find_next_bridge: return int, not ERR_PTR
      drm/bridge: imx8qxp-pixel-link: get/put the next bridge

 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 53 ++++++++++++-------------
 1 file changed, 25 insertions(+), 28 deletions(-)
---
base-commit: f12ad2e5233a1a30b3bd6fe1e784b3544caa2383
change-id: 20251117-drm-bridge-alloc-getput-drm_of_find_bridge-74903367448d

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


