Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CA8C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xi7BXKj7dO0+F7jCRO/UavDC1rA1ynLAStCdxwVvOqg=; b=M8XdkEiiaASgU42rMSOEqlJfUq
	DTS4TlaGUw2NxKJYq0l2raXioNI+G5tY2wbONL+E449ylgAjQDZdXGEc6bxbqA5lubZM8ZPN13cig
	sf3SpWMxwCKyYdI0bXjDMojDQHOBjWtbVHLIZ7xZTkui2Ev2poAVKaC80z6UW72/GCwMC8BHT5MNh
	g8S7k4ijNq+5/XxEZWXX/e27+Bwfn7ekLzFlHcXR7j8Ojj/i/hqQK05s3NZWNMheC6+YJLJoWG6fp
	wFqJobxPOXg5TG9XSnPQFSrNXjrosx8mK10984zK+Ycprp2GpMmzysEqIV/ZNhcyhVjNg8i9hUyCd
	9KBVK5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjif-00000008Wcy-1RDE;
	Thu, 27 Feb 2025 19:38:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngC7-00000007xuh-2NdT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740671583; x=1772207583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9bsGD1HtLiE5n6V0YC+e3jk1OxXU7Mp7V0z9UDJ1XPc=;
  b=hAKV8NsXBXBdNWchYDw1J8bFLQxphoFw6SICFsL+7k7ZLDR+GcnJKOYD
   P2r89fhJeKNqeqeH1gOiHC+d/X5bOlPkISxtxVdEBQuoUZrl5uESRABNF
   0kqJhRPmi83EbPAj8vFmUdjR2+2NGxuqv3POt/ylu2Jukh8TVORGLko0a
   yNBteYk0KoOtUmEw0b2lJuVRngzI6LseFguohmzh7xSuCmH9WBGiR+sK4
   SZTiQxkYbVVXtQwAwZ2zbHUrA7p4swlz1vlDlts/f3eiV3U00oMwKZFir
   rwP9La6bAYiX+78pJv87dTflPejFL7KNUS5rex3JuII/lCSrRQ3s8ddyR
   A==;
X-CSE-ConnectionGUID: xBkIAngZQVSwQhIMCQbtUA==
X-CSE-MsgGUID: UmESS6IjRrOgI0xd1tUzAg==
X-IronPort-AV: E=Sophos;i="6.13,320,1732604400"; 
   d="scan'208";a="38638180"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2025 08:52:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Feb 2025 08:52:46 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 27 Feb 2025 08:52:46 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 15/21] ARM: dts: microchip: sama7d65: Add Reset Controller to sama7d65 SoC
Date: Thu, 27 Feb 2025 08:52:02 -0700
Message-ID: <a9620ff11456a1ddfb9c289421606602193ce5b6.1740671156.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_075303_668633_070E2D22 
X-CRM114-Status: UNSURE (   7.91  )
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

Add Reset Controller support to SAMA7D65 SoC.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index c10cc3558efd..5165259fb926 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -102,6 +102,13 @@ pmc: clock-controller@e0018000 {
 			clock-names = "td_slck", "md_slck", "main_xtal";
 		};
 
+		reset_controller: reset-controller@e001d100 {
+			compatible = "microchip,sama7d65-rstc", "microchip,sama7g5-rstc";
+			reg = <0xe001d100 0xc>, <0xe001d1e4 0x4>;
+			#reset-cells = <1>;
+			clocks = <&clk32k 0>;
+		};
+
 		clk32k: clock-controller@e001d500 {
 			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
 			reg = <0xe001d500 0x4>;
-- 
2.43.0


