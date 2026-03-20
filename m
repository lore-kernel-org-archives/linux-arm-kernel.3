Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922651099B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hu8cSIJgaA5j8PHqbuRYeZhxADCzKx/MGE68F0ebP60=; b=xkQ6Sh3P17Me6g
	u4qgImtMed7MDePEdV9WSESchrzG4nAX8BbRVodU3TPCa61O/DUptpxok5+o7nJTlmyfs/WqmM1nr
	/WEw/BYP908adgMQrTdkmrvlAElfFI5YDXxz+0phaw2QmtwJ7I3JtszP2yFZCpafKM9ZF7T40DSBg
	uNDiOI0gyvrG9wzAfkW4Hdv55T/4e6wOh/AFLL111C8nBZgsChoSIgH7O5f9EgxJzgfuOR+Ry5bhA
	g2CGCY+pgUFqcXB49gdVjHRk3JZMUltJXVJSk32kAx+XUWksVeXIcmPLn3OpmJ+oFrkE7imE+bdZG
	9gNDkhoq3HxyvhqS+yLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3e2H-0000000DKM4-3MNF;
	Fri, 20 Mar 2026 17:53:25 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3e2C-0000000DKKS-3ydq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hu8cSIJgaA5j8PHqbuRYeZhxADCzKx/MGE68F0ebP60=; b=y0o0LBeliT117qWt21Q751gxBX
	86ki38Za8pOAyjhtvNRhEpL7OU4chKDBzMUW9B8rZ5/rZ/Fk+vy6lBoPHRJ1Ht9tSUcJkOtdpnYTm
	yQWys42E+pwoynI67fWGnQsdkqWzST9BnJT1rMDkM7WTYtRckiPRyzsgNjaRP2LrPR7rwvpM/FaWL
	hy6WZcDOuZkhwFk4VDV5X0rvl195kQG5MOQsMbYIxEDoRL9fAjcgNgb0yIyYrsofgkEwnG5BHe6ba
	xs2IfNJ+Ajn9vptF7GFZH0xfssYxixO/8iBTQDyrTXMzpmJ5o9ZJZziJbhldo5UtGhlZ+cVCW1HKV
	QZd7eAUw==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3e28-00000005NVC-2Qsn;
	Fri, 20 Mar 2026 18:53:16 +0100
From: michal.piekos@mmpsystems.pl
Subject: [PATCH v6 0/2] fix gpiochip_lock_as_irq() failure when pinmux is
 unknown
Date: Fri, 20 Mar 2026 18:52:29 +0100
Message-Id: <20260320-rc2-boot-hang-v6-0-74dca70dd60e@mmpsystems.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF2JvWkC/33PzWrDMAzA8VcpPk/Dkj8i97T3GDvEsbMalibYI
 ayUvPucnkrIevxL6Ae6ixJzikWcT3eR45JKGq817NtJdJf2+h0hhdqCJFmpJEPuCPw4zrBtgay
 LbLS1ynhRb6Yc+/T78D6/al9Smcd8e/ALbtP/pAVBQmgcBWwbDn34GIap3Moch/I+/YhNW+ilQ
 IBg0PbBM0ln1JGgngTUe0FVQXrNRIiMrTsS9LPg9oKuX2jVUK+bzlvPR4J5KZgqSEesdMtMHvf
 Cuq5/3II5XLYBAAA=
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774029161; l=1993;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=k9F41jJZIQUEKOrkxHW0L9DgDw5GS92zrvfM2OhHIN0=;
 b=tP6LpwnW+/Y3yGU0EM7yOx+g/1YMdIZJHyqH/1QfipXfP3mO/GmJtyUD8AnqiqPR+reOxocjt
 PVJRPtmjro3DtbYMtx4+9BZk72GIkp/NaJH4TWuiBPFwteA7cZmDMWC
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_105321_470107_5587897F 
X-CRM114-Status: UNSURE (   9.20  )
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

Changes in v6:
- Fixed w/s
- Grouped variables in reverse christmas tree
- Link to v5: https://lore.kernel.org/r/20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl

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

 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 43 ++++++++++++++++++++++++++---------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  4 +++-
 2 files changed, 35 insertions(+), 12 deletions(-)
---
base-commit: 8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
change-id: 20260308-rc2-boot-hang-269e8546635b

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


