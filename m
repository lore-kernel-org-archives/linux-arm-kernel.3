Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F76C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 02:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vb6sJAg24kLvIOpQde/RtAhZDpEGn6B9vU5177r2bYI=; b=ItEl+fGgNje6VMNOL16HzzjSIX
	owk4As/KDbAdAjUG//El5RzEK6T2vSVXdUUhYmmNrWtS124FzA/tHPYx3jFY8nBJ9j1b2V9oZ8eMa
	nA+7ddkuZS+P9BJN60pUCYLGeXsDHczKLXgG+P0pm59IyZFQOJsqgsjil/hAYsNCKWNFPva0TDigt
	N0pAt+WM54dzHwh6Pf1JJkL22UedLfbifPTu90HRuxjvcVNDrtKaXnQmAW5EaEo9iJo6MO6m4gNhm
	hUJYPrf3QGYALqkb6pUjC1Z9acJpxx/huNlrpPMkHcmGV09jFxFa1kcvRZbSztWqOJ6YVNxuktnIC
	hjMo7xxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHej-00000002r2x-11Yr;
	Tue, 04 Mar 2025 02:05:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHKX-00000002o1o-0FVL;
	Tue, 04 Mar 2025 01:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741052658;
	bh=iDVPebVtBVKbo8sc+q34EtLBvJPNOV2/Slk4+XhkzX8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dg2DSGE1mIWJMt5NqyrYikQxOSRhJbtg2lLdUOIBBbtbioR5Cws1qIsqEuBhUm7kK
	 a46shU/FL112y3h0HqvfS/psfgPryIV1oWpUNqNbo+2pHQZTOhDo1CIbHz6wZSQB/q
	 zaxPgTctZOgsS7VVmKz2pmjYNRP4xMDdBWZ2VA6FNjeojD6NdmOvns2Y34lBQb7UJH
	 s6WK+u9KZvkqEVFIyQt7nLbg8XTk3hyMz7UJJVYtUqzE8LVnKckHIQg5EJ94FhGhQ8
	 WGzS0qbCF2iDSHpH/IThdERfe4LUJ2wGaB6F/UAPECMzmB5vjPz8FfaA5c7jruCUPM
	 y9+2urszhPIMg==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 2DBB817E0E8D;
	Tue,  4 Mar 2025 02:44:18 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 04 Mar 2025 03:44:00 +0200
Subject: [PATCH v4 01/12] phy: Add HDMI configuration options
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-phy-sam-hdptx-bpc-v4-1-8657847c13f7@collabora.com>
References: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
In-Reply-To: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_174421_250451_AFAC5F83 
X-CRM114-Status: GOOD (  15.27  )
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

From: Sandor Yu <Sandor.yu@nxp.com>

Allow HDMI PHYs to be configured through the generic
functions through a custom structure added to the generic union.

The parameters added here are based on HDMI PHY
implementation practices.  The current set of parameters
should cover the potential users.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/d1cff6c03ec3732d2244022029245ab2d954d997.1734340233.git.Sandor.yu@nxp.com
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/linux/phy/phy-hdmi.h | 19 +++++++++++++++++++
 include/linux/phy/phy.h      |  7 ++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
new file mode 100644
index 0000000000000000000000000000000000000000..6a696922bc7f29af63d88646701b2c0fcee5c885
--- /dev/null
+++ b/include/linux/phy/phy-hdmi.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2022,2024 NXP
+ */
+
+#ifndef __PHY_HDMI_H_
+#define __PHY_HDMI_H_
+
+/**
+ * struct phy_configure_opts_hdmi - HDMI configuration set
+ * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
+ *
+ * This structure is used to represent the configuration state of a HDMI phy.
+ */
+struct phy_configure_opts_hdmi {
+	unsigned long long tmds_char_rate;
+};
+
+#endif /* __PHY_HDMI_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 03cd5bae92d3f189d739c453fe4c160dd2a5063e..4ac486b101fe4023b8f2a84e907e65a0ff0a5ede 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -17,6 +17,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <linux/phy/phy-dp.h>
+#include <linux/phy/phy-hdmi.h>
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
@@ -42,7 +43,8 @@ enum phy_mode {
 	PHY_MODE_MIPI_DPHY,
 	PHY_MODE_SATA,
 	PHY_MODE_LVDS,
-	PHY_MODE_DP
+	PHY_MODE_DP,
+	PHY_MODE_HDMI,
 };
 
 enum phy_media {
@@ -60,11 +62,14 @@ enum phy_media {
  *		the DisplayPort protocol.
  * @lvds:	Configuration set applicable for phys supporting
  *		the LVDS phy mode.
+ * @hdmi:	Configuration set applicable for phys supporting
+ *		the HDMI phy mode.
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
 	struct phy_configure_opts_dp		dp;
 	struct phy_configure_opts_lvds		lvds;
+	struct phy_configure_opts_hdmi		hdmi;
 };
 
 /**

-- 
2.48.1


