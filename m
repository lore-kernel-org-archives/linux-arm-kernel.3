Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83911C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 18:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/Cs8lYUGOH5SnjCmGX9zMXwzw+sPq2MDvbljJYlujY=; b=jaZntEwbrst2kux1RR7QfdFcVR
	+wg3FIvOt/Id8erEnHRqfuhFQCStLCEAcoXlZqIfWl/cBKZG1qrhnvkna0mcBf2I6wbq8kT7WRTrz
	jc+PaMFyvDV+GPTBfhv/laRc6mHnVMyixSTgXl59D6YPakgAHzKLCC8LnbbzBz6ASQIC0FE4w+0xz
	H9DkOgVzcMk9mUAes4mLwOn+JZ+xVO4i1dqxzw5OZRMuNsBZRGgvn7Q8D5mSSC3VjK6GuIqHQVEj3
	V5WjXJc9WFwLbEGipjOfTci3WL3RxA3HNLnXvMHHPZhaA8hIGKQ+k0f6aXcozl0Oq5cbnPdjSf/MV
	pVEXnXKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lX3-0000000CV8C-0Vg8;
	Fri, 04 Apr 2025 18:12:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0l6O-0000000CRUR-1kCt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 17:45:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BD661515;
	Fri,  4 Apr 2025 10:45:14 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB3EA3F63F;
	Fri,  4 Apr 2025 10:45:10 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH 14/14] arm64/fpsimd: signal: Simplify preserve_tpidr2_context()
Date: Fri,  4 Apr 2025 18:44:35 +0100
Message-Id: <20250404174435.3288106-15-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250404174435.3288106-1-mark.rutland@arm.com>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_104512_503290_49721E22 
X-CRM114-Status: UNSURE (   9.65  )
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

During a context-switch, tls_thread_switch() reads and writes a task's
thread_struct::tpidr2_el0 field. Other code shouldn't access this field
for an active task, as such accesses would form a data-race with a
concurrent context-switch.

The usage in preserve_tpidr2_context() is suspicious, but benign as any
race with a context switch will write the same value back to
current->thread.tpidr2_el0.

Make this clearer and match restore_tpidr2_context() by using a
temporary variable instead, avoiding the (benign) data-race.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/signal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index b27357aeba065..a4e3d4273a360 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -476,13 +476,12 @@ extern int preserve_sve_context(void __user *ctx);
 
 static int preserve_tpidr2_context(struct tpidr2_context __user *ctx)
 {
+	u64 tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
 	int err = 0;
 
-	current->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
-
 	__put_user_error(TPIDR2_MAGIC, &ctx->head.magic, err);
 	__put_user_error(sizeof(*ctx), &ctx->head.size, err);
-	__put_user_error(current->thread.tpidr2_el0, &ctx->tpidr2, err);
+	__put_user_error(tpidr2_el0, &ctx->tpidr2, err);
 
 	return err;
 }
-- 
2.30.2


