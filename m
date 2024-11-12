Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAF7D41D41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 00:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zy2COW6thQPsIbA8ppS5wp89rCFMni6i5GmO49kX78I=; b=rnrV9Lgs+EijcE9ebWrpn40/U8
	XGvVq30otvR9FQw71V9EkA82Ittvj9SAow/8Hj0YyVCSIZk0eS9WZk1QEPmb5S1youNI8LVYkEFkK
	QVKwb3vlp994qlE55mAuzlCJUWhGaiBmM7vgs3iksqXUCTCToerZjNeIas2HezX6JQQeyK02gpdWX
	ntUOhl7+2fHY8fcz31u8a1WX5+29077PZD0BL0dPrFu1p2k6bSHBNzkLdu34FhaqnlKfcrcrZOzjm
	pzqDMFkIY4OJUhF4GLw/kPO19MtN6Z2BZJjFJigL//Fk15B0rOBDmYQkumDEyiBpR+FGAISBlv0PA
	UhyA/Ghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeYe-00000001iTj-440s;
	Tue, 12 Nov 2024 00:15:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeTS-00000001haE-3A9z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 00:09:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA77C5C5D32;
	Tue, 12 Nov 2024 00:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1F2C4CECF;
	Tue, 12 Nov 2024 00:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731370178;
	bh=NWo4rO+TyBta1SraqvA5DELSDrzfk9jlax3FHu1ajLk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GOghkyq1fNCiFotB3vSqwvcFzoJlogT+2jcqI4UmgZMLN12o5B2LTfit/R3hj977x
	 r+7jPTjKU1wr/rbOclu5GgU7R2UbXWr6HPzxdkonZCtDurlfSLrf8+pfDgOz8dXWhp
	 uQTkpyyAl/qhCkod3+zorr2OeDOfjM8+7nD2xEOgpRSGWMjdIF0txFM920YmrdlN1J
	 Owh0B+cx1gWciF0PNg0X0QLzjqiPcYKTwBYett7CUzBCJ3b78buklmdUIzOEYcnPSn
	 6pSwfXsblmJxhHTxwmumOy7rOOW7fYBqXUrT2ytPPKGv8Cg/Mwm1TnEXs1M3IdVrFd
	 bJs2vZjySBC2Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 12 Nov 2024 01:08:49 +0100
Subject: [PATCH RESEND v2 2/7] clk: en7523: remove REG_PCIE*_{MEM,MEM_MASK}
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-clk-en7581-syscon-v2-2-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org>
In-Reply-To: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, 
 ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_160938_872310_70BFE897 
X-CRM114-Status: GOOD (  12.37  )
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

REG_PCIE*_MEM and REG_PCIE*_MEM_MASK regs (PBUS_CSR memory region) are not
part of the scu block on the EN7581 SoC and they are used to select the
PCIE ports on the PBUS, so remove this configuration from the clock driver
and set these registers in the PCIE host driver instead.
This patch does not introduce any backward incompatibility since the dts
for EN7581 SoC is not upstream yet.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 22fbea61c3dcc05e63f8fa37e203c62b2a6fe79e..ec6716844fdcf7fc25482c6e587d062279360675 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -31,12 +31,6 @@
 #define   REG_RESET_CONTROL_PCIE1	BIT(27)
 #define   REG_RESET_CONTROL_PCIE2	BIT(26)
 /* EN7581 */
-#define REG_PCIE0_MEM			0x00
-#define REG_PCIE0_MEM_MASK		0x04
-#define REG_PCIE1_MEM			0x08
-#define REG_PCIE1_MEM_MASK		0x0c
-#define REG_PCIE2_MEM			0x10
-#define REG_PCIE2_MEM_MASK		0x14
 #define REG_NP_SCU_PCIC			0x88
 #define REG_NP_SCU_SSTR			0x9c
 #define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
@@ -415,26 +409,14 @@ static void en7581_pci_disable(struct clk_hw *hw)
 static int en7581_clk_hw_init(struct platform_device *pdev,
 			      void __iomem *np_base)
 {
-	void __iomem *pb_base;
 	u32 val;
 
-	pb_base = devm_platform_ioremap_resource(pdev, 3);
-	if (IS_ERR(pb_base))
-		return PTR_ERR(pb_base);
-
 	val = readl(np_base + REG_NP_SCU_SSTR);
 	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
 	writel(val, np_base + REG_NP_SCU_SSTR);
 	val = readl(np_base + REG_NP_SCU_PCIC);
 	writel(val | 3, np_base + REG_NP_SCU_PCIC);
 
-	writel(0x20000000, pb_base + REG_PCIE0_MEM);
-	writel(0xfc000000, pb_base + REG_PCIE0_MEM_MASK);
-	writel(0x24000000, pb_base + REG_PCIE1_MEM);
-	writel(0xfc000000, pb_base + REG_PCIE1_MEM_MASK);
-	writel(0x28000000, pb_base + REG_PCIE2_MEM);
-	writel(0xfc000000, pb_base + REG_PCIE2_MEM_MASK);
-
 	return 0;
 }
 

-- 
2.47.0


