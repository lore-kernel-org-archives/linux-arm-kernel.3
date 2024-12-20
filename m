Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC36E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+qDkMJQUAkOgwEAmDgixCtqUZlyETe3lCo2Us8qQjk=; b=gZckxNuqmQT3kndiI8by727Cxh
	FunVAe2NISdVFGlWFr9tmMJjxK8INw7jVKOBUIjAyT39ZHPZXC8IxCYy6sZmxc7frfOEX2kIjlk81
	VCvO0Lsq/Cu7AyQfkIpVCHgOZY4XCzAcm9O/ojWVNDI0FZrtZZS+Tauf+oQSgXl6OQFWzBaLZSvpD
	rR3V3UvKbkWJ/4nCBQ1k0QZ6k0okeuYhLlPWf8pgSjGC2mXNEyYbxiAiBefYE6JTo7nywe61XvKym
	Oi5ytpWRzUM8O6Pexb0nKQhp3XC85oawAxborUeeVgK7pwQaDvWSU3YUIvtv0cbYZezO9LaHoUq18
	35rvtB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgtH-00000005eeP-0lr1;
	Fri, 20 Dec 2024 17:34:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOga7-00000005b0T-09wu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 17:14:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 966055C4831;
	Fri, 20 Dec 2024 17:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B87EC4CEDC;
	Fri, 20 Dec 2024 17:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714870;
	bh=IoNioR4Ju/0+CVY6rT96SwXYV89BY8pzAPmMiokxOtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y/VewN0JkXHQB2lWgT1OvOauO8QCujkqqy9JMXBuwFYCMfNGx39mQQ2ihLaI7V3tS
	 CUHYXnpbEFeeZCJadD558VGEYQbnHmq8owJzq6etoJEOWDhx7l+jWiJ+YUtZeio7Pl
	 xUl/5+nEC8Lq6pala6eSm/y9I4ROrOuFfLH6dbSvZeWL6FOE0e2zbWi5lAvVXVzhrn
	 3j1IBuLd5LOGRYfiWcTE8kaeagTUO2WOvJ+f5F/VjqXxR+uMu7WnRIT+pAwMPfR1TP
	 t3d+SWGol172z3UGHDZEDVeVr61hmb2S8HRUHKOCOn7QAKS4zN4yfbPglUDmFTaual
	 kSPePFt5wiZNg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 5/6] irqchip/gic: Correct declaration of *percpu_base pointer in union gic_base
Date: Fri, 20 Dec 2024 12:14:19 -0500
Message-Id: <20241220171420.512513-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220171420.512513-1-sashal@kernel.org>
References: <20241220171420.512513-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.288
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091431_117157_9BB511E1 
X-CRM114-Status: GOOD (  11.45  )
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

From: Uros Bizjak <ubizjak@gmail.com>

[ Upstream commit a1855f1b7c33642c9f7a01991fb763342a312e9b ]

percpu_base is used in various percpu functions that expect variable in
__percpu address space. Correct the declaration of percpu_base to

void __iomem * __percpu *percpu_base;

to declare the variable as __percpu pointer.

The patch fixes several sparse warnings:

irq-gic.c:1172:44: warning: incorrect type in assignment (different address spaces)
irq-gic.c:1172:44:    expected void [noderef] __percpu *[noderef] __iomem *percpu_base
irq-gic.c:1172:44:    got void [noderef] __iomem *[noderef] __percpu *
...
irq-gic.c:1231:43: warning: incorrect type in argument 1 (different address spaces)
irq-gic.c:1231:43:    expected void [noderef] __percpu *__pdata
irq-gic.c:1231:43:    got void [noderef] __percpu *[noderef] __iomem *percpu_base

There were no changes in the resulting object files.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/all/20241213145809.2918-2-ubizjak@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/irqchip/irq-gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 882204d1ef4f..5937f3cd288b 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -62,7 +62,7 @@ static void gic_check_cpu_features(void)
 
 union gic_base {
 	void __iomem *common_base;
-	void __percpu * __iomem *percpu_base;
+	void __iomem * __percpu *percpu_base;
 };
 
 struct gic_chip_data {
-- 
2.39.5


