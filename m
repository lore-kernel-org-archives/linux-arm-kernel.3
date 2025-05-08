Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57258C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/nMx09k8ctgwEbllfETLMdv/nByXxprATx5Arjen7k=; b=Pn3zrSJJHF/fpE0dhJ2q+A6GWI
	KyA2++d1CxtAagDAAK9XV1pzUWZqwNIHg41+6AhrrUFAphXdiFVzFuI1DyvxpDNPBswo3zIo1nP1K
	siP9uD2YJUMAuHbkhEOBWGU71Rd1gDE+xgFYHm8R7m42wLGKB5kHL8WgZMoxHu+qKvPTOANT5THNn
	cIg44U8Cq01EOLYFocDakM9atsEiRAW3PyeXgQsy9KSyXaUZpIQ2qXevuUJbnK8cprMBf+9h+DZlA
	KXpuU33xOIyoTS+9RrLP6ssIGz5yIhSZ389TdWcfjnsvZYfRTg0w9E3qlAXk1j97K8bMJNbxfyxNJ
	/dWyXwtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1zz-00000000sIF-0K9i;
	Thu, 08 May 2025 14:13:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1IL-00000000kZp-3Q0S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:28:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 006E9106F;
	Thu,  8 May 2025 06:28:03 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F33E13F58B;
	Thu,  8 May 2025 06:28:10 -0700 (PDT)
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
Subject: [PATCH v2 21/24] kselftest/arm64: fp-ptrace: Fix expected FPMR value when PSTATE.SM is changed
Date: Thu,  8 May 2025 14:26:41 +0100
Message-Id: <20250508132644.1395904-22-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062813_975874_60DF689B 
X-CRM114-Status: GOOD (  14.55  )
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

The fp-ptrace test suite expects that FPMR is set to zero when PSTATE.SM
is changed via ptrace, but ptrace has never altered FPMR in this way,
and the test logic erroneously relies upon (and has concealed) a bug
where task_fpsimd_load() would unexpectedly and non-deterministically
clobber FPMR.

Using ptrace, FPMR can only be altered by writing to the NT_ARM_FPMR
regset. The value of PSTATE.SM can be altered by writing to the
NT_ARM_SVE or NT_ARM_SSVE regsets, and/or by changing the SME vector
length (when writing to the NT_ARM_SVE, NT_ARM_SSVE, or NT_ARM_ZA
regsets), but none of these writes will change the value of FPMR.

The task_fpsimd_load() bug was introduced with the initial FPMR support
in commit:

  203f2b95a882 ("arm64/fpsimd: Support FEAT_FPMR")

The incorrect FPMR test code was introduced in commit:

  7dbd26d0b22d ("kselftest/arm64: Add FPMR coverage to fp-ptrace")

Subsequently, the task_fpsimd_load() bug was fixed in commit:

  e5fa85fce08b ("arm64/fpsimd: Don't corrupt FPMR when streaming mode changes")

... whereupon the fp-ptrace FPMR tests started failing reliably, e.g.

| # # Mismatch in saved FPMR: 915058000 != 0
| # not ok 25 SVE write, SVE 64->64, SME 64/0->64/1

Fix this by changing the test to expect that FPMR is *NOT* changed when
PSTATE.SM is changed via ptrace, matching the extant behaviour.

I've chosen to update the test code rather than modifying ptrace to zero
FPMR when PSTATE.SM changes. Not zeroing FPMR is simpler overall, and
allows the NT_ARM_FPMR regset to be handled independently from other
regsets, leaving less scope for error.

Fixes: 7dbd26d0b22d ("kselftest/arm64: Add FPMR coverage to fp-ptrace")
Fixes: e5fa85fce08b ("arm64/fpsimd: Don't corrupt FPMR when streaming mode changes")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Spickett <david.spickett@arm.com>
Cc: Luis Machado <luis.machado@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index 4930e03a7b990..762048eb354ff 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -891,18 +891,11 @@ static void set_initial_values(struct test_config *config)
 {
 	int vq = __sve_vq_from_vl(vl_in(config));
 	int sme_vq = __sve_vq_from_vl(config->sme_vl_in);
-	bool sm_change;
 
 	svcr_in = config->svcr_in;
 	svcr_expected = config->svcr_expected;
 	svcr_out = 0;
 
-	if (sme_supported() &&
-	    (svcr_in & SVCR_SM) != (svcr_expected & SVCR_SM))
-		sm_change = true;
-	else
-		sm_change = false;
-
 	fill_random(&v_in, sizeof(v_in));
 	memcpy(v_expected, v_in, sizeof(v_in));
 	memset(v_out, 0, sizeof(v_out));
@@ -953,12 +946,7 @@ static void set_initial_values(struct test_config *config)
 	if (fpmr_supported()) {
 		fill_random(&fpmr_in, sizeof(fpmr_in));
 		fpmr_in &= FPMR_SAFE_BITS;
-
-		/* Entering or exiting streaming mode clears FPMR */
-		if (sm_change)
-			fpmr_expected = 0;
-		else
-			fpmr_expected = fpmr_in;
+		fpmr_expected = fpmr_in;
 	} else {
 		fpmr_in = 0;
 		fpmr_expected = 0;
-- 
2.30.2


