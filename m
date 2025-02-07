Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCE9C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sn0a84LV83FbtYgNJ4zSoh8nNRElw7Uji670f7zb7LM=; b=46Ckuc0yKBa20mh/8d858Rt+NP
	NszDDkjeQq14D8mWb4kmm5ovUcaCbrEMxXhL5PMBMsBhpKc+Czk6h4l8LieFxfsb1LAFkJgTZp/sE
	9mmuFkXIFtEk1q11pswL5vbjRaKoiH5ALLupX4HNG7VXObKc6OcY4m2pGq3lreWIjniienOOtMXl6
	fOiqRtCplKH0fXvYAA56chfyNZ1++/L8MJwUSb6bU3Np73044qDyNXcF1bSuPjIhNJlDK2SZJubLS
	sUQ9PRnGUG5Nd/Z2caiROAyASkcK50PDwVwCIzkGaxKSfENyyo6ljijuHuWevdubUsnIhLhWjCwby
	7vcfcGVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRDk-0000000AI1a-49y6;
	Fri, 07 Feb 2025 16:28:48 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRB2-0000000AH7H-15IS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 16:26:01 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738945558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sn0a84LV83FbtYgNJ4zSoh8nNRElw7Uji670f7zb7LM=;
	b=IsbGU1anshlM1CRTqZjHlSwaUX9IGhKzANB7px9fpOzmqY/osEQc8c2J4gKNuJQx8/vSx0
	ZVgRfZU61uhr4PISnxgcqNmgq6++91s8N09mxoJmiXTcYDc4ElzeXwRqoUX3TKK9xP84YW
	Xpr+4G4PddsdlaV3phQQK+jvN0OE/C0=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR XILINX)
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 1/2] drm: zynqmp_dp: Fix a deadlock in zynqmp_dp_ignore_hpd_set()
Date: Fri,  7 Feb 2025 11:25:27 -0500
Message-Id: <20250207162528.1651426-2-sean.anderson@linux.dev>
In-Reply-To: <20250207162528.1651426-1-sean.anderson@linux.dev>
References: <20250207162528.1651426-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_082600_447538_20BA9E1E 
X-CRM114-Status: GOOD (  10.06  )
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

(no changes since v1)

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


