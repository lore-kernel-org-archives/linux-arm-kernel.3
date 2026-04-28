Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303A3FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zC9qQTBFGPhM9VVfZsMZPGt3T362foDJ1809S5lS0ys=; b=seTDVTi9npajC9GHU9LQMYWHpR
	gCWlsHbT/StqPXqO2TI9X7s4DYj+crB07F4hZiSR7d8W5t+mv8xKGS/qAk+D6HNUiySHaDSgz1L8J
	VTg5cdXlbzaTGIZ5UCqtglUB148SSVzz9brGuVH4g3ujuadLDJNjsSaJkb1XejAyE3KOA7BTars42
	1KWNuPGQTMrvuT2TqExZVHZ8ypNtwfX4vDGkpESuLzJOs4Q2NIwqWKvUbwdL0xjW+xPDXkyb+HjiR
	hj3ltVV9yd+Q1YEnjUsFgGMi0BKLY4HNGIcosD/WuNBeHBXTH5CyGCfF9KDhIbELV7EuMISt0HnpV
	QDcT2rxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnFt-000000025FQ-0we9;
	Tue, 28 Apr 2026 18:33:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnFp-000000025DV-0pxS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:33:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39B7661146;
	Tue, 28 Apr 2026 18:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F85C2BCB8;
	Tue, 28 Apr 2026 18:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777401231;
	bh=c4BcYMZ0KWMorH09+B5vNrAhFQ4rDIDYqWvY5VR5Gws=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PizZMWo5iF5mC7v77JX2jAYXoibEaCFXb9qH/C2ZiF7e2nBNkAFo137PUezHHAqZG
	 HWLqvgwuuQ7e2CK6X2b75VVmxpTVmXA9/pxWLASnmzN05XFINbsyP47f0TM77hYK51
	 lCC0/O20y4N9+YIDtzNJTnfFx5SS8FTfNT7gv0bEHmyomkCmLlzBSu3nu9R6vsEXFG
	 DQeMQZkLNgO+uynrqKl6xbVG1W7FEsfNbwK1at2qTvLYAtvpqRylboe741wp8cPtBU
	 CBXGIeZL9ioYF4WNDL7Yr4vlVAFB7G31XOVC4SS3ziycePGTWM0KwvK0iX/UyewmWW
	 h26+M4fWtjoIQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 28 Apr 2026 19:33:26 +0100
Subject: [PATCH v2 02/11] firmware: arm_ffa: Skip free_pages on RX buffer
 alloc failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-ffa_fixes-v2-2-8595ae450034@kernel.org>
References: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
In-Reply-To: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
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

If the RX buffer allocation fails in ffa_init(), the error path jumps to
free_pages even though no buffer has been allocated yet. Route that case
directly to free_drv_info so the cleanup path is only used after at
least one RX/TX buffer allocation has succeeded.

Fixes: 3bbfe9871005 ("firmware: arm_ffa: Add initial Arm FFA driver support")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index eb2782848283..e6a051b20cb7 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2067,7 +2067,7 @@ static int __init ffa_init(void)
 	drv_info->rx_buffer = alloc_pages_exact(rxtx_bufsz, GFP_KERNEL);
 	if (!drv_info->rx_buffer) {
 		ret = -ENOMEM;
-		goto free_pages;
+		goto free_drv_info;
 	}
 
 	drv_info->tx_buffer = alloc_pages_exact(rxtx_bufsz, GFP_KERNEL);

-- 
2.43.0


