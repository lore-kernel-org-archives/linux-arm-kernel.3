Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B42C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnWmUjAH7/KGAbRfo7IseJs1hEL0jSfFDpWwQ2aUfX0=; b=wsl8E5tkuTqf/HUGoa9K/tELoM
	crafpEdcRkm/QytQZ0sF46c6rx5ulvLwJLGhV+TmLMkahBmnwmdyX2uDqNjhTJRuHdvJBANE+n0Sr
	6rPAUrdmirF0jNLdeWEoGkzR1KLgnW44KO0AqxVblGDbQat7mLbQMlzlPQWStSO4blsxCZceBQKxq
	HrQC+Xa+Ylolp6J4Ib9EM0a5LFrS/E3Hv+EsDi2CifkhVcX+xmCnsB1I/UW2jIZ9zANo5q8KRrGy4
	pp/zUJfy7pA98uCJXjoPo0c61BeEwuqM9EGWgEybUEKXS9/ST6Pl5yGgKv5mCOLH5hwm/snNxcz1F
	r+U1GdYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOKr-00000003OQS-0UiX;
	Mon, 27 Jul 2026 16:37:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOJL-00000003NcB-3mzP
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Jul 2026 16:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hnWmUjAH7/KGAbRfo7IseJs1hEL0jSfFDpWwQ2aUfX0=; b=VLp5tvSHY2ORUwGBPzgfAGk2Cc
	CxNHYbbFn8c9nZADtx9d93qY9KB0tn9O/7HmnsX0Ph8xhAnaUeAQYZRM4nR7wc6SC+U0xl4IABzfb
	9iz3EzV8iI+3b0ZR2GccwJ2uqREg24x6wTPDlWLsspPIxm8JpIBulrPPgpOaejD9bnVYb8jsK+XTU
	eAshSX1ls2rUTSiReny/c7CijDk6lUtP9bOsEFNkO2+M+wFHMLYhfekvbQ1059rhQUgfWOdHNMi/n
	6Xai9CQjnXIXA4ikK8lGYyGCsOt3+vcDQJ2FIwuqxGJZUpfswe4KdXP2t6aH/+V1QID+NRtVEbumy
	WiwfPYIw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1woOJH-00000004GvD-0hZZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:36:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA7331688;
	Mon, 27 Jul 2026 09:36:04 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D3EDA3F86F;
	Mon, 27 Jul 2026 09:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170168; bh=dt6wjM09wo8MAqKwtPP6BsZ2ym3CeAlNJuq/rRoZ6O0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pyVuq0sXufwq6pxldnGmOFwX5qo8AXhsCvlwm5vga4q75ntwKvakGJ6HxxlKUqsh1
	 qev8VUGI4AYLMaJi9ppVXU/Wv2P/GHdldGgazLFgpKEW9ttI7hfpHI0+6/DFBJrY9J
	 lOamITeYZfSrHcMSdvkDRBwc2DQa7FzMp6QLBn7w=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 39/45] arm64: smp: Fall back to IRQ when IPI NMI request fails
Date: Mon, 27 Jul 2026 17:34:47 +0100
Message-Id: <20260727163453.7969-40-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_173611_542985_74D85590 
X-CRM114-Status: GOOD (  16.10  )
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

Existing IPI setup logic relies on ipi_should_be_nmi() to decide
whether to request an NMI (if supported) or an ordinary IRQ. If NMI is
not supported, using an ordinary IRQ is acceptable.

FEAT_NMI requires complementary support in the interrupt
controller. If FEAT_NMI is present but interrupt controller support is
absent, request_percpu_nmi() can fail.

One way to prevent this would be to extend ipi_should_be_nmi() to also
check for interrupt controller support. However, since falling back to
an ordinary IRQ is acceptable, treat ipi_should_be_nmi() as a hint
instead. Whether an IPI is actually registered as an NMI is determined
by the success or failure of request_percpu_nmi(). If the request
fails, fall back to request_irq().

Track which IPIs were actually registered as NMIs and use that state
in the per-CPU enable and disable paths. This avoids calling the
percpu NMI helpers for an IPI that fell back to regular IRQ handling.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/kernel/smp.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 3dd4bc02caed..9bacdbb2aa44 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -69,11 +69,13 @@ static int nr_ipi __ro_after_init = NR_IPI;
 
 struct ipi_descs {
 	struct irq_desc *descs[MAX_IPI];
+	DECLARE_BITMAP(nmi_bitmap, MAX_IPI);
 };
 
 static DEFINE_PER_CPU_READ_MOSTLY(struct ipi_descs, pcpu_ipi_desc);
 
 #define get_ipi_desc(__cpu, __ipi) (per_cpu_ptr(&pcpu_ipi_desc, __cpu)->descs[__ipi])
+#define get_ipi_nmi_bitmap(__cpu) (per_cpu_ptr(&pcpu_ipi_desc, __cpu)->nmi_bitmap)
 
 struct ipi_irq_ops {
 	void (*setup)(int ipi, int ncpus);
@@ -1051,31 +1053,44 @@ static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
 
 static void ipi_sgi_setup(int ipi, int ncpus)
 {
+	bool is_nmi = ipi_should_be_nmi(ipi);
 	int err, irq, cpu;
 
 	if (WARN_ON_ONCE(ncpus))
 		return;
 
-
 	irq = ipi_irq_base + ipi;
 
-	if (ipi_should_be_nmi(ipi)) {
-		err = request_percpu_nmi(irq, ipi_handler, "IPI", NULL, &irq_stat);
-		WARN(err, "Could not request IRQ %d as NMI, err=%d\n", irq, err);
-	} else {
+	/*
+	 * Try to request NMI if it should be
+	 */
+	if (is_nmi && request_percpu_nmi(irq, ipi_handler, "IPI", NULL, &irq_stat)) {
+		/*
+		 * Fallback to regular IRQ
+		 */
+		is_nmi = false;
+	}
+
+       /*
+        * Otherwise regular IRQ
+        */
+	if (!is_nmi) {
 		err = request_percpu_irq(irq, ipi_handler, "IPI", &irq_stat);
 		WARN(err, "Could not request IRQ %d as IRQ, err=%d\n", irq, err);
 	}
 
-	for_each_possible_cpu(cpu)
+	for_each_possible_cpu(cpu) {
 		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
+		if (is_nmi)
+			set_bit(ipi, get_ipi_nmi_bitmap(cpu));
+	}
 
 	irq_set_status_flags(irq, IRQ_HIDDEN);
 }
 
 static void ipi_sgi_enable(int cpu, int ipi)
 {
-	if (ipi_should_be_nmi(ipi)) {
+	if (test_bit(ipi, get_ipi_nmi_bitmap(cpu))) {
 		prepare_percpu_nmi(ipi_irq_base + ipi);
 		enable_percpu_nmi(ipi_irq_base + ipi, 0);
 	} else {
@@ -1085,7 +1100,7 @@ static void ipi_sgi_enable(int cpu, int ipi)
 
 static void ipi_sgi_disable(int cpu, int ipi)
 {
-	if (ipi_should_be_nmi(ipi)) {
+	if (test_bit(ipi, get_ipi_nmi_bitmap(cpu))) {
 		disable_percpu_nmi(ipi_irq_base + ipi);
 		teardown_percpu_nmi(ipi_irq_base + ipi);
 	} else {
-- 
2.34.1


