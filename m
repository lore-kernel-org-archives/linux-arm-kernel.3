Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C33A10F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 18:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=So9g254LjIG5mvcH+IfiKGLnYk5lJbv9pvaJ0NR//W4=; b=uT7VjKq39cTyzfhRYdgIr3W5bN
	X0sCX5t4qXZzWgtjwbsNpXlUDZv9HduDi72nlCDOVLEoxDyw64UvKBnfthrQ3mEtWuxmuFtiRgRyE
	edImaApNA9D8iTpbQehzoZPVxWFBlPPdJtRZf9bh11MuObVctNQvsndaBdy7HrA1WUHjXK2pBDNss
	hxyoGcxo+TGRrGxMJox4DbbW6/XI/Kp+59ZuoBYgTyopwF9Hr7w+k5bGDfesQEPo6WHlhDK3f6LaM
	dMg4vBsjpMqk1Yn7gP/B8v0CMO34bD1InNqq5WqvKiMT0AF55S/qSHVP1QylPHR7kXjSsc5J4U0MY
	m5s66NTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Bjl-00000007viN-1PQp;
	Fri, 27 Mar 2026 18:16:49 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Bjj-00000007vhc-1p8R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 18:16:48 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2c1632faeb9so4136441eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 11:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774635406; x=1775240206; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=So9g254LjIG5mvcH+IfiKGLnYk5lJbv9pvaJ0NR//W4=;
        b=go13MamRJlgP6uEAruarWREW05Jwm40p69mZoi27qHMMS3TRDUSxVsmyuXaOkyNzCB
         0mFjMWzuKgzkQsI7dn4vgmvv+iXdBGiJVZPiO3eRKMswhh8PRuFO+vhTwWyY1GPxDczN
         FZCKS+s+xP0IUFX1MAqmqQ0vFKgx00Jp1QvBrK2V6Mtx6dsBHgQ6mZxjWqav/EZ4FV/9
         YiwZRAcrnHBVLaMrDZch8CyvnuOdNajMpj26Lc7hO4gj3WQxFeBuGajjRH8CgmiwjnM8
         m1Gc5zwac2lIllY9m0RLCEx9gT7Nn5xWGwoV+OVvobZsNpX2tKgnF5BcsWIxcsP7IObV
         F3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774635406; x=1775240206;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=So9g254LjIG5mvcH+IfiKGLnYk5lJbv9pvaJ0NR//W4=;
        b=qD3ouc/SeJOYBe9EAizs4jZ/BSjRJb/ytvGWOy4/CaXU4cpquAPxGQ2sPlpCGVF6X8
         L2YU9usJr/2DH1IN+xtIZlOf2myL5OJV/C6VjIqEK+VCPuYUVQTo0nBf6M2h6C/sUDG3
         JMJB2G+W7W+xBUgI507hZugN8kvTjOaCstRUSJXiaYb3hA0fDXxSu+XFrQIBMmfIiBGI
         trMEQlbij9Hjuw/IqqE88ydShvblFIz8d9A7j6oQNOMwqgA0HvDZIPFVIHOFKKmL6/7j
         bzvzUlXyYFfFkau3lIhA3aszcx6vaahovpJwiicAt3Tn28NwcKVGfd02Dv1iaMnjJO96
         GY2w==
X-Forwarded-Encrypted: i=1; AJvYcCVB0T7QwFrHlB4vT6E5o7GM/ku0Pvl/Q+GAri9jBi4zWRt1p5Z7+bwMXUmg9HlAvpejz2+GMSqveYbDr2M5aFE/@lists.infradead.org
X-Gm-Message-State: AOJu0YxKrJz5o7eKPUOIVx1BK+gPYho8Fd0CkxjawYMP/BgUpGWhB0oM
	hUGJjyf2mQOAmMvP8VyKvl05KKVCFmxt7E1PQw78Br2nbZP0hPp+Z/Qr
X-Gm-Gg: ATEYQzyVmiHc8GaDvm1tkEn0wMNmdzDdlyZmT7AamCQ5cnKX5wKet2qn5cCtZpQZLRN
	ic6dyWcwQ80FbPAV2ePg7dXKR8EoeGVviE5ykXdlzdtOgFCNPBaGvVYFipmyDWdNR3e5lI5yo2q
	hysEeWFr6rGMo3kr+0hdPduz53hL1fNQtwpZqAj0Upqgc+bKSFJzg6v4oF8W+IRqCqcKrBpRl4n
	CqDgR/apWrOGuNsvlEYG89u5GrFruS5HBI6dRzDXLBttdy9cGOpObMgvc3pFHluTAaAKYJuhXeH
	xxpitJipTdBK/W8vGz92x0IHNq/ZpDy6evj6uQxU6Dwkl4oegBdGJhh5pspvy8rXQSGEe3ObpGI
	0XIfv0+qxy6Y5bmmbB9ZiKuc7MHkrrfEH7+5+FcvvIcv9txfAs9tsuSkz54Tf0URAYtdjtbbWIG
	dt21w45ezhb4MpkJejYe5eB3G0BR+ELO/KRrJV4XboKVQiCY+MAKPw0YiRBR+N/HeG
X-Received: by 2002:a05:7300:d215:b0:2c2:5cc9:6d2 with SMTP id 5a478bee46e88-2c25cc90ba2mr856175eec.2.1774635405883;
        Fri, 27 Mar 2026 11:16:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:85b0:37ea:7fa8:4717])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c7483ffcsm32538eec.26.2026.03.27.11.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 11:16:45 -0700 (PDT)
Date: Fri, 27 Mar 2026 11:16:41 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Hans de Goede <hansg@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFT PATCH v3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
Message-ID: <acbI0NnMvmSiobLz@google.com>
References: <2fb42d16-887a-4564-8e50-c9d6db564c4e@app.fastmail.com>
 <CAMRc=McYj-D8XL_wnmTEucMrwCy1-xr7h0XYrL68soMVHL1SRA@mail.gmail.com>
 <7h1phxpzml.fsf@baylibre.com>
 <CAMRc=McosSU39SERKtjmhJdTv2cPi44PG=bYqAcfQLDX4QB0Tg@mail.gmail.com>
 <CAMRc=MeYMe1gXjiYuQJpNWchp+V1uLkuRuyO3ohQjfAcg9q3MQ@mail.gmail.com>
 <acaOlGcGQEZHQ_mJ@darkstar.musicnaut.iki.fi>
 <CAMRc=McDdK8Y7wtG8WObjD6WF-2ftKBDwKbvj=xL-NMfeV=bPQ@mail.gmail.com>
 <aca3ajb_G3gD24S7@darkstar.musicnaut.iki.fi>
 <CAMRc=McVPskF4pMQSz=hR8CkyZhoPmCU_yJFT66vgTCPJd3-Vw@mail.gmail.com>
 <CAMRc=MeUEApQuw8prxr6ku674fqORCy2=givJxLe+cUCC0PGww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeUEApQuw8prxr6ku674fqORCy2=givJxLe+cUCC0PGww@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_111647_484145_190B8997 
X-CRM114-Status: GOOD (  27.11  )
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

On Fri, Mar 27, 2026 at 10:27:07AM -0700, Bartosz Golaszewski wrote:
> On Fri, 27 Mar 2026 18:23:29 +0100, Bartosz Golaszewski <brgl@kernel.org> said:
> > On Fri, Mar 27, 2026 at 5:59 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> >>
> >> Hi,
> >>
> >> On Fri, Mar 27, 2026 at 03:22:12PM +0100, Bartosz Golaszewski wrote:
> >> > Hmm, I'm wondering if there's a race with consumers already requesting
> >> > the GPIOs after the controller device is registered but before the
> >> > software node is added. I'll send a version with software nodes being
> >> > registered first, then passes as firmware nodes to the platform device
> >> > API before the device is registered.
> >>
> >> It crashes early, I was able to get an UART log from OSK (another
> >> 16xx board):
> >>
> >> [    1.001525] Register r12 information: 2-page vmalloc region starting at 0xc2808000 allocated at kernel_clone+0xa4/0x20c
> >> [    1.013092] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> >> [    1.019500] Stack: (0xc2809ed0 to 0xc280a000)
> >> [    1.024230] 9ec0:                                     c072d000 c0529474 c06b3aa0 c050a3cc
> >> [    1.032958] 9ee0: c072d000 c085c000 00000002 c052582c c050a324 c072d000 00000000 c0503160
> >> [    1.041687] 9f00: 00002710 00000000 c04da8f8 c0060900 c2809f64 ffffffff 00010000 946f70b5
> >> [    1.050384] 9f20: 00000062 c0816120 00000002 c052582c c0525848 c072d000 c04da8f8 c0060a18
> >> [    1.059112] 9f40: c2809f64 c2809f64 00000000 946f70b5 00000062 c0816120 00000002 c052582c
> >> [    1.067810] 9f60: c052584c c072d000 c04da8f8 c050352c 00000002 00000002 00000000 c0502400
> >> [    1.076507] 9f80: c2809f7c 00000000 c03f86f4 00000000 00000000 00000000 00000000 00000000
> >> [    1.085205] 9fa0: 00000000 c03f8704 00000000 c000850c 00000000 00000000 00000000 00000000
> >> [    1.093902] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> >> [    1.102600] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> >> [    1.111206] Call trace:
> >> [    1.111328]  software_node_to_swnode from device_add_software_node+0x20/0x80
> >> [    1.121704]  device_add_software_node from omap16xx_gpio_init+0xa8/0xe4
> >> [    1.128997]  omap16xx_gpio_init from do_one_initcall+0x68/0x1f4
> >> [    1.135620]  do_one_initcall from kernel_init_freeable+0x1ec/0x240
> >> [    1.142517]  kernel_init_freeable from kernel_init+0x10/0x108
> >> [    1.148864]  kernel_init from ret_from_fork+0x14/0x28
> >> [    1.154357] Exception stack(0xc2809fb0 to 0xc2809ff8)
> >> [    1.159820] 9fa0:                                     00000000 00000000 00000000 00000000
> >> [    1.168518] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> >> [    1.177185] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> >> [    1.184295] Code: e3500000 012fff1e e59f3034 e5932000 (e5923000)
> >> [    1.191040] ---[ end trace 0000000000000000 ]---
> >> [    1.196350] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> >> [    1.204559] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> >>
> >
> > Thanks. This makes sense. Both omap16xx_gpio_init() and
> > software_node_init() run as postcore_initcall() so if the order is not
> > right, it will fail.
> >
> > Cc'ing Andy who's a reviewer for software nodes. Andy: is there any
> > reason to run software_node_init() as a postcore initcall? It only
> > allocates the kset, can we move it to core_initcall() by any chance?
> >
> > Bart
> >
> 
> In any case, Aaro: the following should theoretically fix it:
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 51320837f3a9..5ba904f8a08a 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -1134,7 +1134,7 @@ static int __init software_node_init(void)
>  		return -ENOMEM;
>  	return 0;
>  }
> -postcore_initcall(software_node_init);
> +core_initcall(software_node_init);

This is wrong direction IMO. The matching by label is working now, so
there is no reason to rush this change into the kernel, it is simply a
cleanup.

Wait until the resolution of my pact allowing using node names, or your
proposal that installs and attaches nodes dynamically based on bus
notifiers (or both) and then make the conversion. Then you will not need
to move init order around, add new dependencies between drivers, and so
on.

Thanks.

-- 
Dmitry

