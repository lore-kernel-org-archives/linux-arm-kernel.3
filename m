Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A868CE6749F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 12:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGCHKV0UnLtxPrp1o4XgfPZMeWnD2F0Sj7TSTZVgkgI=; b=BCbIftj7Vl4FEJdmTTG30I/H1J
	K4WtMPhzao6NaSoMO0KLIefJbqFhA4EJdo6y7lQgNmmu3WY8+2kLOCKZ6PUCGlLwF/xoIl98hVKS9
	ZMLN13Z2DDGE6hs1C+/3CmmnMXwOouZ1fC4LOZ18Y9e+PjyKTtYC/PeW1vltRc8+Bc2t2JzY/MAuq
	qqqmuCieQNocBEXiKLxCZdzft7DpMlKvtrw2rKPUv0T3KzA+omgxybvPP1Va/YTlDZSeaWXOinNkQ
	uUAwIqpupn7mINku+izgYhzWFLd1xesRnnvjuatSIFgU6S8+gJIwjCU2TTkK/8JVJjThh+AJbiWUV
	wjdST7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXeeg-0000000Ditf-09Ti;
	Mon, 22 Dec 2025 12:04:50 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXeec-0000000DirE-2ERL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 12:04:47 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 22 Dec
 2025 20:04:29 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 22 Dec 2025 20:04:29 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Mon, 22 Dec 2025 20:04:27 +0800
Subject: [PATCH 2/3] pinctrl: single: Allow probe to continue if mem region
 busy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251222-upstream_pinctrl_single-v1-2-e4aaa4eeb936@aspeedtech.com>
References: <20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com>
In-Reply-To: <20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com>
To: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<andrew@codeconstruct.com.au>, <BMC-SW@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766405069; l=1297;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=9aHMGO/anwtWi10C7W8Ai9OrN9GsPC2DEymoczNF6rQ=;
 b=5WbJHU1Tw4C9iL1u5pb6pSRyKD95fsNrKGFLPvThTdTJC5IvPviIEn2X9OEeTWaXaSddzfCjp
 2YqqoLAdhTjDWHJ4cjMFW9xwdLXiO9Z4hQcd3LP3SlqTo8TIoL6fOvK
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_040446_618628_999780B1 
X-CRM114-Status: UNSURE (   9.95  )
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

Skip exclusive memory region reservation failure during probe and
continue initialization with a warning. This enables support for
systems where the memory region may already be reserved, improving
probe robustness.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/pinctrl-single.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 757c22cc09f3..e65ae737b4c5 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1910,13 +1910,13 @@ static int pcs_probe(struct platform_device *pdev)
 
 	pcs->res = devm_request_mem_region(pcs->dev, res->start,
 			resource_size(res), DRIVER_NAME);
-	if (!pcs->res) {
-		dev_err(pcs->dev, "could not get mem_region\n");
-		return -EBUSY;
-	}
+	if (!pcs->res)
+		dev_warn(pcs->dev, "mem_region busy, continuing without reservation\n");
+	else
+		res = pcs->res;
 
-	pcs->size = resource_size(pcs->res);
-	pcs->base = devm_ioremap(pcs->dev, pcs->res->start, pcs->size);
+	pcs->size = resource_size(res);
+	pcs->base = devm_ioremap(pcs->dev, res->start, pcs->size);
 	if (!pcs->base) {
 		dev_err(pcs->dev, "could not ioremap\n");
 		return -ENODEV;

-- 
2.34.1


