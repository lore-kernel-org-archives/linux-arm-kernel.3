Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2A6E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 06:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOa8dedbMvhdXvRCKA9qNMh3Kk2bakXaJr7O5ahHork=; b=YRr/5JXfX0QKIBIIzMEOHklgz1
	JVXYAkZo8klmrowAu4oLOCFEvL73ZZSkQJyQ2NrgrcuqnmgZjzfU86i7rby3aeH3pmnAY5NEMidjR
	3fsU3aYb/Y06Aij2UEUk2qraJXWEHqWI4LhL9V80/V83wzAxuo+VGvAMd73bSfRQze25rAKc0IBvf
	+uA67SVvDyCOWHAFKPgO0SYBfV2M1ItYt4O/7PywJoV9vX1Z16iFGp1DHUZXVCHo9/h90gvo4zg5J
	y2HRr5kYb/Mq5/URPYpmO7arcypEoc0xDYNBnr67m5SelaQnT1c3/IBYOlRkMt1XkpFAw3Wm7qvdJ
	37HcQ2JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtvY-0000000ASRu-3ANw;
	Tue, 10 Dec 2024 06:41:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtF0-0000000AKio-2E0U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 05:57:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4477D339;
	Mon,  9 Dec 2024 21:57:30 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.48.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 23A9B3F58B;
	Mon,  9 Dec 2024 21:56:57 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	maz@kernel.org
Cc: ryan.roberts@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH V2 44/46] KVM: arm64: nv: Add FEAT_FGT2 registers access from virtual EL2
Date: Tue, 10 Dec 2024 11:23:09 +0530
Message-Id: <20241210055311.780688-45-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210055311.780688-1-anshuman.khandual@arm.com>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_215702_654932_8D05BAC9 
X-CRM114-Status: UNSURE (   7.84  )
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

This adds VNCR-capable HDFGRTR2_EL2, HDFGWTR2_EL2, HFGRTR2_EL2, HFGWTR2_EL2
and HFGITR2_EL2 FEAT_FGT2 registers into enum vcpu_sysreg, and also enables
their access from virtual EL2 environment.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: James Morse <james.morse@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: kvmarm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/kvm_host.h     | 5 +++++
 arch/arm64/include/asm/vncr_mapping.h | 5 +++++
 arch/arm64/kvm/sys_regs.c             | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e18e9244d17a..73ff8772ac22 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -548,6 +548,11 @@ enum vcpu_sysreg {
 	VNCR(HDFGWTR_EL2),
 	VNCR(HAFGRTR_EL2),
 
+	VNCR(HDFGRTR2_EL2),
+	VNCR(HDFGWTR2_EL2),
+	VNCR(HFGITR2_EL2),
+	VNCR(HFGRTR2_EL2),
+	VNCR(HFGWTR2_EL2),
 	VNCR(CNTVOFF_EL2),
 	VNCR(CNTV_CVAL_EL0),
 	VNCR(CNTV_CTL_EL0),
diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
index 4f9bbd4d6c26..d6110d7c36e2 100644
--- a/arch/arm64/include/asm/vncr_mapping.h
+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -38,6 +38,8 @@
 #define VNCR_HFGRTR_EL2		0x1B8
 #define VNCR_HFGWTR_EL2		0x1C0
 #define VNCR_HFGITR_EL2		0x1C8
+#define VNCR_HDFGRTR2_EL2	0x1A0
+#define VNCR_HDFGWTR2_EL2	0x1B0
 #define VNCR_HDFGRTR_EL2	0x1D0
 #define VNCR_HDFGWTR_EL2	0x1D8
 #define VNCR_ZCR_EL1            0x1E0
@@ -52,6 +54,9 @@
 #define VNCR_PIRE0_EL1		0x290
 #define VNCR_PIR_EL1		0x2A0
 #define VNCR_POR_EL1		0x2A8
+#define VNCR_HFGRTR2_EL2	0x2C0
+#define VNCR_HFGWTR2_EL2	0x2C8
+#define VNCR_HFGITR2_EL2	0x310
 #define VNCR_ICH_LR0_EL2        0x400
 #define VNCR_ICH_LR1_EL2        0x408
 #define VNCR_ICH_LR2_EL2        0x410
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 83c6b4a07ef5..c9e0e9322bd3 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3004,9 +3004,14 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG_VNCR(VTCR_EL2, reset_val, 0),
 
 	{ SYS_DESC(SYS_DACR32_EL2), undef_access, reset_unknown, DACR32_EL2 },
+	EL2_REG_VNCR(HDFGRTR2_EL2, reset_val, 0),
+	EL2_REG_VNCR(HDFGWTR2_EL2, reset_val, 0),
+	EL2_REG_VNCR(HFGRTR2_EL2, reset_val, 0),
+	EL2_REG_VNCR(HFGWTR2_EL2, reset_val, 0),
 	EL2_REG_VNCR(HDFGRTR_EL2, reset_val, 0),
 	EL2_REG_VNCR(HDFGWTR_EL2, reset_val, 0),
 	EL2_REG_VNCR(HAFGRTR_EL2, reset_val, 0),
+	EL2_REG_VNCR(HFGITR2_EL2, reset_val, 0),
 	EL2_REG_REDIR(SPSR_EL2, reset_val, 0),
 	EL2_REG_REDIR(ELR_EL2, reset_val, 0),
 	{ SYS_DESC(SYS_SP_EL1), access_sp_el1},
-- 
2.25.1


