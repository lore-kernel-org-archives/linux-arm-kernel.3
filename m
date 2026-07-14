Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F73C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jtBaYTpQ2+EKQzLC2rq0fDxMm0BG4JHJD/eHUR6sp4s=; b=SIm8zMqgt1V/FhDw3IiJ/6NKtg
	SvZbTjtTpUBTibzTYqdm0b0Uhp+QnO/ou+0LOj+zcptsWjHrMZfi7NzxMFjGBu6Qw6nbMNwUkypPy
	jyMGwgvggRbLO8VX8bjeB7RUVjrMBS7cWCX8oMWiSpPjGFmQvc8F4d+UQs8B698DkjEnhaXCbpe/u
	JGReBkIG0hYFRnHNl3H1V6RGLG6V9eng7QAtPTsn7GlArHuGJnlN2Rkfae06XIu1MHifPyPo/3T5C
	LBZ9BGK4TtX3kx3rrT/I6D/+tUEOcFZhd8K7DyG9E2PMY0jGEQID3jNlIlVSJTTK83cb44kKvx6ZY
	rRuYptQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcpa-0000000C5lu-3RNu;
	Tue, 14 Jul 2026 13:05:50 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcpX-0000000C5jZ-1nmW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:05:49 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4h000n5njHzMlV5;
	Tue, 14 Jul 2026 15:05:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jtBaYTpQ2+EKQzLC2rq0fDxMm0BG4JHJD/eHUR6sp4s=;
	b=Af54Un0Gasiptj3vxhw/JB+iJfG2DSbzzVg3QUceNOH0O1GPm8cC3+QG7wpQdzh5VTAIjs
	z9rEtIalSwab6MjRzmXvdB4aAPpFyYpv6FkwQvsCSKFfjIV5FsERzGH78K55jo+Mia8+/t
	/868ROE8DnyzzWoSlPZXNnFa3XYS5FGu0P3AVSKMWoK11JCw5crRhuMCwYBectNjyh+lGA
	IVkZpnhdckeydZ8RG5NoFj7Yc3d/1QhHQvRL9ZxGOKWHMgTZlMvDJec7+WZeYQupjmPHzy
	257KjuW5AsqM8FT2Pz/F9TElo+qLaVCyGl6hmWytEHs15GIy8uJCt2+Y6SYUUw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jtBaYTpQ2+EKQzLC2rq0fDxMm0BG4JHJD/eHUR6sp4s=;
	b=V6LaFXM2Jfj1LxFqYs7KQcguefx8tJOLi/alWaKiaJG0yJzGp/8zF2ZclKfY1CJ32Kh4id
	wuiULoBWewgr8HlfGNq1Wx5NybzQyv2B73JEdP9WEJimjsBUGqC8FbSbShnoFjOGdgE0Nr
	1f63QthHbTOWTake4BI1FOtnBCdJwqIaevbOt6Qut15aYAwXExxUY+WQlr8oYzO22anIcJ
	YxzPe1mJ7r5ig5hSzqhO2hHkIuE8lHD2YwLHfHyUOS8Jm5PgRkP0WwOGw/3M/r/PYEVbiZ
	LWrA3FtxgoHASjRnuVarOcWE0f0+RWCKX840x+nHg1tCbEGy5bEaB5DJVwp7uw==
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
Subject: [PATCH] arm64: dts: renesas: beacon: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:05:28 +0200
Message-ID: <20260714130539.11287-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9d8efed93b3dc8ef9cd
X-MBO-RS-META: iwbu3zffk1xnaopoaew7i1d8js7ftn4g
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060547_623249_C76B9580 
X-CRM114-Status: GOOD (  10.20  )
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

The KSZ9131RNX reference manual [1] DS00002841D page 131 FIGURE 6-2:
POWER SEQUENCE TIMING INTERNAL REGULATORS does not indicate how long
should the system wait after deassertion of the PHY reset and before
starting communication with the PHY via MDIO. Opt for the same value
as used for KSZ9031RNX, which is 300 us.

The KSZ9131RNX reference manual [1] DS00002841D page 131 FIGURE 6-2:
POWER SEQUENCE TIMING INTERNAL REGULATORS row tSR Stable supply
voltages to de-assertion of reset is at minimum 10 ms. Set DT
property reset-assert-us to 10ms because the KSZ9131RNX RM does
not explicitly spell out how long the reset has to be asserted,
but this at least covers the worst case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf

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
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index f8442b6a85a75..8723e7a76c9dd 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -60,12 +60,14 @@ &avb {
 
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0022.1640";
 		reg = <0>;
 		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
 &extal_clk {
 	clock-frequency = <16666666>;
 };
-- 
2.53.0


