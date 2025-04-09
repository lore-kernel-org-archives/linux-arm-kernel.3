Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E95C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYTrX66QGo+sUsjbHZzPg3+V1P2q13Jar8K9iDV01zA=; b=JzWjbAwnEF95ztROQ5tSyS1tJ4
	XGftSIPE0CM9LREEM/1aQvp7L++NUnRW+W2iu6KCplZY4ewqzrkwtcoyo7AL78bY3PwLOHN5LbRC6
	D13PiuKDzaFPC0XzgV4OtNmKUSKGyeChRgBn6xD07pKbmgEc/R6F2gpH4rD7NCAFXVoEyyy94QXoF
	aQ4SGYTffgPcng7Z+EzZRaAPdoURHAf9xomjWyyp4Wi4XJUnwPZKwUDW6fTpRAtqJsSisFka5jcSL
	Zyn8tkUsfneM2RVQDiGq9UfwZeI7iA/fieGsG9cC+ooeGvhnrwww+whW02G643h4cinbRoTNXun/I
	nPW/KP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Yrt-00000007z49-2wnA;
	Wed, 09 Apr 2025 17:05:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YTt-00000007uyk-3zmf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:40:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 116D51D6F;
	Wed,  9 Apr 2025 09:40:54 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5E5163F59E;
	Wed,  9 Apr 2025 09:40:52 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH v2 13/13] arm64/fpsimd: signal: Simplify preserve_tpidr2_context()
Date: Wed,  9 Apr 2025 17:40:10 +0100
Message-Id: <20250409164010.3480271-14-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250409164010.3480271-1-mark.rutland@arm.com>
References: <20250409164010.3480271-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_094054_032222_1C5CEBCA 
X-CRM114-Status: UNSURE (   9.92  )
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
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/signal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 0de9c452c6c0e..73f1ab56d81b2 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -478,13 +478,12 @@ extern int preserve_sve_context(void __user *ctx);
 
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


