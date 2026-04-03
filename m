Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDDED730AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 07:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9YUctVfAtJIk1ZmXcJSd5NOCb5Fs4LOg6Ehx0OBRDQ=; b=2Yb64n+m51v6KKcxtWJT/Nv3sE
	BIqYSOjrL9h/QOUdx222VLEFOaIyCyZevgwtR6NNSIFc/hxFmllLpyt4jhscNhsY8wS8qDqCuHyXA
	8Dm7e/f92j5cu8ebP+MCVNFCufnRoWWff5yI6YIy4Ux4ZREbe5ulztgTnh72Ep7VO0gPFeZR35gSQ
	IeIOnbbU74CusOZBnifgyrWRs3xks+D9OnbSN6jtBVzBDrwCDZh+e7JYj8sFSLqWcfqquubkMc+Vy
	rgaJpVnznM/pEqUuIE+ZmsNIlq9WbMlUCS0mzi97VCQ/pV+25A3Y12P5zV1qpawM2jUcIFGm3f2M/
	Suog+x8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YsL-00000001ZyK-1m8S;
	Fri, 03 Apr 2026 07:23:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YsI-00000001ZwH-2vyQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 07:23:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 959E54455E
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Apr 2026 07:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E5AC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Apr 2026 07:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775201005;
	bh=X5jJUvqRgah6D4xreZa2cicuZ87mzGtemSdNEwIyCE8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qbsrfuVDWXDD14HyUPLCwUoEA35b36V8S0xofxc6TYCTk1NGhobr8TzmodD/Smtx4
	 i1QQs5kzFkuDbk/rvg3UozTwMytnG6oUaVI6ZgUWnRCT+4VNmCBHdf450IesQzuZ0q
	 D4tp6UuHBdTfVkvzVGU8APuLPtyH/cN9I8meoXFtmPrO11do9hsn01I+J8U2+an6Ch
	 5gRSGzScckRFAlp1KitJZc+tz+dp6bjBVwv7i4FeWztE1W2RIwDRZu/e9VPxeyknD5
	 B60rdTQ3IYQfsel+S8iRlIbjOc7bOyopVHXNkSEijfCHsDZF5A0j6OvsyptvzNIJ79
	 LSEB4VoLy9+Kg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38a3066b68bso14777691fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 00:23:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXLoZg/De1s4FwAq3FXKr/kHssqwZ6sDZytDYGus7Pelfv7AmORkxLTF9K+wYnldwIoQ9tUV3G1magh+0+CSBkc@lists.infradead.org
X-Gm-Message-State: AOJu0YxwbISrX403SOB8hf5hojrHoKr/Jvvba5C+PvxEF/El7wkdXuPD
	nHnBoC7iexZ9riQgC6AoXwhAvGm1iDAU+Hg+2hwaOy7uQ7Rs/DKQHNrxyND6UljzTAPkkyoiXPm
	SGC5RUsHd9ZwVC/94npLUQkhOKhku10IqhTyQHKni6w==
X-Received: by 2002:a2e:be92:0:b0:38c:6979:f75d with SMTP id
 38308e7fff4ca-38d91d89693mr6167751fa.34.1775201003957; Fri, 03 Apr 2026
 00:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
 <20260402-nokia770-gpio-swnodes-v5-4-d730db3dd299@oss.qualcomm.com> <ac6n1p3eLVFzumbt@google.com>
In-Reply-To: <ac6n1p3eLVFzumbt@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 3 Apr 2026 09:23:11 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdZ7JRs3vvz5Rz7vMHYM1JQGRtVujRXeNhsz2igtDADEw@mail.gmail.com>
X-Gm-Features: AQROBzAuWuJJYQfEE9L788n8ipCOf6hcvXwHusg9h7TnjUkNV2xHUaa0ho16T-M
Message-ID: <CAMRc=MdZ7JRs3vvz5Rz7vMHYM1JQGRtVujRXeNhsz2igtDADEw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Kevin Hilman <khilman@baylibre.com>, 
	Arnd Bergmann <arnd@arndb.de>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_002326_850800_AAE1F5BB 
X-CRM114-Status: GOOD (  14.96  )
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

On Thu, Apr 2, 2026 at 7:32=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, Apr 02, 2026 at 04:15:05PM +0200, Bartosz Golaszewski wrote:
> > @@ -244,6 +263,13 @@ static int __init omap16xx_gpio_init(void)
> >               iounmap(base);
> >
> >               platform_device_register(omap16xx_gpio_dev[i]);
> > +
> > +             ret =3D device_add_software_node(&omap16xx_gpio_dev[i]->d=
ev,
> > +                                            omap16xx_gpio_swnodes[i]);
> > +             if (ret) {
> > +                     dev_err(&pdev->dev, "Failed to add software node.=
\n");
> > +                     return ret;
> > +             }
>
> I think the best and safest way is to convert to using
> platform_driver_register_full() and set swnode in the relevant "info"
> instance.

For sure, that's the plan. I will respin this after v7.1-rc1 with that chan=
ge.

Bart

