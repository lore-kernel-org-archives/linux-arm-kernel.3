Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762F9C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D3AW8Z2GaXCnvayX3h6iYYRk4HsizirZYceih+sKzFI=; b=33aya5s76KRDVSUqlnBIK02/k6
	kD1v/BTmzyesZ5AdGcuRByckbblffLlbzhy1i7K1c3JVEvvz1hw5kulmtPVftqe4TmMtvEPGVIBCy
	Xk6ZY4+7orNAFV1Sf3ecQWVm+FuS1LSw+/ZPX01ClPUPKto5UhRr7jBmnAUDEIxt/n2clp+D+UM2+
	a37B9FEEle7uQ5vmM3lCYvAbvN9tRyyQTl7lVnv5EtiW3HM8WIEatUQGqkFiOsdQYO4aXuQAWq3JP
	j5efuctxO1yb8Md+vjLtPP09I6jc/pFNhQ9HlaPk5A4MSOKE1wr1UnjC9iIDU+BNfNgbOieHFOknt
	Ez1l3EcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYPn-00000003j2V-3gk8;
	Mon, 09 Jun 2025 09:03:35 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYHI-00000003hzZ-15Gk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 08:54:49 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5598sYhh723398;
	Mon, 9 Jun 2025 03:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749459274;
	bh=D3AW8Z2GaXCnvayX3h6iYYRk4HsizirZYceih+sKzFI=;
	h=From:To:CC:Subject:Date;
	b=eqbp3nyAe/EaVd8yge9lYWCGvjgXz6w1NmkIT4l4/6H+TWfBYeZaWzY64zk588VfI
	 48PjphRpRxbJgCdvhnJCWR2o5NpaKAs5MGzJy0VQKum0pcDcQ3Z6SaDnIcDkDdSgt4
	 yUYxTEjS1FjGB9+d/WjU/Wk1TzmbPrdFDgoudG2w=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5598sYuN4149176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 9 Jun 2025 03:54:34 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 03:54:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 03:54:34 -0500
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5598sTbD1008464;
	Mon, 9 Jun 2025 03:54:30 -0500
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <h-salunke@ti.com>, <danishanwar@ti.com>, <srk@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am642-evm-pcie0-ep: Add boot phase tag to "pcie0_ep"
Date: Mon, 9 Jun 2025 14:24:29 +0530
Message-ID: <20250609085429.2334652-1-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_015448_386982_BFC5533A 
X-CRM114-Status: UNSURE (   8.73  )
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

AM64X SoC has one instance of PCIe PCIe0. To support PCIe boot on
AM64X SoC PCIe0 instance needs to be in endpoint mode and it needs to
be functional at all stages of PCIe boot process. Thus add the
"bootph-all" boot phase tag to "pcie0_ep" device tree node.

Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
---
This patch is based on commit
475c850a7fdd Add linux-next specific files for 20250606

 arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
index 432751774853..268a3183753e 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
@@ -30,6 +30,7 @@ &cbass_main {
 	interrupt-parent = <&gic500>;
 
 	pcie0_ep: pcie-ep@f102000 {
+		bootph-all;
 		compatible = "ti,am64-pcie-ep", "ti,j721e-pcie-ep";
 		reg = <0x00 0x0f102000 0x00 0x1000>,
 		      <0x00 0x0f100000 0x00 0x400>,
-- 
2.34.1


