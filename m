Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7BD10F285F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 17:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUPhlG5WLxFbzjvveOF2VL5ehhZk03mq0giP2wpTXAk=; b=t5yyCbyzd/GO9vK/YlRsQvbySc
	eJOEEN+A/fvXvn4z5QUoTHYMt9r/LJKpn3yh3mB7x61BBquzYnhRGAv8bfoPNbouTETv0IXh+sQ6G
	Xv1vO/U6NC6kOFY7+GPcrl45kLEOamNMRosLkuX9ZMfD9rKOc5G5QykOaA3aParfb5hLTcZbgJi3s
	DWMdlo7LW/p0+7Zh+aPgTt95QhahWlWjOjW6XPP0lYVz65XOwP4MCp4rM2Sc0IYSqAi6kNb1KMDhg
	tpu/63uia2Su5s+9qVawywU+ejx0IWXod6BqOgbLx4ixDjSJc/Hr6Qmnbm4Kwb5StPw+x8tDnUsJb
	+5S+7r2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Axl-00000007rWT-2rgV;
	Fri, 27 Mar 2026 17:27:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Axj-00000007rVu-2pCy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 17:27:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B181B417FB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 17:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927ABC4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 17:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774632430;
	bh=eMKH+40dSjMtLqvxvxWCSOCjTU/WAJA2oHSZ/A5hsR4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=OwG84AtSevxyWcXb19eDI0S13Ii5zGBbneQiq879ObtbloAQtse7BEBse354N4CPM
	 bkltfXHFFY2t9Ep+s3962tdsnXNhnjV43TX92R5OhG855/qCPFH17rugWJbanI9V8V
	 +l7sCqi7Wm4ilipTY1Tmw4F3uVNwC0uLHj9Nr6LQSSycyQSKQXYKjxeIHvng37h/p6
	 AzerbAyUdFmJ4xq1eRLF/lboC52vxhWotjqekSUhxDlMAvuSSbbnVv/peLjrhXxRag
	 tb5/IUC3TQD4wFHramW1Xziklm5SMHs4Hj9SUFHo827UuH1Uq3j7K+BziyH/T+ATFw
	 kZot6kJGohnNQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59dea72099eso2966167e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 10:27:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWGkZxaEax7Lk9gQ4DAk8IyuSYCrQyX2pGNRi7QsnEy/S8RrW7B1DAypAfZY5D2jLD/DpL41q2a/eWC4Xf4GRu@lists.infradead.org
X-Gm-Message-State: AOJu0YzcEiGcNk+0VbtkEdrZL8xK4eaz9l8OLeFKCu0PapSSCnXcvpSA
	6F7FunMtFxQsL4Mg5dqh6SryNn5MR+Lp3wztCjwVfjHtwgKODlO2WUnHK4KIkygqjpkv1dX5RAy
	1KCtkUSPigD/RJ3Bzp4gRYiAsUUmy9RH2eezQWG3kMQ==
X-Received: by 2002:a05:6512:1288:b0:5a1:18e9:a361 with SMTP id
 2adb3069b0e04-5a2ab927a32mr1601271e87.32.1774632429204; Fri, 27 Mar 2026
 10:27:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Mar 2026 10:27:07 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Mar 2026 10:27:07 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=McVPskF4pMQSz=hR8CkyZhoPmCU_yJFT66vgTCPJd3-Vw@mail.gmail.com>
MIME-Version: 1.0
References: <20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com>
 <2fb42d16-887a-4564-8e50-c9d6db564c4e@app.fastmail.com> <CAMRc=McYj-D8XL_wnmTEucMrwCy1-xr7h0XYrL68soMVHL1SRA@mail.gmail.com>
 <7h1phxpzml.fsf@baylibre.com> <CAMRc=McosSU39SERKtjmhJdTv2cPi44PG=bYqAcfQLDX4QB0Tg@mail.gmail.com>
 <CAMRc=MeYMe1gXjiYuQJpNWchp+V1uLkuRuyO3ohQjfAcg9q3MQ@mail.gmail.com>
 <acaOlGcGQEZHQ_mJ@darkstar.musicnaut.iki.fi> <CAMRc=McDdK8Y7wtG8WObjD6WF-2ftKBDwKbvj=xL-NMfeV=bPQ@mail.gmail.com>
 <aca3ajb_G3gD24S7@darkstar.musicnaut.iki.fi> <CAMRc=McVPskF4pMQSz=hR8CkyZhoPmCU_yJFT66vgTCPJd3-Vw@mail.gmail.com>
Date: Fri, 27 Mar 2026 10:27:07 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeUEApQuw8prxr6ku674fqORCy2=givJxLe+cUCC0PGww@mail.gmail.com>
X-Gm-Features: AQROBzBFL3k-pSjLqyL79AX9w3CeRs-LC8fKlF3aOyiPrJn21a8pJs-NXP_lBBo
Message-ID: <CAMRc=MeUEApQuw8prxr6ku674fqORCy2=givJxLe+cUCC0PGww@mail.gmail.com>
Subject: Re: [RFT PATCH v3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kevin Hilman <khilman@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_102711_756441_9B676A29 
X-CRM114-Status: GOOD (  19.76  )
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

On Fri, 27 Mar 2026 18:23:29 +0100, Bartosz Golaszewski <brgl@kernel.org> s=
aid:
> On Fri, Mar 27, 2026 at 5:59=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.=
fi> wrote:
>>
>> Hi,
>>
>> On Fri, Mar 27, 2026 at 03:22:12PM +0100, Bartosz Golaszewski wrote:
>> > Hmm, I'm wondering if there's a race with consumers already requesting
>> > the GPIOs after the controller device is registered but before the
>> > software node is added. I'll send a version with software nodes being
>> > registered first, then passes as firmware nodes to the platform device
>> > API before the device is registered.
>>
>> It crashes early, I was able to get an UART log from OSK (another
>> 16xx board):
>>
>> [    1.001525] Register r12 information: 2-page vmalloc region starting =
at 0xc2808000 allocated at kernel_clone+0xa4/0x20c
>> [    1.013092] Process swapper/0 (pid: 1, stack limit =3D 0x(ptrval))
>> [    1.019500] Stack: (0xc2809ed0 to 0xc280a000)
>> [    1.024230] 9ec0:                                     c072d000 c05294=
74 c06b3aa0 c050a3cc
>> [    1.032958] 9ee0: c072d000 c085c000 00000002 c052582c c050a324 c072d0=
00 00000000 c0503160
>> [    1.041687] 9f00: 00002710 00000000 c04da8f8 c0060900 c2809f64 ffffff=
ff 00010000 946f70b5
>> [    1.050384] 9f20: 00000062 c0816120 00000002 c052582c c0525848 c072d0=
00 c04da8f8 c0060a18
>> [    1.059112] 9f40: c2809f64 c2809f64 00000000 946f70b5 00000062 c08161=
20 00000002 c052582c
>> [    1.067810] 9f60: c052584c c072d000 c04da8f8 c050352c 00000002 000000=
02 00000000 c0502400
>> [    1.076507] 9f80: c2809f7c 00000000 c03f86f4 00000000 00000000 000000=
00 00000000 00000000
>> [    1.085205] 9fa0: 00000000 c03f8704 00000000 c000850c 00000000 000000=
00 00000000 00000000
>> [    1.093902] 9fc0: 00000000 00000000 00000000 00000000 00000000 000000=
00 00000000 00000000
>> [    1.102600] 9fe0: 00000000 00000000 00000000 00000000 00000013 000000=
00 00000000 00000000
>> [    1.111206] Call trace:
>> [    1.111328]  software_node_to_swnode from device_add_software_node+0x=
20/0x80
>> [    1.121704]  device_add_software_node from omap16xx_gpio_init+0xa8/0x=
e4
>> [    1.128997]  omap16xx_gpio_init from do_one_initcall+0x68/0x1f4
>> [    1.135620]  do_one_initcall from kernel_init_freeable+0x1ec/0x240
>> [    1.142517]  kernel_init_freeable from kernel_init+0x10/0x108
>> [    1.148864]  kernel_init from ret_from_fork+0x14/0x28
>> [    1.154357] Exception stack(0xc2809fb0 to 0xc2809ff8)
>> [    1.159820] 9fa0:                                     00000000 000000=
00 00000000 00000000
>> [    1.168518] 9fc0: 00000000 00000000 00000000 00000000 00000000 000000=
00 00000000 00000000
>> [    1.177185] 9fe0: 00000000 00000000 00000000 00000000 00000013 000000=
00
>> [    1.184295] Code: e3500000 012fff1e e59f3034 e5932000 (e5923000)
>> [    1.191040] ---[ end trace 0000000000000000 ]---
>> [    1.196350] Kernel panic - not syncing: Attempted to kill init! exitc=
ode=3D0x0000000b
>> [    1.204559] ---[ end Kernel panic - not syncing: Attempted to kill in=
it! exitcode=3D0x0000000b ]---
>>
>
> Thanks. This makes sense. Both omap16xx_gpio_init() and
> software_node_init() run as postcore_initcall() so if the order is not
> right, it will fail.
>
> Cc'ing Andy who's a reviewer for software nodes. Andy: is there any
> reason to run software_node_init() as a postcore initcall? It only
> allocates the kset, can we move it to core_initcall() by any chance?
>
> Bart
>

In any case, Aaro: the following should theoretically fix it:

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 51320837f3a9..5ba904f8a08a 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -1134,7 +1134,7 @@ static int __init software_node_init(void)
 		return -ENOMEM;
 	return 0;
 }
-postcore_initcall(software_node_init);
+core_initcall(software_node_init);

 static void __exit software_node_exit(void)
 {

If you could give it a spin and let me know if it does, it would be awesome=
.

Bart

