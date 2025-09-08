Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56976CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 02:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SusLRAPq3d2jfW5inmS1WlkGQ8fv7/4BAXQEfU/+LqQ=; b=FkuTCPOD9rIgcBKcq+Rx/VXOya
	IEFYYdYAowtrHIlyIjp/ghKgUhBmQhrkwYVvz5VvGp7+4qDIe1oSQn4iqc5Sn+u0DnjcidO/V8alF
	3LTCQVbWHZvL0gbpB90d6GHuQsvlASAOwyV5AIMrpueE6m9mWHBEVSpG3VlLi7wcs7JAUZTshxSPg
	XbYLop+ap1tCvSGEtHKVWd6gRA/Y5HnNaQkQ6u68AsbQo7roDHX8mvncC2aqoz7Lvra+bvPGabDXr
	q/2t+lnylEehhLoWN0+HE97brGkGSjWxjtQjf9cklor2JAD+zll2sMKanIyJyGBiMpsZl21CU568h
	I/2MqO7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRkt-0000000E3DD-2Ywk;
	Mon, 08 Sep 2025 02:37:19 +0000
Received: from mo-csw1800.securemx.jp ([210.130.202.134] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRi4-0000000E2Yk-2HRl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 02:34:26 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:Cc:
	Subject:Date:Message-Id:In-Reply-To:References;i=
	nobuhiro.iwamatsu.x90@mail.toshiba;s=key1.smx;t=1757298853;x=1758508453;bh=Cn
	+UFmnrahnXPfI/xFTC/Llrkc3SwpQ8AAggw6a+87s=;b=GfIh0b05pc36lpfpw0aJwBZ87gaTFbDU
	k5SJBsfZEVbYdlz4s+dSsu2XuOYXjjGCPTliudVWzxNMb0Xn2UWgmO3xMno1tqWbepmtBPDRzE2rk
	71KY1Pvyg9f4J+uJpHigA7OEv/I2iWO4ujRnox2AxDV/T2Nzu+lmma18eM2ZF63n+NABfqYbTqJ+C
	CgjUVZqK+NhmLXnnKzfNmehJaNAHwHvCIu5eHLPzY4LyptJr0FGNCUU7hq6JalcDrC/J9DDPjcuME
	ak1IUQf1oPTjAG2nL3rAFbrIP2xGiPX/+Oi+HiH5N48XB/GGamqS0y6SEgN46VpJLPI2xRhWDTyus
	mA==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 5882YDEo1108307; Mon, 8 Sep 2025 11:34:13 +0900
X-Iguazu-Qid: 2yAb1IXdsJfjEUpWwl
X-Iguazu-QSIG: v=2; s=0; t=1757298853; q=2yAb1IXdsJfjEUpWwl; m=8TY7ikGs11N172z+9r7QwcJzj7XKj68UXiS5kCERcg8=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cKrch5kxZz1xnc; Mon,  8 Sep 2025 11:34:12 +0900 (JST)
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
To: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
        bhelgaas@google.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        yuji2.ishikawa@toshiba.co.jp,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Subject: [PATCH v3 2/2] PCI: dwc: visconti: Remove cpu_addr_fix() after DTS fix ranges
Date: Mon,  8 Sep 2025 11:34:08 +0900
X-TSB-HOP2: ON
Message-Id: <1757298848-15154-3-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1757298848-15154-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
References: <1757298848-15154-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_193424_804493_2FBE0FC6 
X-CRM114-Status: GOOD (  12.54  )
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

From: Frank Li <Frank.Li@nxp.com>

Remove cpu_addr_fix() since it is no longer needed. The PCIe ranges
property has been corrected in the DTS, and the DesignWare common code now
handles address translation properly without requiring this workaround.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>

---
v3:
  Add pci->use_parent_dt_ranges fixes.
  Update Signed-off-by address, because my company email address haschanged.

v2:
  No Update.
---
 drivers/pci/controller/dwc/pcie-visconti.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-visconti.c b/drivers/pci/controller/dwc/pcie-visconti.c
index cdeac6177143c..d8765e57147af 100644
--- a/drivers/pci/controller/dwc/pcie-visconti.c
+++ b/drivers/pci/controller/dwc/pcie-visconti.c
@@ -171,20 +171,7 @@ static void visconti_pcie_stop_link(struct dw_pcie *pci)
 	visconti_mpu_writel(pcie, val | MPU_MP_EN_DISABLE, PCIE_MPU_REG_MP_EN);
 }
 
-/*
- * In this SoC specification, the CPU bus outputs the offset value from
- * 0x40000000 to the PCIe bus, so 0x40000000 is subtracted from the CPU
- * bus address. This 0x40000000 is also based on io_base from DT.
- */
-static u64 visconti_pcie_cpu_addr_fixup(struct dw_pcie *pci, u64 cpu_addr)
-{
-	struct dw_pcie_rp *pp = &pci->pp;
-
-	return cpu_addr & ~pp->io_base;
-}
-
 static const struct dw_pcie_ops dw_pcie_ops = {
-	.cpu_addr_fixup = visconti_pcie_cpu_addr_fixup,
 	.link_up = visconti_pcie_link_up,
 	.start_link = visconti_pcie_start_link,
 	.stop_link = visconti_pcie_stop_link,
@@ -310,6 +297,8 @@ static int visconti_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcie);
 
+	pci->use_parent_dt_ranges = true;
+
 	return visconti_add_pcie_port(pcie, pdev);
 }
 
-- 
2.51.0



