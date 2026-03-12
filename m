Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D8D105A589
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 11:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7IFS+Nq88jf8GKKNBe7mAAapyjw4fDD+dL+TVSwaL0=; b=e+Bl9zSgyd3WJdhplb1Qk6LLDz
	9HgujDKlE06ahxl70+7W1BsrvUnlkz1iR+PW0uwwxVGDglw0n4xiuj/XjL7GxTOWofFyfzKUV11sZ
	b3UMaEFZT13ll3E58Km1te6qMW9YPb+10DZsqwT5Rucxk9WJoZUnhKyyTst/JqJMsGw8DrvfzpZHM
	AAUCTcyAPNMzvoT0C5wTNymqOJ7Rfsx54X8D0dBj9i30A0Rah9vzoI2y8ZqLNG4ut9T+yJc4zV+GM
	OnvhvzTsPTD95Imqd5u65e/AvyWKmOhghsSDlNwJjAD1ajPxchmQvbJ4eyelxg5eDKeKXmPFTY2LX
	dgbRP1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eIG-0000000Dx84-1opO;
	Thu, 12 Mar 2026 11:33:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eIE-0000000Dx6H-1kO2;
	Thu, 12 Mar 2026 11:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=J7IFS+Nq88jf8GKKNBe7mAAapyjw4fDD+dL+TVSwaL0=; b=XdYuc07T9WWaLtMuS7lDKXXfrl
	elf5PxVdO1WJkeTR8hWHOi6mOfcdPmjMWtwd3t3jaBmsv35jyHQO80wQOZslAvoYAnHTDsrBCA9//
	roueW4EgOqLXeyMl9zCNRbR3XEpP5DCPzAndy7z2I2xL5UWdIpcV1Exc+UAq7tBFh29Bfj5KQUBkU
	GWS6+Bq0QOxAwlMH8MaIHVG4insROxtmwweLaPpS34q5K874k4o1VM/QLgLK3UfBD8VOQmE68aio6
	e+pUzQZ+sEIGdal+EsBCT3h9Dka08720hkuw9H1YPV/tOR1vBsOpGwtEJCkKy2qNEkw1XYuCMpZcv
	9lJmHV8Q==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eI9-000000011UH-3M4a;
	Thu, 12 Mar 2026 11:33:28 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62CBUevxE2456770, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773315041; bh=J7IFS+Nq88jf8GKKNBe7mAAapyjw4fDD+dL+TVSwaL0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=VSzbmUkm0aF8/l06bUGmL+bA5BzD1OzXoo+8necBJrjxEVvMYJdDgDeOn1x/tc1Oy
	 +H4PGxCa/fjz43KEPkOHsX8IxDllYPrm478hPoWf8l9rs9WO/RF2OeNzeJJeDPz7y4
	 sYKvqEAmyBCtIcrAihNc8DwNBTCtyoF53mSF6G1VnS6RFeNtxqg3IJGaKoIwbwWC/v
	 pArqJFHrFuRs7iFBMyXJmxpYgbi1RRG3a1nv4Brnu/jmI0obCs5S5pMv2gcH7KjCOl
	 AeVA0M9g6vzlnaePtDMI5I4vuRh5woA8HNVePSCfj+x99MaZoxnJ3JrP0F1SAOMjDh
	 FIvwS3EumkORA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62CBUevxE2456770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 19:30:40 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 12 Mar 2026 19:30:40 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 12 Mar 2026 19:30:40 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v3 1/7] dt-bindings: pincfg-node: Add input-voltage-microvolt property
Date: Thu, 12 Mar 2026 19:30:34 +0800
Message-ID: <20260312113040.68189-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260312113040.68189-1-eleanor.lin@realtek.com>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_113326_897778_B64CE941 
X-CRM114-Status: GOOD (  11.17  )
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

From: Tzuyi Chang <tychang@realtek.com>

Add a generic pin configuration property "input-voltage-microvolt" to
support hardware designs where the input logic threshold is decoupled
from the power supply voltage.

This property allows the pinctrl driver to configure the correct internal
reference voltage for pins that need to accept input signals at a different
voltage level than their power supply. For example, a pin powered by 3.3V
may need to accept 1.8V logic signals.

This defines the reference for VIH (Input High Voltage) and VIL (Input Low
Voltage) thresholds, enabling proper signal detection across different
voltage domains.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v3:
- Rebased onto the devel branch of the pinctrl tree.
- Improved commit message and description.
---
 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index fe936ab09104..fd49a0d53bf0 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -162,6 +162,11 @@ properties:
       this affects the expected delay in ps before latching a value to
       an output pin.
 
+  input-voltage-microvolt:
+    description: Specifies the input voltage level of the pin in microvolts.
+      This defines the reference for  VIH (Input High Voltage) and VIL
+      (Input Low Voltage) thresholds for proper signal detection.
+
 allOf:
   - if:
       required:
-- 
2.34.1


