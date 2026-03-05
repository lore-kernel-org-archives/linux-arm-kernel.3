Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1DAF47CC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 19:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7DN+KI20/nr4bGXo2TiFQ3uVPvfOMz0EViovKfREFA0=; b=qfjUnBZ9P/QK33rPvrMUMT1KJE
	EdsuepKNotVYzvNti3Te5g1Z4t3CxySFOBdHdWGRl/KQ3ADd2CKHKS9j1jblgXGLQjERujuyxLynE
	shpygAlv2FXt9iTp9YrM8R54674G8g72OI1StexXqJLz2fOBgrTZvNHuS+yXWXw9etcVpxo5qYDeJ
	1ToG6sPfSxYKq1Ov93XNS+hxCakxnY3ugAooyfzj4LWQV996V0CuZe9eL7e5dcRVcCtqvU0lzF/qi
	vMyl6wxlAHfY8APgQpVHszDKLdhPg1iG9WSGgHa2uj+ofAoWbWyLJU3mo6LxDKB34/xah7f0SUAI/
	9COI2RoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEqo-00000002UGe-2E7E;
	Thu, 05 Mar 2026 19:59:14 +0000
Received: from mx3.wp.pl ([212.77.101.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEql-00000002UFW-3QY5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 19:59:13 +0000
Received: (wp-smtpd smtp.wp.pl 16902 invoked from network); 5 Mar 2026 20:59:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1772740746; bh=7DN+KI20/nr4bGXo2TiFQ3uVPvfOMz0EViovKfREFA0=;
          h=From:To:Subject;
          b=X4JpREueQcxtL18zjrpZit6Yb5HoDpNhtqo0A7g9iGBBzW1V4lVSaPDh5+LxWd9mP
           9jUbXdePb99PQQlnWODuKhXQSFB1souwh42ov0GVy87Tdbr9Jlhl9AzRRuU5Ew5AIn
           enJRHoaSQly06lCAQ/FHuN6lYYHKSsT0cr7pBLCJJmrVcAZhhFnIlik1umBakRCDPd
           yvnbsrXtK7HEqQjr7Vu6i/STrxXjy0DK+qIxFIVo8SsY+xH8qBLSURafqsbXH4haQd
           hhmLFZUavgLYkTVvpzmnO1X0aTPAg8X4EG3orK/uhv3BAZwGgB1PnPLqH/0JhsZzwh
           mEJHI3IKcombA==
Received: from 83.24.116.171.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.116.171])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <ansuelsmth@gmail.com>; 5 Mar 2026 20:59:06 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: ansuelsmth@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lorenzo@kernel.org,
	olek2@wp.pl,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: crypto: eip93: add clock gate and reset line
Date: Thu,  5 Mar 2026 20:53:10 +0100
Message-ID: <20260305195903.59776-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: c7c3f264b6f210d9aa7875ffc4db7536
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [oWox]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_115912_318150_81033D7F 
X-CRM114-Status: UNSURE (   9.62  )
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

Add the clock gate and reset line, both of which are available
on the Airoha AN7581. Both properties are mandatory.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
v2:
- mandate clock and reset properties
- drop extra new lines in example
---
 .../crypto/inside-secure,safexcel-eip93.yaml        | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
index 997bf9717f9e..10caa989f660 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
@@ -48,20 +48,31 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - interrupts
+  - clocks
+  - resets
 
 additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/en7523-clk.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
 
     crypto@1e004000 {
       compatible = "airoha,en7581-eip93", "inside-secure,safexcel-eip93ies";
       reg = <0x1fb70000 0x1000>;
-
+      clocks = <&scuclk EN7523_CLK_CRYPTO>;
       interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+      resets = <&scuclk EN7581_CRYPTO_RST>;
     };
-- 
2.47.3


