Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76252C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 22:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzhM/Cr/Vt/YQ+Zr0i1+zKtZFp4IFfQdz9T0ezUL7Xo=; b=vHTgtcgWdVNNZzXcZa5O3a4z/h
	YAkFuQvjRuQFC+q9gBBBJHZLb7j1PLHdf8vPvG7HRtQ/IqW8PdCRthKXsHg8M8msRJDUrFhR9QQFU
	FS0DwnOL4h0w4/C1qCY+FZif1tG2qHfF9rNgacasbe57jTU0wi+HM3IemopI+/e9LapUviTzT1fpx
	7/+VbR6+CHv4LaxkMQRX9yLT6j8kB1ygWt0e74IMMQnYHpsHnv1GmbrDXOvHhJXNiP6f9Fg9JeNaZ
	n+gS07vYWvVCC65tMNcM2m1GL4eL4dLksW6BbGu+z1QCrcZsSMaAQlHZ7ulg8Tol5UgkbxsQHarX3
	zeInNpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYoV-0000000GGSs-2IzJ;
	Thu, 16 Jan 2025 22:58:11 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYm2-0000000GFzO-3P1B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 22:55:40 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737068134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzhM/Cr/Vt/YQ+Zr0i1+zKtZFp4IFfQdz9T0ezUL7Xo=;
	b=G5ILOaLW37eG2x8g9HsqxICmTElAyMnTR2Jl+XD+EYxSkDF9IRY4XsRCMro0vtN8h4NkL7
	gvlxUfET2ipfpkFMv+0UZ4d+a58V2kHh2k+trC6Y0vz2T3ZNCiQJJFD0mk0+uFNoWELZ7i
	J+emAHK3hJNGhg5794Hs++Ny7F6Tk04=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: spi: zynqmp-qspi: Add reset
Date: Thu, 16 Jan 2025 17:55:17 -0500
Message-Id: <20250116225521.2688224-2-sean.anderson@linux.dev>
In-Reply-To: <20250116225521.2688224-1-sean.anderson@linux.dev>
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_145538_996786_567F560C 
X-CRM114-Status: UNSURE (   7.46  )
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

Add a reset to help recover from cancelled operations.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
index 04d4d3b4916d..901e15fcce2d 100644
--- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
@@ -36,12 +36,16 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - interrupts
   - clock-names
   - clocks
+  - resets
 
 unevaluatedProperties: false
 
@@ -66,6 +70,7 @@ allOf:
 examples:
   - |
     #include <dt-bindings/clock/xlnx-zynqmp-clk.h>
+    #include <dt-bindings/reset/xlnx-zynqmp-resets.h>
     soc {
       #address-cells = <2>;
       #size-cells = <2>;
@@ -76,6 +81,7 @@ examples:
         clock-names = "ref_clk", "pclk";
         interrupts = <0 15 4>;
         interrupt-parent = <&gic>;
+        resets = <&zynqmp_reset ZYNQMP_RESET_QSPI>;
         reg = <0x0 0xff0f0000 0x0 0x1000>,
               <0x0 0xc0000000 0x0 0x8000000>;
       };
-- 
2.35.1.1320.gc452695387.dirty


