Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93993C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j45inTajr9nKIwrixDI8M795BQqQJiKM1YKGRqJLPjg=; b=QZxXWBC4cUaSXHQQs8vpBj7Cyd
	+bZXSTJy2I+26qKGCDwuokA3+H4WedBsAhh70JcUZ3lmN3kHhF5EDgoEgUA2jFVhobKJgiXROotKB
	s32O1Zvr3tRuGOGP1eO8If7LGrCM/qVoOXrdfCoRsL4Iwr6RgHCG6fsWhLANcD+EVYV2LCSsxpgF5
	b2ylGbawRV3fHY4ZpohPvG0e/tF+33JcKXrDXz3SVYIqWpSyg6qpsdmEkpYpbx2MinzQjxk1i8GaY
	eevS9X6VxgyOG87XtwiZsXr1at8vlcUmHdXcfOWREtdTU0Xd+LKQPAmpjQ1gsZnWKwDKvOml+y/50
	Q9NNnwIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAT8x-0000000FheX-1so6;
	Thu, 01 May 2025 12:35:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASo7-0000000FTmq-3QNo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 12:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92B6C44D97;
	Thu,  1 May 2025 12:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C14C4CEE3;
	Thu,  1 May 2025 12:14:26 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 1FFD95F949;
	Thu,  1 May 2025 20:14:24 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250430095325.477311-1-andre.przywara@arm.com>
References: <20250430095325.477311-1-andre.przywara@arm.com>
Subject: Re: [PATCH] clk: sunxi-ng: fix order of arguments in clock macro
Message-Id: <174610166405.2974716.1586244113913047340.b4-ty@csie.org>
Date: Thu, 01 May 2025 20:14:24 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_051427_882950_FF209DC0 
X-CRM114-Status: UNSURE (   8.34  )
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

On Wed, 30 Apr 2025 10:53:25 +0100, Andre Przywara wrote:
> When introducing the SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT macro, the order
> of the last two arguments was different between the users and the
> definition: features became flags and flags became features.
> 
> This just didn't end up in a desaster yet because most users ended up
> passing 0 for both arguments, and other clocks (for the new A523 SoC) are
> not yet used.
> 
> [...]

Applied to clk-fixes-for-6.15 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] clk: sunxi-ng: fix order of arguments in clock macro
      commit: 4a9c3c3215491f25bc66d615faa921c814b1a479

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


