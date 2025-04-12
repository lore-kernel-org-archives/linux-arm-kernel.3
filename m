Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505EEC369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 20:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ck4o/n3lpkxAXlPzedzjCk/JD+YtxzckBUpPpLxJb6o=; b=ti0jpeSYIK9zm+Yl8LEoVkMfji
	AQVwVlX1YYx5/6j1SQFdbMD53uCvk4q6k3CXHvPoO/g5paoKBzTvWo+avssUlnT4saz9yFIPEhC+j
	TnGYFaNprkgm0iDbR7K3HykeQcYxdWDrLciq6/eptNnU2oXuV6j6p4Iiugu6yUTJBnv8+otGN7Fa+
	ZIQdxA+4DJLijUELxVRXX6KOrmbkoeABLo4U/BDMyD+HHI4IiswCoIUe7b6e594mlVkLeh07y+VbY
	SHA+0obfZOrbi1xZ+gS9s2tJO+CNuOez22h4zgcmkio63iMMNNeOdWf6RjSqSklnaGXwx0OnbLfVr
	UOx35iuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hvn-0000000GSCV-44Z4;
	Sat, 12 Apr 2025 20:58:27 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hjT-0000000GRAz-49ix;
	Sat, 12 Apr 2025 20:45:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744490727; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LkB4JmyPpInWvLyByLSXnrVwUoHwkko0u0pgw7pRQuJ8cnCjbEUOJ0QByfp1DVNc87WcDJdTrMjvwo8H5qW2VpVBpJSWsVzj6R8om4Q30l/xCX+SBth+ukcVpfgfLtb8nc4UDysXMqumpybjoBdxeRZGQZxCobR+eaW0vXtS3KU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744490727; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ck4o/n3lpkxAXlPzedzjCk/JD+YtxzckBUpPpLxJb6o=; 
	b=Fzo2zKJFej2Ingwr3PPjnkPU4k2Tx7JeYwULVE9T7dUQInM5NcUNgiiYYNchX5aEEP6QRjH5WAr+2NFI+YpjblMo9DFui1YVEBcp+0sJkYh36Ew8f4qO92ZsCuoIJyzelTt8XS6bhYnUHDb7odjMJQGE/jII9Wblk1Nl1Nwd0M4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744490727;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=Ck4o/n3lpkxAXlPzedzjCk/JD+YtxzckBUpPpLxJb6o=;
	b=PPx1dBZwrk2/pChhtqkioqIHh5RKqd9VDJ4kk/HvIClo890Q6K1dNuh56IWPb7gc
	kiUJs3fF6Kw2hc9BMcgj1UeuW0RqTiv3p5yuVarNCaePg7fDCPrXxjid8mD7W4TBTVd
	eSCsikskvXbgOKRioptue4ke9eea40NL27KpXMJE=
Received: by mx.zohomail.com with SMTPS id 1744490726578169.77104371916073;
	Sat, 12 Apr 2025 13:45:26 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 12 Apr 2025 22:45:08 +0200
Subject: [PATCH v2] mmc: sdhci-of-dwcmshc: add PD workaround on RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-rk3576-emmc-fix-v2-1-830e653ad4f0@collabora.com>
X-B4-Tracking: v=1; b=H4sIANPQ+mcC/3WOyw6CMBREf4V07TW9ffBa+R+GRSlFGoFqi0Rj+
 Hdr3RldzmTOzDxJMN6aQOrsSbxZbbBujoLtMqIHNZ8M2C5qwiiTlGMB/sxlkYOZJg29vUPR6RJ
 VzgrBGInUxZtop8Zj89HeXG+xePmYpFXBgHbTZJc6W/M9SvAayTs82LA4/0hvVkzpv8MrAkInu
 ehEpQT28qDdOKrWebWP7e8viRW0/M1ySquSlS22HL/YZtu2F2uNYI0bAQAA
X-Change-ID: 20250317-rk3576-emmc-fix-7dc81a627422
To: Shawn Lin <shawn.lin@rock-chips.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, kernel@collabora.com, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_134544_079797_E968AC96 
X-CRM114-Status: GOOD (  22.84  )
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

RK3576's power domains have a peculiar problem where the PD_NVM
power domain, of which the sdhci controller is a part, seemingly does
not have idempotent disable/enable. The end effect is that if PD_NVM
gets turned off by the generic power domain logic because all the
devices depending on it are suspended, then the next time the sdhci
device is unsuspended, it'll hang the SoC as soon as it tries accessing
the CQHCI registers.

RK3576's UFS support needed a new dev_pm_genpd_rpm_always_on function
added to the generic power domains API to handle what appears to be a
similar hardware issue.

Use this new function to ask for the same treatment in the sdhci
controller by giving rk3576 its own platform data with its own postinit
function. The benefit of doing this instead of marking the power domains
always on in the power domain core is that we only do this if we know
the platform we're running on actually uses the sdhci controller. For
others, keeping PD_NVM always on would be a waste, as they won't run
into this specific issue. The only other IP in PD_NVM that could be
affected is FSPI0. If it gets a mainline driver, it will probably want
to do the same thing.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v2:
- Rewrite patch to use dev_pm_genpd_rpm_always_on in sdhci driver
  instead, after Ulf Hansson made me aware of its existence
- Link to v1: https://lore.kernel.org/r/20250408-rk3576-emmc-fix-v1-1-3009828b1b31@collabora.com
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 39 +++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index 09b9ab15e4995f0bddf57dd309c010c849be40d9..a00aec05eff2da8197cc64690ba9665be756e54a 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/sizes.h>
@@ -745,6 +746,28 @@ static void dwcmshc_rk35xx_postinit(struct sdhci_host *host, struct dwcmshc_priv
 	}
 }
 
+static void dwcmshc_rk3576_postinit(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
+{
+	struct device *dev = mmc_dev(host->mmc);
+	int ret;
+
+	/*
+	 * This works around what appears to be a silicon bug, which makes the
+	 * PD_NVM power domain, which the sdhci controller on the RK3576 is in,
+	 * never come back the same way once it's turned off once. This can
+	 * happen during early kernel boot if no driver is using either PD_NVM
+	 * or its child power domain PD_SDGMAC for a short moment, leading to it
+	 * being turned off to save power. By keeping it on, sdhci suspending
+	 * won't lead to PD_NVM becoming a candidate for getting turned off.
+	 */
+	ret = dev_pm_genpd_rpm_always_on(dev, true);
+	if (ret && ret != -EOPNOTSUPP)
+		dev_warn(dev, "failed to set PD rpm always on, SoC may hang later: %pe\n",
+			 ERR_PTR(ret));
+
+	dwcmshc_rk35xx_postinit(host, dwc_priv);
+}
+
 static int th1520_execute_tuning(struct sdhci_host *host, u32 opcode)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -1176,6 +1199,18 @@ static const struct dwcmshc_pltfm_data sdhci_dwcmshc_rk35xx_pdata = {
 	.postinit = dwcmshc_rk35xx_postinit,
 };
 
+static const struct dwcmshc_pltfm_data sdhci_dwcmshc_rk3576_pdata = {
+	.pdata = {
+		.ops = &sdhci_dwcmshc_rk35xx_ops,
+		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
+			  SDHCI_QUIRK_BROKEN_TIMEOUT_VAL,
+		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN |
+			   SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN,
+	},
+	.init = dwcmshc_rk35xx_init,
+	.postinit = dwcmshc_rk3576_postinit,
+};
+
 static const struct dwcmshc_pltfm_data sdhci_dwcmshc_th1520_pdata = {
 	.pdata = {
 		.ops = &sdhci_dwcmshc_th1520_ops,
@@ -1274,6 +1309,10 @@ static const struct of_device_id sdhci_dwcmshc_dt_ids[] = {
 		.compatible = "rockchip,rk3588-dwcmshc",
 		.data = &sdhci_dwcmshc_rk35xx_pdata,
 	},
+	{
+		.compatible = "rockchip,rk3576-dwcmshc",
+		.data = &sdhci_dwcmshc_rk3576_pdata,
+	},
 	{
 		.compatible = "rockchip,rk3568-dwcmshc",
 		.data = &sdhci_dwcmshc_rk35xx_pdata,

---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20250317-rk3576-emmc-fix-7dc81a627422

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


