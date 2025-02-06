Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CE0C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZK/bu+U+BunpfC6VHKB5s7S43oPvXJGJkXPxJV9DLc=; b=zCtiPjK7mJ7MVAYAeYO5vhP6mH
	icWd3GT2xtpiqCsZLV9RAKnOsW2EfnIF4iBXt3PnmfuGpOyJ2PAVbuRdJtzCy4uN11dIOmDdCa07S
	XqKmBAAXghgOjc8Dm3hCaHc0Qe8te0e99VSwJxC4jebGFe+Xs1qq3obFtuHUEyv9lDvhRGxTzse3/
	AIOv3eWYO+bIG2uOVwbywvc4MxX2NuwDJqDkBYsvG5q71dsSix5G11U8/DM2QiIbS0if+DTIMfh5l
	k2NggqOF1Jc4qwhPCqAXNOMj0CK34uYgljfdQ8VkffPYF0jsGyswnLakKEiomn5f7ZqsM4M5QvjyV
	eCZ4A2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7nq-00000007OJI-0K7p;
	Thu, 06 Feb 2025 19:44:46 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7lQ-00000007NyA-0Zwu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 19:42:17 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738870928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nZK/bu+U+BunpfC6VHKB5s7S43oPvXJGJkXPxJV9DLc=;
	b=GHa1uwp2L4ZpkRxR8aMWI3YDryRt/1t3jE/emX03upQMoAirq6MpvaHREEZiCsqLbA+B67
	x2k7uL+sLJD5CjAFi6jUGHbvz1bRPpxXy8e1lY/u8aOcpNr+xdRd152UPv1O0NoHVx5fx0
	kcePpf8A6GFUM+jpQrAa7pHiKpqa63k=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR XILINX)
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	David Airlie <airlied@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 1/2] drm: zynqmp_dp: Fix a deadlock in zynqmp_dp_ignore_hpd_set()
Date: Thu,  6 Feb 2025 14:41:18 -0500
Message-Id: <20250206194117.1496245-2-sean.anderson@linux.dev>
In-Reply-To: <20250206194117.1496245-1-sean.anderson@linux.dev>
References: <20250206194117.1496245-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_114216_315627_E5CAD0F2 
X-CRM114-Status: GOOD (  10.56  )
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

From: Bart Van Assche <bvanassche@acm.org>

Instead of attempting the same mutex twice, lock and unlock it.

This bug has been detected by the Clang thread-safety analyzer.

Cc: Sean Anderson <sean.anderson@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: 28edaacb821c ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Sean Anderson <sean.anderson@linux.dev>
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 979f6d3239ba..189a08cdc73c 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2295,7 +2295,7 @@ static int zynqmp_dp_ignore_hpd_set(void *data, u64 val)
 
 	mutex_lock(&dp->lock);
 	dp->ignore_hpd = val;
-	mutex_lock(&dp->lock);
+	mutex_unlock(&dp->lock);
 	return 0;
 }
 
-- 
2.35.1.1320.gc452695387.dirty


