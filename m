Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E943CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 22:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgA1DfGNrfOBt1OVKRPv+ER/a3F57vpvG01ZXsSAyhs=; b=JbO9e1KHsbD1XTNashJ8wmmdne
	Dm/UnzP6fxApzwvx/MQE/ej6ABbDh5mRo+UE2N3bUB2tRCOp+YS7ibMvd6lVXVeI+ganJAF0Egt+j
	zazlGSkd/4giWGuNhMo7nlbf1SRHC21+Ms1cVSY8gUfYYbEgd8NDmj7TlT/YjF8XnkDSBkZtth2b1
	89tkO3BKadraT1VS8emaLSKjlHoDBWqj+oyMtiFqYIN7VuLBuqbztJq1yVhbIlPK6WN9QFED/r3LS
	Z2ROTtF0cZC8LSL4M0p7eu8huNIq64VPZayWi2vjg9l9vW8v8RpTbdQhqWDMlqlALz9gUkLuqvcZp
	lNa1xNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUOi-0000000FP7W-3dtX;
	Sun, 04 Oct 2026 22:09:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUOh-0000000FP7Q-0Yif
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 22:09:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 032F860200;
	Sun,  4 Oct 2026 22:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425C01F000FF;
	Sun,  4 Oct 2026 22:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791151769;
	bh=CgA1DfGNrfOBt1OVKRPv+ER/a3F57vpvG01ZXsSAyhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hMngzF0NokD97R5TxX1Qvwe6lSC3LTvhAJEE/RXtAzhrCw/OVfue7LQpdyKwu3i8L
	 XmUTKqvfwT78ExIF7uDGJVOCziiL1Gfh/7hLebo8i6k+nw2vfmm3D/+EiqchaAMaeM
	 8WoGdWZ11JMW7m6w50m2anUdgPRU/iZWxG8X+0TevCT33A28QyHdkIRdAHa2mOerO3
	 VJN6HNp7bDkOmyTae8Xa+Lp6gBmeFmKdkNygSRWPo1n3WuMoZsex+Qn2J/DEpudWf5
	 r8Wc8oJXZSgZaSJBHci0yztuBPic4DEun2+JfrNfbSHVQx+G0eyztjHX4dGK8ar6JA
	 cm9IgMh1HXzlw==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Yury Norov <ynorov@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: marvell: avoid large stack variables
Date: Sun,  4 Oct 2026 23:09:13 +0100
Message-ID: <179113453253.1503657.5347304408862116037.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925130440.4107512-1-arnd@kernel.org>
References: <20260925130440.4107512-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Fri, 25 Sep 2026 15:04:30 +0200, Arnd Bergmann wrote:
> The probe function in this driver constructs multiple large structures
> on the stack, which ends up causing a size warning:
> 
> drivers/perf/marvell_cn10k_ddr_pmu.c:1168:12: error: stack frame size (1296) exceeds limit (1280) in 'cn10k_ddr_perf_probe' [-Werror,-Wframe-larger-than]
>  1168 | static int cn10k_ddr_perf_probe(struct platform_device *pdev)
>       |            ^
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/1] perf: marvell: avoid large stack variables
      https://git.kernel.org/arm64/c/7e17084177aa

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

