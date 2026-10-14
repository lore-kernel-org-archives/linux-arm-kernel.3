Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0730CC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 06:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RFRhkU5N0xkY+h+ZZaHcxaa1ZMJtDptcbJ0QND+y2ZU=; b=wY2Pr2dBiP0Aig
	CAhRExBaTzNcXRSaR0iEP8BNDDkpp3JSf81brFf54Psnj/xsH4BVtFO5evO/g/EPQEP42zbEri8Wx
	UkIlHGqVThzrPMTmJ5PTrVsLOLIn8FQUDCi4rCx7T9VDPuVRTrm4y09vuuEMVgQn2oMcZWqvNLkAu
	M1iejBe3IqCFTuk/jUyPnpxFo5n2qOTGy6evcDnjBxMMFlRzbWv5I1qYLG3YxE8afDZs/ju0PgNRV
	SpJvfaJyc49EJT7jU2sp0mVqznaQaBeFul186k7bMFwyB8WFfVA3sYNIHFNvhHkMO0SzTftvGNEuk
	5Soe0y4+G8AaYRcAKEWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsv0-0000000EfLz-3q1h;
	Wed, 14 Oct 2026 06:56:54 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsud-0000000EfE9-0ZGj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 06:56:38 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791960975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RFRhkU5N0xkY+h+ZZaHcxaa1ZMJtDptcbJ0QND+y2ZU=;
	b=cCZPlIQcPSnjvO680NjrZGy0BG6CEKO524p5wCykGaevyWasCNuGYmGtaMmcEvn9oM89hq
	b8zrbS8P0V+Gu2GfoUfdPbZV/YOqmP1DnY9rsCE4gp0zQ9NFmjghU0lItKy3GPrFV/OXmc
	+utiL/vJPVDjsmPooYSCUJ3YEf4Nl1k=
Subject: [PATCH v2 00/10] Initial Apple Silicon M4 Pro/Max device trees and
 dt-bindings
Date: Wed, 14 Oct 2026 08:56:07 +0200
Message-Id: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42PTQ6CMBCFr0K6dkxbDD+uvIdhUcpUxiBt2kogh
 Ltb0AO4/JJv3nuzsoCeMLBrtjKPEwWyYwJ5ypju1fhAoC4xk1wWgvMalHMDwusCzlt4qRlopEh
 qgC5da4weMYDOW5kbVaqqQpainEdD81Fzb74c3u0Tddyzd6OnEK1fjh2T2L1fpeD/VU4COJSVM
 G1uZFeb4qaXFn16woZzElmzbdsHS+3j9u8AAAA=
X-Change-ID: 20261009-apple-m4-pro-max-initial-devicetrees-c3b23fa7a88e
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
 Yureka Lilian <yureka@cyberchaos.dev>, Florian Klink <flokli@flokli.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_235631_628875_816243B4 
X-CRM114-Status: GOOD (  12.71  )
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

Hi,

This series adds initial device trees and dt-bindings for the Apple
Silicon devices using the M4 Pro/Max (t6040/t6041) SoCs.

This series covers only a minimal amount of hardware, which is useful
as a basis for future developments. The hardware added here has remained
largely unchanged between the M3 and M4 generations.

The dt-bindings changes should be mostly boring (in a good way!). The
device trees themselves are roughly organized into the MacBook Pro
models on one side (t604x-j614-j616) and the Mac mini and Mac Studio on
the other side (t604x-j575-j773). I'm hoping to re-use these dtsi files
for the M5 Pro/Max versions of these machines in the future.
I applied some version of dt-check-style formatting to all new files
with the exception of the generated pmgr nodes.

Merge strategy:
Since there are no actual driver changes, we'd prefer to merge the
dt-bindings changes through the apple-soc tree once Acked by the
respective maintainers.

Thanks,

Yureka

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Changes in v2:
- Remove accidental t6050 hunk from "dt-bindings: interrupt-controller:
- Remove accidental Acked-By & Reviewed-By from "dt-bindings: interrupt-controller: 
- Fix missing "0x" hexadecimal prefix in cpu cache sizes
- Use _fe power domains instead of their disabled _cpu counterparts in
  Mac mini and Mac Studio framebuffer nodes
- Link to v1: https://patch.msgid.link/20261010-apple-m4-pro-max-initial-devicetrees-v1-0-781fb3f2d9f6@cyberchaos.dev

To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
To: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Hector Martin <marcan@marcan.st>
To: Uwe Kleine-König <ukleinek@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
To: Linus Walleij <linusw@kernel.org>
To: Mark Kettenis <kettenis@openbsd.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-watchdog@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pwm@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
apple,aic2: Add t6041 compatible"

---
Yureka Lilian (10):
      dt-bindings: watchdog: apple,wdt: Add t6041 compatible
      dt-bindings: interrupt-controller: apple,aic2: Add t6041 compatible
      dt-bindings: arm: cpus: Add Apple M4 Pro/Max CPU core compatibles
      dt-bindings: arm: power: apple,pmgr-pwrstate: Add t6041 compatible
      dt-bindings: arm: apple: apple,pmgr: Add t6041 compatible
      dt-bindings: pwm: apple,s5l-fpwm: Add t6041 compatible
      dt-bindings: pinctrl: apple,pinctrl: Add t6041 compatible
      dt-bindings: i2c: apple,i2c: Add t6041 compatible
      dt-bindings: arm: apple: Add M4 Pro/Max based devices
      arm64: dts: apple: Add minimal t604x (M4 Pro/Max) device trees

 Documentation/devicetree/bindings/arm/apple.yaml   |   27 +
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    1 +
 Documentation/devicetree/bindings/arm/cpus.yaml    |    2 +
 .../devicetree/bindings/i2c/apple,i2c.yaml         |    1 +
 .../bindings/interrupt-controller/apple,aic2.yaml  |    2 +
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |    1 +
 .../bindings/power/apple,pmgr-pwrstate.yaml        |    1 +
 .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    1 +
 .../devicetree/bindings/watchdog/apple,wdt.yaml    |    1 +
 arch/arm64/boot/dts/apple/Makefile                 |    6 +
 arch/arm64/boot/dts/apple/t6040-j614s.dts          |   24 +
 arch/arm64/boot/dts/apple/t6040-j616s.dts          |   24 +
 arch/arm64/boot/dts/apple/t6040-j773s.dts          |   28 +
 arch/arm64/boot/dts/apple/t6040.dtsi               |   65 +
 arch/arm64/boot/dts/apple/t6041-j575c.dts          |   22 +
 arch/arm64/boot/dts/apple/t6041-j614c.dts          |   18 +
 arch/arm64/boot/dts/apple/t6041-j616c.dts          |   18 +
 arch/arm64/boot/dts/apple/t6041-pmgr.dtsi          | 2297 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t6041.dtsi               |  713 ++++++
 arch/arm64/boot/dts/apple/t604x-j575-j773.dtsi     |   47 +
 arch/arm64/boot/dts/apple/t604x-j614-j616.dtsi     |   65 +
 21 files changed, 3364 insertions(+)
---
base-commit: a8ac6027e82415f431bbba49ab535c44f2edaf4d
change-id: 20261009-apple-m4-pro-max-initial-devicetrees-c3b23fa7a88e

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


