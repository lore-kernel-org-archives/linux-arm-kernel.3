Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73C7D44D5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x+zQvfHTBKHsH/sIwYv5/K3ySitIiLjKPchlE1dhsr4=; b=CM9C/dDquuTsuj7AaLqNsIOIXd
	sS3DsBQnyUfzBwkLmRM8oCXD/msEH9Z/hIvQ6YroimOE7IU/Q1ut59ZeBOntRRtJpcIFxs0A79Hn+
	3VZEDI+HRE84yJZ/Q6u/yJybxu1Dnl20KJoYNfSqrrZpCtmWBiXhZ+jrcGbQtSI9W5FKCi8cIldHq
	nUGMSyw+iYpgQCTC1Ywphz/cAuutzrgbuDvn37N1UdklXvAZTkCbGI/UpBrrcoUMRktoICQjF46Tm
	mhsYInBNQdMr+FL7z/FIVoGN/ZFzqM7cjQo+ikg76H8SpKn/GAnCjJQfhRDwLj9zuwBWZVsa4nNis
	3ow8K+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fuE-00000003NSH-0GUX;
	Wed, 06 Nov 2024 13:17:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8f7u-00000003Bas-3rAm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 12:27:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84EAC339;
	Wed,  6 Nov 2024 04:27:37 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05A653F6A8;
	Wed,  6 Nov 2024 04:27:05 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	catalin.marinas@arm.com,
	will@kernel.org
Subject: [PATCH] KVM: arm64: VHE: Initialize PMSCR_EL1
Date: Wed,  6 Nov 2024 12:26:54 +0000
Message-ID: <20241106122654.38234-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_042711_050596_32E8EAA2 
X-CRM114-Status: GOOD (  12.76  )
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

According to the pseudocode for StatisticalProfilingEnabled() from Arm
DDI0487K.a, PMSCR_EL1 controls profiling at EL1 and EL0:

- PMSCR_EL1.E1SPE controls profiling at EL1.
- PMSCR_EL1.E0SPE controls profiling at EL0 if HCR_EL2.TGE=0. KVM always
  clears HCR_EL2.TGE when running a VM.

When profiling is enabled in the host, and the host is running in nVHE mode
(HCR_EL2.E2H=0), KVM clears PMSCR_EL1.{E1SPE,E0SPE} before jumping into the
guest.

When profiling is enabled in the host, and the host is running at EL2
(HCR_EL2.E2H=1), KVM will not touch PMSCR_EL1.{E1SPE,E0SPE} before jumping
into the guest. PMSCR_EL1.{E1SPE,E0SPE} reset to an architecturally UNKNOWN
value, which means it might be possible that KVM unintentionally profiles
the guest when is running in VHE mode.

Clear PMSCR_EL1.{E1SPE,E0SPE} when setting up VHE mode to keep the
behaviour consistent and predictable.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

Tested on the model, by setting the PMSCR_EL1.E1SPE and E0SPE bits in
__init_el2_debug to simulate a system where they reset to 1. Without the
patch, when the host is running at EL2, and the user is profiling the
kvmtool process, I can see records taken at EL1:

# perf record -e arm_spe// -- ./lkvm-static run -c2 -m512 -k Image -d disk -p earlycon

With this patch, those records disappear; and the size of perf.data has
been more than halved.

 arch/arm64/kernel/hyp-stub.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
index 65f76064c86b..df63f329d400 100644
--- a/arch/arm64/kernel/hyp-stub.S
+++ b/arch/arm64/kernel/hyp-stub.S
@@ -117,6 +117,8 @@ SYM_CODE_START_LOCAL(__finalise_el2)
 	bic	x0, x0, #(MDCR_EL2_E2PB_MASK << MDCR_EL2_E2PB_SHIFT)
 	bic	x0, x0, #(MDCR_EL2_E2TB_MASK << MDCR_EL2_E2TB_SHIFT)
 	msr	mdcr_el2, x0
+	// Disable profiling when running a virtual machine
+	msr_s	SYS_PMSCR_EL12, xzr
 
 	// Transfer the MM state from EL1 to EL2
 	mrs_s	x0, SYS_TCR_EL12
-- 
2.47.0


