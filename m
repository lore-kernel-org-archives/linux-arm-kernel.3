Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C4AD40CE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 23:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Visze8T1/o6NUVrcZdRQoW4QaawF0ER2MqTcFpjP8Eg=; b=hXFzZHSuJzOwPgvcnW7r13pibw
	Js1ouvibR4mVqbkoBS7X2Ax7ZEFfyP3Cq9xj2bxQ10+rkWRE/tcyITp8EQyKlRAT1iImXTTvuA0oc
	BKGnwyey8DkoswLNsOYlM6niu03RPgPaQL8EEW2WP3659IddP3ne/yHZ7fXB105WwjDlYcapFnN8L
	yRnpxzH1ux0ABzBvfm3EdMH0zPo86AOTcCw79N+f4KZOBs1lisxT8IWZP9lWdj9oF4kUvQW5XARCf
	gl15zzPl6HOgPFvgROQ1YvCN1xxsgqqTm2aAlaL22M5shVcJq7Yw9g6nI5nqUWOwqKXhkZPNk6xv+
	q6hTJZ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8TCY-000000017zW-317u;
	Tue, 05 Nov 2024 23:43:10 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8TAq-000000017eL-3Nxu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 23:41:26 +0000
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3F73F88E43;
	Wed,  6 Nov 2024 00:41:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730850081;
	bh=Visze8T1/o6NUVrcZdRQoW4QaawF0ER2MqTcFpjP8Eg=;
	h=From:To:Cc:Subject:Date:From;
	b=ejvFprQH13kWl4SckkcMJ/PbMRZcGSzg08H2bIDBgvVuuEv/he9ahzWjdPIrMSKMo
	 l76DYvu4E3IFY6fZ6/GOM08S0b9XQDHLh8Y4yKI1mgD8oLbL6QlY58+MtM7/yaH4Sy
	 MOYsHua9eZffCK4pLqz6FzKEKh/qCH3c78vRGLdboIjP+y6s8l8T+X5kjT/iIEAWJ6
	 b6AZV0qF5Bkfv4fTWoZFgOOw8Roo+RWCgBLM07DkKCPSNHAhPDpXnxM1c9xT7RFMC6
	 j4/t0Tz2w2m10G44iVcNILWKhC0GwIolm1+cRWxwhzy/NQ8Ogd1GhDLfEjVE4Lrstg
	 JHZEOpBH6N8MQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] ARM: dts: stm32: Sort M24256E write-lockable page in DH STM32MP13xx DHCOR SoM DT
Date: Wed,  6 Nov 2024 00:40:41 +0100
Message-ID: <20241105234106.162610-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_154125_032112_4A8A9ED0 
X-CRM114-Status: GOOD (  11.65  )
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

Move the M24256E write-lockable page subnode after RTC subnode in
DH STM32MP13xx DHCOR SoM DT to keep the list of nodes sorted by I2C
address. No functional change.

Fixes: 3f2e7d167307 ("ARM: dts: stm32: Describe M24256E write-lockable page in DH STM32MP13xx DHCOR SoM DT")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
index 5edbc790d1d27..a181d5a816f69 100644
--- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
@@ -201,17 +201,17 @@ eeprom0: eeprom@50 {
 		pagesize = <64>;
 	};
 
-	eeprom0wl: eeprom@58 {
-		compatible = "st,24256e-wl";	/* ST M24256E WL page of 0x50 */
-		pagesize = <64>;
-		reg = <0x58>;
-	};
-
 	rv3032: rtc@51 {
 		compatible = "microcrystal,rv3032";
 		reg = <0x51>;
 		interrupts-extended = <&gpioi 0 IRQ_TYPE_EDGE_FALLING>;
 	};
+
+	eeprom0wl: eeprom@58 {
+		compatible = "st,24256e-wl";	/* ST M24256E WL page of 0x50 */
+		pagesize = <64>;
+		reg = <0x58>;
+	};
 };
 
 &iwdg2 {
-- 
2.45.2


