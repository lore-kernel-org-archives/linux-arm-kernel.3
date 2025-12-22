Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C57D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 10:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=np5Y0RsKnKJHPONGc/PMQaI9HGcX9BuoD4x/3RMmsIo=; b=xo/eS7peDUUgpI1+SAzMmuR33e
	SkrQjnV7/i7E9dtWuV5Z+A0XmJDF5jqu+iVb3TadXERQOapSJk1qmpe4M3IHoYJft0UKLsPOoKZX7
	W4M16zcoJrL7O8YPw15Nix3EKq292Aj4eQvfZ9B6OeevCmg5tPMJnfo9TSmn4jiD9apwbJRF5ihd6
	PVVIy44AcvLvgVmGWLKz+DSWVb+wtroWSoTtWGFeCk3hbsnu/odS4V8Tv0EaVkXZvxBzuiBxva4Nu
	oLPXZ+V1+GQuCnkolNJetaKqJMVfxkXu5ukDwtW2zVjZiPUpJURYT4xah8dHqz+bPSe77HSksE6zB
	6B6uPi4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd48-0000000DcCX-1oCd;
	Mon, 22 Dec 2025 10:23:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd45-0000000DcB7-3LdV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 10:22:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E63241B5F;
	Mon, 22 Dec 2025 10:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F3EC4CEF1;
	Mon, 22 Dec 2025 10:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766398975;
	bh=g6Tv6mKdC5nWv8wdUe0747UdpKKRsQNA9lVz43WXBkw=;
	h=From:To:Cc:Subject:Date:From;
	b=QXaJ0Z625o9OjOpUSvAl1Ns/iYdaRQCtXY4eoq/ftwCE338Hqs2M1d3kIfLZa4TrS
	 qwzcOiyZQjeeMCZC4FJ7jIA7GA03KvzfwxbFdkXUrYljGS1XQmIUaYI5zIh9bqrphA
	 pNC923NmOq7JzsTvwKJAsUsLLH+pnADAwJeYdWbfCfz1oRyV82sC5j1CtRX43BHrum
	 lN/yEYjwqvBwKe88ZPyzq0/1lOmQ4HzLKElHw5Jhph5fDCzblUaCi5TZRKyl51/xUx
	 Gw64POnFN3sE25zcpRP7GY6Ey4N3976EsQSWbuhZvBSYs8gEiXopMgxCyfVFpO81cV
	 1ZW49F3xt9+vg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel test robot <lkp@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] irqchip/gic-v5: Fix gicv5_its_map_event() ITTE read endianness
Date: Mon, 22 Dec 2025 11:22:50 +0100
Message-ID: <20251222102250.435460-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_022257_853196_12F29634 
X-CRM114-Status: GOOD (  11.44  )
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

Kbuild bot (through sparse) reported that the ITTE read to carry out
a valid check in gicv5_its_map_event() lacks proper endianness handling.

Fix it.

Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512131849.30ZRTBeR-lkp@intel.com/
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 554485f0be1f..8e22134b9f48 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -849,7 +849,7 @@ static int gicv5_its_map_event(struct gicv5_its_dev *its_dev, u16 event_id, u32
 
 	itte = gicv5_its_device_get_itte_ref(its_dev, event_id);
 
-	if (FIELD_GET(GICV5_ITTL2E_VALID, *itte))
+	if (FIELD_GET(GICV5_ITTL2E_VALID, le64_to_cpu(*itte)))
 		return -EEXIST;
 
 	itt_entry = FIELD_PREP(GICV5_ITTL2E_LPI_ID, lpi) |
-- 
2.50.1


