Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BB7F532D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 07:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMlXGNSrzeWX02K6/jDBeXVUYRaPPLtNbMHvyzDfDbg=; b=aswxVomJScTnW0Q93Nez6f6Tii
	tN2txaaJ00/XIDVwONcGvDEE8XUpwiza1cZ6KIge74jF3r97pavDkkoVVEFBLyoTfWKoZqLRh3alh
	rzdVnK2W9CFuti9eQFgBD4uqmHxwvL5uYGTQRAmj5hX7bxdx8yRWlOxvN1Co4JwF8rUu+62xDwwsP
	pPnHsD+eSQuGKjpk+owNSP+/iLbKXjxl4aAWEhBnb/7hVtSJf+TpcMqhNpxZP7BBEygYp/n3TRJNT
	wp0rZbeIJodLyuM8EfWE3pV2/Wp8hyuxyxYy9o5xqDWRO1mQHY0Be2dfc3si4L+awGfwQ1WZvKmEh
	fQOdO0Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vtt-00000000rjX-0s3J;
	Tue, 24 Mar 2026 07:10:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vtr-00000000rj0-097p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 07:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1774336203; x=1805872203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tn3pLiKyPA4NVXqBGDmX0bnIDFBEkAJy7bWlHRzOd/g=;
  b=0LCT7AiMdiGpX9ZAvAs4wbpeh89447XsibQBRgVRdFvHQlN3muaR7fBy
   FkUYIT7OUsVaGt6nn9QtTQXLA7JdXq70dmoL1xxmMagEscL01EIu51BI3
   ECFYwEJvOeg+C7r+gb1QA/t/5ZpE/JgtBQgRDi2k/c7Z0ANfJ63XSRBUL
   03l53ImWxAP7Qy3X9zqQfEC29ZThquCxRxyIpX4lnkoesDNkekJOpV9jL
   858DHbCNg0okY1MQe4ZVsTn43maCGOvUB+VrM5YGX+y+/pI9uYphz2I55
   jP1AMmnaPhdBEbUJuOuCguqOOFtI0A/AUTxJ7dSJHZBvwv18iDe8TnlQb
   A==;
X-CSE-ConnectionGUID: JHOMLq1tTaWBy+hZwmXKmw==
X-CSE-MsgGUID: 96A9w8gMTHaCi5iuCoBLlQ==
X-IronPort-AV: E=Sophos;i="6.23,138,1770620400"; 
   d="scan'208";a="286479796"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Mar 2026 00:10:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 24 Mar 2026 00:09:41 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 24 Mar 2026 00:09:38 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2 1/1] ARM: dts: microchip: sama7d65: add Cortex-A7 PMU node
Date: Tue, 24 Mar 2026 09:09:27 +0200
Message-ID: <20260324070927.1496-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324070927.1496-1-mihai.sain@microchip.com>
References: <20260324070927.1496-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_001003_090663_CC7573AC 
X-CRM114-Status: UNSURE (   9.71  )
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
compatible string and interrupt line so that perf and other
PMU-based tooling can function correctly on this SoC.

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
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index e21556f46384..ed1ec952531c 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -45,6 +45,11 @@ L2: l2-cache {
 		};
 	};
 
+	pmu {
+		compatible = "arm,cortex-a7-pmu";
+		interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	clocks {
 		main_xtal: clock-mainxtal {
 			compatible = "fixed-clock";
-- 
2.53.0


