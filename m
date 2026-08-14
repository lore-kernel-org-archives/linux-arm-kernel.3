Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA67C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mL4j5vM5lGTNjWISMmnHoD354a3SrDw7wyh5Y5wrwvM=; b=LZDTtp3NG4cpkqH4Fu29xlLqqP
	FQ7TrPh2w4P1SWi0UNKqh3gjzbgAnhwX/nEfjiGH1i8r9fkOt6tXdOeBYKHpCDkCjbN2wVUu0Z3OT
	pchsgDWT87YweADP0yxeyNUsk6CKYfjOV2g4cLsB4s+uMA/IpK/BVxcEpXeBgjxwQwaz4GGXOCYxI
	HsPBzGPcPbvGVMNuWj17I+FzXt4W7qB45AHNB1yWRyuB2okWDNyzPQPY2HoRim+ROemJO5WcYi9e+
	hnHdk9qW0XKdzK3T+sU9INS1D1ZYc74y46TsgJ+B8a4tIzAf6+ky+yKKuF31QlQs43dZsVRKZmLbE
	mU0LMc4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumgN-00000002DMI-3WE9;
	Fri, 14 Aug 2026 07:50:27 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumgJ-00000002DLh-17bw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:50:26 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAC3ie2xyH5q21KeBQ--.63393S2;
	Fri, 14 Aug 2026 15:50:10 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Eddie James <eajames@linux.ibm.com>,
	Ninad Palsule <ninad@linux.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-fsi@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] fsi: aspeed: publish cfam_reset through driver groups
Date: Fri, 14 Aug 2026 15:50:08 +0800
Message-ID: <20260814075008.9031-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAC3ie2xyH5q21KeBQ--.63393S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGF47XFW7XrWUur1kGFW8Xrb_yoW5uF4kpa
	97WFWYgr48Gr1fJayDJan2v3WF9w4rtrWUGr4fKw1S9asxAa4YqryxtrWIvF1xZFWrCF15
	Jr1Dt3yUuF4kZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_005024_355739_C04856F1 
X-CRM114-Status: GOOD (  14.34  )
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

The cfam_reset attribute currently gets created manually while probe is
still initializing the master. Its store callback expects device drvdata
and the master's mutex to be ready, and manual publication also requires
matching cleanup on every later failure and remove path.

Expose the attribute through the driver's default groups instead. The
driver core publishes those groups only after probe succeeds. Hide the
attribute when the optional reset GPIO is unavailable, while retaining
probe deferral and other GPIO acquisition errors.

Fixes: 4a851d714eade ("fsi: aspeed: Support CFAM reset GPIO")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260615065944.34767-1-pengpeng@iscas.ac.cn/
- replace manual sysfs publication with driver-core groups and is_visible()
- preserve optional-GPIO and probe-deferral error semantics
- remove manual sysfs unwind paths

The probe/publication ordering was reviewed statically; no Aspeed FSI
hardware test was performed.

 drivers/fsi/fsi-master-aspeed.c | 38 ++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index aa1380cdff33..ac05e1a263ac 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -464,26 +464,42 @@ static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *att
 
 static DEVICE_ATTR(cfam_reset, 0200, NULL, cfam_reset_store);
 
+static umode_t fsi_master_aspeed_attr_is_visible(struct kobject *kobj,
+						 struct attribute *attr, int n)
+{
+	struct fsi_master_aspeed *aspeed = dev_get_drvdata(kobj_to_dev(kobj));
+
+	if (!aspeed || !aspeed->cfam_reset_gpio)
+		return 0;
+
+	return attr->mode;
+}
+
+static struct attribute *fsi_master_aspeed_attrs[] = {
+	&dev_attr_cfam_reset.attr,
+	NULL,
+};
+
+static const struct attribute_group fsi_master_aspeed_group = {
+	.attrs = fsi_master_aspeed_attrs,
+	.is_visible = fsi_master_aspeed_attr_is_visible,
+};
+
+static const struct attribute_group *fsi_master_aspeed_groups[] = {
+	&fsi_master_aspeed_group,
+	NULL,
+};
+
 static int setup_cfam_reset(struct fsi_master_aspeed *aspeed)
 {
 	struct device *dev = aspeed->dev;
 	struct gpio_desc *gpio;
-	int rc;
 
 	gpio = devm_gpiod_get_optional(dev, "cfam-reset", GPIOD_OUT_LOW);
 	if (IS_ERR(gpio))
 		return PTR_ERR(gpio);
-	if (!gpio)
-		return 0;
 
 	aspeed->cfam_reset_gpio = gpio;
-
-	rc = device_create_file(dev, &dev_attr_cfam_reset);
-	if (rc) {
-		devm_gpiod_put(dev, gpio);
-		return rc;
-	}
-
 	return 0;
 }
 
@@ -573,6 +589,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	rc = setup_cfam_reset(aspeed);
 	if (rc) {
 		dev_err(&pdev->dev, "CFAM reset GPIO setup failed\n");
+		goto err_release;
 	}
 
 	writel(0x1, aspeed->base + OPB_CLK_SYNC);
@@ -664,6 +681,7 @@ static struct platform_driver fsi_master_aspeed_driver = {
 	.driver = {
 		.name		= "fsi-master-aspeed",
 		.of_match_table	= fsi_master_aspeed_match,
+		.dev_groups	= fsi_master_aspeed_groups,
 	},
 	.probe	= fsi_master_aspeed_probe,
 	.remove = fsi_master_aspeed_remove,
-- 
2.50.1 (Apple Git-155)


