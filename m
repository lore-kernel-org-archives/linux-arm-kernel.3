Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D83D41D44
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 01:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3+qCrfZTihYEk4pDOtbMVILileo3xKIzptsJVcIneM=; b=rppqgKPYHhdXlnJmuO5OT5QUYx
	v74MS8B+chayf85VfxBJPu8l6ezftYhjhZjDL35CAXWJSP0wtwyXJIoDoYLXPNP9WTuY3Zxzw6cK4
	OZjk4TDa1cEN9J54o7eGuoWFOcymeQebFV8/nXd0PcCBfhs8bM0IZCVrAOo/KExTeqoUWDFZgUxoQ
	md1exMahAwwivXSWuoBKvJR9Ka0kNUAGBRqfenZAJLGlsQ7ITmNNCimnlOvCpt9vAn8FQwHV/6x6L
	21f9kloVJXrexVn6tzsslCoogBGabcJEYk31nsZ/qLlZISlZTEQxCkq/7GBvKaFtTl8AQKOQCbtqr
	gRMwjh/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAgAJ-00000001v0W-0MHx;
	Tue, 12 Nov 2024 01:57:59 +0000
Received: from mail-m11866.qiye.163.com ([115.236.118.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAg6l-00000001ubU-2lPP;
	Tue, 12 Nov 2024 01:54:21 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 275d3f1d;
	Tue, 12 Nov 2024 09:54:13 +0800 (GMT+08:00)
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
Subject: [PATCH v5 1/4] gpio: rockchip: explan the format of the GPIO version ID
Date: Tue, 12 Nov 2024 09:54:05 +0800
Message-Id: <20241112015408.3139996-2-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUkZHlZDGB0ZQ0gaGkhOGRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a931e14163509d8kunm275d3f1d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NQw6Sww5HDIoMBoWPysZSRpL
	Mw8aC0JVSlVKTEhKSExNT05PTkJIVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkpDTjcG
DKIM-Signature: a=rsa-sha256;
	b=f+N5aUGCj+VLxIOLvKP23n978ZTd+BlIfa0hCJ9vp5lR/8Zf/aiF7anhUIdCXdvaBUd3/3lj4o+EtKERejIfmr2T5G7zTzZUK1B4HBM3JgOzsQUvQo6J3/WY37/5j0uUHiyfKP86nDaa/YcS4hOTa0Ojl1Cv03hxjUi5yJkERaM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=W3+qCrfZTihYEk4pDOtbMVILileo3xKIzptsJVcIneM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_175420_213373_55C45287 
X-CRM114-Status: UNSURE (   8.47  )
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

Remove redundant comments and provide a detailed explanation of the
GPIO version ID.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpio/gpio-rockchip.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 365ab947983c..702e711f9c23 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -26,9 +26,15 @@
 #include "../pinctrl/core.h"
 #include "../pinctrl/pinctrl-rockchip.h"
 
+/*
+ * Version ID Register
+ * Bits [31:24] - Major Version
+ * Bits [23:16] - Minor Version
+ * Bits [15:0]  - Revision Number
+ */
 #define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
-#define GPIO_TYPE_V2		(0x01000C2B)  /* GPIO Version ID 0x01000C2B */
-#define GPIO_TYPE_V2_1		(0x0101157C)  /* GPIO Version ID 0x0101157C */
+#define GPIO_TYPE_V2		(0x01000C2B)
+#define GPIO_TYPE_V2_1		(0x0101157C)
 
 static const struct rockchip_gpio_regs gpio_regs_v1 = {
 	.port_dr = 0x00,
-- 
2.34.1


