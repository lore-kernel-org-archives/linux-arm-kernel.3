Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9391C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i674xOwrjdf/AAf3vaDDj/zXNM7PUpgpfGixq0BvJVM=; b=QKWQggmIt6EtMVD4J7FHnKjIl7
	qUXamYIWqLOBoCt3wMTizeqI0/ZJSXpSQKqzAvjSHDvuc2fn7HMW5L2XPTBia5/zD13B/pEL7f70l
	yDWxMDCiNqZ8U91zQrXaBYxFBqv25kNgpMNsqOTTkiDS/vEBZ67rGJULoRDXx4eeHK0/eYUCD9Prd
	VqZKfmMQRoN54HewH3n9P5wHE+DU69t6g8oGv+JG4zdKr9vo3l510GA00esjAulSc8Iyd6JS2Sl8M
	8PeeYUH9WvD3eju57kOUO9Vb3zdtqoqofAjFfWhyk7BknfMmp7ja77UoOSz+D5WYj3bKwL2W/P/lj
	IqPNkJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QC7-0000000DIzJ-3dAf;
	Thu, 17 Apr 2025 14:26:23 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Q8d-0000000DIE9-0nKW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:22:48 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1744899764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i674xOwrjdf/AAf3vaDDj/zXNM7PUpgpfGixq0BvJVM=;
	b=epf/QWi0fEMbAePO0z2eV4VX/swstqahqUqzcygHP0DUZtjjOHcjgeViy27Yytj7Be690M
	ySo035j0wLDy5r1/hXLft9L0MrK9XDkOFsUqji7vLGPO61zUiowfKaBPniuXs+3/0Zpmge
	/5NGI5R7h5IKsgJFebHve85QL3fvfN3cbdxlh4MwZZjNj2I0w74cWJlNksgOGqz6GoDZam
	KcBBqm3QSadwVwLWZnfrrJV14r45Vng8AottX3TkeiReqBt+kG/Mit/xfgHyEWPskklxNw
	v/fAQ33/TVTWCXevtP/iPE/iy9iMwZKKGJP8IwxryliX6s6W21Hl7qPPTUQQRw==
From: Diederik de Haas <didi.debian@cknow.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>,
	stable@vger.kernel.org
Subject: [PATCH] PCI: dw-rockchip: Fix function call sequence in rockchip_pcie_phy_deinit
Date: Thu, 17 Apr 2025 16:21:18 +0200
Message-ID: <20250417142138.1377451-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072247_563485_C878B503 
X-CRM114-Status: UNSURE (   8.62  )
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

The documentation for the phy_power_off() function explicitly says

  Must be called before phy_exit().

So let's follow that instruction.

Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")
Cc: stable@vger.kernel.org	# v5.15+
Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index c624b7ebd118..4f92639650e3 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -410,8 +410,8 @@ static int rockchip_pcie_phy_init(struct rockchip_pcie *rockchip)
 
 static void rockchip_pcie_phy_deinit(struct rockchip_pcie *rockchip)
 {
-	phy_exit(rockchip->phy);
 	phy_power_off(rockchip->phy);
+	phy_exit(rockchip->phy);
 }
 
 static const struct dw_pcie_ops dw_pcie_ops = {
-- 
2.49.0


