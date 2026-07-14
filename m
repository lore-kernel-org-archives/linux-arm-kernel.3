Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AD2C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BJobMhO8Q4Mao+C+vcQ5vLWeHC+VhP4x4j9L0XJUdc=; b=hZsG5252AcFe03i+fbEAzz6oEb
	yFNBYTmKXw1BNteCH0zc/dTVsjSUFeQyv6Wc4V0Iw26QfVKDzmvOEPmO5z6x4Ed0zkz/SFqBBoPc8
	SPb4bvRsYr3v/BYWrsYQWSpF4cTx33sHOxRoPmvYTlyIe+A6NnJBzoQstMiRopqstyaMgTZEKUQCy
	PVb8po7mH5KoGU17i7zLzfb0k26Z/BB6tBceqOfgX21Vq5TtRWHWF21Xk/yHSLvry+X2v971N6wVh
	CFm7caKAFrHsSzk0JPrXs2s8Na6e6Ht+FmMg0aT4Bj7OpAZgJLYz1Xmb3GADX46k66e0OSVsYpoSW
	Uir5AOpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcod-0000000C4zr-1V35;
	Tue, 14 Jul 2026 13:04:51 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcoX-0000000C4vT-35Ad
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:04:47 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gzzzb5LWqzKmyK;
	Tue, 14 Jul 2026 15:04:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+BJobMhO8Q4Mao+C+vcQ5vLWeHC+VhP4x4j9L0XJUdc=;
	b=vEjOeSwgbriNhwC0sNf933PK1Ddp7QnGRpnu78amq9fi5J4WdrdZvi5PFAz5FKjjTkhX5m
	0Uyyi0bRVOHVXmiUAhyCtuh5QyGdiienBLPmriOBkiWVs1wGGzO8VnHFXMlyPNCUkCjBwE
	ekQCLgbFs1H/v45hjV8j/lxfbm02ZG3rJvakKZVapLArNZ3M6SD/0FUHiepbWywtBcev6x
	xovGTDFhltv/TU2AElI/n5bh2zoyaMb8/ZV59KJJ764pDxzhcw2Str8zSFZvBlAbSQPA7G
	lKjOJ4RkjZTsrby763qv1VaWl5UCzKcP/QuR5REyvf1FRLxPwTSKq1cZxRzWfA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+BJobMhO8Q4Mao+C+vcQ5vLWeHC+VhP4x4j9L0XJUdc=;
	b=hwsVcsE5u0gTNkGdl6tTbFiN5a4Kz8R4I4Nniwe/EXLh9YDC35zSh+P77fZpnHdLYTOVOQ
	T7/GAaFGMFOOgY9lV5Uay7dWtAukwhmSu2oj0QDCCT0Sn4EfjvfMW+3s0FvhQC5HtkDlO+
	5MvNZ2Muc7xX70KbUafbP8GUBj8snhOJ6tus20rc5kxnTwtlY8GS0z9ii0lgV49StR6j3e
	ywrBwOse29oXNBJP/7BV8kQXTjEUUfmHL7zV3/9XUcADL88CpeTdUnRPmGmvFLflRaPHk1
	B2WRI4fqcdU6UsGgT97KOXs+BITSFrkyjZy+fkco90tLWHYJnpwM8hTWCk3MeA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/9] arm: dts: renesas: koelsch: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:56 +0200
Message-ID: <20260714130429.11214-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2c8c949d0327fe1a3ac
X-MBO-RS-META: zby49muz9hgdi9kdnob1qtk9uzt8qdhw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060445_933692_1BD00A14 
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
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index 48db62e0ff874..54148a5ddff7b 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -678,12 +678,14 @@ &ether {
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
 
 &cmt0 {
 	status = "okay";
 };
-- 
2.53.0


