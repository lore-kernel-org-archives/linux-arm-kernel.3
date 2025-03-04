Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3758C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5gAf5SLEw4dUgSmxoKqRtnXWvjNEtDTG73YW3GckkDc=; b=jR+X4B9Kkk3W8IWJ6+gmLcozzd
	tuMNcjkETZ9/RYnfc6axcYw7Onip2uc6ce+cZzXyOHl5CGE2ItJ3sCII9nOIuz0u0VneGhuOB4QiF
	155i8+JWKHcrTCz9gQ3+Bgfi7+6DiLXHZMw60VTgryN/Gvs+M8AfrnM+sUDxFfUWzv5jVI1NoYKHh
	I6hGdBWPH5A3tR2SpI9JulrekK744wPKE5yyeXVk7wAJyaaCdyujf6Sdqz8taE0s6bw5xGpKJkciA
	uTmLW0+47hQDA5vR6t1ZWjfRNGWStecdcqqxsK6RUP/ZoiaUphi5vGYKq1kU+ypdmlnUphI+Sih4T
	azQUtX0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTXq-000000053Rw-0RI1;
	Tue, 04 Mar 2025 14:46:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTUt-000000052jm-2RAx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:43:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09F755C5CB4;
	Tue,  4 Mar 2025 14:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B20C4CEED;
	Tue,  4 Mar 2025 14:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741099430;
	bh=XfSqRqYZsA+MUDEbRTfs5BMwtTnxrzx+0E/tO5qxzN0=;
	h=From:To:Cc:Subject:Date:From;
	b=R5GulmQ+RL2iHOx2ATwQmKj/WdX6qgMFdeAbidKuBl8ZTCQo5UMrIKuC5y6h6MKMR
	 bTBnvkBtU6K0yzZoSrWrCm5SSduKh/c/mYh7xFrut/IOCCdEV8H8X20YyX0/NCtBU3
	 Mmq/613fgsVeVu52eMAUkHZ3g7THAsWyZlbf3wnKZOFG5rUgJHgjhwUzGvP1SylqDI
	 2guAncPF+1nBF1cjhjki7w9ebw/L5Rq/K7xBYc1Y//7cMDhwX2FyiBrrpidjA/2x5n
	 6ALc3bxyFvwHaibCCWfygsGYwxG2Bey40wnUrDu6v4eOZzlarpt9zG6PYnczEyDquj
	 smzsF8NIBm8Yg==
From: Arnd Bergmann <arnd@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: soc@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Luke Parkin <luke.parkin@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: use ioread64() instead of ioread64_hi_lo()
Date: Tue,  4 Mar 2025 15:43:34 +0100
Message-Id: <20250304144346.1025658-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_064351_673966_1F999947 
X-CRM114-Status: GOOD (  11.13  )
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

From: Arnd Bergmann <arnd@arndb.de>

The scmi_common_fastchannel_db_ring() function calls either ioread64()
or ioread64_hi_lo() depending on whether it is compiler for 32-bit
or 64-bit architectures.

The same logic is used to define ioread64() itself in the
linux/io-64-nonatomic-hi-lo.h header file, so the special case
is not really needed.

The behavior here should not change at all.

Fixes: 6f9ea4dabd2d ("firmware: arm_scmi: Generalize the fast channel support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/firmware/arm_scmi/driver.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 60050da54bf2..1c75a4c9c371 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1997,17 +1997,7 @@ static void scmi_common_fastchannel_db_ring(struct scmi_fc_db_info *db)
 	else if (db->width == 4)
 		SCMI_PROTO_FC_RING_DB(32);
 	else /* db->width == 8 */
-#ifdef CONFIG_64BIT
 		SCMI_PROTO_FC_RING_DB(64);
-#else
-	{
-		u64 val = 0;
-
-		if (db->mask)
-			val = ioread64_hi_lo(db->addr) & db->mask;
-		iowrite64_hi_lo(db->set | val, db->addr);
-	}
-#endif
 }
 
 /**
-- 
2.39.5


