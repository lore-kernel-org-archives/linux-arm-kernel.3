Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C1EFF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 22:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ZDduCXfqXp7JEhcv7G9stXAqe5JKKhENe/X3yLIsTE=; b=WRLPLD7+ZisIqIOeJVMZGc1634
	T+x72PIS4hefYCGrn4T7WgJtBJ800zdjM5+jpJa5dYBocrn0z//c9ZYsR6dVt88eW8iRVXFV2KCCt
	sYPNx8aivairteG3GqQuJMe3iIuGDoZZCeu4gdsgodQ7bnEHVERVSxt+PS7jrvbrz1LwACACYxJna
	2HRRmZMydf0ZgD0SBhCVa0qxW107DSWFza+kEVsm09sZS8dzfZWNz1GP8xx7/tKs7k1TbNgwYZTWe
	qhlwY9CRfxSjxlYs1xmyBCK9goWRmAaya/vJjnyy6x32fe984d5aNH9+kLhJs3cRFA7aQ2PkMzdtn
	WC5ui1cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHqVN-00000002XsG-3IXC;
	Tue, 28 Apr 2026 22:02:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHqVM-00000002Xs9-1fru
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 22:02:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BCD7D6024D;
	Tue, 28 Apr 2026 22:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8E1C2BCAF;
	Tue, 28 Apr 2026 22:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777413726;
	bh=r8vkVzBEwB9e4ptIQnnS1XAbCkLC1zWFo2SH/aid8HY=;
	h=From:To:Cc:Subject:Date:From;
	b=s60LYOcCIC09oAq47ZB03t98DB5+3zL5YU6azw8luqgRo2vF9n2ukvxyaRbhYZtl/
	 37EZkpl2vTMe31fZ1xW2NcKSmRI6R5f5ZXPNg/cp87gVy1/W4/OY3VofxsRsnKjqcF
	 ZYBq6z8O1+bWWd+HOlXw4+ySiCCPSjuAJaEPRSjho1lIbErzfm0aRF61FWJzfTw6id
	 aHlDaJQ32EK1WIDK2Kt1mQyhGYjHE4dCHka8wv99fHCIaWiwfREmASNhl8pA/rUVhN
	 fgBOROnSuvCAyJX06wDgUKfqsvHckxDndQcNBAFP6pAAxjdbCEb432vzYVl8bPvVk9
	 QKgA5+qdl92pA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Vishnu Banavath <vishnu.banavath@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: Kconfig: Disable ARM_VIRT extension if XIP_KERNEL
Date: Tue, 28 Apr 2026 16:58:15 -0500
Message-ID: <20260428215815.2884392-2-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Vishnu Banavath <vishnu.banavath@arm.com>

XIP is intended to execute kernel inplace and typically from
flash and is used mostly on low memory devices.

.macro  store_primary_cpu_mode  reg1, reg2, reg3
        mrs     \reg1, cpsr
        and     \reg1, \reg1, #MODE_MASK
        adr     \reg2, .L__boot_cpu_mode_offset
        ldr     \reg3, [\reg2]
        str     \reg1, [\reg2, \reg3]

As text section is in flash memory and data section is in RAM.
L__boot_cpu_mode_offset would evaluate to address based
on virtual addresses provided by linker script. At this stage
the MMU is OFF.

The logic used based stored @L__boot_cpu_mode_offset on the offset
between the  boot_cpu_mode in data section and the location of
L__boot_cpu_mode_offset can't be used along with PC to fetch the value
of boot_cpu_mode doesn't work.

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
This patch is from Alif E8 SoC tree which I'm working on. It's 
originally from corstone700 trees.

 arch/arm/mm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 7b27ee9482b3..e2f5d3d7d3fb 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -705,6 +705,7 @@ config ARM_THUMBEE
 
 config ARM_VIRT_EXT
 	bool
+	depends on MMU && !XIP_KERNEL
 	default y if CPU_V7
 	help
 	  Enable the kernel to make use of the ARM Virtualization
-- 
2.53.0


