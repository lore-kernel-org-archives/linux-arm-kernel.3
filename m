Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFFDC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 17:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTL1ay8L7h2oYaiuu+KP2EhJiEOxTf/sPMxct/Q5A7I=; b=5DH/WfTwnGfEdIFHnhcC5X206b
	ZZrNbGKgzamsWz2gOILxhgs1LcP2M58gix05YwAglo91jDQ4rnLeeOJ53nPdK8Mxv5uREGDsPBFK+
	vDApA3Bju/qq17cWzKlfokuTTxFVirgGqy/lAi3rCTLzatsnab4GXOuuwmA0z/ts1FlVnQfsddp55
	+l1+Vsas5gwqbhzKyaPxPWuo2JYk1xEgSSjt6Q0BpMjkQJoH7/KTxFcSt1S99DXY2MdF6nIwnNtg0
	5YJ98Bk7sAFaGrZ+pGCTAJbYrwHmrnEI5VKQDAhHhnlhWrjqP1D/1PIjUTprdatbUmZPoEp1mMMGL
	g4QCvbZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEt2q-0000000D1Tz-0jaj;
	Tue, 13 May 2025 17:03:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEshw-0000000CyQB-3WJw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:42:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1685B42BA6;
	Tue, 13 May 2025 16:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF11DC4CEE4;
	Tue, 13 May 2025 16:42:19 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 585885F806;
	Wed, 14 May 2025 00:42:17 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250501120631.837186-1-andre.przywara@arm.com>
References: <20250501120631.837186-1-andre.przywara@arm.com>
Subject: Re: [PATCH v2] clk: sunxi-ng: d1: Add missing divider for MMC mod
 clocks
Message-Id: <174715453733.4022265.13446217787280625298.b4-ty@csie.org>
Date: Wed, 14 May 2025 00:42:17 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_094220_914640_EB08F7D7 
X-CRM114-Status: UNSURE (   8.17  )
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

On Thu, 01 May 2025 13:06:31 +0100, Andre Przywara wrote:
> The D1/R528/T113 SoCs have a hidden divider of 2 in the MMC mod clocks,
> just as other recent SoCs. So far we did not describe that, which led
> to the resulting MMC clock rate to be only half of its intended value.
> 
> Use a macro that allows to describe a fixed post-divider, to compensate
> for that divisor.
> 
> [...]

Applied to sunxi/clk-fixes-for-6.15 in local tree, thanks!

[1/1] clk: sunxi-ng: d1: Add missing divider for MMC mod clocks
      commit: 98e6da673cc6dd46ca9a599802bd2c8f83606710

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


