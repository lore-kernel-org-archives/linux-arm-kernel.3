Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4FEF588C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRNCe8H080nTyo4ygPdm/hvcO1aiFjBZy2NBEMwQlck=; b=Meh2xm9iXBkMNilp7qT3Ud+EH2
	fqxfsC0W454Ys61V3qsYt13F8kfR9KBxv8HW6Y+UlEcPbaOtaAQPNxjSyg4kLyryPkwwMm2jK1dF9
	lGKbh5wOFrCXkiLj8gz0Q1EW2zwKkH920I0mx1Sgi56F43RdWDX0o2n8Lsspas7GiGkv04l16suxV
	m2AlBkyf3XV8CWOOd5R+JZ+kiQ5uUPe1v0VQvL2w6crkVE7CSX60nxQiIyIIXMqXqnr+iOXC5q2AZ
	5qWIphKPM1yGEoGYwIJRZ1lwnUhYEmmr9jyVwzScpVReZsXe67CjPT2epr46Kr0Bvloo7bZAvwVKz
	VlDXgwGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoTb-00000006xt9-438X;
	Mon, 20 Apr 2026 13:15:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoTZ-00000006xsJ-0svi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 13:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F1B744507;
	Mon, 20 Apr 2026 13:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45751C2BCB7;
	Mon, 20 Apr 2026 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776690944;
	bh=nbtEepHGcKjFocf8FsJ2bVcEcjjJDHtrZnTX6JgzQFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HumKejWe7qIhwPaC0X4XqES8bxWuB5nSPYAkQJQqcjo2p/7Rmz1rmBiNc7AfEgAa3
	 4WLsdGmQBSwXWyk19+eOmNF8LWcvumLQYly89ehv+v4IDGlNwFze4FsFs++i6T/Ati
	 u8vYH0yJ2PncMt0iEY+zGvrploArpUfp38VYXqczqk6O8efuTWOPq0b3kblTNf3gZr
	 mZskCmdVoyGmCc3jghGsAIvV1kxQ0fo2oQnuXF0uQHcAXOljmON6T5NurRd11KnLc7
	 GJUWqP1oXTUDBy7utgWraLGy28Eh1uXVBF5tR+ZLUoMwGzTfmkrzKtTT4Rjuax8hXO
	 g3aG1iDZLPWwQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Simon Horman <horms@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	thierry.reding@gmail.com,
	vbhadram@nvidia.com,
	ruppala@nvidia.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18] net: stmmac: Fix PTP ref clock for Tegra234
Date: Mon, 20 Apr 2026 09:07:48 -0400
Message-ID: <20260420131539.986432-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420131539.986432-1-sashal@kernel.org>
References: <20260420131539.986432-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.23
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_061545_289397_A5A18071 
X-CRM114-Status: GOOD (  17.61  )
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

From: Jon Hunter <jonathanh@nvidia.com>

[ Upstream commit 1345e9f4e3f3bc7d8a0a2138ae29e205a857a555 ]

Since commit 030ce919e114 ("net: stmmac: make sure that ptp_rate is not
0 before configuring timestamping") was added the following error is
observed on Tegra234:

 ERR KERN tegra-mgbe 6800000.ethernet eth0: Invalid PTP clock rate
 WARNING KERN tegra-mgbe 6800000.ethernet eth0: PTP init failed

It turns out that the Tegra234 device-tree binding defines the PTP ref
clock name as 'ptp-ref' and not 'ptp_ref' and the above commit now
exposes this and that the PTP clock is not configured correctly.

In order to update device-tree to use the correct 'ptp_ref' name, update
the Tegra MGBE driver to use 'ptp_ref' by default and fallback to using
'ptp-ref' if this clock name is present.

Fixes: d8ca113724e7 ("net: stmmac: tegra: Add MGBE support")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Link: https://patch.msgid.link/20260401102941.17466-2-jonathanh@nvidia.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Error: Failed to generate final synthesis

 .../net/ethernet/stmicro/stmmac/dwmac-tegra.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
index d765acbe37548..21a0a11fc0118 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
@@ -9,7 +9,7 @@
 #include "stmmac_platform.h"
 
 static const char *const mgbe_clks[] = {
-	"rx-pcs", "tx", "tx-pcs", "mac-divider", "mac", "mgbe", "ptp-ref", "mac"
+	"rx-pcs", "tx", "tx-pcs", "mac-divider", "mac", "mgbe", "ptp_ref", "mac"
 };
 
 struct tegra_mgbe {
@@ -215,6 +215,7 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat;
 	struct stmmac_resources res;
+	bool use_legacy_ptp = false;
 	struct tegra_mgbe *mgbe;
 	int irq, err, i;
 	u32 value;
@@ -257,9 +258,23 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
 	if (!mgbe->clks)
 		return -ENOMEM;
 
-	for (i = 0; i <  ARRAY_SIZE(mgbe_clks); i++)
+	/* Older device-trees use 'ptp-ref' rather than 'ptp_ref'.
+	 * Fall back when the legacy name is present.
+	 */
+	if (of_property_match_string(pdev->dev.of_node, "clock-names",
+				     "ptp-ref") >= 0)
+		use_legacy_ptp = true;
+
+	for (i = 0; i < ARRAY_SIZE(mgbe_clks); i++) {
 		mgbe->clks[i].id = mgbe_clks[i];
 
+		if (use_legacy_ptp && !strcmp(mgbe_clks[i], "ptp_ref")) {
+			dev_warn(mgbe->dev,
+				 "Device-tree update needed for PTP clock!\n");
+			mgbe->clks[i].id = "ptp-ref";
+		}
+	}
+
 	err = devm_clk_bulk_get(mgbe->dev, ARRAY_SIZE(mgbe_clks), mgbe->clks);
 	if (err < 0)
 		return err;
-- 
2.53.0


