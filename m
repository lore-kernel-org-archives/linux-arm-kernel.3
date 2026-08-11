Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B06DC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 17:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RE6PaW6oiFSyel2UJhhOSEawLq+P9qyHEog1fKmmdL8=; b=Tv/bBT7c3ejAB49WRLrrXFMwIA
	WSVtDKxZNg42a0wJ6OF+ayCZhEuZgwMIGV+A7DzFEaCu81lTwpjQ57nY+sICc9iNUEe7ZnBo6Uq3Y
	EY2LB/sOsthxCHdV3iKWanRkMpAfAYLjOghB3tUcIyVutxPMK/gsFZXAkZSGEcRqvveGi/4qWRQgE
	KjwgaE0nMxEKskmNv9ti+k25L7mqz68dqN5ObdI9tC/79fCENGPejwBWWrErX0S+Hb4ZQsvUoFOtL
	Tbh665FmLk7skJxh8Mvp2vlLwWW2vOn7eM5SYo5vE1BN8m15mlDrLDfIUWhzAzsBuJC0d0+PNYXsE
	0iTXAb/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpt6-0000000EaPI-1sW8;
	Tue, 11 Aug 2026 17:03:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpt5-0000000EaOj-0nE7;
	Tue, 11 Aug 2026 17:03:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E1F4600C8;
	Tue, 11 Aug 2026 17:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B811F000E9;
	Tue, 11 Aug 2026 17:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786467818;
	bh=RE6PaW6oiFSyel2UJhhOSEawLq+P9qyHEog1fKmmdL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kVb8LJgRSqTvl0nIhU1rXpQ6Or5LyPpq408KhMHnOwhJ/iqKpkp0eXc81bEHRCrqS
	 4Eg6Gb3tU6qIYIWLZSsG2T5FfQJ/+6jK1AOtCOB0HXOLyuCR1ASZ+iOyWvnWQxIgb2
	 T0gtuV9vmvsckL+2C0t0lf9TOi8XDMKFBNXFEdvjhwR5VqYTtp4/7gIyyVnX/YbfCk
	 xOqxXpd+HSOKvWBP+jjgTGH8VKnp35wQvJMDm8bh0z0TWqiWWW7zULsollVwohQuIu
	 V01txlFGe6FmDGaFKNxfApj2StvSGLKUWJ2Feqsy5YObNjPcYWfnujrhrxkm7IgXZ2
	 yEN5V+x4pP79A==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Niederpr=C3=BCm?= <dubito@online.de>, 
 Simon Wright <simon@symple.nz>, Diederik de Haas <diederik@cknow-tech.com>, 
 Andy Yan <andyshrk@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Sashiko <sashiko-bot@kernel.org>, Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
Subject: Re: [PATCH v5 00/10] phy: rockchip: samsung-hdptx: Clock fixes and
 API transition cleanups
Message-Id: <178646781244.1081354.2111582665697305280.b4-ty@kernel.org>
Date: Tue, 11 Aug 2026 22:33:32 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Thu, 23 Jul 2026 22:41:43 +0300, Cristian Ciocaltea wrote:
> This series provides a set of bug fixes and cleanups for the Rockchip
> Samsung HDPTX PHY driver.
> 
> The first part of the series addresses clock rate calculation and
> synchronization issues.  Specifically, it fixes edge cases where the PHY
> PLL is pre-programmed by an external component (like a bootloader) or
> when changing the color depth (bpc) while keeping the modeline constant.
> Because the Common Clock Framework .set_rate() callback might not be
> invoked if the pixel clock remains unchanged, this previously led to
> out-of-sync states between CCF and the actual HDMI PHY configuration.
> 
> [...]

Applied, thanks!

[01/10] phy: rockchip: samsung-hdptx: Fix rate recalculation for high bpc
        commit: f0c2c9c58a48b621b1cb90f0821da422b31af814
[02/10] phy: rockchip: samsung-hdptx: Prevent divide-by-zero when computing clk rate
        commit: c4fe5a9f379055ce0ec930f6495ae62aad237b89
[03/10] phy: rockchip: samsung-hdptx: Guard against clk rate integer underflow
        commit: 229788526ff24e0607726e93b74dd2ef157a99cd
[04/10] phy: rockchip: samsung-hdptx: Fix rate recalculation for 3.2GHz FRL
        commit: 9ac3daadb9060360e937a5993a5fd88360d6fdad
[05/10] phy: rockchip: samsung-hdptx: Handle uncommitted PHY config changes
        commit: aec3e4ce25da4ed37bbbfedcbb7107ae9428b183
[06/10] phy: rockchip: samsung-hdptx: Drop TMDS rate setup workaround
        commit: c2dd42e3ebd76f24bdc21eafe17149bec2ce1394
[07/10] phy: rockchip: samsung-hdptx: Consolidate consumer_put on error path
        commit: e49e4bc9f90eeb6b672762c6f089e2fafec104c4
[08/10] phy: rockchip: samsung-hdptx: Drop restrict_rate_change handling
        commit: 1bb1b4769e43ecc8ed30bd30b6d4514614753f2c
[09/10] phy: rockchip: samsung-hdptx: Simplify GRF access with FIELD_PREP_WM16()
        commit: 859fd8ae691e8c89c881da5edf0a827531daa372
[10/10] phy: rockchip: samsung-hdptx: Consistently use bitfield macros
        commit: f3a8aba9c36f26b5bb1024653d9083f7e1e6d8c8

Best regards,
-- 
~Vinod



