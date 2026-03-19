Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A451090257
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 17:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kUeQmG9FhX/cMcuw0LEztvn1MHuDJz/7nCjsKRvE1IY=; b=g4oqMaNoxGnvDK
	5t9DMVM2ZOqcJGEMTtvRctu1L2SHIznfzIFhugoOKJ0qRLRF9x3xXOL/YI4gsp/+GRAWXXnQvRkn1
	XEvEqaYfhWMwq37yReNX5NRPex83QUY/P6yybM6y3D0/6HhWLJb14+b6zCOmCtPQT2OLAQOm0dtcH
	0/usrFJ2DXzRgeX+5Tgqi1cM6NwgLyxqWG409J8KKeAQM0kcj1HKtmtEVnNb6WOBCgodWH3elaI5z
	T1F3P5H/kX9SYAfzGzCOsbyVDv/trSlr4/tG4BuBBOflhtbZUNZSVD4SgKDskDFBSBPc4f1bsjpP/
	U5cDZUDA+f++XsY+N1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3H1d-0000000BB2c-3xth;
	Thu, 19 Mar 2026 17:19:13 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3H1Z-0000000BB0s-03PL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 17:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kUeQmG9FhX/cMcuw0LEztvn1MHuDJz/7nCjsKRvE1IY=; b=NWGxTAcdBwuKuoKi3KG8gMmMKH
	AZt8frgQXPlGDEpODFJgkn621Z4Lx4GJJGO2XVXyysjCjegdRbygla8ahEXTQNRXDQrsx95sP75dC
	us5NRdHbVh4ctamVtzZ8xuqyRU+Y8ZqAc3KPkAFHwKkmFlQ8ry7Uvs0N+NuVSP1NLHjj7RXAIw9eg
	H4UhOaJ1EF8EwR/ue3rLbipdXOEFhYlkiQ2kHJSIdIMp9vUs1tIfP6RoRy0Hv/exc+J4bSjsvgYTH
	GG9hawNGxBpkAKiJkzeGgjOrPHM1a1o+iaIHipVsQZOt9FbHUmM34Ksi737ig45rn4Vn7Fep+ns3k
	nq4hYp+Q==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3H1U-0000000HLyQ-0q68;
	Thu, 19 Mar 2026 18:19:04 +0100
From: michal.piekos@mmpsystems.pl
Subject: [PATCH v5 0/2] fix gpiochip_lock_as_irq() failure when pinmux is
 unknown
Date: Thu, 19 Mar 2026 18:19:01 +0100
Message-Id: <20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAUwvGkC/33PzQrCMAzA8VeRno006cdaT76HeFjXTgvOjXYMR
 fbudp5kqMd/Qn6QJ8shxZDZfvNkKUwxx/5WQm03rLnUt3OA6Esz4qS54AZSQ+D6foRlC6RtMEp
 qLZRj5WZIoY33t3c8lb7EPPbp8eYnXKa/pAmBg68seawr41t/6LohP/IYurwbrmzRJvorECAo1
 K13hrhV4psgPgSUa0EUgTtpiBAN1vabID8FuxZk+UKKilpZNU47sxbmeX4BVXane3QBAAA=
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773940742; l=1819;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=BLMwvRHUCJBf2SLh4bB60WcZTkJkyLDetQMOjzc0K/E=;
 b=aG/Y+Jn2VL5c5JIfCQWW0pJSq5pjWBFV3ZLTNmBCI1toiwJIJrrp1x6n+BQTczIcsuw1qrF4w
 qOkznbs3uNPAg40T3YPxsLyIauBRritHvgRTfleNW1g8+ZhQ1VbPqn8
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_101909_518694_B9867E15 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

Changes in v5:
- Simplified logic checking pinmux layout
- Remove unneded curly braces
- Replace subtraction with one variable
- Fix typo in commit message
- Link to v4: https://lore.kernel.org/r/20260319-rc2-boot-hang-v4-0-4372f47cb6b8@mmpsystems.pl

Changes in v4:
- Fixed check for pinmux disabled value based on pinctrl layout
- Cherry picked
  https://lore.kernel.org/linux-arm-kernel/20250821004232.8134-3-andre.przywara@arm.com/
  to have flags for pinctrl layout recognition
- Link to v3: https://lore.kernel.org/r/20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl

Changes in v3:
- Drop v2 solution which was returning input instead of error when pin
  is not initialized.
- Add checking pinmux configuration in
  sunxi_pinctrl_irq_request_resources() and set pin to input if
  uninitialized
- Link to v2: https://lore.kernel.org/r/20260308-rc2-boot-hang-v2-1-516fdb820953@mmpsystems.pl

Changes in v2:
- Dropped the previous faulty solution which was forcing the axp313 to
  use r_pio as interrupt controller as pointed out by Jernej Škrabec.
- Implemented suggestion from Andrey Skvortsov to return default
  direction as input
- Link to v1: https://lore.kernel.org/r/20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl

---
Andre Przywara (1):
      pinctrl: sunxi: pass down flags to pinctrl routines

Michal Piekos (1):
      pinctrl: sunxi: fix gpiochip_lock_as_irq() failure when pinmux is unknown

 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 44 ++++++++++++++++++++++++++---------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  4 +++-
 2 files changed, 36 insertions(+), 12 deletions(-)
---
base-commit: 8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
change-id: 20260308-rc2-boot-hang-269e8546635b

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


