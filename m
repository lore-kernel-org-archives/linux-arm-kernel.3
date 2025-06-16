Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC8FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYNxKYy9tzRuJkdjCisZbvAuwLPriCoPPBBF8f3Xfak=; b=RVGi64T6QdrJo3Af/uJ35NKoSj
	GF5wncvRQoyQXnfaQ18Ay1WvaNjxlo1+NJtuntaS58OYrjOniCx7hIBC+cL3DkRA1E5eQqqWZgbLP
	62DWkygGbIPmiZfm24UARCjuKj4zusgmdqmty/5aGlmPdwgQ6BUsv9gDmvO3Nua5q1J/iWIt2+9PZ
	3aB9VWSdzz9EsWvLrqJj4WHQuHxjEey6ErjlecfFDZGMbSE3vqvaACEcpd+qhZw5mVDtrU5mVZ/RD
	gj7s0xZVLThXaQ3c2pBwJj6VtEtzEXoUoasM8YGDvDyXCdfiOCeDkOEvx+RH9RzKw2wlzoer2dg30
	3VONfBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHyO-00000005epP-3xsp;
	Mon, 16 Jun 2025 22:06:36 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHtD-00000005e6T-2r0E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:01:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750111273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DYNxKYy9tzRuJkdjCisZbvAuwLPriCoPPBBF8f3Xfak=;
	b=F91ClS5fDbY1agTH3+ZLkRlkBQZ4vz/bewBbT8pDW2tFKLX+Y9kaJNWbl5+/LuIdyC1lUV
	lIk4woGYrtDdmMW0/XhZ4A4XlBJ+fXUd/N2Gw7nB+NjzKOqa2n4U36ldOOO1ZA3587NDOl
	lk32sZWaPPtxaE824aC68ydUaZkfA9M=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/9] dt-bindings: spi: zynqmp-qspi: Add example dual upper/lower bus
Date: Mon, 16 Jun 2025 18:00:47 -0400
Message-Id: <20250616220054.3968946-3-sean.anderson@linux.dev>
In-Reply-To: <20250616220054.3968946-1-sean.anderson@linux.dev>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_150115_883481_E9CB0980 
X-CRM114-Status: UNSURE (   9.11  )
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

Add an example of the spi-buses property showcasing how to have devices
on both the upper and lower buses.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- New

 .../bindings/spi/spi-zynqmp-qspi.yaml         | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
index 02cf1314367b..c6a57fbb9dcf 100644
--- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
@@ -69,7 +69,7 @@ examples:
       #address-cells = <2>;
       #size-cells = <2>;
 
-      qspi: spi@ff0f0000 {
+      qspi: spi-controller@ff0f0000 {
         compatible = "xlnx,zynqmp-qspi-1.0";
         clocks = <&zynqmp_clk 53>, <&zynqmp_clk 82>;
         clock-names = "ref_clk", "pclk";
@@ -77,5 +77,25 @@ examples:
         interrupt-parent = <&gic>;
         reg = <0x0 0xff0f0000 0x0 0x1000>,
               <0x0 0xc0000000 0x0 0x8000000>;
+        num-cs = <3>;
+        cs-gpios = <0>, <0>, <&gpio 5>;
+
+        flash@0 {
+          reg = <0>;
+          spi-buses = <0>;
+          compatible = "jedec,spi-nor";
+        };
+
+        flash@1 {
+          reg = <1>;
+          spi-buses = <1>;
+          compatible = "jedec,spi-nor";
+        };
+
+        flash@2 {
+          reg = <2>;
+          spi-buses = <0>;
+          compatible = "jedec,spi-nor";
+        };
       };
     };
-- 
2.35.1.1320.gc452695387.dirty


