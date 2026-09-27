Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8F2CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 23:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAjSynU+95665o8oSfacZv2zmZI5BJAtMNHj4UJFGOA=; b=ENOmECj2+E8AJWokM6Wt3SUH17
	wxIUTUNExp6Sj7Orz4J+K95k2jqps8g6w5LacqfKJG92Z+eavRrBhLx98ML4+BvrQWqtq7g0Wo6Xx
	c2SSCsdQ0NkKYeZ5sXfv1eH/AWXxfBNuP1ic2fjrAVubEerROP8kBinS3/gfKx4d27X4Me+51YBvI
	wIpY5GQQIzKK6NzuRw+loShV+62saAqisprYKc3a17BudaXurKGSFFR1dSJSAifVVcfAyx0zlhKkU
	+fQ3Y2asaaBLLkcGIJV58zRpk/8R6C0/+eK18Fjoeq7ruTAQGJDujW76tDZo4Kxue2Xry19eG8uHT
	2hSLlPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAyd4-0000000H0rO-28ss;
	Sun, 27 Sep 2026 23:49:58 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAyd0-0000000H0pS-1na3;
	Sun, 27 Sep 2026 23:49:55 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1xAycu-000000000kh-3lEv;
	Sun, 27 Sep 2026 23:49:49 +0000
Date: Mon, 28 Sep 2026 00:49:45 +0100
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
	Hermes Wu <hermes.wu@ite.com.tw>,
	Allen Chen <allen.chen@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v8 02/14] drm/bridge: it6505: quiesce work items before
 powering off
Message-ID: <f9780400c44f9bb24754588503257d6dc86d3c77.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1790552614.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_164954_479778_448A84E0 
X-CRM114-Status: GOOD (  10.03  )
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

it6505_poweroff() asserts the reset line and disables the regulators
while link_works, hdcp_wait_ksv_list and hdcp_work may still be
running. The work items and the register accessors only check
it6505->powered, and the flag is cleared last, so a work item keeps
driving link training or HDCP authentication into a chip that is
already off until the flag catches up. Cancel the three work items
before touching the power rails. None of them takes a runtime PM
reference or extcon_lock, so the synchronous cancel is safe from
every context that powers the chip off.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Assisted-by: LLM
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v8: no changes

v7: new patch
---
 drivers/gpu/drm/bridge/ite-it6505.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index e980cc6d5760c..52d7d818a5ea3 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2804,6 +2804,9 @@ static int it6505_poweroff(struct it6505 *it6505)
 	}
 
 	disable_irq_nosync(it6505->irq);
+	cancel_work_sync(&it6505->link_works);
+	cancel_work_sync(&it6505->hdcp_wait_ksv_list);
+	cancel_delayed_work_sync(&it6505->hdcp_work);
 
 	if (pdata->gpiod_reset)
 		gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
-- 
2.55.0

