Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62397CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKO8MzldBexrXr7kewzqwdKjuMhvxB9kVL4I0IFKJYo=; b=vVLn13KoZKw3zAYunXYpLscPxu
	dpZxQNxJ2IvOWep/Cjk/gA/0OGzBM5YwW9SMz9Kptzo107ldZQTz3sXQJA8BfN2iYPcwhbdg297EJ
	NghYKwxUf5SZlrymgdcA5T2z63+hxRf2krY9sxEvTak8WMiTEPoWNSLPr8o/bW4AqD+4si2tLdU8H
	9pP3hm7XLCSI1YJEF/3e97BK046h/xBUoDJJkXpOf0zvoGd26+3AbjEHsLC9rijLvVNR2X4Vft/9w
	hpd9iVuhBh3AFT0y2qMsymMeO5H4Km7GjrFFw2VT9ArV1JuvKZUQNZYyDQEyhARQ3e80n+LaAyOoo
	b0F5tAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utoxE-00000006ohf-3XEm;
	Wed, 03 Sep 2025 14:59:20 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmrr-00000006RJr-25YR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:45:40 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583CjQxa2831256;
	Wed, 3 Sep 2025 07:45:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756903526;
	bh=CKO8MzldBexrXr7kewzqwdKjuMhvxB9kVL4I0IFKJYo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=phcOzWfZaowJgVm92lbNrSgcQ85gj6mmpdDlxdM+SpxQzgDXxs1PID4pnUdlu2/Ip
	 aEf08G7t4Iy1UdviKxIifxG6cDxCd0UcHiUhxsbKS3j7G08pVxkwvE5TqoFfM4NZDA
	 DB1Hd8BeIbd4k5tMwAvzdUOSeM4SH6oRhRv/O5zo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583CjQl43043970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 07:45:26 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 07:45:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 07:45:26 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 583Cj5wT1576150;
	Wed, 3 Sep 2025 07:45:19 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <fan.ni@samsung.com>, <quic_wenbyao@quicinc.com>,
        <namcao@linutronix.de>, <mayank.rana@oss.qualcomm.com>,
        <thippeswamy.havalige@amd.com>, <quic_schintav@quicinc.com>,
        <shradha.t@samsung.com>, <inochiama@gmail.com>, <cassel@kernel.org>,
        <kishon@kernel.org>, <18255117159@163.com>, <rongqianfeng@vivo.com>,
        <jirislaby@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 02/11] PCI: dwc: Export dw_pcie_allocate_domains() for pci-keystone
Date: Wed, 3 Sep 2025 18:14:43 +0530
Message-ID: <20250903124505.365913-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903124505.365913-1-s-vadapalli@ti.com>
References: <20250903124505.365913-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_054539_579150_94BADE03 
X-CRM114-Status: GOOD (  10.22  )
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

The pci-keystone.c driver uses the 'dw_pcie_allocate_domains()' helper.
In preparation for enabling the pci-keystone.c driver to be built as a
loadable module, export 'dw_pcie_allocate_domains()'.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 952f8594b501..3cc83d921376 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -229,6 +229,7 @@ int dw_pcie_allocate_domains(struct dw_pcie_rp *pp)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dw_pcie_allocate_domains);
 
 void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 {
-- 
2.43.0


