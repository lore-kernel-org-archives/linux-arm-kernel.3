Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8763DC4450B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3U5wVLTIHJcvPryb0DdB5bAnzoh2qzPvSAZ2mXS9w7c=; b=qRRjOKuUPhrhwkMdnPmxpCb4SF
	scCFp/4B4nVivHoTZX+FKcq09Ny6sj3RRJI2yde6KyXVVbLpH4eSbcDQXoyRXmQax6gYc9r0r/DZR
	THAawTNQ4HnU8LoDUUMrbc6P3DiYOSRRuZ7GpZwupio3Z65EGwJeHS3BoSgUw6MpThtLIP70zvCUy
	S+Kp4r9atXJX5JVqclp+EkL25QCTQi+FlZt2Sa1x38+6EewCGbSOh7F9ER5gXJHyS2RzyOVfFwkFq
	DhkhccnW7iO4bqYBTFmBhOBEMj0Mlpctkq5hXKfPRoHlmVLb/+H70ns3FOVokHEPO1UrpMrP5/Yly
	BMTDwPhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcod-0000000C509-1wzH;
	Tue, 14 Jul 2026 13:04:51 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcoZ-0000000C4w8-0hO7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:04:48 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gzzzd2JM5zKw51;
	Tue, 14 Jul 2026 15:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3U5wVLTIHJcvPryb0DdB5bAnzoh2qzPvSAZ2mXS9w7c=;
	b=fWKxyWdnlHBoxSeGCUjhNxLfbXwQtrzifI0ZoCi3wspLhBt2uElNRiZpMC3EtJeLCNEX+f
	UYUhkkG9u+h94UxDZTAPKE9Rr4VFO37/9NRsH/Tz4nWp8axiaKkc34nuswsL+rOQ45buJt
	rBMbD+1IZ6oO8aAxOQnA1LCODy1oO5B2c+e+FByG83/r2m+wNDqkalc4QnV0PftBsuD3pq
	1cXvKIVIIgCntyrxwRXmUGCoLigrRJdnFkAyYZR47UJBOkZ5ugh1pcRfNRdW88rCxynF5B
	ntAJYkmCUYeiZtMc0lgEB9elOg+iYIVrkAKUdUKTfGL2BGTY15BZWkuOTjIb1w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=VLjHKKdJ;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3U5wVLTIHJcvPryb0DdB5bAnzoh2qzPvSAZ2mXS9w7c=;
	b=VLjHKKdJ+xS7npCRpNYZmCkf2uOq7qnANYvZH51KdHRwZIlEI3B+PQlctefwzGHb8vbU4s
	rFftwHKzKkWjbmh9ceJ6A5vtrzgYMN5no8jISWLEwRCBeuvTAwp5PUg0ravz9de7o3HEy1
	a4aNnmEY2P/4FuLiJ39l5Dg0p6OSx1u2TDt6AA75DZr3onw8bXiSsW35MDPlLB5qjYTOc+
	+vdTS4wY4RkvQm9SyafDyVhJ0t4jtjAPz+sk3NlPj77We4ZyTs+3Kn3s46T7pxRYbxTQPi
	9Yzt2h4lOWqIuUvGd5ZiXIdMPCDpesiXG3jjDCG+HSB3YaO07I7S8HbC2yEWLA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/9] arm: dts: renesas: porter: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:57 +0200
Message-ID: <20260714130429.11214-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ksjhyk64pemgiie94ooiq65hubhz1jj1
X-MBO-RS-ID: 09d30c1597178f11e5a
X-Rspamd-Queue-Id: 4gzzzd2JM5zKw51
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060447_355050_C07526FD 
X-CRM114-Status: GOOD (  10.61  )
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

The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
the system wait after deassertion of the PHY reset and before start
of communication with the PHY via MDIO. Opt for the same value as
used for KSZ9031RNX, which is 300 us.

The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
reset high is at minimum 10 ms. Set the DT property reset-assert-us
to 10ms because the KSZ8041RNL RM does not explicitly spell out how
long the reset has to be asserted, but this at least covers the worst
case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r8a7791-porter.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
index 811e263452acd..05989da3be046 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
@@ -328,12 +328,14 @@ &ether {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins>;
 	pinctrl-names = "default";
-- 
2.53.0


