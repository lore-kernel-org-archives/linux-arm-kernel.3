Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F642E937F6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xA34B4kzZX71VV7cfkHSUUShU91G3Z4WFbJq80Q9vow=; b=lcCzkuDfBr411hRRyZVfCu1dfh
	4ie53rtCxUsIOAXzgtPhsq6IggISyB5xcUBYAuwpb1dBY3bqwDmghCYtG2i0Hbb6cZ3/kYgRMr58z
	8svIHWEpfLtCZ956VabovrWv6v083JzV5pe9gLKJdxsU6K+s3YnJ5/v5mJru4xZKuUxiy0clMnT5F
	ItBloVZiqggZEV29p1reTlREH66jIR7MJa4PFo0dhlN3EhfzeI72AZC6Y4+UHNSBsuzeMOq3tvc8y
	nSp2oNL0jCWkMrNzd+NAo+DSkUB2C8URPoNs4/LTRml6YTqQDiVNfkIghXX/NE/d6jbXxtvkWOWxS
	986MYiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByFj-0000000EVhw-48cB;
	Sun, 12 Apr 2026 17:05:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByFd-0000000EVfw-0Muq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 17:05:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 769216014B
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B824CC2BCB0;
	Sun, 12 Apr 2026 17:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776013536;
	bh=OyYhkCOzrlRJO5g72u18UBvcrbV1IuXqg8djuqcBMYw=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=Z13nwc5qjjYT80p/eSN+DKekQnWxwRaHt42gGr9DhvCL2rsdFjrhY/O6k+Zb5SOCl
	 aUT41FCudjo3kdd3gOdoxi9CnHIfWhnk5nv0peKDWQypQfTYGk77GEFZ+WQGVsAu0z
	 GIpVX7B8A+7KJw0ZZftDD5Ak7UOx+6gl8dZLeMAgGKIKTqI0vv1xUUB2rW5ga/pi3Y
	 e+08CMOxlkt04/uYjyf+W4PO+IH7Ddq+gbEYyaOocqx6LCugZZPeF2qMvDyiewmYtw
	 CNLLhQoPyfdkWNec0t8aOYKX+6L+jFW3MyL2fIlYNS1gvXIZywpjr6EK6S0n1L33h2
	 GeJArqzDzHBEA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sun, 12 Apr 2026 18:04:38 +0100
Subject: [PATCH 2/5] irqchip/gic-v3: Support secure-donated non-secure SGIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-ffa_ns_sgi_gicv3-v1-2-af61243eb405@kernel.org>
References: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
In-Reply-To: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.0
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

Parse secure-donated SGI ranges from the firmware, reject invalid
interrupt specifiers, and allow devicetree consumers to map only the
SGIs explicitly donated by the secure side to non-secure software.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/irqchip/irq-gic-v3.c | 86 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 20f13b686ab2..cc7720d9fb0e 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -35,6 +35,8 @@
 #include <asm/smp_plat.h>
 #include <asm/virt.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 #include "irq-gic-common.h"
 
 static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
@@ -65,6 +67,7 @@ struct gic_chip_data {
 	u64			flags;
 	bool			has_rss;
 	unsigned int		ppi_nr;
+	u16			donated_sgi_mask;
 	struct partition_affinity *parts;
 	unsigned int		nr_parts;
 };
@@ -95,6 +98,7 @@ static bool nmi_support_forbidden;
  * with hwirq IDs, is simplified by accounting for all 16.
  */
 #define SGI_NR		16
+#define GIC_SGI_IPI_NR	8
 
 /*
  * The behaviours of RPR and PMR registers differ depending on the value of
@@ -119,6 +123,74 @@ static bool nmi_support_forbidden;
  */
 static DEFINE_STATIC_KEY_FALSE(supports_pseudo_nmis);
 
+static bool gic_sgi_is_donated_to_ns(unsigned int sgi)
+{
+	return sgi < SGI_NR && (gic_data.donated_sgi_mask & BIT(sgi));
+}
+
+static int __init gic_of_init_donated_sgi_ranges(struct device_node *node)
+{
+	const char *propname = "arm,secure-donated-ns-sgi-ranges";
+	int count, i;
+	u32 *ranges;
+	u16 mask = 0;
+
+	count = of_property_count_u32_elems(node, propname);
+	if (count < 0) {
+		if (count == -EINVAL)
+			return 0;
+
+		pr_err("%pOF: unable to read %s\n", node, propname);
+		return count;
+	}
+
+	if (!count)
+		return 0;
+
+	if (count % 2) {
+		pr_err("%pOF: %s must contain <sgi span> pairs\n",
+		       node, propname);
+		return -EINVAL;
+	}
+
+	ranges = kcalloc(count, sizeof(*ranges), GFP_KERNEL);
+	if (!ranges)
+		return -ENOMEM;
+
+	if (of_property_read_u32_array(node, propname, ranges, count)) {
+		pr_err("%pOF: unable to read %s\n", node, propname);
+		kfree(ranges);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < count; i += 2) {
+		u32 sgi = ranges[i];
+		u32 span = ranges[i + 1];
+		u32 end;
+
+		if (sgi < GIC_SGI_IPI_NR || sgi >= SGI_NR || !span || span > 8) {
+			pr_err("%pOF: invalid SGI range <%u %u> in %s\n",
+			       node, sgi, span, propname);
+			kfree(ranges);
+			return -EINVAL;
+		}
+
+		end = sgi + span;
+		if (end > SGI_NR) {
+			pr_err("%pOF: SGI range <%u %u> exceeds SGI space in %s\n",
+			       node, sgi, span, propname);
+			kfree(ranges);
+			return -EINVAL;
+		}
+
+		mask |= GENMASK(end - 1, sgi);
+	}
+
+	kfree(ranges);
+	gic_data.donated_sgi_mask = mask;
+	return 0;
+}
+
 static u32 gic_get_pribits(void)
 {
 	u32 pribits;
@@ -1614,6 +1686,12 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 		case 3:			/* EPPI */
 			*hwirq = fwspec->param[1] + EPPI_BASE_INTID;
 			break;
+		case GIC_SGI:		/* SGI */
+			if (!gic_sgi_is_donated_to_ns(fwspec->param[1]))
+				return -EINVAL;
+
+			*hwirq = fwspec->param[1];
+			break;
 		case GIC_IRQ_TYPE_LPI:	/* LPI */
 			*hwirq = fwspec->param[1];
 			break;
@@ -1623,6 +1701,10 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 
 		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
 
+		if (fwspec->param[0] == GIC_SGI &&
+		    *type != IRQ_TYPE_EDGE_RISING)
+			return -EINVAL;
+
 		/*
 		 * Make it clear that broken DTs are... broken.
 		 */
@@ -2239,6 +2321,10 @@ static int __init gic_of_init(struct device_node *node, struct device_node *pare
 
 	gic_enable_of_quirks(node, gic_quirks, &gic_data);
 
+	err = gic_of_init_donated_sgi_ranges(node);
+	if (err)
+		goto out_unmap_rdist;
+
 	err = gic_init_bases(dist_phys_base, dist_base, rdist_regs,
 			     nr_redist_regions, redist_stride, &node->fwnode);
 	if (err)

-- 
2.43.0


