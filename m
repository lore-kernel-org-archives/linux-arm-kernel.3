Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D476E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 14:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FdcgsJBYC7pg1N5nViFzGzJuy/jE/45OWPQ1Qf0mnjk=; b=WWGmYDl3xU37+j5Zr337uyy7r6
	4shhfsRjqxyTWEZKeG9t4Qr4ol3coilAsRNol9Ohs5QGpIFM5Gq8e/P2Q+A+XXzojyQ0+QN4ojxnA
	3KqRzhj4yZUl3pDFL5Aa1dZcaAQiSq/RzKOUgIA2dD3F8xE3aQrmCu1d+H1x0R6Sqj44IrmCgEwdJ
	G0Rjbj4GjzCOMGFVGIrJFMke18pK/TSgfl4xSM+Sb3OS0qs9vyFQ+ntyj3mL++sHWr9NX0AXZpHEc
	cYvVs0ucAxHMQpd7r95cV1Z5IseyGTDsnOXJnLewfqEbRXlNSFXJJaEpvhtrFjI2ScLLIJKJqL8+I
	3zPjXmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6kc-000000046N2-3pcO;
	Fri, 13 Dec 2024 14:34:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6NS-00000003y0L-3Ds6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 14:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 68213A42B84;
	Fri, 13 Dec 2024 14:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9DE4C4CEDD;
	Fri, 13 Dec 2024 14:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734099044;
	bh=YvT3kQdh8SBRzE9lxGFmwR+bojOwb2BgMgjEDii8YTs=;
	h=From:To:Cc:Subject:Date:From;
	b=XNBEPMTcIvYXX6WOKgjtrngudlh9kPXr8+/IZii0IZOccudBS4W1S2WY73BNvGmTR
	 DgRSEYvSYxyuvKHuUDisdgtminYOvsvUGmz6BwlHA8zFT32CDLOI63UjRCrvGhx77E
	 VQjpv+YrhZ0EF1RuzE1kY1i9mJlnCeet1WZ1y6GG22fk63hdxJ717JSfFY9674ywFz
	 I84WYk/f14hH3UnkN8GeN0YSaE+r0TiKxMAEAE3On4xcfQwUrRdM3cTa/uTF0gocpq
	 G0zJVa4f72MTZhh1l2CxJNiartGYGDHPwnq4Eor67lLzFSepM+2MynJU90nUgpa+UN
	 e2OgOsvfGtXJQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tM6NO-003SPI-Hm;
	Fri, 13 Dec 2024 14:10:42 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mark Kettenis <mark.kettenis@xs4all.nl>,
	Chen-Yu Tsai <wenst@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH] irqchip/gic-v3: Work around insecure GIC integrations
Date: Fri, 13 Dec 2024 14:10:37 +0000
Message-Id: <20241213141037.3995049-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, tglx@linutronix.de, mark.kettenis@xs4all.nl, wenst@chromium.org, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_061046_937734_D1441501 
X-CRM114-Status: GOOD (  14.86  )
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

It appears that the relatively popular RK3399 SoC has been put together
using a large amount of illicit substances, as experiments reveal
that its integration of GIC500 exposes the *secure* programming
interface to non-secure.

This has some pretty bad effects on the way priorities are handled,
and results in a dead machine if booting with pseudo-NMI enabled
(irqchip.gicv3_pseudo_nmi=1) if the kernel contains 18fdb6348c480
("arm64: irqchip/gic-v3: Select priorities at boot time"), which
relies on the priorities being programmed using the NS view.

Let's restore some sanity by going one step further and disable
security altogether in this case. This is not any worse, and
puts us in a mode where priorities actually make some sense.

Huge thanks to Mark Kettenis who initially identified this issue
on OpenBSD, and to Chen-Yu Tsai who reported the problem in
Linux.

Fixes: 18fdb6348c480 ("arm64: irqchip/gic-v3: Select priorities at boot time")
Reported-by: Mark Kettenis <mark.kettenis@xs4all.nl>
Reported-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v3.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 34db379d066a5..79d8cc80693c3 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -161,7 +161,22 @@ static bool cpus_have_group0 __ro_after_init;
 
 static void __init gic_prio_init(void)
 {
-	cpus_have_security_disabled = gic_dist_security_disabled();
+	bool ds;
+
+	ds = gic_dist_security_disabled();
+	if (!ds) {
+		u32 val;
+
+		val = readl_relaxed(gic_data.dist_base + GICD_CTLR);
+		val |= GICD_CTLR_DS;
+		writel_relaxed(val, gic_data.dist_base + GICD_CTLR);
+
+		ds = gic_dist_security_disabled();
+		if (ds)
+			pr_warn("Broken GIC integration, security disabled");
+	}
+
+	cpus_have_security_disabled = ds;
 	cpus_have_group0 = gic_has_group0();
 
 	/*
-- 
2.39.2


