Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B9C10FC465
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 02:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y/Vs+lajGNLuHVTZi9YuxQObAJW7yBV0C3O93uFX/q8=; b=IAW5bVbsDjR1Cw1aW5CBQhnyQb
	UacOlAcJ+OjSeyQ21ofIaQU40Xgshicyw9SNZ+q2kObEI/3AS1CHQnWYhtouDZcncNFSMAlcEYwJ9
	WyIEZ+NO9+1cVA5Z6PkEsIOX9YIFuk3/SL6Lta4BpRccFq3yUFVPi69qF2WwR4N6EBn0aH87o4g/5
	kSrhq+c+TVHk8+ZDKwML3XCBCMmo+kBq/56szm86jvCeUdNAN+4LUhB5+2YN+wDmfG3ojXhDCIctG
	tFhkkUPHcX0GtYHccrDrAdwuNlsN30Xsw9eDGfymBpOo37kjwltxZd1jOnnvQFgzscY0Gx5nis6B7
	YLSDwvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAfSn-00000009d2B-30Ga;
	Thu, 09 Apr 2026 02:49:49 +0000
Received: from [2a00:f820:417:0:178:251:229:89] (helo=mx.nabladev.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAfSk-00000009d1h-1n6L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 02:49:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9084D11276A;
	Thu,  9 Apr 2026 04:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775702977; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Y/Vs+lajGNLuHVTZi9YuxQObAJW7yBV0C3O93uFX/q8=;
	b=fbd4W5wCyZNMs4RQdmQV/nWZ2NrK4FZ9nr5hlDhgtMMdsQCYm4IE3dhIv+WqKy056IZ+3m
	XRfHE9ZwPjNhSG9Kd9BNJ5kkzrqMulsMJ5Sb+pSFKp4xbG6YHzeRnwJgzY1/DuqNUTLVXD
	0JmR4dqn3ZyP+R0Cg4nlY+SC4t7k5CUVa8LVvKNWVaKslG9Vn05rwD8QhH87FnVXv1H2s2
	i2Aa5GoPBPOqJPHPVSbIkDe1nWA0+jQwLox3uKzdpFRMoBNqcydS3SSrScQ4dGuV7k1vrt
	IFCNbBEYNo/orIfYT0YIpIYSVmzkcU+MboZdVnhpjVM9AsCwH8KOFs/nqg0VoQ==
From: Marek Vasut <marex@nabladev.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] drm/bridge: stm_lvds: Do not fail atomic_check on disabled connector
Date: Thu,  9 Apr 2026 04:48:41 +0200
Message-ID: <20260409024928.344010-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_194946_705249_AD617E20 
X-CRM114-Status: GOOD (  11.86  )
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

If the connector is disabled, the new connector state has .crtc field
set to NULL and there is nothing more to validate after that point.
The .crtc field being NULL is not an error. Test for .crtc being NULL,
and if it is NULL, exit early with return 0.

This fixes a failure in suspend/resume path, where the connector is
already disabled, but .atomic_check is called, fails, returns -EINVAL
and blocks the suspend entry.

Fixes: aca1cbc1c986 ("drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/gpu/drm/stm/lvds.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index fe38c0984b2b5..25e2ba98f36ae 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -897,14 +897,14 @@ static int lvds_connector_atomic_check(struct drm_connector *connector,
 	if (!conn_state)
 		return -EINVAL;
 
+	if (!conn_state->crtc)
+		return 0;
+
 	if (list_empty(&connector->modes)) {
 		drm_dbg(connector->dev, "connector: empty modes list\n");
 		return -EINVAL;
 	}
 
-	if (!conn_state->crtc)
-		return -EINVAL;
-
 	panel_mode = list_first_entry(&connector->modes,
 				      struct drm_display_mode, head);
 
-- 
2.53.0


