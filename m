Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EECC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 00:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bwZHfv7bs22p4Cd8SYFjyk554kcj5vyp15h3G865eEE=; b=F+u9cvj0mTVRknXdUV0wYGC557
	hDXUhbZaALCcNUfAbN0UuurIQ5LIP5jLq49MEG7GL59l2yxaLamMPewZO+GeozBQPpKwGmxrAocMt
	GJKjIgoxaZd9ZDAbMJpihtOp0oMc0rvZQgi6/Ayc03/QsDF9p4zfr2rhyrQ43vQgkAmoPfc2enEQA
	IHmzZzCnJ9BVvxdx1IeAeAoY0twFAU/x218aHqfzVrogb/s2DNs/3rFdjFWhQPKq0C98P5cH9+twS
	2DF9evdBHACG6Mpa1Qw2mMgv1/PqRKX37lwF9B1r2nus7LcoV0z9sFUk2Q5J1wdYBHC1Ai38iMjio
	S1L7C2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugBJg-0000000DMXm-2jLU;
	Mon, 28 Jul 2025 00:02:08 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugBH8-0000000DMOV-1oAn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 23:59:31 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bqz9Q4SzKz9ts4;
	Mon, 28 Jul 2025 01:59:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753660762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bwZHfv7bs22p4Cd8SYFjyk554kcj5vyp15h3G865eEE=;
	b=TKyVpY3e0Ezo05THuHsVjXU/1Au1XHtzYyy/wpZ0vjU5HHtZMPHsgcnRvTMGYUCvwMU9Vy
	3Lodl3zuCTP7gZUlRX8hLhWBPpnIm1KRAhYKMjLJ01r0rJ1W/K8iyk3wZDPfnyLpuOoD0V
	ruVZVwmEdKwoAmuPQ7wPuaayJciWv9SAgEtrAX4dLxpjLGqM/tmq3HGwwKEXSVO+2d5vQ2
	fv/3cgxo/TJR+o36U0Kq/XqO+2Endcs6KECE8aVq+GIs/5gtu61qRb/mpF26+ChpnPtYtG
	Kf5p0DoZTmmtyvCUUyyvH1RL1gtxQlSS8GsUp986ZrJKXY8LhaF1RHoxtlXXCA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753660760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bwZHfv7bs22p4Cd8SYFjyk554kcj5vyp15h3G865eEE=;
	b=lAXQlp/wAco/VJfFAoj+xA+R2PIFhVSiVLS6QLzNGqTZ0k6bHhJJ4ckiBPB9EFuBnsHz4Z
	VScNwsGsxNNspa1qFNve6jK1HJ+FzMXtWUq8d7GvSS+8d3WBzmerqo+8nixKATqVWuhe/Z
	X6gdlU4JmHh3BivobECsCg2XS23EaIMfve8mBJqO3aU+X/mTaRVcUGHdt5xCIIoUxLJ+Xf
	HFvHpZTcicSwLOj+yxT8jx4Dj+JKx3q2OHN0V+ebnDq0xHtP6/c0f8Oszg99L76jy6kSU3
	hf3hasTzLOLKz/vChpcAZx6cTnjpnt8oXMczU+7TSZ0dKwO0xAz8aAGsltks8Q==
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
Subject: [PATCH] arm64: dts: renesas: r8a779g3: Invert microSD voltage selector on Retronix R-Car V4H Sparrow Hawk EVTB1
Date: Mon, 28 Jul 2025 01:58:11 +0200
Message-ID: <20250727235905.290427-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c9c00573611d0c9b9cd
X-MBO-RS-META: ks969f3mpqpgnwzwryfpo3os8kbkwktd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_165930_652380_E5B75223 
X-CRM114-Status: GOOD (  10.62  )
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

Invert the polarity of microSD voltage selector on Retronix R-Car V4H
Sparrow Hawk board. The voltage selector was not populated on prototype
EVTA1 boards, and is implemented slightly different on EVTB1 boards. As
the EVTA1 boards are from a limited run and generally not available,
update the DT to make it compatible with EVTB1 microSD voltage selector.

Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
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
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index dfbf2ce7e23a..9d702b74c288 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -194,7 +194,7 @@ vcc_sdhi: regulator-vcc-sdhi {
 		regulator-max-microvolt = <3300000>;
 		gpios = <&gpio8 13 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 0>, <1800000 1>;
+		states = <1800000 0>, <3300000 1>;
 	};
 };
 
-- 
2.47.2


