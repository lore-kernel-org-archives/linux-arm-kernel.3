Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79A1C3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+T/GVIniHdTx7ai9tJwBSdNnz1JA37qHTnMnNMgdSBc=; b=CNa+SwGj5kS4lfSw9ts6pbjIyq
	4EvozAMusIKwA776/p9ZEwOfSx9p/UBO1jMoGAtpVZFO6H35RibhTk/bIVMDwIdBBsJ+Ongk7QV+D
	NTUYP3ArDShCeEKSWeXQ9YZ9EldDznqBFVvQKA9rTlB+FNmqkIkAVNFWGVl+SSlqYrG0Eq21sIJDr
	TruCE5FPrPvOy6jhRLru8EyDE+kfwHaGy6wh5Yeg/d9iT0vUHE8v6LaStpQ6qSi2kEiIqjHKoJPt9
	mSeW3lYW3DoLQHRhkV8zLuX48nGn67dL7yQctqmsi1LrFoUzuBGI/okwvaF4O+RLI64imYDEmc4sC
	/aAcIBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTD0-00000008wLT-35km;
	Wed, 26 Mar 2025 16:02:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSnz-00000008sfh-2xkQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 15:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1743003395; x=1774539395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=toMNQd4avKTFMnab9oaQtpEAy0iSa3Y/1sjDr01cM84=;
  b=TV55krEnWt+eiIR5ixxFC+0PfcBjfQ95IuAyPLMDLq4ijJvbMCPaAixh
   f017eqr2kgfiN0/OC4pPBqRzWPmNpuJB/cTSJ764mW9rShsID3a4NvRWN
   chCpqZgShq7pS6hksGcwO9cykHAAX+OajvJ0xudaI8HfTbKvqH33pOkRu
   stEqbbY9LZ0mVB6MU+JbvVUKKCnOC8vWTMORIIMErI3vWxOPpRd3SWI6f
   mGUMsjoGJdY4yUUeL8iPSN1XGt063wVCDxBrpM/1bfb6RXI8dHvX+GE/q
   Dz+k+QiTZU8GbzNBHFtlufjtb/Un9p1S+LA4tOMG15NfbQ5bvhfsqq3e/
   w==;
X-CSE-ConnectionGUID: NRxSiTFnT3ucBnaYj7CaZg==
X-CSE-MsgGUID: C3tCCdPASgia4Ox6w0hD5w==
X-IronPort-AV: E=Sophos;i="6.14,278,1736838000"; 
   d="scan'208";a="44096108"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Mar 2025 08:36:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 08:35:51 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 08:35:51 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>, <sre@kernel.org>,
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v4 08/11] dt-bindings: mfd: syscon: add microchip,sama7d65-secumod
Date: Wed, 26 Mar 2025 08:35:41 -0700
Message-ID: <7248bb9d4ed491b178072b09830d6d68fde7b872.1742936082.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742936082.git.Ryan.Wanner@microchip.com>
References: <cover.1742936082.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_083635_759370_996AEBB1 
X-CRM114-Status: UNSURE (   7.92  )
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

Add SAMA7D65 SECUMOD compatible string to DT bindings documentation.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml b/Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml
index 6edeb320220f..2f3e8722443b 100644
--- a/Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml
@@ -21,6 +21,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - microchip,sama7d65-secumod
               - microchip,sama7g5-secumod
           - const: atmel,sama5d2-secumod
           - const: syscon
-- 
2.43.0


