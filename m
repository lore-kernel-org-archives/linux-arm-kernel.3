Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282B7C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 16:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eXdq8pjz28evqcBzIPG2oZHIuqFHhx8mdctRki8jLvw=; b=NG2t4xDGrTkBOUdNwKROXKQpPw
	mJuvHd8HASZRM88e9Q7mUdUrN1GUE2oD8nwpJfh0kSJgqFIkF75YaDz7J2lZ7tKnEHXN77bgQ1mV2
	yKGl1uWUmcbd0eZcHGFi5zngNqD9KGYB3OiC70rXzqIaHSVuVr34JlxG1EuQDtN+l2Ufo2pFglWa3
	mrge36w3AB+bN5erPunjBnyvumNHB1t5584gpmyVDS1OrX05S5hdx3ihbKQAuWVCBv2gQrWzgtgw4
	XjAvmeNUcScE7PIxArrt2xLaK/sEFWu1/vteUddtJYaogmp9zaO+0dcmoOPoKoCYoB/WvdEWhCnff
	aEbLV3yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnfBX-00000000Wxb-20Rj;
	Sat, 25 Jul 2026 16:25:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnfBW-00000000WxQ-1hTk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 16:25:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A444660A6E;
	Sat, 25 Jul 2026 16:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE231F000E9;
	Sat, 25 Jul 2026 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784996709;
	bh=eXdq8pjz28evqcBzIPG2oZHIuqFHhx8mdctRki8jLvw=;
	h=From:To:Cc:Subject:Date;
	b=Nv1xG+eoDJ33ZiTxB2Q+MtkSfhTS0Utuw2iSHxEA0VvNABS6YdkDD2eooM2YUPaJx
	 FSXRMzfi39rQV9PTjU8HkbsyRNKHcNYD5OZ1H1MS1rmscprx9pz2M/j9t2DVtLDNA5
	 D7iUVFVd3BHZgey+uXnBIGQs2X1wi+V3Dx0HuD8MBZ/Ce5w0OFSfmPT2yt2URLtr87
	 lPiAEJfzch2oxME/0vrApVM0ViiqA4059/66amDBdZpKud1IGkV/f3mOnBTN1n00dO
	 1IdHOuiJGfhd/6ByS3UGyqD9GHfrbbffKg7oL+xk6Z059WWkkjVVKFr4TaUdIMgDqV
	 mQRRkIl6+6Gyw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=lobster-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wnfBT-00000008nT1-1n4n;
	Sat, 25 Jul 2026 16:25:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH] perf: arm_pmu_acpi: Get rid of the edge-triggered interrupt oddity
Date: Sat, 25 Jul 2026 17:26:27 +0100
Message-ID: <20260725162627.145301-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, will@kernel.org
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

The ACPI spec bizarrely indicates that the PMU interrupt can be
edge-triggered, which contradicts the very basics of the PMU
architecture (SW is required to clear the interrupt condition for
the level to drop).

Remove the code parsing this flag and always flag the interrupt
as level triggered, no matter what firmware says.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/perf/arm_pmu_acpi.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/perf/arm_pmu_acpi.c b/drivers/perf/arm_pmu_acpi.c
index e80f76d95e68b..ca6bf8f86cfe9 100644
--- a/drivers/perf/arm_pmu_acpi.c
+++ b/drivers/perf/arm_pmu_acpi.c
@@ -22,7 +22,7 @@ static DEFINE_PER_CPU(int, pmu_irqs);
 static int arm_pmu_acpi_register_irq(int cpu)
 {
 	struct acpi_madt_generic_interrupt *gicc;
-	int gsi, trigger;
+	int gsi;
 
 	gicc = acpi_cpu_get_madt_gicc(cpu);
 
@@ -38,11 +38,6 @@ static int arm_pmu_acpi_register_irq(int cpu)
 	if (!gsi)
 		return 0;
 
-	if (gicc->flags & ACPI_MADT_PERFORMANCE_IRQ_MODE)
-		trigger = ACPI_EDGE_SENSITIVE;
-	else
-		trigger = ACPI_LEVEL_SENSITIVE;
-
 	/*
 	 * Helpfully, the MADT GICC doesn't have a polarity flag for the
 	 * "performance interrupt". Luckily, on compliant GICs the polarity is
@@ -53,8 +48,12 @@ static int arm_pmu_acpi_register_irq(int cpu)
 	 * may not match the real polarity, but that should not matter.
 	 *
 	 * Other interrupt controllers are not supported with ACPI.
+	 *
+	 * The spec also indicates that the PMU interrupt can be edge
+	 * triggered, which doesn't make any sense (SW needs to clear the
+	 * interrupt condition for the level to drop). Ignore the silly flag.
 	 */
-	return acpi_register_gsi(NULL, gsi, trigger, ACPI_ACTIVE_HIGH);
+	return acpi_register_gsi(NULL, gsi, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_HIGH);
 }
 
 static void arm_pmu_acpi_unregister_irq(int cpu)
-- 
2.47.3


