Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196F0C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 17:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2A06E11dJcoAkc5npjBGpYdxmZnwWJg1jPV6ypYhs1I=; b=d3WJsD9hQIlBMNda3WTK3L4aLA
	vgrSXXX9fVR0b2HKJWpoYZejYQKwMba7BW5azTh6Hjvk31UVQxMZ5N20E+TRrTTAq9XURxN0BJDmO
	nhbiaGmbO/R6EZqPJrfJ2u0vV+ZDZBfuhw4IMRgv0FkxEevwpSMA9OtgI6DdBf/s/Y7UjXX3WeF6i
	TdNb1i9Y/2BWMZRPoYgP6DE6TV1A07AXSpRQuHi+nh2wWsNe7GMuP0LGqQVvixD+k/ApMRdFNRrhO
	HPIGXzxpAliEEXSLH684T08p6dZqglo4Kw6Gmqcpz0R5jQm8+/SA9PmzZhoI5KyIn9TZt9F9ubDt8
	fe7/inGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmFPd-0000000BTT6-1GPU;
	Sun, 23 Feb 2025 17:05:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmFO5-0000000BT4W-2cQu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 17:03:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A36375C3F85;
	Sun, 23 Feb 2025 17:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351EEC4CEDD;
	Sun, 23 Feb 2025 17:03:28 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 97A795FCC4;
	Mon, 24 Feb 2025 01:03:25 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Philippe Simons <simons.philippe@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250220113808.1122414-2-simons.philippe@gmail.com>
References: <20250220113808.1122414-1-simons.philippe@gmail.com>
 <20250220113808.1122414-2-simons.philippe@gmail.com>
Subject: Re: [PATCH v3 1/1] clk: sunxi-ng: h616: Reparent GPU clock during
 frequency changes
Message-Id: <174033020559.3257225.10440748576870743856.b4-ty@csie.org>
Date: Mon, 24 Feb 2025 01:03:25 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_090329_723186_2A72BE35 
X-CRM114-Status: UNSURE (   9.32  )
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

On Thu, 20 Feb 2025 12:38:08 +0100, Philippe Simons wrote:
> The H616 manual does not state that the GPU PLL supports
> dynamic frequency configuration, so we must take extra care when changing
> the frequency. Currently any attempt to do device DVFS on the GPU lead
> to panfrost various ooops, and GPU hangs.
> 
> The manual describes the algorithm for changing the PLL
> frequency, which the CPU PLL notifier code already support, so we reuse
> that to reparent the GPU clock to GPU1 clock during frequency
> changes.
> 
> [...]

Applied to clk-for-6.15 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] clk: sunxi-ng: h616: Reparent GPU clock during frequency changes
      commit: eb963d7948ce6571939c6875424b557b25f16610

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


