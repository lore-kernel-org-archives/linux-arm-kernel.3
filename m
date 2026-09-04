Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C16C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 02:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRizJp23wPSCe5WsFPxEB6JBq79SZp7y8nKA/UZLjq0=; b=Vhss71KXr7ROzdkf99n6f2ILF+
	GvmakP0Fah/DTH9LUZJor6vn+1I4H+6zF4XwZi3ADFW6nN2bAmON+MpRK3bAyTnWjuuumrPq4T+Uj
	DKuz5/mbNWXd+PvBe8NXXr2R3YNDXkrkRZnBAbDoV/LbNDL6dodjZkQTr9NY+zT23jLqVspi0LFzA
	NDPOsWd3O0IfRxQjLUO6H9Tt9WR5CcO0X4bU7Zt55sMwHN6hd5NUyfxRp3ICG7J17iafczb+oO8ov
	3+zY9K2C3c2t91fV1/Zd4k47yVOykh6OfNegCNJE0un4yKKEZa9RnAwsMjXotUJrpypOVB7BpliXb
	mPsz7tuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Jwf-00000000tEV-0SyH;
	Fri, 04 Sep 2026 02:46:25 +0000
Received: from mail-m16023652205.xmail.ntesmail.com ([160.236.52.205])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Jwa-00000000tCK-3Yqt;
	Fri, 04 Sep 2026 02:46:24 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c7eb8f85;
	Fri, 4 Sep 2026 10:46:08 +0800 (GMT+08:00)
Message-ID: <f2cdc86f-1f8f-405d-a9c1-3e9059d62f96@rock-chips.com>
Date: Fri, 4 Sep 2026 10:46:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/rockchip: vop: don't round the pixel clock when
 the encoder owns the PLL
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20260901234351.190506-1-anarsoul@gmail.com>
 <20260901234351.190506-2-anarsoul@gmail.com>
 <02c265f6-0898-4f11-9954-df7d99d082a0@rock-chips.com>
 <CA+E=qVeqOahu7v4ser0zxxUU6Fr4dGAVA9m_mgHgu70ChYv9Gg@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CA+E=qVeqOahu7v4ser0zxxUU6Fr4dGAVA9m_mgHgu70ChYv9Gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa06a4f2a9003a7kunm70e050c89bd3e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTE0dVkgYSkhOQ0pCSRpLS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=i0xSyO6xr+xQMg0Itknu5ALMXB46Nbr8PgbY6KTxEP7jRDixR7wfqEuhzxks5DVCKXq2b+HF8tv4mDcLioBHAlTE+qBwxn25g2m9I9LImEf1AgtwYIdGlJ4FGZz1dywgvScF7fqOxAKhL0ySS8Ofz/HR77PhWhirq066G7BQ+B0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=iRizJp23wPSCe5WsFPxEB6JBq79SZp7y8nKA/UZLjq0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_194621_569047_8CB848DD 
X-CRM114-Status: GOOD (  30.45  )
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

Hello Vasily,

On 9/4/2026 6:19 AM, Vasily Khoruzhick wrote:
> On Tue, Sep 1, 2026 at 8:50 PM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>>
>> Hello Vasily,
> 
> Hi Chaoyi,
> 
>> On 9/2/2026 7:42 AM, Vasily Khoruzhick wrote:
>>> On RK3399 the HDMI reference clock is VPLL, a dedicated PLL that is a
>>> parent of the VOP dclk. dw_hdmi_rockchip_mode_valid() accepts a mode
>>> only if VPLL can produce its pixel clock, and encoder mode_set() then
>>> programs VPLL to that rate. However vop_crtc_mode_fixup() ran first,
>>> in the check phase, and rounded adjusted_mode->clock through
>>> clk_round_rate() on the dclk. At that point VPLL still sits at its
>>> previous rate, so the dclk composite picks whichever of VPLL/CPLL/GPLL
>>> gets closest at its *current* rate and stores that inexact value.
>>>
>>
>> Why did vop_crtc_mode_fixup() run first? Within drm_atomic_helper_check_modeset(),
>> mode_valid() is executed before mode_fixup().
> 
> Sorry, ambiguous wording on my part - "first" meant before the
> encoder's mode_set() programs the VPLL, not before mode_valid(). The
> order is as you say, and that's exactly the problem: mode_valid()
> rounds the pixel clock on the ref clock (the VPLL itself), whose rate
> table can produce 85.5 MHz, so the mode is accepted. mode_fixup()
> however rounds on the dclk composite - a different clock - which
> evaluates its mux parents at their current rates. During check the
> VPLL still runs at the previous mode's rate, so GPLL/7 = 84.857 MHz
> wins and gets stored in adjusted_mode->clock. mode_set() then programs
> the VPLL to that corrupted value in the commit phase. I can reword the
> commit message to make this clearer.
> 

I think I understand your point now. The encoder's
mode_fixup() yields 85.5 MHz, while the CRTC's mode_fixup() yields 
84.857 MHz. The patch effectively bypasses the CRTC mode_fixup(), 
so that both the encoder's mode_set() and the CRTC's atomic_enable() 
clk_set_rate() end up using 85.5 MHz. I think it's worth mentioning
this in the commit message.

>>> For 1366x768 (85.5 MHz) this yields GPLL/7 = 84.857 MHz. mode_set()
>>> then requests 84.857 MHz from VPLL, which the PLL rate table snaps
>>> down to 74.25 MHz, and the VOP ends up on GPLL/7. The panel receives a
>>> timing 0.75% slow, which some monitors misdetect (e.g. as 1195x768)
>>> and display distorted. Only modes whose clock happens to be an exact
>>> GPLL or CPLL fraction (74.25, 148.5, 297 MHz, ...) were unaffected.
>>>
>>
>> Did you designate VPLL as the parent clock of the VOP dclk in the DTS?
> 
> No, and it isn't needed: in the commit phase the encoder's
> atomic_mode_set() sets the VPLL to exactly the pixel clock before
> vop_crtc_atomic_enable() sets the dclk (mode-set runs before enables
> in the atomic helpers), so by then the dclk composite finds vpll/1 as
> an exact match and the mux selects VPLL by itself. Verified via
> clk_summary on the patched kernel: vpll = 85500000 feeding dclk_vop0 =
> 85500000. Pinning the parent in DT also wouldn't have fixed the bug -
> without CLK_SET_RATE_PARENT the check-phase clk_round_rate() against
> the still-stale VPLL would return the same wrong value.
> 
> See clk_summary for broken and working cases attached.
> 
>>> @@ -327,6 +327,12 @@ dw_hdmi_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
>>>
>>>       s->output_type = DRM_MODE_CONNECTOR_HDMIA;
>>>       s->bus_format = bus_format;
>>> +     /*
>>> +      * The reference clock (e.g. VPLL on RK3399) is a parent of the VOP
>>> +      * dclk, and mode_set() programs it to the pixel clock, which
>>> +      * mode_valid() already guaranteed it can produce.
>>> +      */
>>> +     s->dclk_exact = !!hdmi->ref_clk;
>>>
>>
>> What about RK3328? It uses hdmi->hdmiphy_clk.
> 
> RK3328 clock ownership is the inverse of RK3399's. hdmiphy_clk is only
> ever consulted (in mode_valid()); the encoder's mode_set() programs
> just ref_clk, which is NULL on RK3328, so the encoder never sets the
> PHY PLL - the promise dclk_exact expresses ("the encoder will program
> this rate itself at mode_set time") wouldn't be true there.
>

Given the complexity of clock trees across different platforms,
I think a better approach would be to implement functions like
rockchip_drm_dclk_round_rate() and rockchip_drm_dclk_set_rate(), 
which properly configure the parent clock to meet the frequency
requirements. Of course, the current approach is okay for me. :)

>>>  static bool vop_dsp_lut_is_enabled(struct vop *vop)
>>> @@ -1558,6 +1554,19 @@ static int vop_crtc_atomic_check(struct drm_crtc *crtc,
>>>       s = to_rockchip_crtc_state(crtc_state);
>>>       s->enable_afbc = afbc_planes > 0;
>>>
>>> +     /*
>>> +      * Round the pixel clock to what the dclk can really produce, unless
>>> +      * the encoder will program a dedicated dclk parent PLL to exactly
>>> +      * this rate at mode_set time. In that case the clock tree seen here
>>> +      * (with that PLL still at its old rate) would pick a worse, inexact
>>> +      * source and bake that rate into adjusted_mode, defeating the PLL.
>>> +      *
>>> +      * Same condition the atomic helpers use for the mode_fixup callback.
>>> +      */
>>> +     if ((crtc_state->mode_changed || crtc_state->connectors_changed) &&
>>> +         !s->dclk_exact)
>>> +             vop_crtc_adjust_clock(vop, &crtc_state->adjusted_mode);
>>> +
>>>       return 0;
>>>  }
>>>
>>
>> What about other display interfaces? For example, the .mode_fixup
>> corresponding to cdn-dp will not be called.
> 
> The rounding still runs for cdn-dp and all other interfaces: it moved
> into vop_crtc_atomic_check(), which is a CRTC callback and is invoked
> by drm_atomic_helper_check() regardless of the attached encoder - same
> as the old CRTC-level .mode_fixup was.
>

I still don't quite understand why we need to move this to CRTC atomic_check().
What's wrong with checking !s->dclk_exact in CRTC mode_fixup()? Thanks.

> Regards,
> Vasily

-- 
Best, 
Chaoyi

