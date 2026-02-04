Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C50E83045
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 06:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sz3Hcs5IRNpLVQpbSbOYq3KoTZhiUbHWgCLorURdfJw=; b=D6kEFP9Ig0ypfoET6S4Dy0yCOl
	+wz/QdNx4ID3T1Zwer7q9Ae6Nl8jkeudQQlMAk05zs2MFhdjZ5cdBhB/EpQUOXXuGO0j9friyxbd+
	P3s3rAxt471QENJa2N2MmELU7MA6SJr3IQ9i3A1VkmXoY4TzlSL7/UqGQ3+u46PhyJartAoIBjx6x
	7g5ol6VjMQUalPI+pwaDJlqBuBjSuRY1xOmZ0detnKAbGp9o3PypKAhb7UeEFPCJQjWBSwBlRdtX+
	Jn8/vdeEdO8j5esOiz0uyg8E7WN9iKm/90mNWZCqMBmdMG+MoL2DW7qL4sPu8ukbtqXqr0H9XFz4W
	dNDEmuPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnWUO-000000080c3-1abQ;
	Wed, 04 Feb 2026 06:35:48 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnWUK-000000080bK-1MoQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 06:35:47 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAC3Ym6w6IJpVXkeBw--.25971S2;
	Wed, 04 Feb 2026 14:35:28 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: linusw@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	liviu.dudau@arm.com,
	sudeep.holla@kernel.org,
	lpieralisi@kernel.org,
	robh@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] clk: versatile: vexpress-osc: Check return value of devm_of_clk_add_hw_provider() in vexpress_osc_probe()
Date: Wed,  4 Feb 2026 14:33:32 +0800
Message-Id: <20260204063332.1791986-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAC3Ym6w6IJpVXkeBw--.25971S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFykArWDWr1xGr4kCry8Xwb_yoW8JFyxpF
	WxJFWxGwsrtr48W39xtr1xuFn0va45tFy8Ja47C3y8Zw45Cw4ktF48GFy0gF4kXr98Aw4a
	vayUCr4rAr4UZFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjmiiDUUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_223545_588842_894FD2AE 
X-CRM114-Status: GOOD (  11.10  )
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

Return the value of devm_of_clk_add_hw_provider() in order to propagate
the error properly, if it fails due to resource allocation failure or
device tree clock provider registration failure.

This ensures that the probe function fails safely rather than proceeding
with a potentially incomplete clock provider setup.

Fixes: 03cc105f2edf ("clk: vexpress-osc: Use the devres clock API variants")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/clk/versatile/clk-vexpress-osc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/clk-vexpress-osc.c b/drivers/clk/versatile/clk-vexpress-osc.c
index 9adbf5c33bd1..2292fee4e423 100644
--- a/drivers/clk/versatile/clk-vexpress-osc.c
+++ b/drivers/clk/versatile/clk-vexpress-osc.c
@@ -97,7 +97,10 @@ static int vexpress_osc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get, &osc->hw);
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get, &osc->hw);
+	if (ret)
+		return ret;
+
 	clk_hw_set_rate_range(&osc->hw, osc->rate_min, osc->rate_max);
 
 	dev_dbg(&pdev->dev, "Registered clock '%s'\n", init.name);
-- 
2.25.1


