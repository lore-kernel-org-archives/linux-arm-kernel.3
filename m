Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143A2C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 19:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWxMuY1ARst70QvUScvf8sxmwLsjpAnurL21yxOWqwI=; b=DXikULKwc0SYmb0ep65K/sJwgL
	+9m17zBoIr3vRLitMyyPVZ6Pmxl9smAAN1h4I21eSpVTT4cjX6c/s1Wwm/hNo1hbTm4zR8ykg2tDK
	GZQGjVxFGMyiwTPMvcp5QDc/wEUeiFFiWpVf4mi8ICAfTISHSb9fAEUL4rEz43GPwnP4wn5bfm1TR
	28vVneyoXza0ECHhEsqQPPk5ADkX/k4vzQbwwfWRu3BfxXL6l9kGk4uQGW73NWg5/iqay6an28bLt
	KOXtqHWxY7S5eKTQ5K4c0m8KfKD/P+KR8St25vu/C+R3zWOBwkjPBqfaOcVDHEoVGfIpic/L1GaHk
	Sr0LdgbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZ0O-0000000AYfQ-1Lcd;
	Mon, 12 May 2025 19:40:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYqL-0000000AXJ4-2Og3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 19:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747078181; x=1778614181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z6V7mSq7GXzEixyZ5bJFvSwoZa1KZkqKDSMRxyrkX9g=;
  b=ZSzbj81VwOqce5wkSINEtYoOtUIZAjpm0RpwJoGwFOPXH7PXh+Axt4gh
   t3znwI1zHJtLnNN8PitE9HcEe4fhGlqbMi5GEcAXVev03B7LLciQaWQfW
   4c85Nv00M2kXbXceel0tn5Vtr/bC1uuk9nI34S0zl9+bA+8eOH8hfzGS+
   eMacR1HsCOhsfvVxjt2dFyujzPWuKCpxcP5SmU7v1Reyfayx32brtZYGe
   cL41/hGP8DqDC9DSvXYrzEMPL2GgS1iGuxvZgKnCeI9T/OJOMjXVQOsbf
   iSzioRUGaEY+lpn7a79Rh4H3dOyl8ynCyPxHJvuCnzWMyQo8EZn4jSmXq
   A==;
X-CSE-ConnectionGUID: hYKpzzHaRPOvLPNNOvU8gw==
X-CSE-MsgGUID: ubj1cdGBQbusmFztRimBgA==
X-IronPort-AV: E=Sophos;i="6.15,283,1739862000"; 
   d="scan'208";a="209006611"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2025 12:29:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 12 May 2025 12:28:57 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 12 May 2025 12:28:57 -0700
From: <Ryan.Wanner@microchip.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<olivia@selenic.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH 5/9] crypto: atmel - add support for AES and SHA IPs available on sama7d65 SoC
Date: Mon, 12 May 2025 12:27:31 -0700
Message-ID: <9535f6957dcfcab2172f4d468450dc44cf485d02.1747077616.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747077616.git.Ryan.Wanner@microchip.com>
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_122941_674460_AC883EC6 
X-CRM114-Status: GOOD (  10.94  )
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

This patch adds support for hardware version of AES and SHA IPs
available on SAMA7D65 SoC.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/crypto/atmel-aes.c | 1 +
 drivers/crypto/atmel-sha.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
index 14bf86957d31..4a3db3dca272 100644
--- a/drivers/crypto/atmel-aes.c
+++ b/drivers/crypto/atmel-aes.c
@@ -2296,6 +2296,7 @@ static void atmel_aes_get_cap(struct atmel_aes_dev *dd)
 
 	/* keep only major version number */
 	switch (dd->hw_version & 0xff0) {
+	case 0x800:
 	case 0x700:
 	case 0x600:
 	case 0x500:
diff --git a/drivers/crypto/atmel-sha.c b/drivers/crypto/atmel-sha.c
index 67a170608566..f7021925349e 100644
--- a/drivers/crypto/atmel-sha.c
+++ b/drivers/crypto/atmel-sha.c
@@ -2532,6 +2532,7 @@ static void atmel_sha_get_cap(struct atmel_sha_dev *dd)
 
 	/* keep only major version number */
 	switch (dd->hw_version & 0xff0) {
+	case 0x800:
 	case 0x700:
 	case 0x600:
 	case 0x510:
-- 
2.43.0


