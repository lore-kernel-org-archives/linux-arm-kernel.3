Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58780C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 11:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/uPwqlHIbPvxIm2OIRzAizXhtcWToUYgv/Z5P/MIp/A=; b=GtU+/vED3LhGlgFOnW5jJQVh4W
	1r6GAOF/CiJ3eerUZVIC+D6rO+NPvwmrp4PyOAmAGVD28QS3tYtWL4d9rQqz3eIL0FtG8QO1QKHnK
	XTANdhHa37D0yvmNvIsppRvd2YDd1o+KSR5b/SFC9cincb6UREFaEVAMLoIMd5UKbJdBIvLPHh6C8
	yikSbxGQBACVQts1Si/CnZdLWHarpOZv2DZ54gQu1KA6Yi/GCkgN897vfcfozp6GST+4SN4HfstN5
	qr6Ym3IwcVtT9I2tP6SITHBMVE7ciPY3hJBB64CejDL8pCe4elOPs8agG3AcCmtg04jGL0WHzAhWy
	d96Lsnyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFCI-00000003PN9-42jk;
	Wed, 26 Feb 2025 11:03:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEoN-00000003KPt-1EES
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:38:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A2141BA8;
	Wed, 26 Feb 2025 02:38:53 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 601753F6A8;
	Wed, 26 Feb 2025 02:38:35 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/2] clk: sunxi-ng: d1: Fix halved MMC frequency
Date: Wed, 26 Feb 2025 10:37:32 +0000
Message-Id: <20250226103734.1252013-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_023843_372853_3307C217 
X-CRM114-Status: GOOD (  14.08  )
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

Hi,

as Kuba reported, on an Allwinner T113-s3 based board the SD card
performance is only half of what we expect: ~11 MB/s instead of the
usual 23 MB/s.
Looking at our MMC mod clock definition, this seems to be due to a
missing fixed (and hidden) divider of 2, a "feature" of every other
Allwinner SoC from the last 10 years.

Patch 2/2 changes the MMC mod clock definition to carry this post_div
of 2, in line with the A64, H6, A100, and H616 SoCs.
Since the D1 clock driver describes clock parents using an array of
pointers, we need to use a new macro that allows both parent_data and
post_div to be specified. This is also needed by the new A523 clocks,
so I lifted the patch from there[1]. Chen-Yu reviewed that one already,
but I made some changes to make the macro more flexible, so I dropped
his tag.

I couldn't test this on a D1 board, so I'd be grateful if someone could
confirm that the SD card performance is now as expected. I simply used
"hdparm -t" to get a ballpark number of read performance, but any other
benchmark or even a timed file copy should do.

Thanks to Kuba for the report!

Cheers,
Andre

[1]
https://lore.kernel.org/linux-sunxi/20250214125359.5204-1-andre.przywara@arm.com/T/#m9adaa1fcea09185c561f3fd01ba895fa67af456c

Andre Przywara (2):
  clk: sunxi-ng: mp: provide wrapper for setting feature flags
  clk: sunxi-ng: d1: Add missing divider for MMC mod clocks

 drivers/clk/sunxi-ng/ccu-sun20i-d1.c | 43 ++++++++++++++++------------
 drivers/clk/sunxi-ng/ccu_mp.h        | 19 ++++++++++--
 2 files changed, 42 insertions(+), 20 deletions(-)

-- 
2.25.1


