Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F2CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdEVBz7qoBus2X6KuN2zMrTdspOavJi/OSyMVgvxu1o=; b=VAC7jIpSiufPz0ka0fqY29Y2c8
	fd787JIGyIgKJXL9Yxz5FY3MV+XWqXxGS/KbWV9Pd7hftra5PtjEJIWemCtCPYZ3uFlxzh0le2zZo
	SdO8GIgAwFOS8bbCSnPVWqQN+e/WLwyt5/9Y6HFTlseZDmUTdKT5P4Ooe25khFmsbj1B3AD5trn8z
	pyDfh5+DHvM8u0iL7J+BOova+EyD3gLkvZoKGW8znN0nVrMiZ37fwP+gi24p0Q34ejJ8o6GXhO20T
	mF9K8/Jmi5RINfjD6PmWTgVkwvjvxOjbO2vDwqdAIwhfTdRLZXVm27mjFrjARQ4gFFU+QGnP14/qM
	Gth4Ue3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgrq-0000000BQih-0V7B;
	Sat, 25 Oct 2025 16:11:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgro-0000000BQi2-1XG1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:11:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BF9D604FA;
	Sat, 25 Oct 2025 16:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06E1C4CEFF;
	Sat, 25 Oct 2025 16:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408703;
	bh=DEkVSc8NRFn6ItZeWrbNxU3sOFl/C8fQJwK+oMewsvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uQQQGkRiCMLTJ1HsAmxO1O9mo9qyagiCGlvwb2/mSM+zSnGt/+ZACUViznRh/OIbf
	 MgOoknXreViuIjigkuZ/rawYU/E56f2ilyU8Pms3hXcoDi/zslNW8c87lVxZez5uxF
	 5JCUlN3NGQcpyEBfi3Ng2mCOyLN+YTUwHLIAuwHGWDlrWtdy8xwEvWEbs6Ww7EPBUV
	 MKQsuA0KAPnL6vLKZE0K05LoThB57VXw2ybZA9+1b8Q0U+CJYOgkZKkHqbAMxNiAN6
	 orPc8RxgfL1VhSRWEszVIM6+xXTscBIjH+f/c3+ALzUPYjjnHTnnb5lUKlrQirKw90
	 Shrq2bXCoNUAg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sasha Levin <sashal@kernel.org>,
	l.stach@pengutronix.de,
	shawnguo@kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH AUTOSEL 6.17-6.12] PCI: imx6: Enable the Vaux supply if available
Date: Sat, 25 Oct 2025 11:54:38 -0400
Message-ID: <20251025160905.3857885-47-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Richard Zhu <hongxing.zhu@nxp.com>

[ Upstream commit c221cbf8dc547eb8489152ac62ef103fede99545 ]

When the 3.3Vaux supply is present, fetch it at the probe time and keep it
enabled for the entire PCIe controller lifecycle so that the link can enter
L2 state and the devices can signal wakeup using either Beacon or WAKE#
mechanisms.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
[mani: reworded the subject, description and error message]
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://patch.msgid.link/20250820022328.2143374-1-hongxing.zhu@nxp.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- The change enables an optional 3.3V auxiliary PCIe supply early in
  probe and keeps it on for the controller’s lifetime via devm, which
  directly addresses link low‑power (L2) entry and wake signaling
  reliability. The new call
  `devm_regulator_get_enable_optional(&pdev->dev, "vpcie3v3aux")` is
  added in `drivers/pci/controller/dwc/pci-imx6.c:1744`. Errors other
  than “not present” are surfaced using `dev_err_probe()`
  (`drivers/pci/controller/dwc/pci-imx6.c:1745`), ensuring a clear,
  fail‑fast behavior if hardware provides the supply but it cannot be
  enabled.

- The helper used is a standard devres API that both acquires and
  enables the regulator for the device lifetime, and automatically
  disables it on device teardown. See the declaration in
  `include/linux/regulator/consumer.h:166` and implementation in
  `drivers/regulator/devres.c:110`. This matches the commit’s intent to
  “keep it enabled for the entire PCIe controller lifecycle.”

- This is a contained, minimal change within the i.MX DesignWare PCIe
  host driver probe path. It does not alter broader PCIe core behavior,
  call flows, or add architectural changes. It only:
  - Enables `vpcie3v3aux` if present (`drivers/pci/controller/dwc/pci-
    imx6.c:1744`).
  - Leaves existing supply handling intact for `vpcie` and `vph`
    (`drivers/pci/controller/dwc/pci-imx6.c:1748` and
    `drivers/pci/controller/dwc/pci-imx6.c:1755`).
  - Keeps `vpcie` enable/disable at host init/exit unchanged
    (`drivers/pci/controller/dwc/pci-imx6.c:1205`,
    `drivers/pci/controller/dwc/pci-imx6.c:1280`,
    `drivers/pci/controller/dwc/pci-imx6.c:1297`).

- The functional impact is to enable proper L2 and wake signaling
  (Beacon or WAKE#) on boards that wire up 3.3Vaux. The driver already
  carries context that AUX power matters; for example, i.MX95 has an
  erratum requiring AUX power detect handling to exit L23 Ready
  (`drivers/pci/controller/dwc/pci-imx6.c:245` comment explains AUX
  power implications). Turning on AUX power when available is therefore
  a correctness fix, not a feature.

- Risk/regression assessment:
  - If the supply is not defined, nothing changes (uses “optional” API
    and ignores `-ENODEV`).
  - If the supply is defined but cannot be enabled, probe now fails
    loudly; this surfaces real hardware/regulator issues instead of
    running with broken low‑power/wake behavior.
  - The pattern matches existing PCIe controller drivers that enable
    optional PCIe supplies at probe with the same helper (e.g.,
    `drivers/pci/controller/pcie-rcar-host.c:954`), indicating
    established practice across subsystems.
  - Binding-wise, the i.MX PCIe common binding allows additional
    properties (`additionalProperties: true` in
    `Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-
    common.yaml:246`), so using `vpcie3v3aux-supply` is non‑disruptive
    for DT validation. DT updates are optional and can follow
    separately.

- Stable criteria fit:
  - Fixes a real user-visible issue (L2 entry and wake signaling fail
    without AUX).
  - Small and self-contained change in a single driver.
  - No architectural refactor or feature addition beyond enabling an
    optional, already-described hardware supply.
  - Uses existing, widely deployed APIs with minimal regression risk.

Given the clear bugfix nature, minimal scope, and alignment with
established patterns, this is a good candidate for stable backport.

 drivers/pci/controller/dwc/pci-imx6.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 80e48746bbaf6..db51e382a7cf3 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1745,6 +1745,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	pci->max_link_speed = 1;
 	of_property_read_u32(node, "fsl,max-link-speed", &pci->max_link_speed);
 
+	ret = devm_regulator_get_enable_optional(&pdev->dev, "vpcie3v3aux");
+	if (ret < 0 && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to enable Vaux supply\n");
+
 	imx_pcie->vpcie = devm_regulator_get_optional(&pdev->dev, "vpcie");
 	if (IS_ERR(imx_pcie->vpcie)) {
 		if (PTR_ERR(imx_pcie->vpcie) != -ENODEV)
-- 
2.51.0


