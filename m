Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE888C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 13:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LukFTq4WbPaqRmSyKQENczb6NXFD8tPWW1zRQCqFh+8=; b=UR+abcQnKebXMjm2dCupq1anvI
	xAozbjnfNvOSZs5WyECXFWNzO9FGvUye1JAq0yyIGuu3CkVap8RPMGqD0qEj0OPgut3k6A8n9bOoJ
	16UEnXVHTkrNFho6Wi9CfFrNtsh9MQ9Eobzx3q7nSj4iurTEQF6zeQVHlsUk95//uDj3mAHoKTpCx
	2rrv62JWPNh89KdYZFQbsVEUkoTI8Hd0JQEKfQbfDh3P5pkSvfjjX/EH2RuaQZpGv9JIpjXNiabr+
	UEVWdc2vr2Vys5yVParLijsYyqItpBfKtOF61ZqGNmPsnbiCpI61p2fPsGdbaFqi3mDh8N7S4nzxU
	NQbr6mKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOFhc-00000002dIF-1PCW;
	Sun, 08 Jun 2025 13:04:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOFYJ-00000002cPH-3itu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 12:55:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 726815C5421;
	Sun,  8 Jun 2025 12:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3774C4CEF2;
	Sun,  8 Jun 2025 12:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749387306;
	bh=sH8wT/F6fG+SCFjPE7I8DTE0XdwWvqbuYsd+4IkpQ68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bCc5AEIlE2pm2M5/srwTw+VU7eh9ZYXypJJxY1dtWOqmjlvkDb8kFnwJfT1mHphWO
	 npCtm3mnAZHYhmJvVPKL0QssWyzfiWPQq/AXfE+FWm+sP7ciFU4Joc/dilR7OUtLiT
	 /A7mKIIudi5/yXhlmJZAxheOrpuC7u5MZuwcmQJgjVw0Z1wrYqKG4sghVYcAUfGXgg
	 F5mCB3R3CPuRicc4IqiauswnfmR7Xk+WyQPBNBD7gqvco+98yGCcAi558WLo7N4F0v
	 Zli7eRcU2HH+gTDQWJ/CcOTg9iJuTapr/WrwUAF5/XTfWt45r5sjWTOCWJCMJH+rYa
	 Za/PRPeZpteFw==
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
Subject: [PATCH AUTOSEL 6.14 10/10] PCI: imx6: Add workaround for errata ERR051624
Date: Sun,  8 Jun 2025 08:54:47 -0400
Message-Id: <20250608125447.933686-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250608125447.933686-1-sashal@kernel.org>
References: <20250608125447.933686-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.10
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_055508_014636_EB803EE6 
X-CRM114-Status: GOOD (  14.51  )
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
index 90ace941090f9..38f14b5f50f02 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -49,6 +49,8 @@
 #define IMX95_PCIE_SS_RW_REG_0			0xf0
 #define IMX95_PCIE_REF_CLKEN			BIT(23)
 #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
+#define IMX95_PCIE_SS_RW_REG_1			0xf4
+#define IMX95_PCIE_SYS_AUX_PWR_DET		BIT(31)
 
 #define IMX95_PE0_GEN_CTRL_1			0x1050
 #define IMX95_PCIE_DEVICE_TYPE			GENMASK(3, 0)
@@ -228,6 +230,19 @@ static unsigned int imx_pcie_grp_offset(const struct imx_pcie *imx_pcie)
 
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


