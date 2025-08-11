Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B792DCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 05:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXLXIKo5So0tlOM8gotPp2y8u1WnPDpM5g1HMlGA5DM=; b=AZ1csN3/4o4jRmlsgRJjN6WzlK
	D0LZPaVy5tslefMmup+lBs5pK6I6BGzqT6tioBgTPfy4aCeOIE99TTImgGlji1eJh+5mdanFVhZoE
	WHIi+eu+oqjNDX8qFEcYyJcNX4KgrbjDaTuB1AORzngpl0Qj1svnMBUh65vSBovuo0o8w5004hM4C
	i/WQm+zXyOne5ujMBbt+95WRcp9Wgui1mN8AqebVoAeUeSFHMze7nrQ5B3RAlwnL07fwze6tWMKRu
	RICZ1OHPkSOdjT82fXoKUoxoJbltKwsYkt9zpKcldFew8lu7ZZvR+5VSXVwlhRgDhRi9Gmcyc2CB8
	5YE8sG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhZP-00000009sYd-2EaK;
	Tue, 12 Aug 2025 05:29:11 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulh9d-00000009pbT-23ew
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 05:02:35 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250812050231epoutp01cb179672926d8ed088302496a0819431~a7GujP1g-0989709897epoutp01J
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:02:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250812050231epoutp01cb179672926d8ed088302496a0819431~a7GujP1g-0989709897epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754974951;
	bh=MXLXIKo5So0tlOM8gotPp2y8u1WnPDpM5g1HMlGA5DM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AXqzg9agqJixcJnCCjrQQW+tGXqqtQ2ImmtGivH0NOErQXd/jrrVwQ6nL1ZXkVIWF
	 PNCqmyvCP0+gxRAnVqNXrJeZijhehuIhN1FT4xRukbYqCZxT1dtkbc3GjBD90lFf80
	 7u8GbbLRH4+ncNIX9lmhlp7lE/os3vAb2rPNGds8=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250812050231epcas5p405b227c36b47aabd0fdea22919c782e0~a7GuCrd8Z0756607566epcas5p4c;
	Tue, 12 Aug 2025 05:02:31 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c1KBG117sz6B9mK; Tue, 12 Aug
	2025 05:02:30 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250811154734epcas5p1ed075fa71285a5c34c2d319bb01c98ac~awQofsCJE2229822298epcas5p1a;
	Mon, 11 Aug 2025 15:47:34 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250811154731epsmtip1b68ba070909f98d7886552b4f46faa74~awQl4H6BS2596225962epsmtip1H;
	Mon, 11 Aug 2025 15:47:31 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, pankaj.dubey@samsung.com,
	Shradha Todi <shradha.t@samsung.com>
Subject: [PATCH v3 09/12] phy: exynos: Add platform device private data
Date: Mon, 11 Aug 2025 21:16:35 +0530
Message-ID: <20250811154638.95732-10-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811154638.95732-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250811154734epcas5p1ed075fa71285a5c34c2d319bb01c98ac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250811154734epcas5p1ed075fa71285a5c34c2d319bb01c98ac
References: <20250811154638.95732-1-shradha.t@samsung.com>
	<CGME20250811154734epcas5p1ed075fa71285a5c34c2d319bb01c98ac@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_220233_851067_52195806 
X-CRM114-Status: GOOD (  18.47  )
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

Currently, the exynos PCIe PHY driver supports only single
phy ops making it unusable for other platforms. Add the phy_ops
as platform specific device data so as to extend this driver
to support all platforms using Samsung PHY.

Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 drivers/phy/samsung/phy-exynos-pcie.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-exynos-pcie.c b/drivers/phy/samsung/phy-exynos-pcie.c
index 53c9230c2907..022222a0212a 100644
--- a/drivers/phy/samsung/phy-exynos-pcie.c
+++ b/drivers/phy/samsung/phy-exynos-pcie.c
@@ -136,6 +136,7 @@ static const struct phy_ops exynos5433_phy_ops = {
 static const struct of_device_id exynos_pcie_phy_match[] = {
 	{
 		.compatible = "samsung,exynos5433-pcie-phy",
+		.data = &exynos5433_phy_ops,
 	},
 	{},
 };
@@ -146,6 +147,11 @@ static int exynos_pcie_phy_probe(struct platform_device *pdev)
 	struct exynos_pcie_phy *exynos_phy;
 	struct phy *generic_phy;
 	struct phy_provider *phy_provider;
+	const struct phy_ops *drv_data;
+
+	drv_data = of_device_get_match_data(dev);
+	if (!drv_data)
+		return -ENODEV;
 
 	exynos_phy = devm_kzalloc(dev, sizeof(*exynos_phy), GFP_KERNEL);
 	if (!exynos_phy)
@@ -169,7 +175,7 @@ static int exynos_pcie_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(exynos_phy->fsysreg);
 	}
 
-	generic_phy = devm_phy_create(dev, dev->of_node, &exynos5433_phy_ops);
+	generic_phy = devm_phy_create(dev, dev->of_node, drv_data);
 	if (IS_ERR(generic_phy)) {
 		dev_err(dev, "failed to create PHY\n");
 		return PTR_ERR(generic_phy);
-- 
2.49.0


