Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E21CCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxkYEJUGySSxzS2ixA+Ci8e7ZpD90Ys46w1ywM29lW8=; b=i0RtH8/GwuIt7TyEnJqrp2p6sp
	+s4VPGxibPbo8TWjVErwraU6tMG6trMSoAu2ysnGCTVpTPIDBSdH2zGd6U9C49IhEbOZTyP1F4f0x
	P4A29Yqh5uuMdwrDOruecmRak3tzGbSqBnqcjRLU2gRwq3xOSXQJ+i4qRk7myKdqtfXKspYhzygjR
	f6oyGsEmHDZRfC7yKXgsSrW5ebcb/9RdJqa6/kFi+/jzBMnSUXex90HZl18tvMNU9k3BsK11vqOBx
	zWwPvHfIOtw2Y8qOd23YI7VUHii8gbpb9bnC3LfqcMDEuagj/TiKlXS0mAvuh7wZj8N6CJ2WJ6ER+
	Yq1Yvplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7WY-00000005zCC-3tib;
	Fri, 09 Oct 2026 10:08:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7WY-00000005zBN-1Hqz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:08:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B893060DC9;
	Fri,  9 Oct 2026 10:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D15D1F00893;
	Fri,  9 Oct 2026 10:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540501;
	bh=zxkYEJUGySSxzS2ixA+Ci8e7ZpD90Ys46w1ywM29lW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XkIwrFV+uODvTXAS3eVQBNQ5KZNsC0PR/tqjRCCwVKnRtmPcTl6N4bKWHxaoOBgDK
	 drri7VQIEFqTDk1NU0pU1ev+hRsXnzGm7jgtyYcOeV9Y8zxbKTPfaC5hCZT1P1jE+s
	 qly1sOx2owfr5ubcNcISzLxUIoxr1dD2O6fC+Am4TlUlO+2QXF+nZmDga/UUt3xgDs
	 +n9gwACl7LNnspENetoegdH4ubykoTqGidI0XmFWrmY8cmV8rNxmjIJkNGVQLUNr4A
	 vQOm81R9YFR/an4Uo4paOsu/+Tyc5dYst9h20bbhOcbYzQlmd62ugjeK10q+7dJk/v
	 C+VYcFmfWS/pg==
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
Subject: [PATCH v2 09/23] arm64: smp: Tidy up smp_prepare_cpus()
Date: Fri,  9 Oct 2026 11:07:20 +0100
Message-ID: <20261009100738.31288-10-will@kernel.org>
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

smp_prepare_cpus() is always run on the boot CPU (i.e. CPU 0) but goes
to great lengths to support running on a CPU where smp_processor_id()
is non-zero.

Clean up the code a little by hardcoding zero for the boot CPU ID.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/smp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index eac217b9ebf1..d2aa949e33a3 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -781,16 +781,14 @@ void __init smp_init_cpus(void)
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	const struct cpu_operations *ops;
-	int err;
 	unsigned int cpu;
-	unsigned int this_cpu;
+	int err;
 
 	init_cpu_topology();
 
-	this_cpu = smp_processor_id();
-	store_cpu_topology(this_cpu);
-	numa_store_cpu_info(this_cpu);
-	numa_add_cpu(this_cpu);
+	store_cpu_topology(0);
+	numa_store_cpu_info(0);
+	numa_add_cpu(0);
 
 	/*
 	 * If UP is mandated by "nosmp" (which implies "maxcpus=0"), don't set
@@ -805,8 +803,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	 * secondaries from the bootloader.
 	 */
 	for_each_possible_cpu(cpu) {
-
-		if (cpu == smp_processor_id())
+		if (cpu == 0)
 			continue;
 
 		ops = get_cpu_ops(cpu);
-- 
2.56.0.385.gd3acb90ef8-goog


