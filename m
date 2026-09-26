Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8666CC98332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXu7uh2QBgUxSEt9lZNdDENOAqqsl00kGuodWz0UU30=; b=sJBIHSTHRAya+t5H4JO+icTVC1
	2sS5Nzm1wFSroprFlnH2w4x1iR518sXKjg4Px13A6qDvMBlu8y6LpEncoVzksCoYCnRUT9RDReo16
	p//A8/IcbHDlIUquXqVXk9Fdu9T9RgyZgB1++ZLpX8m4fLvGRcNsSfcyFIsa7nxlRFYgZ7aEgMQH0
	jJc7rQKG1VmHbfy+Co/uBvWuhJ6GHQpW5FGKFZDgpx+HLYxtN8zi5Gk+ZSi7Hw+/tqFP9xa0DohSX
	uhfBKQFfP/I9eS/KgG8NuSOyWpN/tTbuCTAdh68xQqCgKsgGYyu0FJihUcj5LO/1BtOAKFoBRPEBq
	m6h4VFLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARHZ-0000000FMGF-0wDy;
	Sat, 26 Sep 2026 12:13:33 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARHR-0000000FMDs-41v3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 12:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=BX
	u7uh2QBgUxSEt9lZNdDENOAqqsl00kGuodWz0UU30=; b=SLFpGeyPkcFiOiZNpI
	tS/lPseAMj2ZIWzVbS/yKM3OL2rndeFSFzN8OaS+Ha8ObZm1mhfnHdajGBTYDSTk
	vlE1brl4q6cWlfIHFyjD4HTHVtE1MUgaPh3IC6kkGZSPPDSpVWPYUNLfdPjp/3et
	BMtZKRd48x77B2aPTFWfzPbe8=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD338nKtrdqfXOcAw--.9011S5;
	Sat, 26 Sep 2026 20:13:04 +0800 (CST)
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
Subject: [PATCH 3/3] dmaengine: xilinx: dpdma: Reserve space for a string terminator
Date: Sat, 26 Sep 2026 20:12:50 +0800
Message-Id: <20260926121250.3258285-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260926121250.3258285-1-yaojiale02@163.com>
References: <20260926121250.3258285-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD338nKtrdqfXOcAw--.9011S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF1DAFW5ury3CrW5tryxZrb_yoWkArcEva
	4vgryxXF1Du3Wjkr1rArZavrWYy3WxJF18urnY9r43XF9xGrZYvrWrZa1kJw4fXrZ5GrWD
	uryqqryfAF17KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_KZX7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRBqpGq3ttDG6wAA3F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_051326_947291_E5E773FB 
X-CRM114-Status: GOOD (  10.91  )
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

xilinx_dpdma_debugfs_write() allocates a buffer of size bytes, and
strncpy_from_user() can fill it without a terminating NUL when the input
has no NUL in the copied range. strsep() and strcasecmp() then read
beyond the buffer.

Allocate an extra byte and keep that byte zero-initialized, so the input
copied remains unchanged and the buffer is always terminated.

Fixes: 1d220435cab3 ("dmaengine: xilinx: dpdma: Add debugfs support")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/dma/xilinx/xilinx_dpdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index d9a3542c4531..b61ef3062d84 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -410,7 +410,7 @@ static ssize_t xilinx_dpdma_debugfs_write(struct file *f,
 	if (dpdma_debugfs.testcase != DPDMA_TC_NONE)
 		return -EBUSY;
 
-	kern_buff = kzalloc(size, GFP_KERNEL);
+	kern_buff = kzalloc(size + 1, GFP_KERNEL);
 	if (!kern_buff)
 		return -ENOMEM;
 	kern_buff_start = kern_buff;
-- 
2.34.1


