Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D6FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2wfK8JSekgLRRiuf/K6EQ8zzuugkmdh+qH0iDGf9K0=; b=gFZWKAnZUbTcLBW8NfqpRAb1Xo
	6X93xRokEGqyKfanmPrKOOZzC/W3dz5KKmh3qvrs6A7+cx5/iqV4TRpTbD2TgSPvMBsGVLq7oLIoQ
	HFIQBSLfL2rPZWuTg/G/etOnKGpHiB8MPoEx5cMZ3WTzdQkZUgk+tkkMkfQjFFAD9mNDGZswPvA9p
	AaVlEhpr0a02mTybkHWkUvCBqAPeHJh/YPBDCt4e74VkezhtMoDwsXLS0OEeo1Y7meWrxvWHGgr1s
	dvGxdFOrrwS9JmgOYQeVwiCY5xiuvSYh+nyt4zMWBi1MhpEUBkxUS92zcOO6SoKX7o5zYz+nk8ut0
	4E3BwK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcp2-0000000C5Mc-1VLa;
	Tue, 14 Jul 2026 13:05:16 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcok-0000000C54S-2Vco
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:05:00 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gzzzr3fwgzKmyK;
	Tue, 14 Jul 2026 15:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2wfK8JSekgLRRiuf/K6EQ8zzuugkmdh+qH0iDGf9K0=;
	b=QKVPOvc7XATX0TgWPP7fg+a/GRwt5ke/O2RAWHOYxX+202HFXu4TVCrQlXnoHjVm+e30bX
	s4PpBYbF/ThQLseE15m6CUPhpWRnIL6pcaw0aKmCcQXwnyVliZ3JWlmWxdvYU+oVqeFcSN
	Nrk0DrXRxJNENVbJbQQUxiIsTy3jp4KvIsPIA1UX+itHkoYcqLXjMqg41LKNBpiMNjqdOC
	necacqxRbQKpdJG0nQ5JKqzstJnI4qcr+1f9SM0cb6iG0iRR95VQB9ISnUIria7YLGV4p2
	Hkma9wOBAbyvb2vqJKZMlwDxXCnRzEeEWko8+IR94b50FGveHmOuyoKYK4S9lQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=O573BQ2e;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2wfK8JSekgLRRiuf/K6EQ8zzuugkmdh+qH0iDGf9K0=;
	b=O573BQ2eU7zfrj+sqb3IKUmdl16xJ2OHFc+P7Eawajxtu7tVsprQoBOlkv/T+CHTYVecGo
	hWkozd2ilBQT2PtFoEGZ5opi394w3g4THN3iOMX7c8Cr83kPiZx4ZP+o0FF25wi9yJKhaj
	LRi9YU4Jdu6pjYytwdYGptgNcx+Hdt9zTpAKp8dgQjJDOB4jbDgAgAK1nEsDDUEYNtAdWS
	VLe9oVXUe0/z6rmmj1QZ74xk7O+L9UNv93Sbp6rOLbed0ZsSpTvu+Fgazw1tqdQ1EuRhs4
	jA/0R2PTkBbc7pzloOxP5bAtL7ELPoaO/c2O9im99kZfELtQEyv90Q7YmFIGaw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 9/9] arm: dts: renesas: sk-rzg1e: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:04:02 +0200
Message-ID: <20260714130429.11214-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6b610f2587ac1bd8da2
X-MBO-RS-META: mi95c6jdhh1x9qahzzdr8rzj94gbd7r4
X-Rspamd-Queue-Id: 4gzzzr3fwgzKmyK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060458_790702_C73973A8 
X-CRM114-Status: GOOD (  10.75  )
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
 arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts b/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
index 42e82f0697553..26ee1eec521be 100644
--- a/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
+++ b/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
@@ -67,8 +67,10 @@ &ether {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc 8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
-- 
2.53.0


