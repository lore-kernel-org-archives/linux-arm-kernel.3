Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F9FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPZJxbk9K6Dp3+vYechyZZ5apx5YKOsm+E5HgYvS4Pw=; b=WHwNPZp/zzApARwEC7SFusch1Z
	kfhULteAOC3uzcRObQAPwtx4nkeuoQtzcbmonMixrqhmEEaNppUDfgVCPvdNgUMa35Uj5AF10AhsX
	9FWIuUI03Hs29T4BSeSh1sh1O/zWlrOtKwLR7o34uKlvqZh43BQTGO/77fEE+MO/zltz8EC/mAzY3
	JOEnS+DcbT7N33Tj3FUdhanOlcZZKYTzJl2bjZcxGvDR5sNdyWJK1isXwcJy97w99I9+54FRl2Dit
	6X8kPX3vWZNsVGk8HL4zN0RatU8Vs0UFhrPwMA0nm4N6YkiOKbyd9AvxpvRmbBCfZ2ymw1QE+0dEj
	Uq+TyLoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2pf-00000009DfG-3dtG;
	Fri, 12 Sep 2025 12:24:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2pe-00000009DcZ-0yDQ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 12:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dPZJxbk9K6Dp3+vYechyZZ5apx5YKOsm+E5HgYvS4Pw=; b=jHmw3nVLickDZrWUNn4MzLFkUR
	vzUEi6Mh6wqbXuObbd6boYM5KNtq+DrIk42gudj76Je8BU/ymJoNyjLB0v5fbrYr++JgD4DBtaeyw
	bufGxnC+yAdf2eox3pyP6VSm1fDVcmEtI7zXJQVybsncTSrEBBlM5dAmm0xLBc2pPNayUFBPUpyi2
	NEHGJTqVtzNQ0/U0KghfTdXUjOtK5rCvIcG2wdk+S46WM0cEEgQXwneZWL7P6m403aCy7LqSQdB61
	PNAmkhROJNN5xDK8f06hL/nOx8BBxJ2r4KZYLSY+plIwpf2XwMWM95jhiEcjT1go1cpM5dlcDPMP1
	SBU75Hiw==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2pa-00000006MZY-2xGl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:24:49 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CCOWE6967969;
	Fri, 12 Sep 2025 07:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757679872;
	bh=dPZJxbk9K6Dp3+vYechyZZ5apx5YKOsm+E5HgYvS4Pw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vaIzJEnod3eB25pAYFXH/FEOakHccoLxdsp1WhqVUERDTddzZ1LuX22DihhY4SpWo
	 +ta0Sas5eLOTwT5uJj2k24D22ERfB6E5qM5GPMKUH2xCH4rInaE72elrylOOeUf2do
	 IOkpyIE8VnjRGd0zMky8IyJiej/j3vRt3ZhvoNU8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CCOW301969711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 07:24:32 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 07:24:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 07:24:32 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CCNuLW3589278;
	Fri, 12 Sep 2025 07:24:25 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <christian.bruel@foss.st.com>, <qiang.yu@oss.qualcomm.com>,
        <mayank.rana@oss.qualcomm.com>, <thippeswamy.havalige@amd.com>,
        <shradha.t@samsung.com>, <quic_schintav@quicinc.com>,
        <inochiama@gmail.com>, <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>
CC: <jirislaby@kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 04/10] PCI: dwc: ep: Export dw_pcie_ep_raise_msix_irq() for pci-keystone
Date: Fri, 12 Sep 2025 17:46:15 +0530
Message-ID: <20250912122356.3326888-5-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912122356.3326888-1-s-vadapalli@ti.com>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_132447_171284_38EEC659 
X-CRM114-Status: UNSURE (   9.38  )
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

The pci-keystone.c driver uses the 'dw_pcie_ep_raise_msix_irq()' helper.
In preparation for enabling the pci-keystone.c driver to be built as a
loadable module, export 'dw_pcie_ep_raise_msix_irq()'.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1: https://lore.kernel.org/r/20250903124505.365913-5-s-vadapalli@ti.com/
No changes since v1.

 drivers/pci/controller/dwc/pcie-designware-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 7f2112c2fb21..19571ac2b961 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -797,6 +797,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_msix_irq);
 
 /**
  * dw_pcie_ep_cleanup - Cleanup DWC EP resources after fundamental reset
-- 
2.43.0


