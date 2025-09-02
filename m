Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E27ACA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 05:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DD6WQscd/4wzJ9d5MDscUCF6CepPF1a//hWzsswR3ic=; b=AQGODeeGCUdXtFhy+dXwnkFW8I
	sE5x6XKDn+CJmKAVZ5UZH+7wMJZQRbIMr5XwA1G7mhDyZlAfsFQ3jKLLVK4xqbFxju03Q98VETYnO
	zT8s04sL8pzeku3xGUWGcih3+uzov+O0JnkrxEpKwKs4qXvcX/1YTDsuRwSCT56S3Gg4yu7PwV3Lj
	FFisEul6R3A57fCfTuEImRrlE2VEz+Hm/BrWJmDKhRV6SGMUZY7iiF5yUhnuedfIpRApnzMO6dLSG
	AkkQn0jk6PJu+1FFffHkRXVqG987aQQ+Vrb8MFdMXxE9rktl4tDAWfOQkttXEagCzbWs7T1FxIIHo
	6mKcpkMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utJgU-0000000FKnI-0lq5;
	Tue, 02 Sep 2025 05:35:58 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utJb5-0000000FJCH-2bfa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 05:30:24 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5825UFu62512886;
	Tue, 2 Sep 2025 00:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756791015;
	bh=DD6WQscd/4wzJ9d5MDscUCF6CepPF1a//hWzsswR3ic=;
	h=From:To:CC:Subject:Date;
	b=gmbRNOGlatVtQxmXia3b/cKelyU9Yiqi2EEPiFnMTqEnMKl2KnI7TlsXULfOEkcC1
	 SexJEieREkBvcPNdtePJgop06KEP3k72OjMK2LoKiaKXCl1WwJon60qAb7X4XFUWha
	 24UEZPDNNbqExuHA4wF+7ClMSmrPvEYbXo4qFmzU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5825UE8T2501730
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 2 Sep 2025 00:30:14 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 00:30:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 00:30:14 -0500
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.231.157])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5825UAWn3551148;
	Tue, 2 Sep 2025 00:30:11 -0500
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <h-salunke@ti.com>, <danishanwar@ti.com>
Subject: [PATCH v2 0/4] arm64: dts: ti: Add bootph-all tag to USB PHY controller
Date: Tue, 2 Sep 2025 11:00:05 +0530
Message-ID: <20250902053009.1732607-1-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_223023_700933_28729DDB 
X-CRM114-Status: UNSURE (   8.55  )
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

This patch series adds the bootph-all property to USB0 PHY controller
nodes across multiple TI SoCs (AM62, AM62A, AM62P, J722S).

The bootph-all tag ensures that these USB PHY controller nodes are 
available during all boot phases, which is required for USB DFU 
(Device Firmware Upgrade) boot functionality.

Changes sice v1:
Updated patch series to add "bootph-all" tag to board specific file
instead of SoC file.
Rebased on current next.

This series is based on commit:
33bcf93b9a6b Add linux-next specific files for 20250901

Hrushikesh Salunke (4):
  arm64: dts: ti: k3-am62a7-sk: Add bootph-all tag to usb0_phy_ctrl node
  arm64: dts: ti: k3-am62p5-sk: Add bootph-all tag to usb0_phy_ctrl node
  arm64: dts: ti: k3-am62x-sk-common: Add bootph-all tag to
    usb0_phy_ctrl node
  arm64: dts: ti: k3-j722s-evm: Add bootph-all tag to usb0_phy_ctrl node

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts        | 4 ++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts        | 4 ++++
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 4 ++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts        | 4 ++++
 4 files changed, 16 insertions(+)

-- 
2.34.1


