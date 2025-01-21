Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B181C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNv0bdqgihLs+3dJEXQ4VCvcN709eYzEDKFFDKkKou8=; b=urG5yyKBayVuKYpaXGHLguglk/
	xMlFjRSs1f/c/MbtMGMiGgZfTMY7LfBQZ1/5hYxG8oxpDibijScUoVpPfEXOtWRuKSEbidy106bYx
	zkQdil7px32AdQ0cLNjZUGo5q6iNucczdPYHpJdksbVluBTSC6IeY947YrMJYEKd+wI0jFKfsAQQK
	JFqNfZ7XymGlI1yPI+c3ENUHgAAj63JtP0PxJzFb9yZkTgXj1S4w4VdWxDGhL99jC8J4Xa/Soal48
	F9fqtj0rF+UbNqp4MBGBsfR7CX9SwYaDlmhirCDIzksIegkxtsZ8QkxJ29jVUDnU1gVtH6W/K7hER
	Y+lLlhYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBc9-00000007bpi-1qHW;
	Tue, 21 Jan 2025 10:36:09 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBX9-00000007aJ6-1bcR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 10:31:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737455459; x=1768991459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CNv0bdqgihLs+3dJEXQ4VCvcN709eYzEDKFFDKkKou8=;
  b=fWf9+gPe7M4tfPzEyY47b1TJw9SpIWcOY27m1t56wdZuXq8GSN73BHCK
   zT1lR7fECWvyKJEWFAFYBMC2roI43lZ6Cybvp2IbWW+uI1RWU3su/OuvH
   CUIv9Z+kaLD/5GrUr+cLJ+oeFWJoeaAHpXX0Sur4tCsQ4r004/nMAtI4I
   ex5mz5J4TcXKUlYRQCF50DLufn8OKE21FDvK99nHjySIC2J61dnGh/Foq
   Dd1BldYEud19GryFGRDSXkP/yQ4EzbBSlqbmXJztQUbIl0RazxPh/VLyb
   ZvcZKH5Sfd+Tw3U7m61I2uSgzID6atbeuaWHQFuWCI9G4e4x3dsv7ys6K
   g==;
X-CSE-ConnectionGUID: h9VXRqlFRHesILkkOxDk8Q==
X-CSE-MsgGUID: CqtNUPzRTbW4lB+l/ZkQ2Q==
X-IronPort-AV: E=Sophos;i="6.13,221,1732575600"; 
   d="scan'208";a="41196383"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Jan 2025 11:30:58 +0100
X-CheckPoint: {678F7762-26-1CE016C0-E589DA3E}
X-MAIL-CPID: 84DD640C611EC28B46A80462C05FC8C6_1
X-Control-Analysis: str=0001.0A682F1A.678F7762.00AE,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 953E2163990;
	Tue, 21 Jan 2025 11:30:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737455454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNv0bdqgihLs+3dJEXQ4VCvcN709eYzEDKFFDKkKou8=;
	b=pvi5DQ2Q+5w7jwkfUCTZ6vu0Kj3nmluWqQ0JcSWpi/oPA7b4t8DNg9mEp/rrThjEgbej9F
	rSbPWQDiiBHBsN63F8NHL4Huqz6qtGwiUIpelDNKKXXTDqAEW0LRXwapmamlPF1Rc7F/L8
	ocLVNKK2NbwTUdRq5vAyFtKvhqgBhdmUsIpsXWehcrgrZ8bkFocU4FqcivzwO9NtJyTwfi
	4DvWZVCQANMBA002HbizP7vMG+t76CZ5q0G7mpseBelRsdFep/rBTYckwhUmcnMftEVJAZ
	3ZZYVKZ2aogeWvgM9SWr45aKJGW/bi6QwyYIn/QeI7q9N1zLuTYBVJQKrlXUxA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: freescale: tqma8mqnl: Add vcc-supply for spi-nor
Date: Tue, 21 Jan 2025 11:30:25 +0100
Message-Id: <20250121103026.1404856-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
References: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_023059_754266_6177CF30 
X-CRM114-Status: GOOD (  10.18  )
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

(Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
index d9c7fbc16b855..1d23814e11cd3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
@@ -67,6 +67,7 @@ flash0: flash@0 {
 		spi-max-frequency = <84000000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
+		vcc-supply = <&buck5_reg>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.34.1


