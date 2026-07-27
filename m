Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E724C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2b+6Qq/+dF4uECHy0vgo2Z9QeBZKUfwZgmoh4KSo89E=; b=x+wDwmcv+qiEjOBMuxZT/KMa0T
	c7VArbz8T9i3pkHSuOz7htbA0ppEycjHFQDB1mKPsE/JQtlnpBSxoswUsUZoIMrXAlUEbo4G+Oeao
	4+RgFOg7K2Sw8WwwAPCUfgcgPlq5XkBPzsNH40cxbEUtFhxIvBdaFhjKNsjopdIRJCmN3e5oQ4ZlI
	tGtWOM2G9DPOo1fV5zh+ZJcUgGnxbtXZPPRsjyqz8glWTAo+om8AaAXBpiiTYg2kfsyNkSWcSiJHa
	X8+ul/gcsXBHY4XCVQiWtm6lfS6FBK4mxQHlGB+F4tmDxG1QwbrCUhEaSlAHa5kkGi2vE4wTbgqZq
	n6rsHdDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOKs-00000003OVE-3ijE;
	Mon, 27 Jul 2026 16:37:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOJK-00000003NaL-0icO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:36:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B3B6175D;
	Mon, 27 Jul 2026 09:36:09 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B49F03F86F;
	Mon, 27 Jul 2026 09:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170173; bh=KwW30v+bowjB47BA2U/KMnV/pqGB+FISzSYi6ZIuAVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PK9G9TmkwnWalZ3rxZt4FlWr+2WW+vfIdqq12r4RsYkx9REjA4LA1KVUEn2H8bhy7
	 nnZ1muSG6ioN6JQrfSveaAgtAOEn4i/q+FqAcMdePwIqb5SyjBYSM5zacf/ycO7g+M
	 yXLlDihvK7uKCp3rfOWnU2p/1yYJZjF8EVkYLYk8=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 43/45] arm64: smp: Add NMI support for LPI-backed IPIs
Date: Mon, 27 Jul 2026 17:34:51 +0100
Message-Id: <20260727163453.7969-44-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093614_319861_D8872DFD 
X-CRM114-Status: GOOD (  14.04  )
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

LPI-backed IPIs are currently always requested and managed as regular
IRQs. Allow IPIs selected by ipi_should_be_nmi() to be requested as
NMIs, falling back to regular IRQs when the NMI request fails.

Track which IPIs were successfully requested as NMIs so that the
per-CPU enable and disable paths use the appropriate NMI helpers.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/kernel/smp.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 9bacdbb2aa44..012633ea8347 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -1123,16 +1123,24 @@ static const struct ipi_irq_ops ipi_sgi_ops = {
 
 static void ipi_lpi_enable(int cpu, int ipi)
 {
-	enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
+	if (test_bit(ipi, get_ipi_nmi_bitmap(cpu)))
+		enable_nmi(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
+	else
+		enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
 }
 
 static void ipi_lpi_disable(int cpu, int ipi)
 {
-	disable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
+	if (test_bit(ipi, get_ipi_nmi_bitmap(cpu)))
+		disable_nmi_nosync(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
+	else
+		disable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
 }
 
 static void ipi_lpi_setup(int ipi, int ncpus)
 {
+	bool is_nmi = ipi_should_be_nmi(ipi);
+
 	for (int cpu = 0; cpu < ncpus; cpu++) {
 		int err, irq;
 
@@ -1141,13 +1149,29 @@ static void ipi_lpi_setup(int ipi, int ncpus)
 		err = irq_force_affinity(irq, cpumask_of(cpu));
 		WARN(err, "Could not force affinity IRQ %d, err=%d\n", irq, err);
 
-		err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI",
-				  NULL);
-		WARN(err, "Could not request IRQ %d, err=%d\n", irq, err);
+		/*
+		 * Try to request NMI if it should be
+		 */
+		if (is_nmi && request_nmi(irq, ipi_handler, IRQF_PERCPU | IRQF_NO_AUTOEN, "IPI", NULL)) {
+			/*
+			 * Fallback to regular IRQ
+			 */
+			is_nmi = false;
+		}
+		/*
+		 * Otherwise regular IRQ
+		 */
+		if (!is_nmi) {
+			err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI", NULL);
+			WARN(err, "Could not request IRQ %d, err=%d\n", irq, err);
+		}
 
 		irq_set_status_flags(irq, (IRQ_HIDDEN | IRQ_NO_BALANCING_MASK));
 
 		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
+
+		if (is_nmi)
+			set_bit(ipi, get_ipi_nmi_bitmap(cpu));
 	}
 }
 
-- 
2.34.1


