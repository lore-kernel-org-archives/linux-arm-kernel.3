Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EABECDB470
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWRbzxdnSj4BdDz/WXKzAiFK6OO87GC5++Fo2eCijmE=; b=vX0Um4uTvR2tE85vFvdPrz/eud
	9J0aNSeUffvATKJEBgx2wQxYCL1DEszyFa6l7G8yuHYjSoOxr87PgJTGyJdSzpgDfCzW/9b6voQsQ
	kseRI+KNuWE9HDD5SQXLYjQYWwL6wBVA64G7PDBb0yD0MxCBn8PKyFPB7tafnW5OsU8Zpr0VWk/XK
	NgMTgTWiCBjrJzWu5V4yWgaj5kHV512NcLUdu04lTFCmCOyYscJov7RUnddloOoAVeNOH1tdN3slT
	nrcZqSm61wJ5WcRfhBkem8IRcp421d7LLGLsZD6gTNEPiLjeTnFxbMeXHO7LtwyAtg0fYONr6mJ2K
	5pxfJgfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabAG-00000002ed6-3lmA;
	Fri, 19 Jun 2026 15:29:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9X-00000002dYk-2Msv;
	Fri, 19 Jun 2026 15:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=9kn1f+t/5GGJZ/kTWkBXhYGTLNor/RP1jpdd3Kej13A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I/xLdo8mkbGbtDz1l6207Kh1quxIj9Tye1ckVrXjNMSx6+/o6ygGfvXdH8SBzUzd8
	 LHPFD9F4GkI/xTWIaSoVfE3JcXCFPcbsx5rYqLl9nEOUbEx7PkLCVh7HP9BeYwllw7
	 WbVanDNM+uKuDzCC6tiIMYICsWLE2VMtLGXG7QA4x9InzaQZbaaTunSUQ6lUX2z8AA
	 dW5ZcrL75DuEE3PdsJo6OYpcCiIxzHkatqlavgG4LqGgXb8a7JsyJLEdcRqfbk/4YT
	 pWJYMTGbPkltDzfOfKepU1lunJFUL9QiriEpFbEsSnhortLaMOOagBnNqEZ6KG5fg6
	 0FFNakovqvX6A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D50A17E1576;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9AAE448004C; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:29:04 +0200
Subject: [PATCH v6 13/23] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-13-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
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
 bh=9kn1f+t/5GGJZ/kTWkBXhYGTLNor/RP1jpdd3Kej13A=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDgwSr5u04Hxwyf138blDNzIbPrEiv6ed
 CCIdnqzLe1Ux4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA4AAoJENju1/PI
 O/qaeqAQAKdR/4OimZHX48cqGz/7bQihDRl4Mpf9Aetig4pWa50oP5T2fJ/o3rVNSImxWM6A8Qr
 ozQ7RhIt1XiVXw9O1S2GtB+yT18UNE921pwqD2E8z0Ww8bELRuga4rYmx89iGIliF/HcKAjcN5Y
 4C9ZlzTWDVCh7GseWkCEA0qgAZTGbAfnee3vimm7Xlz4XfAQzGoP8t1UZqcn9th9asCd1U33fHd
 JiUSnC4Z8Mpnfxd3OdNynpT76xKKvQgjnp0bYSAl/xGP//G5XmsncczhwYC7fs2xOOqthguMdjl
 1nkYIiSnqUXNRfQ8D7aMJPeyO4vCaR4fUlP9w3PdlXaEW29kfARmAtKjSBOW/wtSLuGRgjgCZyc
 iNajVCh81czw/xTJA/Xb2uP8I2Pl8qXDPeCvg2FItklZZfhCpYyIyDLJW3lhJUac1H5Xofcptlm
 aKM6I0NixivX1iyS5aArY3XhgChFL9HjcoCjYxNXqVHdy5KVou+g/wwWUgnOD7fL5yNliTmcYRC
 eOKXzBxvTANJWikzyf0DbMKiRPaHuI66DrHFZhzyJftWnMaWgZK0/L/DKx294ESZzIHocoXtg4Z
 Yc52V0LmGrRtxPpuaNoh4xP6lQtohrdcGS5P5ojZ8bvfdjk1F9bpsqWRihqSc0KSkM5XlFu4hRD
 g6VLWxqOrKC1RsTwqXZUrIA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_082907_855515_F619F303 
X-CRM114-Status: GOOD (  11.38  )
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
index e8b2adecb08a..ceaf091b9101 100644
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


