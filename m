Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEBBD68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 16:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqLyK5BAyRobHArlImG/r9aAsay7r535oaTceuLvVWA=; b=qosHzgNPp/hslmp1YZm8kcw9mV
	x84gvx0ZApImj+WlADmVDd6QDwOhBDcoD3AWhJ6ze5Cqch1055zZHwpndLTDMfvnHQIsuJiJ7sSQ4
	IKFkHF1u7aOtj+Y5TWDg0Aq/MFbdNYA+YtDN71oFS/7Sptp50vFlqoi9TMfV4DLNKfO1Y7oSRTEWG
	PXvkRl8RVbH01vURRxguZNoaS+hKnOz1n6kK/FXOegyq8aifLnegai/xOOGSV2amOR0aZnP0d51Eh
	ZY6jBsvQh2F+YYF4/HkT4ElEVZHPub//pmkO1T5jKIalu3iyJpNBrt2bUEPKsAb7oz368bRJTC314
	2ga0h7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzGG-00000003M9Q-2GFr;
	Fri, 15 Nov 2024 16:33:32 +0000
Received: from mout.perfora.net ([74.208.4.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzFK-00000003Loa-1F0Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 16:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=finest.io;
	s=s1-ionos; t=1731688335; x=1732293135; i=parker@finest.io;
	bh=uqLyK5BAyRobHArlImG/r9aAsay7r535oaTceuLvVWA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=xnBVRIOGI8OaKA4exA9SeQpb+LYIHH+KMuYJadA629P2GtPNTiNO7YFmBE7ciFx7
	 zeXgf3WYBbjHU8gf6QPdLqkDvr+YQ1nkQOyfRIKRCLMcInfqVaEk1s7jXxA56B65Q
	 Rb1PxxboshMxGS035BVNgvRXmDCla69kpstRIZN5NCNjs0HiQYCQZmK1qcLc14nDd
	 GwMNAELO98aYsOcL7pzeyY+FDu/hPs5c+fcLhPF1MCR5Iu/WP6tudPp6RbW9QFnjJ
	 nWcfwQ2/aGtbYdGqOO3PyatLeLI+o1YQiBvKqUPQjcI0nE1tguUnvvoybDi+gLgkz
	 YclkJqPUAlyBeeZRXw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from finest.io ([98.159.241.229]) by mrelay.perfora.net (mreueus002
 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MVen3-1tGXho2JHb-00YACL; Fri, 15 Nov
 2024 17:32:15 +0100
From: Parker Newman <parker@finest.io>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Parker Newman <pnewman@connecttech.com>
Subject: [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read iommu stream id from device tree
Date: Fri, 15 Nov 2024 11:31:08 -0500
Message-ID: <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731685185.git.pnewman@connecttech.com>
References: <cover.1731685185.git.pnewman@connecttech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EFHR/GxuAAa5dFNi+oZRXzYiBIwpE3rPxeJh+/FkXRvXXm7itFF
 UXMd+O9um5JibJVzw1g/XgNgJN7EDxWoeyxiexfxN0m1fWvTSnd36j87dSEMlDRz5OBwlKZ
 LAUwlF3Ys8apsMCFBFCyT6+z/tyw//46Sb5q6aY9qyhnYrn69cQwxKpMOsGpYyXM9ll61et
 SXILMIyjInJpxWBKNZy8Q==
UI-OutboundReport: notjunk:1;M01:P0:Tv2BRfTO0HQ=;QVb4D09UbdCm/rsKF0sXi7TFSFH
 4J9wN7jTYPM5rrW/1RBoiTtMy6Dp8MFNpVrzIg/D2Fwjx1Jy/UfANEapVOZKV1bLqvBET/hsa
 Fr/RfSST8zYc7p8OavWVQ9A6p8buhKDZFGTRgp/CIEO5KZbUpqG7sfftKit47oKAihCKSVCPX
 0aGFjSNFmKirP6G8D9cJ5YZYIFBqehV1QKR94m2SpDvqOJ+NSmgojS76kCEJI3DYyXoOajMiS
 y6Vcgtv49jyCynbD4g5Fla2oKvW5pB+INaObEudq9U/V1AlcKaxLDqxJIIwJZPaA3n/dgTgLC
 BYiOr+n3j78h/omkOY3qpOynNo/OIjMZ/Lur3I6Rs+RjnQLp7m6xyYUXNVRCgMo4uC5hbDkwo
 YCwKEbItZKpYl0AHRlmDVmyNt27lZrad/kpYOylQ1STzLJ4Lw1HuQtVB5Krh2zjie9n2wSEr5
 6xjPJb1wQQU7aAlEgiaQ/obrElj5BmUQGJJDpmeLcJOMRny3DhYDStlwn0yQSuWWI1629iKfl
 zVa4BitAIrtyqlPJjxS2X4DjaSVF8zgp9oNac3i4jyWskPsdW0DWUaWYg+2XAJ8m+olp03FR7
 d/+QlqLvd0vfSitF3+ZDUk8BwzK8xV7A7NR6rjZQCpCmfrIGyBmDzrd9HP/4/lICNedLOdmSg
 dlOfh9LopIscIr6kgGQcVoc4dxAZBv5TrjkogSjHSan7i9XZFDJKPJtaM11Aaz+1dep2mbFnu
 MugeX80VCXMJL9c/5xhahNr/bdDCV16x4po7o9B9+ncTHf7c5LMMY93m4/bicuTVZxDgCjWnX
 CKZzKNWZ80rZaoYbXqivcrkaEqkYh43VUyU4o30/Z/ijBwI+AUfKj7tkteE1uCn8Xf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_083234_555668_BE1650F1 
X-CRM114-Status: GOOD (  11.47  )
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

From: Parker Newman <pnewman@connecttech.com>

Read the iommu stream id from device tree rather than hard coding to mgbe0=
.
Fixes kernel panics when using mgbe controllers other than mgbe0.

Tested with Orin AGX 64GB module on Connect Tech Forge carrier board.

Signed-off-by: Parker Newman <pnewman@connecttech.com>
=2D--
 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/n=
et/ethernet/stmicro/stmmac/dwmac-tegra.c
index 3827997d2132..dc903b846b1b 100644
=2D-- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/iommu.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/module.h>
@@ -19,6 +20,8 @@ struct tegra_mgbe {
 	struct reset_control *rst_mac;
 	struct reset_control *rst_pcs;

+	u32 iommu_sid;
+
 	void __iomem *hv;
 	void __iomem *regs;
 	void __iomem *xpcs;
@@ -50,7 +53,6 @@ struct tegra_mgbe {
 #define MGBE_WRAP_COMMON_INTR_ENABLE	0x8704
 #define MAC_SBD_INTR			BIT(2)
 #define MGBE_WRAP_AXI_ASID0_CTRL	0x8400
-#define MGBE_SID			0x6

 static int __maybe_unused tegra_mgbe_suspend(struct device *dev)
 {
@@ -84,7 +86,7 @@ static int __maybe_unused tegra_mgbe_resume(struct devic=
e *dev)
 	writel(MAC_SBD_INTR, mgbe->regs + MGBE_WRAP_COMMON_INTR_ENABLE);

 	/* Program SID */
-	writel(MGBE_SID, mgbe->hv + MGBE_WRAP_AXI_ASID0_CTRL);
+	writel(mgbe->iommu_sid, mgbe->hv + MGBE_WRAP_AXI_ASID0_CTRL);

 	value =3D readl(mgbe->xpcs + XPCS_WRAP_UPHY_STATUS);
 	if ((value & XPCS_WRAP_UPHY_STATUS_TX_P_UP) =3D=3D 0) {
@@ -241,6 +243,12 @@ static int tegra_mgbe_probe(struct platform_device *p=
dev)
 	if (IS_ERR(mgbe->xpcs))
 		return PTR_ERR(mgbe->xpcs);

+	/* get controller's stream id from iommu property in device tree */
+	if (!tegra_dev_iommu_get_stream_id(mgbe->dev, &mgbe->iommu_sid)) {
+		dev_err(mgbe->dev, "failed to get iommu stream id\n");
+		return -EINVAL;
+	}
+
 	res.addr =3D mgbe->regs;
 	res.irq =3D irq;

@@ -346,7 +354,7 @@ static int tegra_mgbe_probe(struct platform_device *pd=
ev)
 	writel(MAC_SBD_INTR, mgbe->regs + MGBE_WRAP_COMMON_INTR_ENABLE);

 	/* Program SID */
-	writel(MGBE_SID, mgbe->hv + MGBE_WRAP_AXI_ASID0_CTRL);
+	writel(mgbe->iommu_sid, mgbe->hv + MGBE_WRAP_AXI_ASID0_CTRL);

 	plat->flags |=3D STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP;

=2D-
2.47.0


