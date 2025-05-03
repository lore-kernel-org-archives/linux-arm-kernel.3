Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35762C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 10:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ixfEoEL7KZk0GFf+UsY1xU49qFH3Y2Jr+f5O9hU4OlE=; b=fWyM6Mbyzy5H/cXrKkbOqQXOLt
	47uAeMoCTkxjm8Fi7542+unvq4sFwor5hDtvSmKk6a1/7PhwpnANiICyu83qv/2xuEj107gNQ7kBF
	CWFWSZLcL9ABaa2mTmAZG/Dk0rLog/t1hVio6eA1JStODrcI3V8j0UPeoBA55fRA6WJGlHPpmJg1v
	3salwx2chzOFLM+xvO60byGzn5r3o9QJ6uz017OGm/Uw0kS6DNbk1pr0Nq1bqen5DBI25tEjyHbPr
	ozMV5Ube27hFtiMQWvn2QQ1l+7PfCAjwAnbvNUDWOuBZ2yk7VzkCEbuuVNXT2BlPzhEgUYz1zBKeH
	2gzCl7bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB9ou-00000003jRA-3f8H;
	Sat, 03 May 2025 10:10:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB9m9-00000003iwX-0SBv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 10:07:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 58380A4ABDB;
	Sat,  3 May 2025 10:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABDFAC4CEE3;
	Sat,  3 May 2025 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746266835;
	bh=A6sW0fHhezyvxJw0ueUn7VDzoKCJ4EosNM854fVXIRc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=q3M6XbVdckVpk5+qHUzI31GMalJN/2cH4nN547PXyZB5CWWbcEmfukrzzDd5zfoQd
	 rciN7vaEfgXM1KAf7icrGA+/mH9K3j/q6O3ihl4q5B7bAQs0GdM39ZnhPko1GuMwfR
	 q29Ad/fSPKfpSjGbYOkhD/utaMob1mxdxZCRhhUZgAZcuU1JGumBOKNhdNc7uL8YqX
	 AWuHM19PbgwH29+Rq5FnSo+45Cn7Ld/xoT2tSKYPHERRcY/LGeTceIcXMvBZ/ytWHJ
	 xWS6IuHvc+rGCcyNJ7ZY4ErKt+AcWojIi48AMEhSFbv3MEoyRStq186ZpR0JAleQDP
	 XgJmL+tDez3Xg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988CCC369D9;
	Sat,  3 May 2025 10:07:15 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Subject: [PATCH v4 0/9] Apple Mac System Management Controller
Date: Sat, 03 May 2025 10:06:47 +0000
Message-Id: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALfqFWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDI1MDYwMT3eLcZF0zXUNT3TSD1BQzQ8tUY8MUEyWg8oKi1LTMCrBR0bG1tQA
 Ek3W/WgAAAA==
X-Change-ID: 20250304-smc-6-15-f0ed619e31d4
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4267; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=A6sW0fHhezyvxJw0ueUn7VDzoKCJ4EosNM854fVXIRc=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4boq0N7VfUk+HOu9n5tUfVrDzzUWbhHOXfvjIrjV9t+r
 bmcH87TUcrCIMbBICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZhI61JGhvbsBZzL3Nfuexwz
 f+s5qXfXdjc/2ioW+epGWmng1aCPwWqMDKeYWrwfNV2a32pislHjxtaobe75f0/bPzc8HRhV+Uj
 lISMA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_030717_291272_FC5CD5FF 
X-CRM114-Status: GOOD (  16.63  )
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

It's been quite a while (end of 2022) since the last version of this
series was sent by Russel. I'd like to pick this up again and get SMC
upstream.

I've taken the last version from the ML and worked in the review
comments and some other changed:

  - Added documentation for all functions and structs
  - Fixed dt-bindings and re-ordered commits so that the mfd one comes
    last and can include the gpio subdevice
  - Added the reset driver and corresponding bindings
  - Reworked the atomic mode inside SMC since the previous implementation
    called mutex_lock from atomic context
  - Removed the backend split for now which lead to a quite intense discussion
    for the previous versions which hadn't been solved as far as I could tell
    from the old threads.
    It's also been 2+ years and I haven't heard of any backend implementation
    for T2 or even older macs. It's also unclear to me which sub-devices
    are actually useful there because at least GPIO and shutdown/reboot
    from this series will not work as-is there.
    I'd rather have this initial version which only supports M1+ macs upstream
    and then iterate there if any other backend is developed.
    I'll gladly help to re-introduce backend support if it's ever required.

Dependencies:
The code and dt-bindings themselves apply cleanly to 6.15-rc1 but
the device tree changes require the already merged SPMI controller
and SPMI NVMEM series which will be part of 6.16.
The series is also using the printf format specifiers which will
land in 6.16 via the drm-misc tree.
A tree with all dependencies for testing is available at
https://github.com/AsahiLinux/linux/commits/sven/smc-v4/.

Merging:
The dt-binding patches all depend on each other such that they all
should probably go together with the mfd device itself.
The following commits also depend on mfd due to the new header file and
will either have to go through the mfd tree as well or we'll need an
immutable branch there.
I'll take the device tree updates through our tree which also has the
previous device tree updates these depend on.

v3: https://lore.kernel.org/asahi/Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk/
v2: https://lore.kernel.org/asahi/YxdInl2qzQWM+3bs@shell.armlinux.org.uk/
v1: https://lore.kernel.org/asahi/YxC5eZjGgd8xguDr@shell.armlinux.org.uk/

Best,

Sven

---
Hector Martin (5):
      gpio: Add new gpio-macsmc driver for Apple Macs
      power: reset: macsmc-reboot: Add driver for rebooting via Apple SMC
      arm64: dts: apple: t8103: Add SMC node
      arm64: dts: apple: t8112: Add SMC node
      arm64: dts: apple: t600x: Add SMC node

Russell King (Oracle) (2):
      dt-bindings: gpio: Add Apple Mac SMC GPIO block
      dt-bindings: mfd: Add Apple Mac System Management Controller

Sven Peter (2):
      dt-bindings: power: reboot: Add Apple Mac SMC Reboot Controller
      mfd: Add Apple Silicon System Management Controller

 .../devicetree/bindings/gpio/apple,smc-gpio.yaml   |  37 ++
 .../devicetree/bindings/mfd/apple,smc.yaml         |  71 +++
 .../bindings/power/reset/apple,smc-reboot.yaml     |  52 ++
 MAINTAINERS                                        |   7 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          |  35 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  35 ++
 arch/arm64/boot/dts/apple/t8112.dtsi               |  35 ++
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-macsmc.c                         | 246 ++++++++
 drivers/mfd/Kconfig                                |  15 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/macsmc.c                               | 657 +++++++++++++++++++++
 drivers/power/reset/Kconfig                        |  11 +
 drivers/power/reset/Makefile                       |   1 +
 drivers/power/reset/macsmc-reboot.c                | 362 ++++++++++++
 include/linux/mfd/macsmc.h                         | 337 +++++++++++
 17 files changed, 1913 insertions(+)
---
base-commit: 8b7e6734e2231a549a23943678ee3452bd19a1fe
change-id: 20250304-smc-6-15-f0ed619e31d4

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>



