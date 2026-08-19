Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2434C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2y/9nZpIAjwa+OHOLCYwxGsZMISNNbT4G7AtheLzxnk=; b=BuTkXVjcsWxMdgrjxbW1r3ggIi
	/n2Ufit2nAixLqzkPWdBCbqMdFBhJXi/0ueQFAwdHwQV5v/LynIqLg9ZNr+iwxNoejv33hvtZqHax
	jOlcRqeURwenWS0ZXManQTs8F6Q0VrujIBfyHnf2V+mrmvFd/TZy/LevcWpmnjFjsgroeFj5vVQvA
	n79trYUhCdgWp/GxuByfpRaJE1ieRqIQohvHziUhoUZWH+uMbNsacFeGoCqvmjtCro6jUwkU2pSJQ
	q54I6y4AcbvzssQ6xhvITum/ZV1N3SkXwVwpblONIuPB0LgKG4UpOSjvkpDtS7zB0igPtixR7rFTD
	E8I5fyNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjFY-0000000ACBI-1sXj;
	Wed, 19 Aug 2026 16:34:48 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjFS-0000000AC7t-2yjP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:34:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05C9D11C4EB;
	Wed, 19 Aug 2026 18:34:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787157276; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2y/9nZpIAjwa+OHOLCYwxGsZMISNNbT4G7AtheLzxnk=;
	b=W3ncaqib41nqs0ZHcdm/l/+Aj5TujekXRoVxpuNZLDFQW6I9UDBZ5UilFtF/Fb+ePvGpNf
	9bheD/2axaxdduqPeJfxX0BjHkx/ndgzR5ZVQeqVhO1Q0ag7nqV6w+CSk81Yuk9meQWsTo
	hDCHhcU/Cw6fUk1DokV726lpcxPzgGUGzcE9ydMuuxlkLs1dbs2c3e2KlPOQHGtpdqdi/c
	XqXzR2DuVBDKUk2DkzV6OjnuGM8ArAisgWUeuqGcaoGOJXPFpYGfSqfaq6IDYuBKYcqNjR
	fTjeEc3/5bEuLccvGJcM2zKmv2cSCvA6WxbJp2nVRYWsAZJ2iDfe3FNfF7J5Wg==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 4/4] arm64: dts: st: Add UCPD node on stm32mp251
Date: Wed, 19 Aug 2026 18:33:55 +0200
Message-ID: <20260819163410.119755-4-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819163410.119755-1-marex@nabladev.com>
References: <20260819163410.119755-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_093442_901223_F40F62E6 
X-CRM114-Status: GOOD (  10.37  )
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

Add ST UCPD Type-C block node on stm32mp251. The UCPD integrates the
physical layer of the Power Delivery (PD), with CC signaling method,
for operation with Type-C cables. Vbus and Vconn control is performed
using an external chip, usually ST TCPP01/TCPP02/TCPP03 or similar.
The UCPD Rp/Rd resistor trimming values are part of OTP, add the nvmem
subnode and include a phandle to it.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885a..0d4ce4d7e124a 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1637,6 +1637,21 @@ dcmipp: dcmipp@48030000 {
 				status = "disabled";
 			};
 
+			ucpd: phy@480a0000 {
+				compatible = "st,stm32mp25-ucpd";
+				reg = <0x480a0000 0x1000>;
+				access-controllers = <&rifsc 69>;
+				clocks = <&rcc CK_BUS_USBTC>, <&rcc CK_KER_USBTC>;
+				clock-names = "apb", "ker";
+				interrupts-extended = <&exti1 46 IRQ_TYPE_LEVEL_HIGH>;
+				nvmem-cells = <&ucpdtrim>;
+				nvmem-cell-names = "trim";
+				power-domains = <&CLUSTER_PD>;
+				resets = <&rcc USBTC_R>;
+				reset-names = "phy";
+				status = "disabled";
+			};
+
 			combophy: phy@480c0000 {
 				compatible = "st,stm32mp25-combophy";
 				reg = <0x480c0000 0x1000>;
@@ -1781,6 +1796,11 @@ package-otp@1e8 {
 				reg = <0x1e8 0x1>;
 				bits = <0 3>;
 			};
+
+			ucpdtrim: atrim3@1e8 {
+				reg = <0x1e8 0x4>;
+				bits = <4 16>;
+			};
 		};
 
 		hdp: pinctrl@44090000 {
-- 
2.53.0


