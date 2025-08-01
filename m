Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6F6C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKEd7+rhHseXHJXxFjjGgezlJeuO6+gcRTrKgKZCO4c=; b=yI14Kw4JOkKvl5ob9PkuEcyIkL
	z5OeIXdqvANcua51zKS/Z0tO8bqxjf8TKNiCMQjjZJKKjVrYsZ3IWzH4opPPxxH7yBOUERsI5WHkM
	E0wWr+sDIR+wIIKu2I6KO7h8LxWkuGrksnXrcob3LNKGGgKunUl0Bt7b9tdEn+EDOt+9diXJ0m9u9
	6n8a01KUnaLpWSdv31D+UJeDj+i+6XeoQghYa3hw8eM3WuuFd2MmhQtYZ9IyvNGtDVMOYO6eFN0t8
	Q44tpUQuwoatH8Kqoeem8xn4HIndzZpCz6PvDwKxlxfjdPJyf/d5DbUZh+trImhSpjzGuuRqa67U5
	YY974vnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkmm-00000005D8k-0wMy;
	Fri, 01 Aug 2025 08:06:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkf8-00000005Bpo-25uV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 07:58:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD8326113A;
	Fri,  1 Aug 2025 07:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFF0C4CEF4;
	Fri,  1 Aug 2025 07:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754035125;
	bh=rd8uhK267CHyby4vwT8kjROd6FNXsXkTCVPHV119wCM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DDtDou3GSdHKVOn/Grs8mhyGSRXzuCP77/pv03mbdFjHBGVXFH3IE/JbZHboP+p3R
	 57tsHF+osST0uJyFMsx3seXYvGsMBpD5zCZalpsZF2roy81w83t7b1YoVqngUB5OvE
	 bjiVcrL2gFGS6KEKoGfvsPOqe/wwM9trV9GxofKJSvs5agCa789fyiMp6I6+/6RqkX
	 vEH+m12EAbFU8bZpJ6kx0Q6L8AceQnBLDo0X+5JcTcI8oTObMGamdoARmcZeM56Xdr
	 CyJp43/RG4tf5Z9ahaivXcXpA6wU6Pxvf3HrXHScHZvm7exJoXohLaSJDJNOl0U+Wx
	 OwfkAh1lB7g1g==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Fri, 01 Aug 2025 09:58:19 +0200
Subject: [PATCH 2/3] irqchip/gic-v5: iwb: Remove module boilerplate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-gic-v5-fixes-6-17-v1-2-4fcedaccf9e6@kernel.org>
References: <20250801-gic-v5-fixes-6-17-v1-0-4fcedaccf9e6@kernel.org>
In-Reply-To: <20250801-gic-v5-fixes-6-17-v1-0-4fcedaccf9e6@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
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

The IWB driver cannot be compiled as a module and is as matter of fact a
builtin driver at present.

Make it explicitly so by removing useless boilerplate and by using the
builtin_platform_driver() helper to initialize its registration
functions.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5-iwb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-iwb.c b/drivers/irqchip/irq-gic-v5-iwb.c
index ad9fdc14d1c6..c3a3b30e9f4e 100644
--- a/drivers/irqchip/irq-gic-v5-iwb.c
+++ b/drivers/irqchip/irq-gic-v5-iwb.c
@@ -263,7 +263,6 @@ static const struct of_device_id gicv5_iwb_of_match[] = {
 	{ .compatible = "arm,gic-v5-iwb" },
 	{ /* END */ }
 };
-MODULE_DEVICE_TABLE(of, gicv5_iwb_of_match);
 
 static struct platform_driver gicv5_iwb_platform_driver = {
 	.driver = {
@@ -274,4 +273,4 @@ static struct platform_driver gicv5_iwb_platform_driver = {
 	.probe				= gicv5_iwb_device_probe,
 };
 
-module_platform_driver(gicv5_iwb_platform_driver);
+builtin_platform_driver(gicv5_iwb_platform_driver);

-- 
2.48.0


