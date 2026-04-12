Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A63E937EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6OoCduaLH3pAsTUrSBgcgf6maBYN6UMHjW9GPSW9Tc=; b=cLGIceRChb+UG56AfgeJKKy9H4
	CS42LShwXk7dN0X7WrmU7DP2RUOHpUtBieZ4kQ6KLdWMhrdqh7WTFXoABK8ZhLOwJbx+vqHNrZxgt
	wzzs2KPlH8Vwht2lP0AVZTzHFArEGrxwY4XHo5VSJIkcpZ61wTpsGE2wLFwYcnLexIkV38tAC8Hvg
	/Fett/PK8M2S6vcmxqQsvM9J/y6BBtdV2c/Z4yBHCJ7DvrzlwJ7KPGoW/e1HBsSRmPHoSk/P9AKZJ
	0GWD48euwJZ6M2OivfqOCUXBaCCfnfB2N3QOaoQKgDBzcOAizOyhmFT9T04HU9o9AmwmzCqKiHBsN
	GPEVyJ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByFk-0000000EViX-2LZh;
	Sun, 12 Apr 2026 17:05:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByFg-0000000EVgk-1WVT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 17:05:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF50C4459D
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C70FC2BCB0;
	Sun, 12 Apr 2026 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776013539;
	bh=W8zuggLj2QSx6JBIzg0DPDLdXsNV2HuCzzIW517iS7U=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=SDGToRl9HJl3D+WQ0BNrCThKIOoobD5fQ2jkmv3MIlmw3svTJC+odJec5ewJI9+Nv
	 IpCoGr0LWrddwuMuPBMLlAApzHI1ZCt1Kr/OCQ2pmhOjHB7XsqjThTszaSfzxAakUM
	 HR2f9CEB55n9uXfdhlv0Y8Dl7sEVVl30dlzQL9c87VFFOFtE+Y/1b6FM/M5cFmRlpC
	 zaV6I+8atcQV0t3Y4OeLfQgkn77PObyiCq0Jv9lpVH4z6u6Jrpoorv/RlMraSugbgv
	 u1mEdvyMYgDe/DZIbpx8JmvIL7kebXXf+cBd26tfHNDtziWTQEhLnQ0+ZKAdpeynhB
	 Tacol4r6qMfxg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sun, 12 Apr 2026 18:04:40 +0100
Subject: [PATCH 4/5] firmware: arm_ffa: Use device node interrupts property
 for IRQ lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-ffa_ns_sgi_gicv3-v1-4-af61243eb405@kernel.org>
References: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
In-Reply-To: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_100540_684673_9D8E258D 
X-CRM114-Status: GOOD (  14.68  )
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

Use the standard interrupts property from the arm,ffa node instead of
synthesizing a GIC mapping directly.

Requires the "arm,ffa" device node to describe exactly one interrupt,
validate that its affinity spans cpu_possible_mask so the interrupt is
per-CPU, and then cross-check the mapped hwirq against the interrupt
ID returned by FFA_FEATURES.

This removes the FF-A driver's direct arm,gic-v3 lookup and raw
irq_create_of_mapping() usage while still keeping the DT description in
sync with the firmware-reported interrupt.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 53 +++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index f2f94d4d533e..7a3800a55dc1 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1821,6 +1821,45 @@ static void ffa_sched_recv_irq_work_fn(struct work_struct *work)
 	ffa_notification_info_get();
 }
 
+static int ffa_dt_map_irq(int intid)
+{
+	struct device_node *ffa __free(device_node) = NULL;
+	const struct cpumask *affinity;
+	struct irq_data *irqd;
+	int count, irq;
+
+	ffa = of_find_compatible_node(NULL, NULL, "arm,ffa");
+	if (!ffa)
+		return -ENXIO;
+
+	count = of_irq_count(ffa);
+	if (count <= 0)
+		return count ? count : -ENXIO;
+
+	if (count != 1) {
+		pr_err("FF-A currently supports exactly one interrupt\n");
+		return -EINVAL;
+	}
+
+	affinity = of_irq_get_affinity(ffa, 0);
+	if (!affinity || !cpumask_equal(affinity, cpu_possible_mask)) {
+		pr_err("FF-A currently supports only SGIs/PPIs\n");
+		return -EINVAL;
+	}
+
+	irq = of_irq_get(ffa, 0);
+	if (irq <= 0)
+		return irq ? irq : -ENXIO;
+
+	irqd = irq_get_irq_data(irq);
+	if (!irqd || irqd_to_hwirq(irqd) != intid) {
+		irq_dispose_mapping(irq);
+		return -EINVAL;
+	}
+
+	return irq;
+}
+
 static int ffa_irq_map(u32 id)
 {
 	char *err_str;
@@ -1842,19 +1881,7 @@ static int ffa_irq_map(u32 id)
 	}
 
 	if (acpi_disabled) {
-		struct of_phandle_args oirq = {};
-		struct device_node *gic;
-
-		/* Only GICv3 supported currently with the device tree */
-		gic = of_find_compatible_node(NULL, NULL, "arm,gic-v3");
-		if (!gic)
-			return -ENXIO;
-
-		oirq.np = gic;
-		oirq.args_count = 1;
-		oirq.args[0] = intid;
-		irq = irq_create_of_mapping(&oirq);
-		of_node_put(gic);
+		irq = ffa_dt_map_irq(intid);
 #ifdef CONFIG_ACPI
 	} else {
 		irq = acpi_register_gsi(NULL, intid, ACPI_EDGE_SENSITIVE,

-- 
2.43.0


