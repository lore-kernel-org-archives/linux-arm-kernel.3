Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0083D41D45
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 01:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02V1JqzOhH1cFyOmJm73EPScEZkCm2Urre1Jqg9gWPc=; b=Ur1fiwTCP39fvIs1A+qvv98Pmi
	LQ2am53aPwmo7iR1I9dB9oFo4tJO1LJM5l103PzQ8vWVaWYayVrqP4TMw9FbEYUtTK56MPE+YGSOg
	FId1SkW4OZAN8x+F+JQlKhWGp97bdop8lq3fhlsmAWXBb3A2VYubsWSHXcbf0VYLAnp4JvdTDWkQf
	dSrMKmYPUlSRHupKcOrBNH7m2IFUB1nClXD2wZ26YWHBo6UP9U0USORV2ppIuzIXSOYgfVqhide4W
	rJiK7bzOo2N0sBRQrqMWRPh4oCw7AhaG/sjRxTK7uTU80Ysoqr+4sHSG3gsvw8Otv88IDmT31xYZZ
	q8h4D2Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAgC2-00000001vBQ-3BRN;
	Tue, 12 Nov 2024 01:59:46 +0000
Received: from mail-m12798.qiye.163.com ([115.236.127.98])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAg6l-00000001ubW-2mGu;
	Tue, 12 Nov 2024 01:54:22 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 275d3f25;
	Tue, 12 Nov 2024 09:54:14 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v5 2/4] gpio: rockchip: change the GPIO version judgment logic
Date: Tue, 12 Nov 2024 09:54:06 +0800
Message-Id: <20241112015408.3139996-3-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUtKTlZJSBkaGUweGh8eSB9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a931e141c3309d8kunm275d3f25
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRA6FQw6PzIqDho4LzRNSRoO
	GklPFDFVSlVKTEhKSExNT05NSk1LVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkhPTzcG
DKIM-Signature: a=rsa-sha256;
	b=F3MHuWUS3d7N2TMf+DeNGtdsPILAIO8YupTzq3wteHiaqL+olK0mBrcHFnMpuC24nnfkMFmf9vzEWW1Gxl+n7X97MPwUR/6DY09A7rFs6Uafk8hKCVfY94VFNAo01nyQCTTnin82eB7UOhofz6rkiNHw5IQs4jjmF1o0bZLIOtE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=02V1JqzOhH1cFyOmJm73EPScEZkCm2Urre1Jqg9gWPc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_175420_213372_8201BE7A 
X-CRM114-Status: UNSURE (   9.55  )
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

Have a list of valid IDs and default to -ENODEV.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpio/gpio-rockchip.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 702e711f9c23..49eaefeed8fa 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -667,8 +667,9 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 	clk_prepare_enable(bank->clk);
 	id = readl(bank->reg_base + gpio_regs_v2.version_id);
 
-	/* If not gpio v2, that is default to v1. */
-	if (id == GPIO_TYPE_V2 || id == GPIO_TYPE_V2_1) {
+	switch (id) {
+	case GPIO_TYPE_V2:
+	case GPIO_TYPE_V2_1:
 		bank->gpio_regs = &gpio_regs_v2;
 		bank->gpio_type = GPIO_TYPE_V2;
 		bank->db_clk = of_clk_get(bank->of_node, 1);
@@ -677,9 +678,14 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 			clk_disable_unprepare(bank->clk);
 			return -EINVAL;
 		}
-	} else {
+		break;
+	case GPIO_TYPE_V1:
 		bank->gpio_regs = &gpio_regs_v1;
 		bank->gpio_type = GPIO_TYPE_V1;
+		break;
+	default:
+		dev_err(bank->dev, "unsupported version ID: 0x%08x\n", id);
+		return -ENODEV;
 	}
 
 	return 0;
-- 
2.34.1


