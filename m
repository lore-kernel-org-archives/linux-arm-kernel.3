Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D7CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpqD17HbpnpPgjA0QLFwKE9hxQwAFdZD97TyQpfKKbs=; b=Lyuh3Juim3KRKyluF75wGrdfvU
	W/5V3jz7079FjX2bpn/hFpco0eBvgn4aKrugQ81pqLdzPi6QWYKhQdIUXEZMBuMC0E5W3N3Rir59i
	Y5oIXIZxIwyvkeZvVuU1YMvuhYv7KPx2Q2qgJojr5J6YBB3SqD9U2boWAyyl4go/IVYOcgcIoBCZJ
	d5kYIdssvNvtbOW0sIcfo8eXCXXL61suEK6C7uZ7BP+6xmeqCBRozB1S9uOphfPIK0+hihL1Mm8jV
	aQOdsJc1pz7MaeUKxsPi/E035+WrQPT5Ygnu02EEtC+hY9KQcieplVBnaTTmvH7lCiJ7RM3j/4cLB
	iX5Apgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTgo-0000000BRT9-0OXn;
	Wed, 11 Jun 2025 22:12:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRRL-0000000Az8v-1rFA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749671331; x=1781207331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w/dMst1udcetA1y6IV0fshp6d32+nQG/D7UUjKQHprU=;
  b=vY9A5y1kUNXLw7+GcX8PW5/RhMnVgZu8OHuZql1OuIM6LcnjBtZ/m4jS
   8FszAXJ87sWoHv+HvGVod0AsYpoIAeCarJUtK92p7Rtrdi7xkQUQh463g
   pv52xMTJdINl7Dl6sfnozELWSUEDRukZnwgDyr07UWllFrE7emwJ2kqpx
   qve35cdu/TqhXimKaNUcNk5Wn9Q7yaa1wLb3TgroaVK08O0LFh71kHrII
   7GJJcsXZymuHhGcPRGG1r1HGrfE+0odGiUovFp43VJIYH7nXduMx8BZFP
   rgqWXNl4wSBiUCKpiZrv1vIbVNP2wSzwyQfQGNs3eBjv+4iyXE7MGf/qr
   A==;
X-CSE-ConnectionGUID: Mlj04rVUS3aXDCaAEgxBzw==
X-CSE-MsgGUID: rxi0SeHCTBWnsQEPh1vbpg==
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="210175098"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 12:48:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 11 Jun 2025 12:48:17 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 11 Jun 2025 12:48:17 -0700
From: <Ryan.Wanner@microchip.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<olivia@selenic.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 09/10] ARM: dts: microchip: sama7d65: Clean up extra space
Date: Wed, 11 Jun 2025 12:47:33 -0700
Message-ID: <ac1decc35e2b4f706cf6ab9378f2c88e5295dde4.1749666053.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749666053.git.Ryan.Wanner@microchip.com>
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_124851_539149_7F2B333E 
X-CRM114-Status: UNSURE (   9.67  )
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

Remove the extra space that causes formatting issues.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index 53a657cf4efb..759b963d987c 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -38,7 +38,6 @@ reg_5v: regulator-5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 	};
-
 };
 
 &dma0 {
-- 
2.43.0


