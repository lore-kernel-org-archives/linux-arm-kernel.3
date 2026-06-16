Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4FFCD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 20:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ltlo+66CbkzQq4Lsr4cyfZ7a+2/NQVI4939KsTGc97E=; b=bq9lP5OcFAi1sNNDCfxqpnEugu
	3AFbKejicB7z+l7fkLJqx5TEWDwxav8Nnsc4VCQhYqpXvTosZaYAsSd8MookhWmJYxAQbpVhHQD3J
	HErOQgmerXyW8Mh2pSHWRo8WfhEmLHH8Xw9McSozuymnbpSljG3Vfr8MYHTLViYqGiUf/B2llGj4t
	ffNZs9jIfZiwq2K5OOXKApOVQxhkxf7G81s4D9dD9fgsKGl8XBLdFUz8OT5/GoDpM7/7LEgIDSd1B
	l4E8EJsVcyuozbR+US6AgoYAJEsxZSmjMvsb99LT5qjsoN3IDkQ8LLO8Hc3xz9pCV/IDFo8mF9Hu3
	EZo6//hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaNq-0000000GIPs-2WUT;
	Tue, 16 Jun 2026 20:27:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaNl-0000000GIJR-32XH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 20:27:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so35178935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 13:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641656; x=1782246456; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ltlo+66CbkzQq4Lsr4cyfZ7a+2/NQVI4939KsTGc97E=;
        b=mdBzGbdnU8vZshnGavb7092u6Qp9jYj6Sjt7jBRmedViaSZXUi4NpbQuXPcwp0GPPw
         OMtk9CKyO6DvvqGfqbA9/D4ol+YS3f3g0b8gaZNc3aMkk/NRhcqE3/kcFJPTqb4QAkIl
         3uRFT+8CodLGg5rfI3YfWBziwQsv+5A4dYMImHR3hZzXrRygD0ASsqoaAmqDOG53VtfM
         exAbmSgT96Ojkl7yxM38v1SrVQIxlFFUuWCm3/Sqotr4sxbJcji639mYcVko9bo88fC1
         IH5NwcDMg7JH1rOUglzv48WTudCrPzTdCww06MKD9haYhy5/7gO/n1jtyChQY9ysdudW
         /L6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641656; x=1782246456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ltlo+66CbkzQq4Lsr4cyfZ7a+2/NQVI4939KsTGc97E=;
        b=ccdcAVvjqb99THq/pQxtbGfajsG3BQ0fRwF8KGvIOzdpPwx6OvB6apRHJVT2RIKQN1
         tigP97Drom6uaIRTHIWmKJiihWUerDhzfey+KWDhxQLhk5b8Czor4DMiu3+3xvZ5ROjP
         ibuHMLFpRpi9Fq7oSIIp99C1CT8O7sC6dS/9LfGFzlzZSWlKwRCDNhwUI+s2ow05C+U+
         eMvqGqxHS68MNrHjMS5aP/MUPVwb9eCtJWvzuzNeZPd7GgPgHSw48gwDFE+ZCxGIbP6j
         GAVqss9w7nSftSdjYLpKX4IE7ovecVt8K8D4qHlrzrClAqI8ebBLJV12wtOle+8ZBu58
         kK9w==
X-Forwarded-Encrypted: i=1; AFNElJ+24e7f4pePY6lFM6WcNuuIKDQbeBiH0fBHADoBr/t8E+gdQNTqRMMR1zyoSfD6vHJ/YCh0ZDU+UfY/0LErlbPC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4GzLJyfU45rbKh45z8Xrhuo1mVpdupPC0yz0AmwmC4mqd/k+7
	G5GZQmLQykkQXvcndqoS0byV90qQ5KzppjObMZci9ISlvFjdS2EMFjMF
X-Gm-Gg: Acq92OGBFhvB+MGaoUa/gWFjDGfMvZSlK5zbFEnX3X161cPKEvP90lZ9TKTMgXQbJ1V
	+8n8NEkKDiqHGsQay+qeuKfTE5SFeWjRVUs5YvC3xSJe9NJIZ68KC8jfMpGspX+k3n6WCNwBm/b
	NkUmvKdXCCP9MrZ+Wx557prsE1aBMNpuXSvgdtmro773kLjRuqKcNzXaZ6jokGWYyO0/9urL7+n
	HL/tZcW6QdjtrcAP8v2wZqS2JrPNrq6LpgEWf3n5kMVy9O3SHu6t9XjauPtN2qagTisLqDnRKE0
	/nFhferAn4+tibM9D0gc1zlyodWdNVJnz5vrgghyDSPv3Pi651jjBcwYBwBHYKokMPqB/lNGpNC
	lgMZG4e9FkYeyQgxCR+kS36FksPPxEwqxcffXWxiYPg7UdfmJw0bS9T7DP0ZN6HzQXqsh6i0Scn
	3WLavbAfGVyC6mhc631TsqXCYEZtb9RAsDkQ==
X-Received: by 2002:a05:600c:a104:b0:492:3347:12a9 with SMTP id 5b1f17b1804b1-492334712camr12197255e9.26.1781641655477;
        Tue, 16 Jun 2026 13:27:35 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:27:34 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:31 +0300
Subject: [PATCH RFC v4 11/12] ARM: dts: zte: Declare zx297520v3 clock
 device nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-11-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
In-Reply-To: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5713;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=WCM0t2tSpKbIjViogFh06SwJ0ZwBBkr30bJ7ePaJsf4=;
 b=kA0DAAgBPRO8yFRPGiIByyZiAGoxsYaiDmVa7tF78rIc/+Vl7tgrhQY8mQM5Yh4KGvxwiGHNr
 IkCTwQAAQgAORYhBEMW9LaqBVsnlTJdbD0TvMhUTxoiBQJqMbGGGxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjEyLDIsMgAKCRA9E7zIVE8aIpRhEACvKmqnDur7+8kPrK12EWu35XXeLXUinVJ0g/4I8QB
 ZqBj02ZtosMPs4FkVtdx2+9/iGDrf9cBcLN+YkzllQ+jP68E7Ps8GILZx0GqWZlMv9CeFz2DPZV
 AnwkfeuL4/9GF6rQXDdkaKa4bp7IFgnzkjvdgGzn4/TLoDQO0/YctobzHJZzAbOWra2gmdXqDuT
 G+RaSViXHnZZMjxB/UfBut8O/3w2IYUSnU7dnXCnAGJRMxoljKzDNXLSqzptpnvdQz5phTA3pTX
 nvk6Z5gDGgW0i1uCm+rwmBCUuZJWiFJ//A+Y1EcILgxaCsyP63gaxo/EMRKl+UEcLnxXMzB0vaz
 pWGDB+rOZwj1HBzc3khtcL68RO4CUHvAKlfmljai3o+B/RYrKRw9gu/TGyKkepDS2+xi5OzbDCp
 GCql6zX8Ig0DxNiU9RQ92P9Z5vcU1m/w2pq/UXy9xPUKluH50vKAQiXSTq/E8OnDMdTzJ9t1zKJ
 TapBwT+kd/UC/Ycv+38ci/h5lzKA/KkVkieL/1HR9pYokYpe/9sYTH0OEPmKoKD6rlegWD+s5dN
 wt104eqgKg3dZbwmXZ+cwxVO4W+Q5qeG7CkTrE+jOJ+1JTiwbapHBqL2SUyy/EAOoqW6HBVDKZM
 Cf4s78AXtxPhTrBhXYqLgUqvYTcSXtutnCoEMVmWDrg==
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_132737_840466_34398FA1 
X-CRM114-Status: GOOD (  13.65  )
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

This makes use of the driver added in the previous patches. It wires up
the uart clocks and resets and allows getting rid of the placeholder
uartclk node.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 90 +++++++++++++++++++++++++++++++----
 1 file changed, 81 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..a2b6909e7434 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
 
 / {
 	#address-cells = <1>;
@@ -20,13 +21,16 @@ cpu@0 {
 		};
 	};
 
-	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
-	 * been added.
-	 */
-	uartclk: uartclk-26000000 {
-		#clock-cells = <0>;
+	osc26m: osc26m {
 		compatible = "fixed-clock";
 		clock-frequency = <26000000>;
+		#clock-cells = <0>;
+	};
+
+	osc32k: osc32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	timer {
@@ -70,13 +74,80 @@ gic: interrupt-controller@f2000000 {
 			      <0xf2040000 0x20000>;
 		};
 
+		topclk: clock-controller@13b000 {
+			compatible = "zte,zx297520v3-topclk", "syscon";
+			reg = <0x0013b000 0x400>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>;
+			clock-names = "osc26m", "osc32k";
+		};
+
+		matrixclk: clock-controller@1306000 {
+			compatible = "zte,zx297520v3-matrixclk", "syscon";
+			reg = <0x01306000 0x400>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>,
+				 <&topclk ZX297520V3_MPLL>, <&topclk ZX297520V3_MPLL_D2>,
+				 <&topclk ZX297520V3_MPLL_D3>, <&topclk ZX297520V3_MPLL_D4>,
+				 <&topclk ZX297520V3_MPLL_D5>, <&topclk ZX297520V3_MPLL_D6>,
+				 <&topclk ZX297520V3_MPLL_D8>, <&topclk ZX297520V3_MPLL_D12>,
+				 <&topclk ZX297520V3_MPLL_D16>, <&topclk ZX297520V3_MPLL_D26>,
+				 <&topclk ZX297520V3_UPLL>, <&topclk ZX297520V3_UPLL_D2>,
+				 <&topclk ZX297520V3_UPLL_D3>, <&topclk ZX297520V3_UPLL_D4>,
+				 <&topclk ZX297520V3_UPLL_D5>, <&topclk ZX297520V3_UPLL_D6>,
+				 <&topclk ZX297520V3_UPLL_D8>, <&topclk ZX297520V3_UPLL_D12>,
+				 <&topclk ZX297520V3_UPLL_D16>,
+				 <&topclk ZX297520V3_DPLL>, <&topclk ZX297520V3_DPLL_D2>,
+				 <&topclk ZX297520V3_DPLL_D3>, <&topclk ZX297520V3_DPLL_D4>,
+				 <&topclk ZX297520V3_DPLL_D5>, <&topclk ZX297520V3_DPLL_D6>,
+				 <&topclk ZX297520V3_DPLL_D8>, <&topclk ZX297520V3_DPLL_D12>,
+				 <&topclk ZX297520V3_DPLL_D16>,
+				 <&topclk ZX297520V3_GPLL>, <&topclk ZX297520V3_GPLL_D2>,
+				 <&topclk ZX297520V3_GPLL_D3>, <&topclk ZX297520V3_GPLL_D4>,
+				 <&topclk ZX297520V3_GPLL_D5>, <&topclk ZX297520V3_GPLL_D6>,
+				 <&topclk ZX297520V3_GPLL_D8>, <&topclk ZX297520V3_GPLL_D12>,
+				 <&topclk ZX297520V3_GPLL_D16>;
+			clock-names = "osc26m", "osc32k", "mpll", "mpll_d2", "mpll_d3", "mpll_d4",
+				      "mpll_d5", "mpll_d6", "mpll_d8", "mpll_d12", "mpll_d16",
+				      "mpll_d26", "upll", "upll_d2", "upll_d3", "upll_d4",
+				      "upll_d5", "upll_d6", "upll_d8", "upll_d12", "upll_d16",
+				      "dpll", "dpll_d2", "dpll_d3", "dpll_d4", "dpll_d5", "dpll_d6",
+				      "dpll_d8", "dpll_d12", "dpll_d16", "gpll", "gpll_d2",
+				      "gpll_d3", "gpll_d4", "gpll_d5", "gpll_d6", "gpll_d8",
+				      "gpll_d12", "gpll_d16";
+		};
+
+		lspclk: clock-controller@1400000 {
+			compatible = "zte,zx297520v3-lspclk";
+			reg = <0x01400000 0x100>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+
+			clocks = <&matrixclk ZX297520V3_LSP_MPLL_D5_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_MPLL_D4_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_MPLL_D6_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_MPLL_D8_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_MPLL_D12_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_OSC26M_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_OSC32K_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_PCLK>,
+				 <&matrixclk ZX297520V3_LSP_TDM_WCLK>,
+				 <&matrixclk ZX297520V3_LSP_DPLL_D4_WCLK>;
+			clock-names = "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
+				      "osc26m", "osc32k", "pclk", "tdm_wclk", "dpll_d4";
+		};
+
+
 		uart0: serial@131000 {
 			compatible = "arm,pl011", "arm,primecell";
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x00131000 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&topclk ZX297520V3_UART0_WCLK>, <&topclk ZX297520V3_UART0_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&topclk ZX297520V3_UART0_RESET>;
 			status = "disabled";
 		};
 
@@ -85,8 +156,9 @@ uart1: serial@1408000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspclk ZX297520V3_UART1_WCLK>, <&lspclk ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspclk ZX297520V3_UART1_RESET>;
 			status = "disabled";
 		};
 
@@ -94,9 +166,9 @@ uart2: serial@140d000 {
 			compatible = "arm,pl011", "arm,primecell";
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x0140d000 0x1000>;
-			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspclk ZX297520V3_UART2_WCLK>, <&lspclk ZX297520V3_UART2_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspclk ZX297520V3_UART2_RESET>;
 			status = "disabled";
 		};
 	};

-- 
2.53.0


