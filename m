Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819ABCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 09:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGKzWf+IggAIyFqPlXrr+f/Do4zgUMe2dKKFWQ+E5PY=; b=ACZk8mo37TIAdkD2C9PCeWJwSg
	B8IRhBBTRoVxOHt8WSBmG98vNgfOIDrWfcKVd0E2g147iKt7HtduMyRm5ftAsVLfoB2L4sgKsjsCQ
	mD98EqV7Fhgqa2QsvEpTbCpA5LQNk5JZZo7JhiwIaLgDaPaeqKHL/J6TEOLejoC/9zYC9aoUh3DYn
	bexXHwhvXg+LncHHmo06R4LDyYnbsQqtd6W5xSbE66s6+ZPS8CJ8VD4Hb7YYS86mh4QWtCf9IDV8f
	MiYv+v/80H+d1SdpDoYHXVbNpkKddSi71QEDwPzIH5mCgDhe6KkPQEYvNjpDCek7BjkSUzr2/2f+A
	7Fv2kU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOujE-0000000F7Jn-281x;
	Mon, 18 May 2026 09:57:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOujD-0000000F7Iw-0tfy
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 09:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CGKzWf+IggAIyFqPlXrr+f/Do4zgUMe2dKKFWQ+E5PY=; b=qg35Vb9ys2stUYnhjl/9QBT10F
	0IFfvT003FZ0RAvgJKkOn3vCwQy1KWuXzVxVPduWCDTYmcwIcRT51LkcZAQ0swf3aXKM17zaB2Z5E
	+0eDCx7lxhQ9BG7RvnPu9F8pDD7UW+BF/mGPIwJHOBf2tzNw5we/JzvNvZAVfEM8RjTKb6IR6JeNz
	MxkKN/KYmYlh4VlmVJrWbjkXsOUMcKTPWoW1hUTUo/Pv8RmBU8cfTNTQ7mtwl2qTaKkHOSclMMoQi
	1qQHXJEhmOq6d/4SEsvZ9OkffGHKD3a2HNxOdxl1DrPIPCB6PdsGUhvd29ZaV1clRVVzv0Zs2fddG
	9y/d+i2A==;
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuj8-0000000AfBu-1l5f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 09:57:37 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 18 May
 2026 17:57:08 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 18 May 2026 17:57:08 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <clg@kaod.org>, <broonie@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
CC: kernel test robot <lkp@intel.com>
Subject: [PATCH] spi: aspeed: Replace VLA parameter with flat pointer in calibration helper
Date: Mon, 18 May 2026 17:57:08 +0800
Message-ID: <20260518095708.2502537-3-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518095708.2502537-1-chin-ting_kuo@aspeedtech.com>
References: <20260518095708.2502537-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_105734_943351_B8B30EB0 
X-CRM114-Status: GOOD (  10.80  )
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

aspeed_spi_ast2600_optimized_timing() declared its buffer argument as a
variable-length array parameter (u8 buf[rows][cols]), which causes a
sparse warning. Replace the VLA parameter with a plain u8 * and compute
the 2-D index manually. The corresponding call site is also updated.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605180441.uD3toFRJ-lkp@intel.com/
Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 808659a1f460..c5275700de3d 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -1467,8 +1467,7 @@ static int aspeed_spi_do_calibration(struct aspeed_spi_chip *chip)
  * must contains the highest number of consecutive "pass"
  * results and not span across multiple rows.
  */
-static u32 aspeed_spi_ast2600_optimized_timing(u32 rows, u32 cols,
-					       u8 buf[rows][cols])
+static u32 aspeed_spi_ast2600_optimized_timing(u32 rows, u32 cols, u8 *buf)
 {
 	int r = 0, c = 0;
 	int max = 0;
@@ -1478,7 +1477,7 @@ static u32 aspeed_spi_ast2600_optimized_timing(u32 rows, u32 cols,
 		for (j = 0; j < cols;) {
 			int k = j;
 
-			while (k < cols && buf[i][k])
+			while (k < cols && buf[i * cols + k])
 				k++;
 
 			if (k - j > max) {
@@ -1541,7 +1540,7 @@ static int aspeed_spi_ast2600_calibrate(struct aspeed_spi_chip *chip, u32 hdiv,
 		}
 	}
 
-	calib_point = aspeed_spi_ast2600_optimized_timing(6, 17, calib_res);
+	calib_point = aspeed_spi_ast2600_optimized_timing(6, 17, &calib_res[0][0]);
 	/* No good setting for this frequency */
 	if (calib_point == 0)
 		return -1;
-- 
2.34.1


