Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA65BC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8mBeHfjSG+AR7A8Fp8QKLSrhvK7lhd1SXAkNAnYVLtw=; b=ifVfPE3ZQA2bFi
	3cv5xX1rWYEOblYR/s1BovitcT4KJPnSX1j+zWglx863b9PO8X41eHcqIRt1qKExyz1suWoTA6d1u
	IHRR/0qAOY5WzVmxKseebIIPfwYbQiFMq5IjqS0l9TkuE4jaUSt7ECK0goOsozmkuWb+QNqR7Rttn
	Wb8NzGfueUCvjSz6H1XhxlXHp3aJ3gC0CNLiXXSwSw6Y/2dGf6zmGpHeJ8RnRNd0c+1gxO7Zsoo22
	p8eNVYERUcpSFXpoNOhdJv74cLZls3lW+6qkQR8hFirwW9MclAnC2Z6CdsUYlGpSyp488BUvOMV3n
	5/BqoSOOmtgz1FKgO5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIMD-0000000Cbvq-1xSd;
	Thu, 20 Mar 2025 16:02:57 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvI2V-0000000CZCK-1A1M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:42:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACB0D44408;
	Thu, 20 Mar 2025 15:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742485352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8mBeHfjSG+AR7A8Fp8QKLSrhvK7lhd1SXAkNAnYVLtw=;
	b=m18W9V4w7yusNw0mo6qqU9toSKUuwPKXTEBs5rlqYEFiw4yzWXhSy1EChVjxOqiubNVJjD
	pAL2KTjUrvqX1tzM1/cEkI6ZOaVEzFJ8nBLpbpADeIq/6/Ayqk9wKswVouV6NfHHNExWw5
	qayfzfiglank6Q4uNeCYNi5MXslQnDXWuQwiX8kro0kwzD5xfvJiD3cAGAxZYzlZm0yrdf
	bpSLDnc2PkZg3S7s0PDz49uSDOtQWVhv1CP5JVL4RRDpf1Y7DKDC7Uipt3XcQ5jCAXwtJw
	SKvFr4HyEtnAily0Fp+lKUbE8CL0CNj3JiMEAoILcnAW1QOGAn0KrBOE9AgrmQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v8 0/5] drm/bridge: add devm_drm_bridge_alloc() with bridge
 refcount
Date: Thu, 20 Mar 2025 16:42:09 +0100
Message-Id: <20250320-drm-bridge-refcount-v8-0-b3ddaa9f1368@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFE33GcC/32NTQ7CIBCFr9LMWgzUUqgr72G6sPzYSSwYqETTc
 HfHHsDkbb75Mu9tkF1Cl+HcbJBcwYwxEOhDA2a+hbtjaImh5a3kJ9ExmxY2JbRkkvMmvsLKpLY
 DWYrvgT6fZPC9t15H4hnzGtNnHynqd/3fVxTjTMhWKuG16YfuMsW4PjAcTVxgrLV+AR1PxK24A
 AAA
X-Change-ID: 20250314-drm-bridge-refcount-58d9503503f6
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgieetkeekgfdtudevueffueffveekheeiudfhfedvhfeukeeuhffhtddtvdekfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedupdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsu
 hhsvgdruggvpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_084235_911960_48F24A4E 
X-CRM114-Status: GOOD (  12.49  )
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

This series improves the way DRM bridges are allocated and initialized and
makes them reference-counted. The goal of reference counting is to avoid
use-after-free by drivers which got a pointer to a bridge and keep it
stored and used even after the bridge has been deallocated.

The overall goal is supporting Linux devices with a DRM pipeline whose
final components can be hot-plugged and hot-unplugged, including one or
more bridges. For more details see the big picture [0].

DRM bridge drivers will have to be adapted to the new API -- the change is
trivial for most cases. This series converts two of them to serve as an
example. The remaining ones will be done as a follow-up after this first
part is merged.

After that, refcounting will have to be added on the two sides: all
functions returning a bridge pointer and all code obtaining such a
pointer. A few examples have been sent in v7 (link below), they are OK, but
I removed them from v8 because they must be merged only after converting
all bridges.

Here's the grand plan:

 A. add new alloc API and refcounting (this series, at least patches 1-3)
 B. after (A), convert all bridge drivers to new API
 C. after (A), add documentation and kunit tests
 D. after (B), add get/put to drm_bridge_add/remove() + attach/detech()
    (patches 3-4 in the v7 series)
 E. after (B), convert accessors (including patches 5-9 in the v7 series
    which convert drm_bridge_chain_get_first_bridge() and its users);
    this is a large work and can be done in chunks

Series layout:

 1. Add the new API and refcounting:

    drm/bridge: add devm_drm_bridge_alloc()
    drm/bridge: add support for refcounting
    drm/bridge: deprecate old-style bridge allocation

 2. convert a few bridge drivers (bridge providers) to the new API:

    drm/bridge: ti-sn65dsi83: use dynamic lifetime management
    drm/bridge: samsung-dsim: use dynamic lifetime management

[0] https://lore.kernel.org/dri-devel/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v8:
- Applied requested changes to patch 2
- Add R-by to other patches
- Removed v7 patches 3-9: they are OK but must wait until all bridge
  drivers are converted to the new API
- Added patch to deprecate old-style bridge allocation
- Link to v7: https://lore.kernel.org/r/20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com

---
Luca Ceresoli (5):
      drm/bridge: add devm_drm_bridge_alloc()
      drm/bridge: add support for refcounting
      drm/bridge: deprecate old-style bridge allocation
      drm/bridge: ti-sn65dsi83: use dynamic lifetime management
      drm/bridge: samsung-dsim: use dynamic lifetime management

 drivers/gpu/drm/bridge/samsung-dsim.c |  7 ++-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c |  7 ++-
 drivers/gpu/drm/drm_bridge.c          | 96 +++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h              | 36 +++++++++++++
 4 files changed, 138 insertions(+), 8 deletions(-)
---
base-commit: c940d00c7306a77ec293661abca634756207c885
change-id: 20250314-drm-bridge-refcount-58d9503503f6

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


