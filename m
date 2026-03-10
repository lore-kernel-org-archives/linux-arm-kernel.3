Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E77FCC9DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6QAKNaYZQ3oPbyfRehX2Ps756j69nJ1JrR6pbMmlzHI=; b=lMi5hWHfdOxGw/
	0SDE53+J3Y9yyBoYmodpI7k+GwVMUqbHGnXfBlV1AkPWqrHC+dWlvT5o4KFQw6UPA8XtEbD8qqmwc
	I5IIy7x4Yxhg230DOsbbz51BthhpFsTmdtw4Mbm8lvWwAbGemTRN70Q9o7dCrA8XrmdR84Dq2LLzC
	dbTGcYSHL+o5SIpq7TR+0gVXyavYmEg6hrqN+mSulFequr3ocdoQmwtKVHm7XRg9bV4k2DFndxOuz
	sbu6+AWopfb1ofD2jXhdu/6BVfxoLgbU8C5aX4f01Yf1xKTq+WOFWIMjLHBE4b5l103KW57SsWOBD
	lVAZhEheKwfPCin0GAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsf8-00000008xjq-0ElS;
	Tue, 10 Mar 2026 08:41:58 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsf4-00000008xjB-0ay2;
	Tue, 10 Mar 2026 08:41:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773132104; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qd3h3KFo8CtJ0BcQ9PmwEuSZGAFvxHDPBUX+IuoAi5TPTveJMtETpmnpDzBpmfdGI9S7uQXxAMF/yLZStUfAEPuHmXgt8DO7uxACbXvdhEg4o7WkqzcJsikwcFHoTZxnC0YBZgKzRTxhjeJf6jxEu3XfB4nTlUYb20BN9PJLjTs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773132104; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6QAKNaYZQ3oPbyfRehX2Ps756j69nJ1JrR6pbMmlzHI=; 
	b=HYTsmRQTLlpE83eSqdybsp9GvqEVLDH7c01y1e30TPtbgarHQLNURfLP3TeuTP7KjXpE7PGTzKtwx06bVkr87hYe9yzAbvvSAENIa1Caxz4Pt1kFVx+Hb8vfMsQVKyiQ9btrdTk4VRXVnCfXUUzNfeN90mzPkYd23kFNgFbmrXU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773132104;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=6QAKNaYZQ3oPbyfRehX2Ps756j69nJ1JrR6pbMmlzHI=;
	b=mIO2iMDWPi71XBeTyfVNIkwLFXY1LkkYQf17cONxWCj/t9GAPD85ay3yKKMETCw5
	SLEMZTa0tq1fvD4znvgQu77PhX+vw3CVZ6NW0Acij2pfHbDF8bo+gIpivAsKMD1ZDI2
	PkaYMQ41mXhKcT2YsYLJoSLP4t/1EsmKhD31WHfY=
Received: by mx.zohomail.com with SMTPS id 1773132101727222.80993575966113;
	Tue, 10 Mar 2026 01:41:41 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU
 and PRCM
Date: Tue, 10 Mar 2026 16:33:53 +0800
Message-Id: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIKGbaG5srJuck61rkGKSlmxgkGiZZpmsBFReUJSallkBNipaKcjNWSm
 2thYAxo8A6F8AAAA=
X-Change-ID: 20260202-a733-clk-0d4fc00a9f9c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 netdev@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773132092; l=3110;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=O+PtupKhJUb1UiVgJ52/W3koo44cp91XMGRu/Yk+jj8=;
 b=LCoE9uot8A3TIPpldMu+FwiyMrSb7oaPhzcG1a5yrSDDfPFX9wLrX2xjT2hzw2TAqEHJJecU0
 jGR11DR8AEbA5rykLaol+JTtYu8QPfSVi0wz5T9AXt5NwJoGI4cVTZb
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_014154_537363_7993026F 
X-CRM114-Status: GOOD (  12.19  )
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

Add support for the main CCU and the PRCM module (R-CCU) found in the
Allwinner A733 SoC. The clock architecture of the A733 is an evolution
of the previous A523 design but introduces several significant changes.

One of the key changes is the introduction of a "pll-ref" clock that
normalizes the physical oscillator frequency (which can be 19.2MHz,
24MHz, or 26MHz) into a consistent 24MHz reference for the entire clock
tree. Additionally, while the A733 inherits many module clock structures
from the A523, the MCU_CCU has been removed, and the overall clock tree
has been expanded to support more new functional units.

Also update the sunxi-ng SDM (Sigma-Delta Modulation) helper to support
a new dual-pattern register design. On the A733, the SDM enable bit has
been moved from the main PLL register to a second pattern register
(PATTERN1). The driver is updated to handle this register layout to
ensure accurate frequency synthesis for "pll-audio0".

This is marked as RFC because the parent clocks for several instances in
the main CCU are difficult to determine as the user manual provides
limited information on their specific clock sources. In these cases, the
implementation follows vendor practices and previous SoC designs,
generally defaulting to "hosc" where documentation is lacking. In
contrast, the bus clock gates in the PRCM (R-CCU) are explicitly defined
based on the Memory Map in the manual, which clearly associates each
module with its respective bus. Feedback or insights on these specific
clock parents would be greatly appreciated.

This functionally relies on the RTC series for the A733 SoC [1].

Link: https://lore.kernel.org/all/20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech/ [1]

---
Junhui Liu (8):
      dt-bindings: clk: sun60i-a733-ccu: Add allwinner A733 support
      clk: sunxi-ng: sdm: Add dual patterns support
      clk: sunxi-ng: a733: Add PRCM CCU
      clk: sunxi-ng: a733: Add PLL clocks support
      clk: sunxi-ng: a733: Add bus clocks support
      clk: sunxi-ng: a733: Add mod clocks support
      clk: sunxi-ng: a733: Add bus clock gates
      clk: sunxi-ng: a733: Add reset lines

 .../bindings/clock/allwinner,sun60i-a733-ccu.yaml  |  107 +
 drivers/clk/sunxi-ng/Kconfig                       |   10 +
 drivers/clk/sunxi-ng/Makefile                      |    4 +
 drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c           |  276 +++
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c             | 2375 ++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_sdm.c                     |   51 +-
 drivers/clk/sunxi-ng/ccu_sdm.h                     |   32 +-
 include/dt-bindings/clock/sun60i-a733-ccu.h        |  289 +++
 include/dt-bindings/clock/sun60i-a733-r-ccu.h      |   39 +
 include/dt-bindings/reset/sun60i-a733-ccu.h        |  131 ++
 include/dt-bindings/reset/sun60i-a733-r-ccu.h      |   23 +
 11 files changed, 3311 insertions(+), 26 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260202-a733-clk-0d4fc00a9f9c

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


