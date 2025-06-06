Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B41C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 02:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zvqyrk8kJ2uCb2GN+GGEe5HFwqiqtZruRDoufvNL+rA=; b=wmzFWjKz0ldmAYKgpdrzKNuCMA
	qv04hCfvLNwH5zQYgmXOJ8N1QKUeJbCTiNpMWKsTjYAzwckZuL+3YSuttnFO+ecwwhST6EVQqYczg
	thEOhUl3AMFAOh0gN4ITjg5ra9lAmE6VFbIOG3eyuPkNO0pliBpL9Mi76QHp8kjOtFpCDodPzb4d9
	wjiklh+rVmSdTKCafqZg7YZ0MPT1l5Bj9u+BFBlrn7fOfNCdcPWAsvS0qz/JV+ESmt9kQpCNmQWNd
	C5mvEOFVGF5VCnpUGV5HeyCAnXi40W5k0QpMNkYyCbmyW2bXT3jxt2YBegKS1KuTxdK2U0wDX7WfY
	LU2al9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNMXF-0000000Gx1r-2Ouu;
	Fri, 06 Jun 2025 02:10:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNML6-0000000Gvtl-0D32;
	Fri, 06 Jun 2025 01:57:49 +0000
X-UUID: a2f3d52c427911f09eb0dd999d3936bf-20250605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zvqyrk8kJ2uCb2GN+GGEe5HFwqiqtZruRDoufvNL+rA=;
	b=c451iHvUFND2MP+owIGUkc9BGH0qXO8kJu99ot/PPbkgqA+FocHFZNG5Dxh8X9vEM8JoRmQ9h8WeJaS+NL+cwwNn6TY96nAmiF2hctt3Fa1dpMIrHj70PvZ6O6Viwmmz3oBxlV4LysFBiBTFyYwstXhwO8OQ0M5HY+G+rtsI1VE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:98feb9a7-2558-4a5d-83ce-395ae39c0166,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:85466158-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: a2f3d52c427911f09eb0dd999d3936bf-20250605
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1250415756; Thu, 05 Jun 2025 18:57:44 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 6 Jun 2025 09:57:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 6 Jun 2025 09:57:40 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: <patches@lists.linux.dev>, <stable@vger.kernel.org>
CC: Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ajay Agarwal
	<ajayagarwal@google.com>, Daniel Stodden <daniel.stodden@gmail.com>, Macpaul
 Lin <macpaul.lin@mediatek.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kwilczynski@kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Deren Wu <Deren.Wu@mediatek.com>, Ramax
 Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, MediaTek
 Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Johnny-CC Chang <Johnny-CC.Chang@mediatek.com>
Subject: [PATCH 6.11 1/1] PCI/ASPM: Disable L1 before disabling L1 PM Substates
Date: Fri, 6 Jun 2025 09:57:38 +0800
Message-ID: <20250606015738.2724220-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_185748_088523_3275E80A 
X-CRM114-Status: GOOD (  17.64  )
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

From: Ajay Agarwal <ajayagarwal@google.com>

[ Upstream commit 7447990137bf06b2aeecad9c6081e01a9f47f2aa ]

PCIe r6.2, sec 5.5.4, requires that:

  If setting either or both of the enable bits for ASPM L1 PM Substates,
  both ports must be configured as described in this section while ASPM L1
  is disabled.

Previously, pcie_config_aspm_l1ss() assumed that "setting enable bits"
meant "setting them to 1", and it configured L1SS as follows:

  - Clear L1SS enable bits
  - Disable L1
  - Configure L1SS enable bits as required
  - Enable L1 if required

With this sequence, when disabling L1SS on an ARM A-core with a Synopsys
DesignWare PCIe core, the CPU occasionally hangs when reading
PCI_L1SS_CTL1, leading to a reboot when the CPU watchdog expires.

Move the L1 disable to the caller (pcie_config_aspm_link(), where L1 was
already enabled) so L1 is always disabled while updating the L1SS bits:

  - Disable L1
  - Clear L1SS enable bits
  - Configure L1SS enable bits as required
  - Enable L1 if required

Change pcie_aspm_cap_init() similarly.

Link: https://lore.kernel.org/r/20241007032917.872262-1-ajayagarwal@google.com
Signed-off-by: Ajay Agarwal <ajayagarwal@google.com>
[bhelgaas: comments, commit log, compute L1SS setting before config access]
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Johnny-CC Chang <Johnny-CC.Chang@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/pci/pcie/aspm.c | 92 ++++++++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 42 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index cee2365e54b8..e943691bc931 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -805,6 +805,15 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &parent_lnkctl);
 	pcie_capability_read_word(child, PCI_EXP_LNKCTL, &child_lnkctl);
 
+	/* Disable L0s/L1 before updating L1SS config */
+	if (FIELD_GET(PCI_EXP_LNKCTL_ASPMC, child_lnkctl) ||
+	    FIELD_GET(PCI_EXP_LNKCTL_ASPMC, parent_lnkctl)) {
+		pcie_capability_write_word(child, PCI_EXP_LNKCTL,
+					   child_lnkctl & ~PCI_EXP_LNKCTL_ASPMC);
+		pcie_capability_write_word(parent, PCI_EXP_LNKCTL,
+					   parent_lnkctl & ~PCI_EXP_LNKCTL_ASPMC);
+	}
+
 	/*
 	 * Setup L0s state
 	 *
@@ -829,6 +838,13 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 
 	aspm_l1ss_init(link);
 
+	/* Restore L0s/L1 if they were enabled */
+	if (FIELD_GET(PCI_EXP_LNKCTL_ASPMC, child_lnkctl) ||
+	    FIELD_GET(PCI_EXP_LNKCTL_ASPMC, parent_lnkctl)) {
+		pcie_capability_write_word(parent, PCI_EXP_LNKCTL, parent_lnkctl);
+		pcie_capability_write_word(child, PCI_EXP_LNKCTL, child_lnkctl);
+	}
+
 	/* Save default state */
 	link->aspm_default = link->aspm_enabled;
 
@@ -845,25 +861,28 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	}
 }
 
-/* Configure the ASPM L1 substates */
+/* Configure the ASPM L1 substates. Caller must disable L1 first. */
 static void pcie_config_aspm_l1ss(struct pcie_link_state *link, u32 state)
 {
-	u32 val, enable_req;
+	u32 val;
 	struct pci_dev *child = link->downstream, *parent = link->pdev;
 
-	enable_req = (link->aspm_enabled ^ state) & state;
+	val = 0;
+	if (state & PCIE_LINK_STATE_L1_1)
+		val |= PCI_L1SS_CTL1_ASPM_L1_1;
+	if (state & PCIE_LINK_STATE_L1_2)
+		val |= PCI_L1SS_CTL1_ASPM_L1_2;
+	if (state & PCIE_LINK_STATE_L1_1_PCIPM)
+		val |= PCI_L1SS_CTL1_PCIPM_L1_1;
+	if (state & PCIE_LINK_STATE_L1_2_PCIPM)
+		val |= PCI_L1SS_CTL1_PCIPM_L1_2;
 
 	/*
-	 * Here are the rules specified in the PCIe spec for enabling L1SS:
-	 * - When enabling L1.x, enable bit at parent first, then at child
-	 * - When disabling L1.x, disable bit at child first, then at parent
-	 * - When enabling ASPM L1.x, need to disable L1
-	 *   (at child followed by parent).
-	 * - The ASPM/PCIPM L1.2 must be disabled while programming timing
+	 * PCIe r6.2, sec 5.5.4, rules for enabling L1 PM Substates:
+	 * - Clear L1.x enable bits at child first, then at parent
+	 * - Set L1.x enable bits at parent first, then at child
+	 * - ASPM/PCIPM L1.2 must be disabled while programming timing
 	 *   parameters
-	 *
-	 * To keep it simple, disable all L1SS bits first, and later enable
-	 * what is needed.
 	 */
 
 	/* Disable all L1 substates */
@@ -871,26 +890,6 @@ static void pcie_config_aspm_l1ss(struct pcie_link_state *link, u32 state)
 				       PCI_L1SS_CTL1_L1SS_MASK, 0);
 	pci_clear_and_set_config_dword(parent, parent->l1ss + PCI_L1SS_CTL1,
 				       PCI_L1SS_CTL1_L1SS_MASK, 0);
-	/*
-	 * If needed, disable L1, and it gets enabled later
-	 * in pcie_config_aspm_link().
-	 */
-	if (enable_req & (PCIE_LINK_STATE_L1_1 | PCIE_LINK_STATE_L1_2)) {
-		pcie_capability_clear_word(child, PCI_EXP_LNKCTL,
-					   PCI_EXP_LNKCTL_ASPM_L1);
-		pcie_capability_clear_word(parent, PCI_EXP_LNKCTL,
-					   PCI_EXP_LNKCTL_ASPM_L1);
-	}
-
-	val = 0;
-	if (state & PCIE_LINK_STATE_L1_1)
-		val |= PCI_L1SS_CTL1_ASPM_L1_1;
-	if (state & PCIE_LINK_STATE_L1_2)
-		val |= PCI_L1SS_CTL1_ASPM_L1_2;
-	if (state & PCIE_LINK_STATE_L1_1_PCIPM)
-		val |= PCI_L1SS_CTL1_PCIPM_L1_1;
-	if (state & PCIE_LINK_STATE_L1_2_PCIPM)
-		val |= PCI_L1SS_CTL1_PCIPM_L1_2;
 
 	/* Enable what we need to enable */
 	pci_clear_and_set_config_dword(parent, parent->l1ss + PCI_L1SS_CTL1,
@@ -937,21 +936,30 @@ static void pcie_config_aspm_link(struct pcie_link_state *link, u32 state)
 		dwstream |= PCI_EXP_LNKCTL_ASPM_L1;
 	}
 
+	/*
+	 * Per PCIe r6.2, sec 5.5.4, setting either or both of the enable
+	 * bits for ASPM L1 PM Substates must be done while ASPM L1 is
+	 * disabled. Disable L1 here and apply new configuration after L1SS
+	 * configuration has been completed.
+	 *
+	 * Per sec 7.5.3.7, when disabling ASPM L1, software must disable
+	 * it in the Downstream component prior to disabling it in the
+	 * Upstream component, and ASPM L1 must be enabled in the Upstream
+	 * component prior to enabling it in the Downstream component.
+	 *
+	 * Sec 7.5.3.7 also recommends programming the same ASPM Control
+	 * value for all functions of a multi-function device.
+	 */
+	list_for_each_entry(child, &linkbus->devices, bus_list)
+		pcie_config_aspm_dev(child, 0);
+	pcie_config_aspm_dev(parent, 0);
+
 	if (link->aspm_capable & PCIE_LINK_STATE_L1SS)
 		pcie_config_aspm_l1ss(link, state);
 
-	/*
-	 * Spec 2.0 suggests all functions should be configured the
-	 * same setting for ASPM. Enabling ASPM L1 should be done in
-	 * upstream component first and then downstream, and vice
-	 * versa for disabling ASPM L1. Spec doesn't mention L0S.
-	 */
-	if (state & PCIE_LINK_STATE_L1)
-		pcie_config_aspm_dev(parent, upstream);
+	pcie_config_aspm_dev(parent, upstream);
 	list_for_each_entry(child, &linkbus->devices, bus_list)
 		pcie_config_aspm_dev(child, dwstream);
-	if (!(state & PCIE_LINK_STATE_L1))
-		pcie_config_aspm_dev(parent, upstream);
 
 	link->aspm_enabled = state;
 
-- 
2.45.2


