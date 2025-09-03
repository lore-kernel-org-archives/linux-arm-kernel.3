Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755E8CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 10:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZkD6N94ilMQMZ/1AznthtrIqGjZkUyT7cBFMEz0JeqM=; b=y+0aQCr3OmIGN3Wuyg8e2vqz4z
	9Wy0HaxSre2Osr6LGEeC4tJwtUZ6SAiEO3dfAUUL5NSLwOLZJeTyJUEtpBwk5kuTNSlSMqFTmVc9k
	kvQnHZBYJ2z/QJ1Zh1Fuzuuey4Y271MkLUhSB0fDo7GSZ3/Cb6v5wRVKY9NQN+UM/paRYKrqlwh+5
	k5Oi9HdsLIu6XPebqsfTWIStr4RiNkkwPCHVc2szv5g27mQPO27ydCV9uvSdR2iv66prG8zGy94ml
	3UwCg91twqkmDDB3+11ht4n00ouqb8XxH8I99adMQsJmdo4ZaJXPjRLTpAVPI6RWFXzBddXaViAB7
	JxbAPZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkN0-000000062Zg-313N;
	Wed, 03 Sep 2025 10:05:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjHr-00000005mxg-20ox
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:56:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30EDD43BE0;
	Wed,  3 Sep 2025 08:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10859C4CEF0;
	Wed,  3 Sep 2025 08:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756889775;
	bh=q0tHz+BMppn+t5zOxfWZIctQRwVYHLuE0UcrNZZKdo4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NIpTPaTzzHX7kB1f8K503erRMyypAXp1ExsDMwEhyLo+dF1be4OFKtlwDQVfIIahP
	 ESEMMz41sEaWtoKNZ03tJ9d9IJ0MiI6QaSzTeo8avGezs+TtC5yI5a30t4d4BB6v/6
	 O70WUoRIcXFhUmhrDmBDs88a/69IwmCC65sslg6afBp+/xZyXD8e2qAuXVJyWEsxrx
	 CXYDyRL8LpCA4/AYREoiSV59XCl7Br2dG/n1P6aqY+OtupCCehxq1SbsjnPAu0OFKq
	 jVjETpWA9H//y/7Wx7qZHhKDGss7GCsWGMKJCFiO0ekZAQdNIo4sEMed3DvDWI/WB4
	 mycw0vDRbpR5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03F0CA1009;
	Wed,  3 Sep 2025 08:56:14 +0000 (UTC)
From: Anthony Brandon via B4 Relay <devnull+anthony.amarulasolutions.com@kernel.org>
Date: Wed, 03 Sep 2025 10:56:13 +0200
Subject: [PATCH v4] dmaengine: xilinx: xdma: Fix regmap max_register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-xdma-max-reg-v4-1-894721175025@amarulasolutions.com>
X-B4-Tracking: v=1; b=H4sIAKwCuGgC/33OywqDMBCF4VeRrJuSycVLV32P0sVooga0KYmKR
 Xz3RleloMv/wHzMQoLx1gRySxbizWSDda8Y8pKQqsVXY6jVsQlnXLGCAZ11j7THmXrTUEhlUaV
 SFULlJJ68vantvHOPZ+zWhsH5z65PsK0H0AQUaJkikyoFo0u4Y49+7DC4bhziT+FauZ5s5sTPH
 B6dGkXGBWaQV/rEEb8O/3NEdNQGlbnmJagDZ13XL3+nWz9DAQAA
X-Change-ID: 20250901-xdma-max-reg-1649c6459358
To: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>, 
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, 
 Vinod Koul <vkoul@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Anthony Brandon <anthony@amarulasolutions.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3123;
 i=anthony@amarulasolutions.com; h=from:subject:message-id;
 bh=L9Jh4ojlLzKIglwK2lLLxgJIk6sX82XB7wh+bXhzPgA=;
 b=owGbwMvMwCUWIi5b4HjluATjabUkhowdTGuXbz2h8O6vR9h7l8sJXDd2xeuveNJvuSdM7f7co
 LlBt/jiO0pZGMS4GGTFFFnKdeR5PZTrypVmPjGGmcPKBDKEgYtTACayiJHhn8qiHF9TpoxqOeMV
 03eG+W0RdGx0+/VCIXcmz4H1iZdzmxgZnspOWb3hmObTayGdPPNCuJXqK/8y2R1pOFGZv0JJr9i
 bEwA=
X-Developer-Key: i=anthony@amarulasolutions.com; a=openpgp;
 fpr=772C1F0D48237E772299E43354171D7041D4C718
X-Endpoint-Received: by B4 Relay for anthony@amarulasolutions.com/default
 with auth_id=505
X-Original-From: Anthony Brandon <anthony@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_015615_572793_07B080AA 
X-CRM114-Status: GOOD (  14.46  )
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
Signed-off-by: Anthony Brandon <anthony@amarulasolutions.com>
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes in v4:
- Reorder Reviewed-by
- Link to v3: https://lore.kernel.org/r/20250902-xdma-max-reg-v3-1-5fa37b8d2b15@amarulasolutions.com

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



