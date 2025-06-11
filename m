Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F4CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWxMuY1ARst70QvUScvf8sxmwLsjpAnurL21yxOWqwI=; b=VpY4JlsJE+FxKjYhed5zyyaBOn
	SEa9+jNgelO4mL/SxtIqax7vRvUeavuqzIprQh1CD66qehgCKARhE6FbRwn5qB7Xcs0KFcBhYa0KO
	CLqoDUkYKmmqeSPoES3ATvOW+A+gzK/5OZCGCYoyj/vilR4hXLP+d/9EnVA6+jQUOY8E6UoPmn/G2
	DZSmIZAZklFbE6SLXjHKD+a1q+uHanlgMpzvd/VF0bQdO9kf4YKZgXEJ8OhaRJQ3OreDbiEWU+1sA
	e+ZrEaAyltu/HEgLGPb40FG/cpj9t6RJiUyK53eZVKUYuSjImZWHqS91L+NufYghLB7re7EHGi87a
	0A335X8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTYP-0000000BQeZ-0MPr;
	Wed, 11 Jun 2025 22:04:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRRJ-0000000Az8O-1yCD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749671329; x=1781207329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z6V7mSq7GXzEixyZ5bJFvSwoZa1KZkqKDSMRxyrkX9g=;
  b=NyVP1WnahuKjf8mV0ToIT6J3W1LywZVKkXNOWUQc0sVyDjAdNRmugOsK
   wJSxDpHUR/Riq0iPZzNzEunOkHyDr2zjIzqufj/JZ69UFAMym8BFDg/jA
   m0gzlYlSraSUVb2INeEaEe1Tvp8ueAiuyWqd5PJNnTt528RQsazbFstTE
   sW3FUIwGFMoebaqs/6n2rB0O26mV7HhTb9FzsvhR7hhbHuwsKOJop+rt/
   xOSgTMubRGZQOybz6RxLbgK6ur2FQa8799P4WeUjEr6nDiebnRENoiIqi
   8bxfyTSqBibTxFsHdb9PsLenzyxDZYGwragWKnIkfgFfiEBXElJdAemZF
   g==;
X-CSE-ConnectionGUID: Mlj04rVUS3aXDCaAEgxBzw==
X-CSE-MsgGUID: dVq9KnpeREi65SXQ+s1x9A==
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="210175091"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 12:48:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 11 Jun 2025 12:48:17 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 11 Jun 2025 12:48:16 -0700
From: <Ryan.Wanner@microchip.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<olivia@selenic.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 05/10] crypto: atmel - add support for AES and SHA IPs available on sama7d65 SoC
Date: Wed, 11 Jun 2025 12:47:29 -0700
Message-ID: <b2bc8b978221a2b4e76012a3f3b11e4ad15fcf79.1749666053.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749666053.git.Ryan.Wanner@microchip.com>
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_124849_573189_C2E719AE 
X-CRM114-Status: GOOD (  11.20  )
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


