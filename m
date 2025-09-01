Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1967CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JwkzLXkTS9riEt0GMD0yryCyPFp9GiBB3hSq5T99oMw=; b=xxin9DITHwkFKr3zx+oqyCPZXv
	2ne+/DMIRrDkse0ayfpR+txkKs5XrsjXJQLKbbXukzr5+wNKo6uus5/ZFoKrdy7mi2WkpM9oT+Ywy
	hHRM2Joa0LSvwZ17QZr1CDfe1Ace+PNWtCIZkt3bp198EIYQoAQ5vGS1NyU8mzD9riHB8ofTW5kj9
	cWCX1dunAq01P8NCCCcRORkJD3Epk1OlNaCMGQCEXNnB4y4z/AIZoUygH/tMeG5YNlv7KPPSDSseh
	khRppiWaqhSeCubTrxYbUdsF8fWjEPoqIf0O2TpEwySraTu+blJ3tRMOQCAr4EcL2Pn9jlrZI3Yra
	fxQNlsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4uZ-0000000CkGe-2v3Q;
	Mon, 01 Sep 2025 13:49:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2ql-0000000C4uT-2l0z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 11:37:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AFB3640144;
	Mon,  1 Sep 2025 11:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84CA7C4CEF0;
	Mon,  1 Sep 2025 11:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756726646;
	bh=4S/RHev1Y2NUMoafR694usmzuXP1Xi5zuD4R9cVnE3Q=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ZKe3rVa20pxNBPalkM0wfA/JxiFs9RN5L2hyMC16WxL+prb08gI8eJGM/AkCz0pE4
	 SfBMRbRW1PhaZU2WT4hj/sTAoWjZ0n4GwZPiDzS7LFa8Bkyk/gPJck0h7cNJr7E/11
	 dCCbFAbLo8t8N3d0vqryE6Qv2VOu1VGrKnXftkFSYGeUfprAv/+97uDp3ZamUHNRCp
	 7dHlYmgb8bfd8atRPStnKKU6B60YQ4KlixGSVYFldY+rw1mMEmsZPlrOQiOJfPXMhC
	 MPtHKWfSwK/LH7OcjXEcvbIgz74RfnSdCfK3qBJbd89wABiWXCc4U4hPMygg728DgQ
	 6YRgeMF36n0VA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1BCCA0FF0;
	Mon,  1 Sep 2025 11:37:25 +0000 (UTC)
From: Anthony Brandon via B4 Relay <devnull+anthony.amarulasolutions.com@kernel.org>
Date: Mon, 01 Sep 2025 13:37:24 +0200
Subject: [PATCH] dmaengine: xilinx: xdma: Fix regmap max_register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-xdma-max-reg-v1-1-b6a04561edb1@amarulasolutions.com>
X-B4-Tracking: v=1; b=H4sIAHOFtWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwND3YqU3ETd3MQK3aLUdF1DMxPLZDMTU0tjUwsloJaCotS0zAqwcdG
 xtbUA6UUUal4AAAA=
X-Change-ID: 20250901-xdma-max-reg-1649c6459358
To: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>, 
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, 
 Vinod Koul <vkoul@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Anthony Brandon <anthony@amarulasolutions.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961;
 i=anthony@amarulasolutions.com; h=from:subject:message-id;
 bh=Td8m3zq/WUtHpPPBIX28CApxSTxtvMscrufvMw7VZu4=;
 b=owGbwMvMwCUWIi5b4HjluATjabUkhoytrSW8+/XP1KYs0j29dsvB1Y8utfZ8jP7WWPvi9VJxy
 ZfKnuE7OkpZGMS4GGTFFFnKdeR5PZTrypVmPjGGmcPKBDKEgYtTACZyRYyR4VlU+MXDuZ7ZkUvk
 g/WmPFJvl5i5+/JVkYPei2Sd0swF9jH8U3JQ2qvbynxpfYqS/6WloWmyhjyKmW8WHD6UwDfr8Za
 NTAA=
X-Developer-Key: i=anthony@amarulasolutions.com; a=openpgp;
 fpr=772C1F0D48237E772299E43354171D7041D4C718
X-Endpoint-Received: by B4 Relay for anthony@amarulasolutions.com/default
 with auth_id=505
X-Original-From: Anthony Brandon <anthony@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_043727_743360_2F565636 
X-CRM114-Status: GOOD (  12.89  )
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
 drivers/dma/xilinx/xdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
index 0d88b1a670e142dac90d09c515809faa2476a816..cb73801fd6cf91fc420d6a8ab0c973dcdb5772f5 100644
--- a/drivers/dma/xilinx/xdma.c
+++ b/drivers/dma/xilinx/xdma.c
@@ -38,7 +38,7 @@ static const struct regmap_config xdma_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.max_register = XDMA_REG_SPACE_LEN,
+	.max_register = XDMA_REG_SPACE_LEN - 4,
 };
 
 /**

---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250901-xdma-max-reg-1649c6459358

Best regards,
-- 
Anthony Brandon <anthony@amarulasolutions.com>



