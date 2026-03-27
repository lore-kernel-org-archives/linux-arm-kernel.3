Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C8F10F2867
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 19:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hb37xWKdnjS5lXA97a47Lm2vaHCVy/T7RDUhhmT/v14=; b=4972k2E7QyvCGptYW0S9LrL21L
	iZAN2V/lGsmF1TS7jvavkswMg7RK2VWQbaUfNczgzRbfznQGskM6RR5qYXl57JG/4FXmksyiNmJ+a
	jdW3nJGSmXgwakYC7Q4FoiMAgqMFy2I15TQ5CQo6deT5lkPs/JoRxBoBqaVXlWIXBPBwLXXcYucLp
	ELfe/2og6ArQSzKrA7yykiNfrWprTLHV5cTFvGNorBfgFqgSaHXc0OzSY+3NNHn9WBP72xmZcPgtU
	uCJ+cnKdsHuADfGK35lRvO4oxaYtbR9R2MsGYrAubUETHCMc0yKPtaM9ZmRq678DmMDoLlFuRYxTY
	vZvru/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6CTN-0000000846G-08Cq;
	Fri, 27 Mar 2026 19:03:57 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6CTK-0000000845k-3NLA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 19:03:55 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-12a747e7b2fso1443859c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 12:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774638234; x=1775243034; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hb37xWKdnjS5lXA97a47Lm2vaHCVy/T7RDUhhmT/v14=;
        b=WkcymNekq4+bUPNH9oS2E6Wb3+zC0MO7bYTQTZ6mcyW+FAEaZc+fQP0oSLVctyaGZx
         G+rYJ0dgXP5uj7qWfXrJUj827SkvsOAZre3gulQUrYYKXFOh5sCVEpbPIbbDE9vKqdZf
         I2T2qgfffMPsUxUazr7Gf+VlJmUZ8HWHQSAlLyqAwCwFqfXlw87tVbYopwm419kOHXXj
         mh8rXbz0oGT/RRAKljCPIiNSnyP9NgkPpoWAp+0/hSv0YJkgpHYbmnekcl8FlrDmeVqE
         i5rlXZ34jEZdfxYscklSXaDiK74WOh+MU9bXIKKj36wDnIu28dK5wgtyM9awBwxFViol
         6p3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774638234; x=1775243034;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hb37xWKdnjS5lXA97a47Lm2vaHCVy/T7RDUhhmT/v14=;
        b=e9H8fChy3Pj/juWyYNXji055RdRMCOU2zZ3l56+2/iy1WFBu30p60A0fHs8tsY4nmD
         MBXaBN3c/JvJlD+WapSfrBCsc/dCzqQa9ljs8zPjl3safjuKfx9OaN4hhiAMlVz5XlRE
         OJ/Vm9MWDQEqhpvfvyAh2bSY2/EbtAllIIgu6KrGTdNkOxlX7n6DGCeL9vPBwZgNWSeJ
         BV6idQ07OlHkDQiT7O0faRzlA3DPOpB/SYvrRw/cANOUlRUx0mtqVvV7li2IevkDCROA
         o9+c9HTOEGdJJ0oowtWx2fYGoXfKJZYU5KOlNFOR+AUSTMqSOQ3afbUMyqkR4+0l7UAR
         echg==
X-Forwarded-Encrypted: i=1; AJvYcCXO09iJoBpdHHd/U+sN1MdyrGmXCTdvyf0flOF2E1n2xEFgG8UcIoaR/n9D7Sz/ne9nQLfMqrAf0iL65MWJPlMN@lists.infradead.org
X-Gm-Message-State: AOJu0YxtBhEKYrfIM2ZBn0qQQtCfEzsvaZ/LQHtCKbzEVtU7W6YHaAIr
	J0+EfmyoNER36Xh56VD8MV8J14XbYK7B+WhrqDrTaJ4rnIPDzgIHQT3N
X-Gm-Gg: ATEYQzyHi0oWHcauUmSAeEaf2Y649y6x4rQgCXVszt3E3Lsf+uLnsJItE0KgNYtqq2m
	a8J/YcNOLpO2qAZTM/FTubd2b0bWVWgGglXFNZAVhAxHxBQB0TxwhoSxPLsCruVktgfn5yIx9bM
	l0/lfnwjxXWHzBa7jSCzMJL5aLzq/oiqfUt5gpIorijA7fFl4H1tEG/8zWkt/imDhCyzMMXuUdG
	fCKc/SBzLUyY8Fd3gaJXk3aebSriH8yRLA3ig24VycYmW5bFQXBPsJWSECNMxUo0CXADEXWYXHe
	eWUnWS5314A+jZXoQ8PcBeBBvTIF7Z/xc15lIYRFijNR6hLld+MWy3eUVOEztAYEgkyV/VAWd+I
	3OYdg3+7ynM4T47D7IjHFcJw8R535PCTgaE8gu2WB1uKHkZ32Hmb/AXTYRy4UY0a4aXG/LbLDZ2
	GDHoY5wEPwkDMlyleKQdY64npXLTpsXPZj8pEiTwKJpptaRNaO6D4jg+mzHTuhFDWi
X-Received: by 2002:a05:7022:6706:b0:128:d2f2:5cf8 with SMTP id a92af1059eb24-12ab28fd24amr1965677c88.34.1774638233602;
        Fri, 27 Mar 2026 12:03:53 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:85b0:37ea:7fa8:4717])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c49a5b0fsm178578eec.11.2026.03.27.12.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:03:52 -0700 (PDT)
Date: Fri, 27 Mar 2026 12:03:49 -0700
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
Message-ID: <acbUEIXfBMDWEarF@google.com>
References: <7h1phxpzml.fsf@baylibre.com>
 <CAMRc=McosSU39SERKtjmhJdTv2cPi44PG=bYqAcfQLDX4QB0Tg@mail.gmail.com>
 <CAMRc=MeYMe1gXjiYuQJpNWchp+V1uLkuRuyO3ohQjfAcg9q3MQ@mail.gmail.com>
 <acaOlGcGQEZHQ_mJ@darkstar.musicnaut.iki.fi>
 <CAMRc=McDdK8Y7wtG8WObjD6WF-2ftKBDwKbvj=xL-NMfeV=bPQ@mail.gmail.com>
 <aca3ajb_G3gD24S7@darkstar.musicnaut.iki.fi>
 <CAMRc=McVPskF4pMQSz=hR8CkyZhoPmCU_yJFT66vgTCPJd3-Vw@mail.gmail.com>
 <CAMRc=MeUEApQuw8prxr6ku674fqORCy2=givJxLe+cUCC0PGww@mail.gmail.com>
 <acbI0NnMvmSiobLz@google.com>
 <CAMRc=Mc6JwG2uMr-T0owu_reDgO5WwmzYknEKRdfQRwzuV=XHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc6JwG2uMr-T0owu_reDgO5WwmzYknEKRdfQRwzuV=XHg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_120354_847873_D9C42363 
X-CRM114-Status: GOOD (  34.60  )
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

On Fri, Mar 27, 2026 at 11:26:02AM -0700, Bartosz Golaszewski wrote:
> On Fri, 27 Mar 2026 19:16:41 +0100, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> said:
> > On Fri, Mar 27, 2026 at 10:27:07AM -0700, Bartosz Golaszewski wrote:
> >> On Fri, 27 Mar 2026 18:23:29 +0100, Bartosz Golaszewski <brgl@kernel.org> said:
> >> > On Fri, Mar 27, 2026 at 5:59 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> >> >>
> >> >> Hi,
> >> >>
> >> >> On Fri, Mar 27, 2026 at 03:22:12PM +0100, Bartosz Golaszewski wrote:
> >> >> > Hmm, I'm wondering if there's a race with consumers already requesting
> >> >> > the GPIOs after the controller device is registered but before the
> >> >> > software node is added. I'll send a version with software nodes being
> >> >> > registered first, then passes as firmware nodes to the platform device
> >> >> > API before the device is registered.
> >> >>
> >> >> It crashes early, I was able to get an UART log from OSK (another
> >> >> 16xx board):
> >> >>
> >> >> [    1.001525] Register r12 information: 2-page vmalloc region starting at 0xc2808000 allocated at kernel_clone+0xa4/0x20c
> >> >> [    1.013092] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> >> >> [    1.019500] Stack: (0xc2809ed0 to 0xc280a000)
> >> >> [    1.024230] 9ec0:                                     c072d000 c0529474 c06b3aa0 c050a3cc
> >> >> [    1.032958] 9ee0: c072d000 c085c000 00000002 c052582c c050a324 c072d000 00000000 c0503160
> >> >> [    1.041687] 9f00: 00002710 00000000 c04da8f8 c0060900 c2809f64 ffffffff 00010000 946f70b5
> >> >> [    1.050384] 9f20: 00000062 c0816120 00000002 c052582c c0525848 c072d000 c04da8f8 c0060a18
> >> >> [    1.059112] 9f40: c2809f64 c2809f64 00000000 946f70b5 00000062 c0816120 00000002 c052582c
> >> >> [    1.067810] 9f60: c052584c c072d000 c04da8f8 c050352c 00000002 00000002 00000000 c0502400
> >> >> [    1.076507] 9f80: c2809f7c 00000000 c03f86f4 00000000 00000000 00000000 00000000 00000000
> >> >> [    1.085205] 9fa0: 00000000 c03f8704 00000000 c000850c 00000000 00000000 00000000 00000000
> >> >> [    1.093902] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> >> >> [    1.102600] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> >> >> [    1.111206] Call trace:
> >> >> [    1.111328]  software_node_to_swnode from device_add_software_node+0x20/0x80
> >> >> [    1.121704]  device_add_software_node from omap16xx_gpio_init+0xa8/0xe4
> >> >> [    1.128997]  omap16xx_gpio_init from do_one_initcall+0x68/0x1f4
> >> >> [    1.135620]  do_one_initcall from kernel_init_freeable+0x1ec/0x240
> >> >> [    1.142517]  kernel_init_freeable from kernel_init+0x10/0x108
> >> >> [    1.148864]  kernel_init from ret_from_fork+0x14/0x28
> >> >> [    1.154357] Exception stack(0xc2809fb0 to 0xc2809ff8)
> >> >> [    1.159820] 9fa0:                                     00000000 00000000 00000000 00000000
> >> >> [    1.168518] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> >> >> [    1.177185] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> >> >> [    1.184295] Code: e3500000 012fff1e e59f3034 e5932000 (e5923000)
> >> >> [    1.191040] ---[ end trace 0000000000000000 ]---
> >> >> [    1.196350] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> >> >> [    1.204559] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> >> >>
> >> >
> >> > Thanks. This makes sense. Both omap16xx_gpio_init() and
> >> > software_node_init() run as postcore_initcall() so if the order is not
> >> > right, it will fail.
> >> >
> >> > Cc'ing Andy who's a reviewer for software nodes. Andy: is there any
> >> > reason to run software_node_init() as a postcore initcall? It only
> >> > allocates the kset, can we move it to core_initcall() by any chance?
> >> >
> >> > Bart
> >> >
> >>
> >> In any case, Aaro: the following should theoretically fix it:
> >>
> >> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> >> index 51320837f3a9..5ba904f8a08a 100644
> >> --- a/drivers/base/swnode.c
> >> +++ b/drivers/base/swnode.c
> >> @@ -1134,7 +1134,7 @@ static int __init software_node_init(void)
> >>  		return -ENOMEM;
> >>  	return 0;
> >>  }
> >> -postcore_initcall(software_node_init);
> >> +core_initcall(software_node_init);
> >
> > This is wrong direction IMO. The matching by label is working now, so
> > there is no reason to rush this change into the kernel, it is simply a
> > cleanup.
> >
> > Wait until the resolution of my pact allowing using node names, or your
> > proposal that installs and attaches nodes dynamically based on bus
> > notifiers (or both) and then make the conversion. Then you will not need
> > to move init order around, add new dependencies between drivers, and so
> > on.
> >
> 
> Hi Dmitry,
> 
> I'm not rushing anything. It's fine to delay this for now. But the new solution
> you're mentioning (whatever it will end up to be) is something we should use
> when there's only a lose link between the supplier and consumer. Here both the
> GPIO controller and the consumer are instantiated from a board file and are
> built-in so there's no link-order problem and we can directly reference one
> software node from another. It's a different kind of problem.
> 
> I'd like to figure out whether software nodes are not made available too late
> into the boot process for no reason and if maybe it makes sense to initialize
> them earlier.

Actually you are right. I wonder if we should not stuff the call to
initialize software nodes into the same place we are calling
of_core_init(): drivers/base/init.c:driver_init().

Thanks.

-- 
Dmitry

