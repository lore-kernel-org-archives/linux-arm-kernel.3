Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7B5CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Y/U3zylxiiKFPVpsOwi/XNbLU1kl/YjFR8sHoGtWj8=; b=H5OuOimvLJ74DRNgrU9FrdBSld
	rCh4gjoLwmDYHKPmrAj7mUhzHvtY6eYGeDMhcFZVK84U4S1pme9JNrluonDTAC0X1dr9IYV3ld0UQ
	4F8nN2/Z4Ih1fhMa4bP79r6RiG6Uo6y4VEREdahiaKOy76kP3mzJDzwxekvxPS2ZFZHdVgRZmYvra
	dDaU83RAKaas81dhLeQIMdszDgrC8Pr2uycySBUhogKD6AHQ+A4VGJ8zgqr5lbOwTRjiUJ50ACkM9
	5sJt2WialIJ/6mNeKYT2FgneKTq6pZMgYECgquN/TbL9NamLfbjrCLIb3jYH6z2RY4ui6F2HopML7
	usPxEj/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRYd-0000000GnrW-0c1O;
	Mon, 25 May 2026 09:25:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRYb-0000000Gnq8-3J7q;
	Mon, 25 May 2026 09:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7Y/U3zylxiiKFPVpsOwi/XNbLU1kl/YjFR8sHoGtWj8=; b=iGPxpyPjH9rK6+soG9250VzUrh
	s1lcvYj38/mLtl7aGDNC1IiQAdLCRzXUNeieUDQLOlHI8DHjCZ4NU01C+QLYtvgCNObgvG4N1GTp7
	3beIhNhOAFkDDQdbJ+jl2s8zLeas2DbUo3Ot81hovV4Lb8vMNd9YFnraJRYzNtNLegciC6HBieLo9
	/KGViwVhLuTPHpGvAKDUPevV3p1/3mbPRlp9ZunpWKkx4GgaBAA2/vvHrtsjwdRbf86XpwM/rxwTd
	cKr/mRl03QjuEt9HIFvMjZG6K6Vhn7RtuckXwq4uXn6CKauSG4jH8GpT8p0/LeWrJnnEe8p3DTAEa
	s/Juju3A==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRYY-00000008tJm-19A0;
	Mon, 25 May 2026 09:25:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779701106; x=1811237106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6AUu28k/Clqbv8wTtKnnwKjWBW9XtjZIigR38lrNNYw=;
  b=kMQU2dQVWh38LuqcCf8lBnlC+hNDPcSJwGL2wx42GMlHT4852Zxol3nu
   qFycqmn8L1Y/LW9u+/4lMlrVKABKdDFLbfMzlMAHD9ISxBV+YY5Lg25Oq
   xxvQqnyovOZDNHlnIV05SEfm5rIENXhHlNJWbZWVJIb9ouYUXGJov4p/T
   siDQ6sL8hAP0PC21MIE7h2wEqcef2EQbHcfIeklo5VDAou7XKtZ7qW41p
   LXqz0JxUoZAWKRQzRYYk2T9hesBkAXAH9JVuEIEIzvRe0RGWDKYqqKydc
   1SR2WJmWcFBYHPAqHC6CBAIdtRWU0+BlPBZvXQh0SRaWiOtbVQ9YT5ji5
   Q==;
X-CSE-ConnectionGUID: w72KhTerRzCNpgloKDd3vQ==
X-CSE-MsgGUID: /Y7BedzdS4eyqLDAz5w4zw==
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="57215514"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 02:25:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Mon, 25 May 2026 02:25:04 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 May 2026 02:24:55 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>,
	<aubin.constans@microchip.com>, <Ryan.Wanner@microchip.com>,
	<romain.sioen@microchip.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>, Durai Manickam KR
	<durai.manickamkr@microchip.com>
Subject: [PATCH v7 5/5] ARM: configs: at91: sama7: add sama7d65 i3c-hci
Date: Mon, 25 May 2026 14:54:05 +0530
Message-ID: <20260525092405.1514213-6-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525092405.1514213-1-manikandan.m@microchip.com>
References: <20260525092405.1514213-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_102506_967325_CADD8589 
X-CRM114-Status: UNSURE (   7.63  )
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

Enable the configs needed for I3C framework and microchip
sama7d65 i3c-hci driver.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/configs/sama7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index e52f671ccec4..6470c7d3fe8a 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -117,6 +117,8 @@ CONFIG_HW_RANDOM=y
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


