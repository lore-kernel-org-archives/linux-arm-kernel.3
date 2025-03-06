Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF81C28B24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 18:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gBi13oH2YTOQlVLrmxAry8taY7YW2dmM3vhgwkXBio=; b=BCY6MZYrF2U0a1jIMRwCTejHiR
	QDPvsilVwaoch4ovcq+eKrGkcWehc2PaqwG8RBZ7gw5ACmG/oGUZAw1BqnXfVXynZiuRS9Hqlm2v9
	CqE2LfuLwC0LikZzuzQEzCNCqgvcvUiiJxl1W3IiAE93FMxwtLv30/Q9T7idAul/WcGhHacEIbwcy
	uYutWYEixjFIhblO+3Wd7MMgXGBi5lnAXe5R6pmLCbnKpTLBoJJLT7Yjlk9HfJzQGerS+Cy4iYBsz
	vI4X8rSiZl/VlSDuOXluSfU0zd7xitckjA5IotDTDLgyh7se0NFwLu2eZP12lXIRrvyUwO1X+Vi2C
	XbUaJYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqG2j-0000000Bsb1-0f59;
	Thu, 06 Mar 2025 18:34:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEz0-0000000Bgcx-08Un
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 17:26:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43bcb1a9890so14856015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 09:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741281964; x=1741886764; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9gBi13oH2YTOQlVLrmxAry8taY7YW2dmM3vhgwkXBio=;
        b=2Vlq7H7gIpMMQy4oiKXOo0XeNgbryuKSIccjG19iGNR8+ahg9Tf5twqbdJBLXNYbAs
         eNcPOauwK2DA5Qj/zEEzbqp+MhLGe+VXl6kuDmBZPLNoY0cPH0xHxQXK2jmdbHq8ckBx
         GujnOfhL1y6uafcQVuk5GuhLvtBLnHJgSITBSAHUT0oPawE/2l8DewVCh2NQa0hfXkfp
         tkDQAdOC+vNe4Z1dC4awM0j3GHoHLo4GLFuM80IW819sahVMj/LNap8ZWuon1k1Fv0sL
         yf53iM2kHsnx9+8AmRrudQobbuVObD2t2M3RU6Xy0ifgsr1xkGxTUhgz/OkNba7GZY5T
         GGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741281964; x=1741886764;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gBi13oH2YTOQlVLrmxAry8taY7YW2dmM3vhgwkXBio=;
        b=CZEDhCFee9B+9NYaDcLVqxEK4v26AAqdWezkFleeqwCisHv+19jr7SBUss1NExlGuW
         0fIWXb23FbV4e9/+nHDVxSw4qQClReyH/X/3bzddiE3V9r5wRdp/1HnD/BvvM3VJ6mvq
         YnzNMN6ERYeK/4qgLbjYZBg68a6CYjKyx043z40LH4U7I+hGGoAinWqYO75lc9Z/peCY
         /l+/LHfOo8IO5QFPOD5VPTXtpUmh0dFbAJ+WvAdW3/SsbQblm8IxILGZkCjchYDNrnwz
         tOZ6R9BTTeeSTO9SzvW5SIS0xu5PnwaRT7tXzg/1xZaQHT7LmwaeAV0/xU1qTtMQpV95
         oYoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8DNesSuewZgnSVu+YrQ95umdaeE7TUHsCkaq/qQeg0NMEEMkQ4cLlQHR+TVyaBeC8/MMRUEo/qKcrJyeRWc5k@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/IQ1SYEYIu734FAcNpCwZFfitxnhVJIYI+7KTMKD+m3tq5/b0
	2O7cl1QMaWbCYJHAJQIIvI3TgTfURWGyklpkQ8mrEmIpyYrO/DcfbwAe8h+njdw=
X-Gm-Gg: ASbGnctBryYrkZZFY2E0oi+8iXj7YlRLG8MCPesTktOpK1syaPky02zoUuM3nqr4yRM
	ZrJaJCb/KZYZuqqRWg/yqOGbHW79l2H5XRZ0mXuY8SQSbRaxPeHqMv9aa2DJXiMMwPB3tN+Oz8s
	rFL5zHoPZANnI2rjAjggBHCXlO8omNHmqW1QBoDpYjk/dnGTjlFp2baBHNYuzRmaa3u7Tl2DnML
	zHLb5alBnL+UNQ/bif7XDmEKTXwp3N1xdnnfjqPsOsSUOjKNO3DisHvLlH0thFjE7JFta5JY+T0
	E+jm2OKki+8hjUcX+T51E/6lf+4eR9Js2kBoHF9h2I4=
X-Google-Smtp-Source: AGHT+IHDAt6NYWgVgdYHY+auIYwz15KHwMO0sECwAzb9Y48d4oIdn6zdb/5QFSFzH4BHnl8HwsC49Q==
X-Received: by 2002:a5d:5985:0:b0:391:865:5a93 with SMTP id ffacd0b85a97d-3913211b64fmr247337f8f.22.1741281964164;
        Thu, 06 Mar 2025 09:26:04 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:29d4:36d9:5043:acd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0e4065sm2703591f8f.62.2025.03.06.09.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:26:03 -0800 (PST)
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
In-Reply-To: <004801db8eb7$99808e20$cc81aa60$@martijnvandeventer.nl>
	(linux@martijnvandeventer.nl's message of "Thu, 6 Mar 2025 17:48:33
	+0100")
References: <20250213221702.606-1-linux@martijnvandeventer.nl>
	<1jpljkzyf0.fsf@starbuckisacylon.baylibre.com>
	<003301db888e$8ea84e90$abf8ebb0$@martijnvandeventer.nl>
	<1jplj3g21q.fsf@starbuckisacylon.baylibre.com>
	<004801db8eb7$99808e20$cc81aa60$@martijnvandeventer.nl>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 06 Mar 2025 18:26:03 +0100
Message-ID: <1j4j065avo.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_092606_281567_0354F30B 
X-CRM114-Status: GOOD (  39.25  )
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

On Thu 06 Mar 2025 at 17:48, <linux@martijnvandeventer.nl> wrote:

> Hi Jerome,
>
>> >
>> > Thank you for reviewing, and apologies for my late response due to a
>> holiday.
>> >
>> >> On Thu 13 Feb 2025 at 23:17, Martijn van Deventer
>> >> <linux@martijnvandeventer.nl> wrote:
>> >>
>> >> > When booting SM1 or G12A boards without a dislay attached to HDMI,
>> >> > the kernel shows the following warning:
>> >> >
>> >> > [CRTC:46:meson_crtc] vblank wait timed out
>> >> > WARNING: CPU: 2 PID: 265 at
>> drivers/gpu/drm/drm_atomic_helper.c:1682
>> >> drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
>> >> > CPU: 2 UID: 0 PID: 265 Comm: setfont Tainted: G         C
>> >> > Tainted: [C]=CRAP
>> >> > pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> >> > pc : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
>> >> > lr : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
>> >> > Call trace:
>> >> >  drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
>> >> >  drm_atomic_helper_commit_tail_rpm+0x84/0xa0
>> >> >  commit_tail+0xa4/0x18c
>> >> >  drm_atomic_helper_commit+0x164/0x178
>> >> >  drm_atomic_commit+0xb4/0xec
>> >> >  drm_client_modeset_commit_atomic+0x210/0x270
>> >> >  drm_client_modeset_commit_locked+0x5c/0x188
>> >> >  drm_fb_helper_pan_display+0xb8/0x1d4
>> >> >  fb_pan_display+0x7c/0x120
>> >> >  bit_update_start+0x20/0x48
>> >> >  fbcon_switch+0x418/0x54c
>> >> >  el0t_64_sync+0x194/0x198
>> >> >
>> >> > This happens when the kernel disables the unused clocks.
>> >> > Sometimes this causes the boot to hang.
>> >> >
>> >> > By (re)adding the flag CLK_IGNORE_UNUSED to the VCLK2 clocks, these
>> >> > clocks will not be disabled.
>> >> >
>> >> > This partially reverts commit b70cb1a21a54 ("clk: meson: g12a:
>> >> > make VCLK2 and ENCL clock path configurable by CCF").
>> >>
>> >> It looks like DRM needs those clock enabled regardless of connection
>> >> status on HDMI. Even with this change applied, you would get the same
>> >> problem again if the bootloader does not take of turning the clock on,
>> >> which is not a given.
>> >>
>> >> CLK_IGNORE_UNUSED gives not guarantee a clock will be enabled or stay
>> >> enabled at any point.
>> >>
>> >> A proper fix to this issue should be done in DRM, IMO.
>> >
>> > I know and I totally agree. Unfortunately, I don't have access to any 
>> > vendor
>> > documentation, nor do I have any real knowledge about the DRM/HDMI
>> > subsystem to fix that.
>>
>> You have identified which clocks are not properly claimed, by what they
>> are not claimed and even when. 50% of the job is done. Thanks for this.
>
> You're welcome, no problem.
>
>> >
>> > And I guess if it were as easy as adding a clock to the DT and calling
>> > clk_prepare_enable on it in the probe function, Neil would have done
>> that
>> > already.
>> >
>> > So, all I can do, for now, is revert to the previous situation when it 
>> > did
>> work
>> > for (probably) most boards.
>>
>> Maybe so, but it does not make this change appropriate. The problem
>> is the DRM driver which does not enable what it needs to properly
>> operate. This should be fixed.
>
> I understand. So I guess that is the end of the line for this patch.
> Because this patch will not be accepted and if someone else finds the 
> time and has the knowledge to fix this the proper way, it will be a 
> completely different patch.
>
> Although I, of course, agree with you that it should be fixed properly, 
> I find it a bit difficult to accept that if we accidentally break something,
> while trying to make things better, we are not allowed to revert it 
> because it was already somewhat broken. Resulting in a more broken
> situation than before...

Once again, you are encouraged to fix things up ... where fixes are needed.

DRM is hardly immutable. If you don't feel like you can do it on your own,
you can still engage with the other contributors who may know this
better and help you.

>
> On the other hand, I also understand that if you, as a maintainer, allow 
> that, chances are it will never see a proper fix. :-)
>
> Cheers!
>
>> >
>> >> >
>> >> > Fixes: b70cb1a21a54 ("clk: meson: g12a: make VCLK2 and ENCL clock
>> path
>> >> configurable by CCF").
>> >> > Signed-off-by: Martijn van Deventer <linux@martijnvandeventer.nl>
>> >> > ---
>> >> >  drivers/clk/meson/g12a.c | 12 ++++++------
>> >> >  1 file changed, 6 insertions(+), 6 deletions(-)
>> >> >
>> >> > diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> >> > index cfffd434e998..1651898658f5 100644
>> >> > --- a/drivers/clk/meson/g12a.c
>> >> > +++ b/drivers/clk/meson/g12a.c
>> >> > @@ -3234,7 +3234,7 @@ static struct clk_regmap g12a_vclk2_div = {

-- 
Jerome

