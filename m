Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6527DC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSFMyHZjL2sLB+0egAbBkuSTNnV3nLYFcpeSny0Lnto=; b=mvHyQlAmktaiyL9GjCwkfDPdZz
	dc/jZJ0JQ1oKjodzP6G6up60y1q6G6K0+5BRtGJMBubcbPd6aDmBZJ11MYj+lAbpjZks4i7a7/tIG
	uoRQfKXjt8NC9li/ZHAfMyVvdo6tgz3pcsX8AppTwjNez49OZ7ziVyTUt921cllDzgcfDCdh3Rcwh
	Ol00FPkkR9MpiHpzhMTxdqmavgHSCz2Giqr/6CaDlEjrOFOphCMIKATCgZBo9Agb5T33RNthIsDyJ
	cefLHRuzuIe+QYUbSbhjvQMluSWYOS8V/A/sRH9/kFCxLo98B/yIyQ9Vd1MEO7iCMnqg5W+Fy3BSP
	povHz3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnadn-00000006vYL-2GI2;
	Thu, 27 Feb 2025 09:57:15 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaLt-00000006t9t-0N55
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:38:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-390ddf037ffso299582f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 01:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740649123; x=1741253923; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XSFMyHZjL2sLB+0egAbBkuSTNnV3nLYFcpeSny0Lnto=;
        b=T+IqATbw6I5Ev16BxbH7d2Urf5ZO+WzgeWkxwJyjwyAK7JFVyNhO9sqLK9tqEcsusZ
         BoVDdLofme6q7cf1IrnH6sUCG+1k5WnOsuRazMHS8aTpN6WyR/Sj1+BXIvlzfmosj+FB
         y0AxlSjRKe8HXR9/7mV5Wq/qO0lpEk9u6z6M3ad/L9+HV/fRusogfIsLheB08JRukd8R
         dhu2wnIMArmF0g6Jjk2H7/1g1wjF5Tsej186ckEIlDkCiHCBf7deGgRb7F9e8askvX+G
         DC6QDm4FYCZT9bZVp0ZVOzYlRs3ysD/b+TvFoDMP2OaNPtrUTCFp6YkEPCdOkcq3Y2fx
         tybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740649123; x=1741253923;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSFMyHZjL2sLB+0egAbBkuSTNnV3nLYFcpeSny0Lnto=;
        b=tiqvcDJ1rOyxjep3QFC7PDrKNH3LqSX3MCX0qqNQUHEW3wA7AXLPwB02/QmrGRXLdU
         u+jnyNyy3DboMp7OfVUep8q8HCCyR5vDwYu5NDUGqys8uacDlrJXIm3rgs13UDgxrY/0
         DM5+M6a/8DkRregOTAwROXDt3qLTRB7a0HHpQqni24C01CW91kw4Hf/QYLegzFYflwfl
         fUZuUxL1eM0RwG8cqfyGVzMX8ZJRxpVd/RLx8adOk0MxOza05BtCtdtJPJTJLGsgfZVr
         49Y1VRH1gxsqnCkszd3Rzne9aP+tDZMUr9F6mIKauL40aDVvV9VLozYkTifge9j2CQjI
         bteA==
X-Forwarded-Encrypted: i=1; AJvYcCXwTU1WSJMK26TIF5ugqmBdOrs2v9OA5PqbfziI8PeTdfzTmTxhLi7s6czgYG7XkJ3Wxwz0s87MBVq1dyCFypnW@lists.infradead.org
X-Gm-Message-State: AOJu0YzHT/jxTypzE7iKu0Ivgrw5dmBWU7+c83lmVULEgT4YhNBggnwM
	4W/Yt4sSFxoL3i7ZqY2qGahHWzmFVaBQrmhVteLuQiKyC+9xhvZ5g/g4jLYD7sA=
X-Gm-Gg: ASbGncu1RJgmmH7xA9RXmdFxG47I4D4Riw5KpJ3/kQjIdLSxE/oa7uqBWk+0m3gaVdQ
	MA65YQJl1nteFgycJWMW0ClzUMyVfPnA6rtddG3Ln4hZtcIr6cJgOQPTN20fcWQm5FjLwgP84m/
	VQY2QVjTs/qpbYyUheR/v8LrbaC5p/AvurqOTrxwCW84bN3Xm7DMYekfC+GpGBIQqgK5OuEwE+r
	W+6nEJP6nSjdN0VWQHE0bFi9e1TGxsPzODNZjLBnvCzX0XzI0TLNjzCROhcbpXBAL3BAXmdSlf6
	4tSkCy3V0FxyBzmFfZ4ch1AQbg==
X-Google-Smtp-Source: AGHT+IFUel99Gq412qHUYoqq4QU0Kh33QuQ9q7aFAyceuOEGM3mTTh0OtaZyPMhSjBmzd7LFLY/Vng==
X-Received: by 2002:a5d:64a9:0:b0:390:e853:85bd with SMTP id ffacd0b85a97d-390e8538bfdmr865626f8f.48.1740649122847;
        Thu, 27 Feb 2025 01:38:42 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:ede3:f33f:7555:723d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e479652dsm1484719f8f.16.2025.02.27.01.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:38:42 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: <linux@martijnvandeventer.nl>
Cc: "'Neil Armstrong'" <neil.armstrong@linaro.org>,  "'Michael Turquette'"
 <mturquette@baylibre.com>,  "'Stephen Boyd'" <sboyd@kernel.org>,  "'Kevin
 Hilman'" <khilman@baylibre.com>,  "'Martin Blumenstingl'"
 <martin.blumenstingl@googlemail.com>,
  <linux-amlogic@lists.infradead.org>,  <linux-clk@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: meson: g12a: Fix kernel warnings when no display
 attached
In-Reply-To: <003301db888e$8ea84e90$abf8ebb0$@martijnvandeventer.nl>
	(linux@martijnvandeventer.nl's message of "Wed, 26 Feb 2025 21:39:39
	+0100")
References: <20250213221702.606-1-linux@martijnvandeventer.nl>
	<1jpljkzyf0.fsf@starbuckisacylon.baylibre.com>
	<003301db888e$8ea84e90$abf8ebb0$@martijnvandeventer.nl>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 27 Feb 2025 10:38:41 +0100
Message-ID: <1jplj3g21q.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_013845_350487_F620DDEE 
X-CRM114-Status: GOOD (  31.21  )
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

On Wed 26 Feb 2025 at 21:39, <linux@martijnvandeventer.nl> wrote:

> Hi Jerome,
>
> Thank you for reviewing, and apologies for my late response due to a holiday.
>
>> On Thu 13 Feb 2025 at 23:17, Martijn van Deventer
>> <linux@martijnvandeventer.nl> wrote:
>> 
>> > When booting SM1 or G12A boards without a dislay attached to HDMI,
>> > the kernel shows the following warning:
>> >
>> > [CRTC:46:meson_crtc] vblank wait timed out
>> > WARNING: CPU: 2 PID: 265 at drivers/gpu/drm/drm_atomic_helper.c:1682
>> drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
>> > CPU: 2 UID: 0 PID: 265 Comm: setfont Tainted: G         C
>> > Tainted: [C]=CRAP
>> > pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> > pc : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
>> > lr : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
>> > Call trace:
>> >  drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
>> >  drm_atomic_helper_commit_tail_rpm+0x84/0xa0
>> >  commit_tail+0xa4/0x18c
>> >  drm_atomic_helper_commit+0x164/0x178
>> >  drm_atomic_commit+0xb4/0xec
>> >  drm_client_modeset_commit_atomic+0x210/0x270
>> >  drm_client_modeset_commit_locked+0x5c/0x188
>> >  drm_fb_helper_pan_display+0xb8/0x1d4
>> >  fb_pan_display+0x7c/0x120
>> >  bit_update_start+0x20/0x48
>> >  fbcon_switch+0x418/0x54c
>> >  el0t_64_sync+0x194/0x198
>> >
>> > This happens when the kernel disables the unused clocks.
>> > Sometimes this causes the boot to hang.
>> >
>> > By (re)adding the flag CLK_IGNORE_UNUSED to the VCLK2 clocks, these
>> > clocks will not be disabled.
>> >
>> > This partially reverts commit b70cb1a21a54 ("clk: meson: g12a:
>> > make VCLK2 and ENCL clock path configurable by CCF").
>> 
>> It looks like DRM needs those clock enabled regardless of connection
>> status on HDMI. Even with this change applied, you would get the same
>> problem again if the bootloader does not take of turning the clock on,
>> which is not a given.
>> 
>> CLK_IGNORE_UNUSED gives not guarantee a clock will be enabled or stay
>> enabled at any point.
>> 
>> A proper fix to this issue should be done in DRM, IMO.
>
> I know and I totally agree. Unfortunately, I don't have access to any vendor 
> documentation, nor do I have any real knowledge about the DRM/HDMI 
> subsystem to fix that.

You have identified which clocks are not properly claimed, by what they
are not claimed and even when. 50% of the job is done. Thanks for this.

>
> And I guess if it were as easy as adding a clock to the DT and calling 
> clk_prepare_enable on it in the probe function, Neil would have done that 
> already.
>
> So, all I can do, for now, is revert to the previous situation when it did  work
> for (probably) most boards.

Maybe so, but it does not make this change appropriate. The problem
is the DRM driver which does not enable what it needs to properly
operate. This should be fixed.

>
>> >
>> > Fixes: b70cb1a21a54 ("clk: meson: g12a: make VCLK2 and ENCL clock path
>> configurable by CCF").
>> > Signed-off-by: Martijn van Deventer <linux@martijnvandeventer.nl>
>> > ---
>> >  drivers/clk/meson/g12a.c | 12 ++++++------
>> >  1 file changed, 6 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> > index cfffd434e998..1651898658f5 100644
>> > --- a/drivers/clk/meson/g12a.c
>> > +++ b/drivers/clk/meson/g12a.c
>> > @@ -3234,7 +3234,7 @@ static struct clk_regmap g12a_vclk2_div = {
>> >  			&g12a_vclk2_input.hw
>> >  		},
>> >  		.num_parents = 1,
>> > -		.flags = CLK_SET_RATE_GATE,
>> > +		.flags = CLK_SET_RATE_GATE | CLK_IGNORE_UNUSED,
>> >  	},
>> >  };
>> >
>> > @@ -3270,7 +3270,7 @@ static struct clk_regmap g12a_vclk2 = {
>> >  		.ops = &meson_vclk_gate_ops,
>> >  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_div.hw
>> },
>> >  		.num_parents = 1,
>> > -		.flags = CLK_SET_RATE_PARENT,
>> > +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> >  	},
>> >  };
>> >
>> > @@ -3354,7 +3354,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
>> >  		.ops = &clk_regmap_gate_ops,
>> >  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>> >  		.num_parents = 1,
>> > -		.flags = CLK_SET_RATE_PARENT,
>> > +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> >  	},
>> >  };
>> >
>> > @@ -3368,7 +3368,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
>> >  		.ops = &clk_regmap_gate_ops,
>> >  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>> >  		.num_parents = 1,
>> > -		.flags = CLK_SET_RATE_PARENT,
>> > +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> >  	},
>> >  };
>> >
>> > @@ -3382,7 +3382,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
>> >  		.ops = &clk_regmap_gate_ops,
>> >  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>> >  		.num_parents = 1,
>> > -		.flags = CLK_SET_RATE_PARENT,
>> > +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> >  	},
>> >  };
>> >
>> > @@ -3396,7 +3396,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
>> >  		.ops = &clk_regmap_gate_ops,
>> >  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>> >  		.num_parents = 1,
>> > -		.flags = CLK_SET_RATE_PARENT,
>> > +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> >  	},
>> >  };
>> 

-- 
Jerome

