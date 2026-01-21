Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A71C44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 11:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8lJlN0ug6yApIS1+JqeiBezclov7WidFA1UiDZN5V9U=; b=0PnPAspA/h60hE
	KkZuVab5LVGLW8HkXKNbBy9IZahG+1CtILTyfPvRmNXW8FQIswM1i/jiOn/AAx4fU7TLVEavyFW5e
	D1HKCzzl3f0tMjucdxlOKXY5tMqbbqTaZ1RpsKtVE5pibS4ZS+CiQCN8jIcARw+lvREoch+h60aZy
	cJt4u7WA3YLZX7k5L0F/Ri82PP/sCMXZkDUDAV/2e+COpbUV5mp5iCJABb8GufF3pJfpKXvqbBs42
	NB2bYqPzqmi1mnWPpNSzuSbVR+oVX3yj1gzQQC4brv3oJkPgoz6+uY3zrwBIz+hGLsg9b9NRP//Bn
	UQL+PF+to8cUBmjBB62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVzr-00000005Jf3-3jQY;
	Wed, 21 Jan 2026 11:03:35 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVzp-00000005Jec-0hi1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 11:03:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768993399; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NxKL92tnsCo6rQLAN9YJNpmmDqvjzt9U4JGe1g7aiwG6AjuvGgMM29zvZN/UuDwVNO4xTRmPvnlbr8Qto9c9vhvO2S5CC2UtaOih6qsYSsNfga1i9DNekZ2zxCTw1VhxEgDXimU0wk8IBBKBq/skYtAinjucySgx5SXuzqV0fgk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768993399; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8lJlN0ug6yApIS1+JqeiBezclov7WidFA1UiDZN5V9U=; 
	b=efPAjUeiloqUEzONBIcm104uCSYV+Jd7sosEuBvl055uP86GX+KZ5U5CcrcDoRu/hoalQGfjvTbIMHU+zQ2To0W6S39JMHRXpNRaJDepCFAkLjqTv5oP2XUAbgOFgszsV/8NKx3x5p5vn0VlM0++W/sWGd7TJrTcHOHnNaW4OAM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768993399;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=8lJlN0ug6yApIS1+JqeiBezclov7WidFA1UiDZN5V9U=;
	b=CjTbgVW8EfrZNxEdESlIHMgnfutX4+6+3f+to8Kp/yx9l8lYvD0k/iIaEY7tKavc
	pV1m/d6wIrZhRyffdyPIuS4bNTGdSuQuMaU8H68vrRDYsUXj08unjWBHyba0IwvLdBA
	ce4qJoMXPMrfRcPX8j1hSk9KeAzGC4O7NGe9UNMg=
Received: by mx.zohomail.com with SMTPS id 1768993396228245.11544303994697;
	Wed, 21 Jan 2026 03:03:16 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 0/7] rtc: sun6i: Add support for Allwinner A733 SoC
Date: Wed, 21 Jan 2026 18:59:06 +0800
Message-Id: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMz3URzY2PdopJk3WRTQzPzlDRDk1SzVCWg8oKi1LTMCrBR0bG1tQB
 d2m3lWgAAAA==
X-Change-ID: 20251226-a733-rtc-c5167df14e6e
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768993386; l=2495;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=ChAE11uB2J9P96UiiuYNslcAUUgF4nuthjgSsDtHVF0=;
 b=bBFnSuz+/bl9OC2UgQWtIVt3n7YgeDUpeh8pSxTE8n661CU44HU8TTshZjDZ6+L6/JWiLFmCR
 fqRC/Pat1bsAJ5yrD039wyRQNtfu1ddmLFoVDYojR9IhQvWwLmeUqQG
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_030333_607980_9986BB53 
X-CRM114-Status: GOOD (  10.90  )
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

Add support for the Allwinner A733 RTC and its internal Clock Control
Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
SoC-specific RTC CCU driver to handle the hardware's evolved clock
structure.

To facilitate this addition and improve driver modularity, transition
the binding between the RTC and its internal CCU from direct
cross-subsystem function calls to the auxiliary bus. Also extract shared
IOSC and 32kHz clock logic into a standalone ccu_rtc module for reuse
across newer SoC generations.

The A733 implementation supports hardware detection of three external
crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
the driver via read-only mux operations. Implement logic to derive a
normalized 32kHz reference from these DCXO sources using fixed
pre-dividers. Additionally, provide several new DCXO gate clocks for
peripherals, including SerDes, HDMI, and UFS.

---
Junhui Liu (7):
      dt-bindings: rtc: sun6i: Add Allwinner A733 support
      rtc: sun6i: Bind internal CCU via auxiliary bus
      clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC calibration
      clk: sunxi-ng: Extract common RTC CCU clock logic
      clk: sunxi-ng: mux: Add mux read-only clock operations
      rtc: sun6i: Add support for A733 RTC
      clk: sunxi-ng: Add Allwinner A733 RTC CCU support

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      |  38 +++-
 drivers/clk/sunxi-ng/Kconfig                       |   5 +
 drivers/clk/sunxi-ng/Makefile                      |   5 +
 drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c         | 204 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.h         |  18 ++
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c               | 184 +++----------------
 drivers/clk/sunxi-ng/ccu_common.h                  |   1 +
 drivers/clk/sunxi-ng/ccu_mux.c                     |  11 ++
 drivers/clk/sunxi-ng/ccu_mux.h                     |   1 +
 drivers/clk/sunxi-ng/ccu_rtc.c                     | 136 ++++++++++++++
 drivers/clk/sunxi-ng/ccu_rtc.h                     |  44 +++++
 drivers/rtc/rtc-sun6i.c                            |  38 +++-
 include/dt-bindings/clock/sun60i-a733-rtc.h        |  16 ++
 include/linux/clk/sunxi-ng.h                       |   2 -
 14 files changed, 533 insertions(+), 170 deletions(-)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20251226-a733-rtc-c5167df14e6e

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


