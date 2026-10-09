Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D26CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xH2XprgQ00wXZBykl621LlJAXXNb9rHtvI/kD08mEM4=; b=L7rRtwWJxmI3SaDpT9/atlmv6t
	/jWyPViqbW7jJ8yaJaIC9iKjLdVne7Evvz9yqYM1Aht80k8BvN5y1jCuDaKEvdtFxedOyVIbCC7/b
	CFA5z8vwT9WaeKpaRiHZvjtDSac7kGXYRQlb32hSqI5ym0vtfEiMi+p/HNltJNXaFtZZL3CBNMGqu
	PylHyBaW+/3NAFgKjMxXcz2VvZ3Qzax2I93rvVZ0PKtGfkiTH9G9+MwiYK1WRnkva892C+V+1wPvl
	a7INk3HW5+o+cwl5ISuV5vfK1AwlGWiWbsjP9S2bi2XSISlerFekgQ7oBgFRho0vq0LNFTj5nil/X
	+G70DKgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Wl-00000005zPF-2ztP;
	Fri, 09 Oct 2026 10:08:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Wj-00000005zMy-3Ooa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:08:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 414DC60DC1;
	Fri,  9 Oct 2026 10:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2311F00899;
	Fri,  9 Oct 2026 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540513;
	bh=xH2XprgQ00wXZBykl621LlJAXXNb9rHtvI/kD08mEM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YjSBBrgZ9Y5Xej7VdopzxeB9b6XJf9N0iJEaBw5aI5XI6IxGuoWA2aAl954kiBROG
	 HM2uSybTH70MynGW0n9aI1fuLbS6ccoNzLo1kWUPUgt+Cb5sM9Dr9G5lF3AvGrMPpi
	 NzIdvbh3HAPH+9CFdtx3uJFCh6f+VqLsKkui8ZeSxCpgc7IlawVCq/ikyX2kQUegsj
	 neE/bF0BZBZq5Cj9CKvvRjgprjVBUbkTU8BaJ6qZ/r6sHkw3GJrS8WlQlLdunXPbH4
	 sw116k1NaTL2pRo4GItoVjYtmlJElRFUY8KEwaGyAEQ2sujHIh5cXT2CayGdrXo4iA
	 CQ2wYZka8g/hA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 12/23] arm64: smp: Don't bother printing the I-cache policy for each CPU
Date: Fri,  9 Oct 2026 11:07:23 +0100
Message-ID: <20261009100738.31288-13-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
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

The I-cache policy isn't particularly interesting but printing it early
can result in unnecessary serialisation of onlining CPUs.

Remove the pointless print.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/cpuinfo.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index dfb21bf5541d..94e6cd211d70 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -31,19 +31,6 @@
  * values depending on configuration at or after reset.
  */
 DEFINE_PER_CPU(struct cpuinfo_arm64, cpu_data);
-
-static inline const char *icache_policy_str(int l1ip)
-{
-	switch (l1ip) {
-	case CTR_EL0_L1Ip_VIPT:
-		return "VIPT";
-	case CTR_EL0_L1Ip_PIPT:
-		return "PIPT";
-	default:
-		return "RESERVED/UNKNOWN";
-	}
-}
-
 unsigned long __icache_flags;
 
 static const char *const hwcap_str[] = {
@@ -424,7 +411,6 @@ device_initcall(cpuinfo_regs_init);
 
 static void cpuinfo_detect_icache_policy(struct cpuinfo_arm64 *info)
 {
-	unsigned int cpu = smp_processor_id();
 	u32 l1ip = CTR_L1IP(info->reg_ctr);
 
 	switch (l1ip) {
@@ -436,8 +422,6 @@ static void cpuinfo_detect_icache_policy(struct cpuinfo_arm64 *info)
 		set_bit(ICACHEF_ALIASING, &__icache_flags);
 		break;
 	}
-
-	pr_info("Detected %s I-cache on CPU%d\n", icache_policy_str(l1ip), cpu);
 }
 
 static void __cpuinfo_store_cpu_32bit(struct cpuinfo_32bit *info)
-- 
2.56.0.385.gd3acb90ef8-goog


