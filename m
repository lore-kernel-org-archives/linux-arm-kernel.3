Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A157DCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Da/XaA3WaCTSdzwdYk0sEhHYo+sgG9siIt2+rDb1DwU=; b=L3mABYawMtps7YJuQqjoxRpixx
	P6iWGlxxcHKk0mQGPtKOADRcLH9UTkArWfmU890dBqCgC5wwgU7puDqLTqXShi6Vy15rggdQEkkPS
	F9gVDwRJLKpae89DZ6cKcpow/2ktGLpco4eNOf1Cohn0IP4Jha8dtw62gEWuxXnaCwSdbpIODFLIF
	7WUaP08pe5nwOFKv4G23DbDusrxvw/w6HlcT9fyhLG05A3SgxEcpVsvPJ1SAEdpg1t2Fi79EzsoFs
	SRdvJ48uiGU2RBWeXkHjI3ccAYTgVmK0912UVCvk+WkKvblL8Zd4g/syFSjDJmtZBOO25Cv8d6i0T
	HBZjEPvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVbK-00000002Lqa-258n;
	Wed, 22 Oct 2025 09:57:52 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVb8-00000002LfJ-13WL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:57:43 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59M9vS711387143;
	Wed, 22 Oct 2025 04:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761127048;
	bh=Da/XaA3WaCTSdzwdYk0sEhHYo+sgG9siIt2+rDb1DwU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vaZQl3ndPjmI1KoNdjaFFQeoLrsbwDREm6DPRPz6DzvXTZAS78CUneWEung3wyKL+
	 6X9pk/E0KmCzgPrf7fLWvcdYI8nX49yZgzl1PxMR+TPQ3Fmgpi5f2SPjOKDQzig5pc
	 tQLAqFeK0pwOxuUF0J6OQ+i9MqPks2RxdUFfKK+0=
Received: from DFLE205.ent.ti.com (dfle205.ent.ti.com [10.64.6.63])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59M9vSeY2266303
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Oct 2025 04:57:28 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 04:57:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 04:57:28 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59M9vFcW1029418;
	Wed, 22 Oct 2025 04:57:22 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <quic_wenbyao@quicinc.com>, <inochiama@gmail.com>,
        <mayank.rana@oss.qualcomm.com>, <thippeswamy.havalige@amd.com>,
        <shradha.t@samsung.com>, <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>, <jirislaby@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v4 1/4] PCI: Export pci_get_host_bridge_device() for use by pci-keystone
Date: Wed, 22 Oct 2025 15:27:09 +0530
Message-ID: <20251022095724.997218-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022095724.997218-1-s-vadapalli@ti.com>
References: <20251022095724.997218-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_025741_364634_FF4519C1 
X-CRM114-Status: GOOD (  11.65  )
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

v3:
https://lore.kernel.org/r/20250922071222.2814937-2-s-vadapalli@ti.com/
Changes since v3:
- Rebased patch on 6.18-rc1 tag of Mainline Linux.

Regards,
Siddharth.

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
2.51.0


