Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA23FD6ED22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 12:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g8otSm4/ibYT0f0tzR+onubLxWSv9si+Hghs54M8Hoc=; b=0VZwI6w7/pWlLhiYOIXQUmcJGm
	LOur5E+mkVHBrTexVfMJjnzC+55/duC6k2h8kwh+sWGkI6n9hPXjmAnJIHXfpj0NMD+fV8uN5aEEU
	oxIgvHb9sgL5XAnpBX7bIEHMZHBQJAADzRWKZP9dhf534MkNNaA9rYUqjcVSRrx6hIH30e9mTp/Gu
	Zb80Kdowdd7CUNfVsx4DRMgzr/0J59aNcsSdCh8PIazzYfV7cms9ZWO1R1GKE/wsckcll2M/7aC81
	bJq9Y5nxkgW6+pvoIOTNsDEHvfdW4zeWS0mHIDiOZNKeiVlySqpuUV5qM9tIvaqqdIP8VG7vvY1gQ
	OhjIhoRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE6co-000000001tG-45BU;
	Thu, 21 Nov 2024 12:49:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE6bs-000000001lr-1GWb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 12:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g8otSm4/ibYT0f0tzR+onubLxWSv9si+Hghs54M8Hoc=; b=osQmAzTpOMFzSgsDzrSOSpDJ/T
	PpFVdjZ/5VIfT004SAO50IJDJBDuJAdBZM/x4yK2TGJGytzfayz36wNM/9WSE2Wwmtqap+AK9qvBs
	ZSSFI4HMY3z6623FmLsWK6igqqvCygy/kUH5i6a99rw9UmQQjnErER36VCvt5IQq+4Fone8iTCD2J
	Xo9EwDYiW6szQtBP84oHKmifWKeusFKsHVXjbyaWEMJfMIKIPKxIH/YxYX9NxsmySdKy2ivfv1Iv5
	PvtyLiFzLeVJ2zm5jQ49laQLOTuEen6AJ57IOmSjQaApSoJ/VGV4FpZ1DI4QZ5aq+91zEZfT1ifHY
	lZg/uDPQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50356 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tE6bi-0007Cp-1J;
	Thu, 21 Nov 2024 12:48:26 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tE6bh-004CmX-QU; Thu, 21 Nov 2024 12:48:25 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] irqchip: fix mvebu-sei bug causing mvebu-icu SEI probe
 failure
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tE6bh-004CmX-QU@rmk-PC.armlinux.org.uk>
Date: Thu, 21 Nov 2024 12:48:25 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_044836_338288_ACDB4DB9 
X-CRM114-Status: GOOD (  14.07  )
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

Commit fbdf14e90ce4 ("irqchip/irq-mvebu-sei: Switch to MSI parent")
introduced in v6.11-rc1 broke Mavell Armada platforms (and possibly
others) by incorrectly switching irq-mvebu-sei to MSI parent.

In the above commit, msi_parent_ops is set for the sei->cp_domain,
but rather than adding a .select method to mvebu_sei_cp_domain_ops
(which is associated with sei->cp_domain), it was added to
mvebu_sei_domain_ops which is associated with sei->sei_domain,
which doesn't have any msi_parent_ops. This makes the call to
msi_lib_irq_domain_select() always fail.

This bug manifests itself with the following kernel messages on
Armada 8040 based systems:

platform f21e0000.interrupt-controller:interrupt-controller@50: deferred probe pending: (reason unknown)
platform f41e0000.interrupt-controller:interrupt-controller@50: deferred probe pending: (reason unknown)

Fixes: fbdf14e90ce4 ("irqchip/irq-mvebu-sei: Switch to MSI parent")
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/irqchip/irq-mvebu-sei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mvebu-sei.c b/drivers/irqchip/irq-mvebu-sei.c
index f8c70f2d100a..065166ab5dbc 100644
--- a/drivers/irqchip/irq-mvebu-sei.c
+++ b/drivers/irqchip/irq-mvebu-sei.c
@@ -192,7 +192,6 @@ static void mvebu_sei_domain_free(struct irq_domain *domain, unsigned int virq,
 }
 
 static const struct irq_domain_ops mvebu_sei_domain_ops = {
-	.select	= msi_lib_irq_domain_select,
 	.alloc	= mvebu_sei_domain_alloc,
 	.free	= mvebu_sei_domain_free,
 };
@@ -306,6 +305,7 @@ static void mvebu_sei_cp_domain_free(struct irq_domain *domain,
 }
 
 static const struct irq_domain_ops mvebu_sei_cp_domain_ops = {
+	.select	= msi_lib_irq_domain_select,
 	.alloc	= mvebu_sei_cp_domain_alloc,
 	.free	= mvebu_sei_cp_domain_free,
 };
-- 
2.30.2


