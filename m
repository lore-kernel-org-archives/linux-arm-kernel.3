Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E55CC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 11:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WM1F0yTIN5cpPxOhrbZdFGHhmihUiPTtOsGIJfZowNs=; b=YBPo0YMRZpxYaxaMLObK2HwMnF
	1zB7y27m4ccPbM2WxZ3b7baRnzMJZCoJFLeIebrgCjnLI0NMwyyEudPc6pU7D312J4gtF+8K0hFYy
	DnvHVXKqSM/Q9NX5bskMf+OMH4J74MSKHTYxwUXkv4p1h/OjdXr+dPpj4neVgeOGgnwfZ9opoqaVx
	SyEiSbPLBwhc9pj4glXl1TdvJdU2pEl7B5NTb+DDTFIlDWqG4SPpk+6GtDftghGlXxFBj2Rxa/euB
	gXigPc/by/cg4+4E1aO4Fh537oi23GxM5r9iL81mSshP8jH/LL29Y01BFe+yIMCGbSsRAH8S77Er9
	zofRb/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyfJ-00000008zLc-1SNY;
	Mon, 19 May 2025 11:28:17 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyYW-00000008yZZ-3s1w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 11:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=WM1F0yTIN5cpPxOhrbZdFGHhmihUiPTtOsGIJfZowNs=; b=NAER0l
	U/bqcYMG96MRbiB0tKjS2qjoHtzZyv74kYZPdkgu/A/ySME7o6pzkX9k8cgc1mS1
	/C04Gdn4A+DSK0AYe3nDWXNLegmoRTRDmXBx6870BoiKZZZCMjbjjlhVPO8EZ3P+
	7jaL6HEvtFEu3+1VINnGe7ECPA2AySgwJ8XG5OKlTHv3F25T8jDrGscMCpXX2fM+
	MozgVqHwnd2TDK5HxnkXOLQMnRsEZyOUZgfKhkzXBxAPK8Pspljx3QtyIb7hd7+3
	nS2G3X5pKEa17FgRT+EL2TMSjDuxiRV9pVa0TAbnSmwuUWm6wUxGXvbxcspIZ856
	F022ZIDY9UZN6xmQ==
Received: (qmail 2456870 invoked from network); 19 May 2025 13:21:13 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 13:21:13 +0200
X-UD-Smtp-Session: l3s3148p1@rQ9VVHs1+N1Zz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] ARM: dts: marvell: kirkwood: use recent scl/sda gpio bindings
Date: Mon, 19 May 2025 13:21:04 +0200
Message-ID: <20250519112107.2980-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519112107.2980-1-wsa+renesas@sang-engineering.com>
References: <20250519112107.2980-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_042117_233723_C55296FD 
X-CRM114-Status: GOOD (  10.23  )
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

We have dedictaded bindings for scl/sda nowadays. Switch away from the
deprecated plain 'gpios' property.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/marvell/kirkwood-km_common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/kirkwood-km_common.dtsi b/arch/arm/boot/dts/marvell/kirkwood-km_common.dtsi
index 52baffe45f12..259cb3d5f16d 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-km_common.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-km_common.dtsi
@@ -27,8 +27,8 @@ serial@12000 {
 
 	i2c {
 		compatible = "i2c-gpio";
-		gpios = < &gpio0 8 GPIO_ACTIVE_HIGH		/* sda */
-			  &gpio0 9 GPIO_ACTIVE_HIGH>;		/* scl */
+		sda-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
 	};
 };
-- 
2.47.2


