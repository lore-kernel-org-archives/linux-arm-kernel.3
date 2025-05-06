Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D37C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 19:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJnBEr6oEbbJ1M2G7snvQFm6twCwJgFPUGq2P6AQ7Fw=; b=DRFBebA1/HHBLg07jTGAwufC38
	cJBdnaL8QD1FgFL5iIPN1DKnEAjzyuyl9srI00q73PPBbeab1XKYXUbYtanRxvcyGKZKbKgvU3ard
	6m9kMMrarf2V0aadS8X8akShcSw5fNuQ0TakUy5g0uYxbLxpJx1VU5QfVsrqwCJ6/8eneP+d4sNwW
	jMqM7uKELKrG6ytABwuzQ6tMW65Z5UkBmMX8GILKeVFd2MViCW3Mx34obbW3Rrfhm9jH9qE7LhBEd
	JIdmEPANcMxGx/lfudh9r02xKr+/Z2/vqHUppwjyBEllWzl/CsmlajAKp80q7zFPEBcVhb6SKuvKR
	H6gWxDQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOD2-0000000DG8F-2mbO;
	Tue, 06 May 2025 19:44:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKBe-0000000CUXs-0yu2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 15:26:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2811D339;
	Tue,  6 May 2025 08:26:16 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 708273F58B;
	Tue,  6 May 2025 08:26:23 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	daniel.kiss@arm.com,
	david.spickett@arm.com,
	luis.machado@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	richard.sandiford@arm.com,
	sander.desmalen@arm.com,
	tabba@google.com,
	tamas.petz@arm.com,
	tkjos@google.com,
	will@kernel.org,
	yury.khrustalev@arm.com
Subject: [PATCH 16/20] arm64/fpsimd: ptrace: Save task state before generating SVE header
Date: Tue,  6 May 2025 16:25:19 +0100
Message-Id: <20250506152523.1107431-17-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250506152523.1107431-1-mark.rutland@arm.com>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_082626_339464_DBB2F69D 
X-CRM114-Status: GOOD (  12.33  )
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

As sve_init_header_from_task() consumes the saved value of PSTATE.SM and
the saved fp_type, both must be saved before the header is generated.

When generating a coredump for the current task, sve_get_common() calls
sve_init_header_from_task() before saving the task's state. Consequently
the header may be bogus, and the contents of the regset may be
misleading.

Fix this by saving the task's state before generting the header.

Fixes: e12310a0d30f ("arm64/sme: Implement ptrace support for streaming mode SVE registers")
Fixes: b017a0cea627 ("arm64/ptrace: Use saved floating point state type to determine SVE layout")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Spickett <david.spickett@arm.com>
Cc: Luis Machado <luis.machado@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index bdba106a4cf29..67f3843de51f5 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -820,15 +820,15 @@ static int sve_get_common(struct task_struct *target,
 	unsigned int vq;
 	unsigned long start, end;
 
+	if (target == current)
+		fpsimd_preserve_current_state();
+
 	/* Header */
 	sve_init_header_from_task(&header, target, type);
 	vq = sve_vq_from_vl(header.vl);
 
 	membuf_write(&to, &header, sizeof(header));
 
-	if (target == current)
-		fpsimd_preserve_current_state();
-
 	BUILD_BUG_ON(SVE_PT_FPSIMD_OFFSET != sizeof(header));
 	BUILD_BUG_ON(SVE_PT_SVE_OFFSET != sizeof(header));
 
-- 
2.30.2


