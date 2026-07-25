Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303EFC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 02:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLm4d/TVvuwb16r1sR8Shd6BupWV0jBF18YIlLBBXVw=; b=T/bCvkxyADpe64CtPse7Sj0I+J
	oojzQnVu0fjyAt4Uc3GgpIUyeOS6nThrVxztIuSAQA+FgmO1BVw0VHL3e0bTcSjFXUgfIB+kK2TMo
	RGJk+it+jZsohqfCvrEPJGt7we7SMf+QODtMHmFOP46+zLsWc0s68dwQ05NO1OsvC86Zpa1u/dN8u
	y9XTou1BH5UGQ54DEyAzRlTQEJuyJfNwXTeUx4tSWk9oEG/M/WJOWXrdI0zjeeG/C1VNhobFGqtf8
	wAfd/LthRsjPsiwDJ3/Kyv37obS3ZnJno7s8GqN/AtRnTmr2vt4xyJVRcB9hsfZwL+Dv2/kI1SOp+
	NgXXRk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSbV-0000000HVf0-2E0w;
	Sat, 25 Jul 2026 02:59:09 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSbT-0000000HVch-0KNg;
	Sat, 25 Jul 2026 02:59:08 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wnSbM-0000000031c-2iI1;
	Sat, 25 Jul 2026 02:59:00 +0000
Date: Sat, 25 Jul 2026 03:58:57 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Allen Chen <allen.chen@ite.com.tw>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v6 05/13] drm/bridge: it6505: bail out of the IRQ handler
 when status reads fail
Message-ID: <9f33511464953754eee9a5df141a38936f26bd26.1784947240.git.daniel@makrotopia.org>
References: <cover.1784947240.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784947240.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_195907_115779_C8A308A9 
X-CRM114-Status: GOOD (  11.02  )
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

When reading the interrupt status registers fails, the negative error
codes end up in int_status[], where it6505_test_bit() sees almost all
bits set: every interrupt sub-handler runs on garbage and the error
values are even written back to the status registers. Return IRQ_NONE
instead.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v6: no changes

v5: new patch

 drivers/gpu/drm/bridge/ite-it6505.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index fb6030a2c18c..3806b0b96637 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2714,6 +2714,11 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 	int_status[1] = it6505_read(it6505, INT_STATUS_02);
 	int_status[2] = it6505_read(it6505, INT_STATUS_03);
 
+	if (int_status[0] < 0 || int_status[1] < 0 || int_status[2] < 0) {
+		pm_runtime_put_sync(dev);
+		return IRQ_NONE;
+	}
+
 	it6505_write(it6505, INT_STATUS_01, int_status[0]);
 	it6505_write(it6505, INT_STATUS_02, int_status[1]);
 	it6505_write(it6505, INT_STATUS_03, int_status[2]);
-- 
2.55.0

