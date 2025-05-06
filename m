Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5D0C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TalyY7f0z8WFpKTCKpbbWsIQgKcxq7l3XWcN5VvgXPM=; b=mv3XYiroOSr8cS1L0DnMr9lFr4
	j5odRINVnzxvR3NZ9Y3eF/VRl9Hl1GCU+43qLC/B6mI3SnYLsBfxwOTQdcVKQ1GFPmWXIp76bQVvP
	GnOrXz/1jkcO3yq9jcacABzQvfuep2dTNkV4SyWHm9alROZT5AEm0YdQvEeH3BYK+DLCQfDdJdKz5
	ED8BOwXtkWTilUvnMTcEv0nKGtocm2pid9pml46FNnf5pQG15eT2KNwtXKCg5cTMgUsbK5hkwxr15
	CFJLZ4W3RtxtBQNZAoB0k/et/VLAkLAQqdD66fGtViMRlJqNSPrUjy/INHFDR0/tFIp8qM6UUBBOX
	81OvNfTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGGq-0000000BhHu-3301;
	Tue, 06 May 2025 11:15:32 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEgC-0000000BOSS-0o5c;
	Tue, 06 May 2025 09:33:39 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4768f90bf36so60556521cf.0;
        Tue, 06 May 2025 02:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746524015; x=1747128815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TalyY7f0z8WFpKTCKpbbWsIQgKcxq7l3XWcN5VvgXPM=;
        b=M1FqVlhoAUdxUtcQALBEV3WnlDQyUoC1iCkHOmDC0sYm3k62c1Rs48T7CNIhk5/nN/
         y9hLUKPaiAYg3xn3GL6VneHJbYbj3dhm0/iu7kERHC0hG3y0foRS4U3F/w5FehG7By2E
         5SotRXsBEtbrjL5OzOehJAI3swPKriTeuPZzkf7izLAmUtp+nF6rF3JwaeHpbXiGQQgw
         +QRV9LsCUpSnpIb8MY3uBTUwRcPgUlbWPLFYa+CtHMCJXpz299uWZok2FdehSqHZTJw+
         UHvpWBIwdb06IPp6jDqNLyZEicIi7UZ5LQ+CVkdfpWesg4YAgwscF0a4SmD/N1uZyO8U
         Cvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746524015; x=1747128815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TalyY7f0z8WFpKTCKpbbWsIQgKcxq7l3XWcN5VvgXPM=;
        b=NiW7+62xv/Wh0PqekMyuCDVwsC3vlj2wp17/1NljxYOGkFnMXlHkpgH8tdjuC3PqWk
         DTsKw7HKU7wPfQqWdQK5MECHWKVsSe9RwRToVB5hSj44htShkYBNx6kRnFTGLT7n4DpW
         Jaz9An3n9J6/2Oe3B3GHv98mSOYb+ThuXSE80tB4NgvVGt+TqpCvkK8qxOL3EzRpZ002
         EzOHUgr/1k5hf7AAo1nQ0bF+AG0zNTBQPPiwgxHFvOdJEbSc5ngl6jY8XOqwO4gedDXt
         t5iuDXGEbpfN+WJDVf2RbwVWB02B6zhXsoUjYm26A/AG0mXGiPWtsKtii+TH3S2pgJ4z
         KJxg==
X-Forwarded-Encrypted: i=1; AJvYcCW3sersy910vpCdc9/NL4WtbF/uFxzgIwtbWmiXk1OUDaLSaY5Q2ykdYpSU/4knGlXIjiBoQ73/+3cpRNY=@lists.infradead.org, AJvYcCXL5s52oCp8gPPvrwu+J8ciH1+1tBwCjGRP02Bhss5udXqUtUvNx3QaMSzXvo9Bqbk6ihhZwxOhjI6DDUEw2V16@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk7UfM/q02H0mnRMHYtSqYGU26WB/AQoiKGAMpKVMcCPLdGLas
	POffXzU4Qd5/QINY6Hggxgq2xPdDSgbFgZIFtnDOAvUlaieBZWh8
X-Gm-Gg: ASbGnct9K9zPDIeYHisYFTZpOUiVuUDPCOzsFE2Mdg0MMqoMDBo0A2D1Wy3/QXa0d+l
	wxPB/+mo4ziIAn8VoK2HRFa5EPJ7mBn30sxtFlwruz1UHW7BZZ8cROTePkrns43Q0vsI8KgB0DR
	dIZgtw0oI59cgY4/uyf64wR0Z1mgtQh0ZkbqMRQc6xMJYU2v8htqMrlhJexkhKGfx/6m8SlC58v
	kJbss4j5SUx7bm4hT8QWt9yaZ3eMnTCAEp2S2lAx4oWiE57kpgoce9iBuAXPcop2dgX6cbQ8Qyd
	+V1jexJZwqhXKJjY
X-Google-Smtp-Source: AGHT+IEXTIp4yFfB4Q9w6fbdseD2o1pqfO5Hhy0H0j3RnKD3vdKl89OZk1qQra91sAFPJlTcnfVM6w==
X-Received: by 2002:a05:622a:288:b0:476:8eb5:1669 with SMTP id d75a77b69052e-490f2d813f1mr47198331cf.32.1746524014995;
        Tue, 06 May 2025 02:33:34 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-48b98721c43sm69901391cf.63.2025.05.06.02.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:33:34 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH net-next 4/4] riscv: dts: sophgo: add ethernet GMAC device for sg2042
Date: Tue,  6 May 2025 17:32:54 +0800
Message-ID: <20250506093256.1107770-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506093256.1107770-1-inochiama@gmail.com>
References: <20250506093256.1107770-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_023336_227263_9FE722ED 
X-CRM114-Status: UNSURE (   9.95  )
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

Add ethernet GMAC device node for the sg2042.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 62 ++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index f61de4788475..886c13cef6ba 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -543,6 +543,68 @@ uart0: serial@7040000000 {
 			status = "disabled";
 		};
 
+		gmac0: ethernet@7040026000 {
+			compatible = "sophgo,sg2042-dwmac", "snps,dwmac-5.00a";
+			reg = <0x70 0x40026000 0x0 0x4000>;
+			clocks = <&clkgen GATE_CLK_AXI_ETH0>,
+				 <&clkgen GATE_CLK_PTP_REF_I_ETH0>,
+				 <&clkgen GATE_CLK_TX_ETH0>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			dma-noncoherent;
+			interrupt-parent = <&intc>;
+			interrupts = <132 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			resets = <&rstgen RST_ETH0>;
+			reset-names = "stmmaceth";
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <1>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <32>;
+			snps,rxpbl = <32>;
+			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+			snps,axi-config = <&gmac0_stmmac_axi_setup>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac0_mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <8>;
+				snps,rx-sched-wsp;
+				queue0 {};
+				queue1 {};
+				queue2 {};
+				queue3 {};
+				queue4 {};
+				queue5 {};
+				queue6 {};
+				queue7 {};
+			};
+
+			gmac0_mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <8>;
+				queue0 {};
+				queue1 {};
+				queue2 {};
+				queue3 {};
+				queue4 {};
+				queue5 {};
+				queue6 {};
+				queue7 {};
+			};
+
+			gmac0_stmmac_axi_setup: stmmac-axi-config {
+				snps,blen = <16 8 4 0 0 0 0>;
+				snps,wr_osr_lmt = <1>;
+				snps,rd_osr_lmt = <2>;
+			};
+		};
+
 		emmc: mmc@704002a000 {
 			compatible = "sophgo,sg2042-dwcmshc";
 			reg = <0x70 0x4002a000 0x0 0x1000>;
-- 
2.49.0


