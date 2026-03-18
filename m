Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65E7FCD0B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 05:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSwLDJsL+FNzoqgueI57OAI7xlIzyZ+zcx8eR4P56t8=; b=0/u0JzLBF3TzYJRxlHEmxML7xl
	/JDjafAmNuq3JPqRwFqEeZ4SCfQr9fM8B3K+6c6slVzp9pCbeOO5pnfOlVmC5FVdHIg3+FWL+kPVi
	CJ1OJS7g8WDofyqxj3/kBecb+1jEmr9XFzRfbwCGMdAgaVrJ3xx2vnq8FqmFM7JnFD573bzCxQXVZ
	89yiFreAHpbxegdsMQFnBFAocO9D7tsFIVT3398/XfdBNqZ8ilhnCiMa+6gWDlxVQJSJEov+ootEE
	jNQH9SSxOrXmvD38tNDjrzErGHhEtz43Qn+pMyzQo3s/I0EkS62/7BVVRuiK3/502oBpNO2Vgf8HM
	6FepcT5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2jr4-00000007oQo-37de;
	Wed, 18 Mar 2026 05:54:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2jr1-00000007oLg-3LFJ;
	Wed, 18 Mar 2026 05:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773813245; x=1805349245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KhmIAgIkXR/FVGhINWVvBX+bl1GcxmHxs9BhpZObeTQ=;
  b=hvc0WUVy9SSDkVvGcZKoCo+LSNV2+edHbtk3NXl1i9HoEiY0jqQUqfBt
   nsRfyQgTWo5c4kjgG0M0/s7ZHDA4pvwuI+4zHoArXsFgAoeeDlbBiefBL
   QngRWxohKfUsG99GW3ygKPz/gPpJ8+pTrFzFcsnpPuIrKqKU5FhJvle9t
   c5FyLcev0rhsf+az7/AzFzzCmnDIisW22tyrHgzo0RO1yRHTIJI0YAZ+d
   Rh7MztmYyy/rZDpQcUXCUOAYZmRjAkkxcX6HLCcH8Y36tn5gZXN94k3ve
   AuZf3ZZaBTp+Bln4a4q9Ku5sK+JJxmrQN+RlZrYlZwhBCXPcEC6O94lb4
   w==;
X-CSE-ConnectionGUID: 7RnLfcZ3QASwdVwtDRViwQ==
X-CSE-MsgGUID: u6QQk4KrTAW3xOJGhrPHnw==
X-IronPort-AV: E=Sophos;i="6.23,126,1770620400"; 
   d="scan'208";a="286208477"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Mar 2026 22:54:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 17 Mar 2026 22:53:37 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 17 Mar 2026 22:53:28 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <ardb@kernel.org>,
	<martin.petersen@oracle.com>, <ebiggers@google.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <kees@kernel.org>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>, Durai Manickam KR
	<durai.manickamkr@microchip.com>
Subject: [PATCH v4 5/5] ARM: configs: at91: sama7: add sama7d65 i3c-hci
Date: Wed, 18 Mar 2026 11:22:30 +0530
Message-ID: <20260318055230.307030-6-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260318055230.307030-1-manikandan.m@microchip.com>
References: <20260318055230.307030-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_225403_840350_4920114E 
X-CRM114-Status: UNSURE (   7.04  )
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

From: Durai Manickam KR <durai.manickamkr@microchip.com>

Enable the configs needed for I3C framework and microchip
sama7d65 i3c-hci driver.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/configs/sama7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index e2ad9a05566f..a59b262e48e1 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -115,6 +115,8 @@ CONFIG_HW_RANDOM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_AT91=y
+CONFIG_I3C=y
+CONFIG_MIPI_I3C_HCI=y
 CONFIG_SPI=y
 CONFIG_SPI_ATMEL=y
 CONFIG_SPI_ATMEL_QUADSPI=y
-- 
2.25.1


