Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65FFFF8878
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6LloFO7MTPGUP1y+mw9HTmRjn9wbMnzXxOm9wMy/Wc=; b=kSIqb1kvveMLPIjIHynVM9Pisf
	rhYIq/XLero0DmLtsyRatTxG6VM4qXAMpdbsvFZ4kjuGIIYS5uuDvmn38d8e8u1JO+57IjVJASFUw
	+17EkweNAWoH+Lu5SLzpcjFi//8QVe2eElvT3F3HuO7PvEIEo6P77agsLKkUUIHA3y08N63y/s8Ou
	cPjTJKk7fHEdpYyb2/G7z4SIquxForZ3dBNEOteiVfNCXJVVtcKM72NxIIExNPpOPF/WQI7zFTPUU
	eeUp0HCZdq410UQqwbQvPuLMunOEzH+PZxu4YCBthQyLKCQ1hs53j80qb8GsjM0gJpOyKDnJ89RNQ
	+sPlg+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnG2-000000025MA-2Gt3;
	Tue, 28 Apr 2026 18:34:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnFw-000000025Ft-0GQs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:34:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECD91417F2;
	Tue, 28 Apr 2026 18:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7B5C4AF09;
	Tue, 28 Apr 2026 18:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777401239;
	bh=glclu19M+ae3lxxFIpyNkrMWO2EeTxJY2bLvze3ItMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lQa1Y+IXQW6XtGnsJPHuWIf2nBxsh/1yj3srE/jhY54PyKn0clyUnlNa2Kp+VFbfS
	 aGoQR8m6UoiLQE6JF5EBn5N6ZG8rVsEMTsSHqyiGs4497sjVnE5uRxc7CAu96vwX4T
	 vFNcJRrh/Ft8w1rlh+Bp5NvFnSYKbhCVEzRbClz3AbUd7JkmqN5223RuQC/orNrpim
	 vwh8dD7m/KxwVVvEYoSn4DaRtWx4GJhcNriBVdmmNAw8X4dF5RHR6uATFYQYwUho8U
	 XTlNq2b3hUdh5FFXF7a8tyXDePoxoEsZB/W9406igqlg9jgiHopvs3PbUgTTCTsiUJ
	 4um1wuvjeBKvg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 28 Apr 2026 19:33:33 +0100
Subject: [PATCH v2 09/11] firmware: arm_ffa: Align RxTx buffer size before
 mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-ffa_fixes-v2-9-8595ae450034@kernel.org>
References: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
In-Reply-To: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Sebastian Ene <sebastianene@google.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_113400_135668_C91864B6 
X-CRM114-Status: GOOD (  11.95  )
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

Commit 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during
RXTX_MAP") advertises PAGE_ALIGN(rxtx_bufsz) to firmware when mapping the
buffers but the driver continues to stores the minimum FF-A buffer size
in drv_info->rxtx_bufsz which is used elsewhere in the driver.

Align the size before storing it so that the allocation, validation and
FFA_RXTX_MAP all use the same buffer size.

Fixes: 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during RXTX_MAP")
Cc: Sebastian Ene <sebastianene@google.com>
Link: https://sashiko.dev/#/patchset/20260402113939.930221-1-sebastianene@google.com
Reviewed-by: Sebastian Ene <sebastianene@google.com>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 4944aa6b815f..9181cc752ce1 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2111,6 +2111,7 @@ static int __init ffa_init(void)
 			rxtx_bufsz = SZ_4K;
 	}
 
+	rxtx_bufsz = PAGE_ALIGN(rxtx_bufsz);
 	drv_info->rxtx_bufsz = rxtx_bufsz;
 	drv_info->rx_buffer = alloc_pages_exact(rxtx_bufsz, GFP_KERNEL);
 	if (!drv_info->rx_buffer) {
@@ -2126,7 +2127,7 @@ static int __init ffa_init(void)
 
 	ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
 			   virt_to_phys(drv_info->rx_buffer),
-			   PAGE_ALIGN(rxtx_bufsz) / FFA_PAGE_SIZE);
+			   rxtx_bufsz / FFA_PAGE_SIZE);
 	if (ret) {
 		pr_err("failed to register FFA RxTx buffers\n");
 		goto free_pages;

-- 
2.43.0


