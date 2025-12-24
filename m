Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91302E7490D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 04:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vOX15IHkzIC6xDc1UJTkL01UOIHEsA+uhLog18p2ocE=; b=weAaoWpu5iAESploEtKr7qs5x7
	ZHM0Wk9i55m1y5fYouBhnOucrah3R9tSXabem5f1u5vS6j2+lYWzvESBBLz5UmqhPFy5Ekkx/xDpG
	t4ooelomr+e3XeomnHmk7BmOn5pGKgAr1xzPojURskHjS7ftOQ6P8U2YMrLDwa0I4Ly9h4iXwcBK1
	hbtKEd56uhRwJ6HQZMGe+DUegEU/Hze+EwKFnY6cVMEG7bcxADJywMQvRdLHF7ZaRTLUOxs8S6UmY
	e3zG/juSt8Z8j+OD2KmQPwWHY6QWHhmnaZybJ7WH/qzIELTKZ6Oy7shYRwS87T21U2O4/iACt5Hhs
	LStsP3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYGr7-0000000GPCM-3UzI;
	Wed, 24 Dec 2025 04:52:13 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYGr5-0000000GPBi-36Oc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 04:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766551927; bh=YFUbCof5qxAaSXFaRIk3fRDUALAB5874JIB8dkA58jc=;
	h=From:To:Cc:Subject:Date:From;
	b=EOkn1POAMYb++aWroK3XWI5S72nbGzEIU2V7ahnDR4qVxImkmtwc0MR3LBGKA+wyc
	 QVYxEyrIDVWsNp1eV+XXGhy/y7qm3z3zF3QSg+53DF7m3zGLAo2Y5OyfhKlW2bUNGS
	 eAuLK2dL4mYtj1PJUND6aQFI+zYo4u+0kOGk8mgxL7Lb9wQJ1sw0icWyeNqLhyj4r6
	 hTpfUJGZ+BhnABDkF4jQFLre8Ox82ENFSZQiC4xnXt72HBiD9ERQpOgZbHWBLncr6c
	 cGoqZQPCyiAKcY0tXzsFTmB2bDx6kVRStwr6Wl6Se8VUOMvOJT3kFVoHgcwjUZnXW9
	 vbkNOxOy547RA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id DBDE83E88C3;
	Wed, 24 Dec 2025 04:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766551927; bh=YFUbCof5qxAaSXFaRIk3fRDUALAB5874JIB8dkA58jc=;
	h=From:To:Cc:Subject:Date:From;
	b=EOkn1POAMYb++aWroK3XWI5S72nbGzEIU2V7ahnDR4qVxImkmtwc0MR3LBGKA+wyc
	 QVYxEyrIDVWsNp1eV+XXGhy/y7qm3z3zF3QSg+53DF7m3zGLAo2Y5OyfhKlW2bUNGS
	 eAuLK2dL4mYtj1PJUND6aQFI+zYo4u+0kOGk8mgxL7Lb9wQJ1sw0icWyeNqLhyj4r6
	 hTpfUJGZ+BhnABDkF4jQFLre8Ox82ENFSZQiC4xnXt72HBiD9ERQpOgZbHWBLncr6c
	 cGoqZQPCyiAKcY0tXzsFTmB2bDx6kVRStwr6Wl6Se8VUOMvOJT3kFVoHgcwjUZnXW9
	 vbkNOxOy547RA==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 4BC093E837D;
	Wed, 24 Dec 2025 04:52:07 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Kuldeep Singh <singh.kuldeep87k@gmail.com>
Subject: [PATCH] ARM: dts: lpc32xx: Update spi clock properties
Date: Wed, 24 Dec 2025 06:52:05 +0200
Message-ID: <20251224045205.1204414-1-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251224_045207_917026_AE57C592 
X-CRM114-Status: GOOD (  13.22  )
/bin/ln: failed to access 'reaver_cache/texts/20251224_045207_917026_AE57C592': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_045207_917026_AE57C592 
X-CRM114-Status: GOOD (  12.81  )
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

From: Kuldeep Singh <singh.kuldeep87k@gmail.com>

PL022 binding require two clocks to be defined but NXP LPC32xx platform
doesn't comply with the bindings and define only one clock i.e apb_pclk.

Update SPI clocks and clocks-names property by adding appropriate clock
reference to make it compliant with the bindings.

Noteworthy, strictly speaking the change tackles DT ABI by changing
the order in the list of clock-names property values, however this level
of impact is considered as acceptable.

Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
[vzapolskiy: rebased and minor update to the commit message]
Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
I do resend the unapplied change from the past, which raised a discussion:
* https://lore.kernel.org/all/20220311093800.18778-4-singh.kuldeep87k@gmail.com/

A functionally identical change has been sent recently:
* https://lore.kernel.org/all/20251029202801.3963952-2-Frank.Li@nxp.com/
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index e780451fd335..206c66bdfe41 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -172,8 +172,8 @@ ssp0: spi@20084000 {
 				compatible = "arm,pl022", "arm,primecell";
 				reg = <0x20084000 0x1000>;
 				interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk LPC32XX_CLK_SSP0>;
-				clock-names = "apb_pclk";
+				clocks = <&clk LPC32XX_CLK_SSP0>, <&clk LPC32XX_CLK_SSP0>;
+				clock-names = "sspclk", "apb_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -196,8 +196,8 @@ ssp1: spi@2008c000 {
 				compatible = "arm,pl022", "arm,primecell";
 				reg = <0x2008c000 0x1000>;
 				interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk LPC32XX_CLK_SSP1>;
-				clock-names = "apb_pclk";
+				clocks = <&clk LPC32XX_CLK_SSP1>, <&clk LPC32XX_CLK_SSP1>;
+				clock-names = "sspclk", "apb_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
-- 
2.43.0


