Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0107CC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYHsvdmwB6LBVn/lo/Dc78wau1kWBwcyiNhyqF3yfF0=; b=le7D8NLL8MXlCR6KfYjjZ5Iwat
	rEcCejVxchY/tlEGFDuG4AFrHPEo+9bH26w1mYiG4ojTFNaefUQz+EPKxMBhjSTN0na0GpPxWlCG+
	85SgBGT5DMYHE41Gv8rTqsffxjR08ItLw15qScSNtwV8YVf9ZjTMxhQzlCyp22mlh5cg+wSGBkipA
	bn5pTyBNpd1Fpay6iu8maEuN4FKuull+wqS4vyDZ7oxuYMHGO6EY5wUl2H2CwyBbbWmA3jRyvFa6u
	FUJmpyJOB0SeOjtWZWBwTw8CpldDZ4+lpkAiSMXHZnSOc7lrbxmaRzxxXE1jmWHLXSC3rAloIEA9d
	t5G8JIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zI-0000000FhTP-3OuW;
	Wed, 12 Aug 2026 09:11:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zG-0000000FhS6-1DAJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:11:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1070140959;
	Wed, 12 Aug 2026 09:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94181F00A3D;
	Wed, 12 Aug 2026 09:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786525861;
	bh=JYHsvdmwB6LBVn/lo/Dc78wau1kWBwcyiNhyqF3yfF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QV3hZCv9W9ozngTNEmqvCtO+vmwkc9M1p5x3jsbO8++rUEaOWrKrYpDc6jwH5xzwb
	 s60pzkr8yoyEZGZy7dfHfgg6/pQQIN4FabmMuwHiZClGCorjLAkIteItZm0kpUfwkO
	 OAO30S3xeMmZyAJ6QcMERVk648Wk/B/owUc6mh6jUSd4D9xUfu2dEdkqu6rULdLnW0
	 rNRCzHlmUnTfdnOt5Rx/VPhX1mvSFJsqwpGyJMkbLRM+mGjkDJ1arNDV4BCdaFu6/9
	 aqIQZzqhZqBQ1g7aE95Yg+o+whWEVkFWeQQySbU3hUuDugs6wm0Ot155SzmtxhgPb0
	 HJjILQdv/JRAw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 12 Aug 2026 11:10:30 +0200
Subject: [PATCH 2/7] irqchip/gic-v5: Check for NULL LPI domain on domain
 teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-gicv5-7-2-fixes-v1-2-3743e82c69a4@kernel.org>
References: <20260812-gicv5-7-2-fixes-v1-0-3743e82c69a4@kernel.org>
In-Reply-To: <20260812-gicv5-7-2-fixes-v1-0-3743e82c69a4@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>
Cc: Sascha Bischoff <Sascha.Bischoff@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
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

In gicv5_free_lpi_domain() the LPI domain being freed can be NULL.

Check it and return before trying to free it if it is.

Fixes: 0f0101325876 ("irqchip/gic-v5: Add GICv5 LPI/IPI support")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Link: https://sashiko.dev/#/message/20260810104747.E5CE71F000E9%40smtp.kernel.org
---
 drivers/irqchip/irq-gic-v5.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 6a99c541b559..a7fae93e993e 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -862,6 +862,9 @@ void __init gicv5_init_lpi_domain(void)
 
 void __init gicv5_free_lpi_domain(void)
 {
+	if (!gicv5_global_data.lpi_domain)
+		return;
+
 	irq_domain_remove(gicv5_global_data.lpi_domain);
 	gicv5_global_data.lpi_domain = NULL;
 }

-- 
2.53.0


