Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E180B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 08:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w5pqz4jZ;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=crVEQopE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=P5c0ApmIJ3lAMNaYphnR5Mx0YPPl4nsPPZL16lmRKXY=; b=w5pqz4jZJRliJRJVdSpBjiMAU9
	GdDmu43Tjzf1c4weRWNQDheeiehgQzaXiJVEFphuj/yT7/6nWHPwQYqbAt06Xn5AaCSS7XjsN6dbt
	XaG1mowiTAVmC1SkX8lY7N/y+rm1UYvlFFre45dUd1cQyf83xvSnEvrVWMZqIoT0WPu6Bjx19Nr1R
	AuUf7Pi6/p3CqKm3RnYITaKgw/6K24K2+30o7GdC37eysdCXfN4vwNPYyGxAYU2jA9Ng7RB5iruRK
	U0zOKbG5XdyhQqk3uLnzJ9FUqqUw1doTU81lAxJVC/H4YfUVAmFuSLycKoTOWst9ZdmP9pyenOtau
	UAiN3feA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcAU-00000003z67-2hwC;
	Tue, 27 Oct 2026 08:04:26 +0000
Received: from [2a0f:4ac0::3a11] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLc9o-00000003ySd-0Ukl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 08:03:45 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793088208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P5c0ApmIJ3lAMNaYphnR5Mx0YPPl4nsPPZL16lmRKXY=;
	b=crVEQopEfm3vY6etwK7PdIB3SmLmyRWj8Epua/Soc+v5Rbpb7o+MA91lYVv9dA4lORKBQw
	4mjWnEQToB5OR/G7JHCcBrdfWMV83H8c0Esd3NJdj6D0SCOe0QCqPkKB5TaoHXvSMDQs/P
	EUuJISIwf1ADXGzbly7QiU3Vl3vIuls=
Subject: [PATCH 00/10] Initial Apple Silicon M5 device trees and
 dt-bindings
Date: Tue, 27 Oct 2026 09:03:20 +0100
Message-Id: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywrCMBBG4Vcps3YgqbZSX0Vc5PKrIzWGTBSh9
 N2NuvwW5yykKAKlQ7dQwUtUHqnBbjoKV5cuYInN1Jt+tMaO7HKewfeBJUkVN3NsVUAtgPIuwvh
 pP0x+66ktcsFZ3r/98fS3Pv0NoX6ftK4f2RlBo4AAAAA=
X-Change-ID: 20261016-apple-m5-initial-devicetrees-4de0b9759b3b
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_010344_335750_DC32CB98 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.3 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series adds initial device trees and dt-bindings for the Apple
Silicon devices using the M5 (t8142) SoCs.

This series covers only a minimal amount of hardware, which is useful
as a basis for future developments. The hardware added here has remained
largely unchanged from the earlier Apple Silicon generations.

I applied some version of dt-check-style formatting to all new files
with the exception of the generated pmgr nodes.

Merge strategy:
Since there are no actual driver changes, we'd prefer to merge the
dt-bindings changes through the apple-soc tree once Acked by the
respective maintainers.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Yureka Lilian (10):
      dt-bindings: watchdog: apple,wdt: Add t8142 compatible
      dt-bindings: interrupt-controller: apple,aic2: Add t8142 compatible
      dt-bindings: arm: cpus: Add Apple M5 CPU core compatibles
      dt-bindings: arm: power: apple,pmgr-pwrstate: Add t8142 compatible
      dt-bindings: arm: apple: apple,pmgr: Add t8142 compatible
      dt-bindings: pwm: apple,s5l-fpwm: Add t8142 compatible
      dt-bindings: pinctrl: apple,pinctrl: Add t8142 compatible
      dt-bindings: i2c: apple,i2c: Add t8142 compatible
      dt-bindings: arm: apple: Add M5 based devices
      arm64: dts: apple: Add minimal t8142 (M5) device trees

 Documentation/devicetree/bindings/arm/apple.yaml   |   15 +
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    1 +
 Documentation/devicetree/bindings/arm/cpus.yaml    |    2 +
 .../devicetree/bindings/i2c/apple,i2c.yaml         |    1 +
 .../bindings/interrupt-controller/apple,aic2.yaml  |    1 +
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |    3 +
 .../bindings/power/apple,pmgr-pwrstate.yaml        |    1 +
 .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    1 +
 .../devicetree/bindings/watchdog/apple,wdt.yaml    |    1 +
 arch/arm64/boot/dts/apple/Makefile                 |    3 +
 arch/arm64/boot/dts/apple/t8142-j704.dts           |   36 +
 arch/arm64/boot/dts/apple/t8142-j813.dts           |   36 +
 arch/arm64/boot/dts/apple/t8142-j815.dts           |   36 +
 arch/arm64/boot/dts/apple/t8142-jxxx.dtsi          |   50 +
 arch/arm64/boot/dts/apple/t8142-pmgr.dtsi          | 1131 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8142.dtsi               |  512 +++++++++
 16 files changed, 1830 insertions(+)
---
base-commit: 498a03715b45515444fe1fc6d7b34177cafb6c38
change-id: 20261016-apple-m5-initial-devicetrees-4de0b9759b3b

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


