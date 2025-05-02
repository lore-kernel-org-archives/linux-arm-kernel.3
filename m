Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84A9C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 22:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vkUi52T6idU7ApyxJA+rNgpSxXBLD/aJ8NYR/101WVA=; b=I2NV9h8Y1yvSyaAGfShfCMECKV
	Zge6GkV9Ufy6dHnRrUu/YvoSsrJg+8zCdPHYCYQZ4Ojkaw+/WqJlNQpyfOzLjSdygMpYeKUHLuOUh
	Fl3pmCYKlN5rjptK7gYvm7NrojxoHnBme9w+eLkGMN5UKv87w0MpxGAg5PF69UVs4vLlFnsYpKx7K
	EYorZJk+Ug8uYQ9+O5BocLt425xt84L86oOdIB2UzyUSCu+PJY0GgMj/FoDVO7fX/T5brJ/sGVKJ5
	gEQKdVuanNjifC4rYTY1PRvVMbPgmyEqiEfaUJkGHNtXiaTGUJXDEou4Zm3nfsKNEP8LSSdcbMgrt
	p4vb66jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAyhC-000000039Oh-3zZT;
	Fri, 02 May 2025 22:17:26 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAyTi-000000037iL-3S6P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 22:03:38 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542M3QWT3963046
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 17:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746223406;
	bh=vkUi52T6idU7ApyxJA+rNgpSxXBLD/aJ8NYR/101WVA=;
	h=From:To:CC:Subject:Date;
	b=p4GEp0W5f02R4e1HvHiWiedRjGiQdS7JrKhfH/4OKTlSIyjque7amxdPJN0lpagJP
	 DmeLPBbsTMg8ugQFpAMJd5QO4YcR8wwf16RkXC7ZFu4a2x/gDIyJPxCnHI7Wfr8YHD
	 hRZAPWm7zxcahY7LLhXuMqoc/rFoiqRGGgScBFow=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542M3QfP004715
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 17:03:26 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 17:03:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 17:03:25 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542M3PBs006849;
	Fri, 2 May 2025 17:03:25 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hari
 Nagalla <hnagalla@ti.com>,
        Beleswar Padhi <b-padhi@ti.com>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>,
        Andrew Davis <afd@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 00/11] Add R5F and C7xv device nodes
Date: Fri, 2 May 2025 17:03:14 -0500
Message-ID: <20250502220325.3230653-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_150330_951168_301391BF 
X-CRM114-Status: GOOD (  10.97  )
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

Changes since v7:
- Rebase against next
- add Andrew's review tags

Links
v7: https://lore.kernel.org/linux-devicetree/20250415153147.1844076-1-jm@ti.com
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

-- 
2.49.0


