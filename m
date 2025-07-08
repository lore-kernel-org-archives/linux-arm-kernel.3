Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45658C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XWn8tkHwi2RjacXnR5yqBza6YOAwtweEnReFLSISQuQ=; b=n8K3vgXN+KvoZm
	f+ov3hlX5+aeP3KTDn7PB+VzI+w/EDYMOjq+oS971KCR6lyvcaieVfpstNYLd4KGY9bwuL4PmPsvG
	2skyyFbHLM30oZPhQxGfit8vZuplUOsZCK10Ttbm8ouN4CN2VA/pCQcEZ2EfcaOVfqx/omKzqTKUr
	0gJgumAwGEJPwwPCQQP0Mx/fsCA795J0DGKDMT2A61opfYxW/LsNWzXZhxwW877CQBZXc4uHx6Nve
	/mR9SYEP8tVWxedHJxgiXwBEvXgFHKuECSnpkNlkEJ2CAuUtk3BOQ0LCfyvpWulZRi8HHAOLpsQxT
	ci7lAENhQ6Ctp0Kh8BkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZB8E-00000005xsl-0jbZ;
	Tue, 08 Jul 2025 16:25:22 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAZ0-00000005s16-0Meg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 15:48:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70DD7443EF;
	Tue,  8 Jul 2025 15:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751989735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XWn8tkHwi2RjacXnR5yqBza6YOAwtweEnReFLSISQuQ=;
	b=oBhuJmtJ5xhEbdeIypr91qJvt2On2vgRuZwdbfCFdHX8E21NImCwasafH3Ic5sF5gUGH1M
	9MRVNV02Shm1tV6GAp67qJ20zDqLQrwxSkcrCbHdpdDFsehwH6l6Z/PqmeiSzRgeOcdeJp
	877K0ROBsJacaH/u1cgdNiou01DuEXaM44Ohp/LcB+xBJkNl8ReCosv4LIfkCQ0UE+D3HQ
	cHdmvwGhG7z5rMl2zPz97nLh9Doq+vO7PBsyUFuqg92BJ2B+XmjFurUub9V5/zCSOoMKXw
	FNwbBIfH8W/AM5my+hRwt70sFoe5V02wr+EtXlF6Z0EqavLyT2PAzf/NTT661A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v9 0/5] drm/bridge: get/put the bridge returned by
 drm_bridge_chain_get_first_bridge()
Date: Tue, 08 Jul 2025 17:48:17 +0200
Message-Id: <20250708-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v9-0-db1ba3df7f58@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAME9bWgC/62OWwqDMBBFtyL5bkoaH2i/3EeRYF46oIkkqbSIe
 +9ou4R+nnOZuXcj0QQwkdyzjQSzQgTvEJpLRtTYu8FQ0MiEM16yijOqw0xlAI1JP01e0cGk5Zk
 OL75e4CE4gV5YCDH9NJUmb1RRcK10RfD/EoyF19n96JBHiMmH9zllrQ/7j9a1poyynN/qorSqt
 7KV3qcJ3FX5mXT7vn8ASntc5AQBAAA=
X-Change-ID: 20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-be39c442dcd6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefhedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeejhffgffelveehhfefudehtdeftdettdekgfekueeihedtieefudevjeffveegnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdhkvghrnhgvlhdrohhrghenucfkphepkeejrdduvddtrddvudekrddvtdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeejrdduvddtrddvudekrddvtdejpdhhvghloheplgduledvrdduieekrddurddufegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtt
 hhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_084858_413137_AF31D437 
X-CRM114-Status: UNSURE (   9.50  )
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

This series adds drm_bridge_get/put() calls for DRM bridges returned by
drm_bridge_chain_get_first_bridge().

All patches are Reviewed-by Maxime except patch 3.

This is part of the work towards removal of bridges from a still existing
DRM pipeline without use-after-free. The grand plan was discussed in [1].
Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges (struct drm_bridge)
    (based on devm_drm_bridge_alloc() [0])
    A. ✔ add new alloc API and refcounting (in v6.16-rc1)
    B. ✔ convert all bridge drivers to new API (now in drm-misc-next)
    C. ✔ kunit tests (now in drm-misc-next)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (now in drm-misc-next)
    E. ➜ add get/put on drm_bridge accessors
       1. ➜ drm_bridge_chain_get_first_bridge() + add a cleanup action (this series)
       2. drm_bridge_chain_get_last_bridge()
       3. drm_bridge_get_prev_bridge()
       4. drm_bridge_get_next_bridge()
       5. drm_for_each_bridge_in_chain()
       6. drm_bridge_connector_init
       7. of_drm_find_bridge
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
    F. debugfs improvements
 2. handle gracefully atomic updates during bridge removal
 3. … avoid DSI host drivers to have dangling pointers to DSI devices
 4. finish the hotplug bridge work, removing the "always-disconnected"
    connector, moving code to the core and potentially removing the
    hotplug-bridge itself (this needs to be clarified as points 1-3 are
    developed)

All the patches in this series have already been sent as part of the larger
"[PATCH v7 00/11] drm/bridge: add devm_drm_bridge_alloc() with bridge
refcount" series [2], hence the v9 number. They have all been Reviewed-by
Maxime too, however they could not be applied at that time, awaiting the
conversion of all bridge drivers to devm_drm_bridge_alloc(), now done (item
1.A).

I'm resending all patches to give them visibility now that they are ready
to be applied.

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
[1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/t/#u
[2] https://lore.kernel.org/all/20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v9:
- Small improvement to patch 3
- Link to v8: https://lore.kernel.org/r/20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com

Changes in v8:
- rebased on current drm-misc-next
- Patch 4: reworked based on current code
- Link to v7: https://lore.kernel.org/all/20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com/

---
Luca Ceresoli (5):
      drm/bridge: add a cleanup action for scope-based drm_bridge_put() invocation
      drm/bridge: get the bridge returned by drm_bridge_chain_get_first_bridge()
      drm/mxsfb: put the bridge returned by drm_bridge_chain_get_first_bridge()
      drm/atomic-helper: put the bridge returned by drm_bridge_chain_get_first_bridge()
      drm/probe-helper: put the bridge returned by drm_bridge_chain_get_first_bridge()

 drivers/gpu/drm/drm_atomic_helper.c |  7 +++++++
 drivers/gpu/drm/drm_probe_helper.c  |  1 +
 drivers/gpu/drm/mxsfb/lcdif_kms.c   |  4 ++--
 include/drm/drm_bridge.h            | 11 +++++++++--
 4 files changed, 19 insertions(+), 4 deletions(-)
---
base-commit: e21354aea4b4420b53c44e36828607a7c94a994c
change-id: 20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-be39c442dcd6

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


