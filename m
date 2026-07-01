Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA0AC44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcF2alzhbFzLrmQ0UUu9eSF9vRdKe3XpA+dPAQTgvS4=; b=GB+YiNrkhaL+LYE7gA8C14VzNn
	a2/86JzTamFOuM75nfN8Yh9bxdX3BYvw41q4/dwdj2ZIg+TSt+Dlqgf6qGt7zHXVPdrfGajh3yTKT
	EWjEI/jNitLMCrOTtYNPLQhA3A7J1AckzT2+bmhxrqwZlLuRDfg1nxm8pw7xVN+k50qgclyWNhc29
	/bwjzDH1RwDBdHxhtas2yfhX0UmehbBlbVNWg0aNo0qBCjlRp0rkoutE7z5FnPT2+KCvxeQ8uUxry
	VMY8taP/fAWb2WWo6QgAx3SqA0v7j6HcpAYYgSGedAfWCzV2iG5HqkjuHSZwMFfDtStx/FjRHSEha
	b19V0z9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4Tc-00000003AlM-1ySh;
	Wed, 01 Jul 2026 23:36:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TI-000000039rH-2SQA;
	Wed, 01 Jul 2026 23:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=6wzRNyqv6NlPOaqntAKWNGDB85tg/squK5vsA5C6di8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lAJSxeWaVTMYiBo/DPCAzy/uecaiFQeLlTUwS7vN7OcrBxPGJXrB30XotiDtWZzXz
	 rx2Oe7LEk4d44KsRDV4IMTPKN7Yt8+VLXUL5edBV+D4Giz9RTvRu1175iFA+FvHNzl
	 PltYYWTYEYZjy5J0iV8M+vTgvRnLPJkZG9vixDUIzbbM8nbn6b5Yw0RisT5UdZDhGz
	 PJUA06fyRlO393DXHb0P3z2MTz9JdN7U+PhEfmV3ENio/6YUteugkrNwB6WljNp+JR
	 ue2uS8eWtxwk7qY66Ka84GdLeicZe+2kfbZME+nQtZeTfhFfKj77MFJX29nM6S6wzs
	 lZ/U7rO1dQKvw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D51C17E35CB;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C2B0D480055; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:53 +0200
Subject: [PATCH v9 15/38] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-15-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=6wzRNyqv6NlPOaqntAKWNGDB85tg/squK5vsA5C6di8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFOldLD8T6CERw/4aNWu8uTfaE5BTUr5s
 goajTSHWwvK0YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qai7IP/A0DhfE1P1oHzeDWbRHYaozVOSBGenZuWLpfLJ21xD3xuEgPHDEP1iMjf7t59z3c+5T
 PwVVb3212+fZFwNBaciVdyn6EAwVchTI0kK5F0kkW065SQOWQzJ8CsS9oFVFwYkgD9DAXNPyUwL
 GFYCVsP3BsSQYrM7ggxxpj6Sv9SRFHVGoxObDie7wsQsbcu9noRD5Pq+1YbNBYeOzySplfdD5Uk
 7aWVzKz32RKrv4yMUcHq8UnNTd15QRD9OfXmDeqNHMJPLynwX6yUhZD7+1Myx9tkMlI8QPO+ZXP
 isw2IjE7CQKejOAp1b8zu7Hz5fi6NCG0ukE9XRH6ftKucjpXt1FffAzhHeRJ3dChyG3ajAh4Afd
 DHbpe2YHhpq6PMspwZGDQDj9+I+UUkoPAGndMngZdT10wN9YTJ3Tr3pIh7q43mxU6VR8EWVLE7c
 ojoJaLO97yTVWgTBTpulTit3CEwbAukvwGNbMXXp7HZNjWhte31dHSsfWajXCVKnJqYKZ7hGVcQ
 0laqkCtieB8ZIsNG4Nx9j9eguSNFXzE3x+hRaSzlb5y2N6L6e5Vg8O2ykO2wlZQYDmnKKyEF0wx
 QFGukVDrgEvzJ0XQuKDhPiqz+XIin0ldQlc35PVfBBgUd3jE50gZRlmZKhPg8NVmnyw/7Aq+0gj
 bAey8L+UgAkA16kLCdQIqZA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163600_969869_395DCE1A 
X-CRM114-Status: GOOD (  12.19  )
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
index ee7ec86bda9e..3124bcfed031 100644
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


