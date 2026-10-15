Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5075DCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0uwkz2ZRN4LBCNTRakCSfnPDDZuXpCCwbG+hEciceQ=; b=xKuPP8pZ5RZ0pHkq+yN4YvEytY
	rlJsAlBbBKtsRp3VWgk3XLojU4AgTNegry856jB8dCbLrwVMTnXunr8pxfZUzz5OnHmOSy+zH5FrT
	kluUeacQwlcd/oPL930TeoiZ2ViNitxQZZHXSpXMHo9CNxjgZAuF+FKm9inVtpLCFvsqJ3uyAKwd4
	XWNdTivnU72v4IiIi9CTd8zFdZFBR/8DkDcsRMx/ZoR/UZD/yj9sZNr9y81ZOSGfTuPvXf+ztKYdk
	pDiR6E+T/B/SGatKQ/j+g1LR3V3sVskSo7YEsBrrIH7KWDY3WFOIK7pWfxdxU/F5c8xtDUdukAlI3
	hsChFF8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGi2-0000000H8Ro-36ig;
	Thu, 15 Oct 2026 08:21:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGhv-0000000H8PZ-0Lvg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 08:20:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C3556022C;
	Thu, 15 Oct 2026 08:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE4A1F000C6;
	Thu, 15 Oct 2026 08:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052458;
	bh=P0uwkz2ZRN4LBCNTRakCSfnPDDZuXpCCwbG+hEciceQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NS0SiHgHpN2u2rk3uKUmA+FjafjLQyudTOfO64KSX5avtepK1MDYtY8PowYRfquWM
	 LS9ZuoT1IayNn+vd82P30F03LPX/7BsFVF4efM4oWAYWx78k64Vqph+z3sj8Ru5Stq
	 bnd9q89Kty9Ud6FPiXQD8gOwVI4m34AcdJ/bzBa4sqPwrh2W/jjhY7G8ixXhDfcD1/
	 QB0N86MdS3LOaR7kYmi9sISc8C3SeQS17/FXp49lTQviOpbhU7ItoSvoc9C7MW+JlH
	 LoqSTiRRNq9rVRAu67+I4cNZqW3eHNkK0HyQaG2bIAEcyKR7lPDqw+mV+alJfF1IFX
	 SG+d8AFlow/nQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 15 Oct 2026 10:20:26 +0200
Subject: [PATCH 2/2] irqchip/gic-v5: Fix standalone IRSes OF probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-gicv5-irs-no-cpus-v1-2-d4b337b7f000@kernel.org>
References: <20261015-gicv5-irs-no-cpus-v1-0-d4b337b7f000@kernel.org>
In-Reply-To: <20261015-gicv5-irs-no-cpus-v1-0-d4b337b7f000@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Rob Herring <robh@kernel.org>, Sascha Bischoff <sascha.bischoff@arm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.15.2
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

An IRS is architecturally allowed to be standalone, namely, with no
direct CPUs connections. Make sure such configuration is allowed on
OF firmware by skipping "cpus" and "arm,iaffids" IRS node properties
parsing if they are not present so that the IRS configuration can
complete successfully.

Fixes: 5cb1b6dab2de ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
Please do not consider this patch before we agree on what's best
for DT bindings in patch 1, thanks.
---
 drivers/irqchip/irq-gic-v5-irs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index b3feb6340b59..53639e6f85bd 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -609,6 +609,10 @@ static int __init gicv5_irs_of_init_affinity(struct device_node *node,
 	u16 iaffid_mask = GENMASK(iaffid_bits - 1, 0);
 	int ret, i, ncpus, niaffids;
 
+	/* An IRS is architecturally allowed to have no cpus associated with it */
+	if (!of_property_present(node, "cpus") && !of_property_present(node, "arm,iaffids"))
+		return 0;
+
 	ncpus = of_count_phandle_with_args(node, "cpus", NULL);
 	if (ncpus < 0)
 		return -EINVAL;

-- 
2.53.0


