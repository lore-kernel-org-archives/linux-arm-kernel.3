Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425FDC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 06:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p6L9ox8QbZEfucXdJkpzXmXO81CguHbCQdxOp/2KlFk=; b=l3bOTB5J+Omyc32fDqBCtSYbP9
	AuPHcqdCiYlqjYklv4bp6bdRFjlrDRcZ1w7uLTOOhWGLlUXw8UTv4VHkI99z6lLCbq3fFzKFg7t+O
	IizUgT1XqtXOuyfHVTenSdYkNBvygdPbOuU73DPpNZ83gPfb3LCBU4XKF/YELD3DU6iXFG3Lwy4Mk
	u2QNbcso5jcXxIke9xVEbBUOXsT/DuAo9BEt7i2vnRxzq3lEou+5pLp1i5Or7dD4rfNEktD/lnWm5
	omriUz2rAItGJf2sZ5ZuHZJc645+PVkTPu2lKF716Cu2DTCguOzE0cc2XFj6a9QinRjAkER1TuMsZ
	Re0l7r/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u382x-0000000CkWV-3h92;
	Fri, 11 Apr 2025 06:39:27 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37Zx-0000000Cg0z-1tbH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 06:09:31 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53B69NGE2027079
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 01:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744351763;
	bh=p6L9ox8QbZEfucXdJkpzXmXO81CguHbCQdxOp/2KlFk=;
	h=From:To:CC:Subject:Date;
	b=Rzfjm3gK/5E1dv7/TMK2yt4uSnlJ5SSq+1nIrJ7HSl1eY6LEuzYT2mJc5aGdCxfp1
	 2j3VW5FVNWpasODqmkC+KhynaPcOxrVqum48vXjg17d0GvJ0rofOMG6LQd/V1+CW93
	 +P57LGVlIAUk1bFicEBd2CMGx8xyDTDGsUMHv/NM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53B69NXZ049796
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 01:09:23 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 01:09:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 01:09:22 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53B69I9x065579;
	Fri, 11 Apr 2025 01:09:18 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rogerq@kernel.org>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH net-next 0/2] CPSW Bindings for 5000M Fixed-Link
Date: Fri, 11 Apr 2025 11:39:15 +0530
Message-ID: <20250411060917.633769-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_230929_535081_909A1EEF 
X-CRM114-Status: UNSURE (   8.59  )
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

Hello,

This series adds 5000M as a valid speed for fixed-link mode of operation
and also updates the CPSW bindings to evaluate fixed-link property. This
series is in the context of the following device-tree overlay which
enables USXGMII 5000M Fixed-link mode of operation with CPSW on TI's
J784S4 SoC:
https://github.com/torvalds/linux/blob/v6.15-rc1/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtso

Series is based on commit
0c49baf099ba r8169: add helper rtl8125_phy_param
of the main branch of net-next tree.

Regards,
Siddharth.

Siddharth Vadapalli (2):
  dt-bindings: net: ethernet-controller: add 5000M speed to fixed-link
  dt-bindings: net: ti: k3-am654-cpsw-nuss: evaluate fixed-link property

 Documentation/devicetree/bindings/net/ethernet-controller.yaml  | 2 +-
 .../devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml          | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.34.1


