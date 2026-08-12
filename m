Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5B1C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/TsK+xeK6ioGMG5DntKuzt5bbxbLZEpNMAwwlq704iY=; b=hLRjMU+Pv05Fws
	i5nZxR0tPrfBOsNIlKbP55/d//WMe9Nlsgp7tRoG0VnpeJbjODRQ1i6d82+yrYkxR+Io9b3KI5kgM
	CjBzJN2rirDCUkot+1xIRUNBNJkU+t36RTL2tOpa3yfmBN1KKq1Oq+eVu1cQatWzzxRMTavjzYBmb
	RQoJAYskP8D5VrzK76UbS3PDanMuZJnMpf7OJRS4VIvGHqissj7tgl/nzy+RkFYh3Ua0Iql/isVSf
	xpXuFFLOWNhfaELkiQj5VoB2sRKnl4IJ99mZrpCanVFHKzQwm/hdnWxbbgM7QLz47OClSuoZfSWlJ
	J7YZtMw8jBL5BxPf7Abg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zD-0000000FhRt-3ek4;
	Wed, 12 Aug 2026 09:11:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zB-0000000FhRf-0O6o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:10:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 866B9416A4;
	Wed, 12 Aug 2026 09:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB2B1F000E9;
	Wed, 12 Aug 2026 09:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786525856;
	bh=/TsK+xeK6ioGMG5DntKuzt5bbxbLZEpNMAwwlq704iY=;
	h=From:Subject:Date:To:Cc;
	b=Uqh+l6HY/9cdO79SB2f3NJs8fEzBa54I/tWknUo1VMdTWOkbXcQcwjqMR0/dmA5vS
	 UXnIIC0vxHz34p7Q6w4NlFqjD0wCSWdjjtbtGSQPYZoyb4aytxj4BbIHIzF+f+YG0X
	 wFhwYC6p/giq+bYQlIpdfG6ycNcaVUe2opNKyYDpbrt2rQTEyByl2NNj1pjgG16qoO
	 zcs8i8M2ahWaqYfeRIRIp0XwCSiasmcFj9zWdmloRLQGP1nzFS0CzGeuDAmsswhkM8
	 0x5ZS4y6yIM3Evm8Bxll+AFIkq9wE0T1OwwSK+B3ATgrurCYgwirdNVrdvvrM7CVxZ
	 rFpxAi4itgSyA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH 0/7] irqchip/gic-v5: Misc fixes following sashiko's report
Date: Wed, 12 Aug 2026 11:10:28 +0200
Message-Id: <20260812-gicv5-7-2-fixes-v1-0-3743e82c69a4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWO2w6CMAyGX4Xs2hI25BhjfA/DxRgFZzLQFYgJ4
 d0toFfN1/6HLoLQWyRRBovwOFuyQ88gT4EwD913CLZhFipSaZRLCZ01cwIZKGjtBwmwyHLVYp3
 mTSLY9fK4H9h0rw6mqX6iGbeYn8Lje+Kq8ZAJh0R6ryqDy79JJiqNo7A48yIGCaSJPwpry2No2
 5v2LjSDu26RtSYEBmfHMpizUIE3majW9Qstet3f4AAAAA==
X-Change-ID: 20260811-gicv5-7-2-fixes-e9782feb68d5
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

While reviewing this series [1] sashiko spotted some issues [2] in the GICv5
host driver.

This short series addresses them along with other minor issues spotted
in the resulting code review following sashiko's report.

Issues short description:

* Check get_logical_index() return value in MADT IAFFID parsing that might cause
  out-of-bounds per CPU array indexing
* Add a check for !NULL LPI domain on LPI domain teardown
* Disable enabled IRSes on GICv5 driver probe failure
* Fix gicv5_init_common() error paths handling (clean-up paths were
  missing some runtime error conditions and clean-up)
* Release IRS iomem regions on OF probe and driver failures
* Fix smp_processor_id() usage on two preemptible code paths:
  - LPI/SPI IAFFID initialization
  - Dynamic L2 IST table entry initialization

This series depends (as in, applies cleanly on top) on [3] as reported with
the message-id tag.

[1] https://lore.kernel.org/kvm/20260810102652.758719-1-sascha.bischoff@arm.com
[2] https://sashiko.dev/#/message/20260810104747.E5CE71F000E9%40smtp.kernel.org
[3] https://lore.kernel.org/lkml/20260811152630.942023-1-sascha.bischoff@arm.com/

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
Lorenzo Pieralisi (7):
      irqchip/gic-v5: Check get_logical_index() return value in MADT IAFFID parsing
      irqchip/gic-v5: Check for NULL LPI domain on domain teardown
      irqchip/gic-v5: Disable IRSes on probe failures
      irqchip/gic-v5: Fix gicv5_init_common() error paths
      irqchip/gic-v5: Release IRS iomem region on driver init failure
      irqchip/gic-v5: Use logical cpu 0 irs_data for dynamic IST allocation
      irqchip/gic-v5: Defer default SPI and LPI IAFFID programming

 drivers/irqchip/irq-gic-v5-irs.c   | 23 ++++++++++++++++++++++-
 drivers/irqchip/irq-gic-v5.c       | 28 +++++++++++-----------------
 include/linux/irqchip/arm-gic-v5.h |  2 ++
 3 files changed, 35 insertions(+), 18 deletions(-)
---
base-commit: 2ee859ebf156157609f71060ae472711c8cbc326
change-id: 20260811-gicv5-7-2-fixes-e9782feb68d5
prerequisite-message-id: <20260811152630.942023-1-sascha.bischoff@arm.com>
prerequisite-patch-id: 1e1b67496c67341e25a692236dfeff9526cddb97
prerequisite-patch-id: e5229c5d6aaef58620ff58b48c1c8122cf93ca9c

Best regards,
--  
Lorenzo Pieralisi <lpieralisi@kernel.org>


