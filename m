Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EAAECD985
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 17:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=At8U1jl+ybl9fM5aVC5vf8HsD8xpFMI1wv4WjwJGIIc=; b=tQ6xgXSYT7bIKz0Q6+miCJk+zY
	r2fiDAigotWX8NnKj0aAG/fahIIcSHIya8V7y1FRDSJV4rLfz8/5uTC4vNvh3Dh/gkr4JlY+8Xegv
	2Xo47kt5Vtt45xXxagAC39RkZFpWczmPLozSTLnBJwYhazEKbCQyVz6fj+cx5/qMNEGy5cEJyRdHX
	xfi+uXRIgL1JPpPL4aA2SLCGi2m8qun6667ZdhpazMqp4YDFlRt8PU8Rr+u0W+EWavnH2cCYUAIRy
	wWg+jva3Olfo27+fJudDHGA5orAh9h9HjJRRcHtIsTE6oZLgicA9IwC1c2jXvZvIanWBJRcFdQmi6
	RDZhJeDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo2kG-0000000AGSw-37VF;
	Thu, 05 Feb 2026 17:02:21 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo2kD-0000000AGSL-2fZP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 17:02:19 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso2351878a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 09:02:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770310935; cv=none;
        d=google.com; s=arc-20240605;
        b=K8D6TTnutZqYlIcHM9nLyTefdkLO6yHgFNP658IdiWEi/l6bJYEw0M1al1z8rTth23
         p1bzH0VnGO/LdgsuHFa1C4Kp132Em4wZ9hRjRpRBOJ0J6EHNXcOK9p/7t8Ij2gQoLcrh
         7Mko0NZIu5VjORv9nAU7By9FrYT1mKVnLQU96ux2FC7cHo+5UHTysxQguOaZbtSuZv8F
         DR1/SB0fiaz4dzbbKnFXqANvyqzrJBQcVHfmMXR8FJ7y6WOQ1UewVIIJqAK6bFqVcXWA
         iAzoDKj0eRuuDEmmZDrahrQbassp2Y7YG/Lbd0Ud3bxCLhU7GLKvk4smE5zbb5IVtrXa
         BL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=At8U1jl+ybl9fM5aVC5vf8HsD8xpFMI1wv4WjwJGIIc=;
        fh=mwTHzdHFD//tRCDzM02q5AXMgy8HNcb+pDqOFROzZrg=;
        b=QhkHY9cH7B1iqiHrTsncxWvFB0e8eJiQo2Q5f2gQgbMfpyQpRe1UK2+DbaKqxSB4RR
         5s4LQ+Bhq6hLT6BZtdUKcq16RZ+J6opFUdRSShr2PYUZzBHkOsEfk2adAhMuI7cY+qmS
         YAOI077cvJAFR1MufqaQJNoce8+L2Zkaom93vCyLc4+psDZ+owrD5/hCmcFGmCVM+jkq
         rEzjn6ZuKHCWzn2SS/FxBot7uh3mllDwYdWZX6YlDV4xieVCsNyNAero0I9kf4cbsUcV
         wLgjs3bNr5S5I9z3jXaXXbW3gY2Yr4zLZx14cmxxdrElhh0ylhkdi1jha/Ne5XVmPXe1
         XBDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770310935; x=1770915735; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=At8U1jl+ybl9fM5aVC5vf8HsD8xpFMI1wv4WjwJGIIc=;
        b=SB8fNy9A0PpIByEwk64S91ci0+NHtZgNwdJ5642upFw26i7zF4WLvtGEHx4Czp/TgR
         +nuK5W2nh0g9prk0KZg3RY7pOauvQo+7X4HNktMoJAaqOybSOes40LNAsvNJUR4zlt7P
         Ldjy7mG3d/oNGjk4qckBDOFV9UlOAiokS8mcqNe2T5gTNY3Xa3a7UKxyCaZEPe5Cufmj
         b9/GwJXpqA8bILEkMyVvvmBIQ9/Oz8XR1Mlx3S0x9Jp66rbjbPrP0E5wf1fu1/rlUzLA
         nz9njoJPWtuiwyBu8b91qwn2vWASAVSvjiCf4VZuszUbCQVp2BNB7+1TWBiwG7DffQcM
         Q5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770310935; x=1770915735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=At8U1jl+ybl9fM5aVC5vf8HsD8xpFMI1wv4WjwJGIIc=;
        b=VPifub8bTjQar8Ncj+EXcY/lqcA0dP5Qq37T+tJzh9n73qyLhcCZRXAnfba+Wk5qhE
         nzg2giIO+oG4YjI7E9HUa3Pwe0tBr0Mpu4pbDOfMoX3H1DcxBGYMhlSz0Iv9aZcZagT1
         V0+N7At89rxIKzl6N6vITyrdzEh5sjHDn+DzJ4PWD0RkuW9wBHccPbmpJ7hCg3d4a3pd
         XBGO3Vo2Y5mrwo8dPYJmgiT4ySP7HkPsMy9WJZPuAk4YK5vQRMK+U/bZtierTdraAysA
         NeqzOBb5QSwljvXvPLFQv2nQQ6TGQGP8v2hrRB6fHVhaGj2avvxoQPJvcYrL9uLKlgT6
         K71A==
X-Forwarded-Encrypted: i=1; AJvYcCXeFkthLLwzs3oCZ1U6VHdT1NG4v4QJYvbEHh+qH3M1qkI+b86aWWR4wFf3U4Cd7y2VCse07eZSxTrrz5FJslSX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7en9weCKJyEXzSoLf64ZB/uOuaUjX40qk7pgrNuOZL0SbNZ+y
	bNXRrmo73T9hkQ4+6Q2M1AW47vqsO9839CZjtHC6RxvRQFcWvU+5mc+9PWIFlRTSaeOupaw9hp0
	SJsh6WPMdnbNTsVkRwRGCnTiy9N7K/Otf/lOnSAiN7w==
X-Gm-Gg: AZuq6aLrK4GnPkctq2VinkHTPwc5ZRwIE1nw2Zlw04H/NS+QYgMCBYpzvNZbeNxAu3w
	AJKTqgM6iwpsVZWJMMfmZmpYh2FwidtdERZFFNaM0p9gM0BMmlVYPxg63XkFz5EF2GDMVoMZeZN
	+pngxtOjkn88yEr/K4pgO+16x5V8gwpsCSEEuX9zHKkPZYPbW6lEt5EDkio+tjCkImXyoqxleO5
	Vu23YYTyJK5BrhqOnywHanGEXu9d+Psegxv+oKm5lkgmb2oaPqch+oTQaITFGVAIG4etNrH+0Rc
	gMRVkI8aif3IsBDXZNTbE3zM
X-Received: by 2002:a05:6402:1447:b0:659:4383:c62c with SMTP id
 4fb4d7f45d1cf-65949fdae8dmr4214757a12.23.1770310934653; Thu, 05 Feb 2026
 09:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20260203161917.1666696-1-vincent.guittot@linaro.org>
 <20260203161917.1666696-4-vincent.guittot@linaro.org> <aYNl3yQXNa7SkpH9@shell.armlinux.org.uk>
In-Reply-To: <aYNl3yQXNa7SkpH9@shell.armlinux.org.uk>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 5 Feb 2026 18:02:03 +0100
X-Gm-Features: AZwV_Qgfbm38lIyULomiJpYo64N5MnTtbUGh_V-9md9DXD5l3OfRDQwbn20Aw8U
Message-ID: <CAKfTPtAAmwjwSJ_5kfARaOns-g5tnXdeGM4s2JOy5vnhNTTXYQ@mail.gmail.com>
Subject: Re: [PATCH 3/4 v2] phy: s32g: Add serdes xpcs subsystem
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com, 
	p.zabel@pengutronix.de, ghennadi.procopciuc@nxp.com, Ionut.Vicovan@nxp.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, horms@kernel.org, Frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_090218_013115_FDA49EDC 
X-CRM114-Status: GOOD (  25.89  )
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

On Wed, 4 Feb 2026 at 16:29, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Sorry, I don't have time to finish this review, nor cut down the context
> as I normally would do... I'm being bothered on company Slack, which now
> has the really bloody annoying feature of popping up a window rather than
> using KDE's notification subsystem, and that steals keyboard focus away
> from whatever one is trying to do at the time.
>
> On Tue, Feb 03, 2026 at 05:19:16PM +0100, Vincent Guittot wrote:
> > +static bool s32g_xpcs_poll_timeout(struct s32g_xpcs *xpcs, xpcs_poll_func_t func,
> > +                                ktime_t timeout)
> > +{
> > +     ktime_t cur = ktime_get();
> > +
> > +     return func(xpcs) || ktime_after(cur, timeout);
> > +}
> > +
> > +static int s32g_xpcs_wait(struct s32g_xpcs *xpcs, xpcs_poll_func_t func)
> > +{
> > +     ktime_t timeout = ktime_add_ms(ktime_get(), XPCS_TIMEOUT_MS);
> > +
> > +     spin_until_cond(s32g_xpcs_poll_timeout(xpcs, func, timeout));
> > +     if (!func(xpcs))
> > +             return -ETIMEDOUT;
>
> XPCS_TIMEOUT_MS is 300ms. spin_until_cond() spins until the condition is
> true. Do you need to tie up this CPU for up to 300ms? That seems
> excessive. What is the reason that read_poll_timeout() or similar
> couldn't be used?

This needs additional tests because some instabilities have been
reported when using read_poll_timeout in some places

>
> The advantage of read_poll_timeout() is that it will correctly handle
> the timeout vs condition being satisfied witout need for special code.
>
> > +
> > +     return 0;
> > +}
> > +
> > +static int s32g_xpcs_wait_bits(struct s32g_xpcs *xpcs, unsigned int reg,
> > +                            unsigned int mask, unsigned int bits)
> > +{
> > +     ktime_t cur;
> > +     ktime_t timeout = ktime_add_ms(ktime_get(), XPCS_TIMEOUT_MS);
> > +
> > +     spin_until_cond((cur = ktime_get(),
> > +                      (s32g_xpcs_read(xpcs, reg) & mask) == bits ||
> > +                      ktime_after(cur, timeout)));
> > +     if ((s32g_xpcs_read(xpcs, reg) & mask) != bits)
> > +             return -ETIMEDOUT;
>
> Same here:
>
>         return read_poll_timeout(s32g_xpcs_read, val, (val & mask) == bits,
>                                  0, XPCS_TIMEOUT_MS, false,
>                                  xpcs, reg);
>
> > +
> > +     return 0;
> > +}
> > +
> > +static unsigned int s32g_xpcs_digital_status(struct s32g_xpcs *xpcs)
> > +{
> > +     return s32g_xpcs_read(xpcs, VR_MII_DIG_STS);
> > +}
> > +
> > +static int s32g_xpcs_wait_power_good_state(struct s32g_xpcs *xpcs)
> > +{
> > +     unsigned int val;
> > +
> > +     return read_poll_timeout(s32g_xpcs_digital_status, val,
> > +                              FIELD_GET(PSEQ_STATE_MASK, val) == POWER_GOOD_STATE,
> > +                              0,
> > +                              XPCS_TIMEOUT_MS, false, xpcs);
>
> This could be:
>         return read_poll_timeout(s32g_xpcs_read, val,
>                                  FIELD_GET(PSEQ_STATE_MASK, val) == POWER_GOOD_STATE,
>                                  0, XPCS_TIMEOUT_MS, false,
>                                  xpcs, VR_MII_DIG_STS);
>
> eliminating the need for s32g_xpcs_digital_status().

fair enough

>
> > +}
> > +
> > +void s32g_xpcs_vreset(struct s32g_xpcs *xpcs)
> > +{
> > +     /* Step 19 */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_DIG_CTRL1, VR_RST, VR_RST);
> > +}
> > +
> > +static bool s32g_xpcs_is_not_in_reset(struct s32g_xpcs *xpcs)
> > +{
> > +     unsigned int val;
> > +
> > +     val = s32g_xpcs_read(xpcs, VR_MII_DIG_CTRL1);
> > +
> > +     return !(val & VR_RST);
> > +}
> > +
> > +int s32g_xpcs_wait_vreset(struct s32g_xpcs *xpcs)
> > +{
> > +     int ret;
> > +
> > +     /* Step 20 */
> > +     ret = s32g_xpcs_wait(xpcs, s32g_xpcs_is_not_in_reset);
> > +     if (ret)
> > +             dev_err(xpcs->dev, "XPCS%d is in reset\n", xpcs->id);
> > +
> > +     return ret;
> > +}
> > +
> > +int s32g_xpcs_reset_rx(struct s32g_xpcs *xpcs)
> > +{
> > +     int ret = 0;
> > +
> > +     ret = s32g_xpcs_wait_power_good_state(xpcs);
> > +     if (ret) {
> > +             dev_err(xpcs->dev, "Failed to enter in PGOOD state after vendor reset\n");
> > +             return ret;
> > +     }
> > +
> > +     /* Step 21 */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_RX_GENCTRL1,
> > +                          RX_RST_0, RX_RST_0);
> > +
> > +     /* Step 22 */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_RX_GENCTRL1,
> > +                          RX_RST_0, 0);
> > +
> > +     /* Step 23 */
> > +     /* Wait until SR_MII_STS[LINK_STS] = 1 */
> > +
> > +     return ret;
> > +}
> > +
> > +static int s32g_xpcs_ref_clk_sel(struct s32g_xpcs *xpcs,
> > +                              enum s32g_xpcs_pll ref_pll)
> > +{
> > +     switch (ref_pll) {
> > +     case XPCS_PLLA:
> > +             s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_MPLL_CMN_CTRL,
> > +                                  MPLLB_SEL_0, 0);
> > +             xpcs->ref = XPCS_PLLA;
> > +             break;
> > +     case XPCS_PLLB:
> > +             s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_MPLL_CMN_CTRL,
> > +                                  MPLLB_SEL_0, MPLLB_SEL_0);
> > +             xpcs->ref = XPCS_PLLB;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void s32g_xpcs_electrical_configure(struct s32g_xpcs *xpcs)
> > +{
> > +     /* Step 2 */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_TX_EQ_CTRL0,
> > +                          TX_EQ_MAIN_MASK, FIELD_PREP(TX_EQ_MAIN_MASK, 0xC));
>
> Prefer hex numbers to be lower case.

ok

>
> > +
> > +     /* Step 3 */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_CONSUMER_10G_TX_TERM_CTRL,
> > +                          TX0_TERM_MASK, FIELD_PREP(TX0_TERM_MASK, 0x4));
> > +}
> > +
> > +static int s32g_xpcs_vco_cfg(struct s32g_xpcs *xpcs, enum s32g_xpcs_pll vco_pll)
> > +{
> > +     unsigned int vco_ld = 0;
> > +     unsigned int vco_ref = 0;
> > +     unsigned int rx_baud = 0;
> > +     unsigned int tx_baud = 0;
> > +
> > +     switch (vco_pll) {
> > +     case XPCS_PLLA:
> > +             if (xpcs->mhz125) {
> > +                     vco_ld = FIELD_PREP(VCO_LD_VAL_0_MASK, 1360);
> > +                     vco_ref = FIELD_PREP(VCO_REF_LD_0_MASK, 17);
> > +             } else {
> > +                     vco_ld = FIELD_PREP(VCO_LD_VAL_0_MASK, 1350);
> > +                     vco_ref = FIELD_PREP(VCO_REF_LD_0_MASK, 27);
> > +             }
> > +
> > +             rx_baud = FIELD_PREP(RX0_RATE_MASK, RX0_BAUD_DIV_8);
> > +             tx_baud = FIELD_PREP(TX0_RATE_MASK, TX0_BAUD_DIV_4);
> > +             break;
> > +     case XPCS_PLLB:
> > +             if (xpcs->mhz125) {
> > +                     vco_ld = FIELD_PREP(VCO_LD_VAL_0_MASK, 1350);
> > +                     vco_ref = FIELD_PREP(VCO_REF_LD_0_MASK, 27);
> > +             } else {
> > +                     vco_ld = FIELD_PREP(VCO_LD_VAL_0_MASK, 1344);
> > +                     vco_ref = FIELD_PREP(VCO_REF_LD_0_MASK, 43);
> > +             }
> > +
> > +             rx_baud = FIELD_PREP(RX0_RATE_MASK, RX0_BAUD_DIV_2);
> > +             tx_baud = FIELD_PREP(TX0_RATE_MASK, TX0_BAUD_DIV_1);
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_VCO_CAL_LD0,
> > +                          VCO_LD_VAL_0_MASK, vco_ld);
> > +
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_VCO_CAL_REF0,
> > +                          VCO_REF_LD_0_MASK, vco_ref);
> > +
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_TX_RATE_CTRL,
> > +                          TX0_RATE_MASK, tx_baud);
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_RX_RATE_CTRL,
> > +                          RX0_RATE_MASK, rx_baud);
> > +
> > +     if (vco_pll == XPCS_PLLB) {
> > +             s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_CDR_CTRL,
> > +                                  VCO_LOW_FREQ_0, VCO_LOW_FREQ_0);
> > +     } else {
> > +             s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_CDR_CTRL,
> > +                                  VCO_LOW_FREQ_0, 0);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int s32g_xpcs_init_mplla(struct s32g_xpcs *xpcs)
> > +{
> > +     unsigned int val;
> > +
> > +     if (!xpcs)
> > +             return -EINVAL;
> > +
> > +     /* Step 7 */
> > +     val = 0;
> > +     if (xpcs->ext_clk)
> > +             val |= REF_USE_PAD;
> > +
> > +     if (xpcs->mhz125) {
> > +             val |= REF_MPLLA_DIV2;
> > +             val |= REF_CLK_DIV2;
> > +             val |= FIELD_PREP(REF_RANGE_MASK, RANGE_52_78_MHZ);
> > +     } else {
> > +             val |= FIELD_PREP(REF_RANGE_MASK, RANGE_26_53_MHZ);
> > +     }
> > +
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_REF_CLK_CTRL,
> > +                          REF_MPLLA_DIV2 | REF_USE_PAD | REF_RANGE_MASK |
> > +                          REF_CLK_DIV2, val);
> > +
> > +     /* Step 8 */
> > +     if (xpcs->mhz125)
> > +             val = FIELD_PREP(MLLA_MULTIPLIER_MASK, 80);
> > +     else
> > +             val = FIELD_PREP(MLLA_MULTIPLIER_MASK, 25);
> > +
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_MPLLA_CTRL0,
> > +                          MPLLA_CAL_DISABLE | MLLA_MULTIPLIER_MASK,
> > +                          val);
> > +
> > +     /* Step 9 */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_MPLLA_CTRL1,
> > +                          MPLLA_FRACN_CTRL_MASK, 0);
> > +
> > +     /* Step 10 */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_MPLLA_CTRL2,
> > +                          MPLLA_TX_CLK_DIV_MASK | MPLLA_DIV10_CLK_EN,
> > +                          FIELD_PREP(MPLLA_TX_CLK_DIV_MASK, 1) | MPLLA_DIV10_CLK_EN);
> > +
> > +     /* Step 11 */
> > +     if (xpcs->mhz125)
> > +             val = FIELD_PREP(MPLLA_BANDWIDTH_MASK, 43);
> > +     else
> > +             val = FIELD_PREP(MPLLA_BANDWIDTH_MASK, 357);
> > +
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_MPLLA_CTRL3,
> > +                          MPLLA_BANDWIDTH_MASK, val);
> > +
> > +     return 0;
> > +}
> > +
> > +static int s32g_xpcs_init_mpllb(struct s32g_xpcs *xpcs)
> > +{
> > +     unsigned int val;
> > +
> > +     if (!xpcs)
> > +             return -EINVAL;
> > +
> > +     /* Step 7 */
> > +     val = 0;
> > +     if (xpcs->ext_clk)
> > +             val |= REF_USE_PAD;
> > +
> > +     if (xpcs->mhz125) {
> > +             val |= REF_MPLLB_DIV2;
> > +             val |= REF_CLK_DIV2;
> > +             val |= FIELD_PREP(REF_RANGE_MASK, RANGE_52_78_MHZ);
> > +     } else {
> > +             val |= FIELD_PREP(REF_RANGE_MASK, RANGE_26_53_MHZ);
> > +     }
> > +
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_REF_CLK_CTRL,
> > +                          REF_MPLLB_DIV2 | REF_USE_PAD | REF_RANGE_MASK |
> > +                          REF_CLK_DIV2, val);
> > +
> > +     /* Step 8 */
> > +     if (xpcs->mhz125)
> > +             val = 125 << MLLB_MULTIPLIER_OFF;
> > +     else
> > +             val = 39 << MLLB_MULTIPLIER_OFF;
> > +
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_MPLLB_CTRL0,
> > +                          MPLLB_CAL_DISABLE | MLLB_MULTIPLIER_MASK,
> > +                          val);
> > +
> > +     /* Step 9 */
> > +     if (xpcs->mhz125)
> > +             val = FIELD_PREP(MPLLB_FRACN_CTRL_MASK, 0);
> > +     else
> > +             val = FIELD_PREP(MPLLB_FRACN_CTRL_MASK, 1044);
> > +
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_MPLLB_CTRL1,
> > +                          MPLLB_FRACN_CTRL_MASK, val);
> > +
> > +     /* Step 10 */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_MPLLB_CTRL2,
> > +                          MPLLB_TX_CLK_DIV_MASK | MPLLB_DIV10_CLK_EN,
> > +                          FIELD_PREP(MPLLB_TX_CLK_DIV_MASK, 5) | MPLLB_DIV10_CLK_EN);
> > +
> > +     /* Step 11 */
> > +     if (xpcs->mhz125)
> > +             val = FIELD_PREP(MPLLB_BANDWIDTH_MASK, 68);
> > +     else
> > +             val = FIELD_PREP(MPLLB_BANDWIDTH_MASK, 102);
> > +
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_MPLLB_CTRL3,
> > +                          MPLLB_BANDWIDTH_MASK, val);
> > +
> > +     return 0;
> > +}
> > +
> > +static void s32g_serdes_pma_high_freq_recovery(struct s32g_xpcs *xpcs)
> > +{
> > +     /* PCS signal protection, PLL railout recovery */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_DBG_CTRL, SUPPRESS_LOS_DET | RX_DT_EN_CTL,
> > +                          SUPPRESS_LOS_DET | RX_DT_EN_CTL);
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_MISC_CTRL0,
> > +                          PLL_CTRL, PLL_CTRL);
> > +}
> > +
> > +static void s32g_serdes_pma_configure_tx_eq_post(struct s32g_xpcs *xpcs)
> > +{
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_TX_EQ_CTRL1,
> > +                          TX_EQ_OVR_RIDE, TX_EQ_OVR_RIDE);
> > +}
> > +
> > +static int s32g_serdes_bifurcation_pll_transit(struct s32g_xpcs *xpcs,
> > +                                            enum s32g_xpcs_pll target_pll)
> > +{
> > +     int ret = 0;
> > +     struct device *dev = xpcs->dev;
> > +
> > +     /* Configure XPCS speed and VCO */
> > +     if (target_pll == XPCS_PLLA) {
> > +             s32g_xpcs_write_bits(xpcs, VR_MII_DIG_CTRL1, EN_2_5G_MODE, 0);
> > +             s32g_xpcs_vco_cfg(xpcs, XPCS_PLLA);
> > +     } else {
> > +             s32g_xpcs_write_bits(xpcs, VR_MII_DIG_CTRL1,
> > +                                  EN_2_5G_MODE, EN_2_5G_MODE);
> > +             s32g_xpcs_vco_cfg(xpcs, XPCS_PLLB);
> > +     }
>
> I am really not happy with this driver being
> PHY_INTERFACE_MODE_SGMII-only but supporting running that at 2.5Gbps.
> In the kernel, PHY_INTERFACE_MODE_SGMII is strictly _Cisco_ SGMII only,
> which means the version of it clocked at 1.25GHz, not 3.125GHz.
>
> OCSGMII or whatever random name you call it tends to be only supported
> without inband AN, and we have pushed everyone to adopt
> PHY_INTERFACE_MODE_2500BASEX for that. Please do the same.
>
> Should this SerDes be connected to a SFP cage, it will need to support
> dynamically switching between Cisco SGMII and 2500BASE-X.

okay, this needs to be checked with SoC Team

>
> > +
> > +     /* Signal that clock are not available */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_TX_GENCTRL1,
> > +                          TX_CLK_RDY_0, 0);
> > +
> > +     /* Select PLL reference */
> > +     if (target_pll == XPCS_PLLA)
> > +             s32g_xpcs_ref_clk_sel(xpcs, XPCS_PLLA);
> > +     else
> > +             s32g_xpcs_ref_clk_sel(xpcs, XPCS_PLLB);
> > +
> > +     /* Initiate transmitter TX reconfiguration request */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_TX_GENCTRL2,
> > +                          TX_REQ_0, TX_REQ_0);
> > +
> > +     /* Wait for transmitter to reconfigure */
> > +     ret = s32g_xpcs_wait_bits(xpcs, VR_MII_GEN5_12G_16G_TX_GENCTRL2,
> > +                               TX_REQ_0, 0);
> > +     if (ret) {
> > +             dev_err(dev, "Switch to TX_REQ_0 failed\n");
> > +             return ret;
> > +     }
> > +
> > +     /* Initiate transmitter RX reconfiguration request */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_RX_GENCTRL2,
> > +                          RX_REQ_0, RX_REQ_0);
> > +
> > +     /* Wait for receiver to reconfigure */
> > +     ret = s32g_xpcs_wait_bits(xpcs, VR_MII_GEN5_12G_16G_RX_GENCTRL2,
> > +                               RX_REQ_0, 0);
> > +     if (ret) {
> > +             dev_err(dev, "Switch to RX_REQ_0 failed\n");
> > +             return ret;
> > +     }
> > +
> > +     /* Signal that clock are available */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_TX_GENCTRL1,
> > +                          TX_CLK_RDY_0, TX_CLK_RDY_0);
> > +
> > +     /* Flush internal logic */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_DIG_CTRL1, INIT, INIT);
> > +
> > +     /* Wait for init */
> > +     ret = s32g_xpcs_wait_bits(xpcs, VR_MII_DIG_CTRL1, INIT, 0);
> > +     if (ret) {
> > +             dev_err(dev, "XPCS INIT failed\n");
> > +             return ret;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +/*
> > + * phylink_pcs_ops
> > + */
> > +
> > +static unsigned int s32cc_phylink_pcs_inband_caps(struct phylink_pcs *pcs,
> > +                                               phy_interface_t interface)
> > +{
> > +     switch (interface) {
> > +     case PHY_INTERFACE_MODE_SGMII:
> > +             return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE;
> > +
> > +     default:
> > +             return 0;
> > +     }
> > +}
> > +
> > +static int s32cc_phylink_pcs_config(struct phylink_pcs *pcs,
> > +                                 unsigned int neg_mode,
> > +                                 phy_interface_t interface,
> > +                                 const unsigned long *advertising,
> > +                                 bool permit_pause_to_mac)
> > +{
> > +     struct s32g_xpcs *xpcs = phylink_pcs_to_s32g_xpcs(pcs);
> > +
> > +     /* Step 1: Disable SGMII AN */
> > +     s32g_xpcs_write_bits(xpcs, SR_MII_CTRL, AN_ENABLE, 0);
> > +
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_AN_CTRL,
> > +                          MII_AN_INTR_EN,
> > +                          0);
> > +
> > +     if (!(neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED))
> > +             return 0;
> > +
> > +     /* Step 2  */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_AN_CTRL,
> > +                          PCS_MODE_MASK,
> > +                          FIELD_PREP(PCS_MODE_MASK, PCS_MODE_SGMII));
> > +
> > +     /* Step 3 */
> > +     s32g_xpcs_write_bits(xpcs, SR_MII_CTRL,
> > +                          SS13 | SS6,
> > +                          SS6);
> > +
> > +     /* Step 4  */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_AN_CTRL,
> > +                          MII_CTRL,
> > +                          0);
> > +     /* Step 5 and 8 */
> > +     if (xpcs->pcie_shared == PCIE_XPCS_2G5) {
> > +             s32g_xpcs_write(xpcs, VR_MII_LINK_TIMER_CTRL, 0x2faf);
> > +             s32g_xpcs_write_bits(xpcs, VR_MII_DIG_CTRL1,
> > +                                  MAC_AUTO_SW, MAC_AUTO_SW);
> > +     } else {
> > +             s32g_xpcs_write(xpcs, VR_MII_LINK_TIMER_CTRL, 0x7a1);
> > +             s32g_xpcs_write_bits(xpcs, VR_MII_DIG_CTRL1, MAC_AUTO_SW, 0);
> > +     }
> > +
> > +     /* Step 6 */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_DIG_CTRL1,
> > +                          CL37_TMR_OVRRIDE, CL37_TMR_OVRRIDE);
> > +
> > +     /* Step 7 */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_AN_CTRL,
> > +                          MII_AN_INTR_EN,
> > +                          MII_AN_INTR_EN);
> > +
> > +     /* Step 9: Enable SGMII AN */
> > +     s32g_xpcs_write_bits(xpcs, SR_MII_CTRL, AN_ENABLE, AN_ENABLE);
> > +
> > +     return 0;
> > +}
> > +
> > +static void s32cc_phylink_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
> > +                                     struct phylink_link_state *state)
> > +{
> > +     struct s32g_xpcs *xpcs = phylink_pcs_to_s32g_xpcs(pcs);
> > +     bool ss6, ss13, an_enabled;
> > +     struct device *dev = xpcs->dev;
> > +     unsigned int val, ss;
> > +
> > +     an_enabled = (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED);
> > +
> > +     if (an_enabled) {
> > +             state->link = 0;
> > +             val = s32g_xpcs_read(xpcs, VR_MII_AN_INTR_STS);
> > +
> > +             /* Interrupt is raised with each SGMII AN that is in cases
> > +              * Link down - Every SGMII link timer expire
> > +              * Link up - Once before link goes up
> > +              * So either linkup or raised interrupt mean AN was completed
> > +              */
> > +             if ((val & CL37_ANCMPLT_INTR) || (val & CL37_ANSGM_STS_LINK)) {
> > +                     state->an_complete = 1;
> > +                     if (val & CL37_ANSGM_STS_LINK)
> > +                             state->link = 1;
> > +                     else
> > +                             return;
> > +                     if (val & CL37_ANSGM_STS_DUPLEX)
> > +                             state->duplex = DUPLEX_FULL;
> > +                     else
> > +                             state->duplex = DUPLEX_HALF;
> > +                     ss = FIELD_GET(CL37_ANSGM_STS_SPEED_MASK, val);
> > +             } else {
> > +                     return;
> > +             }
> > +
> > +     } else {
> > +             val = s32g_xpcs_read(xpcs, SR_MII_STS);
> > +             state->link = !!(val & LINK_STS);
> > +             state->an_complete = 0;
> > +             state->pause = MLO_PAUSE_NONE;
> > +
> > +             val = s32g_xpcs_read(xpcs, SR_MII_CTRL);
> > +             if (val & DUPLEX_MODE)
> > +                     state->duplex = DUPLEX_FULL;
> > +             else
> > +                     state->duplex = DUPLEX_HALF;
> > +
> > +             /*
> > +              * Build similar value as CL37_ANSGM_STS_SPEED with
> > +              * SS6 and SS13 of SR_MII_CTRL:
> > +              *   - 0 for 10 Mbps
> > +              *   - 1 for 100 Mbps
> > +              *   - 2 for 1000 Mbps
> > +              */
> > +             ss6 = !!(val & SS6);
> > +             ss13 = !!(val & SS13);
> > +             ss = ss6 << 1 | ss13;
> > +     }
> > +
> > +     switch (ss) {
> > +     case CL37_ANSGM_10MBPS:
> > +             state->speed = SPEED_10;
> > +             break;
> > +     case CL37_ANSGM_100MBPS:
> > +             state->speed = SPEED_100;
> > +             break;
> > +     case CL37_ANSGM_1000MBPS:
> > +             state->speed = SPEED_1000;
> > +             break;
> > +     default:
> > +             dev_err(dev, "Failed to interpret the value of SR_MII_CTRL\n");
> > +             break;
> > +     }
> > +
> > +     val = s32g_xpcs_read(xpcs, VR_MII_DIG_CTRL1);
> > +     if ((val & EN_2_5G_MODE) && state->speed == SPEED_1000)
> > +             state->speed = SPEED_2500;
> > +
> > +     /* Cover SGMII AN inability to distigunish between 1G and 2.5G */
> > +     if ((val & EN_2_5G_MODE) &&
> > +         state->speed != SPEED_2500 && an_enabled) {
> > +             dev_err(dev, "Speed not supported in SGMII AN mode\n");
> > +     }
> > +}
> > +
> > +static void s32cc_phylink_pcs_link_up(struct phylink_pcs *pcs,
> > +                                   unsigned int neg_mode,
> > +                                   phy_interface_t interface, int speed,
> > +                                   int duplex)
> > +{
> > +     struct s32g_xpcs *xpcs = phylink_pcs_to_s32g_xpcs(pcs);
> > +     struct device *dev = xpcs->dev;
> > +     bool an_enabled = (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED);
> > +     unsigned int val;
> > +     int ret;
> > +
> > +     dev_dbg(dev, "xpcs_%d: speed=%u duplex=%d an=%d\n", xpcs->id,
> > +             speed, duplex, an_enabled);
> > +
> > +     if (an_enabled)
> > +             return;
> > +
> > +     s32g_xpcs_write_bits(xpcs, SR_MII_CTRL, AN_ENABLE, 0);
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_AN_CTRL, MII_AN_INTR_EN, 0);
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_AN_CTRL, MII_CTRL, 0);
>
> Haven't you already disabled AN in .pcs_config() ? This method doesn't
> change the AN enable state, the only time that happens is when
> .pcs_config() will be called. All other cases of passing neg_mode are
> merely informational.

Fair enough, this is probably not needed anymore with the changes in .pcs_config

>
> > +
> > +     if (duplex == DUPLEX_FULL)
> > +             val = DUPLEX_MODE;
> > +     else
> > +             val = 0;
> > +
> > +     s32g_xpcs_write_bits(xpcs, SR_MII_CTRL, DUPLEX_MODE, val);
> > +
> > +     switch (speed) {
> > +     case SPEED_10:
> > +             val = 0;
> > +             break;
> > +     case SPEED_100:
> > +             val = SS13;
> > +             break;
> > +     case SPEED_1000:
> > +             val = SS6;
> > +             break;
> > +     case SPEED_2500:
> > +             val = SS6;
> > +             break;
> > +     default:
> > +             dev_err(dev, "Speed not supported\n");
> > +             break;
> > +     }
> > +
> > +     if (speed == SPEED_2500) {
> > +             ret = s32g_serdes_bifurcation_pll_transit(xpcs, XPCS_PLLB);
> > +             if (ret)
> > +                     dev_err(dev, "Switch to PLLB failed\n");
> > +     } else {
> > +             ret = s32g_serdes_bifurcation_pll_transit(xpcs, XPCS_PLLA);
> > +             if (ret)
> > +                     dev_err(dev, "Switch to PLLA failed\n");
> > +     }
>
> This is a protocol transition, and isn't something that can be handled
> here. Cisco SGMII (PHY_INTERFACE_MODE_SGMII) does not support 2500Mbps
> and phylink will not allow it.
>
> See my comments for s32g_serdes_bifurcation_pll_transit().
>
> > +
> > +     s32g_xpcs_write_bits(xpcs, SR_MII_CTRL, SS6 | SS13, val);
> > +}
> > +
> > +static const struct phylink_pcs_ops s32cc_phylink_pcs_ops = {
> > +     .pcs_inband_caps = s32cc_phylink_pcs_inband_caps,
> > +     .pcs_get_state = s32cc_phylink_pcs_get_state,
> > +     .pcs_config = s32cc_phylink_pcs_config,
> > +     .pcs_link_up = s32cc_phylink_pcs_link_up,
> > +};
> > +
> > +/*
> > + * Serdes functions for initializing/configuring/releasing the xpcs
> > + */
> > +
> > +int s32g_xpcs_pre_pcie_2g5(struct s32g_xpcs *xpcs)
> > +{
> > +     int ret;
> > +
> > +     /* Enable voltage boost */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_TX_GENCTRL1, VBOOST_EN_0,
> > +                          VBOOST_EN_0);
> > +
> > +     /* TX rate baud  */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_TX_RATE_CTRL, 0x7, 0x0U);
> > +
> > +     /* Rx rate baud/2 */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_RX_RATE_CTRL, 0x3U, 0x1U);
> > +
> > +     /* Set low-frequency operating band */
> > +     s32g_xpcs_write_bits(xpcs, VR_MII_GEN5_12G_16G_CDR_CTRL, CDR_SSC_EN_0,
> > +                          VCO_LOW_FREQ_0);
> > +
> > +     ret = s32g_serdes_bifurcation_pll_transit(xpcs, XPCS_PLLB);
> > +     if (ret)
> > +             dev_err(xpcs->dev, "Switch to PLLB failed\n");
> > +
> > +     return ret;
> > +}
> > +
> > +int s32g_xpcs_init_plls(struct s32g_xpcs *xpcs)
> > +{
> > +     int ret;
> > +     struct device *dev = xpcs->dev;
> > +
> > +     if (!xpcs->ext_clk) {
> > +             /* Step 1 */
> > +             s32g_xpcs_write_bits(xpcs, VR_MII_DIG_CTRL1, BYP_PWRUP, BYP_PWRUP);
> > +     } else if (xpcs->pcie_shared == NOT_SHARED) {
> > +             ret = s32g_xpcs_wait_power_good_state(xpcs);
> > +             if (ret)
> > +                     return ret;
> > +     } else if (xpcs->pcie_shared == PCIE_XPCS_2G5) {
> > +             ret = s32g_xpcs_wait_power_good_state(xpcs);
> > +             if (ret)
> > +                     return ret;
> > +             /* Configure equalization */
> > +             s32g_serdes_pma_configure_tx_eq_post(xpcs);
> > +             s32g_xpcs_electrical_configure(xpcs);
> > +
> > +             /* Enable receiver recover */
> > +             s32g_serdes_pma_high_freq_recovery(xpcs);
> > +             return 0;
> > +     }
> > +
> > +     s32g_xpcs_electrical_configure(xpcs);
> > +
> > +     s32g_xpcs_ref_clk_sel(xpcs, XPCS_PLLA);
> > +     ret = s32g_xpcs_init_mplla(xpcs);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to initialize PLLA\n");
> > +             return ret;
> > +     }
> > +     ret = s32g_xpcs_init_mpllb(xpcs);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to initialize PLLB\n");
> > +             return ret;
> > +     }
> > +     s32g_xpcs_vco_cfg(xpcs, XPCS_PLLA);
> > +
> > +     /* Step 18 */
> > +     if (!xpcs->ext_clk)
> > +             s32g_xpcs_write_bits(xpcs, VR_MII_DIG_CTRL1, BYP_PWRUP, 0);
> > +
> > +     /* Will be cleared by Step 19 Vreset */
> > +     s32g_xpcs_write_bits(xpcs, SR_MII_CTRL, AN_ENABLE, 0);
> > +     s32g_xpcs_write_bits(xpcs, SR_MII_CTRL, DUPLEX_MODE, DUPLEX_MODE);
> > +
> > +     return ret;
> > +}
> > +
> > +void s32g_xpcs_disable_an(struct s32g_xpcs *xpcs)
> > +{
> > +     s32g_xpcs_write_bits(xpcs, SR_MII_CTRL, DUPLEX_MODE, DUPLEX_MODE);
> > +     s32g_xpcs_write_bits(xpcs, SR_MII_CTRL, AN_ENABLE, 0);
> > +}
>
> Sorry, but why? You should never override phylink's requests.

Serdes sometimes needs to be reset and the AN is enabled by default
after the reset and even before pcs_config has been called. This is
called during the inti of serdes after an ip reset.
That being said this might not be needed anymore after the change in
pcs_config that disables AN


>
> > +
> > +int s32g_xpcs_init(struct s32g_xpcs *xpcs, struct device *dev,
> > +                unsigned char id, void __iomem *base, bool ext_clk,
> > +                unsigned long rate, enum s32g_xpcs_shared pcie_shared)
> > +{
> > +     struct regmap_config conf;
> > +
> > +     if (rate != (125 * HZ_PER_MHZ) && rate != (100 * HZ_PER_MHZ)) {
> > +             dev_err(dev, "XPCS cannot operate @%lu HZ\n", rate);
> > +             return -EINVAL;
> > +     }
> > +
> > +     xpcs->base = base;
> > +     xpcs->ext_clk = ext_clk;
> > +     xpcs->id = id;
> > +     xpcs->dev = dev;
> > +     xpcs->pcie_shared = pcie_shared;
> > +
> > +     if (rate == (125 * HZ_PER_MHZ))
> > +             xpcs->mhz125 = true;
> > +     else
> > +             xpcs->mhz125 = false;
> > +
> > +     conf = s32g_xpcs_regmap_config;
> > +
> > +     if (!id)
> > +             conf.name = "xpcs0";
> > +     else
> > +             conf.name = "xpcs1";
> > +
> > +     xpcs->regmap = devm_regmap_init(dev, NULL, xpcs, &conf);
> > +     if (IS_ERR(xpcs->regmap))
> > +             return dev_err_probe(dev, PTR_ERR(xpcs->regmap),
> > +                                  "Failed to init register amp\n");
> > +
> > +     /* Phylink PCS */
> > +     xpcs->pcs.ops = &s32cc_phylink_pcs_ops;
> > +     xpcs->pcs.poll = true;
> > +     __set_bit(PHY_INTERFACE_MODE_SGMII, xpcs->pcs.supported_interfaces);
> > +
> > +     return 0;
> > +}
> > diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> > index 45184a3cdd69..bb7f59897faf 100644
> > --- a/drivers/phy/freescale/Kconfig
> > +++ b/drivers/phy/freescale/Kconfig
> > @@ -66,6 +66,7 @@ config PHY_S32G_SERDES
> >       tristate "NXP S32G SERDES support"
> >       depends on ARCH_S32 || COMPILE_TEST
> >       select GENERIC_PHY
> > +     select REGMAP
> >       help
> >         This option enables support for S23G SerDes PHY used for
> >         PCIe & Ethernet
> > diff --git a/drivers/phy/freescale/phy-nxp-s32g-serdes.c b/drivers/phy/freescale/phy-nxp-s32g-serdes.c
> > index 321a80c02be5..f2f7eb5aa327 100644
> > --- a/drivers/phy/freescale/phy-nxp-s32g-serdes.c
> > +++ b/drivers/phy/freescale/phy-nxp-s32g-serdes.c
> > @@ -12,12 +12,14 @@
> >  #include <linux/module.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/of_address.h>
> > +#include <linux/pcs/pcs-nxp-s32g-xpcs.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/processor.h>
> >  #include <linux/reset.h>
> >  #include <linux/units.h>
> >
> > +#define S32G_SERDES_XPCS_MAX                 2
> >  #define S32G_SERDES_MODE_MAX                 5
> >
> >  #define EXTERNAL_CLK_NAME                    "ext"
> > @@ -32,6 +34,52 @@
> >  #define S32G_PCIE_PHY_MPLLA_CTRL             0x10
> >  #define  MPLL_STATE                          BIT(30)
> >
> > +#define S32G_PCIE_PHY_MPLLB_CTRL             0x14
> > +#define  MPLLB_SSC_EN                                BIT(1)
> > +
> > +#define S32G_PCIE_PHY_EXT_CTRL_SEL           0x18
> > +#define  EXT_PHY_CTRL_SEL                    BIT(0)
> > +
> > +#define S32G_PCIE_PHY_EXT_BS_CTRL            0x1C
> > +#define  EXT_BS_TX_LOWSWING                  BIT(6)
> > +#define  EXT_BS_RX_BIGSWING                  BIT(5)
> > +#define  EXT_BS_RX_LEVEL_MASK                        GENMASK(4, 0)
> > +
> > +#define S32G_PCIE_PHY_REF_CLK_CTRL           0x20
> > +#define  EXT_REF_RANGE_MASK                  GENMASK(5, 3)
> > +#define  REF_CLK_DIV2_EN                     BIT(2)
> > +#define  REF_CLK_MPLLB_DIV2_EN                       BIT(1)
> > +
> > +#define S32G_PCIE_PHY_EXT_MPLLA_CTRL_1               0x30
> > +#define  EXT_MPLLA_BANDWIDTH_MASK            GENMASK(15, 0)
> > +
> > +#define S32G_PCIE_PHY_EXT_MPLLB_CTRL_1               0x40
> > +#define  EXT_MPLLB_DIV_MULTIPLIER_MASK               GENMASK(31, 24)
> > +#define  EXT_MPLLB_DIV_CLK_EN                        BIT(19)
> > +#define  EXT_MPLLB_DIV8_CLK_EN                       BIT(18)
> > +#define  EXT_MPLLB_DIV10_CLK_EN                      BIT(16)
> > +#define  EXT_MPLLB_BANDWIDTH_MASK            GENMASK(15, 0)
> > +
> > +#define S32G_PCIE_PHY_EXT_MPLLB_CTRL_2               0x44
> > +#define  EXT_MPLLB_FRACN_CTRL_MASK           GENMASK(22, 12)
> > +#define  MPLLB_MULTIPLIER_MASK                       GENMASK(8, 0)
> > +
> > +#define S32G_PCIE_PHY_EXT_MPLLB_CTRL_3               0x48
> > +#define  EXT_MPLLB_WORD_DIV2_EN                      BIT(31)
> > +#define  EXT_MPLLB_TX_CLK_DIV_MASK           GENMASK(30, 28)
> > +
> > +#define S32G_PCIE_PHY_EXT_MISC_CTRL_1                0xA0
> > +#define  EXT_RX_LOS_THRESHOLD_MASK           GENMASK(7, 1)
> > +#define  EXT_RX_VREF_CTRL_MASK                       GENMASK(28, 24)
> > +
> > +#define S32G_PCIE_PHY_EXT_MISC_CTRL_2                0xA4
> > +#define  EXT_TX_VBOOST_LVL_MASK                      GENMASK(18, 16)
> > +#define  EXT_TX_TERM_CTRL_MASK                       GENMASK(26, 24)
> > +
> > +#define S32G_PCIE_PHY_XPCS1_RX_OVRD_CTRL     0xD0
> > +#define  XPCS1_RX_VCO_LD_VAL_MASK            GENMASK(28, 16)
> > +#define  XPCS1_RX_REF_LD_VAL_MASK            GENMASK(14, 8)
> > +
> >  #define S32G_SS_RW_REG_0                     0xF0
> >  #define  SUBMODE_MASK                                GENMASK(3, 0)
> >  #define  CLKEN_MASK                          BIT(23)
> > @@ -44,6 +92,9 @@
> >
> >  #define S32G_PHY_REG_DATA                    0x4
> >
> > +#define S32G_PHY_RST_CTRL                    0x8
> > +#define  WARM_RST                            BIT(1)
> > +
> >  #define RAWLANE0_DIG_PCS_XF_RX_EQ_DELTA_IQ_OVRD_IN   0x3019
> >  #define RAWLANE1_DIG_PCS_XF_RX_EQ_DELTA_IQ_OVRD_IN   0x3119
> >
> > @@ -76,16 +127,33 @@ struct s32g_pcie_ctrl {
> >       bool powered_on;
> >  };
> >
> > +struct s32g_xpcs_ctrl {
> > +     struct s32g_xpcs *phys[2];
> > +     void __iomem *base0, *base1;
> > +};
> > +
> >  struct s32g_serdes {
> >       struct s32g_serdes_ctrl ctrl;
> >       struct s32g_pcie_ctrl pcie;
> > +     struct s32g_xpcs_ctrl xpcs;
> >       struct device *dev;
> > +     u8 lanes_status;
> >  };
> >
> >  /* PCIe phy subsystem */
> >
> >  #define S32G_SERDES_PCIE_FREQ                        (100 * HZ_PER_MHZ)
> >
> > +static void s32g_pcie_phy_reset(struct s32g_serdes *serdes)
> > +{
> > +     u32 val;
> > +
> > +     val = readl(serdes->pcie.phy_base + S32G_PHY_RST_CTRL);
> > +     writel(val | WARM_RST, serdes->pcie.phy_base + S32G_PHY_RST_CTRL);
> > +     usleep_range(1000, 1100);
> > +     writel(val, serdes->pcie.phy_base + S32G_PHY_RST_CTRL);
> > +}
> > +
> >  static int s32g_pcie_check_clk(struct s32g_serdes *serdes)
> >  {
> >       struct s32g_serdes_ctrl *sctrl = &serdes->ctrl;
> > @@ -277,6 +345,192 @@ static struct phy *s32g_serdes_phy_xlate(struct device *dev,
> >       return phy;
> >  }
> >
> > +/* XPCS subsystem */
> > +
> > +static int s32g_serdes_xpcs_init(struct s32g_serdes *serdes, int id)
> > +{
> > +     struct s32g_serdes_ctrl *ctrl = &serdes->ctrl;
> > +     struct s32g_xpcs_ctrl *xpcs = &serdes->xpcs;
> > +     enum s32g_xpcs_shared shared = NOT_SHARED;
> > +     unsigned long rate = ctrl->ref_clk_rate;
> > +     struct device *dev = serdes->dev;
> > +     void __iomem *base;
> > +
> > +     if (!id)
> > +             base = xpcs->base0;
> > +     else
> > +             base = xpcs->base1;
> > +
> > +     if (ctrl->ss_mode == 1 || ctrl->ss_mode == 2)
> > +             shared = PCIE_XPCS_1G;
> > +     else if (ctrl->ss_mode == 5)
> > +             shared = PCIE_XPCS_2G5;
> > +
> > +     return s32g_xpcs_init(xpcs->phys[id], dev, id, base,
> > +                            ctrl->ext_clk, rate, shared);
> > +}
> > +
> > +static void s32g_serdes_prepare_pma_mode5(struct s32g_serdes *serdes)
> > +{
> > +     u32 val;
> > +     /* Configure TX_VBOOST_LVL and TX_TERM_CTRL */
> > +     val = readl(serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_MISC_CTRL_2);
> > +     val &= ~(EXT_TX_VBOOST_LVL_MASK | EXT_TX_TERM_CTRL_MASK);
> > +     val |= FIELD_PREP(EXT_TX_VBOOST_LVL_MASK, 0x3) |
> > +             FIELD_PREP(EXT_TX_TERM_CTRL_MASK, 0x4);
> > +     writel(val, serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_MISC_CTRL_2);
> > +
> > +     /* Enable phy external control */
> > +     val = readl(serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_CTRL_SEL);
> > +     val |= EXT_PHY_CTRL_SEL;
> > +     writel(val, serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_CTRL_SEL);
> > +
> > +     /* Configure ref range, disable PLLB/ref div2 */
> > +     val = readl(serdes->ctrl.ss_base + S32G_PCIE_PHY_REF_CLK_CTRL);
> > +     val &= ~(REF_CLK_DIV2_EN | REF_CLK_MPLLB_DIV2_EN | EXT_REF_RANGE_MASK);
> > +     val |= FIELD_PREP(EXT_REF_RANGE_MASK, 0x3);
> > +     writel(val, serdes->ctrl.ss_base + S32G_PCIE_PHY_REF_CLK_CTRL);
> > +
> > +     /* Configure multiplier */
> > +     val = readl(serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_MPLLB_CTRL_2);
> > +     val &= ~(MPLLB_MULTIPLIER_MASK | EXT_MPLLB_FRACN_CTRL_MASK | BIT(24) | BIT(28));
> > +     val |= FIELD_PREP(MPLLB_MULTIPLIER_MASK, 0x27U) |
> > +             FIELD_PREP(EXT_MPLLB_FRACN_CTRL_MASK, 0x414);
> > +     writel(val, serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_MPLLB_CTRL_2);
> > +
> > +     val = readl(serdes->ctrl.ss_base + S32G_PCIE_PHY_MPLLB_CTRL);
> > +     val &= ~MPLLB_SSC_EN;
> > +     writel(val, serdes->ctrl.ss_base + S32G_PCIE_PHY_MPLLB_CTRL);
> > +
> > +     /* Configure tx lane division, disable word clock div2*/
> > +     val = readl(serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_MPLLB_CTRL_3);
> > +     val &= ~(EXT_MPLLB_WORD_DIV2_EN | EXT_MPLLB_TX_CLK_DIV_MASK);
> > +     val |= FIELD_PREP(EXT_MPLLB_TX_CLK_DIV_MASK, 0x5);
> > +     writel(val, serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_MPLLB_CTRL_3);
> > +
> > +     /* Configure bandwidth for filtering and div10*/
> > +     val = readl(serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_MPLLB_CTRL_1);
> > +     val &= ~(EXT_MPLLB_BANDWIDTH_MASK | EXT_MPLLB_DIV_CLK_EN |
> > +              EXT_MPLLB_DIV8_CLK_EN | EXT_MPLLB_DIV_MULTIPLIER_MASK);
> > +     val |= FIELD_PREP(EXT_MPLLB_BANDWIDTH_MASK, 0x5f) | EXT_MPLLB_DIV10_CLK_EN;
> > +     writel(val, serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_MPLLB_CTRL_1);
> > +
> > +     val = readl(serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_MPLLA_CTRL_1);
> > +     val &= ~(EXT_MPLLA_BANDWIDTH_MASK);
> > +     val |= FIELD_PREP(EXT_MPLLA_BANDWIDTH_MASK, 0xc5);
> > +     writel(val, serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_MPLLA_CTRL_1);
> > +
> > +     /* Configure VCO */
> > +     val = readl(serdes->ctrl.ss_base + S32G_PCIE_PHY_XPCS1_RX_OVRD_CTRL);
> > +     val &= ~(XPCS1_RX_VCO_LD_VAL_MASK | XPCS1_RX_REF_LD_VAL_MASK);
> > +     val |= FIELD_PREP(XPCS1_RX_VCO_LD_VAL_MASK, 0x540) |
> > +             FIELD_PREP(XPCS1_RX_REF_LD_VAL_MASK, 0x2b);
> > +     writel(val, serdes->ctrl.ss_base + S32G_PCIE_PHY_XPCS1_RX_OVRD_CTRL);
> > +
> > +     /* Boundary scan control */
> > +     val = readl(serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_BS_CTRL);
> > +     val &= ~(EXT_BS_RX_LEVEL_MASK | EXT_BS_TX_LOWSWING);
> > +     val |= FIELD_PREP(EXT_BS_RX_LEVEL_MASK, 0xB) | EXT_BS_RX_BIGSWING;
> > +     writel(val, serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_BS_CTRL);
> > +
> > +     /* Rx loss threshold */
> > +     val = readl(serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_MISC_CTRL_1);
> > +     val &= ~(EXT_RX_LOS_THRESHOLD_MASK | EXT_RX_VREF_CTRL_MASK);
> > +     val |= FIELD_PREP(EXT_RX_LOS_THRESHOLD_MASK, 0x3U) |
> > +             FIELD_PREP(EXT_RX_VREF_CTRL_MASK, 0x11U);
> > +     writel(val, serdes->ctrl.ss_base + S32G_PCIE_PHY_EXT_MISC_CTRL_1);
> > +}
> > +
> > +static int s32g_serdes_enable_mode5(struct s32g_serdes *serdes, struct s32g_xpcs *xpcs)
> > +{
> > +     int ret;
> > +
> > +     s32g_serdes_prepare_pma_mode5(serdes);
> > +
> > +     ret = s32g_xpcs_pre_pcie_2g5(xpcs);
> > +     if (ret) {
> > +             dev_err(serdes->dev,
> > +                     "Failed to prepare SerDes for PCIE & XPCS @ 2G5 mode\n");
> > +             return ret;
> > +     }
> > +
> > +     s32g_pcie_phy_reset(serdes);
> > +
> > +     return 0;
> > +}
> > +
> > +static int s32g_serdes_init_clks(struct s32g_serdes *serdes)
> > +{
> > +     struct s32g_serdes_ctrl *ctrl = &serdes->ctrl;
> > +     struct s32g_xpcs_ctrl *xpcs = &serdes->xpcs;
> > +     struct s32g_xpcs *order[2];
> > +     size_t i;
> > +     int ret;
> > +
> > +     switch (ctrl->ss_mode) {
> > +     case 0:
> > +             return 0;
> > +     case 1:
> > +             order[0] = xpcs->phys[0];
> > +             order[1] = NULL;
> > +             break;
> > +     case 2:
> > +     case 5:
> > +             order[0] = xpcs->phys[1];
> > +             order[1] = NULL;
> > +             break;
> > +     case 3:
> > +             order[0] = xpcs->phys[1];
> > +             order[1] = xpcs->phys[0];
> > +             break;
> > +     case 4:
> > +             order[0] = xpcs->phys[0];
> > +             order[1] = xpcs->phys[1];
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     for (i = 0; i < ARRAY_SIZE(order); i++) {
> > +             if (!order[i])
> > +                     continue;
> > +
> > +             ret = s32g_xpcs_init_plls(order[i]);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     for (i = 0; i < ARRAY_SIZE(order); i++) {
> > +             if (!order[i])
> > +                     continue;
> > +
> > +             if (ctrl->ss_mode == 5) {
> > +                     ret = s32g_serdes_enable_mode5(serdes, order[i]);
> > +                     if (ret)
> > +                             return ret;
> > +             } else {
> > +                     s32g_xpcs_vreset(order[i]);
> > +             }
> > +     }
> > +
> > +     for (i = 0; i < ARRAY_SIZE(order); i++) {
> > +             if (!order[i])
> > +                     continue;
> > +
> > +             ret = s32g_xpcs_wait_vreset(order[i]);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             ret = s32g_xpcs_reset_rx(order[i]);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             s32g_xpcs_disable_an(order[i]);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  /* Serdes subsystem */
> >
> >  static int s32g_serdes_assert_reset(struct s32g_serdes *serdes)
> > @@ -331,6 +585,10 @@ static int s32g_serdes_init(struct s32g_serdes *serdes)
> >               return ret;
> >       }
> >
> > +     /*
> > +      * We have a tight timing for the init sequence and any delay linked to
> > +      * printk as an example can fail the init after reset
> > +      */
> >       ret = s32g_serdes_assert_reset(serdes);
> >       if (ret)
> >               goto disable_clks;
> > @@ -363,7 +621,13 @@ static int s32g_serdes_init(struct s32g_serdes *serdes)
> >       dev_info(serdes->dev, "Using mode %d for SerDes subsystem\n",
> >                ctrl->ss_mode);
> >
> > -     return 0;
> > +     ret = s32g_serdes_init_clks(serdes);
> > +     if (ret) {
> > +             dev_err(serdes->dev, "XPCS init failed\n");
> > +             goto disable_clks;
> > +     }
> > +
> > +     return ret;
> >
> >  disable_clks:
> >       clk_bulk_disable_unprepare(serdes->ctrl.nclks,
> > @@ -449,12 +713,32 @@ static int s32g_serdes_get_pcie_resources(struct platform_device *pdev, struct s
> >       return 0;
> >  }
> >
> > +static int s32g_serdes_get_xpcs_resources(struct platform_device *pdev, struct s32g_serdes *serdes)
> > +{
> > +     struct s32g_xpcs_ctrl *xpcs = &serdes->xpcs;
> > +     struct device *dev = &pdev->dev;
> > +
> > +     xpcs->base0 = devm_platform_ioremap_resource_byname(pdev, "xpcs0");
> > +     if (IS_ERR(xpcs->base0)) {
> > +             dev_err(dev, "Failed to map 'xpcs0'\n");
> > +             return PTR_ERR(xpcs->base0);
> > +     }
> > +
> > +     xpcs->base1 = devm_platform_ioremap_resource_byname(pdev, "xpcs1");
> > +     if (IS_ERR(xpcs->base1)) {
> > +             dev_err(dev, "Failed to map 'xpcs1'\n");
> > +             return PTR_ERR(xpcs->base1);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static int s32g2_serdes_create_phy(struct s32g_serdes *serdes, struct device_node *child_node)
> >  {
> >       struct s32g_serdes_ctrl *ctrl = &serdes->ctrl;
> >       struct phy_provider *phy_provider;
> >       struct device *dev = serdes->dev;
> > -     int ss_mode = ctrl->ss_mode;
> > +     int ret, ss_mode = ctrl->ss_mode;
> >       struct phy *phy;
> >
> >       if (of_device_is_compatible(child_node, "nxp,s32g2-serdes-pcie-phy")) {
> > @@ -476,6 +760,37 @@ static int s32g2_serdes_create_phy(struct s32g_serdes *serdes, struct device_nod
> >               if (IS_ERR(phy_provider))
> >                       return PTR_ERR(phy_provider);
> >
> > +     } else if (of_device_is_compatible(child_node, "nxp,s32g2-serdes-xpcs")) {
> > +             struct s32g_xpcs_ctrl *xpcs_ctrl = &serdes->xpcs;
> > +             struct s32g_xpcs *xpcs;
> > +             int port;
> > +
> > +             /* no Ethernet phy lane */
> > +             if (ss_mode == 0)
> > +                     return 0;
> > +
> > +             /* Get XPCS port number connected to the lane */
> > +             if (of_property_read_u32(child_node, "reg", &port))
> > +                     return -EINVAL;
> > +
> > +             /* XPCS1 is not used */
> > +             if (ss_mode == 1 && port == 1)
> > +                     return -EINVAL;
> > +
> > +             /* XPCS0 is not used */
> > +             if (ss_mode == 2 && port == 0)
> > +                     return -EINVAL;
> > +
> > +             xpcs = devm_kmalloc(dev, sizeof(*xpcs), GFP_KERNEL);
> > +             if (!xpcs)
> > +                     return -ENOMEM;
> > +
> > +             xpcs_ctrl->phys[port] = xpcs;
> > +
> > +             ret = s32g_serdes_xpcs_init(serdes, port);
> > +             if (ret)
> > +                     return ret;
> > +
> >       } else {
> >               dev_warn(dev, "Skipping unknown child node %pOFn\n", child_node);
> >       }
> > @@ -517,6 +832,10 @@ static int s32g_serdes_probe(struct platform_device *pdev)
> >       if (ret)
> >               return ret;
> >
> > +     ret = s32g_serdes_get_xpcs_resources(pdev, serdes);
> > +     if (ret)
> > +             return ret;
> > +
> >       ret = s32g_serdes_parse_lanes(dev, serdes);
> >       if (ret)
> >               return ret;
> > @@ -555,6 +874,57 @@ static int __maybe_unused s32g_serdes_resume(struct device *device)
> >       return ret;
> >  }
> >
> > +struct phylink_pcs *s32g_serdes_pcs_create(struct device *dev, struct device_node *np)
> > +{
> > +     struct platform_device *pdev;
> > +     struct device_node *pcs_np;
> > +     struct s32g_serdes *serdes;
> > +     u32 port;
> > +
> > +     if (of_property_read_u32(np, "reg", &port))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     if (port >= S32G_SERDES_XPCS_MAX)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     /* The PCS pdev is attached to the parent node */
> > +     pcs_np = of_get_parent(np);
> > +     if (!pcs_np)
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     if (!of_device_is_available(pcs_np)) {
> > +             of_node_put(pcs_np);
> > +             return ERR_PTR(-ENODEV);
> > +     }
> > +
> > +     pdev = of_find_device_by_node(pcs_np);
> > +     of_node_put(pcs_np);
> > +     if (!pdev)
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +
> > +     serdes = platform_get_drvdata(pdev);
> > +     if (!serdes) {
> > +             put_device(&pdev->dev);
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +     }
> > +
> > +     if (!serdes->xpcs.phys[port]) {
> > +             put_device(&pdev->dev);
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +     }
> > +
> > +     return &serdes->xpcs.phys[port]->pcs;
> > +}
> > +EXPORT_SYMBOL(s32g_serdes_pcs_create);
> > +
> > +void s32g_serdes_pcs_destroy(struct phylink_pcs *pcs)
> > +{
> > +     struct s32g_xpcs *xpcs = phylink_pcs_to_s32g_xpcs(pcs);
> > +
> > +     put_device(xpcs->dev);
> > +}
> > +EXPORT_SYMBOL(s32g_serdes_pcs_destroy);
> > +
> >  static const struct of_device_id s32g_serdes_match[] = {
> >       {
> >               .compatible = "nxp,s32g2-serdes",
> > diff --git a/include/linux/pcs/pcs-nxp-s32g-xpcs.h b/include/linux/pcs/pcs-nxp-s32g-xpcs.h
> > new file mode 100644
> > index 000000000000..96a0049b93a6
> > --- /dev/null
> > +++ b/include/linux/pcs/pcs-nxp-s32g-xpcs.h
> > @@ -0,0 +1,50 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/**
> > + * Copyright 2021-2026 NXP
> > + */
> > +#ifndef PCS_NXP_S32G_XPCS_H
> > +#define PCS_NXP_S32G_XPCS_H
> > +
> > +#include <linux/phylink.h>
> > +
> > +enum s32g_xpcs_shared {
> > +     NOT_SHARED,
> > +     PCIE_XPCS_1G,
> > +     PCIE_XPCS_2G5,
> > +};
> > +
> > +enum s32g_xpcs_pll {
> > +     XPCS_PLLA,      /* Slow PLL */
> > +     XPCS_PLLB,      /* Fast PLL */
> > +};
> > +
> > +struct s32g_xpcs {
> > +     void __iomem *base;
> > +     struct device *dev;
> > +     unsigned char id;
> > +     struct regmap *regmap;
> > +     enum s32g_xpcs_pll ref;
> > +     bool ext_clk;
> > +     bool mhz125;
> > +     enum s32g_xpcs_shared pcie_shared;
> > +     struct phylink_pcs pcs;
> > +};
> > +
> > +#define phylink_pcs_to_s32g_xpcs(pl_pcs) \
> > +     container_of((pl_pcs), struct s32g_xpcs, pcs)
> > +
> > +int s32g_xpcs_init(struct s32g_xpcs *xpcs, struct device *dev,
> > +                unsigned char id, void __iomem *base, bool ext_clk,
> > +                unsigned long rate, enum s32g_xpcs_shared pcie_shared);
> > +int s32g_xpcs_init_plls(struct s32g_xpcs *xpcs);
> > +int s32g_xpcs_pre_pcie_2g5(struct s32g_xpcs *xpcs);
> > +void s32g_xpcs_vreset(struct s32g_xpcs *xpcs);
> > +int s32g_xpcs_wait_vreset(struct s32g_xpcs *xpcs);
> > +int s32g_xpcs_reset_rx(struct s32g_xpcs *xpcs);
> > +void s32g_xpcs_disable_an(struct s32g_xpcs *xpcs);
> > +
> > +struct phylink_pcs *s32g_serdes_pcs_create(struct device *dev, struct device_node *np);
> > +void s32g_serdes_pcs_destroy(struct phylink_pcs *pcs);
> > +
> > +#endif /* PCS_NXP_S32G_XPCS_H */
> > +
> > --
> > 2.43.0
> >
> >
>
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

