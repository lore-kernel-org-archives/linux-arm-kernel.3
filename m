Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BD1C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fLgnfIHz88SBOvR3oeszk2+OP9MQeppRO8i8Nr+mG8=; b=f+2gLZB5itVozzjlF/blf8uSQx
	KG0FlWjTP/A22f9BaFzLMNAjNFu/flzUfcutCmF2DYfRc0IjIZ8SI98FF1Y/1lIShXr2aa4FVa1n9
	VtmJUW58luhkecjTArVIydahmomqaEK1BTDmzMpXx4nKCwGXgDDpRb0OJ97utVH0kOlJlrkzMvznc
	sIgMX6Ki9MkSrHXPOJ+/na7rgp8fGYgYSwqt+1RPchyD69w1JNzwJPiUZxanVtkHBW92EvrWYIw3F
	RIcAZoJubioF7SZbj7A9KTEutz6LJ61eTlwxvRM2Q37i1QMZ6Hbu/WMcKg9nbJ+U/AVK40Pup18G3
	7L/Ps5Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HKm-00000007Ogb-3iEi;
	Wed, 23 Sep 2026 07:24:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HKl-00000007Ofz-1kTL;
	Wed, 23 Sep 2026 07:24:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C82CE43B60;
	Wed, 23 Sep 2026 07:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A12F5C2BCB8;
	Wed, 23 Sep 2026 07:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790148242;
	bh=Yyi0dnUJzZFsu3n5Q4Sx1ZVuAY4ijHrDfpKarQMVXtk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=brFuQ060ViymlB+6l9K6xBNSfM1OfCCVpjVjB5ZZnHi2MvIvP/84/tDCfdOZNfW2a
	 dowung1cgjuCbU4gi9bsf7pOsFO3zk+sBq4CEUv80r2w8QMExAybLYCqxdn1b2uGCm
	 8f/z+PuDZ4EX1Ggw/x82t3glsottQCQPxP1ZPPucWYCDuiP31fcoWe4/waQYrIIbCO
	 N5pcKI0jsxXD+libuNZ2tzIbPaBg6IWBRtYkyF/hfxuSeXA5JPlyWcMIrdotBdXVNE
	 QL4u86MnJOkXNzRo2w+clT6Ov3gtFIknDLR/Tx1oSVof+H3GeDkWAXApch7fTDHmpm
	 ff/Y4VfWOSQ7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEDCC982EA;
	Wed, 23 Sep 2026 07:24:02 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 23 Sep 2026 10:23:34 +0300
Subject: [PATCH 1/3] cpufreq: mediatek: add support for CPU speedbin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-6572-cpufreq-v1-1-41f7af6d6d1a@protonmail.com>
References: <20260923-6572-cpufreq-v1-0-41f7af6d6d1a@protonmail.com>
In-Reply-To: <20260923-6572-cpufreq-v1-0-41f7af6d6d1a@protonmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790148240; l=3928;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=8tS94U3qBY49lvfguXSecw1ZTRCCy8SxaUh/N0EXNSM=;
 b=GUglGD2ChmpxWy33le1togwI5locLZbOfUL2d63rF+2bFHVGo6eeNOMh4ujDuxgOTj5WYJ2Fr
 pXfvyLmrqiNClHhk/iqMkD4Y+xRZnUuUihx5rnaDPGh0rBlOQWgrot/
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

MediaTek SoCs are often released under the same marketing name, but with
different suffix for the speedbin. For example, mt6572m has 1 GHz limit,
mt6572a - 1.2 GHz, mt6572w - 1.4 GHz.

Add code to support per-cluster 'opp-supported-hw' property. The DT is
expected to pass a CPU speedbin using standard 'nvmem-cells' property
under the CPU node.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 50 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 052ca7cd2f4f..f15135b2898b 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -10,6 +10,7 @@
 #include <linux/cpumask.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -57,6 +58,7 @@ struct mtk_cpu_dvfs_info {
 	const struct mtk_cpufreq_platform_data *soc_data;
 	int vtrack_max;
 	bool ccifreq_bound;
+	int opp_token;
 };
 
 static struct platform_device *cpufreq_pdev;
@@ -381,6 +383,38 @@ static struct device *of_get_cci(struct device *cpu_dev)
 	return &pdev->dev;
 }
 
+static int mtk_cpu_parse_speedbin(struct mtk_cpu_dvfs_info *info, int cpu)
+{
+	struct device *cpu_dev = get_cpu_device(cpu);
+	struct dev_pm_opp_config config = {};
+	u32 val, opp_hw_ver;
+	int ret;
+
+	ret = nvmem_cell_read_variable_le_u32(cpu_dev, "speed_grade", &val);
+	if (ret) {
+		if (ret == -ENOENT)
+			/* speedbin is optional */
+			return 0;
+		return dev_err_probe(cpu_dev, ret, "cpu%d: failed to read speedbin\n", cpu);
+	}
+
+	/* Convert the raw value to a bitmask */
+	if (val >= 32)
+		return dev_err_probe(cpu_dev, -EINVAL,
+				     "cpu%d: invalid speedbin value %u\n", cpu, val);
+	opp_hw_ver = BIT(val);
+
+	config.supported_hw = &opp_hw_ver;
+	config.supported_hw_count = 1;
+
+	info->opp_token = dev_pm_opp_set_config(cpu_dev, &config);
+	if (info->opp_token < 0)
+		return dev_err_probe(cpu_dev, info->opp_token,
+				     "cpu%d: failed to set OPP config\n", cpu);
+
+	return 0;
+}
+
 static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 {
 	struct device *cpu_dev;
@@ -450,18 +484,22 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 		}
 	}
 
+	ret = mtk_cpu_parse_speedbin(info, cpu);
+	if (ret)
+		goto out_disable_sram_reg;
+
 	/* Get OPP-sharing information from "operating-points-v2" bindings */
 	ret = dev_pm_opp_of_get_sharing_cpus(cpu_dev, &info->cpus);
 	if (ret) {
 		dev_err_probe(cpu_dev, ret,
 			"cpu%d: failed to get OPP-sharing information\n", cpu);
-		goto out_disable_sram_reg;
+		goto out_free_speedbin;
 	}
 
 	ret = dev_pm_opp_of_cpumask_add_table(&info->cpus);
 	if (ret) {
 		dev_err_probe(cpu_dev, ret, "cpu%d: no OPP table\n", cpu);
-		goto out_disable_sram_reg;
+		goto out_free_speedbin;
 	}
 
 	ret = clk_prepare_enable(info->cpu_clk);
@@ -533,6 +571,10 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 out_free_opp_table:
 	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
 
+out_free_speedbin:
+	if (info->opp_token > 0)
+		dev_pm_opp_clear_config(info->opp_token);
+
 out_disable_sram_reg:
 	if (info->sram_reg)
 		regulator_disable(info->sram_reg);
@@ -573,6 +615,10 @@ static void mtk_cpu_dvfs_info_release(struct mtk_cpu_dvfs_info *info)
 	clk_disable_unprepare(info->inter_clk);
 	clk_put(info->inter_clk);
 	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
+
+	if (info->opp_token > 0)
+		dev_pm_opp_clear_config(info->opp_token);
+
 	dev_pm_opp_unregister_notifier(info->cpu_dev, &info->opp_nb);
 	if (info->soc_data->ccifreq_supported)
 		put_device(info->cci_dev);

-- 
2.55.0



