Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B623D77883
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KZhm9ZFmyeGkpRb3LCUIe4l500iXwvZfz3QgZeAr0c=; b=1g1lW/ZITDS0T0azKsSAwcI46P
	24HWZ0L0NOMoAWocz2O6mgwRgvxXqxPb0klEydSGRWJ4G7ohOZ+jGIScYmhWMwNFhgEpl4yred3tG
	4Fr6bu/svORz3csE77AhlykpnLA+I8rwRUwsUBUmscRtYYmQAkVgilCPhjvZ63RNAqoW9YSDrp7xl
	8c8rI7ZqZ50DbHpDT8s9KparjwjCwwewoviXpXg036QDr0JJiGRGLjS5eNqth/PIQUORUfFf3Kl85
	xQAwrq0ELNEPWvokuKLtGiuX5SuTgr1yAvnz86/ZfDJYzlcBFAzvs3rKii/P079SNd4EGVWuK00lA
	hf1Gsz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNn-00000009EN9-24pi;
	Fri, 23 Jan 2026 16:51:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNT-00000009E5V-3WUc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:51:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A2D2168F;
	Fri, 23 Jan 2026 08:51:12 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C81243F73F;
	Fri, 23 Jan 2026 08:51:17 -0800 (PST)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: alexandru.elisei@arm.com,
	andrew.jones@linux.dev,
	eric.auger@redhat.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [kvm-unit-tests PATCH v6 10/14] arm64: pmu: count EL2 cycles
Date: Fri, 23 Jan 2026 16:50:49 +0000
Message-Id: <20260123165053.2250754-11-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260123165053.2250754-1-joey.gouly@arm.com>
References: <20260123165053.2250754-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_085119_927720_85734085 
X-CRM114-Status: UNSURE (   9.70  )
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

Count EL2 cycles if that's the EL kvm-unit-tests is running at!

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Acked-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 arm/pmu.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arm/pmu.c b/arm/pmu.c
index 2dc0822b..2fcec71a 100644
--- a/arm/pmu.c
+++ b/arm/pmu.c
@@ -121,6 +121,8 @@ static struct pmu pmu;
 #define PMINTENCLR   __ACCESS_CP15(c9, 0, c14, 2)
 #define PMCCNTR64    __ACCESS_CP15_64(0, c9)
 
+#define PMCCFILTR_EL0_DEFAULT	0
+
 static inline uint32_t get_id_dfr0(void) { return read_sysreg(ID_DFR0); }
 static inline uint32_t get_pmcr(void) { return read_sysreg(PMCR); }
 static inline void set_pmcr(uint32_t v) { write_sysreg(v, PMCR); }
@@ -206,6 +208,9 @@ static void test_overflow_interrupt(bool overflow_at_64bits) {}
 #define ID_DFR0_PMU_V3_8_5	0b0110
 #define ID_DFR0_PMU_IMPDEF	0b1111
 
+#define PMCCFILTR_EL0_NSH	BIT(27)
+#define PMCCFILTR_EL0_DEFAULT	(current_level() == CurrentEL_EL2 ? PMCCFILTR_EL0_NSH : 0)
+
 static inline uint32_t get_id_aa64dfr0(void) { return read_sysreg(id_aa64dfr0_el1); }
 static inline uint32_t get_pmcr(void) { return read_sysreg(pmcr_el0); }
 static inline void set_pmcr(uint32_t v) { write_sysreg(v, pmcr_el0); }
@@ -246,8 +251,7 @@ static inline void precise_instrs_loop(int loop, uint32_t pmcr)
 #define PMCNTENSET_EL0 sys_reg(3, 3, 9, 12, 1)
 #define PMCNTENCLR_EL0 sys_reg(3, 3, 9, 12, 2)
 
-#define PMEVTYPER_EXCLUDE_EL1 BIT(31)
-#define PMEVTYPER_EXCLUDE_EL0 BIT(30)
+#define PMEVTYPER_EXCLUDE_EL0 (BIT(30) | (current_level() == CurrentEL_EL2 ? BIT(27) : 0))
 
 static bool is_event_supported(uint32_t n, bool warn)
 {
@@ -1063,7 +1067,8 @@ static bool check_cycles_increase(void)
 	/* init before event access, this test only cares about cycle count */
 	pmu_reset();
 	set_pmcntenset(1 << PMU_CYCLE_IDX);
-	set_pmccfiltr(0); /* count cycles in EL0, EL1, but not EL2 */
+
+	set_pmccfiltr(PMCCFILTR_EL0_DEFAULT);
 
 	set_pmcr(get_pmcr() | PMU_PMCR_LC | PMU_PMCR_C | PMU_PMCR_E);
 	isb();
@@ -1118,7 +1123,7 @@ static bool check_cpi(int cpi)
 	/* init before event access, this test only cares about cycle count */
 	pmu_reset();
 	set_pmcntenset(1 << PMU_CYCLE_IDX);
-	set_pmccfiltr(0); /* count cycles in EL0, EL1, but not EL2 */
+	set_pmccfiltr(PMCCFILTR_EL0_DEFAULT);
 
 	if (cpi > 0)
 		printf("Checking for CPI=%d.\n", cpi);
-- 
2.25.1


