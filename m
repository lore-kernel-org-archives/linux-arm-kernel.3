Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A6AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 21:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Vqk6TbZpnivEiDrJB47J4hqNu2iY/kZL3xv6GMk5Ts=; b=AdHPD+g0h3ey338v08hvvxl/sV
	EVnMBBHMAkMq304lMX2W5MedCrR432dwtsmdLVlAKuvqhGLI03e1SkLymiKz9xecFbWVkBQJwCU9q
	QDWSN4PevGOWcgrd+2W+p6HsN2SyuGMMe/9hfFT2LUg0kW9XOFXjTKO4H9jr8pNgoSfdBI5XIBojH
	Z1bpp+2DqgFR51/c3AnIwBecCDLMdBiuZZwqgJHu7ccxSoDs4bijR9D9lfvBjrPl6OQMxpnxx4mZF
	C/KP94keGxvGdL99abKLXXGoxb3xmbm8sGun9kT68rP/A7M9JGb0UdnyVe3aemA6azQGxMVEAAYSj
	OAzzMmBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbDg-00000001TcC-0Tzh;
	Mon, 10 Feb 2025 21:21:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thb6U-00000001SUk-2I5n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 21:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739222046; x=1770758046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y2Ap/n3XU+GkX5uq/OLf/ypRq9fkD40RJF/s9rFn5tY=;
  b=PswnICUUzwV2i3EhEmFjMH3XRR8X88/5qNLd80WmwcElt2Jz0Cq/0KMz
   zWXAKdMaM5++vLmN+w98WvmX8muVpdxIMRB7j5+Li9x7rMQuF5Z4N9/Qz
   PcXNxGS0B4udzgU09eK6mqVfj2ZkcW7l4KKd3gEfYv3T5wkw10WD1s6D9
   2fHZU0znfoypGGEH/baoTVmi8NbtCx+MU7LonS5YHOnDUjR+95Vfi7rh5
   1deCs5GZUI3WW9mE+rGv5kFSackLy45eGvxk2fjGMJwPHzvqyLkwoqnmx
   ptkiwkNdo8coISMbhcmmH9MmiX+PegsNUWS2SrC0myb5COI8KiFFSsnj0
   Q==;
X-CSE-ConnectionGUID: AYqW9AG9RbOJ2Xf8Pt97Yw==
X-CSE-MsgGUID: Xu/owgQoQyGvay+u6W+CDQ==
X-IronPort-AV: E=Sophos;i="6.13,275,1732604400"; 
   d="scan'208";a="205027964"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Feb 2025 14:14:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Feb 2025 14:13:45 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 10 Feb 2025 14:13:45 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 01/15] dt-bindings: mfd: syscon: add microchip,sama7d65-ddr3phy
Date: Mon, 10 Feb 2025 14:13:01 -0700
Message-ID: <7e2c590467171cb3a942692aef5a679f127e567e.1739221064.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739221064.git.Ryan.Wanner@microchip.com>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_131406_644604_FCF7936C 
X-CRM114-Status: UNSURE (   8.14  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add SAMA7D65 DDR3phy compatible to DT bindings documentation

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index b414de4fa779b..51d896c88dafa 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -90,6 +90,7 @@ select:
           - microchip,lan966x-cpu-syscon
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
+          - microchip,sama7d65-ddr3phy
           - microchip,sama7g5-ddr3phy
           - mscc,ocelot-cpu-syscon
           - mstar,msc313-pmsleep
@@ -188,6 +189,7 @@ properties:
           - microchip,lan966x-cpu-syscon
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
+          - microchip,sama7d65-ddr3phy
           - microchip,sama7g5-ddr3phy
           - mscc,ocelot-cpu-syscon
           - mstar,msc313-pmsleep
-- 
2.43.0


