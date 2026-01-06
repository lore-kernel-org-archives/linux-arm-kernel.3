Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A473CE9D7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkZs5zdh+IB8LwYC9eN3BRgGph4b858iwLQZ9mtjEw0=; b=plUBwh7uYhWrDoR0freDm+WcFG
	03e91k5rltAs/fQiEeqG4Y+fXs+P5U8UAIYHRDpWl+LmbWNJpTN8FsguIwny+d0w27lDuB/aRGown
	ITMsWNNmcDSBiz4pdom8reImE4W/JJ7O2Ws9bdhQlf7Zkrlh74GAB+mX/7u2fGZy9VeP6jvwAz1Vi
	yqPEtsA29Ro1y2Dvs8F5CKtOfr6z6Eo1Tfxawc6jmJyXKlznC/OoYhxhxxklJbE1MGb1J/a6gdmLM
	xog+tgJh7GS6w3Yym5ESalOOlgqUelRH++tWu4Fu47wyLbo7y/pKVowMZ4pfn7Tmd8UxBMtVCSEto
	cdq3olyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA9M-0000000DVxR-1jHK;
	Tue, 06 Jan 2026 16:43:16 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA9J-0000000DVvH-2mZ0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:43:15 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767717790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NkZs5zdh+IB8LwYC9eN3BRgGph4b858iwLQZ9mtjEw0=;
	b=QlTkB4ctl3Lk0JPk81oKR5iSzGxZW6KC9kuKtr3fVp0v+CQs0/y5iLS72FMldN2n3pHMdL
	nn69V2rcdReXOmRpOgbJgGFsHnF05pmgFzmCHd5iGVYjhZfeHFSu6vsIEK5eFEPzi1CBNi
	scXS28HikHVHZfRIKuC5Jwzfu43KmCE=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 2/4] drm: zynqmp: Check property creation status
Date: Tue,  6 Jan 2026 11:42:45 -0500
Message-Id: <20260106164247.472544-3-sean.anderson@linux.dev>
In-Reply-To: <20260106164247.472544-1-sean.anderson@linux.dev>
References: <20260106164247.472544-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084313_838415_ED5E8285 
X-CRM114-Status: GOOD (  10.16  )
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
Reviewed-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v1)

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 02f3a7d78cf8..816bea4ea986 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -175,9 +175,15 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
 
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


