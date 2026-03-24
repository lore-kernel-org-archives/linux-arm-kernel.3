Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65934E9A743
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ziNRxF6wJwQ72ndkJaxRGJmIPHBGp++CSki9vPy5xpk=; b=kvfbZ7w8cy5D9IYuvn/aKUebah
	iLS24zqYAEDUSNgonMXEp8V8ZRKyX9Y76FbVx/qt4xl2p+hSh5loiNhJhdS9v4GZGFUFid6a0rgL6
	mgeM5ZTq5Xb+nXyfac7Ln5Vcox9DXHOM+qQoo8wYLFhJl2poT29lOd5haY55VZ5MR1Vwewjp+rbJM
	tGglJJksAeCTMjTysDhwQxS2CY5k2g/wBAzLn2OFBpTDGDXZXxZotnMWto9UKnxNe/+6f8RaY7ZAe
	4uGmQ2Q6vkJKPgldUZUFgF3faxbLk9tFJWAFDdW8T6oX5hA++5TWpAeL/bj+u5GsF5QeM6DO0zU5f
	yq0llILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCa-000000016bR-1XrX;
	Tue, 24 Mar 2026 09:37:32 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCO-000000016VV-0sWB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:37:21 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id D354B275C0;
	Tue, 24 Mar 2026 10:37:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774345033;
	bh=ziNRxF6wJwQ72ndkJaxRGJmIPHBGp++CSki9vPy5xpk=; h=From:To:Subject;
	b=nf1A3cLb6AxucZ9/fzjIeOHLm7VwWO1mlI+4XwM3kFyDAcxRNN2lPdeXSJx05+I+M
	 2ag15jOg1ubvJssfUxPPJHwcQ78MAtpNr2zuCXQPKlNHTbspOjHcAfKK0IBZWEa2n1
	 dDfotOdpjYxxEuG+oK9CFNwVReuQD0ng9VN7pifdrK67ZmMLCKL40I7WYWERuG8q9C
	 s6YrryMDheL6WU1s9b+3vbWpTjmb1cA9wPp40DlijpSdxa/1k9aNkfwx6fkBdQCJ4h
	 ns1mmIF5FOFcWQ8ik/vUxhpeOlUVAqodozyGzXxTt4R0+RNe+jUocjEzgl9LV2UJak
	 fdaxX9PLky2tA==
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
Subject: [PATCH v1 5/7] arm64: dts: ti: k3-am62p-verdin: Split UART_2 pinctrl group
Date: Tue, 24 Mar 2026 10:37:00 +0100
Message-ID: <20260324093705.26730-6-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324093705.26730-1-francesco@dolcini.it>
References: <20260324093705.26730-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_023720_406203_9A1C5C88 
X-CRM114-Status: GOOD (  10.29  )
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
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 22 +++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 34954df692a3..1c4c951e5e94 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -767,15 +767,27 @@ AM62PX_MCU_IOPAD(0x0084, PIN_OUTPUT, 0) /* (F13) WKUP_CLKOUT0 */ /* SODIMM 91 */
 		>;
 	};
 
-	/* Verdin UART_2 */
+	/* Verdin UART_2 RX/TX */
 	pinctrl_wkup_uart0: wkup-uart0-default-pins {
 		pinctrl-single,pins = <
-			AM62PX_MCU_IOPAD(0x002c, PIN_INPUT,  0) /* (C7) WKUP_UART0_CTSn */ /* SODIMM 143 */
-			AM62PX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C6) WKUP_UART0_RTSn */ /* SODIMM 141 */
 			AM62PX_MCU_IOPAD(0x0024, PIN_INPUT,  0) /* (D8) WKUP_UART0_RXD  */ /* SODIMM 137 */
 			AM62PX_MCU_IOPAD(0x0028, PIN_OUTPUT, 0) /* (D7) WKUP_UART0_TXD  */ /* SODIMM 139 */
 		>;
 	};
+
+	/* Verdin UART_2 CTS */
+	pinctrl_wkup_uart0_cts: wkup-uart0-cts-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x002c, PIN_INPUT,  0) /* (C7) WKUP_UART0_CTSn */ /* SODIMM 143 */
+		>;
+	};
+
+	/* Verdin UART_2 RTS */
+	pinctrl_wkup_uart0_rts: wkup-uart0-rts-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C6) WKUP_UART0_RTSn */ /* SODIMM 141 */
+		>;
+	};
 };
 
 /* Verdin I2S_1_MCLK */
@@ -1410,7 +1422,9 @@ som_eeprom: eeprom@50 {
 /* Verdin UART_2 */
 &wkup_uart0 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_wkup_uart0>;
+	pinctrl-0 = <&pinctrl_wkup_uart0>,
+		    <&pinctrl_wkup_uart0_cts>,
+		    <&pinctrl_wkup_uart0_rts>;
 	uart-has-rtscts;
 	status = "disabled";
 };
-- 
2.47.3


