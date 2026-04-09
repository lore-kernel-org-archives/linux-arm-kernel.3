Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD10F364A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 17:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ni70mQN+06B9PrFWju5Vc9jCJGly/AFJiVYl7kDxCyk=; b=uzzNUHurX/dEKlr+P+FdLhu3KW
	fSjGw8Elt87FxHXVq2JhygojOfunnh4gL248zToPW8si4CB1rgRlncfgzkQilXCtQyQ2Jm8WQcW9g
	M34A/Jf1tuTf8jRjofSWNqAvCU1fQEobdLyfAgU//GGanzRQsSHmRXnSFCH350isplfcTY3czI+tr
	Ie99tjoZCB710nvEbnvw3xo0U55QBGGC5dXPqRkSEXaSzz//BIim0PcLnTSt9u4OIWpN1kVfUnoJj
	xUEHWDsJC021nAolVnOxknbZYeGyZ4bSPLR+aH6cOHSKVY1ALBc/64GlqwQy2PGUI11mOYQaL6am1
	NgCYADMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAssN-0000000AydM-3vLv;
	Thu, 09 Apr 2026 17:09:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAssL-0000000AyZu-0fyx;
	Thu, 09 Apr 2026 17:09:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A08B41A324F;
	Thu,  9 Apr 2026 17:09:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E8D7603E4;
	Thu,  9 Apr 2026 17:09:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31D461045019C;
	Thu,  9 Apr 2026 19:08:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775754541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ni70mQN+06B9PrFWju5Vc9jCJGly/AFJiVYl7kDxCyk=;
	b=G+GjrKxfsxCSIWMIv+pwZvAagbcJbW9sMgZKMpbqpi3Zq5sFrJCjuNZ+bUlmD0zHIiUX6y
	8tm1vdGx6zVwq9775jZ5CXlTLM65igo19UXwJ65CFvWPVdJsXmGUSM33E9Rot3O0YQ9Ps+
	dkFawd9NFVZiT5xRQTCspEo7EYjHUlYopKFq5ublJE/7ECFUKchcdmq+k1wPtI6yxUvc9b
	le/PKC4/7QYmxbvSsfTA9lvy/4L2taX2/Cyy7m2430v4dJRR/Xn2f+HOAX5NWcVttAGqfC
	uQ6ToIINYfd0UoCfq2VBfq4GgnzXbOx8s45R4x86t0J8tQq+PKGPwPrQXXyZrA==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu, 09 Apr 2026 19:08:19 +0200
Subject: [PATCH RFC 03/12] drm/i915/display/intel_dp: Drop redundant
 intel_dp_aux_fini() on init failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-feat_link_cap-v1-3-7069e8199ce2@bootlin.com>
References: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
In-Reply-To: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>, 
 Jesse Barnes <jbarnes@virtuousgeek.org>, Eric Anholt <eric@anholt.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chris Wilson <chris@chris-wilson.co.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14-dev-d4707
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_100905_340645_C9458F90 
X-CRM114-Status: UNSURE (   9.98  )
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

intel_dp_aux_fini() is already invoked via intel_dp_encoder_flush_work()
in the encoder destroy path (intel_dp_encoder_destroy() and
intel_ddi_encoder_destroy()). Calling it explicitly when
intel_edp_init_connector() fails before jumping to the fail label
therefore results in a double invocation. Drop the redundant call.

Fixes: c191eca110a37 ("drm/i915: Move intel_connector->unregister to connector->early_unregister")
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4955bd8b11d7a..71f206adbebd3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7232,10 +7232,8 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 		connector->get_hw_state = intel_connector_get_hw_state;
 	connector->sync_state = intel_dp_connector_sync_state;
 
-	if (!intel_edp_init_connector(intel_dp, connector)) {
-		intel_dp_aux_fini(intel_dp);
+	if (!intel_edp_init_connector(intel_dp, connector))
 		goto fail;
-	}
 
 	intel_dp_set_source_rates(intel_dp);
 	intel_dp_set_common_rates(intel_dp);

-- 
2.43.0


