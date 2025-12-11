Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85F7D3E786
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgrHDw2+1vxkomBSkN6qpychebIEg4g+gGr8/vvCI1Y=; b=TOPwfCvnLtzUkB0gLdQuFSYdmP
	1zXXiTIF57KGWZpQPEcFu8EOqJt3iFGW/rnKxdG7KWF7g6s1q0m2ZW5WGxtHJKrs9MVBMxVO+02a5
	1v/9u7vZZMNIavjonVDQFMlBOUxoQC910KXrFHKNoDk+n5mCfanO+R4fVi7WARk2k/Ljt6tw9fjkE
	NSslod7/U6mVKtf4UYFKsC1YywbLdNuumulFuqaBu6KzVq/9caBvdm3B53O76FMKTFAIYTyySb6+U
	Q1hCnLXcMMez0V2T2Wf5xsK6EFT1fUsJaqluWUbKhoR8PI6Vb96p97dVyctzjXjCT+FnUTvPa95vt
	wXJBhB/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKQ-0000000GOtU-23R0;
	Thu, 11 Dec 2025 08:47:14 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKN-0000000GOqA-3ggI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442830;
	bh=QgrHDw2+1vxkomBSkN6qpychebIEg4g+gGr8/vvCI1Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ORolPD+lNijN6SbxVyOiH5cJlcepdpMKA94aBXhai5xR8KzOe/a5aWs+SSlO+UGt5
	 JQnbglvjce0z3jI770cy0oO4Q+YU2ze1O9MBqJW8+6g8FPAec1Jx8Akd0feqREU0xj
	 8Yu3HJSBSh+mDPELPzwBjO2xEZrngqzCpDmiETlkVxZxAHRW+X3VFPXxicFf0GnBYX
	 zfc5NMRh7pxU+wfdrDymAVGM4OVnd6GVcJee+tqmxAW8Qlmlv/qB2YKdfH8NRpNVP4
	 1rkMu4ZfsFzZZPNl4eQvexVUNemUemdoJrIxCrBXF2f0NT7wqzf3HC/FUuZEpXMVbu
	 iyiDKfemDBe1g==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1669D7D6BB;
	Thu, 11 Dec 2025 16:47:04 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:50 +0900
Subject: [PATCH RFC 08/16] ARM: dts: aspeed: Use specified wp-inverted
 property for AST2600 EVB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-8-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-iio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_004712_122899_401166D4 
X-CRM114-Status: UNSURE (   9.61  )
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

While sdhci-pltfm supports sdhci,wp-inverted, it also supports
the un-prefixed and specified wp-inverted property. Switch the EVB
devicetree to use the specified property to remove warnings when
checking the DTB.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
index 3eba676e57f1..c51977dcb56b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
@@ -315,7 +315,7 @@ &sdhci0 {
 	bus-width = <4>;
 	max-frequency = <100000000>;
 	sdhci-caps-mask = <0x7 0x0>;
-	sdhci,wp-inverted;
+	wp-inverted;
 	vmmc-supply = <&vcc_sdhci0>;
 	vqmmc-supply = <&vccq_sdhci0>;
 	clk-phase-sd-hs = <7>, <200>;
@@ -326,7 +326,7 @@ &sdhci1 {
 	bus-width = <4>;
 	max-frequency = <100000000>;
 	sdhci-caps-mask = <0x7 0x0>;
-	sdhci,wp-inverted;
+	wp-inverted;
 	vmmc-supply = <&vcc_sdhci1>;
 	vqmmc-supply = <&vccq_sdhci1>;
 	clk-phase-sd-hs = <7>, <200>;

-- 
2.47.3


