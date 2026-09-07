Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B8DC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78u6/cdiAajizC2UEtK9pSOndLspTzAq4idBXXZU6iQ=; b=j2DgtBbZ35TeZi
	GotK2YJ1Tj/CbVAtgFKzizdcRGanYyVCSQnlxCVlBaK3l7s25FdOqYNnZmhcwzbvJwoPgMbdITpTb
	eeYLUHolnSRAn7SPsrUFCAAV3SB5UV7OKg6T0y9kXG+6fkSdvvQkkg0czimE0iiaUn//BFMwZDyYN
	qtx27zYSzekX9UuSCgCVkXFYXiY3/Q9sknLjTnXTdnTWZ+RNmADRih5B3Xuev5Y2HPlbSoAhAy4pg
	kP/7YBjSDZVncEbJ7Nl9NYwnEQfgDxk2cyv99gU9j+5Y361UzyISAl8b7lbzP/ypJ7whMFWGMQOtk
	moBnQyYbQh2Wpfbd/4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRU-00000007NHV-25sb;
	Mon, 07 Sep 2026 16:43:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRT-00000007NEn-0Uzh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:43:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9086D60207;
	Mon,  7 Sep 2026 16:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F611F00A3D;
	Mon,  7 Sep 2026 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799414;
	bh=78u6/cdiAajizC2UEtK9pSOndLspTzAq4idBXXZU6iQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MJsakp3JTE0E9NczC3mLozwnQ0uVL1bPPUP2vjMxZibarZfLiFuYhqPs4NrVg/cEr
	 ZMXR4MSgUSHA3OGEQVuspvdCkYPzfUCxSRhAUW09zshoGf1Qw//jWoUJKPJxydtYcM
	 UizMQsblDGEYIqHVpR6XBIejHMZ6fb/AN57TrVYK7sja5F7Ev15q/mE+mGhfFasjN4
	 YcC4S/IYNc13MhGGgOFLphaqqqdDZEv5VvM6KSTHRu8VuryTSgh7z5M5wQNOgT1PqR
	 XaJQcjgDVS/jJSeZTRCzOjHxOMYrrlXehtwRFkPTbi+QRiCmnd0llS4N4ASqlb9i/t
	 XbyydTKPPaV5w==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/21] arm64: percpu: Specialise set_my_cpu_offset() for the primary CPU
Date: Mon,  7 Sep 2026 17:42:35 +0100
Message-ID: <20260907164247.17223-11-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

set_my_cpu_offset() is only called from smp_prepare_boot_cpu() which
runs once on the primary CPU and before alternatives have been applied.

Rework the function so that it operates only on the boot CPU offset,
drop the unused alternative code sequence and internalise it into smp.c
alongside its only caller.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/percpu.h | 8 --------
 arch/arm64/kernel/smp.c         | 8 +++++++-
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index b57b2bb00967..3dc7291b16e9 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -12,14 +12,6 @@
 #include <asm/stack_pointer.h>
 #include <asm/sysreg.h>
 
-static inline void set_my_cpu_offset(unsigned long off)
-{
-	asm volatile(ALTERNATIVE("msr tpidr_el1, %0",
-				 "msr tpidr_el2, %0",
-				 ARM64_HAS_VIRT_HOST_EXTN)
-			:: "r" (off) : "memory");
-}
-
 static inline unsigned long __hyp_my_cpu_offset(void)
 {
 	/*
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index a61dc3016a11..702dee8d0db5 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -446,6 +446,12 @@ void __init smp_cpus_done(unsigned int max_cpus)
 	mark_linear_text_alias_ro();
 }
 
+static void __init set_boot_cpu_offset(void)
+{
+	asm volatile("msr tpidr_el1, %0"
+			:: "r" (per_cpu_offset(0)) : "memory");
+}
+
 void __init smp_prepare_boot_cpu(void)
 {
 	/*
@@ -453,7 +459,7 @@ void __init smp_prepare_boot_cpu(void)
 	 * setup_per_cpu_areas(), and CPU0's boot time per-cpu area will be
 	 * freed shortly, so we must move over to the runtime per-cpu area.
 	 */
-	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
+	set_boot_cpu_offset();
 
 	cpuinfo_store_boot_cpu();
 	setup_boot_cpu_features();
-- 
2.55.0.979.g7e5102b832-goog


