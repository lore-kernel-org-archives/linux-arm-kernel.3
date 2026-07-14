Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8782C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DGJEKw9VaG+3z1g9JwiMW8kaZXLf4gXeTgptvBZpZo=; b=O6TsaKwrj4W85HlUnNITmeRx1Q
	oEAkKQP2GM4ufjYe7sNflHgEs3kgWkw8F3xDBldR4fMw8WbBhQSx8k9eeHSsi58DBHT4opAS4FMSr
	/g1PfB0IilBTfvChRNrFTrZzrmcW/v5kbakvuPp8AhM+TPQgPZ/dSkFEbpSl9v/ek7/FZOPYvq/nx
	bUQFJxvLoKZIdIRIDSipTw2zvR7nR+Ra09acOyd7yk8TpheRw8HbHOlCZyQjIcmcHTiZe2REMCDzA
	Nhxt6jPT3cOfpT8c4i7j1W9QCW7NMTdB2jduc5Wnqp02nplW7Yy0bOnDX5dx0gwBsWaOEiMtr2mQ8
	oZHvD4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcol-0000000C56v-2vgI;
	Tue, 14 Jul 2026 13:04:59 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcod-0000000C4zD-2r6G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:04:53 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gzzzk01QXz8v6c;
	Tue, 14 Jul 2026 15:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0DGJEKw9VaG+3z1g9JwiMW8kaZXLf4gXeTgptvBZpZo=;
	b=Q/+tORc+/JDT0iyIZel/LL47niIPggpnS4D5jD8zZ0BPkHyoNawk2vihbk+ejvt/BDgCBK
	Rfvr4r7jXDjcscSeo/0DFJ/OkhgqMpNVqdwMlCDZI8MXJzuPuBr3PDnETsWfecwAWW3ejc
	OC9ZcAuAvmEZaVnYjSQiQ77Eo4gn5TKVREXdw0DEn7h96N9qmHF4EAkhHBBInJsdBMxBlP
	wgM5rMqCMA60m0aC+tNsSmipzetXg+MgCEAhDFnFkwysgtUyCLx+VyVAgsx6WYVE4Gp8kU
	Becsm4LmSAl+VgVvHCIIN5g/u/SBfXXEM5W9fAfr5S4niNcL04ZzMfuPD24yjA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=WHGKxFIz;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0DGJEKw9VaG+3z1g9JwiMW8kaZXLf4gXeTgptvBZpZo=;
	b=WHGKxFIzu0/ZVmK/7nPOnGJMnmTVPSkF5cl5WmIe9Ru/vf7xSqHfMttxZC3SWvjmOl97b0
	iRLO+Ef7YJkwJIgKa3g2ZUJfnwa7if02yli/Nndv5FNTxLoWWZhxRvgWozvz0aL26fHYGL
	WuTGdmL1CMbAVL+4EWvrM1gMa+TJh6mMn1aZynX1sIHEJYFeWqVjMliWPdw2MYCvZb8UBS
	3WIwEDXqxovZlyuRDM6GO2a6yGysLzpiDvaS/bk1TnBYY9mYZOuroJpfYxKE0Z2VT6Jx58
	0m+ih7LAx88Kb0YVYd4N9OIXZeNx+MqdpyK2MTgkt7jCeEBD8EXrxMrY+Jc6Bw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 6/9] arm: dts: renesas: alt: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:59 +0200
Message-ID: <20260714130429.11214-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 516207bc378c7fb9767
X-MBO-RS-META: xs1kgba3h36krkx8ka7rwa19g5s4b7y8
X-Rspamd-Queue-Id: 4gzzzk01QXz8v6c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060451_875337_46DEB066 
X-CRM114-Status: GOOD (  10.77  )
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
 arch/arm/boot/dts/renesas/r8a7794-alt.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7794-alt.dts b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
index 5d6d0d8cc4dd8..92bc4ec4f854f 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
@@ -380,12 +380,14 @@ &ether {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
 &mmcif0 {
 	pinctrl-0 = <&mmcif0_pins>;
 	pinctrl-names = "default";
-- 
2.53.0


