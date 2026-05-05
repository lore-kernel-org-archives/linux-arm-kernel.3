Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D33BFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 03:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgpdazERfEoZazK2lKiGb+H4Zd0Qc1cUAdNGOG/1Ztc=; b=EVbcSLV2Pzz4lKRI4vVPlbbFRb
	lyGP42HFUfMirMuComz+ly+ADGNC7bRY02a5eDdhAEzl1MbBUo1nF0QWiH2gH2fbFZk0jE1Mdm9d+
	KUM8RnU7zrfeRZb5k2n2BVehFEA/7rshgjjJqIvd/hL1L6xVnnq8qLiS5i77m6znPbgzdPhH45elf
	ucRVjV0HEeaTRxMTQJZmAvGtp9qm4atzbEn+J+rWoTXQ83+CqEKs4otbupXiN5H5RpSjAE+Pc/lCB
	PaxMugvO3dUSXAKuMJwhQUpsOFagLQ4pYLiH4bDjgE0igIJFAeSBYXo9e3UIH27fjayu5Eo/CbXuj
	Rdh61rDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hT-0000000F1w9-3aOL;
	Tue, 05 May 2026 03:43:59 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hQ-0000000F1te-2IaA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 03:43:58 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g8krp4WnHz9ttZ;
	Tue,  5 May 2026 05:43:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JgpdazERfEoZazK2lKiGb+H4Zd0Qc1cUAdNGOG/1Ztc=;
	b=B6MJYmf3Q2vjqMvq3GgeK7OQcoxSnAQbZ24nuOdXZK/cNZ/gv6+xyYLooqNnDsKlSFUYY/
	4p3a8g/stdTA1qYVzLXfDD3jOe9FEl4rwQJbZ01CDfku4clJRshWSKnPnkWGKtpcXZ68eB
	9lhZVFGVzAplefrE9xdkfJeB0oPUmKPLnfh2atEyHauRtCauB4z2aGX9ZV2hcjTY0Fw2Xb
	zyH3J4k7oHEZTSeQfxTff/NGeANk1RZ/MyPdAWShW2Hg/tpp157NZk50j3PCvkWm8zZ3+V
	6YQeckomp+kqgv0NquTpVypUcf1aYPblhtxDPX5OjP6EluK6c6MLEmKQ7GqzJw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=bQmqLyyd;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JgpdazERfEoZazK2lKiGb+H4Zd0Qc1cUAdNGOG/1Ztc=;
	b=bQmqLyydspIEkdRoelJHmkJ4y7Yu53jxrQ7QAHdw3KprXGA5N+0RVnrl8epq5GN79alA7B
	qQeWQe+UvX3MAZGBPn8t4tP44WKLe34GosQwwp/Velo0jEj9lgwoQRLyNVLtPFjsqn+U1v
	GgGiwSmRJ03jXKQaBzMS7TjZ0+6g+zAo/FfJfZuCENC7mWegQUz5z0ZpLPdcPOj5kbFP8o
	1VXXv5VX5yLYN5iaRnMvbLc1DzdDL44SvCSwFf0a9nRVrocfvU3f/8vJLgfpQGPGU2DEs7
	/aMTDxCJZHloPDKQRLqaAVduRO7iXcUJybndguRR4JuNkloYaFcNVo782UwkNw==
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
Subject: [PATCH 07/11] arm64: dts: renesas: ebisu: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:48 +0200
Message-ID: <20260505034325.167797-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 84686d86872371c2590
X-MBO-RS-META: gkt87kkokxjk4rh5w1eyqnreq9nhh9s5
X-Rspamd-Queue-Id: 4g8krp4WnHz9ttZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_204356_734282_DA9298C7 
X-CRM114-Status: GOOD (  11.14  )
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
 arch/arm64/boot/dts/renesas/ebisu.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index aaedb1fb51aed..f381847c6feb8 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -322,6 +322,8 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupts-extended = <&gpio2 21 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 		/*
 		 * TX clock internal delay mode is required for reliable
 		 * 1Gbps communication using the KSZ9031RNX phy present on
-- 
2.53.0


