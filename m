Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5906C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 11:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b8Motikz+/X+Nha5DRlA0aqs4LCHAeWCteypUl9PyKQ=; b=dZ9zkrLVVd5y4xE7Lm9ri1wUpw
	kEULmW+HxqZTU1hP+82DW7NYyr5Po8a7lmnGTlMp59Zdb8x3Mk/EpoBiwTvI7DkyTbQGs3SKxLWJr
	Dmrf8jp9qtJe2NpMXmTnydaSL9UwxNE23tfaVLGnytAyl2rj8kfo7l45ygRGIIfU7teuJW/0oSkwE
	GBMG8qrC79PVRdHzKNqcpCU2GLAlgJVqcpGTHGBt58JzH6zXQH0Pfiv8xnaQZevC0dffoG4REOrSL
	v9m6xJU9hBzdJ7K5fsAIQkNkhKIC/J9N/t3aqzwFY3q6L1Fksz33sh/8YRfKiwK5GwFiK/rxoS2L3
	Tdwzs4Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ6nk-00000002FTi-2UlL;
	Sat, 18 Jan 2025 11:15:40 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ6mT-00000002FLN-1hqm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 11:14:22 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4YZvBD4tK9z9t1n;
	Sat, 18 Jan 2025 12:14:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b8Motikz+/X+Nha5DRlA0aqs4LCHAeWCteypUl9PyKQ=;
	b=adIzxWPVl0hwY2ZTFkXacuqBfzFVHK0gnfaAVFkSKBr8DCfhV03GzJ8XJ5PBWelR67orw5
	Jqey7oqQPJ90fwQ2JOSg1rtR12Fq5FAwPcIaqwGOvsE774CYJG/V6dsjr1wQwTQHhywf1T
	+VSK7TTCtVNkBtu0AC9eVdO23j429Qki56t4X52VhToGLfHCG4YX9TF/oC+wXP7aGDOzf1
	2qSmGfBwa2585ZIDN4yyTvAybEd6s4hxvhM27nf2CrWy9kNKl7y1U9Wkks5d/8ONBMeSwn
	zpjfBqrQ1r6LUdCjRyHcmuQ0YFRwpvw6gA3JX77/GV8UR0+js8k1BIyrePUX0A==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b8Motikz+/X+Nha5DRlA0aqs4LCHAeWCteypUl9PyKQ=;
	b=AuuW46MPW5r5/aehtph4vVa5//QpSZqVHE6ISAVtbXfPP8osRxNprilD6QsjUoBYqEceSn
	MfVUjgupsUkIicWNu36XsJ4Krblzblpaa1yFcjcsop1JwN8XxtuRiy+OqCMxx6BDfUrp6Y
	i+PAEgg+ti9WsXW1JDgqTc2ks07Q3ouFnr7n0P4sIfO22Dg3ONybAhMc/Z8Sl/7fgKw/0H
	GMzyoUbKJpXZ5AEmA5kcGhim+MChLEBp9h7YR+TRDD1+D8qHnOXXxiAckfX+eCBlwNHJMU
	NyLLABRyqaazhHkWnQRXuPjq0IoAJ5bbe6KTzsjtfVSh70xtc3+dRGDENSPDwg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: renesas: r8a779f0: Add labels for rswitch ports
Date: Sat, 18 Jan 2025 12:13:08 +0100
Message-ID: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b55d575ec4bd2907d2c
X-MBO-RS-META: gip67yn96u3zt9bcyrwgscr7pk15mehr
X-Rspamd-Queue-Id: 4YZvBD4tK9z9t1n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_031421_588015_0EEA0952 
X-CRM114-Status: GOOD (  10.09  )
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

Introduce labels for each rswitch port in the form 'rswitchportN'.
Those can be used to access rswitch port nodes directly, which is
going to be useful in reducing DT indentation slightly as well as
in DT /aliases node to reference the rswitch ports as ethernetN
interfaces. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 054498e54730b..8d296d0ebdfdc 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -974,15 +974,15 @@ ethernet-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
+				rswitchport0: port@0 {
 					reg = <0>;
 					phys = <&eth_serdes 0>;
 				};
-				port@1 {
+				rswitchport1: port@1 {
 					reg = <1>;
 					phys = <&eth_serdes 1>;
 				};
-				port@2 {
+				rswitchport2: port@2 {
 					reg = <2>;
 					phys = <&eth_serdes 2>;
 				};
-- 
2.45.2


