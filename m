Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12A9CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3XdTXMqViHW3w0akxLE5zgfCKDRWCS1IEbV2e3TwRo=; b=qVKuAbYDF8kS632K737EuygnPD
	0MxYJcOUWWyBm+x6ru3oyOVt+cP6s+aZXpqwY2zfblq5TkAClvClyQs0/0/s47cXgkWXnfTdFpudh
	Xm4o1RvYQ/Rw9L1BxwudfcFqmRHxYAVYHCc3kT1oBiMkHFk54tPV8nX8m4leAPmNrZgeA6RDDgERs
	bPbEbHxzVQwLjViFMnMlx+Lq5AmX45/uy/JsrBgM3i4lhIFFtKB4Jn0P8iwdR4J8YQJS9h8PYvTSS
	0lKj13RlF4q916E24nrie+dB2dQTKnEUaiyMyis/BPRFmi0/JWn70NFyNfkVmjbiAon7LSgIoDe2a
	vGxY5YAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2pL-00000009DQm-3LRK;
	Fri, 12 Sep 2025 12:24:31 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2pJ-00000009DOm-1KK5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:24:30 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CCOBjD517246;
	Fri, 12 Sep 2025 07:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757679851;
	bh=d3XdTXMqViHW3w0akxLE5zgfCKDRWCS1IEbV2e3TwRo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=p0NIyCeKeJOHH6wpTbvd9FkVF2uY/Jl3hsoV7NsT1McJn8qbJgsZJGOLEfzPOaQhE
	 t07O4d5IBu8cGxLxgQWe53uwtH0V4aNFO/BFGsXEPgRPS8h2tCiJNyHlOagX6TSvbO
	 DEa26VcrtMfTxTyE+NGq9xfnIWHEUOhK7aB7OSdw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CCOBxn1291279
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 07:24:11 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 07:24:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 07:24:10 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CCNuLT3589278;
	Fri, 12 Sep 2025 07:24:04 -0500
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
Subject: [PATCH v2 01/10] PCI: Export pci_get_host_bridge_device() for use by pci-keystone
Date: Fri, 12 Sep 2025 17:46:12 +0530
Message-ID: <20250912122356.3326888-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912122356.3326888-1-s-vadapalli@ti.com>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_052429_468123_58E26F50 
X-CRM114-Status: GOOD (  10.68  )
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

The pci-keystone.c driver uses the 'pci_get_host_bridge_device()' helper.
In preparation for enabling the pci-keystone.c driver to be built as a
loadable module, export 'pci_get_host_bridge_device()'.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1: https://lore.kernel.org/r/20250903124505.365913-2-s-vadapalli@ti.com/
No changes since v1.

 drivers/pci/host-bridge.c | 1 +
 include/linux/pci.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/pci/host-bridge.c b/drivers/pci/host-bridge.c
index afa50b446567..be5ef6516cff 100644
--- a/drivers/pci/host-bridge.c
+++ b/drivers/pci/host-bridge.c
@@ -33,6 +33,7 @@ struct device *pci_get_host_bridge_device(struct pci_dev *dev)
 	kobject_get(&bridge->kobj);
 	return bridge;
 }
+EXPORT_SYMBOL_GPL(pci_get_host_bridge_device);
 
 void  pci_put_host_bridge_device(struct device *dev)
 {
diff --git a/include/linux/pci.h b/include/linux/pci.h
index d1fdf81fbe1e..b253cbc27d36 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -646,6 +646,7 @@ struct pci_host_bridge *pci_alloc_host_bridge(size_t priv);
 struct pci_host_bridge *devm_pci_alloc_host_bridge(struct device *dev,
 						   size_t priv);
 void pci_free_host_bridge(struct pci_host_bridge *bridge);
+struct device *pci_get_host_bridge_device(struct pci_dev *dev);
 struct pci_host_bridge *pci_find_host_bridge(struct pci_bus *bus);
 
 void pci_set_host_bridge_release(struct pci_host_bridge *bridge,
-- 
2.43.0


