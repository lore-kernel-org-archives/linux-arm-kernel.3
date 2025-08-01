Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3351BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKum8ycwQqrog2C6KgzQ08FYyfuTrGxjL4tRtf88CeI=; b=quJgaa+LI/7wjlSjl/cG1+lUc5
	aef2wEmc9Et6d2+Ux33AT31TlcitR2LN0pTYwQSK6pmOe/p/4xeGMDtYSn/uXhn2ohQfDMLlraKSX
	f5hRQZe0b6wGGMjCnneiZ1MmDA3o/phS0Cd06E6bcE/+q9n84LpMxLiY5mMKIBeWUlEmUl7y+bB3l
	SN4pZsuszriIDaS5bTNLdVjhqQ7wjPpSoF/r72pzMT63fmu6JG+iw6ER1JJzGZaz3NDQMRk8vxjhb
	z40yqDGYAEhmcfTx59zoXKBMoov03WJ3y1iNRslafswE2SD8hY4LJkWqpG9RSmDEOKz5mDyzvwZxf
	lTNjZ66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkkE-00000005Crm-1etF;
	Fri, 01 Aug 2025 08:04:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkf6-00000005BoU-0bcG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 07:58:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EB8344A2C;
	Fri,  1 Aug 2025 07:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F932C4CEF4;
	Fri,  1 Aug 2025 07:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754035123;
	bh=wj4wIimu8my3nvS/NdBRWWVLNhEdyKlGDNwK361o5cI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rESSvXDGfupNL+DW0eP5kfOtG5I5dvZBKkkS0ZxgE8E2z9NjLzetZJAid455k/4m+
	 wa8lenlMc85aRH662p2KgkrBZimlXuyXwiJYm5fz1uQBWMbDXqjqC98gNFrl/ElXrf
	 3f2JuM3YguBiNBMt4KzzNDcnkMmzSNhIeMHdbaC1lnFGxBTSLcEFYLT2E3EUaPjvMR
	 8QI/l/ARbYBbJ072Z3iLdhA9T375krp24E2DjjZOJKcUi+4tY/OP+D7Q0l2FhCWn+F
	 yyVjmW5lq/DOITE57M5HiD7DIfmvhe8yKbJuXCJLAPOSY/t7I8Ve2zG4vUxELIge/P
	 AiyWDVZwJouCQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Fri, 01 Aug 2025 09:58:18 +0200
Subject: [PATCH 1/3] irqchip/gic-v5: iwb: Fix iounmap probe failure path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-gic-v5-fixes-6-17-v1-1-4fcedaccf9e6@kernel.org>
References: <20250801-gic-v5-fixes-6-17-v1-0-4fcedaccf9e6@kernel.org>
In-Reply-To: <20250801-gic-v5-fixes-6-17-v1-0-4fcedaccf9e6@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15-dev-6f78e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_005844_212214_FC39202D 
X-CRM114-Status: GOOD (  14.39  )
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

Kbot reported that on the failure path the driver
iounmap() IWB resources that are managed through
devm_ioremap(), which is clearly wrong because
the driver would end up unmapping the MMIO
resource twice on probing failure.

Fix this by removing the error path altogether
and by letting devres manage the iounmapping
on clean-up.

Fixes: 695949d8b16f ("irqchip/gic-v5: Add GICv5 IWB support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508010038.N3r4ZmII-lkp@intel.com
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5-iwb.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-iwb.c b/drivers/irqchip/irq-gic-v5-iwb.c
index ed72fbdd4900..ad9fdc14d1c6 100644
--- a/drivers/irqchip/irq-gic-v5-iwb.c
+++ b/drivers/irqchip/irq-gic-v5-iwb.c
@@ -241,7 +241,6 @@ static int gicv5_iwb_device_probe(struct platform_device *pdev)
 	struct gicv5_iwb_chip_data *iwb_node;
 	void __iomem *iwb_base;
 	struct resource *res;
-	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
@@ -254,16 +253,10 @@ static int gicv5_iwb_device_probe(struct platform_device *pdev)
 	}
 
 	iwb_node = gicv5_iwb_init_bases(iwb_base, pdev);
-	if (IS_ERR(iwb_node)) {
-		ret = PTR_ERR(iwb_node);
-		goto out_unmap;
-	}
+	if (IS_ERR(iwb_node))
+		return PTR_ERR(iwb_node);
 
 	return 0;
-
-out_unmap:
-	iounmap(iwb_base);
-	return ret;
 }
 
 static const struct of_device_id gicv5_iwb_of_match[] = {

-- 
2.48.0


