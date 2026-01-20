Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B85D111B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyY4FMK1LscaLC9zpJmTzZ3DKssABxALVLPWwLcUGs8=; b=ncppV+GpOuuEgyeAexZrIyNT4n
	4DbYvXoc7/dZl+TmVRTZDHgdxQ78P351QDxb311w0XJ77RJQe5DPrGOhKfP7cE+gfyGsXAznnTsS3
	kL+GoVLDhTEGIskAkdtebOEHZ4/g5n6/viXLhyOWrhSV81qBhd49r01wbUtyb/RzlhTcDAMHEx1cW
	cYapS0smiHhDzsYdyxz6t4rXtoWCcsZ7gEeCdjlRRFs7NTwxc5hhiQFD55GB5GL3aZXnz3gAx1ZUN
	ZYyR4aezrKyRibYEvOR0rqpmPsnmDc91C2SrKUzKKfSwgwPuTRaGPBZAxgUT6b55gJUQHz8l6NPn/
	+jzSELXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDv1-0000000468g-2bAc;
	Tue, 20 Jan 2026 15:45:26 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDun-0000000464P-42Re
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 15:45:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2440148AD57;
	Tue, 20 Jan 2026 16:45:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768923908; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=fyY4FMK1LscaLC9zpJmTzZ3DKssABxALVLPWwLcUGs8=;
	b=syCO/+ki/dOSE0g8IPNFi2uH12pLWKK+Y/8L9L1OgOZ69dH639ik9x0WKzdnmfyCNXspJV
	z96LZD/MVyZbXG8/5OPUbPN3EgJr+9387NSKnjWUCV77yPer3NvBSh3lDJJSOcWze80odD
	7xV/zw1mHWH6jsKSpBRD+WRCkCUK3/yu1uRFTrKyUKWP0qHpid8gYH3rH0Ei3a4Vu4XzGG
	nu+73509emfxdS93Ubit0DEwPaKGBcDXWsz/NpLRxBegMgmq4gVcR1KCiV7G3l9QqC6Rkl
	pLWsNCrwErL26LdkrQJ6sJfPoBvvaCePJz5t0Im+cUf0q0W2eeblO4J3CS/Iwg==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 09/19] dt-bindings: nvmem: microchip-otpc: Add required clocks
Date: Tue, 20 Jan 2026 16:44:43 +0100
Message-ID: <20260120154502.1280938-3-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154502.1280938-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_074510_159314_2B23AA87 
X-CRM114-Status: GOOD (  12.48  )
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

The OTPC requires both the peripheral clock through PMC and the main RC
oscillator.  Seemed to work without explicitly enabling those clocks on
sama7g5 before, but did not on sam9x60.

Older datasheets were not clear and explicit about this, but recent are,
e.g. SAMA7G5 series datasheet (DS60001765B),
section 30.4.1 Power Management:

> The OTPC is clocked through the Power Management Controller (PMC).
> The user must power on the main RC oscillator and enable the
> peripheral clock of the OTPC prior to reading or writing the OTP
> memory.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - Removed clock-names (led to confusion, and not used by the driver anyways)
    - Removed redundant example
    
    v2:
    - new patch, not present in v1

 .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index 9a7aaf64eef32..847dfb67c6b72 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -29,6 +29,11 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: main rc oscillator
+      - description: otpc peripheral clock
+
 required:
   - compatible
   - reg
@@ -37,6 +42,8 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
     #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
 
     otpc: efuse@e8c00000 {
@@ -44,6 +51,7 @@ examples:
         reg = <0xe8c00000 0xec>;
         #address-cells = <1>;
         #size-cells = <1>;
+        clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
 
         temperature_calib: calib@1 {
             reg = <OTP_PKT(1) 76>;
-- 
2.47.3


