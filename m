Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D921093177
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 06:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXInfPSwAGRRtB+ybyzTEt3gvSIjjBC1jeS0/7UiiIY=; b=b3V8QDFyxyDiGXYJhVoXvbtazM
	BmHo7UfTxqbQLVZVhuk1DwltjPPsuQPINF/zyZzeXu8qc5BbesFD/npsIysdbhURpDR4Byf1zGPiJ
	d2QJsDGpKuB6V0/L55iMHG8rvQNliZj0CFeIp8brVfTye/LlJCUCE/yIUkAUuIrxP7pPza1r/9Lvd
	qQ1ihhMnqJphRe7oWrtavG7AyzlTu1I1WbXwp6EMw92CuhS7+k3h5yCgcABf+mCMJlGrAvoLRkUqz
	yFvRzPjtcoDOH8iy4n0YFb337ppA2YVot7nfLwNzGU/vhZ0/nDroRdmG92UcuTzjE9RsV20B/mpOw
	fovi/jAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3SyW-0000000C8yK-1YLB;
	Fri, 20 Mar 2026 06:04:48 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3SyU-0000000C8xz-1VXe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 06:04:47 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id EF2D620B710C;
	Thu, 19 Mar 2026 23:04:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EF2D620B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773986686;
	bh=VXInfPSwAGRRtB+ybyzTEt3gvSIjjBC1jeS0/7UiiIY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nMvAdZMxtQl+dV2uHFrQSvxOd+oIf5Ub6RKPhxigQaMLVUaA+2ku3AGTFCSn71c8l
	 heKqlvvO+IS4cY3dGVNhZtf0vHQw0NYZ/SJeujdGlgOWeQ2Dxu6G6/nr5ms9LgJTzY
	 kPbTV6NDUwT78PruzFOCuPK58PHa0e4KOZ3DvcuI=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: ptsm@linux.microsoft.com,
	michal.simek@amd.com,
	jay.buddhabhatti@amd.com,
	marco.crivellari@suse.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] soc: xilinx: Shutdown and free rx mailbox channel
Date: Thu, 19 Mar 2026 23:04:45 -0700
Message-ID: <20260320060445.1541017-1-ptsm@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260320060306.1540928-1-ptsm@linux.microsoft.com>
References: <20260320060306.1540928-1-ptsm@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_230446_430853_3A5B6381 
X-CRM114-Status: GOOD (  11.45  )
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

A mbox rx channel is requested using mbox_request_channel_byname() in
probe. In remove callback, the rx mailbox channel is cleaned up when the
rx_chan is NULL due to incorrect condition check. The mailbox channel is
not shutdown and it can receive messages even after the device removal.
This leads to use after free. Also the channel resources are not freed.
Fix this by checking the rx_chan correctly.

Fixes: ffdbae28d9d1a ("drivers: soc: xilinx: Use mailbox IPI callback")
Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/soc/xilinx/zynqmp_power.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index 9dd938bd01d8..370e61ac47d8 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -389,8 +389,10 @@ static void zynqmp_pm_remove(struct platform_device *pdev)
 {
 	sysfs_remove_file(&pdev->dev.kobj, &dev_attr_suspend_mode.attr);
 
-	if (!rx_chan)
+	if (rx_chan) {
 		mbox_free_channel(rx_chan);
+		rx_chan = NULL;
+	}
 }
 
 static const struct of_device_id pm_of_match[] = {
-- 
2.49.0


