Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA153CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F4XxJijc9G+DqADHrTsE0EK90ox3NJR/ju9bW0nPza0=; b=01yzzaREDwxMwi972jHXc0W6qh
	DfstevEgz24Ayd94Meyqdv4jPHEqYb43/5atjUAP6kkP0nXXdU+PBladVxJuWpmvyDVF3Jrig/AQC
	L4YvQl1ep3jKuPbsxE0cuBdy4rgh/zQqvj1xOyHTDy9AesDpnbH+ENxYClRkLj3BWhLAEpo5Si4DV
	RoVdYg0tdoqzn5QDHRwETiCmZAmBNGfgXNndq4P6tKm+FTaMv/pKmyFj0FT0o/CuSGBWhiWz/Cc+f
	8dPO2GWtCSMENomvIu0Izm295oa0/1lD1I28V6O29erPgbWMdFWgVDlLLWDX8wJqG/yjolB/3l6x2
	q8mCjtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWuI-00000003WP7-27X2;
	Tue, 29 Sep 2026 12:26:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWuI-00000003WOn-0OC3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:26:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 58F3E439CF;
	Tue, 29 Sep 2026 12:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B401F000FF;
	Tue, 29 Sep 2026 12:25:59 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: arm_scmi: Update ARM_SCMI_HAVE_TRANSPORT rationale
Date: Tue, 29 Sep 2026 14:25:56 +0200
Message-ID: <48c4bed8036dcb55f554f513ce2ae61807c5677d.1790684637.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

Not enabling any transports no longer breaks the build.

Fixes: c0397c85b53d0bc6 ("firmware: arm_scmi: Use WARN_ON() to check configured transports")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Perhaps ARM_SCMI_HAVE_TRANSPORT and the WARN_ON() in scmi_driver_init()
should just be removed? See also commit fc789363c9f095ed ("firmware:
arm_scmi: Remove legacy transport-layer code").
---
 drivers/firmware/arm_scmi/transports/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/transports/Kconfig b/drivers/firmware/arm_scmi/transports/Kconfig
index 0e34fbf250532327..6ba0dcb86204d7e9 100644
--- a/drivers/firmware/arm_scmi/transports/Kconfig
+++ b/drivers/firmware/arm_scmi/transports/Kconfig
@@ -5,7 +5,7 @@ config ARM_SCMI_HAVE_TRANSPORT
 	bool
 	help
 	  This declares whether at least one SCMI transport has been configured.
-	  Used to trigger a build bug when trying to build SCMI without any
+	  Used to trigger a runtime warning when enabling SCMI without any
 	  configured transport.
 
 config ARM_SCMI_HAVE_SHMEM
-- 
2.43.0


