Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DF2C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QKKyAD+RKpUraf7qRfHorcMHBOqKlvlmP8To4qB6X8=; b=h/fxIvVpwo5EhNgtces/khfpsn
	/pwn4QyRI+41G922E966gk22h3YRBUdZJ+Q9SQubeHdnMiIAwvLr3sKspQmfJ8k2nVWZPC6hXf/6c
	weKlyX7pG1vbpwTGbtBLUPLVy9mJ5tVc+QAyjNpnTbxEyGJut1Oyd8CHsy7qeZSXHTG5vtW0JO29W
	vuVSTIlAUvgmqLh7fqkm4k5IW1nKVUPuJc65E9VB10A0mTk2WlRnMS2zUpxq87t1ds8oBkA12vuUB
	MXhWxJqHlqZeT1vbJSs3Gw3jiJUqM3iz6GZ0VJb/y3mI99kLQVVAJasZtDuFRgIFNvYo3JAuDEWmp
	uYVRKc0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy61-000000062iV-15PM;
	Fri, 28 Aug 2026 15:02:21 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy5y-000000062hT-2kyQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:02:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 539CF11C71D;
	Fri, 28 Aug 2026 17:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929332; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9QKKyAD+RKpUraf7qRfHorcMHBOqKlvlmP8To4qB6X8=;
	b=JGmG9ka+2rbZczh4qBCG+sWTHkPGfjADElZhdFStNQT8mx7T/Sg6Exx/8xkzdppPi121Mh
	FISeEuR6A3YsxA09hsZRikMkKkebyRXCQWCHyC4Hve0gElXfNQToC2prNirAZmqwnI5+k5
	sl5hyaoUOsarjlCmPF46+YlHvxzffUbHvG9KDtwULqFjrceJf3sG6ee6SuW8yar+lVqB0g
	xKTlzXjnFGsz5VGbFeU5jrk+GEITAlLG9jjpygJt/JbWqTEHb3FTt7cQbxkeV5v7bQ0YZ6
	nG2vW9v0/Fv536aKehXLzJckG38GUlwajJkk7fzz4Hqeh+Gx1Ws984JNBXruWw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: stm32: Use STM32MP13xx compatible string for OHCI USB controller
Date: Fri, 28 Aug 2026 17:01:27 +0200
Message-ID: <20260828150202.173109-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828150202.173109-1-marex@nabladev.com>
References: <20260828150202.173109-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_080218_844238_FDC922F7 
X-CRM114-Status: GOOD (  11.81  )
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

Use accurate STM32MP13xx compatible string for OHCI USB controller in
addition to "generic-ohci" fallback compatible string. This is future
proof, and drivers can match on the accurate compatible string in case
they need to discern this controller from the generic-ohci one.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 5ae33b26e313f..d1c5afb5f89aa 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1128,7 +1128,7 @@ crc1: crc@58009000 {
 		};
 
 		usbh_ohci: usb@5800c000 {
-			compatible = "generic-ohci";
+			compatible = "st,stm32mp13-ohci", "generic-ohci";
 			reg = <0x5800c000 0x1000>;
 			clocks = <&usbphyc>, <&rcc USBH>;
 			resets = <&rcc USBH_R>;
-- 
2.53.0


