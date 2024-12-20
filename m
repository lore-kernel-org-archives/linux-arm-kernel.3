Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717E8E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaAAa0iWAd2H1I+Q79o95XnQNDtX6SDhYh8+V7mMYjk=; b=aQjIDbkmDAR0zyWf8K1kPdUtLQ
	awimW0zhl24TDQS683M8+q1VejkUyNGmFLO23Jwz4IJOauy07+n5zMV9Z6wKQjGpH5CCM5aLT4xBq
	r+oQJsoe685XNo2HU2+U964Rv2YBvqhQtajv2SQxnh4WRdtLXPKYh5CbB1xjJ7tILL7Gr79CkyG7s
	qqaMLrTR50HYPXQH1VTc4ToVKxr+zxINxyF1jarGZy+wSUXKy4WMc4ekbseRFA9XfAGbZ+ZBOEcFf
	5vla1QVyU59JJGx+S5Uh81qSLsJFNDa67u6cClsbxz0W0V4WhBGdZOuD33Z7M7pTYr7q2lTTKSBAC
	1AGNqUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgpu-00000005eA1-3sJt;
	Fri, 20 Dec 2024 17:30:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgZO-00000005apk-30xA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 17:13:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 965D7A42017;
	Fri, 20 Dec 2024 17:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA97C4CECD;
	Fri, 20 Dec 2024 17:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714825;
	bh=Tzf+R0cdsnN4Bz7ctgPLHqNIV/iSYtVlg8oATWjDSbo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vHljs5pkursofUssE2fgZNFZu9sXfOBQV3sHug32BZ7T/pYvJgY8ES1UWIkEyXW58
	 w89QHCha6omSMd2uQ9qE4TVD85wmlJXObnIC7E5Pom3iJqxwNMizpo1Ql4OFRIMmIx
	 zc/XXLGRS02VfSHP3mjUbT0ukpIkLpitT2WgldXEQLQZ++aan85pxzMAj7NViEg1+z
	 n21MGjFzI9DOPch+1k9go6o9f6U6nzfPMhZh/ytlPf46xWJ6TCwXsJhThlYIp/peWd
	 AWS9j36Xt5kQBXfacb/Ya5Ij9mfUjzGg5SCmfrookn8gLVTnXtZ0pQt7ucZGOOPsGr
	 QlIijntT0ByxQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 11/12] irqchip/gic: Correct declaration of *percpu_base pointer in union gic_base
Date: Fri, 20 Dec 2024 12:13:16 -0500
Message-Id: <20241220171317.512120-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220171317.512120-1-sashal@kernel.org>
References: <20241220171317.512120-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.121
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091346_820833_9FFC9AEA 
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
index 4c7bae0ec8f9..867b282fa95d 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -63,7 +63,7 @@ static void gic_check_cpu_features(void)
 
 union gic_base {
 	void __iomem *common_base;
-	void __percpu * __iomem *percpu_base;
+	void __iomem * __percpu *percpu_base;
 };
 
 struct gic_chip_data {
-- 
2.39.5


