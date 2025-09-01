Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3D1CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z/EylqT4wJ+2duNX0zP3sHhFL3eMY+gcBtX2xffF+5A=; b=oPlhHHc3VCIdKjWmzThPXERnD+
	f/EtXunBRZhMZkiEqM3nwVI1MVMS7ZE6jr3TaLz1zzQ8wPSCFi+2WmCzgwJJ1YTBoAseUrzdjVKwO
	UzxHSAKcOLE+x6ZjNvNM+pfwW7glj485S1mdQG8TuuVD5IhVCHnrodRcEUVqrv0an4SM+0fjINEyW
	xt/d280S+K8EHOl/xWgIkuK/vNJEf/3y7R7BagT9xhMU0+2CRL7qefsG3TYUJrh1h3oJKjQxvu77Z
	vqKVosQDPdvsxc9VDbJNf3hjlhE6hJQd+wsOjVKQ2dyCvzoBNwXEEaqM5eRVdk1gVqIAjvEvrQMGh
	pBR9d9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFH9-0000000EZrf-0aVR;
	Tue, 02 Sep 2025 00:53:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utC6w-0000000DyvM-1N1W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 21:30:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E97F601E2;
	Mon,  1 Sep 2025 21:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D0C5C4CEF0;
	Mon,  1 Sep 2025 21:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756762245;
	bh=PRaBApLQy8iLSplWAmAp1oVZUt+rfypBd7IUK5L9VhM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Zvj1d+sAt2W4YW5Xl57DOgpg8QBsjStyQQfzpfLYcCzxD+9csXNUcimZor2V6P0KW
	 yM7Q/6yDsMDtuJmgSTJV19AsOcujeKUWGI/it9ftfQj8vSW3TKiZb1RDoFbpwdD0ZN
	 kp10HtU10FCbTS9unLdXvnkrwd/4nEpUrU729vmeKXKkRy7+fRcF0clKThmLAY3TrH
	 mzqgxlSwjUMM07bnQ9w2VStWZehcdvgCP//nc+136sODLycBb2IR7hK2+LkqVJjWoV
	 +9bITXEKehW6YCjfUbxR2ZIkBMmqwUMp3j+iZA6hp3waEqxGcCyCMhoWRLs/ffQ9vs
	 Zqmdg+VKIThuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE3ACA1002;
	Mon,  1 Sep 2025 21:30:45 +0000 (UTC)
From: Anthony Brandon via B4 Relay <devnull+anthony.amarulasolutions.com@kernel.org>
Date: Mon, 01 Sep 2025 23:30:32 +0200
Subject: [PATCH v2] dmaengine: xilinx: xdma: Fix regmap max_register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-xdma-max-reg-v2-1-fa3723a718cd@amarulasolutions.com>
X-B4-Tracking: v=1; b=H4sIAHcQtmgC/3WOQQqDMBBFryKz7pSMNaF21XsUF6NONWCMJCoW8
 e5N3Xf5HvzH3yFKsBLhke0QZLXR+jFBfsmg6XnsBG2bGHKVa1Uqwq11jI43DNIhmaJsTKHLm75
 DmkxB3nY7c68qcW/j7MPnrK/0s39CKyFhbVgV2pC0NT3ZcVgGjn5Y5vQpXhvvoDqO4wvf58KTs
 wAAAA==
X-Change-ID: 20250901-xdma-max-reg-1649c6459358
To: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>, 
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, 
 Vinod Koul <vkoul@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Anthony Brandon <anthony@amarulasolutions.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2662;
 i=anthony@amarulasolutions.com; h=from:subject:message-id;
 bh=EBsbI+2mqsOLjYpUAS5JaxRB+GFopFCZKJlHq1D/08o=;
 b=owGbwMvMwCUWIi5b4HjluATjabUkhoxtAs3zz7lceM09Jf/+SkHWJQb5fB0zROt2ty1wUwr0v
 6V96varjlIWBjEuBlkxRZZyHXleD+W6cqWZT4xh5rAygQxh4OIUgInkH2X4nydzSpZLnumGyFw/
 w1l2MyfMWdK0edbmfXkNUnyOpW/0eBn+x/evY7bwklfpea+6/sTppuM1CQ53NvW+7U/VfvD5H1M
 ZCwA=
X-Developer-Key: i=anthony@amarulasolutions.com; a=openpgp;
 fpr=772C1F0D48237E772299E43354171D7041D4C718
X-Endpoint-Received: by B4 Relay for anthony@amarulasolutions.com/default
 with auth_id=505
X-Original-From: Anthony Brandon <anthony@amarulasolutions.com>
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
Reply-To: anthony@amarulasolutions.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Anthony Brandon <anthony@amarulasolutions.com>

The max_register field is assigned the size of the register memory
region instead of the offset of the last register.
The result is that reading from the regmap via debugfs can cause
a segmentation fault:

tail /sys/kernel/debug/regmap/xdma.1.auto/registers
Unable to handle kernel paging request at virtual address ffff800082f70000
Mem abort info:
  ESR = 0x0000000096000007
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x07: level 3 translation fault
[...]
Call trace:
 regmap_mmio_read32le+0x10/0x30
 _regmap_bus_reg_read+0x74/0xc0
 _regmap_read+0x68/0x198
 regmap_read+0x54/0x88
 regmap_read_debugfs+0x140/0x380
 regmap_map_read_file+0x30/0x48
 full_proxy_read+0x68/0xc8
 vfs_read+0xcc/0x310
 ksys_read+0x7c/0x120
 __arm64_sys_read+0x24/0x40
 invoke_syscall.constprop.0+0x64/0x108
 do_el0_svc+0xb0/0xd8
 el0_svc+0x38/0x130
 el0t_64_sync_handler+0x120/0x138
 el0t_64_sync+0x194/0x198
Code: aa1e03e9 d503201f f9400000 8b214000 (b9400000)
---[ end trace 0000000000000000 ]---
note: tail[1217] exited with irqs disabled
note: tail[1217] exited with preempt_count 1
Segmentation fault

Signed-off-by: Anthony Brandon <anthony@amarulasolutions.com>
---
Changes in v2:
- Define new constant XDMA_MAX_REG_OFFSET and use that.
- Link to v1: https://lore.kernel.org/r/20250901-xdma-max-reg-v1-1-b6a04561edb1@amarulasolutions.com
---
 drivers/dma/xilinx/xdma-regs.h | 1 +
 drivers/dma/xilinx/xdma.c      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xdma-regs.h b/drivers/dma/xilinx/xdma-regs.h
index 6ad08878e93862b770febb71b8bc85e66813428e..70bca92621aa41b0367d1e236b3e276344a26320 100644
--- a/drivers/dma/xilinx/xdma-regs.h
+++ b/drivers/dma/xilinx/xdma-regs.h
@@ -9,6 +9,7 @@
 
 /* The length of register space exposed to host */
 #define XDMA_REG_SPACE_LEN	65536
+#define XDMA_MAX_REG_OFFSET	(XDMA_REG_SPACE_LEN - 4)
 
 /*
  * maximum number of DMA channels for each direction:
diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
index 0d88b1a670e142dac90d09c515809faa2476a816..5ecf8223c112e468c79ce635398ba393a535b9e0 100644
--- a/drivers/dma/xilinx/xdma.c
+++ b/drivers/dma/xilinx/xdma.c
@@ -38,7 +38,7 @@ static const struct regmap_config xdma_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.max_register = XDMA_REG_SPACE_LEN,
+	.max_register = XDMA_MAX_REG_OFFSET,
 };
 
 /**

---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250901-xdma-max-reg-1649c6459358

Best regards,
-- 
Anthony Brandon <anthony@amarulasolutions.com>



