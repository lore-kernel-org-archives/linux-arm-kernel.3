Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379DFCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RT881sMuO5RBm6x+OBZyMlujk1EhJdSnEQ26ruUE+XU=; b=Q+PCeGiCWbQOPqg1t+mxOfZfEg
	re6LpIe696CsFHlJpaasJkozXIwA+NmRlFwH/bkOrybEfcI7WgBI6+EPznA8gqIIbnjbvuKH0swNL
	tN7AOL1ttGpA6gBFqZRKMeikHehhg0MIXP+Sln/6q5gbUTjjXcWFqNcvevmbdWHZov8ovI+0xEnxq
	e1oNC+cSTXdRH/p4wDbVme66gzNMBbMX3mmGD2PP4KRZBkUDnO/8beepdyWgIYtnSmUrKkMe9YSk/
	kmwOM9iFlqu9Ye2b6rOV8aosgFf8AiXc6/AwaRpI0/RBw3ZMjFvX/8g0e1vaOME3qPxJMseZgcVrl
	OvhcDD3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYod-00000002Dvw-0YRh;
	Tue, 02 Sep 2025 21:45:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utUfJ-000000019sU-22NS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 17:19:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B952E44455;
	Tue,  2 Sep 2025 17:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 953F3C4CEED;
	Tue,  2 Sep 2025 17:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756833568;
	bh=HpkXJYlU3KxliNdCAuU+x9yMGw6xejBlZCkOpmaJSX8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=K+lsjhkiuVCel0yGpRoQlPkb5BKVV1HrSoE9pNqKNGX/0yQqZCcjJRK6YIS+gg0bD
	 yhrSEDC9jMg4CkRdmehR2CZpXGpqkL2dgwjMVvD9JNlFPSl0Viu0Ma2dwFd0tJ9xJI
	 hV27pX7L95NSy+T67QGTBvtNH2HI2r8yOArjN9d1Y4hh4UNIe4l5LcRomOySbz+jwq
	 Kb9VD2irbbJQ3nuO8hiFwDl77I8ctH4myexOee9rKD6yuFjvcnslzdIFie8JRt3VUC
	 yGv+CXQn5vRA4jARjMcc5xtOhc81W6HoJNlX0O5l8SZqWautWzYx0u5UL2u7uoDG1Y
	 GAbvI3YZ2qCmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8295ACA1007;
	Tue,  2 Sep 2025 17:19:28 +0000 (UTC)
From: Anthony Brandon via B4 Relay <devnull+anthony.amarulasolutions.com@kernel.org>
Date: Tue, 02 Sep 2025 19:19:08 +0200
Subject: [PATCH v3] dmaengine: xilinx: xdma: Fix regmap max_register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-xdma-max-reg-v3-1-5fa37b8d2b15@amarulasolutions.com>
X-B4-Tracking: v=1; b=H4sIAAsnt2gC/33OTQ6DIBCG4asY1qXhR1C76j2aLkZAJRFpQImN8
 e5F93b5fsk8mQ1FE6yJ6FFsKJhko/VTDn4rkBpg6g22OjdihAnSEIpX7QA7WHEwPaaybJQsRcN
 FjfLJJ5jOrif3eucebJx9+J56osd6ASWKKW4lkFJIanRLn+AgLCNEPy5z/inelXfoMBP757Dsd
 MArxqGitdIXzr7vP5y9ZwP7AAAA
X-Change-ID: 20250901-xdma-max-reg-1649c6459358
To: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>, 
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, 
 Vinod Koul <vkoul@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Anthony Brandon <anthony@amarulasolutions.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2916;
 i=anthony@amarulasolutions.com; h=from:subject:message-id;
 bh=RXW5CKC0f3s39M0SO5bLPVh0482yL+nz0tdpgoq7TKU=;
 b=owGbwMvMwCUWIi5b4HjluATjabUkhozt6vJT3T+IRyk+FS/t+zKd0+9zxrw96yOMjUTfNtiLx
 7ntUJLrKGVhEONikBVTZCnXkef1UK4rV5r5xBhmDisTyBAGLk4BmMgbb0aGPydEFERjPZZpfez2
 a1cXOvrz1Z/+j1Zqp16f/8h96GywCMP/ahtnt8clNz3rnVqZ9DaUxkuf9V/37NmZd45JjtI7q1I
 ZAQ==
X-Developer-Key: i=anthony@amarulasolutions.com; a=openpgp;
 fpr=772C1F0D48237E772299E43354171D7041D4C718
X-Endpoint-Received: by B4 Relay for anthony@amarulasolutions.com/default
 with auth_id=505
X-Original-From: Anthony Brandon <anthony@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_101929_576701_A37C86B2 
X-CRM114-Status: GOOD (  14.54  )
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

Fixes: 17ce252266c7 ("dmaengine: xilinx: xdma: Add xilinx xdma driver")
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
Signed-off-by: Anthony Brandon <anthony@amarulasolutions.com>
---
Changes in v3:
- Add Fixes tag
- Link to v2: https://lore.kernel.org/r/20250901-xdma-max-reg-v2-1-fa3723a718cd@amarulasolutions.com

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



