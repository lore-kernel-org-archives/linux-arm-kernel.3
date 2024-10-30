Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBE2D5CC8A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sqXpApSaq9z4kEfno9SWP+axiJEGg7lOjQcw9jShE5k=; b=0mnCU/Yl3E8TVw2Ze/TFU6l9If
	ZdGcbYgBRiYFPH8LIkmeeTd1Zxgsq9xK6r5u5uJ22Xjs20nL2z1GfCzo257aj1Uuvl3N8NWdTVRKY
	HPytwPXCpVdMyceGAfLmufE8/3EsFe1A2nodnLtQIzk7jDAmW3BNrCTcaf3lZcNq51WSSBXUAmwta
	wzQE234wmLmlbrqNykuuuNn/W2gFH8fz3ha4te8nc7cnvBBWALJKxlVCpuAZ68zChK1fvkh2Ts7AH
	ZExz2VQMT0Ag5wqsjtRjIQMVfdOxMqyFWYEm4552n7Fy8j2YGBSRPTOLSObvDHRNWPj8en+207PmP
	znQrEaRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66An-0000000Hb1I-0AGE;
	Wed, 30 Oct 2024 10:43:33 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t660b-0000000HYuG-3WuX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:33:03 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a9a4031f69fso868744966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 03:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730284379; x=1730889179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sqXpApSaq9z4kEfno9SWP+axiJEGg7lOjQcw9jShE5k=;
        b=ZSXBNH8kjgH44G1+xpZ7WfKXeDTbF0eRJ85KNN6xOw6Bj0mIUEy+JLeukrIpiV+Vci
         ocGqeEpUK1wJrv48s0M/C7utxq5G3oFoCnG55TLCOc5hlG3JKJOrIoKo8l5Ttjh7Qlhq
         Le7/3ow+wJur6Lb0FGil4Jog6rVBL+tNqaeJi/RPG6DvXlfNbU3zR/qtY+0AXXhfZuNo
         Qpskk42yhPbWnB4awvXsw7gdhHlQCFj1wytgGtnEyWjoeYceMOSS73QAstp9PGnQnrNP
         7YKsSmIgax9G2bJ3kGUKGEl/2/pTN2sEY3xf36oJwdWwfRjDC4G9iCgRnl5C2it9UV3O
         7QZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284379; x=1730889179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqXpApSaq9z4kEfno9SWP+axiJEGg7lOjQcw9jShE5k=;
        b=vhD22NQep8dWm+h6pLUTg3DngBE/QDsgVgYBZLdhUB6ga0SmFVcY6/57rXM6oPMyfJ
         9eV6QpXvQb5D2MWozKLpusws1KNlEp86cX4IxPprGGg+sbSe0oT4341+EkQl79MHRGA4
         JpoOeVkv0kz8SnxLeMBqvGYOyDmik38sSwYdZAS1tgbMftW0xZVIjlULIFuwiIb5Fp7O
         lrxLpT1ZpvoXdhjeYvR28ArGCKB6N3RbwcHJxfRR0Q6Wqk5q1++FOV4x8foTggKCbEHT
         Y6VXOC78338hwDVXDNPeQjzum1ixMmonmBwlaam+VRza7KciDy0q5scEntFw1FcSr6/0
         D5UA==
X-Forwarded-Encrypted: i=1; AJvYcCUv3rWyoOY9O5tyvI9CYjVEs/4j4Kf0h7CcAKhLdsWenoA2yd9r59vH89ISU/H0eLQTiH9Ahk2XmNhDjuvyVIbB@lists.infradead.org
X-Gm-Message-State: AOJu0YxEfpfX+tdchYYR3De44BZTLoyxZlWX56tjPlYlUtO/s+BC+vvR
	zyZF/VW3j2j4Yp5biIhDgk+5jjl5wJkbTqSB5NkFPtZ/KzGjTk53
X-Google-Smtp-Source: AGHT+IGLvSmLJ/TmkoRPP82DnWy5nxXzkBa8lz5d0ru2At6NU0LtMQ8rQCXEQsjp4PkOyzFW9D7irw==
X-Received: by 2002:a17:907:2daa:b0:a9a:33c:f6e4 with SMTP id a640c23a62f3a-a9de61669b5mr1458266766b.40.1730284378989;
        Wed, 30 Oct 2024 03:32:58 -0700 (PDT)
Received: from eichest-laptop.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1e1a6b81sm558178466b.43.2024.10.30.03.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 03:32:58 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	Frank.li@nxp.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v4] PCI: imx6: Add suspend/resume support for i.MX6QDL
Date: Wed, 30 Oct 2024 11:32:45 +0100
Message-ID: <20241030103250.83640-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_033302_094087_293272A8 
X-CRM114-Status: GOOD (  23.92  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

The suspend/resume functionality is currently broken on the i.MX6QDL
platform, as documented in the NXP errata (ERR005723):
https://www.nxp.com/docs/en/errata/IMX6DQCE.pdf

This patch addresses the issue by sharing most of the suspend/resume
sequences used by other i.MX devices, while avoiding modifications to
critical registers that disrupt the PCIe functionality. It targets the
same problem as the following downstream commit:
https://github.com/nxp-imx/linux-imx/commit/4e92355e1f79d225ea842511fcfd42b343b32995

Unlike the downstream commit, this patch also resets the connected PCIe
device if possible. Without this reset, certain drivers, such as ath10k
or iwlwifi, will crash on resume. The device reset is also done by the
driver on other i.MX platforms, making this patch consistent with
existing practices.

Without this patch, suspend/resume will fail on i.MX6QDL devices if a
PCIe device is connected. Upon resuming, the kernel will hang and
display an error. Here's an example of the error encountered with the
ath10k driver:
ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
Unhandled fault: imprecise external abort (0x1406) at 0x0106f944

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
Changes in v4:
- Improve commit message (Bjorn)
- Fix style issue on comments (Bjorn)
- s/msi/MSI (Bjorn)

Changes in v3:
- Added a new flag to the driver data to indicate that the suspend/resume
  is broken on the i.MX6QDL platform. (Frank)
- Fix comments to be more relevant (Mani)
- Use imx_pcie_assert_core_reset in suspend (Mani)

 drivers/pci/controller/dwc/pci-imx6.c | 57 +++++++++++++++++++++------
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 808d1f1054173..c8d5c90aa4d45 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -82,6 +82,11 @@ enum imx_pcie_variants {
 #define IMX_PCIE_FLAG_HAS_SERDES		BIT(6)
 #define IMX_PCIE_FLAG_SUPPORT_64BIT		BIT(7)
 #define IMX_PCIE_FLAG_CPU_ADDR_FIXUP		BIT(8)
+/*
+ * Because of ERR005723 (PCIe does not support L2 power down) we need to
+ * workaround suspend resume on some devices which are affected by this errata.
+ */
+#define IMX_PCIE_FLAG_BROKEN_SUSPEND		BIT(9)
 
 #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
 
@@ -1237,9 +1242,19 @@ static int imx_pcie_suspend_noirq(struct device *dev)
 		return 0;
 
 	imx_pcie_msi_save_restore(imx_pcie, true);
-	imx_pcie_pm_turnoff(imx_pcie);
-	imx_pcie_stop_link(imx_pcie->pci);
-	imx_pcie_host_exit(pp);
+	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
+		/*
+		 * The minimum for a workaround would be to set PERST# and to
+		 * set the PCIE_TEST_PD flag. However, we can also disable the
+		 * clock which saves some power.
+		 */
+		imx_pcie_assert_core_reset(imx_pcie);
+		imx_pcie->drvdata->enable_ref_clk(imx_pcie, false);
+	} else {
+		imx_pcie_pm_turnoff(imx_pcie);
+		imx_pcie_stop_link(imx_pcie->pci);
+		imx_pcie_host_exit(pp);
+	}
 
 	return 0;
 }
@@ -1253,14 +1268,32 @@ static int imx_pcie_resume_noirq(struct device *dev)
 	if (!(imx_pcie->drvdata->flags & IMX_PCIE_FLAG_SUPPORTS_SUSPEND))
 		return 0;
 
-	ret = imx_pcie_host_init(pp);
-	if (ret)
-		return ret;
-	imx_pcie_msi_save_restore(imx_pcie, false);
-	dw_pcie_setup_rc(pp);
+	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
+		ret = imx_pcie->drvdata->enable_ref_clk(imx_pcie, true);
+		if (ret)
+			return ret;
+		ret = imx_pcie_deassert_core_reset(imx_pcie);
+		if (ret)
+			return ret;
+		/*
+		 * Using PCIE_TEST_PD seems to disable MSI and powers down the
+		 * root complex. This is why we have to setup the rc again and
+		 * why we have to restore the MSI register.
+		 */
+		ret = dw_pcie_setup_rc(&imx_pcie->pci->pp);
+		if (ret)
+			return ret;
+		imx_pcie_msi_save_restore(imx_pcie, false);
+	} else {
+		ret = imx_pcie_host_init(pp);
+		if (ret)
+			return ret;
+		imx_pcie_msi_save_restore(imx_pcie, false);
+		dw_pcie_setup_rc(pp);
 
-	if (imx_pcie->link_is_up)
-		imx_pcie_start_link(imx_pcie->pci);
+		if (imx_pcie->link_is_up)
+			imx_pcie_start_link(imx_pcie->pci);
+	}
 
 	return 0;
 }
@@ -1485,7 +1518,9 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX6Q] = {
 		.variant = IMX6Q,
 		.flags = IMX_PCIE_FLAG_IMX_PHY |
-			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE,
+			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
+			 IMX_PCIE_FLAG_BROKEN_SUSPEND |
+			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.dbi_length = 0x200,
 		.gpr = "fsl,imx6q-iomuxc-gpr",
 		.clk_names = imx6q_clks,
-- 
2.43.0


