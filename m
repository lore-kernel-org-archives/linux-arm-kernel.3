Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D80C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v7FgsLCDjywRF5KPQTtUvLJ+BSHN64tfvbrVtXTw8Ws=; b=KHt1XISZGVyFuxw+iEIP4qsg6V
	FoOIsVUQaJ+bcEYYpJRMxAznklvw9vCp8S8AYpFAJJp+vKpi5HYCYd4DHM1PqvvFHaCyufPqJbdS5
	O0OljrJKFZB2n3tZD92JXc6/gTRDywiuRAk1Wnxwpg0AilVixUCtHh3vWsYjNkBNmEN/H7r1vyEZq
	KbUtu3Zg6dmcINNP6+PSomhv9gG2huWjHLv4zoJG8fJFV4yJlhto9nkEbovVvyhINnrsTRLHYValn
	yhjYkuJCwEi488PTwLIZp8Nr++XV3+Y+Ze6xz4+e9GNlhrEmp8YQ5UXXfz8Lafw9xsaaVYGanfVIn
	PzGALwZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUPH-000000003zg-1bf8;
	Thu, 15 May 2025 08:57:35 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFU9R-000000001aK-08oE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:41:15 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAA3dw+iqCVotbHaFQ--.49892S2;
	Thu, 15 May 2025 16:41:06 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: qiang.zhao@nxp.com,
	christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] soc: fsl: qe: Consolidate chained IRQ handler install/remove
Date: Thu, 15 May 2025 16:39:19 +0800
Message-Id: <20250515083919.3811473-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAA3dw+iqCVotbHaFQ--.49892S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF1fZFWUWr1fAr17tr4UXFb_yoWkZFc_Ww
	45X347Xr18ZasayF12ywsxAF4rZF4vqrnrCanYqFZay34fJ397AF1UtFnxur1kWF15ZF1k
	Ary5ZrWfGrWUGjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfU00eHDUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_014113_447438_5853043F 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

Chained irq handlers usually set up handler data as well.
irq_set_chained_handler_and_data() can set both under irq_desc->lock.
Replace the two calls with one.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/soc/fsl/qe/qe_ic.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 17e6d2377c7c..4068b501a3a3 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -450,13 +450,11 @@ static int qe_ic_init(struct platform_device *pdev)
 
 	qe_ic_write(qe_ic->regs, QEIC_CICR, 0);
 
-	irq_set_handler_data(qe_ic->virq_low, qe_ic);
-	irq_set_chained_handler(qe_ic->virq_low, low_handler);
+	irq_set_chained_handler_and_data(qe_ic->virq_low, low_handler, qe_ic);
 
-	if (high_handler) {
-		irq_set_handler_data(qe_ic->virq_high, qe_ic);
-		irq_set_chained_handler(qe_ic->virq_high, high_handler);
-	}
+	if (high_handler)
+		irq_set_chained_handler_and_data(qe_ic->virq_high,
+						 high_handler, qe_ic);
 	return 0;
 }
 static const struct of_device_id qe_ic_ids[] = {
-- 
2.25.1


