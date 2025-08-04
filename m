Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418FBC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGpwfceDAfoSEiZVGJujpKlG/FZndlPuK0bizwG6s+0=; b=LvWCPlKx0caECjwNCCF6Fh5uov
	HsCyIHuVXcR1v2C3AfJwBX92zPlRHR1cgcCSPZnyzslIt2jgWYM7R1bU5rgeB7oNlcpmNH9Jy6MSa
	0U9fGf/fc2aXw8Oswdm1dizNd9Qy5fa4r9yI5Jqxpss/LLMdQjDB+ofGD+Va/M8e3Z3/SfFv09HJE
	soawpj+/KZfgDYmliTbE1f2SrTjSHU2RG3XlD6EMm4HwPFYEk8YrHv08xR5/8PwKgKXwRMHxIyDMV
	tEwBXDMANnsMDCiiGZCGSYlFoJmR+4ivafmvZP5Vbh8QbYyx7Fevu43lYcWxtRkxGhPPzIZwMrj29
	mmw+S31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisCE-0000000AALH-05Lb;
	Mon, 04 Aug 2025 10:13:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis2D-0000000A8rp-1WeK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754301793; x=1785837793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1TygnOgGAatMx8PiN8OA5sB+U38Od/216aX79kNIIjg=;
  b=xHZzyMq5XCmCmIO4FZfOe71Xl9OJ6Q6p7rOTLw3c0ZkiE64q3ttBLJDI
   UWZnsraK1t9AYOE7IslbW+HO6q1xzM3FDiipaSXuJ3txZeGLaO23uC4VM
   /f6KUwgmaWyv/0S2Y5ebCpwZdy/D4UB4B90P1wOkgWOWr1gMqfkhx6+1+
   znzbVD9ymlH4LtT4NUkqYjEl/V4c+4iiUo5pp/0ZhPEKYY/X6+ow65Au2
   MBb2nD+XVTnm6UBZbTpt6MYi4gIacs3mAScnJfVnJL9SPzER0LrtskuG3
   spvbvYwomB77WMh/DsOu1no/uxJuVmHVQAx07gPMH3SPR+owFgbZDn9ZP
   w==;
X-CSE-ConnectionGUID: Liqowa5KRuKZ85yXFKRAhg==
X-CSE-MsgGUID: A2tQGFiYSiuHs+dCDtWHBg==
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="50182875"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2025 03:03:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 4 Aug 2025 03:02:47 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 4 Aug 2025 03:02:41 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <eugen.hristev@linaro.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH 03/15] dt-bindings: microchip-otpc: update dt node example
Date: Mon, 4 Aug 2025 15:32:07 +0530
Message-ID: <20250804100219.63325-4-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804100219.63325-1-varshini.rajendran@microchip.com>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_030313_407362_3EBE2590 
X-CRM114-Status: UNSURE (   9.77  )
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

Update the example binding according to the new driver implementation.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index cc25f2927682..e9059dce85ef 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -42,9 +42,8 @@ examples:
         reg = <0xe8c00000 0xec>;
         #address-cells = <1>;
         #size-cells = <1>;
-
-        temperature_calib: calib@1 {
-            reg = <OTP_PKT(1) 76>;
+        temperature_calib: calib@41435354 {
+            reg = <0x41435354 0x4c>;        /* Temp calib data packet TAG */
         };
     };
 
-- 
2.34.1


