Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C099E7FDF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 00:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5LFXkBNsaVFgE+X7iTo/Y29wKqqTLybqX/8AfnQSGE=; b=BdRlmTr41f8q5L1jFBYHUQ6YMt
	MLKCu4i1iMq5efl/7bbzg1RYInnEtTmVJZMLzvUAo2YE9SUnmceQVHDS0+3t5XmQQ8xbmdOH1AT8E
	IR2vVBb+hQC1aqPov5APoN6TxNxKKPMWLIpFQKR5EicKeoQBTctKCHMlgi4hNZpincEHdNO18Xxsb
	ui5ciGAVfNDnneyEOsL16eQmmAivM62cGiETPLNp3Jyt3uaMRMe1ssCk7ODHf4O9Lf9eqrdujy9ZZ
	6xSiFH2bPirFITBL3jdaqguvc0LBrPw0iZnQsbisZ6A8irzAaS3vAdcoj+YA7ql9SQY0ysQnBSpnT
	JHYrBTBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4B9-00000005mrY-0N1U;
	Tue, 03 Feb 2026 00:22:03 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4B5-00000005mlk-2OTi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 00:22:00 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770078116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z5LFXkBNsaVFgE+X7iTo/Y29wKqqTLybqX/8AfnQSGE=;
	b=cJ2hR9uGAGRArhS64fAzjFL3KYNeF222SksA8JH1aVxmvkavp+hI+5LmZxckuAV17UuUqX
	XyAKRZ1my27xviwXsb5wMwfM3B/3hzdzTtAN34AFDhYNRjVFI35BBUzwjG1ttooSReRjMp
	xOdbJjQLtcb1qlt8U/VFuTS9YhHZsyY=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-phy@lists.infradead.org
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-kernel@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 5/8] phy: zynqmp: Initialize chicken bits
Date: Mon,  2 Feb 2026 19:21:25 -0500
Message-Id: <20260203002128.935842-6-sean.anderson@linux.dev>
In-Reply-To: <20260203002128.935842-1-sean.anderson@linux.dev>
References: <20260203002128.935842-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_162159_748837_3D579469 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

These bits are all set by serdes_init(). Move them to the phy driver so
we can skip serdes_init().

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/phy/xilinx/phy-zynqmp.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
index 854b0ea04648..1bdf29ba284c 100644
--- a/drivers/phy/xilinx/phy-zynqmp.c
+++ b/drivers/phy/xilinx/phy-zynqmp.c
@@ -54,7 +54,13 @@
 /* PCS control parameters */
 #define L0_TM_ANA_BYP_4			0x1010
 #define L0_TM_ANA_BYP_7			0x1018
+#define L0_TM_ANA_BYP_12		0x102c
+#define L0_TM_ANA_BYP_12_FORCE_UPHY_PSO_HSRXDIG		BIT(6)
+#define L0_TM_ANA_BYP_15		0x1038
+#define L0_TM_ANA_BYP_15_FORCE_UPHY_ENABLE_LOW_LEAKAGE	BIT(6)
 #define L0_TM_DIG_6			0x106c
+#define L0_TM_DIG_8			0x1074
+#define L0_TM_DIG_8_EYESURF		BIT(4)
 #define L0_TM_DIG_22			0x10ac
 #define L0_TM_DIS_DESCRAMBLE_DECODER	0x0f
 #define L0_TX_DIG_61			0x00f4
@@ -82,7 +88,13 @@
 #define L0_TM_EQ1_EQ_STG2_PREAMP_MODE_VAL	BIT(2)
 #define L0_TM_E_ILL8			0x1940
 #define L0_TM_E_ILL9			0x1944
+#define L0_TM_EQ11			0x1978
+#define L0_TM_EQ11_FORCE_EQ_OFFS_OFF	BIT(4)
 #define L0_TM_ILL13			0x1994
+#define L0_TM_RST_DLY			0x19a4
+#define L0_TM_MISC3			0x19ac
+#define L0_TM_MISC3_CDR_EN_FPL		BIT(1)
+#define L0_TM_MISC3_CDR_EN_FFL		BIT(0)
 #define L0_TM_CDR5			0x1c14
 #define L0_TM_CDR5_FPHL_FSM_ACC_CYCLES	GENMASK(7, 5)
 #define L0_TM_CDR5_FFL_PH0_INT_GAIN	GENMASK(4, 0)
@@ -849,6 +861,18 @@ static int xpsgtr_common_init(struct xpsgtr_phy *gtr_phy)
 	/* Enable coarse code saturation limiting logic. */
 	xpsgtr_write_phy(gtr_phy, L0_TM_PLL_DIG_37, L0_TM_COARSE_CODE_LIMIT);
 
+	/* Miscellaneous chicken bits */
+	xpsgtr_clr_set_phy(gtr_phy, L0_TM_DIG_8, 0, L0_TM_DIG_8_EYESURF);
+	xpsgtr_write_phy(gtr_phy, L0_TM_ILL13, 7);
+	xpsgtr_write_phy(gtr_phy, L0_TM_RST_DLY, 255);
+	xpsgtr_clr_set_phy(gtr_phy, L0_TM_ANA_BYP_15, 0,
+			   L0_TM_ANA_BYP_15_FORCE_UPHY_ENABLE_LOW_LEAKAGE);
+	xpsgtr_clr_set_phy(gtr_phy, L0_TM_ANA_BYP_12, 0,
+			   L0_TM_ANA_BYP_12_FORCE_UPHY_PSO_HSRXDIG);
+	xpsgtr_clr_set_phy(gtr_phy, L0_TM_MISC3, L0_TM_MISC3_CDR_EN_FPL |
+						 L0_TM_MISC3_CDR_EN_FFL, 0);
+	xpsgtr_clr_set_phy(gtr_phy, L0_TM_EQ11, 0, L0_TM_EQ11_FORCE_EQ_OFFS_OFF);
+
 	ret = xpsgtr_configure_pll(gtr_phy);
 	if (ret)
 		return ret;
-- 
2.35.1.1320.gc452695387.dirty


