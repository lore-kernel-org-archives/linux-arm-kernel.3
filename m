Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED30FC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 07:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+4VNCLJhpe4exdfPMyWWE0/aqrnBjhvW0HpdBFiA3Q=; b=GhcFtOUowTev3ynSMIHRXOVGzY
	vIRdsngdtQwZZh1QGMFkopHb54Ac2Ln8/BnluaD8EdPwuKbasY6qV/azy4XPB8cX9dsnA9XT/Bfuz
	F9IHenNTRhlLFqCkBdk1t4xLXk8f+xFV0Ejs/gMJfm6MQjrf6zZEgQpdKmAWczbSIMYAdZM/j1PUR
	IUiy159BgSjUX6rqg57e2LwvaXGediZlIQefn4gl4+Jf4a+PIpwB/8X/BLyaRnxik71KAHDGQakpm
	MBA2H4W5nM9fq/tsFLskEpIJR+0uD262U5wxYpQy7XCkSS3YrZEbJobvhgwhUdnjHoUh9O3pUzYT+
	CaCD3rkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUK90-00000007kbh-3yqf;
	Wed, 25 Jun 2025 07:02:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUJxX-00000007ii9-2VwB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 06:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750834216; x=1782370216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ea1LBPyOvgGFO/YL0AUNxA/G1R2YdGQR14rWQgcjUKc=;
  b=RYDw1zU3IG1XXSuSMO892Q/rGvCatzewmBcGSq2lHpFJL0mkAvJIF8El
   /OAs9FRxDPao2qVQGRSbS5voU1Cx5+9SeUEfqDfcQJ6geG5A3DPBsu8mP
   z22U/Bu8uoBfqkt7uQQ0ii5py58SWz0csxXkpjPjKdZARG19wxZ6qtuFu
   ZDtXSkog86IWur+AMGbiSZrEK0TysVIRpkfb9N6Uj4ZG6u5EeebOsyCu4
   9HRhq0g97SdN8z0vptxiiv7ytJo8fKt6LU/BQmCwYwdABnWedxaENGBL8
   08+VPWpVKtrEQaQ9UGPhDlVPG02U8DbEDx+g/9mLl2vxMY4QhS95NfyH3
   g==;
X-CSE-ConnectionGUID: I6q3k54CR/y9OS0wbbtBHw==
X-CSE-MsgGUID: I+4Mc2cSSRqa4eb7nKUKsA==
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="43193031"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 23:50:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 23:49:55 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 23:49:53 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 3/3] ARM: dts: microchip: sama5d4: Update the cache configuration for CPU
Date: Wed, 25 Jun 2025 09:49:34 +0300
Message-ID: <20250625064934.4828-4-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625064934.4828-1-mihai.sain@microchip.com>
References: <20250625064934.4828-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_235015_654435_9493B0AB 
X-CRM114-Status: UNSURE (   9.86  )
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

Add the memory size properties for L1 and L2 according with block
diagram from datasheet:

- L1 cache configuration with 32 KB for both data and instruction cache.
- L2 cache configuration with 128 KB unified cache.

[root@sama5d4 ~]$ lscpu
Architecture:             armv7l
  Byte Order:             Little Endian
CPU(s):                   1
  On-line CPU(s) list:    0
Vendor ID:                ARM
  Model name:             Cortex-A5
Caches (sum of all):
  L1d:                    32 KiB (1 instance)
  L1i:                    32 KiB (1 instance)
  L2:                     128 KiB (1 instance)

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama5d4.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama5d4.dtsi b/arch/arm/boot/dts/microchip/sama5d4.dtsi
index 59a7d557c7cb..ec1d68c640de 100644
--- a/arch/arm/boot/dts/microchip/sama5d4.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d4.dtsi
@@ -50,6 +50,8 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a5";
 			reg = <0>;
+			d-cache-size = <0x8000>;	// L1, 32 KB
+			i-cache-size = <0x8000>;	// L1, 32 KB
 			next-level-cache = <&L2>;
 		};
 	};
@@ -143,6 +145,7 @@ L2: cache-controller@a00000 {
 			interrupts = <67 IRQ_TYPE_LEVEL_HIGH 4>;
 			cache-unified;
 			cache-level = <2>;
+			cache-size = <0x20000>;		// L2, 128 KB
 		};
 
 		ebi: ebi@10000000 {
-- 
2.50.0


