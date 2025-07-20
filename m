Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AC4C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 19:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T3lOadESAAHh4H6HI80AHcX9AqZoCllRYNj5xpAyhn0=; b=GmxNBUNL7aQlZvYj4h5ybU5P/U
	YFOgs60VHyXwvMt7MT29nMba7FX6AgMxjlQaTg8IyNcn4YxKDjXp1oMvyNns1h0NFHzVf/y6l4woJ
	zlmtmN8y2297vMpwo0bvTRy04IoWAM4TmjwEc432ZpYmEF3Ys2K1rnPGe9JB2t0FHDH3Mhf6S6BD8
	fOHDyRK7Xm4DF9WfJIcn+LBFcESitqL48z7PVZDGwYO+m4qNTOAUEg4+v3JXSxEBvD7IQ4MyA5BtG
	cVbQC1oZn2/cHMjoaQLe8ylphxYG8+U2ctqV7S+26ajiPquh+ZDd+hJuF745rFrLjQzTLHzo7XPyq
	vM6bEmBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udaAr-0000000FgZu-48co;
	Sun, 20 Jul 2025 19:58:17 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uda1E-0000000FfyJ-1coz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 19:48:21 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4blYwq3Jt0z9sQ0;
	Sun, 20 Jul 2025 21:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753040891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T3lOadESAAHh4H6HI80AHcX9AqZoCllRYNj5xpAyhn0=;
	b=YBcYJKot6u3su4O3fSJb8OKwEuTQXWWrgCbvOcFYspuxNDF+0d/3N2oe+u7GfWq58kFg7w
	ZkH/wZWkOkWj2SyJopDE05GM0zlRZyHitH/ZSPO8KveyctPNaw+MPDRiS2DPfQlO7tg4bw
	rA2wCjZu7KCKgxZBQFNiC5mo/mRVteSkNP84hzfBm1rM646j9ArGCgjICIUTNzP1KqlqRJ
	kiswQCTt+v+byfKvuknma8Mlr9zED7t+aS6Q7ngB4NwZS0RH5x2LDyGmNAkkFRZjJ4avFf
	+G6FOh3I6jwqCH3K6yrlDH2UO7xgvPOiZPt9jjYCW2z9EGy5Lraxg7FKxcXFgA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DF02umNP;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753040889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T3lOadESAAHh4H6HI80AHcX9AqZoCllRYNj5xpAyhn0=;
	b=DF02umNPEg9sXSEzfmvPby4B0GTYlEHNPYYaqK1vACGp9wpEzrnmQXHFaAy8sR2AGlvJIU
	vJovo0VHCfQboOY8aZxo0x+SDoS76Mw6zyylE7gkETVz8dqd8OCqaJzZ9owV+l8LxrObGK
	kAqArU27PX7s3O11rLSWXhDHGoHG4HU0NWa23JQeniyj375rG0MdbOVPxEp0DR2969JXv+
	AVKQCVOuCbfa4mhNkmUwCZHlSU0RPRO3ZTJ1qC8owr7vhQWvhjrEaMRIYZja3g68mllCAb
	HC11wvOK2bo5t7AwnEUebzhxp+mWQ8UEiqXec5Z8Ion1tEMCF4FW8swenbaxMw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779g3: Describe generic SPI NOR support on Retronix R-Car V4H Sparrow Hawk board
Date: Sun, 20 Jul 2025 21:47:35 +0200
Message-ID: <20250720194756.413341-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 17fbfd472437da73ad1
X-MBO-RS-META: 1ydpdb5fm69ntrknicfhkpw98gwodaqz
X-Rspamd-Queue-Id: 4blYwq3Jt0z9sQ0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_124820_615748_3BFF42B7 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

Retronix R-Car V4H Sparrow Hawk EVTA1 is populated with Spansion S25FS512S,
EVTB1 is populated with Winbond W77Q51NW. Describe the SPI NOR using generic
"spi-flash" compatible, because both flashes can be auto-detected based on
their built-in IDs.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 900807fbca8b..ebff536afdd3 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -767,7 +767,11 @@ &rpc {
 	status = "okay";
 
 	flash@0 {
-		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		/*
+		 * EVTA1 is populated with Spansion S25fS512S
+		 * EVTB1 is populated with Winbond W77Q51NW
+		 */
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
 		spi-rx-bus-width = <4>;
-- 
2.47.2


