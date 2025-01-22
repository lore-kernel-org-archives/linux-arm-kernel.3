Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF30C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 17:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh2HMG8/6vAqiSqSGwdaz2ExZwLVjqVYVqBXFzBhVoM=; b=svuqvuBPWmYmPYUPSVTndB1m/x
	uOvCFUbuo255zP9JnqGj1fwQ83aluLYY6h0sYbVmeoHtmmej/jw1EVpI+Yt28+VTX+eC+9ZEFbTZg
	51MG3OrlNbzMMg1WlexU1wq8Z3MOGLBA4qo3lKKW1zde1Zhj8yrOy+7s/CMxuILZb1187DX0NzhKq
	5IiVwJAxFEo75oRJ59xBwZlIcE4bGSOuk396rt5rrg7f/iX8jfkcUZ88vMGUfzfSKkM7geVwLgBpJ
	bDAjSq1fAzytTAtokWatBkaXg4Bww/zoAtDrddWrEOvkXcGwTirAGilrIx8M4C+VaRNsz6m0DSV9r
	j/MlcCsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taexP-0000000Aw7f-26Vn;
	Wed, 22 Jan 2025 17:56:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taepQ-0000000Auke-0P1a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 17:47:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98F781063;
	Wed, 22 Jan 2025 09:48:14 -0800 (PST)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48B0E3F66E;
	Wed, 22 Jan 2025 09:47:45 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 1/3] arm64: proton-pack: Move the loop and firmware enable sequences into helpers
Date: Wed, 22 Jan 2025 17:47:34 +0000
Message-Id: <20250122174736.1560714-2-james.morse@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250122174736.1560714-1-james.morse@arm.com>
References: <20250122174736.1560714-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_094748_221132_897BE325 
X-CRM114-Status: GOOD (  15.12  )
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

A variant of Spectre-BHB needs to be able to tweak the way the BHB
mitigation is selected. Move the enable routines for the loop and firmware
vectors into helpers.

Signed-off-by: James Morse <james.morse@arm.com>
---
 arch/arm64/kernel/proton-pack.c | 80 +++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index da53722f95d4..193f141d4367 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -999,9 +999,53 @@ static int __init parse_spectre_bhb_param(char *str)
 }
 early_param("nospectre_bhb", parse_spectre_bhb_param);
 
-void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
+static void spectre_bhb_enable_fw_mitigation(void)
 {
 	bp_hardening_cb_t cpu_cb;
+	struct bp_hardening_data *data = this_cpu_ptr(&bp_hardening_data);
+
+	/*
+	 * Ensure KVM uses one of the spectre bp_hardening
+	 * vectors. The indirect vector doesn't include the EL3
+	 * call, so needs upgrading to
+	 * HYP_VECTOR_SPECTRE_INDIRECT.
+	 */
+	if (!data->slot || data->slot == HYP_VECTOR_INDIRECT)
+		data->slot += 1;
+
+	this_cpu_set_vectors(EL1_VECTOR_BHB_FW);
+
+	/*
+	 * The WA3 call in the vectors supersedes the WA1 call
+	 * made during context-switch. Uninstall any firmware
+	 * bp_hardening callback.
+	 */
+	cpu_cb = spectre_v2_get_sw_mitigation_cb();
+	if (__this_cpu_read(bp_hardening_data.fn) != cpu_cb)
+		__this_cpu_write(bp_hardening_data.fn, NULL);
+
+	set_bit(BHB_FW, &system_bhb_mitigations);
+}
+
+static void spectre_bhb_enable_loop_mitigation(void)
+{
+	struct bp_hardening_data *data = this_cpu_ptr(&bp_hardening_data);
+
+	/*
+	 * Ensure KVM uses the indirect vector which will have the
+	 * branchy-loop added. A57/A72-r0 will already have selected
+	 * the spectre-indirect vector, which is sufficient for BHB
+	 * too.
+	 */
+	if (!data->slot)
+		data->slot = HYP_VECTOR_INDIRECT;
+
+	this_cpu_set_vectors(EL1_VECTOR_BHB_LOOP);
+	set_bit(BHB_LOOP, &system_bhb_mitigations);
+}
+
+void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
+{
 	enum mitigation_state fw_state, state = SPECTRE_VULNERABLE;
 	struct bp_hardening_data *data = this_cpu_ptr(&bp_hardening_data);
 
@@ -1029,43 +1073,13 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 		state = SPECTRE_MITIGATED;
 		set_bit(BHB_INSN, &system_bhb_mitigations);
 	} else if (spectre_bhb_loop_affected(SCOPE_LOCAL_CPU)) {
-		/*
-		 * Ensure KVM uses the indirect vector which will have the
-		 * branchy-loop added. A57/A72-r0 will already have selected
-		 * the spectre-indirect vector, which is sufficient for BHB
-		 * too.
-		 */
-		if (!data->slot)
-			data->slot = HYP_VECTOR_INDIRECT;
-
-		this_cpu_set_vectors(EL1_VECTOR_BHB_LOOP);
+		spectre_bhb_enable_loop_mitigation();
 		state = SPECTRE_MITIGATED;
-		set_bit(BHB_LOOP, &system_bhb_mitigations);
 	} else if (is_spectre_bhb_fw_affected(SCOPE_LOCAL_CPU)) {
 		fw_state = spectre_bhb_get_cpu_fw_mitigation_state();
 		if (fw_state == SPECTRE_MITIGATED) {
-			/*
-			 * Ensure KVM uses one of the spectre bp_hardening
-			 * vectors. The indirect vector doesn't include the EL3
-			 * call, so needs upgrading to
-			 * HYP_VECTOR_SPECTRE_INDIRECT.
-			 */
-			if (!data->slot || data->slot == HYP_VECTOR_INDIRECT)
-				data->slot += 1;
-
-			this_cpu_set_vectors(EL1_VECTOR_BHB_FW);
-
-			/*
-			 * The WA3 call in the vectors supersedes the WA1 call
-			 * made during context-switch. Uninstall any firmware
-			 * bp_hardening callback.
-			 */
-			cpu_cb = spectre_v2_get_sw_mitigation_cb();
-			if (__this_cpu_read(bp_hardening_data.fn) != cpu_cb)
-				__this_cpu_write(bp_hardening_data.fn, NULL);
-
+			spectre_bhb_enable_fw_mitigation();
 			state = SPECTRE_MITIGATED;
-			set_bit(BHB_FW, &system_bhb_mitigations);
 		}
 	}
 
-- 
2.39.2


