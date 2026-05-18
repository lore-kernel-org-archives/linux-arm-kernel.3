Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD4FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 15:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P13usHnWsWoKEErmP6WeKQfiPLK4FR58fPhvNbnZCrM=; b=tbYONuxfeuLH2Bt/NgDhCaU1d4
	4Y/tzTiMkwpTBISvToBP+0YsYnTQuIiT+e8cRM9MZUG1RMXUh2TFMUvxI11pUqZqxwlsW7d2xXxNa
	tDl8sms+h2B2Z+W8N4uWxHjprAWshKtNrwNd458KEKJnoQCaX/jeQMRhFjNCsTBqXs4NdlYWM1fJf
	3WxETYwgZQINAYOuVt41XoWVwm8mM1aVrDHjBiQ2rSqWnys3zZkdUvNFa1pCtLMfR2rhQalleI8O5
	O19xBVNdntx0foNow4mSoU5nUZuuckzDv2/U3zm51uRMOgHD4sJk0AxLiW0kBAmWg7vkuhCefpbth
	FsJKpmiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzwj-0000000GABC-0b2p;
	Mon, 18 May 2026 15:31:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzwc-0000000GA9D-1E5j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 15:31:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A17764446E;
	Mon, 18 May 2026 15:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03933C2BCC6;
	Mon, 18 May 2026 15:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779118309;
	bh=TaL0vGDEszMByRNDVpz/8GnVwTdL8YYz0VnNw2wxbGA=;
	h=From:To:Cc:Subject:Date:From;
	b=O4/mNYg1V5kkPZinsY4CrYsg0XLHAPWKJfdRL6SKHfgihCrOi8AI62nGNsFyWLRmr
	 PuMIxhyshowGteayZnXXhRY4wdL+nxU1UNItNDjCUjREK5t357VzPAkYu5w6cSF3cw
	 wLr3GpKJBZBOOxhPZPuVNVZPkScSdYWxFxd7DA2uSBO4JEMGiSbD9KwZz6PU2VTg1R
	 apIVmw0tsobf7ClVKOuQuwERXoxXrkyAkpLZuAZlOGsBRw6Bw9zObwo+ttLar9aHpM
	 o3JETNs0CC5sD74A4E0XfbkKWLTuaDFk+rZy1ZhWd+FYkKe8WUjWIXSC83sA6H8TAk
	 s5cXhh3abM9YQ==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2] KVM: arm64: Don't populate TPIDR_EL2 in finalise_el2()
Date: Mon, 18 May 2026 16:31:26 +0100
Message-ID: <20260518153127.6078-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_083150_349292_14F601B8 
X-CRM114-Status: GOOD (  10.86  )
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

Currently, it is not necessary for __finalise_el2() to configure
TPIDR_EL2:

* The hyp stub code does not consume the value of TPIDR_EL2.

* On the boot cpu, TPIDR_EL1 is used for the percpu offset until the
  ARM64_HAS_VIRT_HOST_EXTN cpucap is detected and boot alternatives
  are patched. Before boot alternatives are patched,
  cpu_copy_el2regs() will copy TPIDR_EL1 into TPIDR_EL2. It is not
  necessary for __finalise_el2() to initialise TPIDR_EL2 before this.

* Secondary CPUs are brought up after boot alternatives have been
  patched, and __secondary_switched() will initialize TPIDR_EL2 in
  'init_cpu_task', after finalise_el2() calls __finalise_el2()

* KVM hyp code which may consume TPIDR_EL2 is brought up after all
  secondaries have been booted, once TPIDR_El2 has been configured on
  all CPUs.

Remove the redundant initialisation from __finalise_el2().

Cc: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---

v2: Use Mark's commit message, add his R-b tag, rebase onto -rc4.
Link to v1: https://lore.kernel.org/r/20260330152927.26300-1-will@kernel.org

 arch/arm64/kernel/hyp-stub.S | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
index 634ddc904244..37c6976e44a4 100644
--- a/arch/arm64/kernel/hyp-stub.S
+++ b/arch/arm64/kernel/hyp-stub.S
@@ -104,11 +104,9 @@ SYM_CODE_START_LOCAL(__finalise_el2)
 	mov_q	x0, HCR_HOST_VHE_FLAGS
 	msr_hcr_el2 x0
 
-	// Use the EL1 allocated stack, per-cpu offset
+	// Use the EL1 allocated stack
 	mrs	x0, sp_el1
 	mov	sp, x0
-	mrs	x0, tpidr_el1
-	msr	tpidr_el2, x0
 
 	// FP configuration, vectors
 	mrs_s	x0, SYS_CPACR_EL12
-- 
2.54.0.563.g4f69b47b94-goog


