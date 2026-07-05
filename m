Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15C4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 12:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wz4aJVJnm03NmMAAn4VkW1gKrEfbr09NM4rUeKWhQuI=; b=M9/P7HlD+Fbmyk4GF0Fl7CgnXJ
	Ze6CMYL26fkMfqwGlvPOvdI1pFF16y1q3DJ+6h3g2gTzfMYGRo7uRebfHtgGXmjNmeTPgEfJJc3wA
	0/7ULjMx1f3owtxvi2i1u7hNvUPGJuBu+BfjkndbJELbucv6ZQGJBYaUiXO2PyEJpeGzlIiewycTY
	Bk14foCmaK+1YvEho2PEhCF56eRt+aErw6f/eBhApWyyT04lHjN+NrBD/FQagTEpEC14FcheOHyYW
	bVrtkofJ9uiS9fNY+qd5QVOAOle6BTNsUby7CyJKJ6N99h+d1YpGQ23iLAN9lEeddksh+shfuZxuO
	HIWFbzCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgMLw-00000009JMD-1n9e;
	Sun, 05 Jul 2026 12:53:44 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgMLu-00000009JLl-0h4O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 12:53:43 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gtS8v0dlpz9ttN;
	Sun,  5 Jul 2026 14:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783256015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wz4aJVJnm03NmMAAn4VkW1gKrEfbr09NM4rUeKWhQuI=;
	b=HkyBt8GEUigNtYGx6Kz76fT31Q/i00IxuN97Ba/amJhBbRD7umdCMp8M9VQk1RNcR+Ek0B
	Ng2DrdPyslID+ksmOfHfRJXT8UTEwmplHHYNGMebeZYmRlQCBDM0jWjam2MuIHTJI4Y77c
	Z6SGg+B4YcfPNpg8ZbMC5WedEOpsPct5c1vLIEy7Y6KhSH3KoN3TmvrkqyHgsZnzHG9nbK
	y7kc7dn775jLiKYx5D7ZYQDhj38mTGdddGOKx4IOI7YYTonzrlUdMfmQahdu0xaZPzbrty
	cjVldQdIbaf/6kY70UQ3+VR9zRlkLd17hkcIkKjAGfacDW6dJpebKAtEzz+h0g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783256013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wz4aJVJnm03NmMAAn4VkW1gKrEfbr09NM4rUeKWhQuI=;
	b=yb6Gz8HzZ4qBR8B8XAh8DqJSK+H6pMi8Oth+TdB5DelXAbIaTsG2kwo2qlpszBF4DGrwsD
	FRCEFeYkNKB2dAdev2GSr/NE5c9y04aa7axnycOWWb1bl1hk9Gn96zaa6aSq/XRtR1Hi5x
	oob95xfTkCkE6ceZEnIkYqBM9UVFW/ezLD7jX1lPy/qk2rL/klp9NwIVXE1s6HzUCIEooH
	Y3XuB+sQtstK2OCF8/jfyuRRjQxblZe2UETsBTdkdsVBDE6lObJvdOv1aTNdrarQ910L8e
	LB7hwN5QTR0hOiw/bft+SeIPexbI+Y0k7ttFLZXVSyRK7U0s3+PSAS+L/81uew==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: Always enable edge connector I2C busses
Date: Sun,  5 Jul 2026 14:52:46 +0200
Message-ID: <20260705125324.13519-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: kyf8qh67uftqszxe71j5suhbdm8fs1bz
X-MBO-RS-ID: 88e8264257d96620000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_055342_364604_3EA0F1C4 
X-CRM114-Status: GOOD (  10.72  )
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

The interfaces on the edge connector of Retronix R-Car V4H Sparrow Hawk
board may be controlled from userspace using matching userspace tooling
that includes e.g. i2c-tools. Enable the edge connector I2C busses I2C3
and I2C4 to allow userspace applications to use those busses and access
peripherals attached to those busses.

Co-developed-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
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
 .../boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso     | 1 -
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts           | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
index c730ef39c7d7d..6f10310140b9b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
@@ -41,7 +41,6 @@ &i2c3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	clock-frequency = <400000>;
-	status = "okay";
 
 	pwmhat: pwm@1a {
 		compatible = "argon40,fan-hat";
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index af680290ce817..a6294fd32daee 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -498,6 +498,7 @@ &i2c3 {
 	#size-cells = <0>;
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "default";
+	status = "okay";
 };
 
 /* Page 31 / IO_CN */
@@ -506,6 +507,7 @@ &i2c4 {
 	#size-cells = <0>;
 	pinctrl-0 = <&i2c4_pins>;
 	pinctrl-names = "default";
+	status = "okay";
 };
 
 /* Page 18 / POWER_CORE and Page 19 / POWER_PMIC */
-- 
2.53.0


