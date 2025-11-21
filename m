Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C967DCFC265
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o/lLzSezw/M+eMWcWU6hW7O5912hnhJy/8GJLYTjBPM=; b=u8/9i8Qki9wQ36AIp639mhvEij
	3s222CKYJFI+VG80sHGe/gh9Mzi5Pprh729UfaUPeSe01e8LFhLHRRX9ZpbDoPd196dypFWuEEHB9
	qwZWgwX5XMOqfIRgdervzRQCQtReyUozq2aVRU9pFLV/1pHeD7Bt4hNbPXuH6lbTnTiUqz+mTacOv
	1dd7VIZlnDeLMxkgoCZf0MlyuhyW27sKULICZ8jXe/Bao6XRO0kGqsw738KahkGXocUv5SPXjSJaF
	nahhJ/uu5BPS4P2F33Rn56Z/4vy/FLSb+X4VNlxEOkcCJPRoMF7RhJpAr+QOQ607eNMKVgWvvjGbz
	74O/r/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMPgr-00000008KTZ-3aTu;
	Fri, 21 Nov 2025 11:52:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMPgq-00000008KSw-1rtY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 11:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9306560222;
	Fri, 21 Nov 2025 11:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47695C4CEF1;
	Fri, 21 Nov 2025 11:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763725955;
	bh=BjV9u6tBh3Z2pPD14LCQ3iw02Kr9iWTm3PzMnmvVkrU=;
	h=From:To:Cc:Subject:Date:From;
	b=qFBTkWLRoIpqVgOwHxQqW56VmN72uOuESojAKT2cZWZ4p0aitb48zzb51O4PIaXPU
	 laN8koIJ2NuID5qKNUVmoyx+yAhq5NKvEiCtBP3yxmfgwQ6iC/5D5aXQV9oydFY3XW
	 Y+tZ62NdIOpJdMHteJ5+B0VZjeG6CEhh49rrHTHi4IyQasafU3W8k973ScCSboaRCW
	 /Zo7pOAVypXve8r4TyNmooNPXTrSkiv35XbM5fGFDW0JbWBqEc0DDZ4kSM9wH4IMEg
	 Q7A1XU+pCsYII5ecVUSnk+A7L1bvP1ImrGaQNCK08ew9rGnmuBASmfmOmhCFLQb0ou
	 qgWo/usoYk7Qg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vMPgo-000000002DI-3sfX;
	Fri, 21 Nov 2025 12:52:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Besar Wicaksono <bwicaksono@nvidia.com>
Subject: [PATCH] perf/arm_cspmu: fix device leaks on module unload
Date: Fri, 21 Nov 2025 12:52:13 +0100
Message-ID: <20251121115213.8481-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Make sure to drop the references taken when looking up the backend
devices during vendor module unload.

Fixes: bfc653aa89cb ("perf: arm_cspmu: Separate Arm and vendor module")
Cc: stable@vger.kernel.org	# 6.7
Cc: Besar Wicaksono <bwicaksono@nvidia.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index efa9b229e701..e0d4293f06f9 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -1365,8 +1365,10 @@ void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match *impl_match)
 
 	/* Unbind the driver from all matching backend devices. */
 	while ((dev = driver_find_device(&arm_cspmu_driver.driver, NULL,
-			match, arm_cspmu_match_device)))
+			match, arm_cspmu_match_device))) {
 		device_release_driver(dev);
+		put_device(dev);
+	}
 
 	mutex_lock(&arm_cspmu_lock);
 
-- 
2.51.2


