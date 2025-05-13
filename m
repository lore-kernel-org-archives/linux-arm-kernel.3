Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279F7C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 12:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vw6nyVULTKSutZqVHMCpOEqIf13R++Ed5Lrnm0TQqxg=; b=chFbx6Os/EvEhOCz3psxwVuKLR
	MFjUdas4/GzALEiPiqzSUqZHDcChxhblfe5rNHNhg2AntIMvFxCy3gntXnNBT8osoChdxNt/tHPek
	v6JeC71kYu8yDTk/OXgraI9vHakDpNOBbqBTJnkU7cI18LnY6VU5d1DypE+LGivrzFtwu5ia8kAau
	7jxTJetCgfBSEfA7AoAeE3Y3PYExqf3Fk4Aaj2TjUMIrW+frSb8A5Xe01VVKHLtVejg/gBpTUU0sr
	5o3LiOEOe953KfAjApASK7jnbihtBGFoRUX41Mlmjn+zTCQjXDZ04ENIUbzELlzmsaFUuqB37Jnus
	DhQ1GVxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEp4X-0000000CP89-2x1C;
	Tue, 13 May 2025 12:49:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEp0w-0000000COcf-23sd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 12:45:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67CB41688;
	Tue, 13 May 2025 05:45:28 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9DCC73F5A1;
	Tue, 13 May 2025 05:45:38 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH] arm64: Update comment regarding values in __boot_cpu_mode
Date: Tue, 13 May 2025 13:45:25 +0100
Message-ID: <20250513124525.677736-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_054542_579304_5ADDB828 
X-CRM114-Status: UNSURE (   9.87  )
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

The values stored in __boot_cpu_mode were changed without updating the
comment. Rectify that.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---

The discrepancy was introduced in commit 828e9834e9a5 ("arm64: head:
create a new function for setting the boot_cpu_mode flag").

 arch/arm64/include/asm/virt.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/virt.h b/arch/arm64/include/asm/virt.h
index ebf4a9f943ed..aa280f356b96 100644
--- a/arch/arm64/include/asm/virt.h
+++ b/arch/arm64/include/asm/virt.h
@@ -67,7 +67,8 @@
  * __boot_cpu_mode records what mode CPUs were booted in.
  * A correctly-implemented bootloader must start all CPUs in the same mode:
  * In this case, both 32bit halves of __boot_cpu_mode will contain the
- * same value (either 0 if booted in EL1, BOOT_CPU_MODE_EL2 if booted in EL2).
+ * same value (either BOOT_CPU_MODE_EL1 if booted in EL1, BOOT_CPU_MODE_EL2 if
+ * booted in EL2).
  *
  * Should the bootloader fail to do this, the two values will be different.
  * This allows the kernel to flag an error when the secondaries have come up.
-- 
2.43.0


