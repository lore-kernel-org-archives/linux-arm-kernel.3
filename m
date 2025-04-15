Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDFEC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 03:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsX/OZ9Y6342jW3iRyyPEkR8Rozlsp5w9FxvAaI8OGU=; b=yb7Q2gbEB2sI6L5i6Ig3TPspQj
	nKSvF6GLiLzvtZ9VPL5sSXo0a++BCzWzcaULqinRd86fy55j0XOfOvB68R1bkDPdwi1X4id/lBcul
	mT3+Qwhd1Z9UC2Az0qe9ObhA150nvjARAhAXV6w6NP04CaUZ7acOAazwil9xx+AZooWqqnfnRrhS3
	aTQq0aZmrkIfJBazNJck40X4TZC11MLWY9GKxXOJP7t7sVx4Y9sZSt2qvp6T5cLr4Q+LNWVXT9dM9
	d0MGo2fdUBCLxO3wUM0Yr4PjwlKuNzggcXsVGtaR1R4JMYrjltQ9RukD0c9PTd+Jv3JGtOa5OCYNb
	bRY2kvIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Wx1-00000004JJk-01gy;
	Tue, 15 Apr 2025 03:27:07 +0000
Received: from mail-m32102.qiye.163.com ([220.197.32.102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4WtS-00000004IvS-0k4E;
	Tue, 15 Apr 2025 03:23:27 +0000
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11e30c138;
	Tue, 15 Apr 2025 11:23:18 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-pm@vger.kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Peter Geis <pgwipeout@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v4 2/2] soc: rockchip: power-domain: add power domain support for rk3562
Date: Tue, 15 Apr 2025 11:23:14 +0800
Message-Id: <20250415032314.44997-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415032314.44997-1-kever.yang@rock-chips.com>
References: <20250415032314.44997-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHUJJVk9JTkNDSx5ISk5DS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a963779009103afkunm11e30c138
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NC46OSo6NjJDQxouETdPIxUq
	Gg0aCTxVSlVKTE9PTUNMT0tKSk5MVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQU5NT0k3Bg++
DKIM-Signature: a=rsa-sha256;
	b=jwIkThgEmw8bMh2cJnQw7eNERc667wZ2ihwre1kJ5vztUODhE7tJSA0mriBmtXfJ7PXffqHNuyPXQ0o/IqjmHjDowVac6Nd+o8lo25TNHp3hqnL5Kx6H8wpO4sE3d8SbCxutvlK9CSytRBLgGlpHsiypWCpQTKE11C6I0RunkaE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=GsX/OZ9Y6342jW3iRyyPEkR8Rozlsp5w9FxvAaI8OGU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_202326_381168_B74F43AC 
X-CRM114-Status: GOOD (  12.72  )
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

From: Finley Xiao <finley.xiao@rock-chips.com>

This driver is modified to support RK3562 SoC.
Add support to ungate clk.
Add support to shut down memory for rk3562.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v4:
- rebase to v6.15-rc1
- update patch author and Collect review tag

Changes in v3: None
Changes in v2:
- update the header after rename

 drivers/pmdomain/rockchip/pm-domains.c | 48 +++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 03bcf79a461f..4cce407bb1eb 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -2,7 +2,7 @@
 /*
  * Rockchip Generic power domain support.
  *
- * Copyright (c) 2015 ROCKCHIP, Co. Ltd.
+ * Copyright (c) 2015 Rockchip Electronics Co., Ltd.
  */
 
 #include <linux/arm-smccc.h>
@@ -35,6 +35,7 @@
 #include <dt-bindings/power/rk3366-power.h>
 #include <dt-bindings/power/rk3368-power.h>
 #include <dt-bindings/power/rk3399-power.h>
+#include <dt-bindings/power/rockchip,rk3562-power.h>
 #include <dt-bindings/power/rk3568-power.h>
 #include <dt-bindings/power/rockchip,rk3576-power.h>
 #include <dt-bindings/power/rk3588-power.h>
@@ -135,6 +136,20 @@ struct rockchip_pmu {
 	.active_wakeup = wakeup,			\
 }
 
+#define DOMAIN_M_G_SD(_name, pwr, status, req, idle, ack, g_mask, mem, wakeup, keepon)	\
+{							\
+	.name = _name,					\
+	.pwr_w_mask = (pwr) << 16,			\
+	.pwr_mask = (pwr),				\
+	.status_mask = (status),			\
+	.req_w_mask = (req) << 16,			\
+	.req_mask = (req),				\
+	.idle_mask = (idle),				\
+	.ack_mask = (ack),				\
+	.clk_ungate_mask = (g_mask),			\
+	.active_wakeup = wakeup,			\
+}
+
 #define DOMAIN_M_O_R(_name, p_offset, pwr, status, m_offset, m_status, r_status, r_offset, req, idle, ack, wakeup, regulator)	\
 {							\
 	.name = _name,					\
@@ -201,6 +216,9 @@ struct rockchip_pmu {
 #define DOMAIN_RK3399(name, pwr, status, req, wakeup)		\
 	DOMAIN(name, pwr, status, req, req, req, wakeup)
 
+#define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)		\
+	DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup, false)
+
 #define DOMAIN_RK3568(name, pwr, req, wakeup)		\
 	DOMAIN_M(name, pwr, pwr, req, req, req, wakeup)
 
@@ -1197,6 +1215,18 @@ static const struct rockchip_domain_info rk3399_pm_domains[] = {
 	[RK3399_PD_SDIOAUDIO]	= DOMAIN_RK3399("sdioaudio", BIT(31), BIT(31), BIT(29), true),
 };
 
+static const struct rockchip_domain_info rk3562_pm_domains[] = {
+					     /* name           pwr     req     g_mask  mem wakeup */
+	[RK3562_PD_GPU]		= DOMAIN_RK3562("gpu",         BIT(0), BIT(1), BIT(1), 0, false),
+	[RK3562_PD_NPU]		= DOMAIN_RK3562("npu",         BIT(1), BIT(2), BIT(2), 0, false),
+	[RK3562_PD_VDPU]	= DOMAIN_RK3562("vdpu",        BIT(2), BIT(6), BIT(6), 0, false),
+	[RK3562_PD_VEPU]	= DOMAIN_RK3562("vepu",        BIT(3), BIT(7), BIT(7) | BIT(3), 0, false),
+	[RK3562_PD_RGA]		= DOMAIN_RK3562("rga",         BIT(4), BIT(5), BIT(5) | BIT(4), 0, false),
+	[RK3562_PD_VI]		= DOMAIN_RK3562("vi",          BIT(5), BIT(3), BIT(3), 0, false),
+	[RK3562_PD_VO]		= DOMAIN_RK3562("vo",  BIT(6), BIT(4), BIT(4), 16, false),
+	[RK3562_PD_PHP]		= DOMAIN_RK3562("php",         BIT(7), BIT(8), BIT(8), 0, false),
+};
+
 static const struct rockchip_domain_info rk3568_pm_domains[] = {
 	[RK3568_PD_NPU]		= DOMAIN_RK3568("npu",  BIT(1), BIT(2),  false),
 	[RK3568_PD_GPU]		= DOMAIN_RK3568("gpu",  BIT(0), BIT(1),  false),
@@ -1398,6 +1428,18 @@ static const struct rockchip_pmu_info rk3399_pmu = {
 	.domain_info = rk3399_pm_domains,
 };
 
+static const struct rockchip_pmu_info rk3562_pmu = {
+	.pwr_offset = 0x210,
+	.status_offset = 0x230,
+	.req_offset = 0x110,
+	.idle_offset = 0x128,
+	.ack_offset = 0x120,
+	.clk_ungate_offset = 0x140,
+
+	.num_domains = ARRAY_SIZE(rk3562_pm_domains),
+	.domain_info = rk3562_pm_domains,
+};
+
 static const struct rockchip_pmu_info rk3568_pmu = {
 	.pwr_offset = 0xa0,
 	.status_offset = 0x98,
@@ -1496,6 +1538,10 @@ static const struct of_device_id rockchip_pm_domain_dt_match[] = {
 		.compatible = "rockchip,rk3399-power-controller",
 		.data = (void *)&rk3399_pmu,
 	},
+	{
+		.compatible = "rockchip,rk3562-power-controller",
+		.data = (void *)&rk3562_pmu,
+	},
 	{
 		.compatible = "rockchip,rk3568-power-controller",
 		.data = (void *)&rk3568_pmu,
-- 
2.25.1


