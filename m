Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF1DCD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 03:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58i0RnY+Jdsy5OEWeMVm4nZ6XpDQREbyORZaAY0PL34=; b=iruNrz6DMP0b8/6Rn1aEoJ42fX
	Aqokmv/Jd5hy+1bEijZs6Mu7V7Qq+qE4mO0/wkKhYM/5mc6SRiYXiCTtFX1JHqlVxhdnY4Q0a57Kg
	ryFwZ+R1nj0exXsPlnB+QW6LuookaxybGBWD66z3adbQdZc6qp8hEJ9HCXzyvC7PucdsyCoL5Z4Fw
	qpLkYyBK2dDFNaHL1D4G5RoWChEt91zdIPQBhlAGhep6a87HfEGyWiRzHOMDxaXQ6nx5OsAvM1mvI
	XV3tCHA5c3x/qnkO2z5k2UnFRRZXo5eU+O63bltAYYLQlHWEK765BfSDX5iwtSJ1aEhbuKtOmzebF
	lvae9HmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hJ-0000000F1pU-14Cv;
	Tue, 05 May 2026 03:43:49 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hF-0000000F1nk-2I3p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 03:43:47 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g8krZ4bsQz9t4B;
	Tue,  5 May 2026 05:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=58i0RnY+Jdsy5OEWeMVm4nZ6XpDQREbyORZaAY0PL34=;
	b=JwNXfxOZMERuO+0C621+CMUuwFqfO8A79BQdZ1G+l8LNJwfYCgnV25HEh76zUzKrjSQMGU
	FHsg3W24HY4Oh3OLWj7FDi9vpfATha+wftUjQ6n93Yz4zbqwLCivnTVMVB+rNcxzy45VJn
	9a1GGMWED4kDgadmXmyxZznm5bvdiLaNk9W87WL7WTWiG4dzNQWbLKOKpfLJC35us4RO5n
	gs4OdNtUE2Nagp1zzLvFFGnQ/T7s2piGG1iSf22LB6sm6bRXaz0NcmQb0VCfXnnFvrqkzl
	ZOfKc8jvu32Fw+t55cZRq2N3+W3K/HNL59XEnGrbGsjI0+qRz1z3AM7YGZumpA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=AQbTXars;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=58i0RnY+Jdsy5OEWeMVm4nZ6XpDQREbyORZaAY0PL34=;
	b=AQbTXarsdnuMKtn8yaiOdxSGyouTPqFK+wmNGzMY0jCd8aYagjq7pDT1T7BJKzb55ConVs
	TAlj/twToGg5ZEBTNoh+P38bjo5vHV1pI5ZGXBq/Ym6V8Y9QGK58SQKekt5J3xr4FADp5E
	cgf8ojrk1Uw/d51cSOI4snWUO40QZp3BEJmtVDTERYDpI/KtxwuvtPz2Rnsfr8IyRodqKU
	JDhoGY6tkYHJiwoE7CDEuIJs0Aci6siq/4NdjGEwd0ZDTcno7NfRGGYjaHZxXrcOJY/Zzq
	QvNrrOTlEShH1JAZg8HL+wcMuuN1ygWnfm+QnXGqBsfLjzdu6EllbmroufrpZA==
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
Subject: [PATCH 02/11] arm64: dts: renesas: ulcb: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:43 +0200
Message-ID: <20260505034325.167797-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 366d7f534f92bfee719
X-MBO-RS-META: rsd61ar47nca3trozejamjtmjgu9kcog
X-Rspamd-Queue-Id: 4g8krZ4bsQz9t4B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_204345_740729_DFDA3391 
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
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 67fd6a65db897..0b76a0fe2c165 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -163,6 +163,8 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
-- 
2.53.0


