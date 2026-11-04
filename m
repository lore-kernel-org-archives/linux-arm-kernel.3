Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33186083607
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J1tMyFjs;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FWtVy0s5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4db3TAYZrLFjZxxwxODyZlvyyYvYf9/5/RO3Ou953XQ=; b=J1tMyFjsm91eFo
	U+Z3w8sQP1GiT0yJND/wvVZVCC97ilI6XYoqnsa5YCCh0bgpjqSyAYu0h0bq3O9FSghg1zfjpuWgw
	hnoei2ChRuOorMOwFHcwo6arsMaBbCpb5xtPO1xu5GocBZxGAGFGwlyF/k32ZfiE2KL/szq/OJWzk
	fgboiRYgRPHbNhl69qoLUS8JR50UM5c0BZHKXuhaZS9k/9VEQUnf1z6d0MRlbOhrz7eUeHyJUwhxK
	iJmyOJy0Il3tZCHr1ir2mT9BZt8+v2JgsUJpMWcbibVmnCsOe9UySBgDpMsPbTVj0aEErOIp9YUAd
	Wu6IOpB2CKXNK3Y80QCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOf6B-00000006Gik-3uhM;
	Wed, 04 Nov 2026 17:48:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOf69-00000006Gee-1VF3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:48:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A14B01BB2;
	Wed,  4 Nov 2026 09:48:29 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B2FB3F673;
	Wed,  4 Nov 2026 09:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793814512; bh=wwoj6e9SZ5tH3Hot4vOKxZhdLcE0F24IRGtuBeTvcps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FWtVy0s5v+Ef9yrygsYgBcwMQ+o0vvB3O5uN1pBPtCJ1dZarJ+oqIK4gtaTYr9ggF
	 vObRE+SjFBuapeo1Qaz3owt78nI2u+qnJ1AkMxS7Jk0URzbx9VvqOtSrCnec3WaFws
	 KuHKwCSiJjov5+w/5JEzQukRKHhu951eIU/QBoOE=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 04 Nov 2026 17:48:01 +0000
Subject: [PATCH v2 07/10] irqchip/gic-v5: Use firmware node name in ITS
 warning
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-host_gicv5_fixes-v2-7-e47ad20ea3c8@arm.com>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
In-Reply-To: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Bischoff <sascha.bischoff@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_094833_484726_584CFBA9 
X-CRM114-Status: GOOD (  12.45  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The common ITS initialiser can be called with an ACPI firmware node.
If firmware leaves the ITS enabled, the warning dereferences the DT
node pointer, which is NULL on that path.

Use the firmware node name for the warning and drop the DT-only pointer.

Fixes: a97efa5ba5946 ("irqchip/gic-v5: Add ACPI ITS probing")
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index c5d057f713134..8628de326f28d 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1109,7 +1109,6 @@ static int gicv5_its_init_domain(struct gicv5_its_chip_data *its, struct irq_dom
 static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_handle *handle,
 				       struct irq_domain *parent_domain, bool noncoherent)
 {
-	struct device_node *np = to_of_node(handle);
 	struct gicv5_its_chip_data *its_node;
 	u32 cr0, cr1;
 	bool enabled;
@@ -1129,7 +1128,8 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
 
 	cr0 = its_readl_relaxed(its_node, GICV5_ITS_CR0);
 	enabled = FIELD_GET(GICV5_ITS_CR0_ITSEN, cr0);
-	if (WARN(enabled, "ITS %s enabled, disabling it before proceeding\n", np->full_name)) {
+	if (WARN(enabled, "ITS %s enabled, disabling it before proceeding\n",
+		 fwnode_get_name(handle))) {
 		ret = gicv5_its_disable(its_node);
 		if (ret)
 			goto out_free_node;

-- 
2.34.1


