Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFCECA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qRNCjTDNOtlnPqxguTj1/k1LkcL0LOs+o9be9UtZmLs=; b=XKEjsT4f5oFVcgErUhFj8oHxqx
	UO5Xkci8TmxR8V/awDYvbaOt5NyxStsq9ksWqyCxtx4Igt0ioFg21Nz7dF/mpQ1ck2ZKL89HC/3Me
	WWiUwz5RGzR2it3XDzPNWCOcPV9E0bYeLLzRzN2ofyWs05JiJbrk/V7kMSqrKDcVcj8AC/lrG+i/A
	wiZ2P4CBU/azam64HkhyHZHTbnGsqClcHlUAAAkSFBceVULZ2HrLej6E/VWGtA4xB3wYafNiTjTPl
	d8+GSqkt8JMpJub5cweHEPc1y6U2DFmf4NNnIrF0hUHkSRymcoivIkVmXsJ62xj0ordE5fdZx9Yi+
	GXsXQz1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVdc-0000000GgHs-02SF;
	Thu, 14 Aug 2025 10:56:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUSs-0000000GR67-1zTz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:41:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4F44416B3;
	Thu, 14 Aug 2025 09:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48831C4CEED;
	Thu, 14 Aug 2025 09:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755164501;
	bh=VAMwO3NcuTmsk/BxtnuIKVOvPEmhRux3rWhojqXD2c4=;
	h=From:To:Cc:Subject:Date:From;
	b=u78ATZLq9SbXaYfX6zNgkrXe9P4pFSv+sxeyrfiwK/go0Jh4dPxi2LfElXXPQrMaE
	 lxH6ov2PoHVpLptAHHjhwckBmBaNb263RJ2yYqy5pnb7TMNUUEjIpmihjZOxxQOw7+
	 8HOorzX7lhDTwVtFcodI633ofu2tNU+DzjHhN2aNfEFTYSp6bXhsdyF9zpx4OApPMl
	 OxEEhuvMqPlwbuiQMBm0qzj3dJl5SGhtaOpLNaFIZpQa5djNMzH1JnrJo5GgNYsZXY
	 jsqtmLjdzEouQECYg66pNtA0TF4mbmYS4ktCIYLRv8DjSPqECF2ijzsykjNbkbRqis
	 FVnUyZl76W/Lw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] irqchip/gic-v5: Remove undue WARN_ON()s in the IRS affinity parsing
Date: Thu, 14 Aug 2025 11:41:38 +0200
Message-ID: <20250814094138.1611017-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_024142_537058_3E698C2A 
X-CRM114-Status: GOOD (  14.01  )
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

In gicv5_irs_of_init_affinity() a WARN_ON() is triggered if:

(1) a phandle in the "cpus" property does not correspond to a valid OF
    node
(2) a cpu logical id does not exist for a given OF cpu_node

(1) is a firmware bug and should be reported as such but does not grant
a WARN_ON() backtrace.

(2) is not necessarily an error condition (eg a kernel can be booted
with nr_cpus=X limiting the number of cores artificially) and therefore
there is no reason to clutter the kernel log with WARN_ON() output when
the condition is hit.

Rework the IRS affinity parsing code to remove undue WARN_ON()s thus
making it less noisy.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5-irs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index e8a576f66366..ce2732d649a3 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -626,12 +626,14 @@ static int __init gicv5_irs_of_init_affinity(struct device_node *node,
 		int cpu;
 
 		cpu_node = of_parse_phandle(node, "cpus", i);
-		if (WARN_ON(!cpu_node))
+		if (!cpu_node) {
+			pr_warn(FW_BUG "Erroneous CPU node phandle\n");
 			continue;
+		}
 
 		cpu = of_cpu_node_to_id(cpu_node);
 		of_node_put(cpu_node);
-		if (WARN_ON(cpu < 0))
+		if (cpu < 0)
 			continue;
 
 		if (iaffids[i] & ~iaffid_mask) {
-- 
2.48.0


