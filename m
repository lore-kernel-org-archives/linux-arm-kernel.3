Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DA0CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vj2uaDJCxGQbaAM5o1tES0SUnARreMitm6wm4PP1R30=; b=Ok2S4c9eengn5NuJJLCjH+4psT
	fjEJ0iBlx1DdhV1fHrgUoleCgrv0UDHZjfdVl+79j2KXP9VU4IS7/yck/R1RRbO5hac+bxmvntv7h
	n0TRT2T+qKCVVRvt5SVsRIqspLCO8YvUHsrqtXnqt/SEp4coroGW9Py5/FHzvGGR4pZX6I6wLgFs0
	/+9ClrBpm7i2plTvnmeX7BydgVYQEilzukXJ4GoyiY4pNh3fIQ42mdNjjGvKxonxTO81goLKTCmq7
	+Jl/XcPohoKSUvH/9Y38nre2Yioi0ypuN6oBCkqyxubB7Z67T+49rGRARoF9RX221O+j4BqbWow4j
	srRTC5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2q6-00000009E0T-2kfb;
	Fri, 12 Sep 2025 12:25:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2q4-00000009DyL-2PUa
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 12:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vj2uaDJCxGQbaAM5o1tES0SUnARreMitm6wm4PP1R30=; b=kzoG1AMYjYilByBpJDK26GggLd
	RhI8+IHdubRBIeHqker3Mx8H606zbeZ1F4hRnu/SnKt6eL6DXvUbzI4yRD/WM9PcyEln9iQ/awKfJ
	8pd1GWTffu4mP4ysd1CLny8nDm+iEG28M2m7CVCYkC8gJhLGrtpIchH0Mo9IbIc9dCZIjJAmc1hxl
	4Ig1u/bE6c1FsOuVMtEcpgDiUamX7GZImWTcKifg1WfV/SZKpuR7sqNUSWDj6i75F4ys7EkV1We4i
	KRTICNxntGA3mp6+nXJS031uZwKIm7DibNOW8mxwEkI5fM8C1Lpum1W7c2qgT2h1md6qshyyAeT3R
	4BrrKqaA==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2q1-00000006Mac-14tL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:25:15 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CCOrbn517286;
	Fri, 12 Sep 2025 07:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757679893;
	bh=vj2uaDJCxGQbaAM5o1tES0SUnARreMitm6wm4PP1R30=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bFgUuti5l61jeacjYH7OkeHcu6S6d9/GAcx/aiKxVI93iaBFlotTTLz3E3IbscnsP
	 CpkCje3swMwqyiNLrPoUoQ7YpGltPGsSLFzD3eCF01J4soG1vkfs9tYK8whgX5Y3O6
	 AfSy9QCMy8vqnrzSOwsj+kLjc/zjtxDSJHojY8lY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CCOrtr1969762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 07:24:53 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 07:24:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 07:24:53 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CCNuLZ3589278;
	Fri, 12 Sep 2025 07:24:46 -0500
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
Subject: [PATCH v2 07/10] PCI: keystone: Add ks_pcie_host_deinit() helper for cleanup
Date: Fri, 12 Sep 2025 17:46:18 +0530
Message-ID: <20250912122356.3326888-8-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912122356.3326888-1-s-vadapalli@ti.com>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_132513_661175_6D7941CE 
X-CRM114-Status: GOOD (  11.90  )
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

Introduce the helper function ks_pcie_host_deinit() to undo the
configuration performed by the ks_pcie_host_init() function and also to
free the MSI Domains if the '.msi_init' callback was implemented which
would have made a call to dw_pcie_allocate_domains().

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1: https://lore.kernel.org/r/20250903124505.365913-8-s-vadapalli@ti.com/
No changes since v1.

 drivers/pci/controller/dwc/pci-keystone.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 074566fb1d74..3a3188e89a2a 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -885,6 +885,18 @@ static int ks_pcie_init_id(struct keystone_pcie *ks_pcie)
 	return 0;
 }
 
+static void ks_pcie_host_deinit(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
+
+	ks_pcie_stop_link(pci);
+	ks_pcie_free_msi_irq(ks_pcie);
+	ks_pcie_free_intx_irq(ks_pcie);
+	if (pci->pp.ops->msi_init)
+		dw_pcie_free_domains(pp);
+}
+
 static int ks_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -929,11 +941,13 @@ static int ks_pcie_host_init(struct dw_pcie_rp *pp)
 
 static const struct dw_pcie_host_ops ks_pcie_host_ops = {
 	.init = ks_pcie_host_init,
+	.deinit = ks_pcie_host_deinit,
 	.msi_init = ks_pcie_msi_host_init,
 };
 
 static const struct dw_pcie_host_ops ks_pcie_am654_host_ops = {
 	.init = ks_pcie_host_init,
+	.deinit = ks_pcie_host_deinit,
 };
 
 static irqreturn_t ks_pcie_err_irq_handler(int irq, void *priv)
-- 
2.43.0


