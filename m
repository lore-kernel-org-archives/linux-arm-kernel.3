Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648F0C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fmnLp9sItjZRzTRjLUFaSuYgADTuAdu1BlDn2RqeR8c=; b=165LGtwk5WUEBQYiHQvPJzEcWz
	nk/2U2TD2pn1EPVC4ysMsWcCBd7SHWHsQvcZ0or51ZD76qL3ZuPoOqfDosjN/IdINjizquGyxpCNP
	L+TeI1LIZjGNmZS7dLI7K3hGWYV6MplMnir6nBh5Ta74mltKjty43Uk0QKf4XBCGJPYEPgCemFSJ4
	OqoQ/SLky5z3KTNZPs96DvoAN0VEbq3p3/UFHrOExsNPW5arvj1dDfRVL0gXeWrZWxEJInOMCbxz/
	Owyaaswe2W9mjyAyMebyZotkkJZf2CYqvuCGCKQgdzkcM+ynHw5eUgvJXKHOPNFxEDU5o7o9s4HIp
	OWKp3nvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumi5-00000002Deh-2Mie;
	Fri, 14 Aug 2026 07:52:13 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumi0-00000002DdJ-0sml
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:52:10 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAC3ie0lyX5qaGieBQ--.63431S2;
	Fri, 14 Aug 2026 15:52:05 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Tony Lindgren <tony@atomide.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] bus: ti-pwmss: unwind child devices and runtime PM
Date: Fri, 14 Aug 2026 15:52:04 +0800
Message-ID: <20260814075204.10983-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAC3ie0lyX5qaGieBQ--.63431S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw4xuryktr1rXF43JryDGFg_yoW8AryUpF
	WxXa4Syr40g3y0kaykGr1fu3W5Way3ta48Ka4rGw4rZ34aqr1Utr1rtF1jvF4rJFWvkw4x
	Zrs8tFs7Ar45CF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU0VbkUU
	UUU
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_005208_634844_406DE48F 
X-CRM114-Status: GOOD (  10.84  )
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

pwmss_probe() enables runtime PM before populating child devices. If
population partially succeeds and then fails, probe leaves both the
children and runtime PM state behind. The remove path likewise lacks
the matching child depopulation.

Depopulate partial children and disable runtime PM on probe failure.
Depopulate children before disabling runtime PM during removal.

Fixes: af0ba001d208 ("pwm: Add TI PWM subsystem driver")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260616151946.53001-1-pengpeng@iscas.ac.cn/
- route the orphaned driver change to OMAP maintainers and lists
- depopulate partially created children on probe failure
- depopulate children before runtime-PM teardown on remove

The child/runtime-PM unwind order was reviewed statically; no AM33xx
bind/unbind test was performed.

 drivers/bus/ti-pwmss.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/ti-pwmss.c b/drivers/bus/ti-pwmss.c
index 1f2cab91e438..0c92968b8d25 100644
--- a/drivers/bus/ti-pwmss.c
+++ b/drivers/bus/ti-pwmss.c
@@ -27,14 +27,18 @@ static int pwmss_probe(struct platform_device *pdev)
 
 	/* Populate all the child nodes here... */
 	ret = of_platform_populate(node, NULL, NULL, &pdev->dev);
-	if (ret)
+	if (ret) {
 		dev_err(&pdev->dev, "no child node found\n");
+		of_platform_depopulate(&pdev->dev);
+		pm_runtime_disable(&pdev->dev);
+	}
 
 	return ret;
 }
 
 static void pwmss_remove(struct platform_device *pdev)
 {
+	of_platform_depopulate(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
-- 
2.50.1 (Apple Git-155)


