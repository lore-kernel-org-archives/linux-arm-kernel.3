Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1EBC44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oDA5m5xsSRPDpyQ8/0uzYVtn++XBIRfyElhKzpi8oc=; b=3qcuXAU4oqEziweny/XgOGQHt3
	zNkZZnEaOV2HKw65ipDVnSd2LQmb3/TjBxu3rQDjB2bZ5KCbiKBcLIjzJJyXtyTRQspcMh2q1J37I
	JpPkDca5SAoDIKyqrzwzJdnj7QHhcrL3AETKsQrnchu8JxCkgq8djNPorlNANb/f0ltx7G3P54Kp+
	jNWK2dlB+SDY0etMUZs0IJvU7XGWPsG+OUPZsPGjoORPwMk7PJtAKbC42fCMIFph5/l/9qWRL2wXV
	keY0qH8s4LxU5UmxENlvXwZ1aavqrLoUT5yeQTmbhyfjK7gFdUzyFKz4GuDoUODHJB4fkSJHelBK5
	9JgvpFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzO-00000002BDr-1GPD;
	Thu, 09 Jul 2026 11:32:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmz7-00000002Apq-1wWY;
	Thu, 09 Jul 2026 11:32:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783596719;
	bh=+4IxEI1iwggfoTrsvZ7tlp4NbQe+d8nHT1G1ctZjbs8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YzwRWpwxiLgAsdqpQa6L5OnLYFvCpGYwUGvUJ8bwbMfXlmVVjE0QVknqu3ecceOYE
	 6v0JVleXa2OJrWjfVXFvY8bIDkNcOiJ3haTneB6pC8xF3LkdOm0RUI3KAGzDl+j6ll
	 g+F6+G8uvt9oLWp3R/h/0J6gSZALFclvWyzTFEZG4qu9jxtdqJz3EmyH0yHdLA1GOu
	 DzLGr+55xxu13VVMwMx6cVUwZf7PcUuYB2PJv8012uZbDZHeIMLrpE6iorFzUM5G6/
	 uie20jdQAt/5IMB/cnfAjPJUqVNcsjYC7QkiZRL0kLfsF5VXpityCxYT4yL8Xpyoc5
	 r0UXKLGM1Dy7Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4174417E0DFB;
	Thu, 09 Jul 2026 13:31:58 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	dmitry.osipenko@collabora.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v4 05/12] drm/mediatek: mtk_dp: Clarify SMC eDP/DP video unmute commands
Date: Thu,  9 Jul 2026 13:31:41 +0200
Message-ID: <20260709113148.49090-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
References: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_043205_764823_63D508A0 
X-CRM114-Status: UNSURE (   9.84  )
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

The eDP/DP video unmute commands are not expressed as bits:
instead, in the firmware, those are defined as incremental
unsigned integer numbers: use the correct representation of
those to improve readability.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 8399a6b41168..b50264ca1f31 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -36,8 +36,8 @@
 #include "mtk_dp_reg.h"
 
 #define MTK_DP_SIP_CONTROL_AARCH32	MTK_SIP_SMC_CMD(0x523)
-#define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE	(BIT(0) | BIT(5))
-#define MTK_DP_SIP_ATF_VIDEO_UNMUTE	BIT(5)
+#define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE	33
+#define MTK_DP_SIP_ATF_VIDEO_UNMUTE	32
 
 #define MTK_DP_THREAD_CABLE_STATE_CHG	BIT(0)
 #define MTK_DP_THREAD_HPD_EVENT		BIT(1)
-- 
2.54.0


