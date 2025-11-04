Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB91CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 16:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HV6aCZe858sfDxOrV63v3V1QYYmt0i4YMWexhlJ+tbA=; b=ZoQKo0dyuaRK7URnh5PJlApoDJ
	aJ+HlpwrnEZLvh09L3SS1AixOOPrKoVPdsDuxnvwBXxfm6W3EAlTf2h141sMLdDqk194Cbt+SMvJA
	dKINsWg5EYtIQ0DGkoGS11zpGh0dOqW57z7OTrIrHXjiMtX2VPYMQCvux5JeoIXibaPOvLZfIQbi8
	YL/x5BxVZbYTpQF6FgY6PVgxwgt/88gdgYzvKKTsF/zYckDzURQlioWs/yx77pyy0dGrX1DWWTdfL
	HrR2o/jHgG3nRUBEIK0GbXtFx88+sb1zYi0FzdOJEUKC6mfGiGrVR3aqlZ3VfTqFdb8CSI2pCAWIa
	EEK0p08w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKGn-0000000CDrb-15wN;
	Tue, 04 Nov 2025 16:52:33 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKGj-0000000CDqR-3zPu;
	Tue, 04 Nov 2025 16:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=HV
	6aCZe858sfDxOrV63v3V1QYYmt0i4YMWexhlJ+tbA=; b=h5fPKUyG1CKLVdQyTu
	mqwmctmn1qQwDOz2tGj7h+Tdo9iuWDESjeCwE7/7dQW/I2oRJRayNtpVq8v7/aPn
	4oxCiiIBRQ+sq3x445D2SNWU3f0GYyqQTxEzrO7vZ6yXnA2wa2PfNTfAZbhoNmo8
	hqp/h6gfjHeLs9zZ8r2nbHWpo=
Received: from zhb.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDHcqsQLwppjl+qCg--.1966S4;
	Wed, 05 Nov 2025 00:51:33 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	helgaas@kernel.org,
	heiko@sntech.de,
	mani@kernel.org,
	yue.wang@Amlogic.com
Cc: pali@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	cassel@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v6 2/2] PCI: dwc: Remove redundant MPS configuration
Date: Wed,  5 Nov 2025 00:51:25 +0800
Message-Id: <20251104165125.174168-3-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104165125.174168-1-18255117159@163.com>
References: <20251104165125.174168-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgDHcqsQLwppjl+qCg--.1966S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4xuw4xXFWDJw43WF4xtFb_yoW8Cr1fpF
	y3WrsakF18Ar45WF4qkan5Cay3tasxCry7JF9Ig34fZFyayFsrJa4ayFWFka4xWrW293WS
	kr98K3y8A3W5trUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEeOJbUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:355:1a70:fad9:bcdf]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiFQH7o2kKLUUm0AABsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_085230_431058_70FEF677 
X-CRM114-Status: UNSURE (   8.08  )
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

The Meson PCIe controller driver manually configures maximum payload
size (MPS) through meson_set_max_payload, duplicating functionality now
centralized in the PCI core.  Deprecating redundant code simplifies the
driver and aligns it with the consolidated MPS management strategy,
improving long-term maintainability.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 787469d1b396..3d12e1a9bb0c 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -261,22 +261,6 @@ static int meson_size_to_payload(struct meson_pcie *mp, int size)
 	return fls(size) - 8;
 }
 
-static void meson_set_max_payload(struct meson_pcie *mp, int size)
-{
-	struct dw_pcie *pci = &mp->pci;
-	u32 val;
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-	int max_payload_size = meson_size_to_payload(mp, size);
-
-	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
-	val &= ~PCI_EXP_DEVCTL_PAYLOAD;
-	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
-
-	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
-	val |= PCIE_CAP_MAX_PAYLOAD_SIZE(max_payload_size);
-	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
-}
-
 static void meson_set_max_rd_req_size(struct meson_pcie *mp, int size)
 {
 	struct dw_pcie *pci = &mp->pci;
@@ -381,7 +365,6 @@ static int meson_pcie_host_init(struct dw_pcie_rp *pp)
 
 	pp->bridge->ops = &meson_pci_ops;
 
-	meson_set_max_payload(mp, MAX_PAYLOAD_SIZE);
 	meson_set_max_rd_req_size(mp, MAX_READ_REQ_SIZE);
 
 	return 0;
-- 
2.34.1


