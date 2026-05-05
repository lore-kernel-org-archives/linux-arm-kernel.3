Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D82CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 03:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/W3WIxgiIre34DOdHyKWuUPtLKlUjwAROtJmGpAoj6U=; b=yFFP4vqNLjD0sPzRZRZbNIhK6n
	vPKQPPGSPe0cqh+jzUKGxj0yTfN6a6K1l5CnWOvis9cQON3YQeC6vC6E8VVEJqZ0DJL8HHGAIOA3n
	7Sdch3geCKjbcFG9td/tL7/cjZbwHLtTC1Y/Lr3n9Dge0Vw5/JPzpQOyyDuQ6Oyz7Qb8V84s4ELnv
	5/Sn8I5wJULOSnlucSK4sUHwDq7g7JiZE+bNrDnJLvIw3xXlkPPzQqZTMAJRP8NWq89zeFcehyxz+
	8XRWHNFu5SyRnAvvu37Kt+EtxBCG6NMoMhskaL4ts0oJ9fEPTJ9h1GOVLgC6opHGjJn/OOcWTLbI2
	e5Csaj5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hV-0000000F1xI-2kIP;
	Tue, 05 May 2026 03:44:01 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hS-0000000F1uy-2SUn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 03:44:00 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g8krs0QG5z9th7;
	Tue,  5 May 2026 05:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/W3WIxgiIre34DOdHyKWuUPtLKlUjwAROtJmGpAoj6U=;
	b=ST8hI8hwbJInDwfAHHMwIW5gzZgqJ22Jvs7yDMsXSNVq4YKDJEucNVctKQEGtFQBpBrzlz
	rnDdJv895gFex1HVpm9sO8pNIboI//EvI+B2X31BvhCqQCPFSMZKfo+XuykTokdFSOJmMD
	w+Ik+kRAPWo6hthG6a0DHrJmxzXd4YlTwCgG2+JO1pOYSXYdx99DhLjv8glZPa3JPGZaA9
	3ld2ZEXufXlt+GY9nJKGTkaAYWi5tnRZzXb7q1ZIRl35K3SLJeaQKWQptUA8wqpm8jXYqh
	T+A4mL/+3NzaMZrA84523pnUUZz67/D2enKU0okJgCc34otAlvyvGY6bIUJW5w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=E2a1A1JL;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/W3WIxgiIre34DOdHyKWuUPtLKlUjwAROtJmGpAoj6U=;
	b=E2a1A1JLFQ8YP6JQKsnkw8V0SCsaaoTZQgNdeSeDfQJ3rOhkNmNBV5jLg43Mwi6lQMgbLG
	/EsdA97SSw2M+aWo3ZdP+lhl32YSSL24KMaQ2B2g7KfpRah6gMIs03a5bf+Kh4nMmB8CPr
	I4FTNdEJcd4ew6+XXThf+wwUhyPJU1zCT2CF+mnoX1z6ydjMoKEMvFl1ZABLfuZkgCvroU
	GETZ1Om5DpF1Tt5jFQ+QNydyWlhxNd3rapFD4mmPHZHNkIYKS4NRYi6ysa0aebCr5DmY2+
	/5er2fopODAwNQgq6qM3qW/Y9tk9lpHEXqDfhRlUPwehkf/OUgnvsnaA6lrDdw==
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
Subject: [PATCH 08/11] arm64: dts: renesas: draak: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:49 +0200
Message-ID: <20260505034325.167797-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: q5z68dduynyb75rct9d38gzc5zaxy3uf
X-MBO-RS-ID: f68902710217a6e3f45
X-Rspamd-Queue-Id: 4g8krs0QG5z9th7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_204358_766611_3F8E1AD0 
X-CRM114-Status: GOOD (  10.95  )
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
 arch/arm64/boot/dts/renesas/draak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index c83c97d991133..80f0d83dd6766 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -249,6 +249,8 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupts-extended = <&gpio5 19 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio5 18 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 		/*
 		 * TX clock internal delay mode is required for reliable
 		 * 1Gbps communication using the KSZ9031RNX phy present on
-- 
2.53.0


