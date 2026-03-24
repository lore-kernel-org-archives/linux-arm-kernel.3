Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9A7E9A74D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gb+3Jow3GAqKqQOMGmcxIHKlMXCv3k5PivcGruWwYOM=; b=GjiyO7U6OSFWFJJpjedX++Rzub
	ly5NijnND5WqBbBwLljEzihSu4UmS9sLNGXV/Ooj0FSTX9tlRibuYjNAb0pP8KLhRLAsxIqPlqcPB
	JtZQgl612+avqBkYU4C7UsUAPEORdarvFbLw+kK/z4VSouECJ6jE5S55B9QKapreBoQIecVafz785
	TqDsKJJKYRLTWF0bqP3yrMQipLBL9EmG9AJvlmWTtszwFyqONKul4GWRopyWTdxz9TCz8tiOxra/j
	xB8iKb8REfLMAFN1WqIkk1owWdKq1vffheLQTMeOInpZVJCThly+ZlhxFZJ1mGuhJ7wK56XttH6/Z
	C2XwsuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCZ-000000016a6-1whQ;
	Tue, 24 Mar 2026 09:37:31 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCL-000000016U1-2RhY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:37:19 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id ACDEF275B5;
	Tue, 24 Mar 2026 10:37:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774345032;
	bh=gb+3Jow3GAqKqQOMGmcxIHKlMXCv3k5PivcGruWwYOM=; h=From:To:Subject;
	b=t2sF9pRDTyosbkfc2DGZcGDlewRrW3K1bj1bxDPSzyCie+OrxJ5Pif1+TTLp7w48+
	 4qdMEWHagP+h/VcB4BptIDyRU0I/sEd3N6nl5vyoreT9NXRPeSwJJg3KhzJmMOfYpF
	 Avkhr3RR5IZ9esgvaqgZHSkfoEJ740q5qChzaV+tvEYlofLLRt2YgFYNXISnsq+zkh
	 eLmE1t0Gy/uILVaHkIfKMF6bZDS0/NSbyl0jGGksS96ok7OLMwJDOWyLtO9lYKYBVm
	 iIZUPeHk9r+Qga0HEPFPC517OkqAqxVftqmUIPubCpht6XzMB6DdmA48u1WBmxXefB
	 x4XLlN/9RM+ZA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/7] arm64: dts: ti: k3-am62-verdin: Split UART_2 pinctrl group
Date: Tue, 24 Mar 2026 10:36:58 +0100
Message-ID: <20260324093705.26730-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324093705.26730-1-francesco@dolcini.it>
References: <20260324093705.26730-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_023717_782704_A64F0A67 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Some carrier board reuse the UART_2 control signals as GPIO, split
the pinctrl RTC/CTS in separated nodes to maximize flexibility.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index 219b729d3caa..735c43c67fc7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -820,15 +820,27 @@ AM62X_MCU_IOPAD(0x0084, PIN_OUTPUT, 0) /* (A12) WKUP_CLKOUT0 */ /* SODIMM 91 */
 		>;
 	};
 
-	/* Verdin UART_2 */
+	/* Verdin UART_2 RX/TX */
 	pinctrl_wkup_uart0: wkup-uart0-default-pins {
 		pinctrl-single,pins = <
-			AM62X_MCU_IOPAD(0x002c, PIN_INPUT_PULLUP, 0) /* (C6) WKUP_UART0_CTSn */ /* SODIMM 143 */
-			AM62X_MCU_IOPAD(0x0030, PIN_OUTPUT,       0) /* (A4) WKUP_UART0_RTSn */ /* SODIMM 141 */
 			AM62X_MCU_IOPAD(0x0024, PIN_INPUT_PULLUP, 0) /* (B4) WKUP_UART0_RXD  */ /* SODIMM 137 */
 			AM62X_MCU_IOPAD(0x0028, PIN_OUTPUT,       0) /* (C5) WKUP_UART0_TXD  */ /* SODIMM 139 */
 		>;
 	};
+
+	/* Verdin UART_2 CTS */
+	pinctrl_wkup_uart0_cts: wkup-uart0-cts-default-pins {
+		pinctrl-single,pins = <
+			AM62X_MCU_IOPAD(0x002c, PIN_INPUT_PULLUP, 0) /* (C6) WKUP_UART0_CTSn */ /* SODIMM 143 */
+		>;
+	};
+
+	/* Verdin UART_2 RTS */
+	pinctrl_wkup_uart0_rts: wkup-uart0-rts-default-pins {
+		pinctrl-single,pins = <
+			AM62X_MCU_IOPAD(0x0030, PIN_OUTPUT,       0) /* (A4) WKUP_UART0_RTSn */ /* SODIMM 141 */
+		>;
+	};
 };
 
 /* VERDIN I2S_1_MCLK */
@@ -1502,7 +1514,7 @@ &usb1 {
 /* Verdin UART_2 */
 &wkup_uart0 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_wkup_uart0>;
+	pinctrl-0 = <&pinctrl_wkup_uart0>, <&pinctrl_wkup_uart0_cts>, <&pinctrl_wkup_uart0_rts>;
 	status = "disabled";
 };
 
-- 
2.47.3


