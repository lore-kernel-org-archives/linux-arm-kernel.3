Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533F4C98324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrWDwRJ1J8rOTTygEAp0iSfSKahiTcbXE/ibpn6V4Co=; b=ixStnKNLRFnKVjBW5OkavWdl4b
	+6r/lMARP66B/mM9RJwYZOr4tyZ3ua5+n847H6Opup6O8I9bTH1v8nWtViroRgJlDe4HPrlLUcpIF
	9tVmb7tOmWon7OAjP9hvh4lLqqdPO8CsYJK6hUMU4A109wEk3IGN22KOrNTxDGwHEQM4JN8ausT68
	78lk1OAh35Rqv0fCMiZQxilCv8bXpBK5NkHwefK218+nJb6n/qFtr18eBkIp9lWjPfzUTmjZWAAhS
	/JnQObGW1pi+bRQuRugE7oIbRGeFXLd8nwlaMjbLMhKL2/9hMBGP4AgofNXmkVeVxvZ/cJyR3C8Ip
	MGFalaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9m6n-0000000BZMr-0BcM;
	Thu, 24 Sep 2026 16:15:41 +0000
Received: from out-230.mta1.migadu.com ([95.215.58.230] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9m6f-0000000BZJR-2j5q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:15:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=dp3KJ7rutPRJZmO1yc+sOK8ZIrQBmZVNRnPhzkGaBb0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790266531; v=1; x=1790871331;
 b=VDwRURR5LrPMl6OqwzG7mWdOJjB4IUP3NXsmGUnVgW0IEIgaFGT6J90ti2E5XQqd0Jls0VKU
 FT9ruLFGDXQ1pndniJaMFnmVCqrPQjxE/3Bly00+dH+rNh2iW1WPV1f0iXqvI2aDhbfz7MM6WKg
 PkWUodE8QkGJUC+6LhKzf/xk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a5d62044b9547a85;
	Thu, 24 Sep 2026 16:15:31 +0000
X-Mizu-Trace-ID: a5d62044b9547a85
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] irqchip/gic-v3: Don't register a redistributor that was never counted
Date: Thu, 24 Sep 2026 17:15:14 +0100
Message-Id: <20260924161514.1112730-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260924161514.1112730-1-fuad.tabba@linux.dev>
References: <20260924161514.1112730-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_091533_839167_83C456EB 
X-CRM114-Status: GOOD (  11.99  )
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

gic_acpi_match_gicc() counts only the enabled GICCs with a non-zero
gicr_base_address, and that count sizes redist_regs[], but
gic_acpi_parse_madt_gicc() registers every enabled one. For an enabled
GICC with a zero GICR base, gic_acpi_register_redist() therefore writes
a struct redist_region past the end of the array.

Commit fa2dabe57220e ("irqchip/gic-v3: Don't return errors from
gic_acpi_match_gicc()") removed the check that kept the two consistent;
its message says such entries are still caught by gic_populate_rdist(),
but that runs from gic_cpu_init(), after the write. Skip the entry
instead.

Fixes: fa2dabe57220e ("irqchip/gic-v3: Don't return errors from gic_acpi_match_gicc()")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc4..fb6a0570fb154 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2344,6 +2344,12 @@ gic_acpi_parse_madt_gicc(union acpi_subtable_headers *header,
 		return 0;
 	}
 
+	/* Not counted by gic_acpi_match_gicc(), so there is no slot for it */
+	if (!gicc->gicr_base_address) {
+		pr_warn(FW_BUG "GICC entry with ACPI UID %u has no GICR base address\n", gicc->uid);
+		return 0;
+	}
+
 	redist_base = ioremap(gicc->gicr_base_address, size);
 	if (!redist_base)
 		return -ENOMEM;
-- 
2.39.5


