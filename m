Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2C8C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhBYvWOF+cgnaRqQxrykGk9N0o0tzWLbopxZBzBsMvw=; b=4uz3kZBF28r30EU9PszrCdSha+
	UuZ1XiZjgivfbevDXYg0yzo86eLGrPPor20P0dFfOqaMdf55KxOh3ILxWiuBoq6PmD5tcF8si4ljj
	hPB6ASwQjOQ7eHXiKCiMdkC1qx6x376YQtRpCcwHzuO/jfCE/s2PUb/2Ip945ujCCw4/WP1Rr2N/Z
	5J3gWFjeJT7Y5gC9Ff5Yl+yjnYvHLr2tF2mjfYEnJMsPDRGM53KdOKFXFd3G+NoSGPvkl33CqEn87
	3hhUxzYlnVNDWCuuG1s8onCc5Oe4kYeZMr+oaFAOQmNVMSoV4Jg3uNFQCt1zhxmNFexXIqJM8if1H
	BW7DyjrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiENS-00000005K7t-0S2y;
	Fri, 10 Jul 2026 16:47:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMt-00000005JBL-0akb;
	Fri, 10 Jul 2026 16:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=DGHAo+/yHQUfg6E5xfAgVJta4NhbAYv3HkIdYgaZpOw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KzDmIZX3putH81KgjXWlXnyxTi2mhribSwkvpPrfTXZyay5hP0ogBQjfQKKHzcr1F
	 SztVQwIgIV7Bgza4Uo5tNfMNmkLcLi6Bfc/hswibZ0CTvQow0wDSEbb3oyecxTdy9X
	 eYLCM6/aZhesSVYYP8jt2jgl87Qs09LEcbEQiNaowDVNGiGqcL9Zb3lVitsWQH9cJw
	 /s2G/P4aj9tY4J7xrhXLR085W8L7AC9hISkIvhmVpilbxc+TXYPU6nfnQ7YOmlk8HZ
	 aq98HM8m7jpuQlPnceMG59a8S6djSAnPZ2h80HLoOj93ADg3cDZ+gdFi+EAOoczY2d
	 fZsEKCdKz9/mQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A95A217E1011;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F0C85480052; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:52 +0200
Subject: [PATCH v12 14/36] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-14-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DGHAo+/yHQUfg6E5xfAgVJta4NhbAYv3HkIdYgaZpOw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdgOKSeEbxIsi3470NWElA7FdUKIvEWY5
 ZrBwD633kiOqIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qa5sUP/2j7hUIvErQWNgQwsgK0pHWY5ohB8sDZF/j6UKixIPAfdteYHBgHpmu6DyHM4azAbVv
 3961pX6v+q6qDrUy53mwShdk9mXOIyUcVQUYstBFYOLLjspzSOwhXQwLJa7pRC0DwXc4iPYdJMU
 TJB4Hlga8gdcVbH47aU4P0Dp2/lUtG/igaDj9WPlk0K5fQnPUlmR14/MmaScX3KTg2clPnXgC/O
 XcFh/Eiz3B18NTDbmsvGI/sl6nAThl9Ic90roqbG7lmNCMhuNeH1PhJCOEnqzMsGGKhCYnXL9xo
 NE3OB2EZPajs5GTGkepPrvfQuV/DE49kO2x5z2mRlcXWws+NEqS3x6Fc5e8EihAd34RhUbit0we
 81X/3nz1p/PFQ9PCwtLwvdLzllTWOCNlYQNHhdJooJbqrZKBmI9+G0pICOcuOAUuB8EhroeA6cc
 fCWlm9XpTGfnNaWmW0dtZNwzzOhVBLHmjLjsETR5crq8LZho5d3vO4y0oIpXz0fMkVPIKEKKmtx
 pikSp3yfUsCM7qHpu/t3/SQdwIuSUb0esDme/Ubd4Qc43KurqJbX1sZs5dRp1a4CoH6Rs0SygqF
 xO6I0TYUUwt550SumgG9GpAytyqDSLznQIIlFFsB1nblus7U09mSHbgEMB2cEmt6S54J65irExF
 Yn+gFZqgM9LlS61b9C9cwUg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_094627_411331_76CBFA9A 
X-CRM114-Status: GOOD (  11.86  )
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
index 7fb864a1486c..05593e98c16d 100644
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


