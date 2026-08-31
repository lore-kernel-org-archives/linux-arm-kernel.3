Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4201CC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUf6ryr4k5wygbciAqCC4GJMVIQgnWiFUIM3Fc8zmc0=; b=ev9OULEi1sub26WWVatpBAVI88
	pD5HnPe9I7hOjGnTveaJz25gsa03op7mw87GazcZ3IDHSUIB+s/5A4S4yCn9iNwIKNazMoJZ+sms1
	A7nD9qLXKdnSOAqIOsTTGjUyRM6jBsujpzV7UEVxNAzzcoeplZfRcRZz6OTw4YBh+O71MobHqiJLe
	gtdyp7t0FZgEbe6FyfpmCr/ydDBSirQ2fjdCI9EOJhTic0QFEbqNJ+83mCCcuHaa6gLztH1s3Nnsw
	llWi4wxGO4W0lqHmbhwFL71al2N6e3sWYWGaDmef5R/I2FC60hdJIGr31O+ZvW9iEK0CPVpQ4EI4w
	ZEYOvrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Et-00000009SSb-08RW;
	Mon, 31 Aug 2026 13:39:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Eq-00000009SQd-1F0G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:39:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD919601FD;
	Mon, 31 Aug 2026 13:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3101F00ACF;
	Mon, 31 Aug 2026 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183591;
	bh=PUf6ryr4k5wygbciAqCC4GJMVIQgnWiFUIM3Fc8zmc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pdc1WjYK/l89/5siC59YAL1Sr7s3V49zW+hckkNRh7rdSjYtnTe9q5LBfPZl68Nae
	 F4FG334q27j6QqmOluURmITGmJF0oE0oi4P2Qj/tsO4a6wNI8+jlwhq8RTeAUzX2NI
	 08fmRhb31nfE1RSuEGJ9yVBAL3kh6Xt0NHDf2166aStYCSJEQCaBpW8tBA0KV9xcZ7
	 3f8saAwGcTDh4KA8ctSibvOP7JBEmUejLvW8rCS7eeNJBW47GZMSEAL7fLugAGOzZk
	 zISA6xCEXLuXWX//G6JqlOMSn4qzElRiaTSrTyiox7NyvfOItDT4gyk4+7YGJPq09T
	 s4RABvadMpbAg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Leonardo Bras <leo.bras@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-5.10] arm64/daifflags: Make local_daif_*() helpers __always_inline
Date: Mon, 31 Aug 2026 09:23:34 -0400
Message-ID: <20260831133314.4125787-186-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831133314.4125787-1-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.48
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

From: Leonardo Bras <leo.bras@arm.com>

[ Upstream commit 827ce94e0897a70241abf810b1d3d7d083053a39 ]

Make sure those helpers are always inlined and instrumentation safe.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Leonardo Bras <leo.bras@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

That check also confirms the fix is **not** in this tree: the latest
`daifflags`-related commit is `8cb7eff32cc00` (PMR restore operations),
and the `-S'__always_inline void local_daif'` search found no matches.
Backport recommendation remains **YES**.

 arch/arm64/include/asm/daifflags.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
index 5fca480090434..795b351284673 100644
--- a/arch/arm64/include/asm/daifflags.h
+++ b/arch/arm64/include/asm/daifflags.h
@@ -19,7 +19,7 @@
 
 
 /* mask/save/unmask/restore all exceptions, including interrupts. */
-static inline void local_daif_mask(void)
+static __always_inline void local_daif_mask(void)
 {
 	WARN_ON(system_has_prio_mask_debugging() &&
 		(read_sysreg_s(SYS_ICC_PMR_EL1) == (GIC_PRIO_IRQOFF |
@@ -38,7 +38,7 @@ static inline void local_daif_mask(void)
 	trace_hardirqs_off();
 }
 
-static inline unsigned long local_daif_save_flags(void)
+static __always_inline unsigned long local_daif_save_flags(void)
 {
 	unsigned long flags;
 
@@ -53,7 +53,7 @@ static inline unsigned long local_daif_save_flags(void)
 	return flags;
 }
 
-static inline unsigned long local_daif_save(void)
+static __always_inline unsigned long local_daif_save(void)
 {
 	unsigned long flags;
 
@@ -64,7 +64,7 @@ static inline unsigned long local_daif_save(void)
 	return flags;
 }
 
-static inline void local_daif_restore(unsigned long flags)
+static __always_inline void local_daif_restore(unsigned long flags)
 {
 	bool irq_disabled = flags & PSR_I_BIT;
 
@@ -124,7 +124,7 @@ static inline void local_daif_restore(unsigned long flags)
  * Called by synchronous exception handlers to restore the DAIF bits that were
  * modified by taking an exception.
  */
-static inline void local_daif_inherit(struct pt_regs *regs)
+static __always_inline void local_daif_inherit(struct pt_regs *regs)
 {
 	unsigned long flags = regs->pstate & DAIF_MASK;
 
-- 
2.53.0


