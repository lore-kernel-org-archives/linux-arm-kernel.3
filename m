Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E6BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRzz+pupijCoxwPS3tjctLGAyiGQ3+y7TfBCve02H4A=; b=1mRFjtllCQaKH1TUsLyMKrAkdb
	2xnBOles6wmkULhRmh/ESYnp4OukignX16vNEFUqLUH6buJsU4BtorbwASm0c9cAcD7W6g3OIiJFz
	5e8qJ+aieXY5oKDrNt245yKTKd0Oyvb+6ya1zV37WxD3JW6Axgo8NKvIJFHM/0nWBYL1dVtgacuyx
	NdQgksjYyRe9Jra48n5IvILj/kgt45vPWkL16YZhlYsR42hWL9EMszRRBVbaUybYq6fbUa7U5nC97
	dMd+nJ58hCUMGWJ8LbN75xUxknmZza3QaAcSvkUqpvQdT2hvvmgQ+JkTNvahRZTfb6GsE+VHWcY/8
	mzZ+k2VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgnf-00000005dph-0P9t;
	Fri, 20 Dec 2024 17:28:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgYB-00000005aXq-3aJC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 17:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 67B195C66F9;
	Fri, 20 Dec 2024 17:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EF8C4CED7;
	Fri, 20 Dec 2024 17:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714751;
	bh=Hr6wY7LcQgUfmH4pZkgaIR23DOZETa9i6S18XAoWKjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VoYQOHS90F+9cUrFFJi74XINazwYgK/1PI6kYlS5mdsmSa7JG6Co+g61ItsFWI219
	 EVA9PwfII7IJlxmSB7cKzpc/Mlvw+7ixR70o1zVcAjVjj4T/mfnKVJhVyz/rtGG34i
	 Fyl8LHP8xGsHecQYa+VQzV3mBtQ90USJSJp5tWp0bnvU4wd51aPoxs7DeLdXThc/xV
	 rRWUExMe2wZ7DoFNeJzDQsrJS7wUsCOLdxVHovK95BP65Iea1YQ0KOV8LywefoGBhB
	 +n5e75gcj/Fq6LpRq5xrr8o5LCfhVYZz7FLrgqshwA+BR3LnVHUuoZIAlsPOZJtOGG
	 B3P5nZMHR7w1g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 26/29] irqchip/gic: Correct declaration of *percpu_base pointer in union gic_base
Date: Fri, 20 Dec 2024 12:11:27 -0500
Message-Id: <20241220171130.511389-26-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220171130.511389-1-sashal@kernel.org>
References: <20241220171130.511389-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091231_935873_735084BA 
X-CRM114-Status: GOOD (  11.36  )
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
index 3be7bd8cd8cd..32abc2916b40 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -64,7 +64,7 @@ static void gic_check_cpu_features(void)
 
 union gic_base {
 	void __iomem *common_base;
-	void __percpu * __iomem *percpu_base;
+	void __iomem * __percpu *percpu_base;
 };
 
 struct gic_chip_data {
-- 
2.39.5


