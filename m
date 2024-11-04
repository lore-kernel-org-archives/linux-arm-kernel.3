Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC771D1BDE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dQGlr7mkobe87VyrXWlgynyaPPaxBPzf+eEcX90w8sw=; b=N9jxno/hZH+umH8WgXKFaOgXBd
	W59JJnOrgsgnPF9AlW2Xsi2C2HkdKLu2SMgjTQoiksOZ/ne5SkvSASMgrE8yLhH7RO7+giA+3aPk6
	DqAs4F9aEHS2cxVYNMfbvgRgRQ/0bhaKn3YHlL75jT1gdmsy910jF6vO9M8MGrGZfqUpIlzL4psMX
	u/GPMb3dp+q/CG+DL+uc6zEe4LFEm8JfU1VXACvdkOCROclwkYP9B9FRGNspBJ4hjdkqjrkys9sEu
	hVWHyCVnru5ELScmk0r7XQus7y1IWFcEccluYa0v/NtraRd4LBc/V0+q/sMxGoIFKXZ+Lg9FPJbBn
	viFcdBkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82i4-0000000EtKa-2DLk;
	Mon, 04 Nov 2024 19:25:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82RQ-0000000ErJ0-2emb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 19:08:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 319895C5432;
	Mon,  4 Nov 2024 19:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C6DC4CECE;
	Mon,  4 Nov 2024 19:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730747323;
	bh=/6rcbMtM42HcnHtS60PzjqVFy7pKZof26/BWcubLefQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ZeeDAWOIFGxAbASpg1wkeN5leoCtZslN+XiOFlneYPTVx1GWTOaBjf+Y0jagph0iQ
	 zQuiTrnzQ9dhxhV4pZANcAPElQz/Qi4tBrVCfdkucKcubur2s+qSfm+KC1ecX/7eL9
	 Q181IrhJ8Jl3RMFan00mJ1Cbd3ib0eisD3/ObWn6y9yZ7clBTP7a7aPZ3+Njy3d7hJ
	 e0MrlXdNhhpjWBqCRebmIbm32WT4tl+JG9ArS4M9tYDmwZfutLUtxWCc+teOc5MKZN
	 cUGEGHcjODbVCHWUrTil6y0RMZHSwxynilpnfjUUZCAu36NK5JyEpwJqy+/veYTa2f
	 0NLw5MExvoWFw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] irqchip/stm32mp-exti: Use of_property_present() for non-boolean properties
Date: Mon,  4 Nov 2024 13:08:35 -0600
Message-ID: <20241104190836.278117-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_110844_774380_EF63CC42 
X-CRM114-Status: GOOD (  10.36  )
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

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/irqchip/irq-stm32mp-exti.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm32mp-exti.c
index 33e0cfdea654..cb83d6cc6113 100644
--- a/drivers/irqchip/irq-stm32mp-exti.c
+++ b/drivers/irqchip/irq-stm32mp-exti.c
@@ -696,8 +696,7 @@ static int stm32mp_exti_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (of_property_read_bool(np, "interrupts-extended"))
-		host_data->dt_has_irqs_desc = true;
+	host_data->dt_has_irqs_desc = of_property_present(np, "interrupts-extended");
 
 	return 0;
 }
-- 
2.45.2


