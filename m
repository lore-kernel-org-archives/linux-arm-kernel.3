Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEA8C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehN3ccF6lGHfrX98y8Ip02IyGuGSAaf/jp56W4Gdd/4=; b=dAu08wt1ExfIpKT0r66I1o6RVE
	0CDwYfJuTa/jLgFqqE6MJjA3YClRZvLbi8ahr7+8wfVVSr+cwJp5bFe7jgF22Zodue6Q/LRecn4AT
	GgdR8fanAgD9u0PlKpm/ymQGdEU2UiI8ZdSqxspFMKgGt4A5XMvYpvgbCBxL9NB7kltvbOlfuKWVw
	KOVrjb5rS7srA7C49tAKPNpUWqYs2DVy4YjR1CzjBUQlJikr2CbToytTefT5Sbij5YYJkU05fEvab
	I0Rg37jnaUgeYroWCnk5SMccyOeUcnJIwmq7Ravy312RyYIsGesvGw+EWHAb3Y+pjNolPh34oRMye
	Q+D0ykyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1dT-0000000CvqT-33EH;
	Fri, 25 Sep 2026 08:50:27 +0000
Received: from out-243.mta1.migadu.com ([95.215.58.243] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1dM-0000000CvnP-2URe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 08:50:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=kacAke/FI9BR5UARy2fk/gkWdN8kBdKaAW1g75U8sWY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790326218; v=1; x=1790931018;
 b=Yg/d9xwgYX1BaszIKwk4PCCDz1keqWPk+U6pC9/3X7FQe4kRS5NvKy5RcusOudXjYpIEUbgc
 KIFFyZI4MgN6pUDtDk6lcbSRTpS5TCFEtLngPXx3e+niVTh77iMY9rz0o+W+hGB83+d0P1qehKF
 dywnlInlLs3dz6pJtVl31HC4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e4c9ed797f156344;
	Fri, 25 Sep 2026 08:50:17 +0000
X-Mizu-Trace-ID: e4c9ed797f156344
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
Subject: [PATCH v2 3/3] irqchip/gic-v3: Don't register a redistributor that was never counted
Date: Fri, 25 Sep 2026 09:50:00 +0100
Message-Id: <20260925085000.753400-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260925085000.753400-1-fuad.tabba@linux.dev>
References: <20260925085000.753400-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_015020_781132_C22FB57B 
X-CRM114-Status: GOOD (  12.95  )
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
gic_acpi_parse_madt_gicc() registers every enabled one. On a MADT with
no GICR entries, an enabled GICC with a zero GICR base therefore makes
gic_acpi_register_redist() write a struct redist_region past the end of
the array.

Commit fa2dabe57220e ("irqchip/gic-v3: Don't return errors from
gic_acpi_match_gicc()") removed the check that kept the two consistent.
Its message says such entries are still caught by gic_populate_rdist(),
but that runs from gic_cpu_init(), after the write.

Skip the entry instead, and mark the CPU's redistributor broken as the
online-capable path does, so that gic_check_rdist() rejects the CPU.
gic_starting_cpu() runs past cpuhp's last failure point, so without the
mark the CPU would come online with its redistributor and CPU interface
unconfigured. With an ITS, its_cpu_init() would then dereference a NULL
rd_base.

Fixes: fa2dabe57220e ("irqchip/gic-v3: Don't return errors from gic_acpi_match_gicc()")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc4..bfc10d657fd57 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2344,6 +2344,17 @@ gic_acpi_parse_madt_gicc(union acpi_subtable_headers *header,
 		return 0;
 	}
 
+	/* Not counted by gic_acpi_match_gicc(), so there is no slot for it */
+	if (!gicc->gicr_base_address) {
+		int cpu = get_cpu_for_acpi_id(gicc->uid);
+
+		pr_warn(FW_BUG "GICC entry with ACPI UID %u has no GICR base address, CPU kept offline\n",
+			gicc->uid);
+		if (cpu >= 0)
+			cpumask_set_cpu(cpu, &broken_rdists);
+		return 0;
+	}
+
 	redist_base = ioremap(gicc->gicr_base_address, size);
 	if (!redist_base)
 		return -ENOMEM;
-- 
2.39.5


