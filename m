Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FF9CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 20:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7IYL1pgjM3KN4/LrZAIitgGAICVxDY/o/Vd5ldE/rY=; b=KeA64bxWdJqvme3YmKq7fidB8K
	gj9vaSGtItp7vXoo9dSsh1SYoy1PMRWtkigUsLZvCMWROdi5groiyecF3ihK9tUB9Ee+Uz2NmvabP
	cfcLzDqeDecICchz5GIc4aTnCw/LyHM6fp/DMn4exC1Fpb0gV8O3WbgZTq8EK4UmmODPzvngPbgkd
	QKgK/RhH6+s/U8v0GNyy9r0ol1oQ5e/NRqlhKFSYLU9hQgcYTCpRTkcdwo2HwQELM4mYkORQLG4Yk
	Hpc8gumjoKxWXUyONcg3tFBsjys3jL3nW3F+h4GhYq8GBOmFApiz72Zd80uggzu7UxlnGO0QLdgMg
	0wQnu+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJe4e-0000000B5KU-4B5n;
	Thu, 13 Nov 2025 20:37:44 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJe4a-0000000B5Il-2pZb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 20:37:41 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763066258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h7IYL1pgjM3KN4/LrZAIitgGAICVxDY/o/Vd5ldE/rY=;
	b=Nw+bCFei5gtwCkmjhI1568AvJE36lyE7Ma5ND4beUS8rq3TCsZ8vVYJg4p+X+6A34JyE8D
	mcCa33NwIUP3Pm+aZGPB71KanfyzjtvXTkqpWkDgjoBHjqSHd3FzogdmKuafcCYHNpX4rY
	BsNicK/O220MIMu3kGQWWPbgVvh7edA=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Mike Looijmans <mike.looijmans@topic.nl>,
	David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 1/3] drm: zynqmp: Check property creation status
Date: Thu, 13 Nov 2025 15:37:12 -0500
Message-Id: <20251113203715.2768107-2-sean.anderson@linux.dev>
In-Reply-To: <20251113203715.2768107-1-sean.anderson@linux.dev>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_123740_879922_D2D3DF32 
X-CRM114-Status: UNSURE (   9.31  )
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

Make sure to return an error in the event that we can't create our
properties.

Fixes: 650f12042b85 ("drm: xlnx: zynqmp_dpsub: Add global alpha support")
Fixes: 8c772f0b2b8e ("drm: xlnx: zynqmp_dpsub: Expose plane ordering to userspace")

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 2bee0a2275ed..c80a2d4034f3 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -174,9 +174,15 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
 
 		drm_plane_helper_add(plane, &zynqmp_dpsub_plane_helper_funcs);
 
-		drm_plane_create_zpos_immutable_property(plane, i);
-		if (i == ZYNQMP_DPSUB_LAYER_GFX)
-			drm_plane_create_alpha_property(plane);
+		ret = drm_plane_create_zpos_immutable_property(plane, i);
+		if (ret)
+			return ret;
+
+		if (i == ZYNQMP_DPSUB_LAYER_GFX) {
+			ret = drm_plane_create_alpha_property(plane);
+			if (ret)
+				return ret;
+		}
 	}
 
 	return 0;
-- 
2.35.1.1320.gc452695387.dirty


