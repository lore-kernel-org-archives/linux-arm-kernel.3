Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC33DCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfYru359989qybb+HRJKrSMrtzS58v51ok2h/fUvsOk=; b=EL4L71R8BuLnV5anbr1z+azUoO
	79rt4Hv49LFKC90q0JApd39PZQxCbH4Jh5tuebIkVrlrioxmSHepAMx3X75TLcVGfDzH11R/ELSqe
	uQ4pU9Ko2d832BYjddY4z9OJxQE0g4XH2Vp0hUMNohQiLt26H0JjAkw5WJHBDHvwCT7C711jONKDE
	JgSsfO1GkZP067lUD/qxyBtiaFQtqW84FFNgYa33tNhya0IBNEy9i6RnBl6AbHV/CpdOYFgO/6OVi
	XnIMQ3gSIw9tyLQSQHhtFgaty0y/4OcYxqlDNpeYvSLXBn+N1xcPRwBcr/nMNzyHAPhl2eoOGjRsb
	YRAjohaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh92-0000000BWHo-2jKK;
	Sat, 25 Oct 2025 16:29:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh91-0000000BWHJ-2iNr;
	Sat, 25 Oct 2025 16:29:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 184DB60618;
	Sat, 25 Oct 2025 16:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EEB8C4CEFB;
	Sat, 25 Oct 2025 16:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409770;
	bh=vokghphZFN7cPlJYGHUkiv2cttRvCZNnrb6NHwYUJ1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eAotVmFVX3zIEdvLhVQcYGs4HTZaSQD/73eLPX5z3+wnypPAZu/Y5u2RNkYAKyP3N
	 mEoZMk5U04Re2ezGSm6b5ljxhrLtP/3RhUFhnqkj+ptiaOGIiBFK+tBe0Kb3F7i+rs
	 cfCovJBZjwwEa5pkZDr3k09sCdxFYsAfdImxoTj1g/9VaX8fLEC/1w5HZnNDtL84Xl
	 rE36pm1aaNJrULBo/ZBYTHgvgm+ATfuDfpugM9pIvf60TA4l5mXfxTGJapjiN8e0w6
	 OLuaAWhaU//XCEcC3q1uAlqPgOVcU0qk0KaVZHkl4UGIIocMoIaz52oaLVO8b/Tsw/
	 g8jCkiqmEvqPg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Sasha Levin <sashal@kernel.org>,
	hawk@kernel.org,
	ilias.apalodimas@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-5.15] page_pool: always add GFP_NOWARN for ATOMIC allocations
Date: Sat, 25 Oct 2025 12:01:29 -0400
Message-ID: <20251025160905.3857885-458-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
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

From: Jakub Kicinski <kuba@kernel.org>

[ Upstream commit f3b52167a0cb23b27414452fbc1278da2ee884fc ]

Driver authors often forget to add GFP_NOWARN for page allocation
from the datapath. This is annoying to users as OOMs are a fact
of life, and we pretty much expect network Rx to hit page allocation
failures during OOM. Make page pool add GFP_NOWARN for ATOMIC allocations
by default.

Reviewed-by: Mina Almasry <almasrymina@google.com>
Link: https://patch.msgid.link/20250912161703.361272-1-kuba@kernel.org
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my extensive research and analysis of this commit, here is my
determination:

## **BACKPORT RECOMMENDATION: YES**

## Detailed Analysis

### What This Commit Does

This commit adds the `__GFP_NOWARN` flag to GFP_ATOMIC allocations in
the page_pool subsystem by modifying the
`__page_pool_alloc_netmems_slow()` function in `net/core/page_pool.c`.
The change is minimal (6 lines) and specifically targets atomic
allocations that occur during network packet reception in NAPI context.

**Code change at net/core/page_pool.c:554-558:**
```c
+   /* Unconditionally set NOWARN if allocating from NAPI.
+    * Drivers forget to set it, and OOM reports on packet Rx are
useless.
+    */
+   if ((gfp & GFP_ATOMIC) == GFP_ATOMIC)
+       gfp |= __GFP_NOWARN;
```

This modification affects both bulk page allocations (via
`alloc_pages_bulk_node`) and high-order page allocations (via
`__page_pool_alloc_page_order`).

### Historical Context and Broader Pattern

Through extensive git history analysis, I discovered this is part of a
**systematic effort by Jakub Kicinski** to address OOM warnings in the
network stack:

1. **March 2024** (commit 6e9b01909a811): Modified `napi_alloc_skb()` to
   hardcode `GFP_ATOMIC | __GFP_NOWARN`
   - Commit message stated: *"the resulting OOM warning is the top
     networking warning in our fleet"* (Meta's production environment)
   - Rationale: *"allocation failures in atomic context will happen, and
     printing warnings in logs, effectively for a packet drop, is both
     too much and very likely non-actionable"*

2. **August 2024** (commit c89cca307b209): Added `__GFP_NOWARN` to
   skbuff ingress allocations
   - Similar rationale: *"build_skb() and frag allocations done with
     GFP_ATOMIC will fail in real life, when system is under memory
     pressure, and there's nothing we can do about that. So no point
     printing warnings."*

3. **September 2025** (this commit): Extends the same principle to
   page_pool allocations

### Existing Precedent Validates This Approach

My code research revealed:

**Helper function already uses this pattern**
(include/net/page_pool/helpers.h:92-96):
```c
static inline struct page *page_pool_dev_alloc_pages(struct page_pool
*pool)
{
    gfp_t gfp = (GFP_ATOMIC | __GFP_NOWARN);
    return page_pool_alloc_pages(pool, gfp);
}
```

**Drivers manually adding NOWARN since 2022**:
- `drivers/net/ethernet/mediatek/mtk_eth_soc.c:1916` - Added in July
  2022 (commit 23233e577ef973)
- `drivers/net/vmxnet3/vmxnet3_drv.c:1425` - Also includes manual NOWARN

This demonstrates driver authors were already aware of the need for
`__GFP_NOWARN` with page_pool allocations, validating the approach.

### Why This Should Be Backported

**1. Fixes Real User-Visible Issue**
- OOM warnings during network Rx are non-actionable and create log spam
- Confirmed as "top networking warning" at large-scale deployments
  (Meta)
- OOM during memory pressure is expected behavior, not an error
  condition
- Warnings provide no value but clutter logs and may trigger false
  alarms

**2. Minimal Risk**
- Only 6 lines of code added to a single function
- Only suppresses warning messages, doesn't change allocation behavior
- Allocation failures are still detected and properly handled by drivers
- Network stack provides proper statistics via qstats (rx-alloc-fail
  counter)
- No change to actual page allocation logic or error handling paths

**3. No Regressions Found**
- No subsequent commits fixing or reverting this change
- No Fixes: tags referencing this commit
- Commit has been in mainline since September 2025 with no reported
  issues
- Subsequent commit (a1b501a8c6a87) is unrelated (pool size clamping)

**4. Makes Behavior Consistent**
- Aligns with existing helper function behavior
- Removes burden from driver authors who often forget this flag
- Prevents inconsistency where some drivers add NOWARN and others don't
- Follows established pattern from napi_alloc_skb() and skbuff
  allocations

**5. Meets Stable Kernel Criteria**
- ✅ Fixes a real bug that bothers people (log spam annoys users and
  operators)
- ✅ Obviously correct (trivial change, well-understood semantics)
- ✅ Small and self-contained (6 lines, single file)
- ✅ No regression risk (only suppresses warnings)
- ✅ No API changes (internal implementation detail)

### Technical Correctness

**GFP_ATOMIC context** (from include/linux/gfp_types.h:316-318):
> "GFP_ATOMIC users can not sleep and need the allocation to succeed. A
lower watermark is applied to allow access to 'atomic reserves'."

**__GFP_NOWARN semantics** (from include/linux/gfp_types.h:274):
> "__GFP_NOWARN suppresses allocation failure reports."

The change is semantically correct: When page_pool allocates pages in
atomic context (NAPI), allocation failures are expected during OOM and
warnings serve no purpose. The allocation failure is still detected and
handled - only the noisy warning is suppressed.

### Why Not Explicitly Tagged for Stable

While the commit lacks a `Cc: stable` tag, this doesn't necessarily mean
it shouldn't be backported. Examining similar commits:
- Neither the napi_alloc_skb nor skbuff NOWARN commits had explicit
  stable tags
- Quality-of-life improvements often aren't tagged by authors but are
  valuable for stable trees
- Stable backport decisions should be based on technical merit and user
  benefit

### Potential Concerns Addressed

**"Does this hide real bugs?"**
No - drivers still detect and handle allocation failures. The difference
is only in logging.

**"Could this affect debugging?"**
Minimal impact - allocation failures are tracked via qstats. OOM
warnings during memory pressure are expected, not diagnostic.

**"Is this actually a bug fix?"**
Yes - it fixes the "bug" of annoying, non-actionable log spam that
affects production deployments at scale.

### Conclusion

This commit should be backported because it:
1. Solves a real, annoying user-visible problem (confirmed at production
   scale)
2. Has essentially zero risk (only suppresses warnings)
3. Is part of a well-vetted, systematic improvement
4. Makes the page_pool behavior consistent with established patterns
5. Reduces operational burden and log noise

While this is more of a quality-of-life improvement than a critical
functional fix, the combination of high user benefit, zero risk, and
strong technical justification makes it a good candidate for stable
backporting.

**Final Answer: YES** - This commit should be backported to stable
kernel trees.

 net/core/page_pool.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 19c92aa04e549..e224d2145eed9 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -596,6 +596,12 @@ static noinline netmem_ref __page_pool_alloc_netmems_slow(struct page_pool *pool
 	netmem_ref netmem;
 	int i, nr_pages;
 
+	/* Unconditionally set NOWARN if allocating from NAPI.
+	 * Drivers forget to set it, and OOM reports on packet Rx are useless.
+	 */
+	if ((gfp & GFP_ATOMIC) == GFP_ATOMIC)
+		gfp |= __GFP_NOWARN;
+
 	/* Don't support bulk alloc for high-order pages */
 	if (unlikely(pp_order))
 		return page_to_netmem(__page_pool_alloc_page_order(pool, gfp));
-- 
2.51.0


