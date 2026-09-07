Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FD0C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjAFSbJ6jMhMmABykjHE2byxFMK4td5D9MEdd3ZPCBs=; b=Wx5kIyQOp4m5tFp5zQWOzm4lGb
	F1BPrPe5I3XPNpN4hlEMHGioA/d9XSkzEmuutc6syjMDkWWawMkHk1zKaZSqLXOOuVUcLxiti0N7N
	LzWu7atf2gfQqOkvVHtjX92GLsoxT4oJjW06+nREyNvwEt7VhoYn3BI5ZXprSpelwtu1uEHlqC6+0
	NZ7nBU49RkYAJwU9K+L2DSPQs9j7GujGj3NGUEc1qgwObo1CYxmD1INfH0pJfGlDQhf66xXp9vM6r
	p7s3KHcf3JGO2bN/KRDYWrkRMyIUaP2Ujgf6qahajcVkeLwOfd4qNVJBarO+JG55nICu8rVn8gOmp
	MQFxmxDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bKd-00000007AOn-0KiI;
	Mon, 07 Sep 2026 15:32:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bKX-00000007AKI-2BDV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 15:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZjAFSbJ6jMhMmABykjHE2byxFMK4td5D9MEdd3ZPCBs=; b=lenZ+kggVE9CaYFQx9deoyAORF
	S47oCvQ6Pe4zyZlwj4AHDiKgTE9y64bjgWHJspOetIlAphFQ/e9R/IGp1ayAp7qlUi5P5R+A+dbPq
	VpSoWzvswWzv0fKhwqBZ1qaEuL0Sn/VRJHgptnxHQJ2/zwsllqLLPj0aQqWX9U+tzdFOIZz6yK/3m
	8y9blPhb820+ZbllAxSvQTYI8d/a0TvI9gvCkqVV0dfDw5RgcpkZt6pY3Slj/3yoPjD7xEB65g3eg
	6Em468pFZ/8yIVmbupZgI/6KiRaZEtf2qohNf8oxaPWMKA835uqsRhR09Nw55pJdCnd4/qzndEYKV
	FTfpSFVg==;
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3bKQ-0000000GNW7-1DI9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:32:20 +0000
X-PTX-Original-Recipient: samuel@sholland.org
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev
X-PTX-Original-Recipient: o.schinagl@ultimaker.com
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
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 78A94202013;
	Mon, 07 Sep 2026 17:32:04 +0200 (CEST)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jre@pengutronix.de>)
	id 1x3bKG-000Ym1-1E;
	Mon, 07 Sep 2026 17:32:04 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Mon, 07 Sep 2026 17:31:45 +0200
Subject: [PATCH v2 6/6] spi: spi-sun4i: sun4i_spi_transfer_one(): report
 effectively used speed_hz of transfer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-spi-sun4i-fixes-v2-6-7e805662b9bd@pengutronix.de>
References: <20260907-spi-sun4i-fixes-v2-0-7e805662b9bd@pengutronix.de>
In-Reply-To: <20260907-spi-sun4i-fixes-v2-0-7e805662b9bd@pengutronix.de>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Alexandru Gagniuc <mr.nuke.me@gmail.com>, 
 Olliver Schinagl <o.schinagl@ultimaker.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@linaro.org>, kernel@pengutronix.de, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=3aSZoSVdfFoP0s52cZnANn1FnxYo6HhRQHzmKTWne0U=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsiad+NzwuO7K5dtjcsonh3whTkrXDvU0vuA6cVz9hOib
 isVJW+e11HKwiDGxSArpsgSqyanIGTsf92s0i4WZg4rE8gQBi5OAZjIyV6Gf/pvNH34LmSuLhfy
 frzramZ7atpSpR18yTopXwWUF3fMSGb4X161plR75eWFgkFO0uq692RsrqxwnqUrsuj/I+ldTzt
 2swEA
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_163218_971310_692E2EB3 
X-CRM114-Status: GOOD (  10.54  )
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

From: Marc Kleine-Budde <mkl@pengutronix.de>

Report the effectively used speed_hz for the transfer by setting
tfr->effective_speed_hz.

For more information see commit 5d7e2b5ed585 ("spi: core: allow
reporting the effectivly used speed_hz for a transfer"), which adds this
feature to the SPI core.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/spi/spi-sun4i.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index 94e1c7bbd632..59941b38b757 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -310,9 +310,11 @@ static int sun4i_spi_transfer_one(struct spi_controller *host,
 	div_cdr2 = DIV_ROUND_UP(div_cdr1, 2);
 	if (div_cdr2 <= (SUN4I_CLK_CTL_CDR2_MASK + 1)) {
 		reg = SUN4I_CLK_CTL_CDR2(div_cdr2 - 1) | SUN4I_CLK_CTL_DRS;
+		tfr->effective_speed_hz = mclk_rate / (2 * div_cdr2);
 	} else {
 		div = min(SUN4I_CLK_CTL_CDR1_MASK + 1, order_base_2(div_cdr1));
 		reg = SUN4I_CLK_CTL_CDR1(div - 1);
+		tfr->effective_speed_hz = mclk_rate / (1 << div);
 	}
 
 	sun4i_spi_write(sspi, SUN4I_CLK_CTL_REG, reg);

-- 
2.55.0.123.gf60db8d575


