Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F80C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOY8OCA7yMRp4k+zRTVl4g4rs61jeStX15FlPhvMWEo=; b=mFdR1k8nBcSpP/cc9x7Qa6dgGz
	NxcxktE/AsYZ0QZGyEpj8YoHjWm3/Xj2JeVCg/223DkqFuFvkUko8FqAVdF9Zsnssyy1TSnar+cH6
	bPKmsliPREA0r7vQ30Kv1DkH13mGdrA68aRBWGspBf3FdJb9jgsTwwkKIM0rQlvWvRY9sVmwe03xr
	kU9ORfdsIpg757iopM0BwdvQlKfBdQr3CqN30osfGHnbDtZkiEjkpsn8A/lzTiXTmMxxRIKdmrnff
	loBtldTV060eNyp8IWKTw/NcSToi/eXLpVeHMDd5kuSYWTTsIjhXg/bBtEVtWhe+wTum1NU5fYp5y
	rZ3jTSqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDbG-0000000Br3u-2ooB;
	Fri, 26 Jun 2026 20:56:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDZy-0000000BpfG-1Ixt;
	Fri, 26 Jun 2026 20:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=zUXIVNlYFpb7JLPZE2WGx1V+P1LbLJfUycXU2leOX4I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O76cntWNZNpRD+3HpQTIcWm+vnjpOiUnteGTXo2juM6HR/w00Tvht7LSNhnDrA+Ht
	 /Aewy6tXEgigOKKOJEpF+qrnQ0UmBmB/XeYi77jo5xzTHhD7O07/++7du9feTvNYjV
	 0Exqolz8jemtx9dnQjUNLz37ywiLhKIxSm9PbHnQo12txRUG1VivdyT1D1Dw+yCiy1
	 ElcfNqcmboMEyZT54HtjmV2CKaAGoEf26IcmkvtLlnqtJqc3RiIX33GNdStq66GznG
	 Gsm9S8u+GjI02neOWcmlIyB1eannGyyuh39KT6psj9cPuAbx2J88ykZt0y5NBEz65A
	 M8mRiSn6X3ksQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08D8D17E1576;
	Fri, 26 Jun 2026 22:55:03 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 214EC480052; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:08 +0200
Subject: [PATCH v8 15/29] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-15-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
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
 bh=zUXIVNlYFpb7JLPZE2WGx1V+P1LbLJfUycXU2leOX4I=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yUWotN674cF4uiIMplDCYnxjyc8HYtIE
 F4Y2LQ1qYWazIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qaw5cP/jiw83L7uKUSYt07hAhQmXqsBYt2mV5tzQATxag1uH30PYUKH/zGq7qnv8cvzakv0Yb
 /vXtXRWJwP7ey/2ZYMT1Ut/G3c9qNxwTAlPe49qTMFV92RcKsdnq4A7kzXvrw5lybSufNzUgpN+
 KZkbOGqvFcGOhbcZqe+n3obN/gqgQxGGXjv6dnj3IhlwY4FiF/TNJDsycsaxl5bpl5CFBUsKRGo
 KbRW3+gknmb9QAz8OPRE3CMdOiMhb5q32yeksBLvr5cezbbjdtUYWeYj0xDJWdojXf9pl1otQkI
 LXUsTI1uFIUjMIz1CQUxqDFZiAJjyLzyrRgrQPw6G9wcjYb6nqs9dKaDur2F/sXboG7SlCJJhb+
 lemZVP+XUM3UdEJXzsljPwFiefYMe2K4KYcCqq5lItOgC0Gg440GKxCYCz9HlhAIoKl3XhenFzW
 FDMvbDRrsCl6IQU7ijwJ9VOxMQhGV2FjZC8Dp5yntz/EhaUm1nMvi+UT0/HdEEDhmrolVmdxtv5
 j8k70E60aqTcvPlA5lovq6I7cjGN+xQmzLYdK7ah25zlxyaSck0ES3OEwmAbntEIYKKpDRIw5pK
 pyjpcwol8BqoJm3Gp+oqipM7NGJI2j/jyqI//6UmxsklEnJaTthH56MWUiR0m888a5+hzV+KmDr
 tnwasStjf5UwQcrbbsTkuHQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135514_559721_4FAE87DF 
X-CRM114-Status: GOOD (  11.22  )
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
index db1ad3c2a953..d8978cd22707 100644
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


