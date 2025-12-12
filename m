Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08080D43369
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 06:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tguberSfCkZI5bjsxXDvzMFEZt1a4W4d2EaDprlMu9E=; b=ZxPFM8f+nujWfMuSDTz9v5lk5+
	M+VVOSfU1+HlzzsRTUFf3xr+eF+EdVnAKdguoA721+VoeYZp+fVNvxK0iL9LZaWuIY7Ng9tMNhfQc
	gwPDjSJxsgodwErDGYQ19FFdp87WvagT+3ueilcSh71HX027PXDfEcvUO4qVTtPM11qwrKBeVdEUM
	XV9G64QqwvrpqUqPCByzqDfygpgsVc8w4ER1CGaq0s9tHTJaik2GcVEgGgHULqdgQzQfKsnBRivdX
	G1vkeEngjTtukN2Kk07ZvL2bZzg4T1pKFYhaE8FS+NoWn0Pnt6Gbi6F4HZQeK9EdQGBSaoseHzqXl
	hRGCqBKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTwOI-000000009Kb-1P1H;
	Fri, 12 Dec 2025 06:12:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTwOH-000000009KV-1teC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 06:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58ECE60123;
	Fri, 12 Dec 2025 06:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9964CC16AAE;
	Fri, 12 Dec 2025 06:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765519952;
	bh=tu35v5JnahKDsmp5vWzJfU95RMwm0sPSKcmBSUpkSDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Szdrq9GDzcfXkTz1z+U+6vV8FIPOGzAfB01ToY0aURn2Eqmimse2bmGIiuHu9i6fZ
	 jPdpVxBN2O5t9+uT3j1gdpDRQZQZ+tAuqGdPrKrCaTCFTLomVvogf6x5myDGhBhKO7
	 6qhV6yNRgnZ6/NCpE4fiFWVwpKRZc7S/BfrQZQYITFzeIMEERG3TYrwsMnJTQqR98k
	 jJFvZuwRYVhjsSklsVmrbEfb0LWxxaYs02uTYnTM6rXxYPyaOGyShTPWFLMhzN53Jx
	 tFqp/3Gak1U44YAiDTbMJZB60eVjI6ASl1i7EZnKnX+qVpM2VfEept5Nw5F1kZtns5
	 YJDDUN+dIcHoA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Sasha Levin <sashal@kernel.org>,
	linux@armlinux.org.uk,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	nathan@kernel.org,
	kees@kernel.org,
	peterz@infradead.org,
	lumag@kernel.org,
	richard@nod.at,
	chrisi.schrefl@gmail.com,
	lukas.bulwahn@redhat.com,
	afd@ti.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH AUTOSEL 6.18-5.10] ARM: 9461/1: Disable HIGHPTE on PREEMPT_RT kernels
Date: Fri, 12 Dec 2025 01:12:12 -0500
Message-ID: <20251212061223.305139-2-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251212061223.305139-1-sashal@kernel.org>
References: <20251212061223.305139-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18
Content-Type: text/plain; charset=UTF-8
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

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

[ Upstream commit fedadc4137234c3d00c4785eeed3e747fe9036ae ]

gup_pgd_range() is invoked with disabled interrupts and invokes
__kmap_local_page_prot() via pte_offset_map(), gup_p4d_range().
With HIGHPTE enabled, __kmap_local_page_prot() invokes kmap_high_get()
which uses a spinlock_t via lock_kmap_any(). This leads to an
sleeping-while-atomic error on PREEMPT_RT because spinlock_t becomes a
sleeping lock and must not be acquired in atomic context.

The loop in map_new_virtual() uses wait_queue_head_t for wake up which
also is using a spinlock_t.

Since HIGHPTE is rarely needed at all, turn it off for PREEMPT_RT
to allow the use of get_user_pages_fast().

[arnd: rework patch to turn off HIGHPTE instead of HAVE_PAST_GUP]

Co-developed-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

# Commit Analysis: ARM: 9461/1: Disable HIGHPTE on PREEMPT_RT kernels

## 1. COMMIT MESSAGE ANALYSIS

**Problem identified**: The commit addresses a "sleeping-while-atomic"
bug on PREEMPT_RT ARM kernels. The issue occurs because:
- `gup_pgd_range()` runs with interrupts disabled (atomic context)
- With HIGHPTE enabled, the code path calls `kmap_high_get()` which
  acquires a `spinlock_t` via `lock_kmap_any()`
- On PREEMPT_RT, `spinlock_t` becomes a sleeping lock (mutex)
- Attempting to acquire a sleeping lock in atomic context is a bug

**Tags present**:
- Acked-by: Linus Walleij (ARM/pinctrl maintainer)
- Reviewed-by: Arnd Bergmann (major ARM contributor)
- Signed-off-by: Sebastian Andrzej Siewior (PREEMPT_RT maintainer)
- Signed-off-by: Russell King (ARM maintainer)

**Missing tags**: No `Cc: stable@vger.kernel.org` or `Fixes:` tag.

## 2. CODE CHANGE ANALYSIS

The change is a single-line Kconfig modification:

```diff
- depends on HIGHMEM
+       depends on HIGHMEM && !PREEMPT_RT
```

This simply prevents the `HIGHPTE` configuration option from being
selected when `PREEMPT_RT` is enabled. The technical mechanism of the
bug is clear:

1. `get_user_pages_fast()` → `gup_pgd_range()` (runs with interrupts
   disabled)
2. → `pte_offset_map()` → `__kmap_local_page_prot()` → `kmap_high_get()`
3. `kmap_high_get()` calls `lock_kmap_any()` which uses `spinlock_t`
4. On PREEMPT_RT: `spinlock_t` = sleeping lock → BUG in atomic context

The commit message notes that "HIGHPTE is rarely needed at all" - it's
an optimization to put page tables in high memory, which is typically
unnecessary on modern systems.

## 3. CLASSIFICATION

- **Bug type**: Runtime crash/BUG (sleeping-while-atomic violation)
- **Not a new feature**: Disables a problematic configuration
  combination
- **Not a security fix**: No CVE or security-sensitive code
- **Build fix category**: No, this is a runtime issue

## 4. SCOPE AND RISK ASSESSMENT

**Scope**:
- 1 file changed (`arch/arm/Kconfig`)
- 1 line modified
- Affects only ARM + PREEMPT_RT + HIGHMEM configurations

**Risk**: **Very low**
- This is a Kconfig dependency change only
- Users who previously had HIGHPTE enabled will now have it disabled on
  PREEMPT_RT
- The workaround is conservative (disable the problematic feature rather
  than complex code fixes)
- Cannot introduce regressions in other code paths

## 5. USER IMPACT

**Affected users**: ARM systems running PREEMPT_RT kernels with HIGHMEM
(systems with >~800MB RAM on 32-bit ARM)

**Severity**: High for affected users
- `get_user_pages_fast()` is a commonly used path for I/O and memory
  management
- Without this fix, users would hit kernel warnings/crashes when GUP
  fast path is used
- This completely breaks PREEMPT_RT usability on affected configurations

## 6. STABILITY INDICATORS

**Review chain is strong**:
- Sebastian Andrzej Siewior (PREEMPT_RT maintainer) developed this
- Arnd Bergmann reworked and reviewed it
- Linus Walleij acked it
- Russell King (ARM maintainer) accepted it

## 7. DEPENDENCY CHECK

This is a standalone Kconfig change. Dependencies:
- `PREEMPT_RT` must exist in the kernel - PREEMPT_RT was merged into
  mainline in kernel 6.12
- `HIGHPTE` and `HIGHMEM` options exist on ARM in all relevant kernel
  versions

The fix should apply cleanly to any stable tree with PREEMPT_RT support.

## STABLE KERNEL CRITERIA EVALUATION

| Criterion | Assessment |
|-----------|------------|
| Obviously correct | ✅ Yes - disables problematic config combination |
| Fixes real bug | ✅ Yes - sleeping-while-atomic crash |
| Important issue | ✅ Yes - crashes on PREEMPT_RT systems |
| Small and contained | ✅ Yes - 1 line Kconfig change |
| No new features | ✅ Yes - only disables an option |
| Clean application | ✅ Yes - simple dependency addition |

## CONCERNS

1. **No explicit stable request**: Maintainers didn't add `Cc: stable`.
   However, the fix is clearly appropriate for stable.
2. **PREEMPT_RT availability**: Only relevant for kernels 6.12+ where
   PREEMPT_RT was merged into mainline.

## CONCLUSION

This commit fixes a real, reproducible crash on ARM PREEMPT_RT systems.
The fix is minimal (1 line), obviously correct (disables problematic
feature combination), well-reviewed by relevant maintainers (ARM, RT),
and carries essentially zero risk. While there's no explicit stable tag,
the technical merits strongly support backporting.

The sleeping-while-atomic bug would make `get_user_pages_fast()`
unusable on affected configurations, which is a serious correctness
issue for PREEMPT_RT users who require deterministic behavior.

**YES**

 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 4fb985b76e97f..70cd3b5b5a059 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1215,7 +1215,7 @@ config HIGHMEM
 
 config HIGHPTE
 	bool "Allocate 2nd-level pagetables from highmem" if EXPERT
-	depends on HIGHMEM
+	depends on HIGHMEM && !PREEMPT_RT
 	default y
 	help
 	  The VM uses one page of physical memory for each page table.
-- 
2.51.0


