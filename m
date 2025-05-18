Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8502C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 22:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdJ8idrCkjaMANhXmNVJs+MC4XORO5o90qIWLcWpGNw=; b=WFtj7Fy9RIFXn6kZJlqsqD0ZXc
	4KvnU3o1WhscCjLiMDIf9hNW4wVoKU9ggkVAw2LjXk3B41E56fSNQwQqcCbUlupUHpDdhLhnbyzNJ
	Srzhet2qtmfa+uj/seSMUIyk8HQKV5LHt2M6HnvfmR/huE5gIJKq0OYHW/+aT5gLIECULh/2Hd3oI
	1YMQf1XfQKLchwHyjCK/3xB4sLJbFclE9Hw4UeyYZV+2zoQ3Q0hW96UjKpOtaRCvaHN4JU23BikT+
	VlTNNx6Hx4jrm3Zj53BRQohLjzGqq+m2ceFDb3yjO4v0gOiU0g0WXgGqO0eDkpuYPJSXZMFUj4Jfb
	r3uHLaJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmRs-00000007cer-3L2J;
	Sun, 18 May 2025 22:25:36 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmAJ-00000007aej-0rGE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 22:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1747606046; bh=XdJ8idrCkjaMANhXmNVJs+MC4XORO5o90qIWLcWpGNw=;
 b=FXWGIdb25UZAWT54VDLjs91gPi17m2EhR7YFdU5EKW66JNoELbvbqBljOdv9lt5bSkhtJOGLm
 OJOq+2iVTJK+tFr+nJbQGDPqN/sjf8HO4l+o/Cc0dxC7NNnBygB8BQ4e51nvIE8jEYjxLiMOp2u
 sol6IASFtLpasJtz8cIlsLsh34IUnvzFIVxMFzz23gQZT0DF3wy7W3KeH1HdTdRllSeCyKWjcVM
 s6cw6sEbYief1O6tuTyYlHm1C+p4G4Oc5ba1Gv2Vvq3zOfDoMTBthkETjoFoX914t2B9YShdOhV
 zzjy3xNDWPeyEtQOnI2qWUDP3SWeNrwM4s7iYLxEAwMA==
X-Forward-Email-ID: 682a5a1a78cae75fbd8d4697
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] pmdomain: rockchip: Add support for RK3528
Date: Sun, 18 May 2025 22:06:49 +0000
Message-ID: <20250518220707.669515-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518220707.669515-1-jonas@kwiboo.se>
References: <20250518220707.669515-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_150727_275559_3E8B243F 
X-CRM114-Status: GOOD (  12.01  )
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

Add configuration and power domains for RK3528 SoC.

Only PD_GPU can fully be powered down. PD_RKVDEC, PD_RKVENC, PD_VO and
PD_VPU are used by miscellaneous devices in RK3528.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/pmdomain/rockchip/pm-domains.c | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 4cce407bb1eb..242570c505fb 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -35,6 +35,7 @@
 #include <dt-bindings/power/rk3366-power.h>
 #include <dt-bindings/power/rk3368-power.h>
 #include <dt-bindings/power/rk3399-power.h>
+#include <dt-bindings/power/rockchip,rk3528-power.h>
 #include <dt-bindings/power/rockchip,rk3562-power.h>
 #include <dt-bindings/power/rk3568-power.h>
 #include <dt-bindings/power/rockchip,rk3576-power.h>
@@ -216,6 +217,9 @@ struct rockchip_pmu {
 #define DOMAIN_RK3399(name, pwr, status, req, wakeup)		\
 	DOMAIN(name, pwr, status, req, req, req, wakeup)
 
+#define DOMAIN_RK3528(name, pwr, req)		\
+	DOMAIN_M(name, pwr, pwr, req, req, req, false)
+
 #define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)		\
 	DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup, false)
 
@@ -1215,6 +1219,14 @@ static const struct rockchip_domain_info rk3399_pm_domains[] = {
 	[RK3399_PD_SDIOAUDIO]	= DOMAIN_RK3399("sdioaudio", BIT(31), BIT(31), BIT(29), true),
 };
 
+static const struct rockchip_domain_info rk3528_pm_domains[] = {
+	[RK3528_PD_GPU]		= DOMAIN_RK3528("gpu",  BIT(0), BIT(4)),
+	[RK3528_PD_RKVDEC]	= DOMAIN_RK3528("vdec",      0, BIT(5)),
+	[RK3528_PD_RKVENC]	= DOMAIN_RK3528("venc",      0, BIT(6)),
+	[RK3528_PD_VO]		= DOMAIN_RK3528("vo",        0, BIT(7)),
+	[RK3528_PD_VPU]		= DOMAIN_RK3528("vpu",       0, BIT(8)),
+};
+
 static const struct rockchip_domain_info rk3562_pm_domains[] = {
 					     /* name           pwr     req     g_mask  mem wakeup */
 	[RK3562_PD_GPU]		= DOMAIN_RK3562("gpu",         BIT(0), BIT(1), BIT(1), 0, false),
@@ -1428,6 +1440,17 @@ static const struct rockchip_pmu_info rk3399_pmu = {
 	.domain_info = rk3399_pm_domains,
 };
 
+static const struct rockchip_pmu_info rk3528_pmu = {
+	.pwr_offset = 0x1210,
+	.status_offset = 0x1230,
+	.req_offset = 0x1110,
+	.idle_offset = 0x1128,
+	.ack_offset = 0x1120,
+
+	.num_domains = ARRAY_SIZE(rk3528_pm_domains),
+	.domain_info = rk3528_pm_domains,
+};
+
 static const struct rockchip_pmu_info rk3562_pmu = {
 	.pwr_offset = 0x210,
 	.status_offset = 0x230,
@@ -1538,6 +1561,10 @@ static const struct of_device_id rockchip_pm_domain_dt_match[] = {
 		.compatible = "rockchip,rk3399-power-controller",
 		.data = (void *)&rk3399_pmu,
 	},
+	{
+		.compatible = "rockchip,rk3528-power-controller",
+		.data = (void *)&rk3528_pmu,
+	},
 	{
 		.compatible = "rockchip,rk3562-power-controller",
 		.data = (void *)&rk3562_pmu,
-- 
2.49.0


