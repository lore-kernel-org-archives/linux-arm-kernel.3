Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE0CFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 03:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHIDLb+i1jfPZrKXryOfk6JpigCT9IGdYyMM3y5DI+s=; b=wcYIqDiPZYij6KWGlnyoagicpW
	D/niBlh9P9TR/2qzkrgdHh1khmio8wxR6qnAuPvwIamDS0N3dC7SewgIBKWUzDQDgc1cGLTkyS3jJ
	4sCnOOhPNUEjgLorW8j77IuUJ9lHuZ2FQe57rS3iIH9GjpllNhltuuEpMXuQNXYtK2CpSPqZZVrqf
	0O+48zHFdRvwMcjnEVUGgV6dzhbXMZ68GfoGD9UfzIqmVc9/wwiHJh2EqiUWldS7egRSFa0aBYoUw
	wr4TXu15oETKXOjGG4MQGliiOzDDa40rHdIboovV2ji9NoQZT3CAEem4P5RprmuO/c8by5EsDqTKa
	e4o5PYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hR-0000000F1uz-2MBK;
	Tue, 05 May 2026 03:43:57 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hO-0000000F1ry-15Mo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 03:43:55 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g8krm23m2z9tgZ;
	Tue,  5 May 2026 05:43:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHIDLb+i1jfPZrKXryOfk6JpigCT9IGdYyMM3y5DI+s=;
	b=Pull76nJe1Lk9Ez4HIqTPra3hdBz49swW8WQWEpkd6bwn7E6SPtRWQgIR7vktVA0jrny0I
	eb/nqeuwPBIw2iM2Ged18Qcf8gN94LmMaV+mqUxzREf7zb8JynHEG4MaemceTCs6qODvaj
	KeLigrLAbLUVAwFv+kEdbCtvo6jdnTrP2ASPqZ45HRVTPgshWxrfM2Tx1NDogFa7xURAxe
	qrEcv5/oJMG+k9k7kzNsxaNo7oIg61m6LaIuP35IrZwmB7Xbr39yFRkfEgvD/iGc//voRo
	vlWUtsL2b3TpNUFD3FtFnoEJ+uYUcFa2E/94n4ld/0U5q4Z97W8ZKhN3hVsUQQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=MUerl1Zx;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHIDLb+i1jfPZrKXryOfk6JpigCT9IGdYyMM3y5DI+s=;
	b=MUerl1Zxa4YzbNVwb28gD/T2RCciNwMXoFscdrnIYPxVrqpZmPZzZ1zggXCNJkjx2RvADq
	ZtVC4N0yW+hrp70dKWPaNAHU6sIyLsIV49Lvl1y214tgY0jDpp1jiqYlvHZrR27za9g5gf
	3j+chdZQw6ENQog8FbT7TB252l7BV7OIkWRdqoo3VbD9gIKv5pwPGT+tmAKnG1rgUrmRnC
	cL4C1YW7RXJx4A1XsgoyXVNL8HhO4tEPIrAxdskCzI4SphZGCaJA8CQSNcmd/2iTT2QNMx
	qDVzKoXBNE4/vtCjZQzTHGyCAbEQR2h78s2Qkj82ZjV+G/jSQY2iBEdFEJh/vg==
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
Subject: [PATCH 06/11] arm64: dts: renesas: v3hsk: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:47 +0200
Message-ID: <20260505034325.167797-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3cdfe458e5e35da172d
X-MBO-RS-META: 3jmdtg7h7rhayz7pqabmgmf7mj9edpar
X-Rspamd-Queue-Id: 4g8krm23m2z9tgZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_204354_442100_80B9C924 
X-CRM114-Status: GOOD (  10.83  )
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
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
index e3725304fed0b..52462e61b7194 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -126,6 +126,8 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupts-extended = <&gpio4 23 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
-- 
2.53.0


