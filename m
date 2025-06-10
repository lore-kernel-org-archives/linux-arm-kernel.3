Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189ADC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 05:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Du2O03Hp0aOTb5aL/J9+f9wo5qv/YYwht5W3A/NuOXI=; b=0MaxlzXSSzZCuMVYME4QiDqsla
	CE6I/rmuNRYMywBZTL/12doknv2/ePieLp+9oVo1+4x+FDcsEBWKdjWwUq3RnQle4hvyqhNIXY0T4
	Pntq7eMrnRu8nkhWDuvMG/otwiawKtNOoLCjVYYItVtNvH8ie3ST5gYN3U4tMWVoVh3shACqGUHHz
	xIgNoeKp8ilLdL3S1i4yrnWfiYKR8+5JWi08DTAn2l0k+uxeUu2t3TxXr7BigrdyywlU5JoWs6hmP
	qOMjZs65PKekcAYyUEKMHvhmCQ7W6hv/fAWf0TN7F+OGGxXdpzky85ZPxAbdlTnbZUNkV6fIUZOTb
	58w6ReEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOrtf-00000005s97-16wN;
	Tue, 10 Jun 2025 05:51:43 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOrrW-00000005rwO-1E6v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 05:49:31 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55A5nQjx2202934;
	Tue, 10 Jun 2025 00:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749534566;
	bh=Du2O03Hp0aOTb5aL/J9+f9wo5qv/YYwht5W3A/NuOXI=;
	h=From:To:CC:Subject:Date;
	b=i8E94JcGs9P2psU458AbJo6VWOHEvUxw9xCLLuT8me0tEIVekJFdp1So6r7oWS9sU
	 0p5ss6QJRe8gFDdSCojD8cl2byKtRZAIzdqPeThCSLHQmZ3xDnR9j3yxK0ee+zcm77
	 Sf6hIECo+4eVaeksefszz37Y+YL0f24jz0DUiSUI=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55A5nQwc1900885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 10 Jun 2025 00:49:26 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Jun 2025 00:49:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Jun 2025 00:49:24 -0500
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55A5nLp12421739;
	Tue, 10 Jun 2025 00:49:21 -0500
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <h-salunke@ti.com>, <danishanwar@ti.com>
Subject: [PATCH v2] arm64: dts: ti: k3-am642-evm-pcie0-ep: Add boot phase tag to "pcie0_ep"
Date: Tue, 10 Jun 2025 11:19:20 +0530
Message-ID: <20250610054920.2395509-1-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_224930_377580_275621A8 
X-CRM114-Status: UNSURE (   9.59  )
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

AM64X SoC has one instance of PCIe which is PCIe0. To support PCIe boot
on AM64X SoC, PCIe0 needs to be in endpoint mode and it needs to be
functional at all stages of PCIe boot process. Thus add the
"bootph-all" boot phase tag to "pcie0_ep" device tree node.

Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
---
This patch is based on commit
475c850a7fdd Add linux-next specific files for 20250606

Changes since v1
As per feedback from Nishanth, changed the position of "bootph-all"
tag, according to ordering rules for device tree properties.

v1 : https://lore.kernel.org/all/20250609115930.w2s6jzg7xii55dlu@speckled/

 arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
index 432751774853..a7e8d4ea98ac 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
@@ -46,6 +46,7 @@ pcie0_ep: pcie-ep@f102000 {
 		max-functions = /bits/ 8 <1>;
 		phys = <&serdes0_pcie_link>;
 		phy-names = "pcie-phy";
+		bootph-all;
 		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
 	};
 };
-- 
2.34.1


