Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70871C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhdAASQxAgazTZwIS5ypZju8YInxI6TUB3liHbR0soE=; b=VLArmETfWr4pm1u9b5Ahz2QCwV
	j9kVVTKfONCBM1ga1u5X+HGBq2nIYicAccK+KjnpIiZTg4MxQ9h/olPcIMXB0393s5mrvzzSMUzET
	KEgRK4G8CTLFus365OqXP2acACgutRi7Gyiw7oHQHyLHbjBg1Jm77rz2xDzkF/kKI/EzUHxHPgR2E
	JnesrfhHQ6wiIbYKtM72arIm9cOEB8LDdlgYHbUWQinh1ISbyJKfwWHgKb0MQ1CgUozJY8d59hHe8
	X8wK0JAmwNyE7gL0X8sbo3KtNb7YeWVS3TVi5NSTBPLxSC4dUv4heyQDg++8Mj+0bF0877vnWNklA
	IxA7yN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1TB-00000000mL7-0TUt;
	Thu, 08 May 2025 13:39:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Hd-00000000kO1-3wVw
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 May 2025 13:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YhdAASQxAgazTZwIS5ypZju8YInxI6TUB3liHbR0soE=; b=Q8aVvTcROIn6cAUkcvbQUBcpOL
	YYtWKYEieUncAmTyFJiEXStbY14cFt8hEbvlQrrm+yUM1WPkpil3+YJoZotNuanIOr2UgcjWbflEr
	9FYO7esnkeSe+UMbBLMVINXOOTbswZ68cPKYedBAye3pPoO7t1f7tJR7RMhmfrlvbaxxjocBsaXR7
	Y/FcbNojAY6jaX20MX0Pv8DU7C80R/9iv2hjokobfcEFtEGz0R8hsOIWY6v6dTvturuHyaIi2h0Bb
	wToOijYcUOaDF2vyNUHH7mRZFWlWqvvbMQOH0IVxV5BOC4QVSw9d6OL0w286K4oLq/74NyhXoKFqO
	gsGCyYfQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uD1Ha-0000000G3ul-0FiB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:27:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80A921E2F;
	Thu,  8 May 2025 06:27:12 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7ED793F58B;
	Thu,  8 May 2025 06:27:20 -0700 (PDT)
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
Subject: [PATCH v2 03/24] arm64/fpsimd: signal: Mandate SVE payload for streaming-mode state
Date: Thu,  8 May 2025 14:26:23 +0100
Message-Id: <20250508132644.1395904-4-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_142726_476665_D3881795 
X-CRM114-Status: GOOD (  13.78  )
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

Non-streaming SVE state may be preserved without an SVE payload, in
which case the SVE context only has a header with VL==0, and all state
can be restored from the FPSIMD context. Streaming SVE state is always
preserved with an SVE payload, where the SVE context header has VL!=0,
and the SVE_SIG_FLAG_SM flag is set.

The kernel never preserves an SVE context where SVE_SIG_FLAG_SM is set
without an SVE payload. However, restore_sve_fpsimd_context() doesn't
forbid restoring such a context, and will handle this case by clearing
PSTATE.SM and restoring the FPSIMD context into non-streaming mode,
which isn't consistent with the SVE_SIG_FLAG_SM flag.

Forbid this case, and mandate an SVE payload when the SVE_SIG_FLAG_SM
flag is set. This avoids an awkward ABI quirk and reduces the risk that
later rework to this code permits configuring a task with PSTATE.SM==1
and fp_type==FP_STATE_FPSIMD.

I've marked this as a fix given that we never intended to support this
case, and we don't want anyone to start relying upon the old behaviour
once we re-enable SME.

Fixes: 85ed24dad290 ("arm64/sme: Implement streaming SVE signal handling")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/signal.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index fdce1b856f498..e898948a31b65 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -387,6 +387,7 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
 	unsigned int vl, vq;
 	struct user_fpsimd_state fpsimd;
 	u16 user_vl, flags;
+	bool sm;
 
 	if (user->sve_size < sizeof(*user->sve))
 		return -EINVAL;
@@ -396,7 +397,8 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
 	if (err)
 		return err;
 
-	if (flags & SVE_SIG_FLAG_SM) {
+	sm = flags & SVE_SIG_FLAG_SM;
+	if (sm) {
 		if (!system_supports_sme())
 			return -EINVAL;
 
@@ -416,7 +418,16 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
 	if (user_vl != vl)
 		return -EINVAL;
 
-	if (user->sve_size == sizeof(*user->sve)) {
+	/*
+	 * Non-streaming SVE state may be preserved without an SVE payload, in
+	 * which case the SVE context only has a header with VL==0, and all
+	 * state can be restored from the FPSIMD context.
+	 *
+	 * Streaming SVE state is always preserved with an SVE payload. For
+	 * consistency and robustness, reject restoring streaming SVE state
+	 * without an SVE payload.
+	 */
+	if (!sm && user->sve_size == sizeof(*user->sve)) {
 		clear_thread_flag(TIF_SVE);
 		current->thread.svcr &= ~SVCR_SM_MASK;
 		current->thread.fp_type = FP_STATE_FPSIMD;
-- 
2.30.2


