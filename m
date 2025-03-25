Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0F1C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 12:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgHm99vQLnC3l+PaIOvp8HpQsfYyteeTPS/neTnwgPg=; b=dUZtfZqN7EPvUfvVKVyBNz1fGM
	jf/Y0aiBmudruVcwRkyPDuZQVt/BqMAZWU4o0YhAS2E5aUUKDoknRR2aTrsSC8bLiLgXyiB11St3u
	sn62i3lL6PR3LQ1rxMNADSvkCd8QZiSCUjcwcTxzwEK7yQWk1rHIdY5YSTeFcyChX1qSW9HCNuhQp
	S1ZGt8svPTP0gVOwe8aTUnJJr0EdNQgngQb/iqCxFaGQjsYl68OW45+NZK6T0fIC6j2pMZZWhY4kp
	lYFLpVs0qOzRPojrUjm9K6+ElqppRwb0iQIO1UMVyAC9DyCIyRJm6bLYUDlSCeOwnFDVwjrYe/nl0
	LcWfrnTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx323-00000005jw1-2RNo;
	Tue, 25 Mar 2025 12:05:23 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2vG-00000005iEf-2r4o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 11:58:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6918C102EB802;
	Tue, 25 Mar 2025 12:58:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742903900; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=NgHm99vQLnC3l+PaIOvp8HpQsfYyteeTPS/neTnwgPg=;
	b=fRl1iL5N86NB0V3k2iW8G3UZ0S70ZOKBdrgIhZIK81UK0B8ygdiReNfwNgvWZ08lZvsi0/
	NQkY6TKhqjdHMw6tZPjGNJxcSmvE2aJsSic4cQVFyoAHysvOw4gKgTwZgAVRJ4AJTMoVWW
	s3xcTURf2ntfgNlAMZ4VvlCRlZ++g7hDJYAI17OBzXYjXw5padR0lgU4RCK0q10s5Y+Hp+
	Tv8wtmj3BNPotlVVj6Qu8AmPcS8oLScHleTqAr1fBCcz0eLwK/N0DjSACMCrf6xFCphZVQ
	IO+RNdr4fj2y6L82njSgGOqHORV0rUxcV5Rv/cM2jT1PvjG+4wocNu03YL5dCw==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	davem@davemloft.net,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH 3/5] arm: dts: Adjust the 'reg' range for imx287 L2 switch description
Date: Tue, 25 Mar 2025 12:57:34 +0100
Message-Id: <20250325115736.1732721-4-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325115736.1732721-1-lukma@denx.de>
References: <20250325115736.1732721-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_045822_861659_48B70E37 
X-CRM114-Status: GOOD (  11.70  )
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

The current range of 'reg' property is too small to allow full control
of the L2 switch on imx287.

As this IP block also uses ENET-MAC blocks for its operation, the address
range for it must be included as well.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..8f2aa32208cf 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -1321,8 +1321,8 @@ mac1: ethernet@800f4000 {
 			status = "disabled";
 		};
 
-		eth_switch: switch@800f8000 {
-			reg = <0x800f8000 0x8000>;
+		eth_switch: switch@800f0000 {
+			reg = <0x800f0000 0x20000>;
 			status = "disabled";
 		};
 	};
-- 
2.39.5


