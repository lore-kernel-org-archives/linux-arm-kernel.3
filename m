Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5866C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 17:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i7R8z0fWfdikUJKaL78mjsRuSRfEyFZMi03wrinp9mw=; b=cNAZne4YZipV7AyAbe/kRi54SI
	mrfFg7nyUHM2yAD+NxQO95OV69SxdLIEVYjJp1qDaC9c5RAoXfA5romTtQ1FYO6gKMjOa7tkWMdIE
	QpTwXZVdsRP4bd+vwf8gkwp8g0pMf6KyDkqIJVYxAuQn1R6DnpWWtzkLGGaF8jhErcTm4y958aEsW
	zRfQqsoLThBEZ8PAFDXnUa++tS9pj1A888MbBEtVl6v8gEz4VXv2b0onnEiLrHtjThKTczjcWfghO
	3XjNKMJw5tQjgFlflkMP8hCcPMwd9h4Ox7A5LGiA1cggUdHxSS/RsFad/jLckQ0JBGmtFJD+LNs3F
	AK5n2bxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uABKi-0000000DYqz-2g78;
	Wed, 30 Apr 2025 17:34:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uABIm-0000000DYl8-0sxX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 17:32:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B0061063;
	Wed, 30 Apr 2025 10:32:45 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B4073F5A1;
	Wed, 30 Apr 2025 10:32:51 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH] arm64/fpsimd: Avoid warning when sve_to_fpsimd() is unused
Date: Wed, 30 Apr 2025 18:32:40 +0100
Message-Id: <20250430173240.4023627-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_103256_297125_2B43031F 
X-CRM114-Status: GOOD (  12.49  )
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

Historically fpsimd_to_sve() and sve_to_fpsimd() were (conditionally)
called by functions which were defined regardless of CONFIG_ARM64_SVE.
Hence it was necessary that both fpsimd_to_sve() and sve_to_fpsimd()
were always defined and not guarded by ifdeffery.

As a result of the removal of fpsimd_signal_preserve_current_state() in
commit:

  929fa99b1215966f ("arm64/fpsimd: signal: Always save+flush state early")

... sve_to_fpsimd() has no callers when CONFIG_ARM64_SVE=n, resulting in
a build-time warnign that it is unused:

| arch/arm64/kernel/fpsimd.c:676:13: warning: unused function 'sve_to_fpsimd' [-Wunused-function]
|   676 | static void sve_to_fpsimd(struct task_struct *task)
|       |             ^~~~~~~~~~~~~
| 1 warning generated.

In contrast, fpsimd_to_sve() still has callers which are defined when
CONFIG_ARM64_SVE=n, and it would be awkward to hide this behind
ifdeffery and/or to use stub functions.

For now, suppress the warning by marking both fpsimd_to_sve() and
sve_to_fpsimd() as 'static inline', as we usually do for stub functions.
The compiler will no longer warn if either function is unused.

Aside from suppressing the warning, there should be no functional change
as a result of this patch.

Link: https://lore.kernel.org/linux-arm-kernel/20250429194600.GA26883@willie-the-truck/
Reported-by: Will Deacon <will@kernel.org>
Fixes: 929fa99b1215966f ("arm64/fpsimd: signal: Always save+flush state early")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Catalin, this is a fix for a patch currently queued up in the arm64
for-next/sme-fixes branch. Are you happy to apply it atop?

Mark.

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index b0874402f7ecc..422b9d43b1e64 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -649,7 +649,7 @@ static void __fpsimd_to_sve(void *sst, struct user_fpsimd_state const *fst,
  * task->thread.uw.fpsimd_state must be up to date before calling this
  * function.
  */
-static void fpsimd_to_sve(struct task_struct *task)
+static inline void fpsimd_to_sve(struct task_struct *task)
 {
 	unsigned int vq;
 	void *sst = task->thread.sve_state;
@@ -673,7 +673,7 @@ static void fpsimd_to_sve(struct task_struct *task)
  * bytes of allocated kernel memory.
  * task->thread.sve_state must be up to date before calling this function.
  */
-static void sve_to_fpsimd(struct task_struct *task)
+static inline void sve_to_fpsimd(struct task_struct *task)
 {
 	unsigned int vq, vl;
 	void const *sst = task->thread.sve_state;
-- 
2.30.2


