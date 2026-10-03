Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03608CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lV/my0olA1OoH/9At+Wx46uR15CzHGyenNkckhPTYMw=; b=bxWsn8q7vOG1SVbnpCCNyXjrHj
	klgrXCd+JudejfI3V1M4lw+N15GkuDdiHgPvzc79Y1jNT4Ksfa3AD3rpCVk/f1RVkn0a6I1HLGkIH
	y5l/vy383+sb6/V6fsdyt/JfiPPo5h27fvweAIHrlr4Yiex7BxkHVvpkurS08AS1zPZpteki8LItF
	mdfcbL8mLrotThF5Cciyxl7qRUmPjSIx0eU9E3vA33D92DmwPQQa6jfOsHvg4vNXQbaKw7P6yHxgN
	fUs9rwP9Tr5/ryTWHJZrikokgvDHBLnP416Y3ZOrzHAQxq7CpnWquHDuY7Vaeo9aZXnGpOGHPeWqy
	+NYBloKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWw-0000000DJp0-2Vm7;
	Sat, 03 Oct 2026 09:59:46 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWt-0000000DJjg-2UKV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 09:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=lV
	/my0olA1OoH/9At+Wx46uR15CzHGyenNkckhPTYMw=; b=VFeTSsdLyj7lJ2zotX
	CGOvq0fvY4HXHm2U1eTcrH3hf8TSPvc1K7Xx6amr/WL/JMc7aqJaxDhgnyD1UUww
	DKOEaoEgbQMJ9JY7rBZ27lRiVnyAaaQ1AdoeOAAAFq5TuFZZvbAB7fXLen3k7aeZ
	xgmFtA97utH0i8bqn/JHGHi7w=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3f5P90cBq2ThFCA--.31371S2;
	Sat, 03 Oct 2026 17:59:25 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2] dmaengine: xilinx: dpdma: Reserve space for a string terminator
Date: Sat,  3 Oct 2026 17:59:22 +0800
Message-Id: <20261003095922.575350-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3f5P90cBq2ThFCA--.31371S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww4kCF48ZF4rtFWkuFy8Krg_yoW8JFW5pa
	sxW3y3Kr12yFWDJw4UJ3WFva4Fq3ZrCr1UuFW8u3yFvryayw4F9a4FgFZ7Xr1kWryYgr1r
	tFW5tw1YkF12vaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi_Oz7UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8B5+uGrA0f6FVAAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_025943_943977_1616EF05 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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

xilinx_dpdma_debugfs_write() copies size bytes from userspace and parses
them with strsep() and strcasecmp(). If the input has no NUL within that
range, the parser can read beyond the allocation.

Use memdup_user_nul() to copy the complete input and append a terminating
NUL.

Fixes: 1d220435cab3 ("dmaengine: xilinx: dpdma: Add debugfs support")
Signed-off-by: Jiale Yao <yaojiale02@163.com>

---

Changes in v2:
- Replace kzalloc() and strncpy_from_user() with memdup_user_nul(), as
  suggested by Laurent.

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index d9a3542c4531..219d25be6c3a 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -410,15 +410,11 @@ static ssize_t xilinx_dpdma_debugfs_write(struct file *f,
 	if (dpdma_debugfs.testcase != DPDMA_TC_NONE)
 		return -EBUSY;
 
-	kern_buff = kzalloc(size, GFP_KERNEL);
-	if (!kern_buff)
-		return -ENOMEM;
+	kern_buff = memdup_user_nul(buf, size);
+	if (IS_ERR(kern_buff))
+		return PTR_ERR(kern_buff);
 	kern_buff_start = kern_buff;
 
-	ret = strncpy_from_user(kern_buff, buf, size);
-	if (ret < 0)
-		goto done;
-
 	/* Read the testcase name from a user request. */
 	testcase = strsep(&kern_buff, " ");
 
-- 
2.34.1


