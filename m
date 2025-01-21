Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537F3C02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 08:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1hJVdeetdMJkBWbgEBJsC8FH6rOMXk6W3kS+JEE9MtU=; b=NfFxy2Glo8VZViMUpMo+hAlwUl
	B3GmcL/YBw2dczGr+zXXOu0CItl+zZvmW2geHkn1RUQDOjturRKKcar3WbBD7haGgpmQdnqltODAn
	EdtWbMwKhZMYzAQsUyQXW0zi2WXyMhNJpywhmQVPO3Xy34ZacD1bR5QhdN4LuQQ2azCkcH9xoY2Af
	advlqlxL0oTha0NgSMVDOgbS86t9Yf6Drs6Lk1l57g7PfacfZurwbQJulUB9VuPMEMVBMimmFVL7r
	dPDYT8uawuTG/Q3RZD2WMzjJyWcjb6JISg8HqpWTC2ekM8qoTRj+hrV5ezFmxuYeRVD9DOPswReeN
	/s05tZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taA33-00000007KaY-3732;
	Tue, 21 Jan 2025 08:55:49 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9wg-00000007JAN-0XER
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 08:49:16 +0000
Received: from localhost.localdomain (unknown [220.197.236.33])
	by APP-05 (Coremail) with SMTP id zQCowABXX6N4X49nDUNjCA--.9248S2;
	Tue, 21 Jan 2025 16:49:02 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: u.kleine-koenig@baylibre.com,
	andi.shyti@kernel.org,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH v2] i2c: iproc: Refactor prototype and remove redundant error checks
Date: Tue, 21 Jan 2025 16:48:18 +0800
Message-ID: <20250121084818.2719-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABXX6N4X49nDUNjCA--.9248S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWDJw1rZF4fAr1fAF4fXwb_yoW8ZF4fpF
	4fXr98ur48GFyqqry7GrWrZ345Zr1xJFW0kr43G3WfGan5Jw40y3WrKrWYyryDJay8Jr13
	Zrs7trWUCayjvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUU
	UU=
X-Originating-IP: [220.197.236.33]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwsJA2ePXTAIbwAAsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_004914_529019_A6DC6999 
X-CRM114-Status: GOOD (  13.63  )
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

The bcm_iproc_i2c_init() always returns 0. As a result, there
is no need to check its return value or handle errors.

This patch changes the prototype of bcm_iproc_i2c_init() to
return void and removes the redundant error handling code after
calls to bcm_iproc_i2c_init() in both the bcm_iproc_i2c_probe()
and bcm_iproc_i2c_resume().

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 15b632a146e1..59cbf8b3b025 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -678,7 +678,7 @@ static irqreturn_t bcm_iproc_i2c_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int bcm_iproc_i2c_init(struct bcm_iproc_i2c_dev *iproc_i2c)
+static void bcm_iproc_i2c_init(struct bcm_iproc_i2c_dev *iproc_i2c)
 {
 	u32 val;
 
@@ -706,8 +706,6 @@ static int bcm_iproc_i2c_init(struct bcm_iproc_i2c_dev *iproc_i2c)
 
 	/* clear all pending interrupts */
 	iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, 0xffffffff);
-
-	return 0;
 }
 
 static void bcm_iproc_i2c_enable_disable(struct bcm_iproc_i2c_dev *iproc_i2c,
@@ -1081,9 +1079,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 		bcm_iproc_algo.unreg_slave = NULL;
 	}
 
-	ret = bcm_iproc_i2c_init(iproc_i2c);
-	if (ret)
-		return ret;
+	bcm_iproc_i2c_init(iproc_i2c);
 
 	ret = bcm_iproc_i2c_cfg_speed(iproc_i2c);
 	if (ret)
@@ -1169,9 +1165,7 @@ static int bcm_iproc_i2c_resume(struct device *dev)
 	 * Power domain could have been shut off completely in system deep
 	 * sleep, so re-initialize the block here
 	 */
-	ret = bcm_iproc_i2c_init(iproc_i2c);
-	if (ret)
-		return ret;
+	bcm_iproc_i2c_init(iproc_i2c);
 
 	/* configure to the desired bus speed */
 	val = iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFFSET);
-- 
2.42.0.windows.2


