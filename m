Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD58C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akYXzfxuYvHN4V6UEHcS/ZSPV5531VqsvYDTHRVkJIM=; b=IPAFOom0VfhGBMltmh7jmdjVeV
	3/wamvNb5Z7q7U6pe4+fAggd+hcOX0KSqna02bbPqpTN89Oqxv46esXvzCYiYdPiE5rJDrlhpCpfM
	ADhwZ5nEnViiYY/j4pbpEn+33tqJKpZOIsOJCdnKA+bhJ4PI7lDHRAH9bawgVJJNovt7O0rQjMNM0
	0kS3DHmOGGggV6ybfRWBFjBRQ1DPZ7/bxSf4rVuYL1jt2ZtKvBSnVJsVs3AsGqYYkxizHjfPMju3W
	mikSaUScOasuBK7kflB60UxaQLZz9SdDQ9hMm/qDc5i3AoSFcU5Brxorp2IudKa5ElnCwtFy27hVs
	djdvw8Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtS3c-0000000CHYQ-3esQ;
	Mon, 10 Aug 2026 15:36:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtS3a-0000000CHXR-2rDb;
	Mon, 10 Aug 2026 15:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786376211;
	bh=pMymhqUpqlZ74YRu8rpj+qRCN2Hay1Xn7UMg04yfTgc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dtvWgb+PYtcHuk/SWGr9mlaXksFDfM0PwHErNtdNxn1OFct3eZWvkJHQryHHeawFW
	 rUKkfrDkKd+traekHupo8Gvq264LI0FjktOlnIgWgA1GpnvyZOWnXjWmz5MNiDczxT
	 fcQlh4lq3Fojz44fXxGATFcH4BtaSPR4kPwXCq1d18yf5ZjOtQdexbrwE8tUyw6ShE
	 8n+uPB2w+NYv0QbuezHLHEE3MDId6hKBTMKUM4iGXEZrCLSkAqoUuLrj2jatG7fjYn
	 a1xSYmMvo2Q2r4/CHF4fN1rRxm3WyZhrdpmUDtr/Yu6nZovo4umD8Zw6zDY/e4QBOQ
	 NARr564V77J6Q==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EE8017E0967;
	Mon, 10 Aug 2026 17:36:51 +0200 (CEST)
Message-ID: <33bd4a94-11af-4cf3-ae44-b7f8944250f6@collabora.com>
Date: Mon, 10 Aug 2026 18:36:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/rockchip: vop2: ACLK_VOP pinned at 500 MHz starves DP 4K120
 on RK3588
To: Igor Paunovic <royalnet026@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexey Charkov <alchark@flipper.net>
References: <20260808104240.13776-1-royalnet026@gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260808104240.13776-1-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_083654_883751_E44EA26F 
X-CRM114-Status: GOOD (  33.92  )
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

Hi Igor,

On 8/8/26 1:42 PM, Igor Paunovic wrote:
> Hello,
> 
> On RK3588 the VOP2 AXI clock is pinned to 500 MHz by device tree and
> nothing in mainline ever raises it.  For DisplayPort at 3840x2160@120
> that is not enough bandwidth, and the failure is not graceful: the
> video port floods POST_BUF_EMPTY interrupts and the picture is
> corrupted.
> 
> I mentioned this in passing when I sent a Tested-by for the dw-dp v11
> series:
> https://lore.kernel.org/all/20260808094138.7205-1-royalnet026@gmail.com/
> 
> The pin is explicit.  In arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> the cru node lists <&cru ACLK_VOP> in assigned-clocks with 500000000 in
> the matching position of assigned-clock-rates.  It is a deliberate
> assignment rather than a boot default, and it is identical in mainline
> and in the Collabora rockchip-devel branch.
> 
> The rate request does propagate.  ACLK_VOP is registered as a gate with
> flags 0 in clk-rk3588.c, but drivers/clk/rockchip/clk.c adds
> CLK_SET_RATE_PARENT for every branch_gate, so a request on aclk_vop
> travels up through aclk_vop_sub_src (a mux carrying the same flag) to
> aclk_vop_root, which is a settable composite.
> 
> What I measured, on an Orange Pi 5 Plus driving a DP monitor over USB-C
> Alt Mode at 3840x2160@120 (YCbCr 4:2:0, so dclk sits at 594 MHz), on
> drm-misc-next of 2026-08-07 (dc2f9f7fed1a) plus the dw-dp v11 and usbdp
> v13 series.  I built with CLOCK_ALLOW_WRITE_DEBUGFS and changed the
> rate by writing aclk_vop_root's clk_rate in clock debugfs, one level
> up, which has the same effect.  The mode was unchanged across all three
> phases, so dclk stayed at 594 MHz and the AXI rate was the only thing
> that moved:
> 
>   500 MHz:  vop2_isr reported ~594000 suppressed callbacks per 5 s,
>             roughly 119k interrupts per second, all POST_BUF_EMPTY on
>             the DP video port; picture unusable
>   750 MHz:  no POST_BUF_EMPTY logged at all for 42 s, the whole phase;
>             the picture became correct the moment the write landed
>   500 MHz:  ~607000 suppressed callbacks per 5 s; broken again
> 
> Both transitions are immediate, and the timestamps line up with the
> phases of my test script.
> 
> Everything I can drive up to 2560x1440@144 (about 586 MHz pixel clock)
> stays clean at 500 MHz; 3840x2160@120 (1188 MHz) does not.  That
> comparison comes from a mode sweep on my rockchip-devel based daily
> kernel rather than from the run above, and my monitor offers nothing in
> between, so I cannot bisect the threshold.
> 
> In mainline rockchip_drm_vop2.c there is no clk_set_rate() on the VOP
> aclk at all; the only clk_set_rate() in the file is on vp->dclk.  To
> reproduce: enable dp0 on an RK3588 board - it is disabled in the
> mainline DTS, so this needs a board DT change - drive a DP monitor at
> 3840x2160@120, and watch dmesg or the vop interrupt count in
> /proc/interrupts.
> 
> The only code I know of that raises the rate is a commit in the
> Collabora rockchip-devel branch, "drm/rockchip: vop2: Scale ACLK rate
> up for RK3588 FRL display modes" by Cristian Ciocaltea.  It defines a
> 750 MHz rate and calls clk_set_rate() from vop2_crtc_atomic_enable()
> and _disable(), gated on vcstate->frl_enabled with a refcount over the
> video ports.  I could not find it on lore, but I may well have missed
> it.

I haven't submitted that yet; it's part of a work-in-progress FRL enablement
patchset that's currently blocked on the HDMI 2.0 support series [1], still
under review upstream.

> If that is the intended shape of the fix, DisplayPort still would not
> benefit: frl_enabled is set only by dw_hdmi_qp-rockchip.c, and neither
> dw-dp.c nor dw_dp-rockchip.c mentions FRL at all, so the condition is
> HDMI specific while the bandwidth problem is not.  It also explains
> what I had been seeing since I enabled dp0 on this board last week:
> 4K120 over USB-C only worked while an HDMI output happened to be
> running in FRL mode.
> 
> Raising the DT rate to 750 MHz unconditionally would be simpler, but it
> would cost power on boards that never drive such a mode, which is
> presumably the reason for making it dynamic.

Yes.

> Cristian, Heiko - hence my question: should the ACLK rate be derived
> from the bandwidth the enabled video ports actually need, rather than
> from an HDMI-specific link flag?  A per-video-port requirement combined
> with max() across the active ports would cover DP and HDMI under one
> rule and would not need a refcount.

Unfortunately, deriving ACLK purely from bandwidth wouldn't suffice as a general
solution for HDMI. FRL and TMDS overlap for certain display modes, and hardware
may impose its own limits on max TMDS character rate and/or supported min/max
FRL bandwidth - so the same mode can map to different ACLK requirements
depending on which link type is used. 

Later, we might want to support user-prioritization of FRL over TMDS, even for
modes that TMDS could otherwise handle cleanly. Since FRL uses fixed rates
regardless of the active display mode, ACLK can't be reliably inferred from the
mode alone for HDMI.

DP may still follow a bandwidth-derived max() rule, though I haven't been
personally involved in the DP use-case. I recall Alexey (added to CC) mentioning
additional issues with PLL rates on RK3576, I think [2] is the most recent one. 

Cheers,
Cristian

[1] https://lore.kernel.org/all/20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com/
[2] https://lore.kernel.org/all/CAKTNdwFPhVrjb4iVpN19f0Nw+MA_BxXLOLs4V50fuyf+_rbEPg@mail.gmail.com

