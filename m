Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9189C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUkfRfE9yNyBzalxMx3/89AuUQW9k7kD7LJuIN09w18=; b=xtZIg6XFgHroUyZevEJLOLYQhV
	dOOGVclnMpLilit1kvnRmanKPh8g8bn+n6pgbyOoPpPg30Rhl9GZh1KGobatmrWInPe61wLpIF0hK
	qy6So9ahmcwsWWZXKjw3mEowrDML521b6pN1si0v9nrv+ycmPMEqs3VcC3GGzoyYUuGjMhIZiZUFK
	//AU+22FxGpig4c4dkOZn5OjJnFj6GJQk3dUfxR49LmsAzMIo5d1tZ7qtqXGPnkaBV6Q7fKoQVBTx
	vfUZbRpJpGAgqJHttxU/4+st4/AgBwxKuPrrDXUNZQw1k7nb2FH8oOHdbmccarDRsf4pMeKgbR5Mc
	oe1jTDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cP6-00000007LUU-2kYF;
	Mon, 07 Sep 2026 16:41:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cOw-00000007LPL-2icl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:41:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D5CF43784;
	Mon,  7 Sep 2026 16:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66F31F00A3A;
	Mon,  7 Sep 2026 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799258;
	bh=sUkfRfE9yNyBzalxMx3/89AuUQW9k7kD7LJuIN09w18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BhUr78NXijbJVLVkM69gB/h8NgBlzzcHr8oX4s2y3NPVMtU3IAVjR5zEPMg2NNDCg
	 2yDO+i3ySKuMyaNqrgNny+n7QrhcmIFNXN641mG2UkkLLZg75XjHHvVVQ03+9MpvZF
	 33Hl4vWCHOGExdmjdhl0l/FtPRGEwfd8XCHEBUYshKk+WwfhpoUgFX8savPgljwh38
	 PjvMvAGvblRyQg8huBMuQ78dK0uVDAXHpAFIFdMxUoNpzEcNjp92E+pjXRKA3+tqvZ
	 O10M0mhQum9kPN/+iCPjSmtCfm4lOhGfCTqj/nAw/RAM0FTqSoBeHzgjyvwpR1Reol
	 ItzJNfDrIeqtw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 08/19] arm64: smp: Don't bother printing the I-cache policy for each CPU
Date: Mon,  7 Sep 2026 17:40:11 +0100
Message-ID: <20260907164024.17164-9-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
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

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/cpuinfo.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index b423301a13cc..6dbea3a8bb23 100644
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
2.55.0.979.g7e5102b832-goog


