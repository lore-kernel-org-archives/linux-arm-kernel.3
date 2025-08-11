Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9850CCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RuetYjBjH9nVj0M5j0Mkl5rej27wV4Ju+ZdjphNu78w=; b=H0CvrwTo/wLd4Z
	TTgVQISOBBNvjRFiA8r0IYeggl5yn0VBH8GgF+6mPrEZ4rcdmjO1jUYh6PuHqRMTjqgo/ypUNs1aS
	Ed8ZB/FNDLIeJLLjmGzW8IZGdGjSKxsC/Zf6PGPcULel3eL9YXBO73E4YLQ4h3UMytj3UUhzDOorM
	XbCAbQW5JjIJk5HwZLjOLOhMcVss/zDjTDzKkQ3/llToOlTFzZkKPVyKeMiaOmDdS6d02O6wZMgjM
	iehUWOC6R2cKm75odPiQTvvcffwSgY1o27vOjrlGFHBY+VSPcxsPi5zFQzUa0DneDUY87S5cnoJk4
	HDon+2wilirnEyQfu1lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaai-000000099R5-49j6;
	Mon, 11 Aug 2025 22:02:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUz3-00000008JvT-2sBR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 16:02:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC053266C;
	Mon, 11 Aug 2025 09:02:40 -0700 (PDT)
Received: from [10.1.28.163] (e137867.arm.com [10.1.28.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCB213F738;
	Mon, 11 Aug 2025 09:02:44 -0700 (PDT)
Message-ID: <4242ef37-efeb-446f-abbc-0104b805ad12@arm.com>
Date: Mon, 11 Aug 2025 17:02:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 5/7] arm64: entry: Refactor
 preempt_schedule_irq() check code
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-6-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250729015456.3411143-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_090249_799117_18D99452 
X-CRM114-Status: GOOD (  15.13  )
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
Cc: mark.rutland@arm.com, sstabellini@kernel.org, puranjay@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, liaochang1@huawei.com, oleg@redhat.com, kristina.martsenko@arm.com, linux-kernel@vger.kernel.org, broonie@kernel.org, chenl311@chinatelecom.cn, xen-devel@lists.xenproject.org, leitao@debian.org, ryan.roberts@arm.com, akpm@linux-foundation.org, mbenes@suse.cz, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 29/07/2025 02:54, Jinjie Ruan wrote:

> ARM64 requires an additional check whether to reschedule on return
> from interrupt. So add arch_irqentry_exit_need_resched() as the default
> NOP implementation and hook it up into the need_resched() condition in
> raw_irqentry_exit_cond_resched(). This allows ARM64 to implement
> the architecture specific version for switching over to
> the generic entry code.
>
> To align the structure of the code with irqentry_exit_cond_resched()
> from the generic entry code, hoist the need_irq_preemption()
> and IS_ENABLED() check earlier. And different preemption check functions
> are defined based on whether dynamic preemption is enabled.
>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
Unrelated to the other thread : I noticed that compiling this patch
with `allnoconfig` would fail :
- `raw_irqentry_exit_cond_resched` has no previous prototype,
   as it is defined within `#ifdef CONFIG_PREEMPTION`
- `irqentry_exit_cond_resched()` is not declared, as it is also within
   `#ifdef CONFIG_PREEMPTION`

The patch below fixes the issue, but introduces merge conflicts in
patches 6 and 7, plus the `#ifdef` needs to be moved accordingly
in patch 6 and the empty "without preemption" `irq_exit_cond_resched()`
needs to be removed in patch 7.

I hope this can be useful,
Ada

---
diff --git a/arch/arm64/include/asm/preempt.h 
b/arch/arm64/include/asm/preempt.h
index 0f0ba250efe8..d9aba8b1e466 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -103,6 +103,8 @@ void dynamic_irqentry_exit_cond_resched(void);
  #define irqentry_exit_cond_resched() raw_irqentry_exit_cond_resched()

  #endif /* CONFIG_PREEMPT_DYNAMIC */
+#else /* CONFIG_PREEMPTION */
+#define irqentry_exit_cond_resched() {}
  #endif /* CONFIG_PREEMPTION */

  #endif /* __ASM_PREEMPT_H */
diff --git a/arch/arm64/kernel/entry-common.c 
b/arch/arm64/kernel/entry-common.c
index 4f92664fd46c..abd7a315145e 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -661,6 +661,7 @@ static __always_inline void __el1_pnmi(struct 
pt_regs *regs,
         arm64_exit_nmi(regs, state);
  }

+#ifdef CONFIG_PREEMPTION
  void raw_irqentry_exit_cond_resched(void)
  {
         if (!preempt_count()) {
@@ -668,6 +669,7 @@ void raw_irqentry_exit_cond_resched(void)
                         preempt_schedule_irq();
         }
  }
+#endif

  #ifdef CONFIG_PREEMPT_DYNAMIC
  DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);


