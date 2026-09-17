Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CAEC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g4bFFdd/Bsp2KuCWCbp17NJh09+GDQwLCTzypYyzVkI=; b=e43Imhwetm6FXGdE71ehRDgjQQ
	7O24oNhCgJfakRvpxB1WzbWup6S+56T1hn5UvzjEKZlFVOEUDRIGq+HpoB1AbSoFL03GDpXF97UZ9
	UlChy60+HS3bzvCR0SeU5g5EQdjIFaF8Q74DP/nUQDHDBwcr+EtrC65l8MAem1KSXahk/0FNX9EO/
	20kZlQlnnZbnIcnvHEzofyc15ke/FV4RkelP62rhGb8epGGU/dELDBe6sSng29rQQxMWaVxa2kSHi
	2itlh2WqSLDp/cAgh7mTRQswHsooRrMTOxOZvChsu5y1doRDeqjsXJxsbxzSMqWKMqAjN3vE1GatW
	lucPUvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79AK-0000000B5De-3Kvy;
	Thu, 17 Sep 2026 10:16:28 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79AH-0000000B5DJ-3rn0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 10:16:27 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAA3oDr3vatqq29+CA--.404S2;
	Thu, 17 Sep 2026 18:16:23 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: alexandre.belloni@bootlin.com
Cc: bbrezillon@kernel.org,
	claudiu.beznea@tuxon.dev,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nicolas.ferre@microchip.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] memory: atmel-ebi: Fix SMC clock reference leak in atmel_ebi_probe()
Date: Thu, 17 Sep 2026 10:16:23 +0000
Message-Id: <20260917101623.2146392-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAA3oDr3vatqq29+CA--.404S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr48Kw1UZFW8KFW5Zr4DXFb_yoW8Gry5pF
	4rWrWjkrs5X3yftanrJFyDua4Fgay8trWakFy2kas7u3WYyFy3Wa4rZFW2qF1DZFWkZ3y3
	t3W8JF4kXFWUZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB2b7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0E0s8F02x267IIx4CEVc8vx2IErcIFxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48Zr
	WUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aV
	CY1x0267AKxVW0oVCq3bIYCTnIWIevJa73UjIFyTuYvjxU7WE_DUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwMNA2qrrRk+TwAAsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_031626_357273_9990A9F5 
X-CRM114-Status: GOOD (  12.00  )
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

atmel_ebi_probe() takes a reference to the SMC clock with
of_clk_get(), stores it in ebi->smc.clk and enables it, but the
reference is never released: the driver has no remove callback and
none of the error paths after the clock has been enabled call
clk_put(), so the reference leaks on the success path and on every
error path.

Drop the reference with clk_put() once the clock has been prepared
and enabled.  The clock itself stays enabled, as the driver needs it
to keep the SMC registers accessible.

Fixes: 87108dc78eb8 ("memory: atmel-ebi: Enable the SMC clock if specified")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/memory/atmel-ebi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 8db970da9af9..cd138a3b793c 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -561,8 +561,13 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 		ebi->smc.clk = NULL;
 	}
 	ret = clk_prepare_enable(ebi->smc.clk);
-	if (ret)
+	if (ret) {
+		clk_put(ebi->smc.clk);
 		return ret;
+	}
+
+	/* The clock stays enabled; drop the unneeded consumer reference. */
+	clk_put(ebi->smc.clk);
 
 	/*
 	 * The sama5d3 does not provide an EBICSA register and thus does need
-- 
2.34.1


