Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318C0EA795C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 05:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iXjBRxizvi/lQAfqWRx15BpIKKNQ0pQJLDkNuOdZ/sE=; b=3af80zvhbleHNHt7oKl+jh7A3Y
	h6zpcIsnUnb+sJe03JgHyyawBMpY7K1rRXbPIDB24Qi2DWS+ZjU7cVjN51xg/AAox54DbkhrlzYUj
	4qgLBlM0vrQD1SvHAXy8SeOBJIdV2uTizBCL8EDGu/ues3CarjOecIx6GkoYqQf4jE8sTVmR0qbB2
	8u8FPTdFv3THCAUDUzYVDzbZY5MpOnV2JwDVEs0Nkinu/xCqA4+EPrCdleJ26fxbg14293FuWYouy
	cS54Qht4pGtyXFOtGymUP6Gai3VuxzG85bGu7oCu4AUy1OXuO70uPYuzb5z4imnl6XmHN2ZqHnCSu
	t+ivJJZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voDzF-0000000AsLa-0TMV;
	Fri, 06 Feb 2026 05:02:33 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voDzB-0000000AsLB-3iOC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 05:02:32 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowACXKAzedYVpLGOWBw--.8810S2;
	Fri, 06 Feb 2026 13:02:22 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: p.zabel@pengutronix.de,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH v2] reset: imx7: Check return value of regmap_attach_dev() in imx7_reset_probe()
Date: Fri,  6 Feb 2026 13:01:09 +0800
Message-Id: <20260206050109.119348-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACXKAzedYVpLGOWBw--.8810S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrW8Cw17JrW3CryDJryxZrb_yoW8GrW7pr
	s8CF1jk3y3X3yfWan7t3ykZF13tw1fKa17CrW8X393Zw45tryDJFyayFW7JF95JF98WFWY
	qas7WF48ZF4jyw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCY02Avz4vE14v_GrWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfUYE_MDUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_210230_322842_2219981F 
X-CRM114-Status: GOOD (  13.07  )
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

Add error checking for regmap_attach_dev() call in imx7_reset_probe()
function to ensure proper error propagation.

Return the value of regmap_attach_dev() if it fails to prevent
proceeding with an incomplete regmap setup.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
Changes in v2:
- Simplify error handling
---
 drivers/reset/reset-imx7.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
index dd01fe11c5cb..a1cca926085b 100644
--- a/drivers/reset/reset-imx7.c
+++ b/drivers/reset/reset-imx7.c
@@ -364,6 +364,7 @@ static int imx7_reset_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct regmap_config config = { .name = "src" };
 	const struct imx7_src_variant *variant = of_device_get_match_data(dev);
+	int ret;
 
 	imx7src = devm_kzalloc(dev, sizeof(*imx7src), GFP_KERNEL);
 	if (!imx7src)
@@ -375,7 +376,9 @@ static int imx7_reset_probe(struct platform_device *pdev)
 		dev_err(dev, "Unable to get imx7-src regmap");
 		return PTR_ERR(imx7src->regmap);
 	}
-	regmap_attach_dev(dev, imx7src->regmap, &config);
+	ret = regmap_attach_dev(dev, imx7src->regmap, &config);
+	if (ret)
+		return ret;
 
 	imx7src->rcdev.owner     = THIS_MODULE;
 	imx7src->rcdev.nr_resets = variant->signals_num;
-- 
2.25.1


