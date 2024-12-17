Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8D2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 11:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kYl6d4MRUfxUVOQcwFQKyfwAL51QVlz+/qWhrJ2KL7Y=; b=CVfZzzsH+nhn0YKvq/6OeZHPkg
	cDVXTB0jKrTwHBFIJu2KNktoUuLT+WTLblxo6+7FBldNWxeSDYzwUvZ3WcPovsxW1pf0lSdkMRVHT
	xx/hfsZeHpXzcttFp1f9PVatyn4kvS7qEkhvU9HvBPI2HGx/Jpq1M/wkXB1KeysIRQ/q3mwsXTZUs
	omSBJb4PJ5YVXLf5CuQuA/LbZWCzZkugoIIk4LSR4698CzE89V25zUVW/BSAYRmI4jgvS+K81mB/x
	Dt2T1V+XsigrQ6/1X3Q3PIVmhtVL8IlL84DYR9bVFCZcvJ7awMmr++EBQxlve/S0al7OFQkJYXqVe
	bIYvtDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVa3-0000000DEPm-1Q4D;
	Tue, 17 Dec 2024 11:17:35 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVYy-0000000DEIM-1g65
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 11:16:29 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso9637215a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 03:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734434185; x=1735038985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYl6d4MRUfxUVOQcwFQKyfwAL51QVlz+/qWhrJ2KL7Y=;
        b=YrOViKxRngCQaNSUSsvmVFz6oudLeqm8u8T3b7J3MaZ97rn6xcSvCsnltMnpOdwOX6
         tk6G7pbZPCXCX6tJd8qdi0ubDSXzJflxf1eKmTg9fhepen75nL+14bq+AeVNTkpHVxub
         PxVihJhWEgPh2i46Q2VJe1otQJbvIweHPmbBZ2wbsL7CuoBFyG3UDQoDdnWonHO9rT3V
         UXcJ1+q5KpZzbmalKRKCQOQOHy1ZNjjo5sHJ2OG9v8uqs+37ostkvtVhMt2ot+nJCmqI
         /ofDOn9pLZdwZMAEBfmnFS3PdcgIEHidP60mjfbz7fkluIpm3hWleKlNI2FSMQv7JEWL
         t/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734434185; x=1735038985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYl6d4MRUfxUVOQcwFQKyfwAL51QVlz+/qWhrJ2KL7Y=;
        b=L2qrEz6tAVyoP7O4Q7i97AZ0op3k1jlrUe7yH11kHaHZ9cA46SYlqTnC9kWH/tLQmX
         /8l1uaEKX1g6C5KZArjy+tRQPfO5x+OuK5lqI10mutOW5a3ehVWxa/pN1ntS2eHt1/9t
         +ibea0glhPGSP3IyOzIy3Gri1bBHU5x0LN9RldwB34mft1RWv8Xl8khpWkP9CCRhUKGg
         1sMgdLoR3Bh8HkoU1CIw90thh0KGzLsJoPmzYgaC2K+YulRym65HvT3wdQXtsf3Hv62O
         mjncFxqhBJbhg7aPcE3pFwBhKIiUEpcYOylgIMdkA48IrF1Yo5a8z0nRJHQSDYSteyw7
         VWYw==
X-Gm-Message-State: AOJu0YzKiQWVLJmCcnpvfBu/MTzj/HLPeHnS/b8XolSr+H+qXcJf24Vy
	nPFzSRZMrVUununIKTogXihO3mGZgs5SeNXnc61KvRskR+JFocGH
X-Gm-Gg: ASbGnctjBXk2pnrjlJGx1tNuqhrO/X5wzeDWxANDL//V5rWvtYpCiUkSm7s1oSukYwe
	YC797FitvvJevjuKKsCs+vHIxZKOa/0bQdL3TJWXQ42Ua3JHYFldXcPYS6wzIX6nzQFXjubq5hZ
	vevzE9Cx0QcbF242I+AzriM6ALywJNE2aITGcDbwpDduJhIqAtvDYtE5tfZfjfGnPMXKJvY2tVI
	tMnLhwmq+BDSLt1LKofAnqmRHJHBCHA7hxtHGZS8lxHnBv20J7GiFysE+Q=
X-Google-Smtp-Source: AGHT+IEnUOOKmqV/hBOpPlL7EMRXiX0BUILZ5Q5ZcQGOCv02YiP8sCT+WVCQIgWo1uXP2e+0+V4d1g==
X-Received: by 2002:a05:6402:5207:b0:5d0:b61a:89c9 with SMTP id 4fb4d7f45d1cf-5d7d55741eemr2727283a12.5.1734434184854;
        Tue, 17 Dec 2024 03:16:24 -0800 (PST)
Received: from eichest-laptop.. ([77.109.188.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652f25adasm4335171a12.54.2024.12.17.03.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:16:24 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	tglx@linutronix.de,
	shivamurthy.shastri@linutronix.de,
	anna-maria@linutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] irqchip/irq-mvebu-icu: Fix irq_set_type for sei and nsr
Date: Tue, 17 Dec 2024 12:15:40 +0100
Message-ID: <20241217111623.92625-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_031628_438828_4A19D3FE 
X-CRM114-Status: GOOD (  12.87  )
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

A regression was introduced in commit d929e4db22b6
("irqchip/irq-mvebu-icu: Prepare for real per device MSI") that causes
the Armada thermal driver to fail during probe with the following error:
genirq: Setting trigger mode 4 for irq 85 failed (irq_chip_set_type_parent+0x0/0x34)
armada_thermal f2400000.system-controller:thermal-sensor@70: Cannot request threaded IRQ 85
armada_thermal f2400000.system-controller:thermal-sensor@70: probe with driver armada_thermal failed with error -22

The issue occurs because irq_set_type is assigned to
irq_chip_set_type_parent, but the parent IRQ chip does not implement the
irq_set_type operation. This causes the trigger mode configuration to
fail.

This patch resolves the issue by removing the irq_set_type assignment.
With no irq_set_type, __irq_set_trigger safely skips the trigger
configuration, restoring functionality to the thermal driver.

Fixes: d929e4db22b6 ("irqchip/irq-mvebu-icu: Prepare for real per device MSI")
Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
---
 drivers/irqchip/irq-mvebu-icu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/irqchip/irq-mvebu-icu.c b/drivers/irqchip/irq-mvebu-icu.c
index b337f6c05f18..1d4dde719db6 100644
--- a/drivers/irqchip/irq-mvebu-icu.c
+++ b/drivers/irqchip/irq-mvebu-icu.c
@@ -188,7 +188,6 @@ static const struct msi_domain_template mvebu_icu_nsr_msi_template = {
 		.irq_mask		= irq_chip_mask_parent,
 		.irq_unmask		= irq_chip_unmask_parent,
 		.irq_eoi		= irq_chip_eoi_parent,
-		.irq_set_type		= irq_chip_set_type_parent,
 		.irq_write_msi_msg	= mvebu_icu_write_msi_msg,
 		.flags			= IRQCHIP_SUPPORTS_LEVEL_MSI,
 	},
@@ -212,7 +211,6 @@ static const struct msi_domain_template mvebu_icu_sei_msi_template = {
 		.irq_mask		= irq_chip_mask_parent,
 		.irq_unmask		= irq_chip_unmask_parent,
 		.irq_ack		= irq_chip_ack_parent,
-		.irq_set_type		= irq_chip_set_type_parent,
 		.irq_write_msi_msg	= mvebu_icu_write_msi_msg,
 		.flags			= IRQCHIP_SUPPORTS_LEVEL_MSI,
 	},
-- 
2.45.2


