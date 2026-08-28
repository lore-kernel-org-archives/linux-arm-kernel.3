Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07212C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTEdDyfLi50RcqOJ5Ow1a7iI5UClcwAXlnII6KKqFeM=; b=HX4g9fBazlxzQIVJL5wFmB+yyc
	r96joyz7q0IAV8X5eDOLvOv5GKbDYBOJHBRwLHvBRNZZeEMdkf+raTf8WNiUiC84VzqkU86q/s2G8
	7ftNqAyc5U6kC7SWUrzj/6+KR6mtPs/PK+Opn402q8zLXiWnhBz2mACCUESGWc67rcQ95ZcFyM42R
	RD2Rua6sO8tb0TVXmGNpxgSweiMrXvPVhCyURzanwnRfg38pN0Ljfjy8N5M+ufxfYtzBwH36l+rOk
	oHeWsLmhlu9EEljIu6vcADhE6N2zxtj1mQO/4Qx61r1C7o51AQYmJbWCS/OjOkrBN0wZPy63PNa8f
	5LDU1dRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy6i-000000062z4-2ikv;
	Fri, 28 Aug 2026 15:03:04 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy6d-000000062wk-3HLC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:03:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67D8011D0C1;
	Fri, 28 Aug 2026 17:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929374; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=LTEdDyfLi50RcqOJ5Ow1a7iI5UClcwAXlnII6KKqFeM=;
	b=WNouB8/jtDywFxFLH/yr9Y5x3ed1Ij005Y8mBplKmyvAgaWi8t12CDnVJM42HHMnh8LHk2
	qDRwZJtm9HKSuVj/V00zLxh4fNMUSbaFSwE6FZpgEqrnqft5BUJ3EW/kMjd9iGh6Rdu2W0
	PYoCrWRpubFYtZ+38fo6U++fdWzbjcbfpO5Af42tMA996DG1YfSeG9FCrqrjdIuMIybtxk
	uDt5J/yGgBTFlKsDSgof/6LyVXlGqjrv3y6+HvuoZ2yk81DKOiDBvKGCSeMB2wgVsmK0sj
	5p1PY0yvli7QtMLVNqSs89cUBfIVy3i8iZsM65ybDUbKhKaZoxZIpEVNtxsQHQ==
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
Subject: [PATCH 2/3] ARM: dts: stm32: Use STM32MP13xx compatible string for EHCI USB controller
Date: Fri, 28 Aug 2026 17:02:26 +0200
Message-ID: <20260828150245.173147-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828150245.173147-1-marex@nabladev.com>
References: <20260828150245.173147-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_080259_969618_6A10743F 
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

Use accurate STM32MP13xx compatible string for EHCI USB controller in
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
 arch/arm/boot/dts/st/stm32mp131.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index d1c5afb5f89aa..ae45c2023afeb 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1137,7 +1137,7 @@ usbh_ohci: usb@5800c000 {
 		};
 
 		usbh_ehci: usb@5800d000 {
-			compatible = "generic-ehci";
+			compatible = "st,stm32mp13-ehci", "generic-ehci";
 			reg = <0x5800d000 0x1000>;
 			clocks = <&usbphyc>, <&rcc USBH>;
 			resets = <&rcc USBH_R>;
-- 
2.53.0


