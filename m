Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E379FCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pZMBoFnXpmUC1rIKIT+HBdkKzCMsXIIlT8I1N8o5El8=; b=jeIyJC6CPgXZYQ3/Alhb+1Pvbn
	nzwDph43LHFt+ezjbPuSjU2H2gSXdCc4wth6nsFxH7o9guAEWylE38f/NcdKYFlJfyEpXrvVr/xPP
	936UNsHzayUGgqHG8DYH+juE7+Bw4LaaM85dwgB/LyDr4Xw3RbCjUlilrJhJL7Imz3NT0MUpN1GNb
	+oqT4tOXb479OmsTpeWOFAAIB2ELPZvvDpanShG+arPkxM22WQo9lpxKhlDewj8OC+AWBNLTcMl0a
	KMuhS7ancvBdchVwtw+CdrFC8fdJxyZ5PT7SlvdYJCjo31mK+EeDqgUl7Bz/BHEfv5VK2HGF9GiG3
	rxuOKHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZI0M-0000000F1uc-2uD2;
	Tue, 16 Jun 2026 00:50:14 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZI0K-0000000F1u4-14jr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 00:50:13 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAAXNdy8nTBq3o7eFA--.35485S2;
	Tue, 16 Jun 2026 08:50:04 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ulf Hansson <ulfh@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	linux-mmc@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] mmc: sdhci-of-aspeed: depopulate slots before disabling clock
Date: Tue, 16 Jun 2026 08:49:53 +0800
Message-ID: <20260616004953.3469-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAXNdy8nTBq3o7eFA--.35485S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4DJF15ArWUuw4ftrW7XFb_yoW8GrW7pF
	WxXFW8Kr47GF1rKFW7Ww1Du3W5K3WSyayxtrW5Gws5A3y3JryrKFn3GFyjqF4kAFZ7Aa1f
	XFn8Jay8CFnI9aUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r
	4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbtxhJUUUUU==
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_175012_674686_29541BD4 
X-CRM114-Status: GOOD (  11.31  )
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

aspeed_sdc_probe() creates child slot devices one by one after enabling
the controller clock.  If a later slot creation fails, the already-created
slot devices remain registered while the parent probe returns an error.

Depopulate any created slot devices on probe failure and during remove,
before disabling the shared controller clock used by the slots.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index f5d973783cbe..3e941b176687 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -560,12 +560,14 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 		cpdev = of_platform_device_create(child, NULL, &pdev->dev);
 		if (!cpdev) {
 			ret = -ENODEV;
-			goto err_clk;
+			goto err_depopulate;
 		}
 	}
 
 	return 0;
 
+err_depopulate:
+	of_platform_depopulate(&pdev->dev);
 err_clk:
 	clk_disable_unprepare(sdc->clk);
 	return ret;
@@ -575,6 +577,7 @@ static void aspeed_sdc_remove(struct platform_device *pdev)
 {
 	struct aspeed_sdc *sdc = dev_get_drvdata(&pdev->dev);
 
+	of_platform_depopulate(&pdev->dev);
 	clk_disable_unprepare(sdc->clk);
 }
 
-- 
2.50.1 (Apple Git-155)


