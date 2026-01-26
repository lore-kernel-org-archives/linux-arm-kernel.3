Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EA8D13C09
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 13:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O1qNtheyLYh3hzhziHVlWtsjkgE4TIXHxBiRHF2GpwY=; b=CVboiDiNvoDiMFwZV6GI87HKIX
	rLhgZgDXAscrtY0Va1C4dtpMwVMFxlu6NUr+LZ6zaB1el+bx/VYVV8W4qzrmOB+EjMpzJN+oT68Pw
	6YgstuKbdVsGwOk7E7OgU/jOQ62ZHBXMSPiiKp96r7/eDqnM7tNddwo2946m1S++ldtv5vSmh6z4t
	ZXPuVpcZQIqX98kl1Z8IKcPZI/y9rUnQ8s5v+RmEdrhezX5N3tUEX17oXk331hhR3bmnrVQU29Qzo
	B1nHUTigWtsxKI2qBZS/6GwX3qtWhR0JeyExctbsc4BWjJ1MEGuRXvsm/9UcQZTpdId8qJ3RoNrf+
	NlbrGAlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkMNq-0000000Cb6n-476w;
	Mon, 26 Jan 2026 13:11:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkMNo-0000000Cb6C-0a3J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 13:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1769433116; x=1800969116;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qgwSRI66vLiiiyC2j8OTPqaQNYDGhuB7pMuJpWExgOI=;
  b=xCmE/cKfTZ11cNRYOcNypsFv/bN6buou6ARhzaCSrW2mzqMk6hYT1LNk
   9HymPUrNzgafwa5mqtxkgnMTj734lEhRU9mQEyUHOrcJMU+HJ3OVfxLv2
   vMPKFSkaG5BzTuLQWqEDM/Op9gP/O633SU0iP6cE9zf+2hEinCNLatUAt
   SWx2O+DzeF5quSf4uBNmvrCGXyFAyolIlOX71XKI2gwu+YD/MPwG7ZxIE
   JcZTcNfZGK9qg/ZI01XZBjledu0EivjlSpeEnjYr5W+O/6NMcPPmoB9F/
   cs1q9ixiqFkONCFMVWMhiGob7sHrb8GR62x+23m46o1j7vsReJWBQcNzn
   A==;
X-CSE-ConnectionGUID: Az3rqHMsQl24QN4Xwb7X+w==
X-CSE-MsgGUID: dZk2bJ/QQ+qozjWPjcLGyA==
X-IronPort-AV: E=Sophos;i="6.21,255,1763449200"; 
   d="scan'208";a="59539141"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Jan 2026 06:11:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 26 Jan 2026 06:11:22 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 26 Jan 2026 06:11:20 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH] ARM: dts: microchip: sama7d65: add Cortex-A7 PMU node
Date: Mon, 26 Jan 2026 15:10:23 +0200
Message-ID: <20260126131035.6964-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_051156_394500_297C3A2A 
X-CRM114-Status: UNSURE (   8.84  )
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

Add the Performance Monitoring Unit (PMU) node with the appropriate
compatible string, interrupt line, and affinity so that perf and other
PMU‑based tooling can function correctly on this SoC.

[root@SAMA7D65 ~]$ dmesg | grep -i pmu
[    1.487869] hw-perfevents: enabled with armv7_cortex_a7 PMU driver, 5 (8000000f) counters available

[root@SAMA7D65 ~]$ perf list hw
List of pre-defined events (to be used in -e or -M):

branch-instructions OR branches                    [Hardware event]
branch-misses                                      [Hardware event]
bus-cycles                                         [Hardware event]
cache-misses                                       [Hardware event]
cache-references                                   [Hardware event]
cpu-cycles OR cycles                               [Hardware event]
instructions                                       [Hardware event]

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 868045c650a7..1e1ca4f93969 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -45,6 +45,12 @@ L2: l2-cache {
 		};
 	};
 
+	pmu {
+		compatible = "arm,cortex-a7-pmu";
+		interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>;
+	};
+
 	clocks {
 		main_xtal: clock-mainxtal {
 			compatible = "fixed-clock";

base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
-- 
2.52.0


