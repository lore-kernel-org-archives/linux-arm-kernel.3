Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB96C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sj/w3pZyayJwYB2bBkxj/mDTJQO3tU2/yuq10b/snTk=; b=UuWPf+V51qbpa/a1St2qja7Caq
	VIeaGHmEs5V+JVZr2Sgvkm9mZ88efQ8XpuqTuMCdjYB30s/xDLZCVxKJWLQbSEqe3nV0wxAPksNjP
	yChwV/N1MIlMQ3W8uKOtO1RG52ljsKqbGJ0I0EmBV7lyJh9zw4+4yZtR5J+j+4Z0H2mlfLz1qKQoy
	w90C347U47+SQZF9NSHbdlDWbZ0qJlqlfNXwnyMpjgKHaGQPKawK+mA3IXy4y+kKORkKc8kRg1oGv
	mhKrslLjreDa+Z+ZotRzV41lmqarrRg09YbcOwQYIbgWhaW3CUmWDEuobASBpJvkcj+yVrbTiFFH0
	+ooxEqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td9oK-00000007Du6-2ZEf;
	Wed, 29 Jan 2025 15:17:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td9n1-00000007Dpz-1bTp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 15:15:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4827F497;
	Wed, 29 Jan 2025 07:15:59 -0800 (PST)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F46C3F63F;
	Wed, 29 Jan 2025 07:15:32 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 4/3] arm64: proton-pack: Disable Spectre-BSE mitigation by default
Date: Wed, 29 Jan 2025 15:15:19 +0000
Message-Id: <20250129151519.3666718-1-james.morse@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250122174736.1560714-1-james.morse@arm.com>
References: <20250122174736.1560714-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_071539_470551_2CB705E5 
X-CRM114-Status: GOOD (  14.09  )
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

The Spectre-BSE vulnerability is hard to exploit, requiring abuse of
the branch history (which is small on these cores), confusing the branch
predictor, and finding a useful gadget to expose data.

Depending on the frequency of syscalls, the cost of mitigating this
is high - and platforms cannot chose between Spectre-v2 mitigation and
Spectre-BSE mitigation as they use the same firmware call.

Disable the Spectre-BSE mitigation by default, and add a command line
option to enable it in environments where this vulnerability is
considered a problem.

Signed-off-by: James Morse <james.morse@arm.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  5 +++++
 arch/arm64/kernel/proton-pack.c                 | 11 ++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index dc663c0ca670..7c8fd21bfbe4 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6250,6 +6250,11 @@
 				 may still be vulnerable to syscall attacks.
 			off    - Disable the mitigation.
 
+	spectre_bse	[ARM64,EARLY] Enable mitigations for Spectre-BSE (branch
+			status eviction) on vulnerable CPUs. Mitigations are disabled
+			by default due to the difficulty of exploitation and the cost
+			of mitigation.
+
 	spectre_v2=	[X86,EARLY] Control mitigation of Spectre variant 2
 			(indirect branch speculation) vulnerability.
 			The default operation protects the kernel from
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index cbe731ff1831..23f7238e6b70 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -1088,6 +1088,15 @@ static int __init parse_spectre_bhb_param(char *str)
 }
 early_param("nospectre_bhb", parse_spectre_bhb_param);
 
+/* Spectre-BSE mitigations are disabled by default */
+static bool __read_mostly __spectre_bse;
+static int __init parse_spectre_bse_param(char *str)
+{
+	__spectre_bse = true;
+	return 0;
+}
+early_param("spectre_bse", parse_spectre_bse_param);
+
 static void spectre_bhb_enable_fw_mitigation(enum bhb_mitigation_bits fw_wa)
 {
 	bp_hardening_cb_t cpu_cb;
@@ -1185,7 +1194,7 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 	/* Spectre BSE needs to upgrade the BHB mitigation to use firmware */
 	if (bse_upgrade_loop_mitigation) {
 		bse_state = spectre_bse_get_cpu_fw_mitigation_state(BHB_FW_WA1);
-		if (bse_state == SPECTRE_MITIGATED) {
+		if (bse_state == SPECTRE_MITIGATED && __spectre_bse) {
 			/*
 			 * For affected cores the firmware implementions of WA1
 			 * and WA3 are both sufficient for BSE, but what about
-- 
2.39.2


