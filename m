Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CF9C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKX8ERULlKOlqmEzPMDQ7tcuj/pXzM/HFpRfsyeTQqQ=; b=r+bw2l7iiZ2Eu28sIHWn0HskG+
	E9Oe0S3/gf0AC6z4rvw4bjGzZRSPjzysBC7jad/dmrwqJBrI9+sLNZl2Z+fCrQ2RZlcdN1HxlJRNx
	FLFz2gYCTDQ/Mfh59ode3anGaGTULRAnVgxEpDkikurpsI9XVsCZaNsbATVUa0mXeoiC8JgWYcg/E
	X1MwJGG4KCE3Gf4bLLf4PY7JwtoqS5C3brEe17MS9qnj4DrQj1cs1YsW4s29B2imWDtmlpWb2Uo8B
	BQVmXYmjGtXcPkW9UQ3MEE/fnbXVX514g0JsAjj85y3MLsIZiUDAhRHAYkHNdc95ilHb81Ts4nFqA
	MAzMohCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnc59-00000007Bf8-1HjB;
	Thu, 27 Feb 2025 11:29:35 +0000
Received: from mail-m1973192.qiye.163.com ([220.197.31.92])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbd0-000000074iX-0NwM;
	Thu, 27 Feb 2025 11:00:32 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c6596ac9;
	Thu, 27 Feb 2025 19:00:26 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-pm@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v3 2/2] soc: rockchip: power-domain: add power domain support for rk3562
Date: Thu, 27 Feb 2025 18:59:57 +0800
Message-Id: <20250227105957.2341107-3-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227105957.2341107-1-kever.yang@rock-chips.com>
References: <20250227105957.2341107-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk0ZQ1YaT00dSx8eGU5OT0hWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9547109f3203afkunmc6596ac9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRw6NBw*KTINTg0BAiICOTIa
	EhwKCTVVSlVKTE9LTU5PS0lMTUJCVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPT0lMNwY+
DKIM-Signature: a=rsa-sha256;
	b=Txix2qS21u7XOR6rtQdlq1PXcupaV8OhxHDt0ZzGNQe0tZU/WaBCglnB5ST5JX1Ve1TCtvJXSNtVhRWCUfM8kDyY+cX7ysamMjFWNtShxyDQnerEM8Cv/sIEgWJxiVhFl0nhtU12FHeEjQrXiNkcHhGWkW55L3CUfabm6PWVFbI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=DKX8ERULlKOlqmEzPMDQ7tcuj/pXzM/HFpRfsyeTQqQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_030030_334688_66243EC8 
X-CRM114-Status: GOOD (  12.97  )
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

This driver is modified to support RK3562 SoC.
Add support to ungate clk.
Add support to shut down memory for rk3562.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v3: None
Changes in v2:
- update the header name

 drivers/pmdomain/rockchip/pm-domains.c | 48 +++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index cb0f93800138..d05ec0a009a0 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -2,7 +2,7 @@
 /*
  * Rockchip Generic power domain support.
  *
- * Copyright (c) 2015 ROCKCHIP, Co. Ltd.
+ * Copyright (c) 2015 Rockchip Electronics Co., Ltd.
  */
 
 #include <linux/io.h>
@@ -32,6 +32,7 @@
 #include <dt-bindings/power/rk3366-power.h>
 #include <dt-bindings/power/rk3368-power.h>
 #include <dt-bindings/power/rk3399-power.h>
+#include <dt-bindings/power/rockchip,rk3562-power.h>
 #include <dt-bindings/power/rk3568-power.h>
 #include <dt-bindings/power/rockchip,rk3576-power.h>
 #include <dt-bindings/power/rk3588-power.h>
@@ -129,6 +130,20 @@ struct rockchip_pmu {
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
 #define DOMAIN_M_O_R(_name, p_offset, pwr, status, m_offset, m_status, r_status, r_offset, req, idle, ack, wakeup)	\
 {							\
 	.name = _name,					\
@@ -194,6 +209,9 @@ struct rockchip_pmu {
 #define DOMAIN_RK3399(name, pwr, status, req, wakeup)		\
 	DOMAIN(name, pwr, status, req, req, req, wakeup)
 
+#define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)		\
+	DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup, false)
+
 #define DOMAIN_RK3568(name, pwr, req, wakeup)		\
 	DOMAIN_M(name, pwr, pwr, req, req, req, wakeup)
 
@@ -1130,6 +1148,18 @@ static const struct rockchip_domain_info rk3399_pm_domains[] = {
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
@@ -1331,6 +1361,18 @@ static const struct rockchip_pmu_info rk3399_pmu = {
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
@@ -1429,6 +1471,10 @@ static const struct of_device_id rockchip_pm_domain_dt_match[] = {
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


