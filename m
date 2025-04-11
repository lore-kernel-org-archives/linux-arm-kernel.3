Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E00C369AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ufBPzefqQfv5obE5Pv0KCKQtrt8Mm1vDWW/7ZeaZFxY=; b=xfjFK1ycev4sBZkvMB9OwTCsc9
	FrJyIbUlS57/r/HWLWMnjwO7NJPxG5k6fEjVSPDj4to3i0QKSs7iSYJflbEjS3tspb1FbS23gtmGs
	zoMb1tZVz8j1MaGUM91M9/Nx4RDqC1B56EYe8FGWjQ1VmbjFnGT967mJEia8pswuNYFubpmUsRlfN
	hftC403WVJjc07yauwkGvlGtm3xdCIPRMefDuA2Crl1aY3Y41/s4e/sAlfBXt4L5/FWXYReBD7shk
	5jYi4U/BT8Ygb0HWnnS+jtF1RaDa2QI2CvU6QhiXDLu14BXO3WiDJSWumm+kT/qXsGSMd7E4blGBZ
	sA4aqbGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CPm-0000000DV9e-3rqc;
	Fri, 11 Apr 2025 11:19:18 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3BzO-0000000DQvk-22AF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 10:52:04 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BApvvK2104737
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:51:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744368717;
	bh=ufBPzefqQfv5obE5Pv0KCKQtrt8Mm1vDWW/7ZeaZFxY=;
	h=From:To:CC:Subject:Date;
	b=kNUCJnx4JfICJMR5w4JvRK9nedhjnW+I4ofOvhrTD8CQt+x+v9Bu28ZLXhWFUlG+L
	 FPAC+snIyKZQQmp/22AXkeHoIXPeAfWvBOOPQLJ1q5kFlmlgKxRsQzvDwwgVIc/Q2S
	 cS7EVWvp4mHp/3K1JQaSJiwGiZxI+3HKAofWCN04=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BApv45075026
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 05:51:57 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 05:51:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 05:51:56 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BApts9029842;
	Fri, 11 Apr 2025 05:51:56 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>, <devarsht@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 0/7] Add DSI display support for TI's Jacinto platforms
Date: Fri, 11 Apr 2025 16:21:48 +0530
Message-ID: <20250411105155.303657-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_035202_702970_C51BEE61 
X-CRM114-Status: GOOD (  10.32  )
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

This series *depends* upon a couple of driver series[0][1]and a config
patch[2] that enables CDNS_DSI and CDNS_DPHY.

[0]: <https://lore.kernel.org/all/20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com/>
This series adds cdns-dsi-core fixes

[1]: <https://lore.kernel.org/all/20250411092307.238398-1-j-choudhary@ti.com/>
This patch adds the necessary DSI flags that are used in cdns-dsi-core
driver which are propagated from sn65dsi86 bridge.

[2]: <https://lore.kernel.org/all/20250411095043.272488-1-j-choudhary@ti.com/>
This patch enables the required configs for DSI.

I have locally tested using kmstest utility on all 3 platforms.

NOTE: For higher resolutions, we need bigger CMA region.
But for validation, the default value is enough.
I am posting another series to add CMA region to Jacinto platforms
similar to Sitara family soon:
<https://lore.kernel.org/all/20240613150902.2173582-1-devarsht@ti.com/>

Jayesh Choudhary (5):
  arm64: dts: ti: k3-j784s4-j742s2-main-common: add DSI & DSI PHY
  arm64: dts: ti: k3-j784s4-j742s2-evm-common: Enable DisplayPort-1
  arm64: dts: ti: k3-j721s2-common-proc-board: Add main_i2c4 instance
  arm64: dts: ti: k3-j721s2-common-proc-board: Enable DisplayPort-1
  arm64: dts: ti: k3-am68-sk: Enable DSI on DisplayPort-0

Rahul T R (2):
  arm64: dts: ti: k3-j721s2-main: add DSI & DSI PHY
  arm64: dts: ti: k3-j721s2-som-p0: add DSI to eDP

 .../boot/dts/ti/k3-am68-sk-base-board.dts     |  96 ++++++++++++++
 .../dts/ti/k3-j721s2-common-proc-board.dts    | 116 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  37 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi  |  52 ++++++++
 .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi   | 117 +++++++++++++++++-
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  |  37 ++++++
 6 files changed, 454 insertions(+), 1 deletion(-)

-- 
2.34.1


