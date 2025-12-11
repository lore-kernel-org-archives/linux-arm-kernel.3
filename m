Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1760D3E786
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e/DM6Sr1SqiFaFi6So6itNGziX/g9agVvmrw9nqOKwk=; b=MmdlW1wggEAksT
	WhefcJXwuOvCGP+rCgNFYMnsRpXsh9MLVmEf5gLQj6r0wo/H82LvXwJR/TV0foRdch01uIGcouR7n
	wV4W/RlnBfnA9TgjODclSR2vaYtWUuYsMhPHHBdMe1UXc2/2X0LKRCfj1Paqg4EKmBNWWmQP/HvL3
	61WryQos9OZYdFynTsfz3skDNVL6dIzPpe2yF4RLAzqKVr7mjM+Vn5FSOii6qvupMKfJs3LNrHANQ
	QBHcw6XL+jAspLnM+b3nNCXvLXT00hiePgF+Ly42FjkSlCu8I/kQqbBUzfHfLLnNIlhZaFt6XdWZL
	y118JP5M+AdIF3WInkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcJp-0000000GOUX-3x6b;
	Thu, 11 Dec 2025 08:46:37 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcJn-0000000GOTI-1mFL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:46:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442785;
	bh=e/DM6Sr1SqiFaFi6So6itNGziX/g9agVvmrw9nqOKwk=;
	h=From:Subject:Date:To:Cc;
	b=bqC5HF97IEXGGiwn8BjKImcZTCClNnB5F20Ne02GYuzhc+xDMiDRF+Z09oKeAgrrL
	 jLJwO0XqylJgqUw5ZMQxQBGVLJk8bZNZm//deP56z5ytmmRPS1z919GTDPdpgieASR
	 wQj3FYYvWzGaCnsX7lvoNg6pAbH8wMrWcz+aeqHbvZsOqDZNdr6zUbki4wtinbPe/p
	 YEMg+SviXUlGezg5bkwlU/iDzeNrtJ4W0Viu8jpT69TRVD/cg7WOIPEiaS8gkz2iCb
	 W68/0xn4kthIfGBvzsjLKS29+37YApjp2QqNC4f8WR7bnVOuDqSn7QTMljkot5glDw
	 DoCvbsMthhpKQ==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 490B164DF5;
	Thu, 11 Dec 2025 16:46:19 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH RFC 00/16] Eliminate warnings for AST2500 and AST2600 EVB
 devicetrees
Date: Thu, 11 Dec 2025 17:45:42 +0900
Message-Id: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALeEOmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0ND3ZTUMt2UEt3yxKK8zLz0Yt3EnBzdpBRTC1OTJAOTFDMDJaDOgqL
 UtMwKsKnRSkFuzkqxtbUAFLhwe2oAAAA=
X-Change-ID: 20251211-dev-dt-warnings-all-bd5854b04d60
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
X-CRM114-CacheID: sfid-20251211_004635_679915_822A1C9D 
X-CRM114-Status: GOOD (  15.45  )
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

Hi all,

This series removes the remaining warnings produced by `make
CHECK_DTBS=y ...` for the AST2500 and AST2600 EVBs and their related
DTSIs. The tidy-up has the usual benefit of making it clear to
contributors that any warnings are likely their own to fix before their
patches will be considered for merging.

I've framed it as an RFC with all patches contained in the one series
so the goal is clear, we can see what's needed to reach it, and we can
decide whether and how it should be split or merged going forward.

As it stands there's little in the way of code change, except to
pinctrl (though also not much there). As such I've included the
binding maintainers and subsystem lists as recipients but not yet Cc'ed
subsystem maintainers directly because there are quite a few and I hope
to avoid mostly uninteresting patches being a source of irritation.

The patches fall into several groups:

Patch 1:
  Rob's conversion of the PWM/tach binding to DT schema with fixes
  applied for the license and typos identified by Krzysztof.

Patches 2-5:
  Fixes for the warnings related to the LPC and pinctrl nodes, touching
  relevant drivers and the devicetrees.

  I expect that if this approach is acceptable that we'll need to split
  application of the patches across successive release cycles, with the
  driver changes going in first.

Patches 6-8:
  Fix MMC/SDHCI warnings, touching the relevant binding and devicetrees

Patches 9-10:
  Clarify the relationships between the ACRY and AHB controller

Patches 11-16:
  The remaining pieces that eliminate the warnings

I'm at plumbers so don't have hardware on hand to test with, but some
brief smoke tests under qemu look okay. Given that it's all RFC that
should be enough for the moment. I'll do more testing after discussions
and when I have boards at hand.

Please review!

Andrew

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Andrew Jeffery (15):
      pinctrl: aspeed: g5: Constrain LPC binding revision workaround to AST2500
      pinctrl: aspeed: g5: Allow use of LPC node instead of LPC host controller
      ARM: dts: aspeed: g5: Use LPC phandle for pinctrl aspeed,external-nodes
      ARM: dts: aspeed: Remove unspecified LPC host controller node
      dt-bindings: mmc: Switch ref to sdhci-common.yaml
      ARM: dts: aspeed: Remove sdhci-drive-type property from AST2600 EVB
      ARM: dts: aspeed: Use specified wp-inverted property for AST2600 EVB
      dt-bindings: bus: aspeed: Require syscon for AST2600 AHB controller
      dt-bindings: crypto: Document aspeed,ahbc property for Aspeed ACRY
      ARM: dts: aspeed: Drop syscon compatible from EDAC in g6 dtsi
      ARM: dts: aspeed: g6: Drop unspecified aspeed,ast2600-udma node
      ARM: dts: aspeed: ast2600-evb: Tidy up A0 work-around for UART5
      dt-bindings: iio: adc: Allow interrupts property for AST2600
      ARM: dts: aspeed: g6: Drop clocks property from arm,armv7-timer
      dt-bindings: mfd: Document smp-memram node for AST2600 SCU

Rob Herring (Arm) (1):
      dt-bindings: hwmon: Convert aspeed,ast2400-pwm-tacho to DT schema

 .../bindings/bus/aspeed,ast2600-ahbc.yaml          |   8 +-
 .../bindings/crypto/aspeed,ast2600-acry.yaml       |   7 ++
 .../bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml   | 106 +++++++++++++++++++++
 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  73 --------------
 .../bindings/iio/adc/aspeed,ast2600-adc.yaml       |   3 +
 .../bindings/mfd/aspeed,ast2x00-scu.yaml           |  18 ++++
 .../devicetree/bindings/mmc/aspeed,sdhci.yaml      |   2 +-
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts    |   7 +-
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    |   4 -
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi            |   5 -
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi            |   8 +-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |  17 +---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  32 ++++---
 13 files changed, 165 insertions(+), 125 deletions(-)
---
base-commit: 5ce74bc1b7cb2732b22f9c93082545bc655d6547
change-id: 20251211-dev-dt-warnings-all-bd5854b04d60

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


