Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B103ECCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 06:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q3CKPWxWSXXjZ7M32VyfUulNh+IqFlHQSDdTyFlMMYk=; b=c0SVK3qshgmZy0k7UVVD+ZBYTH
	qrKpaqq1/9KzDhFfjM8TOQ0fgelv2b4RmytjAgO09VTIkj9boM/dYBpto27wXET0n4Si5t+O6WTnl
	PLqhdAl6DmDM68JUJrwxxDhtR2Q/UYBBA83XflYpbrsmEfMQ5RQgaN0eKCo2OHAwxufMSkFppEkyh
	sOvadkeptmdp21JhKLRHBUG6upy6k0U5x5VuWVIaAu3z6GFl8/3MB5QWj4M0WtN5vcfYmP0V3qPsV
	fKyvzMbyYU+fXHul/oWE1z3DUZ9mgksL7O8IXKN8PEfLLryEWU5ctQc26UFQEkm3pmsdqFCi02nft
	YA6ptUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSoP-00000001lD5-1d24;
	Wed, 22 Oct 2025 06:59:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSoJ-00000001l8o-0nlb;
	Wed, 22 Oct 2025 06:59:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 806B940B20;
	Wed, 22 Oct 2025 06:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56191C4CEE7;
	Wed, 22 Oct 2025 06:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761116342;
	bh=AD9HSHNdMY0OM9nnzoBOYxn8pv3LYh4EXRbZNlxGZDY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Ry5qwBNtHUsVAtOGSQ6ItB9v1IFtHufldIsqgs6ywIA7XrEkDBKcd+r5ebFA4WMaw
	 aMKFf9ZfSU0gghPSPV+qTFLKVnTk3x4l2zxDjo3YM2NvD8SNl8w4yAHNJWCgmjWU8Y
	 4NjVy24kZLbVoZqw04Og476zfvkN7Ywb2e23c/YVutD/ZdeQRMuHhakNcUSofc8nc2
	 uAX40iJH6E8sgYsrHX+m1bcECsQCnXIO7ljbP5baBVA0tDUa3LCx2560cP5Wdc+NYd
	 0uCzxR99ufvjH4SrDDY5EN3Ubt5GLSyse4dgR9MGiPW3K59KV+qc4/os3Bsl7cOezt
	 Sh70XZGSBaACA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426C5CCD195;
	Wed, 22 Oct 2025 06:59:02 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH 0/3] clk: amlogic: optimize the PLL driver
Date: Wed, 22 Oct 2025 14:58:50 +0800
Message-Id: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKqA+GgC/x3MywqAIBBA0V+JWSeo9P6VCCmdaqCHjBFR9O9Jy
 7O494GATBigSR5gPCnQvkWoNAE799uEglw0aKlzJbUUuz9opRuNXxbjmE5kUQ441qoqC5spiKV
 nHOn6r233vh/2hlFmZQAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761116340; l=880;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=AD9HSHNdMY0OM9nnzoBOYxn8pv3LYh4EXRbZNlxGZDY=;
 b=kxSqjlsNE/85yLqBjRjfLRykrNWn7ajZhDatN3y6+Uqup7ZGGj2wCQC38UPxyBoTzrGMwIpCI
 lqHa5F1aU8TANQvaBZLFNKRSHEx3VozY1u8BZQvzMATv8LCUjF0UH82
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_235903_253215_DE3F52CC 
X-CRM114-Status: UNSURE (   6.88  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series consists of three topics involving the amlogic PLL
driver:
- Fix out-of-range PLL frequency setting
- Optimize PLL enable timing
- Correct l_detect bit control

For easier review and management, these are submitted as a single
patch series.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Chuan Liu (3):
      clk: amlogic: Fix out-of-range PLL frequency setting
      clk: amlogic: Optimize PLL enable timing
      clk: amlogic: Correct l_detect bit control

 drivers/clk/meson/a1-pll.c  |  1 +
 drivers/clk/meson/clk-pll.c | 76 ++++++++++++++++++++++++++++-----------------
 drivers/clk/meson/clk-pll.h |  2 ++
 3 files changed, 51 insertions(+), 28 deletions(-)
---
base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
change-id: 20251020-optimize_pll_driver-7bef91876c41

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



