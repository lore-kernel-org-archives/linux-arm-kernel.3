Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18635C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhBYvWOF+cgnaRqQxrykGk9N0o0tzWLbopxZBzBsMvw=; b=LzdqULQ2/+pcpdMCVHgnJvFqbf
	QsfZ5xiWFb9QNFvIw7EfxAbjUSwGhH+hTRKo3vMavw5mp3K4R3Xe/Jnlz5bSKafkCd2K+5q8rHKxY
	lDhPYGdSNNRRBkj8iPhj35fEP+/H/8lglQ6Cz2uqcYzxoFJ+8gpNs2jasBjGVho3aEd50ujHOx7r6
	3z2YYiFiFWJWVdolCS8WhnUx1gYcxk9S5bNbky2Iulna2w98pCBluEUYESwmIJtnkySkE+UFMJlN2
	4lFNepeyUWdbMnSSrlyLxwyf+JnDdOl/yijMBKOa+gmKP8UCIRhb5oUQY+/3CTQMFiG9I0YXr2K8M
	hwmyuPXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOl-00000007ePp-3lRB;
	Fri, 03 Jul 2026 18:13:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOT-00000007djF-2gfA;
	Fri, 03 Jul 2026 18:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=DGHAo+/yHQUfg6E5xfAgVJta4NhbAYv3HkIdYgaZpOw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vy26iyeXuWWY8DppG1tU/dRVKHj/f/aiH2ZiBOn4fqaEbfrKGPKKvMpLt2JB38Gwf
	 ESPEh14kTAOtXYRFNHVtQEFS/zoquT7NEbdpk8ryG0P3o6vW8yDWNq6tlQrpi6cSgn
	 w3YkZ2vObUfJiooEEumpxvxMsVYtN3aLAKeDUKfiFgP/ETebfiNWHNCu4g9W/RVC1T
	 1duc6uXkDzZ3/4d+W7SuwZorIHMvHVW8HIYT0Pv4PUxUpJBwH9yOypI9dNj7vg7gDx
	 RRVcnht26piLen+T2FkRK++8393+HL8Vd0UUvXcGBxeO9RGG0hUhYWD3m4DpamWZJi
	 P4smxxxkV0S3g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6477D17E1507;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8E386480052; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:30 +0200
Subject: [PATCH v10 14/36] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-14-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8tM07eARrqQz8p2B9ZHwb7dMJrEPtio6
 6dbHB5yWHZOWokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaN0UP/0r7lnI0b44hAUCGb34MvhiRZeUKEa5au/l2LwS8v0SgnH0vyZDr2UkpT8taAtdpw15
 8qXLrqkxVWbqiy77fy10PO4tx0GI4MqVOCmZq687p9Kk2XdoDXQ5h7r7moRV2V4VqN27FTitxtA
 6HKtBQmTlpm2DAbJQNyVpKUcXkoiTdqx+9NvnaoUWaGi4xddviH8nxVyMUBtfqVKnDD2unrVqpd
 ZsD123aFNQBlwfZ/YuehxowEnOD1k9BlGfuet+O0k8z1HKKCG/TGwJ4kUbpfk/x7SVHE6gXmXX0
 9Rr55gyBxrCevN8c+K+JR1fkxhjRkSULAhTuYlyNGoyipj5QIfPNjDV2P1Jkf6Ys1ybP2ToRD41
 q9X4vne5BIMt51cS0PxZWblzaQeq4TCdL8QZTRe6Yh2HBYFNDWrCBb+xPKvDhiCzg9BfzQ9CBSz
 /ipjbCJI5HhVE1zWBmK/KuDZb2uB+0ut745A1lbeoztGFsaOBDxEHhwqJykdxM/dH1rRE3fSSzW
 wy03v+JyFcdZkse2JlEJAm+GPMYunk+udOibwfoccEANLzy7R9GyMXfHc9F7rYKNPEVWo4+VjHa
 tiFbTb44uFSLPoIJ3oRV2nSHMn+LxzHpYIpqLmHmQyg8C1q0AqeqhihEJUwjE65qA1BB+U7ap1i
 Ekq1llAEvMK/uiaxKlSIq8Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_111341_868377_F50EF932 
X-CRM114-Status: GOOD (  11.70  )
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


