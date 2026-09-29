Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A4DCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Q5DALqLK2poFGKjmNG6XI2SLB5UCPlonreW219u7mo=; b=fyqiPDYNkoMAEDV/e0+wpFDlU8
	LbT60sC7Vba8+CEx4JNYsUdLOW6rj58kt6MOq4QyXhFVmn4X1x4dIgsqvQUop1JwGElhc7sIVuNv/
	ymQ/y+DscCO6BZF84G7y2d89hfCHpYCouanOo5f75lU1x5eK8V/o/Tl3ti7CupQ5JlnGcpzjyiUc7
	OmysywcB0GMa5Kr6u6At1IH0kXdzLLY8Kyi2W45ARmXpYo3bs+WVTyq1PhKD/o+atw4oXms61jS1A
	2wDG1FD7112eQIcPYw6pV0TpDf0ozitvhsYqlKu6E3ooolFNHUzs78SvdQwKtfIxVwDm/WwJ/U+QV
	k5HfjoHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBc5X-00000004EwV-3DRm;
	Tue, 29 Sep 2026 17:57:59 +0000
Received: from mail-oo2-x0a.google.com ([2607:f8b0:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBc5U-00000004EvY-4C8u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 17:57:58 +0000
Received: by mail-oo2-x0a.google.com with SMTP id 46e09a7af769-81a7ff792f6so1554307a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790704676; x=1791309476; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Q5DALqLK2poFGKjmNG6XI2SLB5UCPlonreW219u7mo=;
        b=StoM3zX8RtowvxCj1FY1gps7MGsetvhPXvsGA/UbNeu9+7Gd8+NS0qX+idKy7cbO04
         V7+2y+Uah8HJPz92kJobG0S+cbML60wDMZL8MdM8DpaBLMgcfko/ugu8nkunK8R3fmlV
         qULweWWMM6sOeVD2ePtNdQdiFvn+vtHacRKA2f/chpU51ksekL0hkBVttCANUZpq8JmA
         Pc9JYEnFSQTpHp23SfUBEuH3x7eitmlOoRCzn/cpKPpq4AGEJ1mA8JuTEl1pY9tIb96B
         EG/SJytC3h6dyH8vKSOYr1lAvuM/zD5Esk5upclXQE8DNg8+YSV2XiQ8I2CvhUfZf5aI
         MGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790704676; x=1791309476;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3Q5DALqLK2poFGKjmNG6XI2SLB5UCPlonreW219u7mo=;
        b=K+i4o8CrasZ6H6sROICIUYRByhD/I5AlK/w5knUQ114WqN3KYdb/6V1Ah0Y8nk0POF
         YHGiQIysv1O5QoqhMedkFfk/8QOqyA4JGq0tdvREMTFt4IOW+x7iCuQaZGNi8JrahdBx
         xj1TnU5it664zDBRMtl6RCf6PWHmJJtZ40EARqcE3KIiyWfatPCPhhyK0dWu7+j98WKj
         RLKlNHyqb/sG4JaPGFTTrd7rsrtNDGMjQ0t6TDoQdF1jnSum9lsk8FDIG2f/xp+UvVqd
         lS3eksAuJS7yUeyrQG4sjCApQiFKGUVTiJSZ74OY17YZeam832jdWqgZ1GWZOxphEeZ1
         h0hg==
X-Forwarded-Encrypted: i=1; AKwUvBwbnP9LFFh09JkK5lLVhtNIDkfuWKz91XC282jgvO2hKxf4AehqCScVGjqQTR1Z4gnD8bkNuVUZ2jqUQOiZw090@lists.infradead.org
X-Gm-Message-State: AFuF++m4W2frKSerVi6sn6KoEwaMvdfhUVLtl9iICmCV6BQKGW/56umP
	abLi6DEUAsbvSn8duHHMpFVZNzHo6X45NslCOmE9GSuonD/3+kZDDa1G
X-Gm-Gg: AYBFou02MXLvyu/rpwXJFp9oeo0xUYEOotHt1iLRj1Th1QpQ39Ny/NNGA8JKobnFFB5
	4PvKtEIRj6xgw9Jgalri2xftHA/BK8veq46vfIoeLkrhhMJNB5GmS6MekVptLyXAyLqRQ9yPpgN
	na8TywphM3siR9HkvdyGzJ/+0Ntijy6SRVN56cpRpOT0OKHU2H1VIDoIbz5YDazGMskGk/mBE+4
	LCnPTu7XstIF8HM6+RI2cmf/ivoKba/OVicEZFbTsp2eJ5UE766TrXw3Lv9jhbjvtk7uKXtvazE
	lcNlY47Cx3C8VIVCcg+LR8klgSOyRBEl6rk+zRpTAD8IUkPArUizZYBhukvcm0y4gaR9cr1X6Xy
	5U/xAYG8UVi2BgeCgaeTPROJEIumLNkWf5Xap2qHeXI1WP5yw8CgkWC6Ofd9BnP8wUhQg7558BL
	Xh2RqVyiU5EseZ5CY69ee3KNMCRtFvT8MOC2xKz/GBxpHPEsJfbXSLS3gA2xlKxLHBbg==
X-Received: by 2002:a05:6830:6f8b:b0:81c:ad41:f9a8 with SMTP id 46e09a7af769-81fd8d7e013mr96882a34.25.1790704675863;
        Tue, 29 Sep 2026 10:57:55 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81faf7eedd6sm691407a34.17.2026.09.29.10.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:57:55 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 29 Sep 2026 12:57:51 -0500
Subject: [PATCH] pinctrl: mediatek: common-v1: Use a raw spinlock for the
 pinctrl regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQ6CMBBA0auQWTsJNBaCVzEuCgx1oq3NTKtGw
 t1tWL7N/xsoCZPCpdlA6M3Kr1jRnRqY7y56Ql6qwbSmb0djUSYphFrohyVpFnKBo8eQH5g4zlm
 eKO6DQj64hJ09L70xdhqHAWozCa38PX7X277/AZvetit/AAAA
X-Change-ID: 20260925-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-154d6225b977
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Yingjoe Chen <yingjoe.chen@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790704674; l=5335;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=AhPKeNImrvlq1anzVY2fNb8qUrxOu5aYYSTJF3bI2YQ=;
 b=yQ5tCTTuq8nTIonA2166WPdB0ch3FpnbY3HeqZaxd1jIKsCOG9Ko0jSYkM8b1C/Fa3Ehnt1cj
 hLTiIbbRx6fCXdVy1YJTPmVo+15nwP4U/aNM9eWC7H3yhRtWEe8kDnL
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_105757_075043_0B03DFD0 
X-CRM114-Status: GOOD (  19.23  )
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

The EINT irq_chip emulates both-edge interrupts by reading the pin's
level through mtk_gpio_get() and the pinctrl regmap. It does so from its
unmask and set_type callbacks, under the raw irq_desc lock, and from the
chained handler, in hard interrupt context. The regmap comes from syscon
and locks with a spinlock_t, which may sleep on PREEMPT_RT. With
CONFIG_PROVE_LOCKING, the first request of a both-edge EINT prints
"[ BUG: Invalid wait context ]" and turns lockdep off for the rest of
the boot.

Create the regmap for the "mediatek,pctl-regmap" nodes here instead,
with use_raw_spinlock set, and register it with syscon so that other
users of a node, such as the ethernet on MT2701 and MT7623, share its
lock. If the node already has a syscon regmap, keep using it. Select
REGMAP_MMIO, which the driver now uses directly.

Fixes: 3221f40b7631 ("pinctrl: mediatek: emulate GPIO interrupt on both-edges")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Found on the Amazon Fire HD 10 (2017), an MT8173 tablet that is not
upstream yet, where usb_extcon_probe() requests the USB ID pin's
both-edge EINT. With this patch lockdep stays on through boot, CPU
hotplug, suspend to RAM, and lid open/close edges on the hall sensor's
both-edge EINT. Only MT8173 was tested. Nothing else uses the node
there, so the -EEXIST fallback was not exercised.

checkpatch warns that the regmap_config should be const. It is copied
per node to set name and max_register, as syscon does.
---
 drivers/pinctrl/mediatek/Kconfig              |  1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 59 ++++++++++++++++++++++++++-
 2 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 30ef3dc5dfb1..764256901d6a 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -17,6 +17,7 @@ config PINCTRL_MTK
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select EINT_MTK
+	select REGMAP_MMIO
 
 config PINCTRL_MTK_V2
 	tristate
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 1a977acd6883..65b1e3096183 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -9,6 +9,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
@@ -1057,6 +1058,60 @@ static int mtk_eint_init(struct mtk_pinctrl *pctl, struct platform_device *pdev)
 	return mtk_eint_do_init(pctl->eint, NULL);
 }
 
+static const struct regmap_config mtk_pctrl_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.use_raw_spinlock = true,
+};
+
+/*
+ * The EINT irq_chip reads a pin's level through this regmap from callbacks
+ * that run under the raw irq_desc lock, so the regmap has to use a raw
+ * spinlock too, which syscon's own does not. Register one with syscon for the
+ * node instead, so that any other user of the node shares its lock.
+ */
+static struct regmap *mtk_pctrl_syscon_regmap(struct device_node *np)
+{
+	struct regmap_config config = mtk_pctrl_regmap_config;
+	struct regmap *regmap;
+	struct resource res;
+	void __iomem *base;
+	int ret;
+
+	ret = of_address_to_resource(np, 0, &res);
+	if (ret)
+		return ERR_PTR(ret);
+
+	base = ioremap(res.start, resource_size(&res));
+	if (!base)
+		return ERR_PTR(-ENOMEM);
+
+	config.name = kasprintf(GFP_KERNEL, "%pOFn@%pa", np, &res.start);
+	if (!config.name) {
+		iounmap(base);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	config.max_register = resource_size(&res) - config.reg_stride;
+	regmap = regmap_init_mmio(NULL, base, &config);
+	kfree(config.name);
+	if (IS_ERR(regmap)) {
+		iounmap(base);
+		return regmap;
+	}
+
+	ret = of_syscon_register_regmap(np, regmap);
+	if (ret) {
+		regmap_exit(regmap);
+		iounmap(base);
+		/* An earlier probe, or another user of the node, got there first. */
+		return ret == -EEXIST ? syscon_node_to_regmap(np) : ERR_PTR(ret);
+	}
+
+	return regmap;
+}
+
 /* This is used as a common probe function */
 int mtk_pctrl_init(struct platform_device *pdev,
 		const struct mtk_pinctrl_devdata *data,
@@ -1076,7 +1131,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 
 	node = of_parse_phandle(np, "mediatek,pctl-regmap", 0);
 	if (node) {
-		pctl->regmap1 = syscon_node_to_regmap(node);
+		pctl->regmap1 = mtk_pctrl_syscon_regmap(node);
 		of_node_put(node);
 		if (IS_ERR(pctl->regmap1))
 			return PTR_ERR(pctl->regmap1);
@@ -1089,7 +1144,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	/* Only 8135 has two base addr, other SoCs have only one. */
 	node = of_parse_phandle(np, "mediatek,pctl-regmap", 1);
 	if (node) {
-		pctl->regmap2 = syscon_node_to_regmap(node);
+		pctl->regmap2 = mtk_pctrl_syscon_regmap(node);
 		of_node_put(node);
 		if (IS_ERR(pctl->regmap2))
 			return PTR_ERR(pctl->regmap2);

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260925-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-154d6225b977

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


