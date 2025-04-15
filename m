Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D6DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/O1xD+HqXmJLec8GsMhbvUyB/KEUfoAfhy8hElpuE1I=; b=pfqPZl52E3abEvMVZEr2QLHfu2
	GCw50uY6Qgw5H4nSonKd26Iu4EhB57JAkeittmIwr5X5ywpiNo7b7htFZLA5pI2qAtGtSok31NHm2
	XhhdNOR/C4Vf6JBIM5PFhswmdT0z7+vXaccXdrCybrL3K6+dkrlAAMbiz04rBQg4CFACG/DZcMvrh
	agM3V1fLVI2aK1TpgzhAUj7rhMkGzA/pLoE42pHD+10msj74n7RckDWfKnGR11z+Uw25fbl6Ai3OF
	Dm02Yoq3o7nUjGNxLd+TEBL9ENKi3fOb7aISw32EW2e3S8B3RYQsWq6PWVllkZz0cnaPrrNM0zSnO
	hcMANiyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iYU-00000006Jis-1Wpn;
	Tue, 15 Apr 2025 15:50:34 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iGV-00000006Fg1-2dhM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:32:01 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53FFVmJ02394443
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 10:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744731108;
	bh=/O1xD+HqXmJLec8GsMhbvUyB/KEUfoAfhy8hElpuE1I=;
	h=From:To:CC:Subject:Date;
	b=O3/NUCpthye8NpfW5dBKyKfQTup4eTndAS4hqAzxfn1kQxRMOQ8VCOmUfEuaHVWnJ
	 zL22x5DKP/rgreJtjhl5bRXCxebywBvuNZOHtyN7mE4y0ebfR0NpO+haxA0b7wS4Ts
	 7G7E7rj1HokTvmQWKKF7TBCl6dVRsO8vfZGTOALw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53FFVmji040442
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 10:31:48 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 10:31:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 10:31:47 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53FFVlZq109804;
	Tue, 15 Apr 2025 10:31:47 -0500
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Prasad <b-padhi@ti.com>, Andrew Davis <afd@ti.com>,
        Markus Schneider-Pargmann
	<msp@baylibre.com>,
        Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>
Subject: [PATCH v7 00/11] Add R5F and C7xv device nodes
Date: Tue, 15 Apr 2025 10:31:36 -0500
Message-ID: <20250415153147.1844076-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_083159_764263_DB1372B5 
X-CRM114-Status: GOOD (  10.16  )
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

For am62x and am62ax devices, this patch series adds device nodes
for the R5F subsystem and C7xv DSP subsystem found in their
respective voltage domain, based on the device TRMs [0][1].

This patch series also includes patches for enabling IPC for am62x SK,
am62ax SK, and am62px SK by reserving memory and binding the mailbox
assignments for each remote core.

Also reserve timers used by C7x DSP for am62ax SK board and timers used
by MCU FW for AM642 SK and EVM boards as per firmware requirements.

Changes since v6:
- Fix comments in patch 11/11 (no functional change)
- Pick up review tags

Links
v6: https://lore.kernel.org/linux-devicetree/20250405001518.1315273-1-jm@ti.com/
v5: https://lore.kernel.org/linux-devicetree/20250210221530.1234009-1-jm@ti.com/
v4: https://lore.kernel.org/linux-devicetree/20250206235200.3128163-1-jm@ti.com/
v3: https://lore.kernel.org/linux-devicetree/20250204011641.1523561-1-jm@ti.com/
v2: https://lore.kernel.org/linux-devicetree/20250131214611.3288742-1-jm@ti.com/
v1: https://lore.kernel.org/linux-devicetree/20250127221631.3974583-1-jm@ti.com/

[0] https://www.ti.com/lit/pdf/spruj16
[1] https://www.ti.com/lit/pdf/spruiv7
[2] https://lore.kernel.org/linux-devicetree/04e77daf-e775-44fa-82bf-8b6ebf73bcef@ti.com/
[3] https://lore.kernel.org/linux-devicetree/4740c3f8-5051-4e25-af91-b45735ffef31@ti.com/

Devarsh Thakkar (3):
  arm64: dts: ti: k3-am62a-wakeup: Add R5F device node
  arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors
  arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors

Hari Nagalla (6):
  arm64: dts: ti: k3-am62-wakeup: Add wakeup R5F node
  arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
  arm64: dts: ti: k3-am62x-sk-common: Enable IPC with remote processors
  arm64: dts: ti: k3-am62a7-sk: Reserve main_timer2 for C7x DSP
  arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4 for C7x DSP
  arm64: dts: ti: k3-am64: Reserve timers used by MCU FW

Jai Luthra (1):
  arm64: dts: ti: k3-am62a-main: Add C7xv device node

Judith Mendez (1):
  arm64: dts: ti: k3-am62: Add ATCM and BTCM cbass ranges

 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi    |  25 +++++
 arch/arm64/boot/dts/ti/k3-am62.dtsi           |   8 +-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     |  12 ++
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi      |  25 +++++
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi   |  25 +++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       | 106 +++++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       |  50 ++++++++-
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  34 +++++-
 arch/arm64/boot/dts/ti/k3-am642-evm.dts       |  20 ++++
 arch/arm64/boot/dts/ti/k3-am642-sk.dts        |  20 ++++
 10 files changed, 306 insertions(+), 19 deletions(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.49.0


