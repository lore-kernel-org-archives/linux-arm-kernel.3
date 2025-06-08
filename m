Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50CEC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 13:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgFOZvo6bs3kyIs7rlYuxh9hPXyrFm8PF+tMUSckEi4=; b=Nijex1gZUdnc6WBEgpg2Pt9iLs
	5nzAjFore/nPRPE8IXJe1bQkb2n/em3njuRsqCKO8zW8fEsbjyAhrIj7EtyYQJC/YLhIkkbTw+LAp
	+3Z036tsaTSikS+P/BC6mgosSG0QFiihh0ZTcgzFaEfmE2T+mnonHZn2wfCXXNCL6rm2XdRHVKQmc
	GEWNB5gkHIK7IR/tX/IduV6gHtpvJf/Am9LJSlgvS+cVLV8geJxFi22jmeGMyhzuA8simNFF59Qbf
	rMWMVWc1Y/G6tdpxytu8DikDgoQs/lc8r8fE4SK2PE4DfyXPEUc7J+KZ56fp8S7YkDI2uxPLEt/xl
	vjl1/DHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOFlo-00000002dWQ-3Kgs;
	Sun, 08 Jun 2025 13:09:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOFYd-00000002cTz-1sW0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 12:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3066B5C53EA;
	Sun,  8 Jun 2025 12:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0CBC4CEEE;
	Sun,  8 Jun 2025 12:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749387326;
	bh=k9WQ8zf71PaFQUYStBWojJDS3GDR41VS8kCjbdCtVzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UeCVE0hSX9biDHFqZxL3ZkCHo3YwJaPTsZIE68dRBCYaLi6EkRlNw2R+QwU8YWxXv
	 sMQ+PF4rwDjomdu1bjDOwhurZHZbEj3ynshNMXH/X3SHeXgUrkL6ENxI4DvgSzf983
	 32BePKdYkdaLhA9AgVu7Grd7+nZxHh8yyatOyZwQpt/ymXLRrRQfGc8Xa2a2qesILn
	 fDkfS05U2DuD2ZWFZZ9sSArWjJvA4yfLAnzbCDP1nRGL3HqnzyEqmck4LMHhm/ql7J
	 97J3VADsLzfZi16eAufecKIvD01hV9LmhGeH5UR9vHMl9LFJgx0MPOZS5kr+lCFOQs
	 gHFHFCMm4E0pQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sasha Levin <sashal@kernel.org>,
	l.stach@pengutronix.de,
	shawnguo@kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH AUTOSEL 6.12 10/10] PCI: imx6: Add workaround for errata ERR051624
Date: Sun,  8 Jun 2025 08:55:07 -0400
Message-Id: <20250608125507.934032-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250608125507.934032-1-sashal@kernel.org>
References: <20250608125507.934032-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.32
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_055527_580687_3D430921 
X-CRM114-Status: GOOD (  14.61  )
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

[ Upstream commit ce0c43e855c7f652b6351110aaaabf9b521debd7 ]

ERR051624: The Controller Without Vaux Cannot Exit L23 Ready Through Beacon
or PERST# De-assertion

When the auxiliary power is not available, the controller cannot exit from
L23 Ready with beacon or PERST# de-assertion when main power is not
removed. So the workaround is to set SS_RW_REG_1[SYS_AUX_PWR_DET] to 1.

This workaround is required irrespective of whether Vaux is supplied to the
link partner or not.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
[mani: subject and description rewording]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://patch.msgid.link/20250416081314.3929794-5-hongxing.zhu@nxp.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES**

This commit should be backported to stable kernel trees. Here's my
extensive analysis:

## **Primary Justification: Hardware Errata Fix**

**ERR051624** is a documented silicon-level hardware errata affecting
i.MX95 PCIe controllers. The commit message clearly states this is a
workaround for a fundamental hardware limitation where "the controller
cannot exit from L23 Ready with beacon or PERST# de-assertion when main
power is not removed" when auxiliary power is unavailable.

## **Code Analysis**

The changes are **minimal and targeted**:

```c
+       /*
+        * ERR051624: The Controller Without Vaux Cannot Exit L23 Ready
+        * Through Beacon or PERST# De-assertion
+        *
+        * When the auxiliary power is not available, the controller
+        * cannot exit from L23 Ready with beacon or PERST# de-assertion
+        * when main power is not removed.
+        *
+        * Workaround: Set SS_RW_REG_1[SYS_AUX_PWR_DET] to 1.
+        */
+       regmap_set_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_1,
+                       IMX95_PCIE_SYS_AUX_PWR_DET);
```

The fix is:
- **Self-contained**: Only affects i.MX95 PCIe initialization path
  (`imx95_pcie_init_phy`)
- **Low risk**: Simple register bit set with no complex logic
- **Well-documented**: Includes detailed errata description and official
  workaround
- **Hardware-specific**: No impact on other platforms or subsystems

## **Impact Assessment**

This errata affects **critical system functionality**:
- **Power Management**: Prevents proper exit from L23 Ready state
- **System Resume**: Could cause hangs during suspend/resume cycles
- **Platform Stability**: Affects fundamental PCIe power state
  transitions

## **Historical Precedent**

Examining similar commits shows a **consistent pattern of hardware
errata backporting**:

1. **Similar Commit #4 (Status: YES)**: "PCI: dwc: Provide deinit
   callback for i.MX" - Also addresses i.MX PCIe initialization issues
   and was backported
2. **ERR005723 workaround**: Recently backported to stable (`Cc:
   stable@vger.kernel.org`)
3. **ERR010728 workaround**: Multiple commits addressing this errata,
   showing active stable maintenance

## **Stable Tree Criteria Compliance**

✅ **Important bugfix**: Addresses hardware limitation affecting system
power management
✅ **Minimal risk**: Single register bit set with no side effects
✅ **Small and contained**: 13 lines of code, confined to one function
✅ **No architectural changes**: Simple workaround implementation
✅ **Critical subsystem**: PCIe power management is fundamental to system
operation
✅ **Clear documentation**: Well-documented errata with official
workaround

## **Risk Analysis**

**Regression Risk: MINIMAL**
- Only affects i.MX95 platforms specifically
- Workaround is mandated by hardware vendor (NXP)
- No conditional logic that could fail
- Register bit set follows official errata documentation

## **Maintainer Pattern**

The i.MX PCIe driver maintainers (Richard Zhu/NXP, Manivannan
Sadhasivam) have consistently tagged hardware errata fixes for stable
backporting, demonstrating their commitment to stable kernel support for
production hardware issues.

## **Conclusion**

This commit represents a **mandatory workaround for broken hardware**
that affects basic system functionality (power management). It follows
established patterns of similar errata fixes that have been successfully
backported, poses minimal regression risk, and addresses a real-world
issue that would impact users of i.MX95-based systems in production
environments.

 drivers/pci/controller/dwc/pci-imx6.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index ad3028b755d16..3b24fed3177de 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -48,6 +48,8 @@
 #define IMX95_PCIE_SS_RW_REG_0			0xf0
 #define IMX95_PCIE_REF_CLKEN			BIT(23)
 #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
+#define IMX95_PCIE_SS_RW_REG_1			0xf4
+#define IMX95_PCIE_SYS_AUX_PWR_DET		BIT(31)
 
 #define IMX95_PE0_GEN_CTRL_1			0x1050
 #define IMX95_PCIE_DEVICE_TYPE			GENMASK(3, 0)
@@ -206,6 +208,19 @@ static unsigned int imx_pcie_grp_offset(const struct imx_pcie *imx_pcie)
 
 static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
 {
+	/*
+	 * ERR051624: The Controller Without Vaux Cannot Exit L23 Ready
+	 * Through Beacon or PERST# De-assertion
+	 *
+	 * When the auxiliary power is not available, the controller
+	 * cannot exit from L23 Ready with beacon or PERST# de-assertion
+	 * when main power is not removed.
+	 *
+	 * Workaround: Set SS_RW_REG_1[SYS_AUX_PWR_DET] to 1.
+	 */
+	regmap_set_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_1,
+			IMX95_PCIE_SYS_AUX_PWR_DET);
+
 	regmap_update_bits(imx_pcie->iomuxc_gpr,
 			IMX95_PCIE_SS_RW_REG_0,
 			IMX95_PCIE_PHY_CR_PARA_SEL,
-- 
2.39.5


