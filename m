Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EF6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 13:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HvgttcVET7LS9gnu9cFNnv8pyvgfsHqqp2dm/tHr+NY=; b=klaUUyiRq1PTpEsUMt70Tmq+6S
	k/fI2es0YvdiqQ0vGFGNRoXXV6kuDuOSDKnGz7lhl33kBqjYnPXloFoBGxIvrUohXc78g+S2kTv7S
	COXHkRPZ3+37KifQsO2TK3N7Qu4Ad/TgRV93w7ZC+XChZgF9cpD7vr8b2sohpHaMtxjAz6ZF1V+Ne
	kpAJ5W2FX0j4vXG+d6/IuKolCSAoRAx6OyKe3QGoDkhkaih1AohHs/qH+AQosfAlTkMT0j2ZUSISd
	ccPnT3FBu2DZjkiMD/LwrIdzoGYopoT50tFUsiFMVyKsbMGz1NkAsFR5VXyjP0ItbnCyHPaoN2HZe
	2XNV3NPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmoK-00000001KZm-0XTa;
	Mon, 06 Jan 2025 13:06:24 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmGc-00000001Edg-0rzK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 12:31:35 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 506CVR2p2789486
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 06:31:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736166687;
	bh=HvgttcVET7LS9gnu9cFNnv8pyvgfsHqqp2dm/tHr+NY=;
	h=From:To:CC:Subject:Date;
	b=uBMO0/aG35GCL2yQs0NC6YGIxh7izv1jZ42eZSrULxzBVHBIVp8FRxr3oBkv+HarX
	 mBtZWcuxI7+QL3TkgzC4hNpigBRFhzcv3p6NUo1O6J/VbiJf8Szc8JiAfVf4NwOPrk
	 eNAMqjUN8C+yFmRUCEN2oQqi5ohJh321QjK0JtiQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 506CVRes006557
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2025 06:31:27 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 Jan 2025 06:31:26 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 Jan 2025 06:31:26 -0600
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 506CVQEN094247;
	Mon, 6 Jan 2025 06:31:26 -0600
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <srk@ti.com>, <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Chintan Vankar <c-vankar@ti.com>
Subject: [PATCH 0/2] Add bootph-all property to necessary nodes to enable ethernet boot for AM68-SK, J722s and AM62p-SK
Date: Mon, 6 Jan 2025 18:01:20 +0530
Message-ID: <20250106123122.3531845-1-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_043134_331057_7FD1C6C3 
X-CRM114-Status: UNSURE (   8.45  )
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

This series adds bootph-all property to necessary nodes to enable
ethernet boot support for AM68-SK, J722s and AM62p-SK.

This series is based on linux-next tagged next-20250106.

Chintan Vankar (2):
  arm64: dts: ti: k3-am68-sk*: Add bootph-all property to necessary
    nodes to enable Ethernet boot
  arm64: dts: ti: k3-am62p5*/k3-j722s: Add bootph-all property to
    necessary nodes to enable Ethernet boot

 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 3 +++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts                | 2 ++
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts       | 5 +++++
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi       | 2 ++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts                | 3 +++
 5 files changed, 15 insertions(+)

-- 
2.34.1


