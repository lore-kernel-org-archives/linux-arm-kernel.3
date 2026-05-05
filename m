Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8427CCD343A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 03:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7eGS7acqaq5G9UabRfzoCWYPA+96J2RcOeuG2tL95Q=; b=wFc3MQMiOzRkfd/0RtTUvFh4wZ
	fs7vZ5LvcS47CJJh/QNKhoijDSFcqqF9CeXBpc6+zBB4FNKdEWJU72ajV2gd8fC5U/q6GbqEnDDis
	5A+onFl2z63txXrj4PChfq7/8F6glZiOmuZFq1DyBOmJIRqTJicgjbStglFA8FLVjzPBDJhE+5pA0
	aKP0Qso+y/1BLqOT3f1Etf7q4A0HBGzPmoklkMCzokc5y5EiuOWmyFJcy2w1AzMbnCOv44RM9BbkB
	DS2LqP8CkyDWxeUp435vNXvlmqrJpr4+wkQGTF4iBnOn95oLPiVLBBi/uZaX7Ixpp8oaehxEoFLl3
	zahCZJ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hM-0000000F1sO-44qQ;
	Tue, 05 May 2026 03:43:52 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hK-0000000F1pH-0l9U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 03:43:51 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g8krg5nNWz9tyS;
	Tue,  5 May 2026 05:43:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7eGS7acqaq5G9UabRfzoCWYPA+96J2RcOeuG2tL95Q=;
	b=pdKLqa1BMSMqrlKWMfOKOdKpET+Th2cBX1dJlWMBcDCId42vTCZ+p44vWQTFTKOdnOF7gO
	+dBjmK3hfi6OgaH2rksAPaz1YLrVWayHs+t8Cc1RD9x1TF+FilO4f/AWQioKzSwe3E3dGa
	ACgzWwUDctZpe5LlRw9mc/rdRVovjGxHeFcJpAvlzwi1RzUff1aG7DHxWwVQIiia0DXvSM
	WL7zkUe3ZHBsLiF2YS8RQqsdY3BK+y3NUNZbZ4bNdCGT56eps7vlhzEfwxEBrjhJ4yAqQu
	yezznyZxfk+o1JWpSKVcPCF1XaxrK6qnU3CTFR591cxiqqUnKAoXXZj7CWL2ag==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7eGS7acqaq5G9UabRfzoCWYPA+96J2RcOeuG2tL95Q=;
	b=ihiVPS/4CB2nMHNXqDncqBCmavaszfBh10lVs88Au3ZbwAFeAr4Nde6BWdIlOknIB6LlVw
	WAyiW7m9s+UJBvGw/ElaTa2x8kDlpLeVOFh6gonpLplrPjOFwfCk2m4qyfUEOpIbK+i0Qk
	0+/jsLtlvC+tlVsv/+Be5Jzu4m52SoWzAdgrEO3b44bR0v5dvMKaFKFVFAU5yg69TbBFba
	ooJnAVlbX69NEnusGh7cgG6ejhW0QQc/9N23N5oxvRP5PSCwvYeghxv5aKZBoMB18nG7pC
	yci0L0FdvI0wI6msyNGIHTqAf9WNrAEoycSnNLsnj44mwrh+WZxKw7wuv+BUxQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 04/11] arm64: dts: renesas: v3msk: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:45 +0200
Message-ID: <20260505034325.167797-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: m9sth1a446zs81zeui3ukwxzmidoanou
X-MBO-RS-ID: 7950ed4548224329d87
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_204350_364898_B0F331EE 
X-CRM114-Status: GOOD (  11.04  )
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

The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
de-assertion of reset, wait a minimum of 100 us before starting
programming on the MIIM (MDC/MDIO) interface. Set DT property
reset-deassert-us to three times that, 300 us, to provide ample
time between reset deassertion and MDIO access.

The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
voltages to de-assertion of reset is at minimum 10 ms. Set DT
property reset-assert-us to 10ms because the KSZ9031RNX RM does
not explicitly spell out how long the reset has to be asserted,
but this at least covers the worst case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 343f9610f8924..10c9a2e9ed18d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -119,6 +119,8 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupts-extended = <&gpio1 17 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
-- 
2.53.0


