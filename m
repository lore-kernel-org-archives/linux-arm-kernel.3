Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7723BCD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 03:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7X9VCLXHjxXWTlqd62nzcy4IVpyAqSSzi15Gd5cgAK4=; b=HWsjLAdDJi6WB4Dx7v32+85DH5
	tP9n9mbg66JXuZST9YurQvL3CnaqfWeJ6V3CLNGrNADdwnrYngVO6uQF95lLXy7Tr7aqoQHJJJ5mP
	ZJaCLmKMs1rHK344PuQHGV7819dT3Q42d2m7riCGVx3YwZDAcmPzdSr81mKybENYka9VwSHsdiW/s
	8eViJ1Ya37Nj3hijd+aUVqJoAeaG4CFZ/rbFF6lQ3BUhUkhV5lOD1zvTwScY4v/yS8a/qN70xU8WJ
	dOLBjNJoio0QKjZ0T/i5vLegGgsuuXTTxsIBk9/gZJZwBxfLzyKWPQklsyYSkVrFJjsQwn+QJWBwA
	+BCnR4mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hJ-0000000F1q1-2HCj;
	Tue, 05 May 2026 03:43:49 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hF-0000000F1ne-14GX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 03:43:47 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g8krX4RYcz9twr;
	Tue,  5 May 2026 05:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7X9VCLXHjxXWTlqd62nzcy4IVpyAqSSzi15Gd5cgAK4=;
	b=X2V+N+1VrbovAq3B6wZLnRvRFMVxqf1/O4H0Fu0QGBuIGm4XJfqQ4MjvqBY1zY54bO39QP
	Yu4zaVxIFj4KoPhZ3xSBcyXzYEj3TKvsKUQcxPd76G/oVaFFI+5RUcrz7cQKTxdxgFXXxH
	Ag6YxYjNLD2UXnyFDElUHMzwBEY9V4nikOgQd40SAcGjZLzvlHHR591U1PQlBDLBSeGZSu
	NZXDlORs58fznhhsx8xEZfSfkTeB5SAyFHaR84fC9xByfkUg/HOkI9zC/Z22eu73EQlDpJ
	kNuCcnAgjGVUFbcC8FbAj5xMOV8v8kQTMfAfZbmXFZgBdz2hZCnfBfEX43SGWQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=PxFAlCXa;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7X9VCLXHjxXWTlqd62nzcy4IVpyAqSSzi15Gd5cgAK4=;
	b=PxFAlCXaaBj7mAvC4xoPvft/cv1BLNRYZ3ZaSyMQjH5SdabOthbaJlqRuHXieKDpt5f+3A
	8LHGbpHBPRJy+c7dwKCJETVDO/Lnqjut7KdS58I0+Zm195xLkZ+g2uKOyPmC/6SGpE1D2P
	D+cTrSR1Mh51TDqdn5e7GGMaKPRlAO/epY+y4XrzB53DF9EXTyWBPB8gSmc6wYILdTAmBD
	F8EOO44AVlyl/UrVD9Y3WsNRs/TSAYeesxr+oV+f7wQjIJlxOkjWdLMwWfa90fr0x9uNqm
	eaDaONdX16COGEiQeBHGDm6yya/+rZtKG2NB4HuN1s/cOTio5+jke4tvcDTKEQ==
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
Subject: [PATCH 01/11] arm64: dts: renesas: salvator-common: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:42 +0200
Message-ID: <20260505034325.167797-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: arb1xrp3dfgd1mb3e3hhu3c8xycct6ue
X-MBO-RS-ID: c9ed13ad1323de76c38
X-Rspamd-Queue-Id: 4g8krX4RYcz9twr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_204345_444977_1CCCB786 
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
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index e505161caa675..6c97d186fac22 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -361,6 +361,8 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
-- 
2.53.0


