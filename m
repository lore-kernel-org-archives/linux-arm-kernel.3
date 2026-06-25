Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A318CDE00D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48L6z5FOc/EIT3OjaURvcT8dESfUwG2dHEzSwEtbL6s=; b=wCn1Rqd2HxmXtNZ0zQ+BYSMql5
	3nML9/7Age4zVlvjAWCLL5avcBcdMF3I1Ovupl9/kyhHIARJcfVI4kmhSH2DRvKZhhd8n/A1Dfa//
	U5ny8yPVxXIHRwas6qpxkSD6qgx+CuC0UrInkgl0+2U1vg5Y6cVwTLImSWXTpzJnh8MD/QckJYTCy
	3yHHS2IlTcwMChop/egRn+TOjMqbdHon24oLh8uXp3qjgmcL5JwemZpIECk5vmU+kW3Co1xIWigEA
	xWCdWtX0pSqdn2TxEG25zneAwl1KTcqH5SukClmLQonvOdhXsHrEyKCTO96inhOTF0Bs1/yCMpm7S
	y/1hN42w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco4O-00000009aud-3Evr;
	Thu, 25 Jun 2026 17:40:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3K-00000009ZYK-1ccq;
	Thu, 25 Jun 2026 17:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=BKK0WOp1c+S2G4HJEwDSlIDRpU5wJfnkasC5i07zsD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A6rRNuxictVazFQYw5Rv1pKhe8X37t12JVXwjBvsH7kEkmSOKu7AcXArDq3g+fjds
	 0wEikdAhAFviBThfrrUaUhiNNwzw/wUcMX3MbfHO2MOlvbHVO6mu68AhfDg1ujBDX/
	 95FiJbg4J9ZXWrtmLCmlttP6XlJq0hJczz6bHXAc+8P2EM9bFZE1jBb3H9/TsXTYXq
	 g14mkeusSNMsCgi0aA9iW15saEuD4QBfT8gy0z9TCmoWhdd3R3Zu23mliGSTs7SUqP
	 BxBQwblCPNeA6SRUvdxdzD0vQmay/9xx07kBIkWRNsF5unrDv7cLHHns8wwILxOith
	 mnurrL5O8rxgg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E88E417E155B;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0F46C480052; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:42 +0200
Subject: [PATCH v7 15/27] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-15-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
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
 bh=BKK0WOp1c+S2G4HJEwDSlIDRpU5wJfnkasC5i07zsD4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9t9AGXQpTRfpaMuCI49nw3XYJxHCsuz2
 XPal/NGKv4jm4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaU5UP/2SVikDFbqwZ+2af+dQucPhZeosARHSOhCUB+rHosxc/r5VM0yidQ5vbYLnNYELpMZa
 gWJQTG1TedYeL8VPDW/PEI1rUsdOBYYpQYX8tZxttrzLlJ3mHNwXOI+CdPR0XikaVsK88qwznda
 nBtUgdWDapVp2YN9jfJz/GDN517yZ/zgEeWV1lBF+IPImH0YR2cNpimq+WdSaTfwC5vIbe4sgbG
 iW82OZsW/QfCHQALypsentHARXfSyjQKyOlmSzl3nqJVegB5KcxbFgRWg9trf7aXLAem18QXeDZ
 xKceloprnmzSXaR+3OROg3Uo0lyEbIUd8U+JD0V/qTrR5kUuL2YYdJyyjFSvTStNmU4Om0saLG9
 SigHkeVOOrzoPvBrrYHHMbKKtdycZkXzXm57G6siNBwtAXuLGSY82AN3HuZ6YtujgBHfqLldN/C
 /CMKW5q+KdbSXeXXz0GewI3BIczkcVacjDYpTNiCrJ7KwNukCsijc7TJFwcJ4Lq4IAkda/X7sWj
 0Zo/37TikuMNAh99UaaYoxA7EeZBFJDx1ceMifW17h5+WMHs1ViV0gMnRLcIhJfWajl0qEMAEl4
 0it/TUTYzmleJoMl6QoMHcF/AqGgGeMSBi8JkQkQfAHfwpNqlhUhf926L7qtBe/w0WHfMNZ9wMg
 LXC3M0XJBzP3U9faGQNcjIA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103950_605064_DDA4346C 
X-CRM114-Status: GOOD (  11.61  )
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
index 6ec9ab9d1e64..1bae8172d1fe 100644
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


