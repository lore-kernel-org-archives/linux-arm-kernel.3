Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D622DCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0emz1M+LXQIDYTxQ4mq1Z+Zdgy6lpCnxvJqShvL+wko=; b=msNtvzRg/lomnz6dKC8/PQ7QKR
	d8kTwjl5aaPbGcnQ6eabodgog5GGE1qVgasbqGMS+CK/n702KCXHYpw6aK2WP1nIY6n0Y2o9mGYUQ
	ZHTX1IZGM+/8PuQzHL4FFAuCmEaSKEboUaAKSTQ/wkurlVzdYV7sL/uEXfgv7EEmeBvL3d/3g02A9
	sRgURV/yGQHwWrf5g72fkPd53R0SuAo8y0gh8WWs6gGUbiJ6cybzUcUziGWqLI0YA6VnhoiwCf6u5
	R1frDuzsM1Lv0FO80LowGv7zytvD1uphw9Azq4LWnZalYM2vCmAgJHHW7iMlN3ajz5DhcokITxhgj
	lcokwPIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy51Z-00000003J8d-33kU;
	Mon, 15 Sep 2025 08:57:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy51P-00000003IwK-1NbH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:57:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3A59447F3;
	Mon, 15 Sep 2025 08:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F308C4CEFC;
	Mon, 15 Sep 2025 08:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757926634;
	bh=4u1DgiC0kHhkv9VtJrOAXn89dh7UYCtkT3pFEWYEx0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h+2r6WO+SKBzliTvYSVlZgZ0OWsTN+miH21Dd7EWrVPNWoBydRGxWdC5Kvj73b72T
	 DvhuY3FKkPSwde1c+lKgRHcyDdgDZnQ+AJZAW9YIkbOQpBRpvr9HROeCFSHQvElV9K
	 nk30kpWEIbNTMldBbfI3bmDvWK2t0CSMx7hGGzr9OIuLdMqmwlb2kuKJRPI+Q+UEWo
	 J7tQB3vQmsyw3hDfKduAeI3f2+AW5P/htZKgHPxmkI0RciYV8HrD+NZ7sAfzI55Cl1
	 wRZKEH3vr9tWlx0E+Pftp83LDFxL3kFqK62n+fmo4nbg5L/DQDCFr6GoKDiRIVGz3r
	 BQrGERW9/WEdw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy51M-00000006IHP-2rPw;
	Mon, 15 Sep 2025 08:57:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>
Subject: [PATCH v2 06/25] irqchip/apple-aic: Add FW info retrieval support
Date: Mon, 15 Sep 2025 09:56:43 +0100
Message-Id: <20250915085702.519996-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915085702.519996-1-maz@kernel.org>
References: <20250915085702.519996-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_015715_407111_7DE9D413 
X-CRM114-Status: GOOD (  15.60  )
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

Plug the new .get_info() callback into the Apple AIC driver,
using some of the existing FIQ affinity handling infrastructure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-apple-aic.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index 032d66dceb8ec..cb8b6f40ce8d3 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -651,6 +651,33 @@ static int aic_irq_domain_map(struct irq_domain *id, unsigned int irq,
 	return 0;
 }
 
+static int aic_irq_get_fwspec_info(struct irq_fwspec *fwspec, struct irq_fwspec_info *info)
+{
+	const struct cpumask *mask;
+	u32 intid;
+
+	info->flags = 0;
+	info->affinity = NULL;
+
+	if (fwspec->param[0] != AIC_FIQ)
+		return 0;
+
+	if (fwspec->param_count == 3)
+		intid = fwspec->param[1];
+	else
+		intid = fwspec->param[2];
+
+	if (aic_irqc->fiq_aff[intid])
+		mask = &aic_irqc->fiq_aff[intid]->aff;
+	else
+		mask = cpu_possible_mask;
+
+	info->affinity = mask;
+	info->flags = IRQ_FWSPEC_INFO_AFFINITY_VALID;
+
+	return 0;
+}
+
 static int aic_irq_domain_translate(struct irq_domain *id,
 				    struct irq_fwspec *fwspec,
 				    unsigned long *hwirq,
@@ -753,6 +780,7 @@ static const struct irq_domain_ops aic_irq_domain_ops = {
 	.translate	= aic_irq_domain_translate,
 	.alloc		= aic_irq_domain_alloc,
 	.free		= aic_irq_domain_free,
+	.get_fwspec_info = aic_irq_get_fwspec_info,
 };
 
 /*
-- 
2.39.2


