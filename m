Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233FFC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MqRaeK7yQ/wr3t+/PWMzPxu9aqmTlY/m03ulwUe5ewo=; b=X6LCRUZV7cp0RY2bs1s1meXN7E
	KCTikY0OV6LV5N6MLV1sOvaIyAniUaKxWo201gxmmzbg9E/S15stPPlQ6CanqG9ljBqRV/8XcA7Rz
	kNiTHHZSlTXRMzqaiJgyGcwtkawk3NUpblhJqe75cMkrUnMcsj8QL10Hg3T0t+Z4L+mLWsfrNfVJ5
	3GCLFyGCyTqa2jibjPkCJza8rPrij8ADsJlozClsSYnb1VKGCGdBTC87Wqg1aBCIlvVvwGSz4A0nQ
	bnF390IOhgogKCl/FBB8bumr7pfETiu3rGpdzbSTNaRsfQw4IKof2aqVB1mH/xeidE3Sbv3Duq2tX
	ZkuF3d+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qCR-0000000AJxn-1add;
	Thu, 10 Apr 2025 11:36:03 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2piA-0000000AA1r-0k4x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 11:04:48 +0000
Received: from jtjnmail201601.home.langchao.com
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202504101904235318;
        Thu, 10 Apr 2025 19:04:23 +0800
Received: from locahost.localdomain.com (10.94.12.92) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server id
 15.1.2507.39; Thu, 10 Apr 2025 19:04:24 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <s.nawrocki@samsung.com>, <a.swigon@samsung.com>, <djakov@kernel.org>,
	<krzk@kernel.org>, <alim.akhtar@samsung.com>, <cw00.choi@samsung.com>
CC: <linux-pm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] interconnect: samsung: Add NULL check in exynos_generic_icc_probe
Date: Thu, 10 Apr 2025 19:04:20 +0800
Message-ID: <20250410110421.77580-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.12.92]
tUid: 2025410190423d4e3250a732bb1a33e9b6b03863240d7
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_040446_488188_1AAA3E06 
X-CRM114-Status: UNSURE (   8.37  )
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

devm_kasprintf() can return a NULL pointer on failure,but this
returned value in exynos_generic_icc_probe() is not checked.
Add NULL check in exynos_generic_icc_probe(), to handle kernel NULL
pointer dereference error.

Fixes: 2f95b9d5cf0b ("interconnect: Add generic interconnect driver for Exynos SoCs")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/interconnect/samsung/exynos.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/interconnect/samsung/exynos.c b/drivers/interconnect/samsung/exynos.c
index 9e041365d909..f3568f0d92d1 100644
--- a/drivers/interconnect/samsung/exynos.c
+++ b/drivers/interconnect/samsung/exynos.c
@@ -134,6 +134,11 @@ static int exynos_generic_icc_probe(struct platform_device *pdev)
 	priv->node = icc_node;
 	icc_node->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOFn",
 					bus_dev->of_node);
+	if (!icc_node->name) {
+		devm_kfree(&pdev->dev, priv);
+		return -ENOMEM;
+	}
+
 	if (of_property_read_u32(bus_dev->of_node, "samsung,data-clock-ratio",
 				 &priv->bus_clk_ratio))
 		priv->bus_clk_ratio = EXYNOS_ICC_DEFAULT_BUS_CLK_RATIO;
-- 
2.43.0


