Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52D6D12D60
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 02:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIFozn1dLdf0C7nLDaLmVsjUKMTMdSphAW8shOvyaec=; b=L5ddTsOJTuKGQKuBLTjGTFxohV
	RwGuBk2gyiYUZ1tg7I0hEuu0jJ6vjkGbSJPk9DZmQRsCk7FrLESy1ut+IvJbE7P3xcbuBmJcjdhTR
	Nle9fbF+ROrLdyQREKx5CEEvUp3iM59+heEwNQ90wWQa9RIXoxQmbkSBNscqBd48qRU4R8dXDqOgp
	VFaXmY5xrRUAHKEzqf+IgdCrtQafu79OwzaWLvyKM3qiBd0WA1NrD9ZBWOcyuVYROIwtstg0aRAF5
	gGYR6XrxEPLDkoURaAKBkPH+GGJ2u1ndihaTGZWFniyLfLSzZKa7LfYBeZP9S7X4LM8f3yDbKVYU0
	PLirFePQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAKN7-0000000G9Ew-0eCf;
	Mon, 11 Nov 2024 02:41:45 +0000
Received: from mail-m17243.xmail.ntesmail.com ([45.195.17.243])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAKG6-0000000G8Jz-0Wjq;
	Mon, 11 Nov 2024 02:34:33 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 258a5863;
	Mon, 11 Nov 2024 10:34:24 +0800 (GMT+08:00)
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
	elaine.zhang@rock-chips.com
Subject: [PATCH v4 3/4] gpio: rockchip: support new version GPIO
Date: Mon, 11 Nov 2024 10:34:11 +0800
Message-Id: <20241111023412.3466161-4-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh9KTVZNHx5CGUxDGEtJHRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93191284be09d8kunm258a5863
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PyI6Pyo*LjIsGixIFQgPGDIw
	SiFPCitVSlVKTEhKSUJJT01OTU9NVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBQkxKNwY+
DKIM-Signature: a=rsa-sha256;
	b=ibkS0lHl3WAGovAqwt6I2QzJkr3o2LKQurdk4Z5wZAjREOzatBMVcF/dGwKkU/zSxY7pA1ywtJsqYzutoiDcEou7Ay18WndGAjDBqhbe1OllBtbv8F5z4jn5lUfTT10+LtL/tTl+AZV7ankSjYbdqY6DwhBZ5xv8NRgbMvmSVjY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=bIFozn1dLdf0C7nLDaLmVsjUKMTMdSphAW8shOvyaec=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_183430_469001_19C09838 
X-CRM114-Status: UNSURE (   8.51  )
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

Support the next version GPIO controller on SoCs like rk3576.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index f05b92e0e977..b7a43e492965 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -35,6 +35,7 @@
 #define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
 #define GPIO_TYPE_V2		(0x01000C2B)
 #define GPIO_TYPE_V2_1		(0x0101157C)
+#define GPIO_TYPE_V2_2		(0x010219C8)
 
 static const struct rockchip_gpio_regs gpio_regs_v1 = {
 	.port_dr = 0x00,
@@ -674,6 +675,7 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 		break;
 	case GPIO_TYPE_V2:
 	case GPIO_TYPE_V2_1:
+	case GPIO_TYPE_V2_2:
 		bank->gpio_regs = &gpio_regs_v2;
 		bank->gpio_type = GPIO_TYPE_V2;
 		bank->db_clk = of_clk_get(bank->of_node, 1);
-- 
2.34.1


