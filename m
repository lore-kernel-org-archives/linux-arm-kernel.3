Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C05C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 19:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbiQTxwgwqv9+3c4c+zz1CITPd2PeDolvRpcxIQKXdw=; b=Y+TQaje9GGrgWFbVO7odmdK6SD
	DykHn273C/gRCfSobk78FzrXOasu4G84xyVE7V50vNewhZbH4fZ3mZLa5odE7dJDXXmRHUnY02i9d
	+wOY53ljf3DIlHYTY9asmeIkTusorSAtEtVHDQYpZjDMU1Uj1gkN+QBhtDCdJ4qC3P98WJ+MMoMEW
	eS+62mfZnK19YAcMuVi9gI6JPZVxiSy0l+ZGcPBUMyBgHPHbBap314HQdgklJspwdNQleYIHGN20H
	TZDLD5lYSj2yM6ESYm3GcThini+htIaBAY+se5oNVnXxVmPmDZyRNbDzQAJYzNPgB4JK/U3MsadDr
	uVI7yvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZAR-0000000AaIO-1kpQ;
	Mon, 12 May 2025 19:50:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYqo-0000000AXPg-3LaC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 19:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747078210; x=1778614210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EAq9igK9ZsRG9y+KYZS6Syh/KUFHCf2/FcNcB//qTFw=;
  b=vSrPR2KOSZex4Hxb/iD5+eKTFcdSj47MfYuLoE7yonDgG+Ew9BW9ETTu
   gUX6f3YKNag4rBaWd4NyqWJltP7c9PIWi9TzwJwTNXsDR54tWOqFyl7NV
   xgBOjKQk1wAD5EnDF8iKOjgxd9NMh5/sM7mnerbRKRwv5FURaTG8EumiP
   bTUlzY/R2HMXRwPUA7UIZO6vAwXMf+uKT6mW7YRSSCwnfPPVI6bDGoIrK
   CkqDMumVzsFiDkPEePWvr7YLOXtdWweo3tRAKSRFAlGJlgINFllg3fzgV
   oOPxHxHFTx4rTxfL8GYRoAkvf+Dro+Ya401+adKiQ3bLNzQaiKdpp/pVc
   w==;
X-CSE-ConnectionGUID: lnPSkm7mSRKB1sBnpug5Qw==
X-CSE-MsgGUID: z8AX82L7SnK3k23+cBcxsw==
X-IronPort-AV: E=Sophos;i="6.15,283,1739862000"; 
   d="scan'208";a="41049771"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2025 12:30:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 12 May 2025 12:28:56 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 12 May 2025 12:28:56 -0700
From: <Ryan.Wanner@microchip.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<olivia@selenic.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH 1/9] dt-bindings: crypto: add sama7d65 in Atmel AES
Date: Mon, 12 May 2025 12:27:27 -0700
Message-ID: <a5509576e211bcf528e088f78e619575a26bbd8f.1747077616.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747077616.git.Ryan.Wanner@microchip.com>
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_123010_899379_87167BD0 
X-CRM114-Status: UNSURE (   9.18  )
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

Add DT bindings for SAMA7D65 SoC in atmel AES.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
index 7dc0748444fd..1de4ee70a05f 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
@@ -15,7 +15,9 @@ properties:
     oneOf:
       - const: atmel,at91sam9g46-aes
       - items:
-          - const: microchip,sam9x7-aes
+          - enum:
+            - microchip,sam9x7-aes
+            - microchip,sama7d65-aes
           - const: atmel,at91sam9g46-aes
 
   reg:
-- 
2.43.0


