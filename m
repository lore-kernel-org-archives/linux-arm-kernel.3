Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC4DC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sX5h5CFojGv8LnhPEfyz9Mo/ZRxnuXNUcaxTQXypESI=; b=0cBRWZIWGUCIONVCvwcTlAI6iI
	es++pdUn/BMle/3jmkv+E0JQISbWJq/CiDSd+d4PxVPfWMaOf6INNruOf8GqbP5QjV2tN5nrNLBdy
	hXvJFRWYskRiDRpesUG8dpXZIoW1lICUJHbDWyQKF1kY+nbCmD6Fl0qPLQpmYmjoK4twds7yAukCT
	PJEHzk0xbcRPNNwZayaGEuzqp4klNoKclpK6WEySwg+pBUKcu72P1g88/U/R4o4QC9tM9DufVypeb
	OWM1fXyjlomZMPU7QFW8TAkwJS2U4TVJbutcDrz2aUPvF5yoQPueB7SxKmEY8R2/qzOT+f8LeoxFn
	BrEMdrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwM1-00000005uVM-2xpF;
	Wed, 02 Apr 2025 11:33:57 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwKF-00000005uGR-3xHD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 11:32:09 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 532BW34r3915796
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 06:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743593523;
	bh=sX5h5CFojGv8LnhPEfyz9Mo/ZRxnuXNUcaxTQXypESI=;
	h=From:To:CC:Subject:Date;
	b=MXAwXoil58eJQ8IWzzweFdwgwECINiQYjhl8HmFBDifDlzNSj1wd7VnQe+mYlrl6z
	 AAAMhWayMGWrToZ2jXvO3RexlcBY3aOtl0XmVyVxmlW7orr4H+Sh8PY894bW2wQNdv
	 E/nll3EicOETX6va6myashBGoMw6Yu1bgtbZ2mFk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 532BW3Dd013316
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Apr 2025 06:32:03 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 06:32:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 06:32:03 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.210])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532BW1jn017249;
	Wed, 2 Apr 2025 06:32:02 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <afd@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <kristo@kernel.org>, <rogerq@kernel.org>, <kishon@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 0/5] Use ti,j784s4-pcie-ctrl for PCIe CTRL spaces
Date: Wed, 2 Apr 2025 17:01:56 +0530
Message-ID: <20250402113201.151195-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_043208_153937_3E4B62B9 
X-CRM114-Status: GOOD (  10.39  )
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

Hello all,

Now that we have ti,j784s4-pcie-ctrl[0] let's use it. This makes these
K3 SoCs all match what is already done for J784s4.

No functional change, DT changes are fully backwards and forwards
compatible.

[0]: commit cc1965b02d6c ("dt-bindings: mfd: syscon: Add ti,j784s4-pcie-ctrl compatible")
<https://lore.kernel.org/all/20240204090336.3209063-1-s-vadapalli@ti.com/>

Posting next revision for PCIe control node cleanup with minor changes
to new overlays added after v1 was posted.

NOTE: Once the bindings are in the mainline tree, scm_conf will be
converted to "simple-bus" compatible which will unblock other
items like audio_refclk in scm_conf required for audio support
for TI SoC J721S2-EVM (currently giving dtbs_check warnings)

v1: <https://lore.kernel.org/all/20241016233044.240699-1-afd@ti.com/>

Changelog v1->v2:
- Change property description and add example in the binding
- Add changes in additional overlays using pcie*_ctrl node

Andrew Davis (5):
  dt-bindings: soc: ti: ti,j721e-system-controller: Add PCIe ctrl
    property
  arm64: dts: ti: k3-j721e: Add PCIe ctrl node to scm_conf region
  arm64: dts: ti: k3-j7200: Add PCIe ctrl node to scm_conf region
  arm64: dts: ti: k3-j721s2: Add PCIe ctrl node to scm_conf region
  arm64: dts: ti: k3-am64: Add PCIe ctrl node to main_conf region

 .../soc/ti/ti,j721e-system-controller.yaml    | 10 +++++++
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi      |  7 ++++-
 .../boot/dts/ti/k3-am642-evm-pcie0-ep.dtso    |  2 +-
 .../ti/k3-am68-sk-base-board-pcie1-ep.dtso    |  2 +-
 .../boot/dts/ti/k3-j7200-evm-pcie1-ep.dtso    |  2 +-
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi     |  7 ++++-
 .../boot/dts/ti/k3-j721e-evm-pcie0-ep.dtso    |  2 +-
 .../boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso    |  2 +-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 28 ++++++++++++++++---
 .../boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtso   |  2 +-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  7 ++++-
 11 files changed, 58 insertions(+), 13 deletions(-)

-- 
2.34.1


