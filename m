Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4F9CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 16:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rc26TBA8kHE73g2W9MG6AU932qr0T6b9mLZVD7CCCYk=; b=ITj5/ChUlu/nE5egoH8c6ZmNno
	q7+U+rlMRUoE5gtp3w3kyF+ArFzTuIUlCnRJTMG+x/FCl0LR9reaR8lrpYDOx5kMZIoY/KY4vUTmT
	oM63/SaxngD8LmQtTnhLPxpbqp5fEwatGTJWBJaxdRfNYZnzJdRkXGnp3FANklQfuOfdm8WSc3O2n
	9kWRdNDweBVqxIFedFjqaGmDLKJDKAqXFWZtWi+zd57dFoE8REDg4mxEcjUlgiqGXfAlHccRzwwKr
	wVC3UqUmQJp1DijbbD74RRG1QQTxAYuZTUxR6LptJwVMVHPdyqNBpk8sBPzhqi0IXmpK+vmp9DTeR
	r75+lSLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTi9-00000000ul7-3vPz;
	Tue, 02 Sep 2025 16:18:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ80-0000000HFhC-14xJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 02 Sep 2025 12:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=rc26TBA8kHE73g2W9MG6AU932qr0T6b9mLZVD7CCCYk=; b=ZYC2PH4xi3DC1so7WyTUJqGCvm
	UepyYnoreexbbjAQCETPWBYMqFlcHBrPqCwi27mVQwL+NTcPbyfI354QtoJs0OLwr/6SMvnfCkUUj
	Hk6im7pdgvyfuUKb7PcdlqFfCrg4y806yHqJ/ta1nH8yXzAUcnbSTU9rYqTtRzFc5D8Rudqt61L0j
	4Pld5EJMPWYU9l+WujbIUKz0mOJn19Hv275U+N9AIZtUjN/Iu+Ds4hPW+FyqLojytOSj9k8qr9nat
	8h5kPCZoFRaqk5pXM+qY4v0a0pMS+q/UbgXiFprlzoysOK8B1H99GXhyHZYwV47aC1/op4FlHHnFe
	Va4e2Nag==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ7v-00000003zyd-0fOV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:28:46 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5829o0Vr014977;
	Tue, 2 Sep 2025 14:28:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=rc26TBA8kHE73g2W9MG6AU
	932qr0T6b9mLZVD7CCCYk=; b=A0YfiPSKYFpUj/5k9h9nBv802d874hQs16bM6s
	ppPFAwDNKj8Etul0xG3jGEhlD+3oR1m9EFSCi/RpwGossBrz3AcXgb9ffD6B8cL2
	ebvrA4UlRrDwuPY695rA0N9clKvqNkUQ4dOTGQU8FNbDgLOmLw/WCgvICfwpaXbU
	upZHQoaW7FhHxYWrlEKuyGHMMmOrc/ivsX2HywsxzNtsSiTRb0ABWbX8vabHSK5o
	yr6AoKBBwXeXXw5JFFCTvVU5l6ZGSS65PZvr7qvWCsYMOXWNopq4SQQG9Qv48B7J
	SfmjFuyPPpXR8WpkVwLl4rvWhCdTe3AwohinkJ7XYYPRywwA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vc8m1e20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 14:28:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B8DC840047;
	Tue,  2 Sep 2025 14:27:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B1BC39EDB5;
	Tue,  2 Sep 2025 14:26:46 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 2 Sep
 2025 14:26:45 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>
CC: <linux-pci@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] PCI: stm32: Remove link_status in PCIe EP.
Date: Tue, 2 Sep 2025 14:26:41 +0200
Message-ID: <20250902122641.269725-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_132843_735928_5AE26680 
X-CRM114-Status: GOOD (  12.08  )
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

Guarding enable_irq/disable_irq against successive link start
link does not seem necessary, since it is not possible to start
the link twice. Similarly for stop.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20250828192054.GA957771@bhelgaas>
---
 drivers/pci/controller/dwc/pcie-stm32-ep.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index 1f46bcf0c79f..a00edb6067f1 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -18,11 +18,6 @@
 #include "pcie-designware.h"
 #include "pcie-stm32.h"
 
-enum stm32_pcie_ep_link_status {
-	STM32_PCIE_EP_LINK_DISABLED,
-	STM32_PCIE_EP_LINK_ENABLED,
-};
-
 struct stm32_pcie {
 	struct dw_pcie pci;
 	struct regmap *regmap;
@@ -30,7 +25,6 @@ struct stm32_pcie {
 	struct phy *phy;
 	struct clk *clk;
 	struct gpio_desc *perst_gpio;
-	enum stm32_pcie_ep_link_status link_status;
 	unsigned int perst_irq;
 };
 
@@ -66,11 +60,6 @@ static int stm32_pcie_start_link(struct dw_pcie *pci)
 	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
 	int ret;
 
-	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_ENABLED) {
-		dev_dbg(pci->dev, "Link is already enabled\n");
-		return 0;
-	}
-
 	dev_dbg(pci->dev, "Enable link\n");
 
 	ret = stm32_pcie_enable_link(pci);
@@ -81,8 +70,6 @@ static int stm32_pcie_start_link(struct dw_pcie *pci)
 
 	enable_irq(stm32_pcie->perst_irq);
 
-	stm32_pcie->link_status = STM32_PCIE_EP_LINK_ENABLED;
-
 	return 0;
 }
 
@@ -90,18 +77,11 @@ static void stm32_pcie_stop_link(struct dw_pcie *pci)
 {
 	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
 
-	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_DISABLED) {
-		dev_dbg(pci->dev, "Link is already disabled\n");
-		return;
-	}
-
 	dev_dbg(pci->dev, "Disable link\n");
 
 	disable_irq(stm32_pcie->perst_irq);
 
 	stm32_pcie_disable_link(pci);
-
-	stm32_pcie->link_status = STM32_PCIE_EP_LINK_DISABLED;
 }
 
 static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
-- 
2.34.1


