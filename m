Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C2FD5E12E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 11:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RsNzulXAZLkL2QafonCahbYbZr1u/QuXtoWJZpywhQ=; b=4Cta8Wbg+XMiZJCN8rASJ2TSUj
	JmQDYA58FN6PKspaSsciBFHvHPbMZSg82CJzIx26EJBaAebgERmy2eZt5gIqj5/HOc+e7bFlD4K3P
	g+5l5jet32MDY+mivCyrlbx1wMlOHL7LsY4geH2dXgyj2w/aHTHN53bGGaituUnwLglkYWNLYt+qu
	dzcKLEIcz4w4oyCHVUB3NiNelV5PLAOWkb4mwT1rrfheXZUXbJdZUbb7Fo6ZJQqHCQ7RxzMcE6PQA
	djsgsKTw6FrxSInbVxoC2krQFP//41OAUDLqCqlRpXPJEECN8wVD1IcWMMpJO3nP/29ls9ZoJE7f+
	vbTJHB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVT7D-000000056i3-3OFX;
	Tue, 16 Dec 2025 11:21:15 +0000
Received: from mail-m3272.qiye.163.com ([220.197.32.72])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVT79-000000056gb-0Rg9;
	Tue, 16 Dec 2025 11:21:13 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d6ee1f9c;
	Tue, 16 Dec 2025 19:21:00 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 5/7] gpio: rockchip: support new version GPIO
Date: Tue, 16 Dec 2025 19:20:51 +0800
Message-Id: <20251216112053.1927852-6-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b26e4640309d8kunm7ab62e1d2a7b350
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhpJS1YaGklNGBoaHh4aGhlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=SLGndVjrFy6UYS+hlEtYcoWaqn4QUTsMMMc/sj2xmBI2wEHCa2Lvk4X/3IWIfA3Lo568GHtcGTLVxPqrirJWDYqiotp4KZUU4o72/GvLEAKNF7UOqCWhSauOpe+D99SZYddl38vOB93tJY87f+vVLCOzFyABXoTvxSWhK5CWykc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=2RsNzulXAZLkL2QafonCahbYbZr1u/QuXtoWJZpywhQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_032111_681443_E84F38FF 
X-CRM114-Status: UNSURE (   8.62  )
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

Support the next version GPIO controller on SoCs like rv1126b.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-rockchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 47174eb3ba76..c3e831c6bcf1 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -36,6 +36,7 @@
 #define GPIO_TYPE_V2		(0x01000C2B)
 #define GPIO_TYPE_V2_1		(0x0101157C)
 #define GPIO_TYPE_V2_2		(0x010219C8)
+#define GPIO_TYPE_V2_6          (0x01063F6E)
 
 static const struct rockchip_gpio_regs gpio_regs_v1 = {
 	.port_dr = 0x00,
@@ -674,6 +675,7 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 	case GPIO_TYPE_V2:
 	case GPIO_TYPE_V2_1:
 	case GPIO_TYPE_V2_2:
+	case GPIO_TYPE_V2_6:
 		bank->gpio_regs = &gpio_regs_v2;
 		bank->gpio_type = GPIO_TYPE_V2;
 		bank->db_clk = of_clk_get(bank->of_node, 1);
-- 
2.34.1


