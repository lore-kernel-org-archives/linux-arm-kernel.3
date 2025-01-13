Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21175C02184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RPQlBEKI41ckh1JfJYSmq0NbDtrYqFYCWZof69veic8=; b=lThZWuJEgrcAAKNWSI7qQz3Shk
	+zNGT8fYrdJRsE3kGxBNszNFikYb+IxOqVNxj6fd0RoBljipm1uzYewfnYg0HNyqQHUwg5jyuOEut
	5Ay5vhTTqW2iMUeW+OXjyn51TMjh2Xk5aj74B2gt6y1lNQGjch89s3OV/3mB0BII4HzqlsM7vLgu/
	FF8zRQTUuedFpoknvwtuQftRRFYJ5LM/E+fEvQRvtYrw55B0Z1vrS6bFVRanxDXxP9nlwBTiopDWt
	kPkiiCqjAIlA4zKx69PjxBUq4Iau61ZdaJbERJ3toL8qEYoog99/kzZnl/gFgbodBfNIIRnkeh2Zx
	Hre8Tvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNZI-00000005umG-195N;
	Mon, 13 Jan 2025 16:45:36 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNQo-00000005tGA-1knQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 16:36:51 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tXNQn-0001a4-7L; Mon, 13 Jan 2025 17:36:49 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.14
Date: Mon, 13 Jan 2025 17:36:48 +0100
Message-Id: <20250113163648.1757178-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_083650_452611_35B06F7C 
X-CRM114-Status: UNSURE (   7.58  )
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

Dear arm-soc maintainers,

The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.14

for you to fetch changes up to 262c84cd062c8ea0ba9e1289ea64ebcbffb31794:

  reset: amlogic: aux: drop aux registration helper (2025-01-10 17:43:56 +0100)

----------------------------------------------------------------
Reset controller updates for v6.14

* Add support for A1 SoC in amlogic reset driver.
* Drop aux registration helper from amlogic reset driver.

----------------------------------------------------------------
Jan Dakinevich (2):
      dt-bindings: reset: add bindings for A1 SoC audio reset controller
      reset: amlogic: add support for A1 SoC in auxiliary reset driver

Jerome Brunet (2):
      reset: amlogic: aux: get regmap through parent device
      reset: amlogic: aux: drop aux registration helper

 drivers/reset/amlogic/reset-meson-aux.c            | 97 +++++-----------------
 .../reset/amlogic,meson-a1-audio-reset.h           | 36 ++++++++
 include/soc/amlogic/reset-meson-aux.h              | 23 -----
 3 files changed, 57 insertions(+), 99 deletions(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
 delete mode 100644 include/soc/amlogic/reset-meson-aux.h

