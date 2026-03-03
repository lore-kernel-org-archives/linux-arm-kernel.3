Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EE2EDEBED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 19:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V/WjAJijWZg2nQnR0Dw6GKJGN7hld0EpcPy+hJO8Aew=; b=nmKT7DUfcYYtk5HR5v8mjZeRw+
	zr/+eQ/ND//uhoApr1pfmpYenQzqPGDK61NrC2Deo9txveFGfqQAYD7QUFU/LguiFnj7scxyDZD17
	TctBJxkmnFdkvcJ5zYX9/lcYlF1KgOgPaBsGmuXDGic0bDFO71DSJi0ibS1wW80Rikt8ppBsl6CKm
	qRUfH5H+ZYj3gyhzW+rrGofZ5Iq1DyID3e5sIISu4vpXcw/OSVEp0KRATt5ZaPmEoOG7pCC+/78AQ
	+7KwGlpwON41akBewyn1aGgpuIMl+U2U+Sb1/XJXAZyztA/ATQYnYwF8zJpGWyohrQtoB+pCFbpao
	MdbnPBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVac-0000000Fp47-04K0;
	Tue, 03 Mar 2026 19:39:30 +0000
Received: from mx3.wp.pl ([212.77.101.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVaZ-0000000Fp1a-29Kj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 19:39:29 +0000
Received: (wp-smtpd smtp.wp.pl 25368 invoked from network); 3 Mar 2026 20:39:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1772566765; bh=V/WjAJijWZg2nQnR0Dw6GKJGN7hld0EpcPy+hJO8Aew=;
          h=From:To:Subject;
          b=cCbwc53bfA0nWMP4mTTDmQjVclbq/fKeM2VkCXwVjVgMXVSDM3Siu/ZCVv61wNwLp
           IED2or1NJMjdaTJhiCjeJ0r7PbNadT0IUfrMK5YJoP3J+IHeWWI4BRXotnH30sRRFq
           Y7EM69d14LjklIRi3tjR8EbuK+i0Mc9I0RCyJSH/gf5WHDwl82PwP3/XT46mkMghmu
           4sre4mP/K3gzTZxcbrLxv03TrU4dQP2JPIksbJID5EPTf/6o5Dng4ObuB9zgKbl0F+
           C6Ya+ifdF78ZIKi1jLlLM9XPOABg/SeaS56CPXpedOylWVV2SGcONX279dKKjw+qYG
           rLTkNwRAxqXyg==
Received: from 83.24.116.171.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.116.171])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <ansuelsmth@gmail.com>; 3 Mar 2026 20:39:25 +0100
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
Subject: [PATCH 1/2] dt-bindings: crypto: eip93: add clock gate and reset line
Date: Tue,  3 Mar 2026 20:39:17 +0100
Message-ID: <20260303193923.85242-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: bc4a4ec882821cb528a87e98cbf1d0e6
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [0epB]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_113928_201491_51D91457 
X-CRM114-Status: UNSURE (   7.43  )
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
on the Airoha AN7581. Both properties are optional.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../crypto/inside-secure,safexcel-eip93.yaml         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
index 997bf9717f9e..058454b679b4 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
@@ -48,6 +48,12 @@ properties:
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
@@ -57,11 +63,17 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/en7523-clk.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
 
     crypto@1e004000 {
       compatible = "airoha,en7581-eip93", "inside-secure,safexcel-eip93ies";
       reg = <0x1fb70000 0x1000>;
 
+      clocks = <&scuclk EN7523_CLK_CRYPTO>;
+
       interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+
+      resets = <&scuclk EN7581_CRYPTO_RST>;
     };
-- 
2.47.3


