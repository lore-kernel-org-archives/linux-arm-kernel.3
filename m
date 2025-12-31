Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4042CEEB570
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 21:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odbNSOiJStewnyyWb0fJkmNXKu8AyxohiV6gHxeD980=; b=RlnHw1xw1KQAgSxzqRYX116n1r
	CFfDLQxfZCAHKWKsHC6911gEVDenVDTTVkIX6vB2RW1qkyWj42y1dxUcy5f/WQRJU10aq2C7pxmn1
	bD8r9oMRhlHPbrwXpYF9pQviZDQHnJ9eV0IwXH/czErLCIM96COp7vv9QeQRZaOU+iLVjlrpgWTci
	PSE0nwN7PvL7sO8V7u53ojHmXOuuI41mEsvQ3x4U0MgeNJqAyo4q0/p2BqgaeTkJ08vKLn99XM1G4
	I1L641SmLAnOU4HhBG7u3qSgBNcJ06b2KkTk2AYAk3vgnh4I4PT8jyCkfzYRiuW3TMvYrd428Tcto
	VYUrCsbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb4D7-00000006NKv-0PGh;
	Wed, 31 Dec 2025 21:58:29 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb4Cx-00000006NHa-43B3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 21:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767218298; bh=JdtssCsbX+e9SzJFbpzCrqk6Y3vDBQbt6w66F2zP+dI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KWC9CLLGTQ3bnNw/rXqeim+a9aTul2u4nJpsNtSsINzn+FM/iOk4sA5VwFNKqo2eE
	 TQbBjNqSP/fAR7/23jWzDdNCYicYrECwroJoQm47vNQUUrZVxa/rBZqk3ok6k5rTa6
	 THx2SIjd0TRvDfF2QQaeYDx02uVbVoGBPFuTmtr9AUYUT/P1Yy/p3UYXAbKcKFeJVF
	 E0prM6tUcEJ5VSu7cxF2yz5VlQEsCz1OBa6YbnemJaMYo+LOHEGCZU68t5aBunPQUf
	 wNbKLiuVSmRD2ZFcGhsbqfUHS8srbnw8YRhlaf4cozQ5t0L3ujtGoZe5xteQ4NA19n
	 KuDRFgLJy04/g==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 8B3C43E99A3;
	Wed, 31 Dec 2025 21:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767218298; bh=JdtssCsbX+e9SzJFbpzCrqk6Y3vDBQbt6w66F2zP+dI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KWC9CLLGTQ3bnNw/rXqeim+a9aTul2u4nJpsNtSsINzn+FM/iOk4sA5VwFNKqo2eE
	 TQbBjNqSP/fAR7/23jWzDdNCYicYrECwroJoQm47vNQUUrZVxa/rBZqk3ok6k5rTa6
	 THx2SIjd0TRvDfF2QQaeYDx02uVbVoGBPFuTmtr9AUYUT/P1Yy/p3UYXAbKcKFeJVF
	 E0prM6tUcEJ5VSu7cxF2yz5VlQEsCz1OBa6YbnemJaMYo+LOHEGCZU68t5aBunPQUf
	 wNbKLiuVSmRD2ZFcGhsbqfUHS8srbnw8YRhlaf4cozQ5t0L3ujtGoZe5xteQ4NA19n
	 KuDRFgLJy04/g==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id ECEF63E99A5;
	Wed, 31 Dec 2025 21:58:17 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/5] ARM: dts: lpc32xx: Use syscon for system control block
Date: Wed, 31 Dec 2025 23:57:51 +0200
Message-ID: <20251231215754.2222308-3-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231215754.2222308-1-vz@mleia.com>
References: <20251231215754.2222308-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251231_215818_586730_2412C6F7 
X-CRM114-Status: GOOD (  13.14  )
/bin/ln: failed to access 'reaver_cache/texts/20251231_215818_586730_2412C6F7': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_215818_586730_2412C6F7 
X-CRM114-Status: GOOD (  12.36  )
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

From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>

The clock controller is a part of NXP LPC32xx system control block (SCB),
and SCB provides a number of controllers apart of the clock controller.

[vzapolskiy]:
1. kept a simple comment,
2. renamed SoC specific compatible to 'nxp,lpc3220-scb' due to the SoC UM,
3. changed size in 'ranges', since it should cover more SCB functions,
4. updated the commit message.

Link to the original change:
* https://lore.kernel.org/linux-arm-kernel/20240627150046.258795-5-piotr.wojtaszczyk@timesys.com/

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 2236901a0031..89e621dfb950 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -314,17 +314,17 @@ fab {
 			ranges = <0x20000000 0x20000000 0x30000000>;
 
 			/* System Control Block */
-			scb {
-				compatible = "simple-bus";
-				ranges = <0x0 0x40004000 0x00001000>;
+			syscon@40004000 {
+				compatible = "nxp,lpc3220-scb", "syscon", "simple-mfd";
+				reg = <0x40004000 0x1000>;
 				#address-cells = <1>;
 				#size-cells = <1>;
+				ranges = <0 0x40004000 0x1000>;
 
 				clk: clock-controller@0 {
 					compatible = "nxp,lpc3220-clk";
 					reg = <0x00 0x114>;
 					#clock-cells = <1>;
-
 					clocks = <&xtal_32k>, <&xtal>;
 					clock-names = "xtal_32k", "xtal";
 				};
-- 
2.43.0


