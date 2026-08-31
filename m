Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD7BC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POKu3l4J7SVpxZDF4dEniCQk73PmJkpAFR7IIuhZ9CM=; b=2PEec8KV4ChnXMesnzajj2enk7
	t//ugQFqTLsesKn8/Zpv8MuPHQ5abG2IYBx3b3/xiiia3H74LvFYEbCRpC5h1WL1d3pPLsgnSLMmq
	4TNQewz6+qSNTUc0bYDv8NkZcbxIAs7rE6rL+NBVmYbx0Q7I37iNzpY+GcK4fCKxK1YlDNJ6dIW2n
	Nz7WbWSI86wr/MOvR0EU9qCgprWIGweZcFqyq2LghwUJ/vMX3fbm2o23dskVNCtAbonaozsVJlRpm
	/jF/JtFXTEuh/aq8mU0/kY6BXUsnnHriwhmAdY8+U2WPfY4LCgmg79B3hDcB5VT7O+ndS6sjH2IDh
	HIVSf0/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Ef-00000009SK7-2pv7;
	Mon, 31 Aug 2026 13:39:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Ec-00000009SGw-1GW7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:39:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F33E740210;
	Mon, 31 Aug 2026 13:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35C11F00ACA;
	Mon, 31 Aug 2026 13:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183577;
	bh=POKu3l4J7SVpxZDF4dEniCQk73PmJkpAFR7IIuhZ9CM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YcDWIs45EMJ+xSjVT1oWgKlQ3Eml2bz7tt5ur3xZ9uQKd2CRI+Gh59b7er1BBQ3dB
	 /6fSRCtW3mDMyZ0gO66avsnGLOttUrEL0mEQ9RNSSDxxQIeHc0uwnBFJm+L6N6XVS/
	 /HylCMU+I/GGL+GxbvIkC5aOwHlzPJwdob4CmOgpnC68Ihk9qugD34snVD2V9jeiSc
	 gaRVZDoPPuAvYZg04vojQMD3uzksV3T2qLoXr0SJH3dmG1ubRWrbKSQ7qP0MCFimUZ
	 TGFqOT/sh9O/fR2gicIa2OSb+CCK4Ue+5eNJUSlBP1CvKAdStjW4GGwdQwHADBG/SF
	 o+5VGCoGZc2DA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tommy Huang <tommy_huang@aspeedtech.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-5.10] rtc: aspeed: add AST2700 compatible
Date: Mon, 31 Aug 2026 09:23:27 -0400
Message-ID: <20260831133314.4125787-179-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831133314.4125787-1-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.48
Content-Transfer-Encoding: 8bit
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

From: Tommy Huang <tommy_huang@aspeedtech.com>

[ Upstream commit 3319cfeeb8c4047026f84df045c438f7bbd338a6 ]

Add support for matching the RTC controller on ASPEED AST2700 SoCs.

The AST2700 RTC controller is compatible with the existing ASPEED
RTC driver implementation.

Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
Link: https://patch.msgid.link/20260601-ast2700-rtc-v1-2-15d4ca46500a@aspeedtech.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The background searches finished and match what the earlier analysis
used.

The `b4 dig` lookup on the real commit (`3319cfeeb8c40`) found the lore
thread and confirmed this is patch 2/2 of the AST2700 RTC series, with
`5e7f746bc106a` as the companion DT-binding patch.

The stable-branch history search shows 6.18.y already has substantial
AST2700/G7 bring-up (gpio, mfd, irqchip, reset, mailbox, clock
bindings), but not the RTC compatible or `ast2700-rtc` binding yet.

Verdict unchanged: **YES** for backport to this 6.18.y tree, ideally
together with the binding patch.

 drivers/rtc/rtc-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-aspeed.c b/drivers/rtc/rtc-aspeed.c
index 0d0053b52f9b9..8f5b440f8c0a9 100644
--- a/drivers/rtc/rtc-aspeed.c
+++ b/drivers/rtc/rtc-aspeed.c
@@ -111,6 +111,7 @@ static const struct of_device_id aspeed_rtc_match[] = {
 	{ .compatible = "aspeed,ast2400-rtc", },
 	{ .compatible = "aspeed,ast2500-rtc", },
 	{ .compatible = "aspeed,ast2600-rtc", },
+	{ .compatible = "aspeed,ast2700-rtc", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, aspeed_rtc_match);
-- 
2.53.0


