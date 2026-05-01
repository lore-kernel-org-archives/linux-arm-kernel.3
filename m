Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9114CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 15:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aeBBsyJs/AzaHwhJE6ObIy2Do41KSXQFhXY0km+Aejo=; b=WWPwfsAC1pfNjTOLGyuKkLE6po
	FIbUI8ot1Pwccxa1bC49P6EeUMr1QB9SOAoq9HDk8SO+Us2odwg8jfPUzjDat1Hup8dXa9Uj9pPAe
	CdFIvYtl1rH0oPcocX8CL/oH23vweLshaj2mVWFwuo8Nr/d2tuVQqmBDmo38m5/wDVbnrznUaA61D
	7EqT3giVqE+OfRT+laIoIzELSm7tANF3kLTLNYERS1sPdSRdvitGiCVnsRumiqgTfjngVfGORdfhr
	NP6yukNmu24HvFgpTRyWEkJIvMb8/fb58fcTtVPum7/MvrLBkb+a1Muegs3elYJZ2sxAR6353Jk6S
	bK6nkBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpum-00000007M6t-09bv;
	Fri, 01 May 2026 15:36:28 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpuj-00000007M6E-3FIX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 15:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ae
	BBsyJs/AzaHwhJE6ObIy2Do41KSXQFhXY0km+Aejo=; b=WqbylfZW8sxj0zm1LW
	Ei3h8AxRJqg0USYkfCmkIZn5WVr0qEdDUA2svBjrB8XJ3GlNkoTN8boIGCRJnLTi
	MgE3/YtYq5V4AVTwpYTQhUGIaBO3OjGYuc/2W/hHrSKJsNwXghDx3gLhmAYowEHp
	xAWdHF6AufquuLzoMNuFE9oKA=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCH4HBbyPRpuOd_Cw--.58479S3;
	Fri, 01 May 2026 23:35:56 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vigneshr@ti.com
Cc: robh@kernel.org,
	s-vadapalli@ti.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 1/2] PCI: cadence: Ensure that cdns_pcie_host_wait_for_link() waits 100 ms after link up
Date: Fri,  1 May 2026 23:35:52 +0800
Message-Id: <20260501153553.66382-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501153553.66382-1-18255117159@163.com>
References: <20260501153553.66382-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCH4HBbyPRpuOd_Cw--.58479S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr15Zw4xXw1rWrWDJF4rGrg_yoW5AF4Upa
	yUWryfGF1xXrWY9an5A3WUXryYq3Z0ka47Jw4vgFyxWr17CrWDJFnFgF1fKFy3trsFvr13
	ZF1DtF9rGF4avr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pMyIUUUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:a6da:de99:5aab:66f2]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xzghGn0yFyuoQAA3V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_083626_210512_31CF6156 
X-CRM114-Status: GOOD (  13.12  )
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

As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link speeds
greater than 5.0 GT/s, software must wait a minimum of 100 ms after Link
training completes before sending a Configuration Request.

Add a new 'max_link_speed' field in struct cdns_pcie to record the
maximum supported (or currently configured) link speed of the controller.

In cdns_pcie_host_wait_for_link(), after the link is reported as up,
insert a 100 ms delay if max_link_speed > 2 (i.e., > 5 GT/s). This
implements the required delay at the common Cadence host layer.

Currently max_link_speed is zero-initialized, so the delay is not yet
active. Glue drivers must set max_link_speed appropriately to enable
the delay. This matches the approach taken for the Synopsys DWC
controller in commit 80dc18a0cba8d ("PCI: dwc: Ensure that
dw_pcie_wait_for_link() waits 100 ms after link up").

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 .../pci/controller/cadence/pcie-cadence-host-common.c    | 9 +++++++++
 drivers/pci/controller/cadence/pcie-cadence.h            | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-common.c b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
index 2b0211870f02..d4ae762f423f 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
@@ -14,6 +14,7 @@
 
 #include "pcie-cadence.h"
 #include "pcie-cadence-host-common.h"
+#include "../../pci.h"
 
 #define LINK_RETRAIN_TIMEOUT HZ
 
@@ -55,6 +56,14 @@ int cdns_pcie_host_wait_for_link(struct cdns_pcie *pcie,
 	/* Check if the link is up or not */
 	for (retries = 0; retries < LINK_WAIT_MAX_RETRIES; retries++) {
 		if (pcie_link_up(pcie)) {
+			/*
+			 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that
+			 * supports Link speeds greater than 5.0 GT/s, software
+			 * must wait a minimum of 100 ms after Link training
+			 * completes before sending a Configuration Request.
+			 */
+			if (pcie->max_link_speed > 2)
+				msleep(PCIE_RESET_CONFIG_WAIT_MS);
 			dev_info(dev, "Link up\n");
 			return 0;
 		}
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 574e9cf4d003..e222b095d2b6 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -86,6 +86,7 @@ struct cdns_plat_pcie_of_data {
  * @ops: Platform-specific ops to control various inputs from Cadence PCIe
  *       wrapper
  * @cdns_pcie_reg_offsets: Register bank offsets for different SoC
+ * @max_link_speed: maximum supported link speed
  */
 struct cdns_pcie {
 	void __iomem		             *reg_base;
@@ -98,6 +99,7 @@ struct cdns_pcie {
 	struct device_link	             **link;
 	const  struct cdns_pcie_ops          *ops;
 	const  struct cdns_plat_pcie_of_data *cdns_pcie_reg_offsets;
+	int				     max_link_speed;
 };
 
 /**
-- 
2.34.1


