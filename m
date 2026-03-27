Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918EC10F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 18:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqD8xxG4ZdJ46Ds13gn5sz2nG9VRhx8eC3o8yZoP2kA=; b=CLhVUJLUi8R8sZo4TgI7Q4O5NM
	b2HIDazl5vrDrCDKEQTQxCm0b9nGUXW/EniP7YsAsmjcsDwTgbqKz+2DYy1QRmbGuC8RZXAsqcyXQ
	SoELQoGatmeBGxEmHiddKiMj/78XDna6daw9fHQkr2aRwoJeQTsPC8Eepmp3XNPoa8FEVid/+NRVR
	FEkfP95Lho5qZzh4I/dnSRkVKckb0UqPbcnNsca/jMJhI68LiB4qpcbeCfmuPBnzQIEzExGOqGHCx
	EO+YAZRj3vet/xTfZajMfSuclz3hVUWCamqvGDXK9E3TPvsemSkKmbZszC9uH+HtQDrJyQvFqJWvq
	UI4mEHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Bsm-00000007wg2-35bX;
	Fri, 27 Mar 2026 18:26:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Bsk-00000007wft-1zhB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 18:26:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5867C6013F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 18:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05815C2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 18:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774635965;
	bh=HDE773oD9WhrhUQdek8MlyVxt7CVMOrinmsr0pm8nF8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=TyFxZmNPWrxOFwIoAKqmtlIJQYkfVf1WTWGlalRc0Id0h7hSeIQEDH69EWrq5WEIg
	 OVgOeSKhF86CwcTSLIOnb3puhPUmw8TdqWLLBaZDDuUiXsaf7+ynNhfTNvHFFNLz8Q
	 MTU/KhdDD6GH6sfgxnVFXgC6G94s0K6GJfhitBo0d27C30eLl0hPh/rYdVLypED47B
	 WZRUyJ/NUdiSDQq1812Jwlh1khzAWusvKG0TqI0gWkoQFVbyro9L/ncHTvnK495YSs
	 s5+1xusHLHT+wxKn8E/scV+vNATkw26XgeeNS3pQmh6MgMQNOTUHixOTsEtuiArU/V
	 l+VVKJD9WkUcQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38a723b2b29so21227191fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 11:26:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMxXRSUPzN+//sUZXCTyC/3200vHBAYpAYwqPbJf6EwJmERfKC4U+WbfR52+WbaPvkYT/cWJY7sUgKpAp+hYX5@lists.infradead.org
X-Gm-Message-State: AOJu0YzNK4D7v+1vLmONxhhC0byYcxryjatkobtbwgjQUsz5KTtBQgSE
	5Jkone2UrN6vk3Awe77m6NWN84BSOo66YNTQHxbYG8YhSvJobyiLM6qiJF7eA9hlGW6/FO7QtaH
	YU4puNIQ7+ck/UjE0b0vc4Rtrg8TJDa5wNvjZASLbCg==
X-Received: by 2002:a2e:a9a3:0:b0:38a:a7b4:15e8 with SMTP id
 38308e7fff4ca-38c73130537mr13693991fa.12.1774635963592; Fri, 27 Mar 2026
 11:26:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Mar 2026 11:26:02 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Mar 2026 11:26:02 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <acbI0NnMvmSiobLz@google.com>
MIME-Version: 1.0
References: <2fb42d16-887a-4564-8e50-c9d6db564c4e@app.fastmail.com>
 <CAMRc=McYj-D8XL_wnmTEucMrwCy1-xr7h0XYrL68soMVHL1SRA@mail.gmail.com>
 <7h1phxpzml.fsf@baylibre.com> <CAMRc=McosSU39SERKtjmhJdTv2cPi44PG=bYqAcfQLDX4QB0Tg@mail.gmail.com>
 <CAMRc=MeYMe1gXjiYuQJpNWchp+V1uLkuRuyO3ohQjfAcg9q3MQ@mail.gmail.com>
 <acaOlGcGQEZHQ_mJ@darkstar.musicnaut.iki.fi> <CAMRc=McDdK8Y7wtG8WObjD6WF-2ftKBDwKbvj=xL-NMfeV=bPQ@mail.gmail.com>
 <aca3ajb_G3gD24S7@darkstar.musicnaut.iki.fi> <CAMRc=McVPskF4pMQSz=hR8CkyZhoPmCU_yJFT66vgTCPJd3-Vw@mail.gmail.com>
 <CAMRc=MeUEApQuw8prxr6ku674fqORCy2=givJxLe+cUCC0PGww@mail.gmail.com> <acbI0NnMvmSiobLz@google.com>
Date: Fri, 27 Mar 2026 11:26:02 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc6JwG2uMr-T0owu_reDgO5WwmzYknEKRdfQRwzuV=XHg@mail.gmail.com>
X-Gm-Features: AQROBzAMGqEEBz3VL5zOD-Izkvy7HlXo3Ok39-WVKvtwlTb9hMKkcv50nbr2CA0
Message-ID: <CAMRc=Mc6JwG2uMr-T0owu_reDgO5WwmzYknEKRdfQRwzuV=XHg@mail.gmail.com>
Subject: Re: [RFT PATCH v3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Hans de Goede <hansg@kernel.org>, 
	Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 27 Mar 2026 19:16:41 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> On Fri, Mar 27, 2026 at 10:27:07AM -0700, Bartosz Golaszewski wrote:
>> On Fri, 27 Mar 2026 18:23:29 +0100, Bartosz Golaszewski <brgl@kernel.org=
> said:
>> > On Fri, Mar 27, 2026 at 5:59=E2=80=AFPM Aaro Koskinen <aaro.koskinen@i=
ki.fi> wrote:
>> >>
>> >> Hi,
>> >>
>> >> On Fri, Mar 27, 2026 at 03:22:12PM +0100, Bartosz Golaszewski wrote:
>> >> > Hmm, I'm wondering if there's a race with consumers already request=
ing
>> >> > the GPIOs after the controller device is registered but before the
>> >> > software node is added. I'll send a version with software nodes bei=
ng
>> >> > registered first, then passes as firmware nodes to the platform dev=
ice
>> >> > API before the device is registered.
>> >>
>> >> It crashes early, I was able to get an UART log from OSK (another
>> >> 16xx board):
>> >>
>> >> [    1.001525] Register r12 information: 2-page vmalloc region starti=
ng at 0xc2808000 allocated at kernel_clone+0xa4/0x20c
>> >> [    1.013092] Process swapper/0 (pid: 1, stack limit =3D 0x(ptrval))
>> >> [    1.019500] Stack: (0xc2809ed0 to 0xc280a000)
>> >> [    1.024230] 9ec0:                                     c072d000 c05=
29474 c06b3aa0 c050a3cc
>> >> [    1.032958] 9ee0: c072d000 c085c000 00000002 c052582c c050a324 c07=
2d000 00000000 c0503160
>> >> [    1.041687] 9f00: 00002710 00000000 c04da8f8 c0060900 c2809f64 fff=
fffff 00010000 946f70b5
>> >> [    1.050384] 9f20: 00000062 c0816120 00000002 c052582c c0525848 c07=
2d000 c04da8f8 c0060a18
>> >> [    1.059112] 9f40: c2809f64 c2809f64 00000000 946f70b5 00000062 c08=
16120 00000002 c052582c
>> >> [    1.067810] 9f60: c052584c c072d000 c04da8f8 c050352c 00000002 000=
00002 00000000 c0502400
>> >> [    1.076507] 9f80: c2809f7c 00000000 c03f86f4 00000000 00000000 000=
00000 00000000 00000000
>> >> [    1.085205] 9fa0: 00000000 c03f8704 00000000 c000850c 00000000 000=
00000 00000000 00000000
>> >> [    1.093902] 9fc0: 00000000 00000000 00000000 00000000 00000000 000=
00000 00000000 00000000
>> >> [    1.102600] 9fe0: 00000000 00000000 00000000 00000000 00000013 000=
00000 00000000 00000000
>> >> [    1.111206] Call trace:
>> >> [    1.111328]  software_node_to_swnode from device_add_software_node=
+0x20/0x80
>> >> [    1.121704]  device_add_software_node from omap16xx_gpio_init+0xa8=
/0xe4
>> >> [    1.128997]  omap16xx_gpio_init from do_one_initcall+0x68/0x1f4
>> >> [    1.135620]  do_one_initcall from kernel_init_freeable+0x1ec/0x240
>> >> [    1.142517]  kernel_init_freeable from kernel_init+0x10/0x108
>> >> [    1.148864]  kernel_init from ret_from_fork+0x14/0x28
>> >> [    1.154357] Exception stack(0xc2809fb0 to 0xc2809ff8)
>> >> [    1.159820] 9fa0:                                     00000000 000=
00000 00000000 00000000
>> >> [    1.168518] 9fc0: 00000000 00000000 00000000 00000000 00000000 000=
00000 00000000 00000000
>> >> [    1.177185] 9fe0: 00000000 00000000 00000000 00000000 00000013 000=
00000
>> >> [    1.184295] Code: e3500000 012fff1e e59f3034 e5932000 (e5923000)
>> >> [    1.191040] ---[ end trace 0000000000000000 ]---
>> >> [    1.196350] Kernel panic - not syncing: Attempted to kill init! ex=
itcode=3D0x0000000b
>> >> [    1.204559] ---[ end Kernel panic - not syncing: Attempted to kill=
 init! exitcode=3D0x0000000b ]---
>> >>
>> >
>> > Thanks. This makes sense. Both omap16xx_gpio_init() and
>> > software_node_init() run as postcore_initcall() so if the order is not
>> > right, it will fail.
>> >
>> > Cc'ing Andy who's a reviewer for software nodes. Andy: is there any
>> > reason to run software_node_init() as a postcore initcall? It only
>> > allocates the kset, can we move it to core_initcall() by any chance?
>> >
>> > Bart
>> >
>>
>> In any case, Aaro: the following should theoretically fix it:
>>
>> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
>> index 51320837f3a9..5ba904f8a08a 100644
>> --- a/drivers/base/swnode.c
>> +++ b/drivers/base/swnode.c
>> @@ -1134,7 +1134,7 @@ static int __init software_node_init(void)
>>  		return -ENOMEM;
>>  	return 0;
>>  }
>> -postcore_initcall(software_node_init);
>> +core_initcall(software_node_init);
>
> This is wrong direction IMO. The matching by label is working now, so
> there is no reason to rush this change into the kernel, it is simply a
> cleanup.
>
> Wait until the resolution of my pact allowing using node names, or your
> proposal that installs and attaches nodes dynamically based on bus
> notifiers (or both) and then make the conversion. Then you will not need
> to move init order around, add new dependencies between drivers, and so
> on.
>

Hi Dmitry,

I'm not rushing anything. It's fine to delay this for now. But the new solu=
tion
you're mentioning (whatever it will end up to be) is something we should us=
e
when there's only a lose link between the supplier and consumer. Here both =
the
GPIO controller and the consumer are instantiated from a board file and are
built-in so there's no link-order problem and we can directly reference one
software node from another. It's a different kind of problem.

I'd like to figure out whether software nodes are not made available too la=
te
into the boot process for no reason and if maybe it makes sense to initiali=
ze
them earlier.

Bart

