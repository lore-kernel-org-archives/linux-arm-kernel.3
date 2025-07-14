Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E86C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Noy8Ox8z9Kh7txJdK8SNWuMbDJe6Ee8cGfBhrY9kUe8=; b=saMNNsbmp/PSUItMIYr3QS/0Em
	GlB7+4VnDhhWC67Rkm1WpEIrjc39QYeQV5Q4mYuvrGIUVX9Y3ChElq/QZ9e1irRJVpalG/g8WB5zm
	Q9x0d6WbxcTaePQJtUmtyLcbBxcAB+LDnXEN5H34LAhXdkNwNTniYdCiME3blX+Bk8h/+quyW7EHn
	LA+Be1S2GOq4Wit1vHd9Vx06bK7Z4Yfdty4k7zNnXSFNaB0qFq6wzjbM6tY7onNQ7M+dqvmtedHH3
	nQwJKJh4HrMxWYAZCFz3g7+d3KTVJIKAFgdA+pC+JKpNBCAxVcLvgXF/2d3hkwaEx5KwoVBy2dI0i
	wApAlzdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFj-000000034Gi-0BZ4;
	Mon, 14 Jul 2025 18:50:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMB0-00000002qjr-1m1i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 16:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752511034; x=1784047034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fpIAXpXNXAv248bbnrtINLulVPuRlVHg3Zy4cW4/LIE=;
  b=IfW9Ez2emmS85W/nf2uRN5EjOl2kxdQVj1CI5zEAEaVulJ3jT+01quo2
   5XohGPVuMZu/RqPTEZ6mVgSXNbTOi8wa1m0hP8FfSR+mIOl7WNAV5djWY
   +Voa/C+bDjZHlmRX7y2QTKq7oq4PHW+abXCh66oZs1U4g4OcZSe7YrDm/
   riZRQNv9RiwH/xUMn7LWSv0MCRO0emdm6X40AdPYXpQiBleTlMeFeB+vM
   2umTwWYfsrAk6jymMgzBrrM1l0q+9Uh5TjzFqKDrrScOCcAShRN9Icoj5
   jHEVpHrjB8v9C48wAGGJa+BtB4oOlTz7h9YdYGalUkqb8roo2LbhNHrdI
   A==;
X-CSE-ConnectionGUID: hBq1ljEWSkqL674rDMJkcA==
X-CSE-MsgGUID: dA8NuFKRS86B4XYXOA7fdw==
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="211399329"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Jul 2025 09:37:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 14 Jul 2025 09:36:29 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 14 Jul 2025 09:36:29 -0700
From: <Ryan.Wanner@microchip.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 5/5] ARM: dts: microchip: sama7g5: Add RMII ext refclk flag
Date: Mon, 14 Jul 2025 09:37:03 -0700
Message-ID: <8ea2d96c898ee7b57310b5155eee92efd4e25215.1752510727.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752510727.git.Ryan.Wanner@microchip.com>
References: <cover.1752510727.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_093714_540998_A1CDB958 
X-CRM114-Status: UNSURE (   9.20  )
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

The REFCLK for the RMII interface is provided by an extrenal source.

This flag matches the change in the macb driver to determine the REFCLK
source.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
index 2543599013b1..3c898afdc313 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
@@ -542,6 +542,7 @@ &pinctrl_gmac1_mdio_default
 	phy-mode = "rmii";
 	nvmem-cells = <&eeprom1_eui48>;
 	nvmem-cell-names = "mac-address";
+	cdns,refclk-ext;
 	status = "okay"; /* Conflict with pdmc0. */
 
 	ethernet-phy@0 {
-- 
2.43.0


