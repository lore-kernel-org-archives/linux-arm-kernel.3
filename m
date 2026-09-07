Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F65C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fCNyXmPiwXW5LXBwZTFyX1AqojHJR5N1B1cgBkzjqLs=; b=P7WlbhIQGPzxNz
	JztG16HVfYsBYa4mrUb9STdRuCjOwRrmmp1kOwZ+TxmiFkJCUb+jROJCrk8Z3+FjSFNj0DR5ZBEXs
	RK1vcfqT20ZxcAoXkfHDTog2xnT8P+XO6RNuDNuuZXEV/Su5joeR3Mr1ZyD5K9ptb/vdV5PK653Za
	YIHErv0td07EWvZFa5FYJDhlL1t2JDXJFc4sGqe1HRXCZEiVv/J7u/YGr5Xn1JDcI4MXXXSMoAQYz
	XQH08uBpK7IblacYN1KX/AtmlxbL8zmtaLsLyAdvMf1rBvXlYVFzvgdU4sJMGrn6Y0mU0rwbPF+n0
	kNxa2GJi7Jw4onrO/akg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bKT-00000007AJP-2QUl;
	Mon, 07 Sep 2026 15:32:18 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bKN-00000007AG0-49cN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:32:13 +0000
X-PTX-Original-Recipient: samuel@sholland.org
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev
X-PTX-Original-Recipient: o.schinagl@ultimaker.com
X-PTX-Original-Recipient: t.schramm@manjaro.org
X-PTX-Original-Recipient: broonie@linaro.org
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-spi@vger.kernel.org
X-PTX-Original-Recipient: jernej.skrabec@gmail.com
X-PTX-Original-Recipient: mr.nuke.me@gmail.com
X-PTX-Original-Recipient: mkl@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: jre@pengutronix.de
X-PTX-Original-Recipient: mripard@kernel.org
X-PTX-Original-Recipient: wens@kernel.org
X-PTX-Original-Recipient: broonie@kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 143E02010BD;
	Mon, 07 Sep 2026 17:32:04 +0200 (CEST)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jre@pengutronix.de>)
	id 1x3bKF-000Ym1-3C;
	Mon, 07 Sep 2026 17:32:04 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH v2 0/6] spi: spi-sun4i: assorted fixes
Date: Mon, 07 Sep 2026 17:31:39 +0200
Message-Id: <20260907-spi-sun4i-fixes-v2-0-7e805662b9bd@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANvYnmoC/3WNOw6DMBBEr4K2zka2E/NJlXtEFAQvsI1BXrCIk
 O8ehz7lm9GbOUAoMAk8igMCRRaefQZzKaCfOj8SsssMRplSNcqgLIyy+TvjwDsJ6s4qqmvl+uo
 N2VoCnUWWXm3miWWdw+c8iPqX/t+KGhXqpqktDZUtq9tzIT9ua5g971dH0KaUvoD2SH+zAAAA
X-Change-ID: 20260902-spi-sun4i-fixes-1a50e880dc7b
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Alexandru Gagniuc <mr.nuke.me@gmail.com>, 
 Olliver Schinagl <o.schinagl@ultimaker.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@linaro.org>, kernel@pengutronix.de, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Jonas Rebmann <jre@pengutronix.de>, 
 Tobias Schramm <t.schramm@manjaro.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1541; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=QoP8/i51F8msseuU7N8yphI/jYG+fFigP1A13afHRU0=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsiad+P59J55xkp3oqOzjactazw8VWuGXeoZziOOuQnzP
 HwiKj4t7ShlYRDjYpAVU2SJVZNTEDL2v25WaRcLM4eVCWQIAxenAEwkJ4nhn7LCK+249LSFr/4l
 TDlxQnqy2qNOt49r5tRuYTp97jFvijEjw6bzIryf48P2LxBXE/W6fdGr7N63wvum8p1Ll2RPvf/
 Znw8A
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_083212_179328_F7CF5399 
X-CRM114-Status: UNSURE (   9.39  )
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

This is a series of patches for the spi-sun4i driver, some of which have
been sitting around for a while.

1-4 are fixes and 5 is a small patch that introduces reporting of the
effective SPI speed.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
Changes in v2:
- Add Patch 5/6 to fix division by zero potential in 6/6
- 3/6: Correctly subtract 1 to gain the register value for SUN4I_CLK_CTL_CDR1
- Mitigate race condition potential in 4/6 by disabling and syncing
  interrupts before sun4i_spi_drain_fifo() in the timeout path
- Link to v1: https://patch.msgid.link/20260902-spi-sun4i-fixes-v1-0-19985ef75673@pengutronix.de

---
Jonas Rebmann (1):
      spi: spi-sun4i: sun4i_spi_transfer_one(): add error handling at clock setup

Marc Kleine-Budde (5):
      spi: spi-sun4i: sun4i_spi_transfer_one(): fix transfers for SUN4I_FIFO_DEPTH
      spi: spi-sun4i: sun4i_spi_fill_fifo(): always apply A10 FIFO fill level workaround
      spi: spi-sun4i: sun4i_spi_transfer_one(): fix setting of clock rate
      spi: spi-sun4i: sun4i_spi_handler(): fix race condition between transfer completion and RX FIFO interrupt
      spi: spi-sun4i: sun4i_spi_transfer_one(): report effectively used speed_hz of transfer

 drivers/spi/spi-sun4i.c | 68 +++++++++++++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 28 deletions(-)
---
base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
change-id: 20260902-spi-sun4i-fixes-1a50e880dc7b

Best regards,
--  
Jonas Rebmann <jre@pengutronix.de>


