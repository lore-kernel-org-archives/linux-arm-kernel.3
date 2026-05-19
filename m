Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27EBCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TrOqFEs/qjHZn8ZSzFpj6cM7rfHT/d6Uh5nHkGiq0Zc=; b=BsEOmD1QI9I/2BcnANs4ZBgcTr
	hGg9luBEBqt1bHwPkC7xmSc67Bmy3657xkzy3amWcu0lEXQQz3EfAdIzKaB5/aNcH1pgRTqtq341h
	mGIimNKo2p/l7iQsKuU0VFm+SLjqLxwYIjLLZioxZXeXAsQSYXZRL/K7DUWhybsZK+l7y+lupiCkR
	EF56ur60wINTEfTb+KjrPFX0sMnFqDAqcIpa07fQ473vTRHKKti73YhyzFQheM2dAm4syxdxBCpTa
	yq5YWdN0Nwe4ls1Wus4hTn/raKsSsanv5vgZPDfSYl+FsTmUf+hwoE1ktSgtvFOcXuSZggJE+2O1P
	wTJ9QRYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGf9-00000000uAy-3Q9a;
	Tue, 19 May 2026 09:22:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGf7-00000000uAK-4Bz6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:22:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73575600AE;
	Tue, 19 May 2026 09:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CB4C2BCB3;
	Tue, 19 May 2026 09:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779182573;
	bh=dSWXSDRgwt/i2Je4bS2WZkMTPFrKtsEjnJXano8qZys=;
	h=From:To:Cc:Subject:Date:From;
	b=MnVWDC/UBBnRQuG7h7qIr4PHpzSzEch62mRboBh1Bi3JWgiHFBYdJNWoOwBPJ98Rg
	 XavLXDKLKHo4eoj/78UweqissDnqbzkPqQ+urE2ro6DDflHCMWgNQcMxI1oItlIh4C
	 Ghi6L8Mul30++0gz1vwowGwPqQYBuAgsUwQ4UIou2ckf+LB+nmLye4X98PRhmFf1JF
	 qCimFCdozKCgn3mrLtHeYXN/5asr6Yy32zfhcaUEBy5MW+38eTvUuzpmia6Q6AMkOd
	 nwrgSg1fvo7P226j/VusUNOk0JgIMDPr9620JMmt8W8CenRCffZK+I5eaNKQ7rQUOf
	 odhcZSNyliz9g==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] arm64: cpucaps: Keep entries sorted
Date: Tue, 19 May 2026 10:22:42 +0100
Message-ID: <20260519092243.7278-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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

The cpucaps list is supposed to be sorted, even though the awk script
which processes it doesn't really care. Since this isn't enforced or
relied upon and because the alphabet is hard, the list has gradually
developed an ordering of its own.

Re-sort the file.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Reported-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---

Marc pointed out that HAS_BBML2_NOABORT was in the wrong place but, on
closer inspection, there are a bunch of misplaced entries here. I
honestly don't like the churn of re-sorting it, so an alternative is
to live with it and remove the comment at the top asking people to keep
it sorted it. Any preferences?

 arch/arm64/tools/cpucaps | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 811c2479e82d..0fc05b5026eb 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -5,6 +5,7 @@
 ALWAYS_BOOT
 ALWAYS_SYSTEM
 BTI
+HAFT
 # Unreliable: use system_supports_32bit_el0() instead.
 HAS_32BIT_EL0_DO_NOT_USE
 HAS_32BIT_EL1
@@ -14,6 +15,7 @@ HAS_ADDRESS_AUTH_ARCH_QARMA5
 HAS_ADDRESS_AUTH_IMP_DEF
 HAS_AMU_EXTN
 HAS_ARMv8_4_TTL
+HAS_BBML2_NOABORT
 HAS_CACHE_DIC
 HAS_CACHE_IDC
 HAS_CNP
@@ -26,41 +28,40 @@ HAS_ECV
 HAS_ECV_CNTPOFF
 HAS_EPAN
 HAS_EVT
-HAS_FPMR
 HAS_FGT
 HAS_FGT2
+HAS_FPMR
 HAS_FPSIMD
 HAS_GCS
 HAS_GENERIC_AUTH
 HAS_GENERIC_AUTH_ARCH_QARMA3
 HAS_GENERIC_AUTH_ARCH_QARMA5
 HAS_GENERIC_AUTH_IMP_DEF
+HAS_GIC_PRIO_MASKING
+HAS_GIC_PRIO_RELAXED_SYNC
 HAS_GICV3_CPUIF
 HAS_GICV5_CPUIF
 HAS_GICV5_LEGACY
-HAS_GIC_PRIO_MASKING
-HAS_GIC_PRIO_RELAXED_SYNC
-HAS_ICH_HCR_EL2_TDIR
 HAS_HCR_NV1
 HAS_HCX
+HAS_ICH_HCR_EL2_TDIR
 HAS_LDAPR
 HAS_LPA2
-HAS_LSE_ATOMICS
 HAS_LS64
 HAS_LS64_V
+HAS_LSE_ATOMICS
 HAS_LSUI
 HAS_MOPS
 HAS_NESTED_VIRT
-HAS_BBML2_NOABORT
 HAS_PAN
 HAS_PMUV3
-HAS_S1PIE
-HAS_S1POE
-HAS_SCTLR2
 HAS_RAS_EXTN
 HAS_RASV1P1_EXTN
 HAS_RNG
+HAS_S1PIE
+HAS_S1POE
 HAS_SB
+HAS_SCTLR2
 HAS_STAGE2_FWB
 HAS_TCR2
 HAS_TIDCP1
@@ -69,7 +70,6 @@ HAS_VA52
 HAS_VIRT_HOST_EXTN
 HAS_WFXT
 HAS_XNX
-HAFT
 HW_DBM
 KVM_HVHE
 KVM_PROTECTED_MODE
@@ -83,10 +83,10 @@ MTE_STORE_ONLY
 SME
 SME_FA64
 SME2
+SPECTRE_BHB
 SPECTRE_V2
 SPECTRE_V3A
 SPECTRE_V4
-SPECTRE_BHB
 SSBS
 SVE
 UNMAP_KERNEL_AT_EL0
@@ -110,9 +110,6 @@ WORKAROUND_4193714
 WORKAROUND_4311569
 WORKAROUND_AMPERE_AC03_CPU_38
 WORKAROUND_AMPERE_AC04_CPU_23
-WORKAROUND_TRBE_OVERWRITE_FILL_MODE
-WORKAROUND_TSB_FLUSH_FAILURE
-WORKAROUND_TRBE_WRITE_OUT_OF_RANGE
 WORKAROUND_CAVIUM_23154
 WORKAROUND_CAVIUM_27456
 WORKAROUND_CAVIUM_30115
@@ -128,3 +125,6 @@ WORKAROUND_REPEAT_TLBI
 WORKAROUND_SPECULATIVE_AT
 WORKAROUND_SPECULATIVE_SSBS
 WORKAROUND_SPECULATIVE_UNPRIV_LOAD
+WORKAROUND_TRBE_OVERWRITE_FILL_MODE
+WORKAROUND_TRBE_WRITE_OUT_OF_RANGE
+WORKAROUND_TSB_FLUSH_FAILURE
-- 
2.54.0.563.g4f69b47b94-goog


