Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7F2FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k8GS2ZYumwHL1bEDYnPJ2GZIj7B1gy0vbeQY78N5HZ0=; b=niUjmYG/zgqjfsJQQ6W/1hTgRk
	JjBftEPxGYiceGaSFTpmtht9Lyxh4RZxxUPKTXIpiCzMUMROxRLmYsB7Z2qCEhl461ooAkShTYXi+
	9EKchn4VLbtZjdECWqfOCfu0sWnQDpudcNNtCzU9+oxDxh0EwpdAo5rHy9IE2DLz4KcNVqJ0LF+Fo
	AI4fbLCFQxZKpcNGEH8TBMAROG0QaW/OYQ3o3ijzMu54SCCTDqIltJhHgJxwAjEyijqExbrlPgyOS
	cbOvAghLsNqmQn3HWcbFcwO/cGAWvoQcPer3KnNrFWijUvwAZDp+P9X49WC2+BQFk/ZlXlj1eur84
	yLAGzI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKH4H-0000000GYqe-1Wm0;
	Tue, 05 May 2026 14:48:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKH4E-0000000GYq9-3eO1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:48:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3958F1655;
	Tue,  5 May 2026 07:48:03 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 023B13F763;
	Tue,  5 May 2026 07:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777992488; bh=hKzjIB4H5JRY6TdRWGACYXGfz13rGeCXV3Fdn17yKlc=;
	h=From:To:Cc:Subject:Date:From;
	b=O/55uKkB+vcPmr4EJfehOTAvGwU8FGPjM8g/6EcoeZljsH5mkHLvMnYWCFBq5XY8e
	 /tLMKw0L5DB7hOBGWWr3aAKpruqJ1n/v6cTTxW0WwirxIImoBwbZbZJ3wCxHe2W9b8
	 JVxixAn+uezgvhKeMDumqzL7LvT2OA6sF0/wnpbs=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH] KVM: arm64: nv: Consider the DS bit when translating TCR_EL2
Date: Tue,  5 May 2026 15:47:35 +0100
Message-ID: <20260505144735.1496530-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_074810_977195_AC5919BD 
X-CRM114-Status: UNSURE (   8.54  )
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

When running an nVHE L1, TCR_EL2 is mapped to TCR_EL1. Writes to the
register are trapped and written to TCR_EL1 after a translation.
Booting an nVHE L1 with 52-bit VA isn't working because the translation
was ignoring the DS bit set by the guest, hence causing repeating level
0 faults. Add it in the translation function.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/include/asm/kvm_nested.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 091544e6af44..dc2957662ff2 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -23,6 +23,7 @@ static inline u64 tcr_el2_ps_to_tcr_el1_ips(u64 tcr_el2)
 static inline u64 translate_tcr_el2_to_tcr_el1(u64 tcr)
 {
 	return TCR_EPD1_MASK |				/* disable TTBR1_EL1 */
+	       ((tcr & TCR_EL2_DS) ? TCR_DS : 0) |
 	       ((tcr & TCR_EL2_TBI) ? TCR_TBI0 : 0) |
 	       tcr_el2_ps_to_tcr_el1_ips(tcr) |
 	       (tcr & TCR_EL2_TG0_MASK) |
-- 
2.43.0


