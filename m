Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB07C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 01:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNCqT94Ecf3jopl3fOX911keGckziAV+JncCwnAF0dw=; b=CE0IXyiZDI6HOohEcaOno4dNW7
	1gYfeWzl0ztpqUTuF50KoC6PiMvntPQlUJeVK+kMK/O+Ek40vgU0rmaTu4ZL+Z7k9exqRl3xNRANV
	mq1Z6hinlwmCXZsZZf7gBB7cfVQYH/qPatIAZFFmHTi1TPxA3KShz2xr7ydzNWAlXQk7kVKOZXwAk
	ZiXeOXDOd3dY0ix2JeSfSUhiPO10QNGXw5+cIhs7eRYNOue2bv9xvS2EQLZ/oDr3I9woXCrjW4c0F
	7HAj4U3hJ4OnPKlgwY+kw2czqc9zFMJ8cdJkfcP0gI7uevqXMezSV8CwANu3KiEx9DcW7NH5T5lid
	ZbDR0uHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj6th-0000000BbmE-3T02;
	Tue, 05 Aug 2025 01:55:25 +0000
Received: from mo-csw1122.securemx.jp ([210.130.202.158] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj6m2-0000000BbKd-0o11
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 01:47:32 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References;i=
	nobuhiro1.iwamatsu@toshiba.co.jp;s=key1.smx;t=1754358432;x=1755568032;bh=pGq8
	OghSRkoVpKXdQVPo3XwOy10QtKXSakuHLC/l4X0=;b=jRm2RC6HD8TzM4etmwwj+8IvAJHHnMB+Dg
	ZmDQbcWi9cZzvvDvoUvWDKyx2FSC/ICUTRY7Oe/x61ogo/+o5HwQi9AJUwlX7H6f4asPgz3y69R4z
	p0+iL72HsjfUC4SP+k6KsY4lc9FewdGM0pV6py8LrwQGS3u0Cue82omNZKzKnbdBWEtDITwT2kRZu
	tiwEBPALmGTOhpCHzFYnceXk8T2g9ceJCRMlkwSmsO0WbEaYpCVr8RezDGd3YZAxNLZ1e2CLjC3nF
	V3/zHl+vKorLuUbFMwxFDH81sHczixY9zRPjM1lRUtqpFRZa1Nb5ED0BlHc7w4tpqSFFz1VFmyMhQ
	==;
Received: by mo-csw.securemx.jp (mx-mo-csw1122) id 5751lAjP3375559; Tue, 5 Aug 2025 10:47:10 +0900
X-Iguazu-Qid: 2rWhSHZE8neFYwT8dx
X-Iguazu-QSIG: v=2; s=0; t=1754358429; q=2rWhSHZE8neFYwT8dx; m=Vy0RmsCaLnFpSTmT4FGM0wu37Shjywsl5PqDNukgIcc=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1122) id 5751l7gS037751
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 5 Aug 2025 10:47:08 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
        bhelgaas@google.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        yuji2.ishikawa@toshiba.co.jp
Subject: [PATCH v2 2/2] PCI: dwc: visconti: Remove cpu_addr_fix() after DTS fix ranges
Date: Tue,  5 Aug 2025 10:47:01 +0900
X-TSB-HOP2: ON
Message-Id: <1754358421-12578-3-git-send-email-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1754358421-12578-1-git-send-email-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <1754358421-12578-1-git-send-email-nobuhiro1.iwamatsu@toshiba.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_184730_704225_3AAC5A82 
X-CRM114-Status: GOOD (  10.83  )
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
---
v2:
  No Update.

 drivers/pci/controller/dwc/pcie-visconti.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-visconti.c b/drivers/pci/controller/dwc/pcie-visconti.c
index 2a724ab587f78..d8765e57147af 100644
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
-- 
2.49.0



