Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FD7CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pm3v/UcPZop9jgpkudBCEu72pTkgJ2hgqImsKj1U4o0=; b=qryLxkmCsGdHoVEVSl6nHKoV8h
	lYNR/sQleVborjm1T9FjPhQdcN0s0nTzxAq5VbTSgxT7yVZyYwDcjpTUrQIjZx9b/weAqfxbfIylZ
	3dfugu9U4GwbEhJC6JyQXypGFuHy4KbJmveFrMNsEanw72R0mF0qDbd68hn8fR/n+8FhkaR7f+tn/
	11R0n8l/480Vh67G8lopHKBQP1I70s0yKgALVYErHSgfMRpeaBDo9dY5etLvCPYhanwrDhv7mbt8e
	WF4nu7uiUfqiA6laTgy7TNEQgsd45zYjUIYtHo2rkmWjadxUYswmhDFjtf5+LS7t1miM8A6Xr+rBy
	wYyp22sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEBV-00000000sLa-2nwc;
	Thu, 21 Aug 2025 22:55:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up91Z-000000003fN-3t7w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 17:24:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B13C168F;
	Thu, 21 Aug 2025 10:24:21 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0877B3F59E;
	Thu, 21 Aug 2025 10:24:25 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	anshuman.khandual@arm.com,
	robh@kernel.org,
	james.morse@arm.com,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	Dave.Martin@arm.com,
	ahmed.genidi@arm.com,
	kevin.brodsky@arm.com,
	scott@os.amperecomputing.com,
	mbenes@suse.cz,
	james.clark@linaro.org,
	frederic@kernel.org,
	rafael@kernel.org,
	pavel@kernel.org,
	ryan.roberts@arm.com,
	suzuki.poulose@arm.com,
	maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v4 4/5] arm64: initialise SCTLR2_EL1 at cpu_soft_restart()
Date: Thu, 21 Aug 2025 18:24:07 +0100
Message-Id: <20250821172408.2101870-5-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821172408.2101870-1-yeoreum.yun@arm.com>
References: <20250821172408.2101870-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_102430_001012_2645B27A 
X-CRM114-Status: UNSURE (   8.59  )
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

Explicitly initialize the SCTLR2_ELx register before launching
a new kernel via kexec() to avoid leaving SCTLR2_ELx with an
arbitrary value when the new kernel runs.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kernel/cpu-reset.S      | 4 ++++
 arch/arm64/kvm/hyp/nvhe/hyp-init.S | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/arch/arm64/kernel/cpu-reset.S b/arch/arm64/kernel/cpu-reset.S
index c87445dde674..c8888891dc8d 100644
--- a/arch/arm64/kernel/cpu-reset.S
+++ b/arch/arm64/kernel/cpu-reset.S
@@ -37,6 +37,10 @@ SYM_TYPED_FUNC_START(cpu_soft_restart)
 	 * regime if HCR_EL2.E2H == 1
 	 */
 	msr	sctlr_el1, x12
+
+	mov_q	x12, INIT_SCTLR2_EL1
+	set_sctlr2_elx	1, x12, x8
+
 	isb
 
 	cbz	x0, 1f				// el2_switch?
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index aada42522e7b..cc569656fe35 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -255,6 +255,9 @@ SYM_CODE_START(__kvm_handle_stub_hvc)
 	mov	x0, xzr
 reset:
 	/* Reset kvm back to the hyp stub. */
+	mov_q 	x5, INIT_SCTLR2_EL2
+	set_sctlr2_elx	2, x5, x4
+
 	mov_q	x5, INIT_SCTLR_EL2_MMU_OFF
 	pre_disable_mmu_workaround
 	msr	sctlr_el2, x5
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


