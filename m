Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F13CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cwo6M5+aaDCDWXSdYCrJMwPu0VIk6XVt/qmZdPm/rSU=; b=eR3jzWDZ/9ApR/F9FJ8ssKY6hM
	9v8B2F6lidacHdOkXv7KrOhG5BTgZ9h8Lkqi1KpvOfvhZtwfCR4CAUjycdXAkifghNGj50LuQkq44
	F6WM1lk6OLS1rxhpl9XZiKvKVJSWD90TWeo6xeFEuLjg+fIITGFmbScbFfSi6IAeL0/JAHWiMNTjq
	gcC5N2aXj/H3Fp2qVLUvbXmtFaFsnJoxGyMe2raT3/qyMGEJRcYaHStUQ9/Xh6/ZHj+MMq6o3CJwr
	dNwZm3WMlx7cJmLXT6Xc+GJPfZx1c7cye4Z0zlQeqi3qCrk6QYeDQIM/8PuO/SHxK6Xcm4iy3UMCI
	PBvh9PjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3Px-0000000DxTn-3vav;
	Mon, 15 Jun 2026 09:15:41 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3Pu-0000000DxTJ-3Elq;
	Mon, 15 Jun 2026 09:15:40 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowADH6eC1wi9qq3nLFA--.887S2;
	Mon, 15 Jun 2026 17:15:33 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] soc: amlogic: meson-clk-measure: remove debugfs tree
Date: Mon, 15 Jun 2026 17:15:31 +0800
Message-ID: <20260615091531.21964-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADH6eC1wi9qq3nLFA--.887S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AryDAr1kJr4fAFWruFyDKFg_yoW8Kryfpa
	yqkFyrKr4xJr4UKr13ua15Aa1fK397W3WUG3sIg34Iv34Ikr1DZFZ3CFW2yrZ8XrWkWF17
	Ja15Kry5ur45ZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjZNVP
	UUUUU==
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_021539_175608_9E4F3550 
X-CRM114-Status: GOOD (  11.83  )
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

meson_msr_probe() creates a debugfs tree with entries that reference
devm-managed measurement table entries and the driver's private regmap
state. The driver has no remove callback, so unbinding the device can
leave those debugfs entries behind after the private data is released.

Store the debugfs root and remove the subtree from a new remove callback.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/soc/amlogic/meson-clk-measure.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index d862e30a244e..7ca43bcb622a 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -7,6 +7,7 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/bitfield.h>
+#include <linux/err.h>
 #include <linux/seq_file.h>
 #include <linux/debugfs.h>
 #include <linux/regmap.h>
@@ -50,6 +51,7 @@ struct meson_msr_data {
 struct meson_msr {
 	struct regmap *regmap;
 	struct meson_msr_data data;
+	struct dentry *debugfs_root;
 };
 
 #define CLK_MSR_ID(__id, __name) \
@@ -952,6 +954,7 @@ static int meson_msr_probe(struct platform_device *pdev)
 	       sizeof(struct msr_reg_offset));
 
 	root = debugfs_create_dir("meson-clk-msr", NULL);
+	priv->debugfs_root = root;
 	clks = debugfs_create_dir("clks", root);
 
 	debugfs_create_file("measure_summary", 0444, root,
@@ -967,9 +970,19 @@ static int meson_msr_probe(struct platform_device *pdev)
 				    &priv->data.msr_table[i], &clk_msr_fops);
 	}
 
+	platform_set_drvdata(pdev, priv);
+
 	return 0;
 }
 
+static void meson_msr_remove(struct platform_device *pdev)
+{
+	struct meson_msr *priv = platform_get_drvdata(pdev);
+
+	if (!IS_ERR_OR_NULL(priv->debugfs_root))
+		debugfs_remove_recursive(priv->debugfs_root);
+}
+
 static const struct msr_reg_offset msr_reg_offset = {
 	.duty_val = 0x0,
 	.freq_ctrl = 0x4,
@@ -1065,6 +1078,7 @@ MODULE_DEVICE_TABLE(of, meson_msr_match_table);
 
 static struct platform_driver meson_msr_driver = {
 	.probe	= meson_msr_probe,
+	.remove = meson_msr_remove,
 	.driver = {
 		.name		= "meson_msr",
 		.of_match_table	= meson_msr_match_table,
-- 
2.50.1 (Apple Git-155)


