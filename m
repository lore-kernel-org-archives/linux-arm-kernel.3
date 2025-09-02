Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB7DCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 05:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bo2n0EcYv78IzqgkGAZK99sz2+6Tdq1YTLrEzluWBPI=; b=1TthaWRN8fslejFz2MicxSba20
	RaZ7/pqesCevuDKZLeeQqLg9khc+vJ6Ykyxm5ZuaUnQVnh76lJzShNvvk42POOJPHDYPeMAuPlpLU
	K+1N0POSvVvl2aCAy4gtKTxEa7O4oCivSesWafXqfVmIxlmgAJvFgvJdIZjLt5xQqtJk1wWqRyRii
	AYa9e/O9YjJ7BYWxXiSuuusiLfZVtsFl1V1VIQvujRJFZliikt3slQZTEgI692ono8EW1JMhtKaok
	89hKTKdAYC/bnVcR+E2WPa9KBUjIB1ntmDIIt3WrlumsZffl3NsYovUPBNoliJ2JpK5Vmb2rMByG6
	RIDsLf0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utK2A-0000000FPew-3xQQ;
	Tue, 02 Sep 2025 05:58:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utJwm-0000000FORk-3oTN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 05:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756792369; x=1788328369;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=g9qQXv2V8dA8IDQzFPk9fFZ2WneEXRTGvShebfzPtjM=;
  b=kf+1HMEzpdM6X7OIa7aoSDJQ4U0/o9xFB0LNgP2kwZHiKMMugw8Y0tq4
   kfFJxcI1ArLCTKbsS0pQ0flS+t/LwpSJsRwBeTRkOAylu/ZLVm0wIz5WH
   oo9WUs77ulO8XeDPOmTj+inoG3tm8eVECovWQj2jAgvpRJiZu+OekyYPn
   6PhwcgrBKxBwsf53rBq70AnsT/rLDk8hM6+idkEGZe6ZE69hJxmqo7gUi
   +1P20y94Oy++ne+uDnhp5dqNQkX04obvZriytCGJT+AVhzeip9S1ErUTj
   gS/l2Z9aNCCalRnAZqDoNfnYWgXxT0pidczD7gQ0cM+DjdcrVC5ui11gQ
   Q==;
X-CSE-ConnectionGUID: 1ukqY7Z2Svu+qnOLrd9exQ==
X-CSE-MsgGUID: shrOJ1pbSdyVYGCiC+RoQw==
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="46483414"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Sep 2025 22:52:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 1 Sep 2025 22:52:34 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 1 Sep 2025 22:52:30 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Tue, 2 Sep 2025 11:22:18 +0530
Subject: [PATCH 1/5] spi: atmel,quadspi: Document sam9x7 QSPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250902-microchip-qspi-v1-1-37af59a0406a@microchip.com>
References: <20250902-microchip-qspi-v1-0-37af59a0406a@microchip.com>
In-Reply-To: <20250902-microchip-qspi-v1-0-37af59a0406a@microchip.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Dharma Balasubiramani <dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756792344; l=878;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=g9qQXv2V8dA8IDQzFPk9fFZ2WneEXRTGvShebfzPtjM=;
 b=RXLzmMxnP+ToN+Z5oDPtF+Ea94CKvLTLwp5jSikf1MtD2AeOR7+ez1eDz8FFGXArQU76S7HRC
 HyNXMhbLmr4DKegxye+QNurlMaBOIchdFnsq2nOnOmPZ9VClBFbWItx
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_225249_024174_89002253 
X-CRM114-Status: UNSURE (   8.53  )
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

Document the sam9x75 quad spi that supports interface to serial memories
operating in

- Single-bit SPI, Dual SPI, Quad SPI and Octal SPI
- Single Data Rate or Double Data Rate modes

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 Documentation/devicetree/bindings/spi/atmel,quadspi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml b/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
index b0d99bc10535..c17114123034 100644
--- a/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
+++ b/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - atmel,sama5d2-qspi
       - microchip,sam9x60-qspi
+      - microchip,sam9x7-ospi
       - microchip,sama7g5-qspi
       - microchip,sama7g5-ospi
 

-- 
2.43.0


