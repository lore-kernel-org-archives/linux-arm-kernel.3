Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D445C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 12:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/bShRskAr6RPGlQMi2JoRFa3cMfRMsav3q4ioTmjY8=; b=z/sAnJKt5x3SfB69uB3m+MXhh8
	47lAS25sOTZvZ44BHqYyX52DqXcZTYAHog0QBxSBplSO/BDCuJ8NBYq+HJKW/UCvJY9SvHQkJn8mL
	tol9REPGqEGRjJwEHiYEJBuzL6ulzAvMI1A/6DPvYSt/zuMOXWwspyNAbaIkhEgwQsUd5vNRi8b5T
	iCAk23jDtOyRGvM2CLROhJgIvmbro2i3O7YAcig99K/eKR9Z0tvcdHr4gRPWMsgy21PT6nJS0tZfg
	s6zb0cwFOZIyz9BSnZpX0WbSkhShAzDuohqGeS2jifi+Gtb+F/rPEubFX3d7wYi8b5EvtgKw5LM9R
	LVYO8LSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjz0-0000000CYVO-3kgS;
	Fri, 18 Jul 2025 12:14:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucj0j-0000000CPBi-3DGz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 11:12:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3646D601D9;
	Fri, 18 Jul 2025 11:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF00C4CEF6;
	Fri, 18 Jul 2025 11:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752837136;
	bh=24+36KjjrD0NWHFuhivqLnbkQAQ1TArPFkrRpr8pj5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R33nzHIyLv9AcgRjbXDMPz6PgR+4A1Li7+48f5b1sAgJYu9/fWJTkOu53F9AZePSv
	 3jRSnNtZimbz4wu22en5eZD9jqnCbx5kYs+DpL0PwVw9KNzM+sTPwjMHbT/DggAbv/
	 AvnC3S1suKWCtQrtvgdtASh5w+uk3IggRNy4ocLiWQVEwDO55/++6On1RjzoWNw/XS
	 szI4BdxAbeTGEIqebNZH6JEH5K/jhpEVGaG5taxhjY2Jc3RrLh5kH+CFuiQH4iBsCn
	 UhJ5aRXpIe0X+WG5LIPfXLk2x87z/a8nA/IjHqkajkdDvNFEFljagNaxCu5Zuydao8
	 EqXL3ZWhQ3giw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ucj0g-00Gt2B-UD;
	Fri, 18 Jul 2025 12:12:15 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 2/4] KVM: arm64: Clarify the check for reset callback in check_sysreg_table()
Date: Fri, 18 Jul 2025 12:11:52 +0100
Message-Id: <20250718111154.104029-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250718111154.104029-1-maz@kernel.org>
References: <20250718111154.104029-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

check_sysreg_table() has a wonky 'is_32" parameter, which is really
an indication that we should enforce the presence of a reset helper.

Clean this up by naming the variable accordingly and inverting the
condition. Contrary to popular belief, system instructions don't
have a reset value (duh!), and therefore do not need to be checked
for reset (they escaped the check through luck...).

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index af743494538a2..f8b10966d0c3e 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4335,12 +4335,12 @@ static const struct sys_reg_desc cp15_64_regs[] = {
 };
 
 static bool check_sysreg_table(const struct sys_reg_desc *table, unsigned int n,
-			       bool is_32)
+			       bool reset_check)
 {
 	unsigned int i;
 
 	for (i = 0; i < n; i++) {
-		if (!is_32 && table[i].reg && !table[i].reset) {
+		if (reset_check && table[i].reg && !table[i].reset) {
 			kvm_err("sys_reg table %pS entry %d (%s) lacks reset\n",
 				&table[i], i, table[i].name);
 			return false;
@@ -5334,11 +5334,11 @@ int __init kvm_sys_reg_table_init(void)
 	int ret = 0;
 
 	/* Make sure tables are unique and in order. */
-	valid &= check_sysreg_table(sys_reg_descs, ARRAY_SIZE(sys_reg_descs), false);
-	valid &= check_sysreg_table(cp14_regs, ARRAY_SIZE(cp14_regs), true);
-	valid &= check_sysreg_table(cp14_64_regs, ARRAY_SIZE(cp14_64_regs), true);
-	valid &= check_sysreg_table(cp15_regs, ARRAY_SIZE(cp15_regs), true);
-	valid &= check_sysreg_table(cp15_64_regs, ARRAY_SIZE(cp15_64_regs), true);
+	valid &= check_sysreg_table(sys_reg_descs, ARRAY_SIZE(sys_reg_descs), true);
+	valid &= check_sysreg_table(cp14_regs, ARRAY_SIZE(cp14_regs), false);
+	valid &= check_sysreg_table(cp14_64_regs, ARRAY_SIZE(cp14_64_regs), false);
+	valid &= check_sysreg_table(cp15_regs, ARRAY_SIZE(cp15_regs), false);
+	valid &= check_sysreg_table(cp15_64_regs, ARRAY_SIZE(cp15_64_regs), false);
 	valid &= check_sysreg_table(sys_insn_descs, ARRAY_SIZE(sys_insn_descs), false);
 
 	if (!valid)
-- 
2.39.2


