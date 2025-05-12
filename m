Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFF7C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 19:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ug5tGCVVOU7hyPNPbMGj4o2z08hnLKs0N/mwrc+0L9U=; b=QeZkawUH3v2GCDMMk/ClaH9DiX
	p0bKXdGwgmO/QyDZy1qoOz9PqBFEFToqLmv5PpYJOTvOEXLG4eSpiZ0y/UM0S/wIbrSuAOEdZPoyq
	pl+cvK7yEn6jaMxluDOZISKFirYGVu0LSjXuvUlqLoTb7ZfuPxbaly0sC5IjJqZFrv1YgIx4W5aA8
	kpN98EWYWvzxz1aMkJ6bcTicZ3dSki0tgB7r38FpU05w3boScV9p3qgexOHnRKEcwX/GEosI1LbSz
	w+IbXCZ3itl3hgd4hCg9Wt44nhiUDv/+9AGz/QO9NXdUMZZXgwrBNB6D7KztPagrLmnrHtUNRAfhW
	VY0AsGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYwN-0000000AYDw-3UoM;
	Mon, 12 May 2025 19:35:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYqL-0000000AXJ3-114i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 19:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747078181; x=1778614181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uk6gMNlH4FiuwQmFLiKNXCHoWc0Q7toe1h2KyD5NpP8=;
  b=ecGnTf3sKoe1U17NKbx5p6AsXAfDWCya+oc8ls+gV52aF+UzeLCsb5Dt
   LsgRYaoLRsvudhXrtYViuKpOYFsh9sA8RKtpHzlNeVcHXBSGjc3oWqUya
   nxi2iU0sLxxlZDUCudI5Xxkq7hLujdDqF5C7GB/scnJeNthUjfcjGpo1U
   wyA3fXgI646nHipu258cFM4AuwpHEZc3UkoPvurbqcbDvpTyeSWTl7n2n
   uEoO5X5csypagIXwd1NCwGbSmaz6WmsiJCG/8Fnw4Ovt/k9ray2z5dhgp
   0GVldRGCiG/jKF3QLbrbM3UcFZSj9PNLXTJzblfOZpKgOUB/1bEzsW+lc
   A==;
X-CSE-ConnectionGUID: hYKpzzHaRPOvLPNNOvU8gw==
X-CSE-MsgGUID: lV4VSQu2TQ2dJND9A8h/Lg==
X-IronPort-AV: E=Sophos;i="6.15,283,1739862000"; 
   d="scan'208";a="209006609"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2025 12:29:37 -0700
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
Subject: [PATCH 3/9] dt-bindings: crypto: add sama7d65 in Atmel TDES
Date: Mon, 12 May 2025 12:27:29 -0700
Message-ID: <ea33a6222dda7c60fd404a4b0e9c4824e19ee1bf.1747077616.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747077616.git.Ryan.Wanner@microchip.com>
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_122941_343500_D2F95F88 
X-CRM114-Status: UNSURE (   9.05  )
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

Add DT bindings for SAMA7D65 SoC Atmel TDES.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
index 6a441f79efea..337f5cac0f59 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
@@ -15,7 +15,9 @@ properties:
     oneOf:
       - const: atmel,at91sam9g46-tdes
       - items:
-          - const: microchip,sam9x7-tdes
+          - enum:
+            - microchip,sam9x7-tdes
+            - microchip,sama7d65-tdes
           - const: atmel,at91sam9g46-tdes
 
   reg:
-- 
2.43.0


