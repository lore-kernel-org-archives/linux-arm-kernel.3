Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A0BC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 06:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wCDRasm8wDpgTSExQtxXTdJsGrd2p6UboPjjmrdgWqA=; b=IEIOJ7TFTZUujz+dnuwggUZ5NX
	fBtBRHAxBL2H7DyrJCxmYWYhZ9glqlkNikI++PeagSwqI7sMkiZqgXp8paJMJNi8at/Iv3vEaPZQQ
	e6/jmqqlmr1O4BzUOHS/bp2UUJaNAiP45MaoAhRySI0n81SyXrCOQIe0tgwqHJeaRMAF9Dn5ieD6+
	w95oFPiuKkgCxjwpPGH3Ijp1MNAmKBR96g6RKWPpDDQBGMuWHSsVSe8P1bLrKJ7Or4JmmHx6wSeAT
	oXxuPId7ISZdz/Dt6WnlZjh93yUUt8inqHQOKRVaHW9sCWyLhlSv4pVj4RN0PDVugdVcI720EN0yQ
	bMNBrOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvGc-00000006qQ5-2AdY;
	Wed, 16 Jul 2025 06:05:22 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvCi-00000006pj1-3LZ7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 06:01:22 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56G61G5P181199;
	Wed, 16 Jul 2025 01:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752645676;
	bh=wCDRasm8wDpgTSExQtxXTdJsGrd2p6UboPjjmrdgWqA=;
	h=From:To:CC:Subject:Date;
	b=VZ2G4bZm6OKuTb8axK6iF049acvKQeoIY7R2E4v2BqU9IeT39bc2NTJDAb9MHfmKf
	 vqOMvNtHgnT4bMpfBng+sxDwgSSFgChC8xWrk7BJDHTQsRH7WnqE2/dEcOvd1XFD61
	 3DxIU3dbtoP8NeMaLmhPONKm5amR2iTSRkCjZMmA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56G61GYx3321485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 01:01:16 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 01:01:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 01:01:15 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.166])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56G61ER14147843;
	Wed, 16 Jul 2025 01:01:15 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <devarsht@ti.com>, <j-choudhary@ti.com>
Subject: [PATCH v3 0/7] Add DSI display support for TI's Jacinto platforms
Date: Wed, 16 Jul 2025 11:31:07 +0530
Message-ID: <20250716060114.52122-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_230120_932765_8BFA5B75 
X-CRM114-Status: GOOD (  10.90  )
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

Hello All,

This series adds the dts support to enable DSI on 3 platforms for TI SoCs:
- J784S4-EVM
- J721S2-EVM
- AM68-SK

SN65DSI86 driver fix that was essential for display is now merged.

There is one more series relevant for driver that makes CDNS-DSI driver
work better:
https://lore.kernel.org/all/20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com/

I have locally tested using kmstest utility on all 3 platforms.

Changelog v2->v3:
- Cosmetic changes like adding padding and new line before child nodes
- Using standard node name for regulator and bridge
- Remove "regulator-always-on" for dp-regulator in am68 and j721s2 board
- Remove interrupt-parent from dsi nodes

v2 patch link:
https://lore.kernel.org/all/20250624082619.324851-1-j-choudhary@ti.com/

Changelog v1->v2:
- [4/7]: Add gpio-line-names
- [6/7]: Remove unnecessary clocks from TIDSS

v1 patch link:
https://lore.kernel.org/all/02f1912f-0a05-4446-923a-7935ed305cb3@ti.com/

Jayesh Choudhary (5):
  arm64: dts: ti: k3-j784s4-j742s2-main-common: add DSI & DSI PHY
  arm64: dts: ti: k3-j784s4-j742s2-evm-common: Enable DisplayPort-1
  arm64: dts: ti: k3-j721s2-common-proc-board: Add main_i2c4 instance
  arm64: dts: ti: k3-j721s2-common-proc-board: Enable DisplayPort-1
  arm64: dts: ti: k3-am68-sk: Enable DSI on DisplayPort-0

Rahul T R (2):
  arm64: dts: ti: k3-j721s2-main: add DSI & DSI PHY
  arm64: dts: ti: k3-j721s2-som-p0: add DSI to eDP

 .../boot/dts/ti/k3-am68-sk-base-board.dts     |  97 ++++++++++++++
 .../dts/ti/k3-j721s2-common-proc-board.dts    | 117 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  39 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi  |  51 ++++++++
 .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi   | 121 +++++++++++++++++-
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  |  39 ++++++
 6 files changed, 463 insertions(+), 1 deletion(-)

-- 
2.34.1


