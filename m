Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36175C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 16:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2QN1R9cEP+65/eaKbkkpietz+IIKIO9R9b6vVssGVA=; b=glnhmbCnp/BBqJIAqQFBwG24nw
	x/HKZGu82ZN5GfPg9MyX3IxQ52YUvRXTvygwH0Y0oukXcVtAc2O6SF0si+nhfX3IfTziV8vqamNDm
	KHMIIYvh5XWFH8DAaIJz6C3t23Kc5DksO0RXt7oS6Q5BNFVd7wCweeDt79I/ihoi5+HKFkeFPYD5x
	aO3C9atcjDMAmvJ2xa+1Lecnmb+gP3RO7uDRTgaP7MkC7nurTb9z2VG3z0GAXz1+R2pm6wLIloGQ5
	h/ni5/lSaQrdscMivC/Yq8scfqJlaHOWb2P90C+VeACXZsSme0wU/xhYij3CwfLfpF8X31aeQH8B7
	lOzeqdiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ms8-00000001oON-3pMd;
	Sun, 13 Sep 2026 16:16:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ms7-00000001oO4-1qBW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 16:16:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ADB2F41149;
	Sun, 13 Sep 2026 16:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C4A1F000FF;
	Sun, 13 Sep 2026 16:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789316162;
	bh=b2QN1R9cEP+65/eaKbkkpietz+IIKIO9R9b6vVssGVA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oRCCBoBzGCO2WSuWyFbKyFY4UEl/Zz8HdyalS/m7VI4lHJFbXRF9FT8g/Ay2mjgbT
	 POLU0wOnyTijCQBSXXAw0z9C76xOnDw0J8qGaF3/fEOubRusUB/BbWJlvfOFC4rR3B
	 0YnDrbHpI7JCoYGpHeCkPuY+4JHIq5aue4aRjLzSJV4ClQnt8faIKbj+VLkhkdnlde
	 +NFPA2YKHBjQ+ECA4oXTXje5dfjmF0Uq0NCc3mXm50X+mDm9rL/Q5sx/lg7FBYd00D
	 3wYevpuOLNH2XvuJuKjb0H9e0JtA210EHq59Ypya+ZZVudMzlrIKdLfCT0411Zl39U
	 k83Uud6h7ZTug==
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech>
References: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech>
Subject: Re: [PATCH 0/4] clk: sunxi-ng: a523: Fix single-divider clocks
Message-Id: <178931616050.1372417.13697138134958064084.b4-ty@kernel.org>
Date: Mon, 14 Sep 2026 00:16:00 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Sun, 06 Sep 2026 15:06:37 +0800, Junhui Liu wrote:
> Sashiko pointed out two issues in my series adding clock driver support
> for the Allwinner A733 SoC [1][2].
> 
> First, ccu_mp_set_rate() generates an invalid mask when an MP clock is
> defined with a zero-width P divider, clearing unrelated register fields.
> Second, ccu_mp_set_rate() does not handle CCU_FEATURE_UPDATE_BIT, so
> divider changes are not latched by the hardware.
> 
> [...]

Applied to sunxi/clk-for-7.4 in sunxi, thanks!

[1/4] clk: sunxi-ng: div: Add feature support to M clock macro
      https://git.kernel.org/sunxi/linux/c/da543a093f65
[2/4] clk: sunxi-ng: sun55i-a523-ccu: Use M-only clocks for MBUS, IOMMU and DRAM
      https://git.kernel.org/sunxi/linux/c/88735a2ffbea
[3/4] clk: sunxi-ng: sun55i-a523-ccu: Use P-only clocks for high-speed timers
      https://git.kernel.org/sunxi/linux/c/4b41d0ffa9d9
[4/4] clk: sunxi-ng: sun55i-a523-r-ccu: Use P-only clocks for timers
      https://git.kernel.org/sunxi/linux/c/b260db91603a

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


