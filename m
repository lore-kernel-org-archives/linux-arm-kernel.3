Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4DFC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gptmgwRgAWgj1S2nzX5zydzh84m6VfpFaBldhfF+Jg8=; b=frdpyIB96zqc+FnX2qE/xP01By
	qg+XQ2KD1Y5UmMqBnU+Gk+pEmy32Y5UezJiAuFaqraH7a7NrFZSKOVxTdraOCJeBL55G/JKBLyaet
	oPABAZJJR6Zu3kW9cH3TkZ8JKRxL+qlmNQoq/dLL/Ku1+NBUCe2b3RYUR9vP3oGDq8+RgRL2ctqMD
	O1+fa50SyVFnUvn4ukhHWEvI54tp+dy7wGsjMqWUWgMf4j/FzLcC8/rEMddDAWWqMV7OgC8q9u700
	wX8K4HzxXqpht+KSXbeGQwZRpsu8vovVVvi3Ryqtybn6m0b5XLg735kxBeiY2cJ4F7w4wgUGBYUMX
	phZe+QSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jjY-00000008YWD-2LYY;
	Wed, 16 Sep 2026 07:07:08 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jjU-00000008YVD-0SXV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:07:07 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAD3+TcUQKpqxeveBw--.65276S2;
	Wed, 16 Sep 2026 15:07:00 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: alchark@gmail.com
Cc: andi.shyti@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@prisktech.co.nz,
	wsa@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH 04/20] i2c: viai2c-wmt: Fix clock leak in wmt_i2c_probe()
Date: Wed, 16 Sep 2026 07:06:31 +0000
Message-Id: <20260916070631.1965713-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAD3+TcUQKpqxeveBw--.65276S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XryDKF17CrWrJF1ktF43Jrb_yoWktrbEkF
	4DC3srZr17GFn5tw1UXr4av3yvkF4ku348Ka10yr4ayryUWwn3G3Wqv3s3ZrsrWw42gFyY
	q3WjqFWfZw13ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUKdgAUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUMA2qqP4cDTwAAsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_000706_399861_F20C8D6C 
X-CRM114-Status: GOOD (  10.78  )
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

In wmt_i2c_probe(), i2c->clk is acquired using of_clk_get(). If any
subsequent operation fails or when the module is unloaded, the clock
reference count is never decremented via clk_put(), leading to a
resource leak.

Switch to devm_clk_get() so that the clock is automatically managed
and released.

Fixes: 560746eb79d3 ("i2c: vt8500: Add support for I2C bus on Wondermedia SoCs")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/i2c/busses/i2c-viai2c-wmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-wmt.c b/drivers/i2c/busses/i2c-viai2c-wmt.c
index 2cf3cc0165fb..74ca93b44347 100644
--- a/drivers/i2c/busses/i2c-viai2c-wmt.c
+++ b/drivers/i2c/busses/i2c-viai2c-wmt.c
@@ -117,7 +117,7 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, err,
 				"failed to request irq %i\n", i2c->irq);
 
-	i2c->clk = of_clk_get(np, 0);
+	i2c->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(i2c->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
 				     "unable to request clock\n");
-- 
2.34.1


