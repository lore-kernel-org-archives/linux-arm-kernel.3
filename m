Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC331606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kRSIBBTO;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Ed37GiXq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bbhL5NLVy9Oz3kDCEpkXfrPMU8gaHJkfwTMkrmkXY+8=; b=kRSIBBTOy55/VMByL/qX4I0oGL
	ckcmuzaowpcAQAKgOeiR/fmBi+xsBqB+LfyrJ1SH1YFCddn+ftU3JQ5nQxhfo5JWiW4Lr2V7Hglss
	IcpXFQigVx3nLAaHg8LcU5+BtJE6R1NTsERWnYupl3xRtRV/V1B3C/Pp/CwdhGhprI+mcISaaad1W
	gdU0m8+yHPCayzoLBbyLEbAprdeZJdQOgM5akWGxakYtid/S/wPDSFOopliD8qxR7UygcgiIh5KPo
	q0MQ8M4jCARgjrVYhpYR9vZv5cr2YmoTtt48nQzkTcqkk4xLFDl07C4xK+s2SCOf1xIZWp8QgHS4h
	/fOumMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdof-00000004DRI-49nI;
	Tue, 27 Oct 2026 09:50:01 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdob-00000004DPQ-3Vnn;
	Tue, 27 Oct 2026 09:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Ed37GiXqwNsqzNpJ5CXcuYDUd57ahg06bDk5s54HCenDaLHn3s4ms1Eiiz9yJcRGOx+mqh5BbQCct
	 z0mBce5/wqHPSx3rru5d17/YNOU0Pjk5sf8U+Ul7UqxRmA58yrk2a0Zum6OTC5MOC9jjj9moVnuQTJ
	 dPTGVutrj95ReGU4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86ae073b6e77-f750e;
	Tue, 27 Oct 2026 17:49:44 +0800 (CST)
X-RM-TRANSID: 2ee86ae073b6e77-f750e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from FHA-W6400298 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96ae073b5bb3-d716d;
	Tue, 27 Oct 2026 17:49:44 +0800 (CST)
X-RM-TRANSID: 2ee96ae073b5bb3-d716d
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tangbin@cmss.chinamobile.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/mediatek: mtk_hdmi_v2: NULL check curr_conn in pre_enable
Date: Tue, 27 Oct 2026 17:49:41 +0800
Message-ID: <20261027094941.1862-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.52.0.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_024958_432801_6BC9B606 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_hdmi_v2_bridge_pre_enable() calls
drm_atomic_get_new_connector_state(state, hdmi->curr_conn) which
dereferences hdmi->curr_conn (via drm_connector_index) before the existing
WARN_ON(!conn_state) check. Add WARN_ON(!hdmi->curr_conn) first.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Cc: stable@vger.kernel.org
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index f0277fcf3..c94d22042 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1026,6 +1026,8 @@ static void mtk_hdmi_v2_bridge_pre_enable(struct drm_bridge *bridge,
 
 	/* Retrieve the connector through the atomic state */
 	hdmi->curr_conn = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (WARN_ON(!hdmi->curr_conn))
+		return;
 
 	conn_state = drm_atomic_get_new_connector_state(state, hdmi->curr_conn);
 	if (WARN_ON(!conn_state))
-- 
2.52.0.windows.1




