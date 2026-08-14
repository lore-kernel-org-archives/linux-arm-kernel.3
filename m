Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC95C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 06:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tbZViaB9kgwmkE/VqTklJsyYOxM8qDFma4Rcme3lXK0=; b=HvzCrafcOPcfsHdBM6/J92DH6f
	Bwf2CvmBczj+4J4ELFyFOmH+rIvKi/d+pAXzStaQH5rXbZjzTZy2FIbdIpGHgJmuwcRAIy1okG/BG
	ql2z2guUMh7rlpTFvXykeZ8zf/olvjttEXdstEHYAwGK3yIitky35/c75eJdVsaedsWUIsCQLXqRm
	5iEWecmYYZI6YSolZLOpfU3itcGIq9QZlLCLHxptb1+phoq3yoGhRHO8jd9dwIM+usZaiUyVygq73
	5uqwOm0Zugf6ytcZZ63Q6r6LIvtXQLKPqQt55m9JQwwRlSBjZY8vldnF3tyDMjvf4LeGe3P8SYH7c
	uw1EGdiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wulMn-000000021Ye-2nMN;
	Fri, 14 Aug 2026 06:26:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wulMl-000000021Xp-1MxO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 06:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67109600AD;
	Fri, 14 Aug 2026 06:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B390C2BCB3;
	Fri, 14 Aug 2026 06:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786688766;
	bh=ksEsRtK1EuKSLayoctPBxaWWqqFtM9SYIX6VyZQVJqg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tMNMA79MlmMdJ1hE1pSjFEWOaLyieppms3BqcaVNaj/Su5PX47ab3w+UoIxawcBDX
	 d/WLt7YA8c5r0EjeFaHF3r/HcThX/bJuh3ZUJELZ8nhaP56jf5cs2vcgXOfy7/MTmV
	 sLBVklijoeHLksDcQ2Bwge3hhf0KwlCwkt5YR//e5PFL0n3iv4N7cxL5zEDdnjSJqM
	 mvM6p6uMafyeu/sXEgH8SO4dfstZnkVyPZ/z5U8T7bFVy6wyEjIXmg7SRPI2pKcXvC
	 JpOeOttbrw6Zfq4N25wLr2WAWl026hCaz28wJfoP/aX1ASYyrodxywleT0dMYzZaeY
	 V394VM2fFpDYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA049C5B572;
	Fri, 14 Aug 2026 06:26:05 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Subject: [PATCH v4 0/4] Ambarella CV75: pinctrl and PL061 GPIO
Date: Fri, 14 Aug 2026 14:25:40 +0800
Message-Id: <20260814-cv75-v4-b-v4-0-ef2e83ec0eac@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOS0fmoC/yXMQQ5AMBBA0avIrE1SUjSuIhaMKWOBtDQScXfF8
 iU//wLPTthDnVzgOIiXdYnQaQI0dcvIKEM05Covlck0UqgKDBp7tDxoRYUhU1qI/ebYyvm9mva
 3P/qZaX8HcN8PrZkruG0AAAA=
X-Change-ID: 20260814-cv75-v4-b-fed40c58c86f
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786688763; l=1967;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=ksEsRtK1EuKSLayoctPBxaWWqqFtM9SYIX6VyZQVJqg=;
 b=lNb4uc4U78G3ALpbbxIU5sLX9QzDdu2+7huKuU4+wK7iDdIDUSBZB97DtGKOe3WYD3EhfRV20
 4W9sLQBYqj6BJY80ElTpLdj4hIR3K3HEy+BygtSx5JxhOqwNCl+p8gd
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This is part B of a 3-part CV75 split:

  A: bindings + RCT/CCU clocks + SoC/EVK DT + MAINTAINERS
  B: pinctrl + PL061 GPIO variant  (this series)
  C: 8250_dw UART quirks

Depends on series A:
https://lore.kernel.org/r/20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com

Link to v3:
https://lore.kernel.org/r/20260813-cv75-v3-b-v3-0-1d82e18da09b@ambarella.com

Link to v2:
https://lore.kernel.org/r/20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com

Summary:
- CV75 pinctrl binding and driver
- Ambarella register-layout variant for gpio-pl061
  (DT binding and driver in separate patches) 

Changes since v3:
- Split pl061 DT binding and driver into separate patches (Bartosz)

Changes since v2 (B scope):
- reuse PL061 instead of a duplicated GPIO implementation (Linus)
- complete function/groups enums in the binding (Krzysztof)

Verified on CV75 with A+B+C.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
Long Zhao (4):
      dt-bindings: pinctrl: add Ambarella CV75 pinctrl
      dt-bindings: gpio: pl061: add Ambarella CV75 variant
      gpio: pl061: add Ambarella CV75 register layout variant
      pinctrl: ambarella: add CV75 pin controller

 .../devicetree/bindings/gpio/pl061-gpio.yaml       |  35 +-
 .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   | 240 ++++++
 drivers/gpio/gpio-pl061.c                          | 280 +++++--
 drivers/pinctrl/Kconfig                            |  13 +
 drivers/pinctrl/Makefile                           |   2 +
 drivers/pinctrl/pinctrl-ambarella-cv75.c           | 561 ++++++++++++++
 drivers/pinctrl/pinctrl-ambarella.c                | 839 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-ambarella.h                |  50 ++
 8 files changed, 1949 insertions(+), 71 deletions(-)
---
base-commit: 18bf29fba8d0bdd0db5a0497ecf06f404bc740d1
change-id: 20260814-cv75-v4-b-fed40c58c86f

Best regards,
--  
Long Zhao <longzhao@ambarella.com>



