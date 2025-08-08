Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675B9C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 20:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPWULK+zSaBWFi19oDhRH3Bw1HTDplfZ83UQ3t+VtJ8=; b=2qYCnK6syM+CYYmPeS8lBchGgj
	7pL54HEN+FPrGRTEe/6QSIX3bF+dswPbwWdXhZQDE7VeUuAJLUeUgodYVPpOd4hLiYKasdadfvtnD
	bo8Y8zXIUheOhyeD4aun6H7f4bC9HUVbwa5s52T7W7QJkNm5RypChMS/QqGSdZbTgF8wEHUpSHPGU
	4WeSOe3OdbVYTS+bWGAOcn2cQAtl9jVnEtjUTTABv8X8xD7cgoPIselgo756bfn9+aiDQHosnb+gb
	4JJRZAr+MG3Cqlf1rcUFn1wWqwypt8HhndbEpZ6Sw8qHD9ReoStozJgPgr0YyQeQzLOJzwrBao1wQ
	O1p5NOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukTgC-00000003d5j-32wC;
	Fri, 08 Aug 2025 20:27:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukTJo-00000003a9H-2Uto;
	Fri, 08 Aug 2025 20:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754683438;
	bh=90dzp77arnMfHsD/KpE4UUqSZVYd5kZP1fMjnyp9xuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F18f32VEbrNdXEfd6oaZSNmCHcUkKd3x1BgoCqPVtxdOojizlc0Fijjaohc7gXvf1
	 2zaU80gzKPwg7NgLXSWXVwO643z1utH459fmUKg/7BrlAcdz42U0kNHA/2K+galFpJ
	 +YaM0VCCtXIQ++ngltsmHiVlq1+ZJJ54Pp7hinWIuS0zVVdF8yJMcpmW9qv0WjX+jh
	 1s2S8dW4JGoDADiYxZD0PvyAsCCH5Ays4gTu4FhA28ltyaN8//xDFfkt/q8JB2J4PW
	 zslSlKnlG+tXTw9JFC5EUPLwnubtwXRixjmjnt21a/R+fX+08TU/u+jKKMZIF46i/P
	 vlqin3lXjkCiQ==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4C7E17E0C8C;
	Fri,  8 Aug 2025 22:03:57 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 08/12] media: rkvdec: Enable all clocks without naming them
Date: Fri,  8 Aug 2025 16:03:30 -0400
Message-ID: <20250808200340.156393-9-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808200340.156393-1-detlev.casanova@collabora.com>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_130400_805907_0F0B7121 
X-CRM114-Status: GOOD (  16.88  )
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

For other variants, the clock names and number will differ.

There is no need to keep track of the clock names in the driver so drop
them to avoid having a list for each variant.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 24 +++++--------------
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  1 +
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5f3057e8136b5..0ccf1ba81958a 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1161,14 +1161,9 @@ static const struct of_device_id of_rkvdec_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_rkvdec_match);
 
-static const char * const rkvdec_clk_names[] = {
-	"axi", "ahb", "cabac", "core"
-};
-
 static int rkvdec_probe(struct platform_device *pdev)
 {
 	struct rkvdec_dev *rkvdec;
-	unsigned int i;
 	int ret, irq;
 
 	rkvdec = devm_kzalloc(&pdev->dev, sizeof(*rkvdec), GFP_KERNEL);
@@ -1183,19 +1178,12 @@ static int rkvdec_probe(struct platform_device *pdev)
 	rkvdec->config =
 		(struct rkvdec_config *)of_device_get_match_data(rkvdec->dev);
 
-	rkvdec->clocks = devm_kcalloc(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
-				      sizeof(*rkvdec->clocks), GFP_KERNEL);
-	if (!rkvdec->clocks)
-		return -ENOMEM;
-
-	for (i = 0; i < ARRAY_SIZE(rkvdec_clk_names); i++)
-		rkvdec->clocks[i].id = rkvdec_clk_names[i];
-
-	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
-				rkvdec->clocks);
-	if (ret)
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks);
+	if (ret < 0)
 		return ret;
 
+	rkvdec->clk_count = ret;
+
 	rkvdec->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rkvdec->regs))
 		return PTR_ERR(rkvdec->regs);
@@ -1269,7 +1257,7 @@ static int rkvdec_runtime_resume(struct device *dev)
 {
 	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
 
-	return clk_bulk_prepare_enable(ARRAY_SIZE(rkvdec_clk_names),
+	return clk_bulk_prepare_enable(rkvdec->clk_count,
 				       rkvdec->clocks);
 }
 
@@ -1277,7 +1265,7 @@ static int rkvdec_runtime_suspend(struct device *dev)
 {
 	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
 
-	clk_bulk_disable_unprepare(ARRAY_SIZE(rkvdec_clk_names),
+	clk_bulk_disable_unprepare(rkvdec->clk_count,
 				   rkvdec->clocks);
 	return 0;
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 679de66df2479..af47f16cb417d 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -117,6 +117,7 @@ struct rkvdec_dev {
 	struct v4l2_m2m_dev *m2m_dev;
 	struct device *dev;
 	struct clk_bulk_data *clocks;
+	unsigned int clk_count;
 	void __iomem *regs;
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
-- 
2.50.1


