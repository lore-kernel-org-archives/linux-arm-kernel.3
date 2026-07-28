Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F1EC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaoV7M8xK54TOShIe9LDJFDpBjhxfhmHY5ok78q8jf4=; b=vZjnj9o8l7OXpA
	NbkvG0AriXYJdxlaBAaKJSWmQNX2NTCyv79GsQu8B9u0Fj8k8Au0H1m5hWkL4/Qcz0bqb0YWICsDq
	hRSfxIt8ln0rBsCa7KkODTJHcMls9FuIbrBB93YBxqS1UspxkYeHr4Cu25P07OaGaGr1efgOiJH5V
	UJouf3laM7Lw+qLkiUYy+rRtK4c797QZftBac3DtjbUoZbkZ8S0ZBkruqcXEHOYYJVjRDnjvdzVf8
	9TBRUuK8PaaoIK3P5B+lRlXkDa5W7sOqg2EEF3NDZn2irqmnuXFXp1awo6H+TFgStEPWbNhADk47t
	I2WXDQ2AEYrs4mBgWbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh7O-00000005HF9-3kOC;
	Tue, 28 Jul 2026 12:41:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh6S-00000005Gbs-34td
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:40:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27385175D;
	Tue, 28 Jul 2026 05:40:08 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 62E793F86F;
	Tue, 28 Jul 2026 05:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785242412; bh=yLmrifSdu9uBeRu/ZTm5tps7A7KZZniygcl9x67XpLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qOgtv3HyprGwzrGiFrITNgFRCUtCqTBbUAAnRIDVdcvgTINFdLGNJh2TAq5U3246R
	 1x4gw2e7OwfCMpdHxLw/vvoCv9TPEDO2R2e3Xfec5PBdiYKywgdC3UATaY7yTtLA4+
	 OMpNwDidADp+JuIux5EzIXymtfKNmtnRHmxMLHK0=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 13/13] arm64: percpu: Remove _pcp_protect*() wrappers
Date: Tue, 28 Jul 2026 13:38:59 +0100
Message-Id: <20260728123859.2911495-14-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260728123859.2911495-1-mark.rutland@arm.com>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_054012_895593_E6FA8380 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Now that all this_cpu_*() operations are preemptible, there are no users
of _pcp_protect() or _pcp_protect_return().

Remove them both, along with the associated comment regarding
preemption.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/percpu.h | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 6785d1bc933b9..aa1fd9a09c7cb 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -343,33 +343,6 @@ PERCPU_CMPXCHG_OP(x,  , 64)
 #undef PERCPU_XCHG_OP
 #undef PERCPU_CMPXCHG_OP
 
-/*
- * It would be nice to avoid the conditional call into the scheduler when
- * re-enabling preemption for preemptible kernels, but doing that in a way
- * which builds inside a module would mean messing directly with the preempt
- * count. If you do this, peterz and tglx will hunt you down.
- *
- * Not to mention it'll break the actual preemption model for missing a
- * preemption point when TIF_NEED_RESCHED gets set while preemption is
- * disabled.
- */
-
-#define _pcp_protect(op, pcp, ...)					\
-({									\
-	preempt_disable_notrace();					\
-	op(raw_cpu_ptr(&(pcp)), __VA_ARGS__);				\
-	preempt_enable_notrace();					\
-})
-
-#define _pcp_protect_return(op, pcp, args...)				\
-({									\
-	typeof(pcp) __retval;						\
-	preempt_disable_notrace();					\
-	__retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);	\
-	preempt_enable_notrace();					\
-	__retval;							\
-})
-
 #define _pcp_wrap(op, pcp, ...)						\
 ({									\
 	op(&(pcp), __VA_ARGS__);					\
-- 
2.30.2


