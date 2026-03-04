Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40D1EF9001
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 16:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vjmorkD5nfxo0LNSkFKK7xRS63WFO2zqGH+7vNYNR6M=; b=qAK7miXjVL5d+t5bbtiv+dkW8/
	H0m0yQSSGvzBgLQA8rgdk8Gn4fYXttsz1pmISj5Qowt3/XD6mWZ79H4AcRN43PON+WyKvGlSQ40X0
	qUyAwgDx3MVpxPxJ3DoiZ0nstyCtiDTKecgt3bFkOXjjOHTGxGHkVT7Nlnu3vkGtIlQ8ZIbMXgTh+
	Gnozm4e2o6Mf0b136MnkQFHTjoWE8ZFcBKiGK+w3nltb7vgH9AgKYVjvm2eKr7huCwiU8wBflXAnx
	yU/nHp/uDWTqQtaP97bafDSKW1q7+KLBcx3j2bc1qL76FY28jjI236jdhkQ5fT4DbW20U6RSZvdK4
	SVRia3Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxp88-0000000056L-0N9G;
	Wed, 04 Mar 2026 16:31:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxp86-0000000055u-0MBF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 16:31:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A01443FA6;
	Wed,  4 Mar 2026 16:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A16DC4CEF7;
	Wed,  4 Mar 2026 16:31:19 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] irqchip/gic-v3: Print a warning for out-of-range interrupt numbers
Date: Wed,  4 Mar 2026 17:31:14 +0100
Message-ID: <62b849967d71d73e028fb65efee717986ef847e6.1772641758.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_083122_140022_4C0AA2E0 
X-CRM114-Status: GOOD (  11.09  )
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

gic_irq_domain_translate() does not check if an interrupt number lies
within the valid range of the specified interrupt type.  Add these
checks, and print a warning if the interrupt number is out of range.

This can help flagging incorrectly described Extended SPI and PPI
interrupts in DT.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This would have prevented the issue fixed by "[PATCH] arm64: dts:
renesas: r8a78000: Fix out-of-range SPI interrupt numbers"[1].

[1] https://lore.kernel.org/1f9dd274720ea1b66617a5dd84f76c3efc829dc8.1772641415.git.geert+renesas@glider.be
---
 drivers/irqchip/irq-gic-v3.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 20f13b686ab22faf..d75163e71bf22473 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1603,15 +1603,27 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 
 		switch (fwspec->param[0]) {
 		case 0:			/* SPI */
+			if (fwspec->param[1] > 987)
+				pr_warn_once("SPI %u out of range (use ESPI?)\n",
+					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + 32;
 			break;
 		case 1:			/* PPI */
+			if (fwspec->param[1] > 16)
+				pr_warn_once("PPI %u out of range (use EPPI?)\n",
+					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + 16;
 			break;
 		case 2:			/* ESPI */
+			if (fwspec->param[1] > 1023)
+				pr_warn_once("ESPI %u out of range\n",
+					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + ESPI_BASE_INTID;
 			break;
 		case 3:			/* EPPI */
+			if (fwspec->param[1] > 63)
+				pr_warn_once("EPPI %u out of range\n",
+					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + EPPI_BASE_INTID;
 			break;
 		case GIC_IRQ_TYPE_LPI:	/* LPI */
-- 
2.43.0


