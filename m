Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB42CD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5dzyZdoNYPrbYjox1d8ot5pjOfMu81INeZUnHhBs1k=; b=tZDFjP/tjC3oZrUAsace6vdwqu
	toeZ+AhjH88CBRVHUboWKqAzEl+BVhug94Tanvif/SY6mg9tGQplGpKqLWeVJujfyIMX1IlNiR+7K
	q0ofkXcUkGy91GJQjHFZ0NCZ7bOUcpdgSgzAzS8xSkRjx5JGUVmeMiRBhdMqtcYh1D2Jjc+XfyEld
	ejXoY8aivsNkxItf+bk+LY624ymYtzgF4OpL6+w2aOZGQuLuCLfCtITiVJAUwI8MDboY8saRpoPFl
	2PDndTsEavj0Zxt8qNEjVDT1vgMKkrv+mjghjbZOtQptuYO0JvvKrCAlPyPKqFwfHUL5JCN2u/pZe
	20PXeClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4e1-0000000BEOA-277U;
	Fri, 12 Jun 2026 16:22:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4dt-0000000BE56-2nXE;
	Fri, 12 Jun 2026 16:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=dZvkEqj2L1ZPpLivSDqiR4gfg+XCsYE6jCjSEwlvw2M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZFD8yBzDMpurAyIVsb+2oXlRMxw3UZlDe5OdGZcSpwL5F66DdQ+mVQhekFbxUuqf7
	 MabLJkuDTIyptspkY/O+R/cDgl0v84T7DGChXJE74a9ovFPnttSil1HjGb4H8SbVyQ
	 Qb2Wxpbu7U2DG7cY1mGeeTO2fPnKtLfZsSQqvCRgGnTrZPj86E9lJoaaiKXz+QYObm
	 E2mMGW9HwlEIk0innZmTISeFHHVymg8JJu4uRhId7OFmBye2hmbSNOno6lzYNWxB3o
	 cRDouMyJw9QpmaLjyXb2b6zHHiP1HibujiGsB7ZwtRk1nxlHqo0bM+7rjR9Kh6Lf3/
	 vkqiay1T1+1hw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8AC9C17E1031;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D168E48003A; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:47 +0200
Subject: [PATCH v5 09/18] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-9-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=dZvkEqj2L1ZPpLivSDqiR4gfg+XCsYE6jCjSEwlvw2M=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiEMGk4SwAfqXerFfyOTNITIacyyEkHd2
 DWDlyXViE8r+IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qaTosQAJrlim+J0gxf52Vy86nkVzUminmVOO6ph5Ecp7r2F8u2o3LobXI+t4W+Kiuf8SxD0zK
 d12slzJ5epmSmoDuhRlDOBRf9mXlD8dVlZLKhvy9WgdvLsxAdvta+6OpMBghmjSUQ1Av+guS0ly
 8KnZI8UWgEPzs1/zF0BWvfuPeATQpwPfcSC9fUirYWHyUjpeWq+DC1zbNNObbaVsdUAa/KdF4Va
 Nft3p8I4h5l72C2MrxwICtsB5x70gA4AuX+RzY/BM6sB6411HmNpg1+DKn9PVe9Os68OWY0kio9
 NidJYyiMFQsA70mGrfGT6fXXeT1uJBU4dnEln5l+031KbUR7/GRjNUgzv9cbA6qMUYQIssbqUqi
 ClLjqyGmRklfqXkPT+RyFcAgwaqltOQcw5VaxQSxb0Tnu5lSrcf9IoYzCVMxrd4nJYSKPCN0y23
 axRPCPsYQVv8J7GyzqA2kHl/BHsTjXHt48V4O5bXv+wkI7S8foQUhY/lNRDWhWDJw6j6qVgPVGa
 sie3DyfFXVv+ePG1Na61HvDZYi4N/69Va+3ZUtLYtGBkZgTtN1jHAPH4JC9WHbuI2u5l0sO4rwX
 VDanvwXmcXaTg3mALWpRzCTR3KY83pozsHsEplbyfHDy9Nw+sIbDjWKoLQRuS5cM6eXuRNqOtC6
 m5b7VSnHwuunpGGDt33gstA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092201_899026_CE265DD6 
X-CRM114-Status: GOOD (  11.33  )
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

Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
with the existing helper macro.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 6d7ca11b308e..1bfc365e2b2c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
+#include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -75,7 +76,6 @@
 #define TRSV_LN2_MON_RX_CDR_DONE_OFFSET		0x1b84	/* trsv_reg06E1 */
 #define TRSV_LN2_MON_RX_CDR_LOCK_DONE		BIT(0)
 
-#define BIT_WRITEABLE_SHIFT			16
 #define PHY_AUX_DP_DATA_POL_NORMAL		0
 #define PHY_AUX_DP_DATA_POL_INVERT		1
 #define PHY_LANE_MUX_USB			0
@@ -104,8 +104,8 @@ struct rk_udphy_grf_reg {
 #define _RK_UDPHY_GEN_GRF_REG(offset, mask, disable, enable) \
 {\
 	offset, \
-	FIELD_PREP_CONST(mask, disable) | (mask << BIT_WRITEABLE_SHIFT), \
-	FIELD_PREP_CONST(mask, enable) | (mask << BIT_WRITEABLE_SHIFT), \
+	FIELD_PREP_WM16_CONST(mask, disable), \
+	FIELD_PREP_WM16_CONST(mask, enable), \
 }
 
 #define RK_UDPHY_GEN_GRF_REG(offset, bitend, bitstart, disable, enable) \

-- 
2.53.0


