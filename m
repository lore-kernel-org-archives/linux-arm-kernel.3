Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE477C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbsrzeaCPJpez2qjsuDWtyobx8VZOtDXHhuYAqGuZJY=; b=h2UsXGk64Zs/XZxuIKte8iCz38
	UTFozKRVWNVdz0/cjB8fP/Ta8ty+T1QvLwtENwJII0KWHwX+vuQasLDT+JGV4s7LSmBnQZkJEM8ss
	uS0yPHm0IKUfXRGXWXjK8YSrxWFvNMfkQoO2NgSss3tsEXYMJDZO2eMPI1uCSeGDQw5y64isPPLxx
	XiAl5wqL/4+wbqsVwh1fy/WVaWdEEvlG2COXKVfLpGk66zCCw2H6iJAcYuNmgAD8v+VNTyydG4Oxc
	wJkaL+Dmel2IuMMOmBLP08Gfj7z28ks3htkeXLTti2fHnz5HtTYY7TSjFWFgDp5NMvgWDmJwSBeVz
	omZ59ZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy6p-00000006325-3L5i;
	Fri, 28 Aug 2026 15:03:11 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy6i-000000062yR-2dHH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:03:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5281A11D0D8;
	Fri, 28 Aug 2026 17:02:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929378; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SbsrzeaCPJpez2qjsuDWtyobx8VZOtDXHhuYAqGuZJY=;
	b=hapBCuzsBlPbZYDNF/3DLRbv3iw++fiOFWVZdLPHbnuoDCmeAL+F+iJvh+8F3CG8kvIRel
	ukZOo/m/KPhG+kTp89svsIfsmBRxmVf+hBLMgTnYNQCOcrYY+8yCo8MvD2Tk9YjMy6K46a
	0tlQwhgJ6JBgGkzmCvqQhjKv1iHXhhtDjk0ucXg1gNUcqjNVruf1/QLqOCtHvEi9z8sjKK
	LOFKNQCFvX0TmtyIN9gDLCZo+j4Uf7M8KqxNV6tE+i/kRZWa3GR0YdMDJd5mdbfL5vwsYs
	tJAMpthhJ0HG+RPDjZMxyg205Q7zSjQNqVW5ZDUDdUKPSHp5u2Rd4jjRka8adw==
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
Subject: [PATCH 3/3] ARM: dts: stm32: Use STM32MP15xx compatible string for EHCI USB controller
Date: Fri, 28 Aug 2026 17:02:27 +0200
Message-ID: <20260828150245.173147-3-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828150245.173147-1-marex@nabladev.com>
References: <20260828150245.173147-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_080304_873300_E22F0C63 
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

Use accurate STM32MP15xx compatible string for EHCI USB controller in
addition to "generic-ehci" fallback compatible string. This is future
proof, and drivers can match on the accurate compatible string in case
they need to discern this controller from the generic-ehci one.

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
 arch/arm/boot/dts/st/stm32mp151.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index c37005c00ad65..ae31883732388 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -515,7 +515,7 @@ usbh_ohci: usb@5800c000 {
 		};
 
 		usbh_ehci: usb@5800d000 {
-			compatible = "generic-ehci";
+			compatible = "st,stm32mp15-ehci", "generic-ehci";
 			reg = <0x5800d000 0x1000>;
 			clocks = <&usbphyc>, <&rcc USBH>;
 			resets = <&rcc USBH_R>;
-- 
2.53.0


