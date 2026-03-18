Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B46E107BCF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=; b=hvre8HE6dZNPYYdHSHGg1IuXcR
	+xcF/th/1SAjJ+0ZpFq8BnoWVPkeqmZ1T3ZvRwV381o/+Tq/b6HAcpic/mQveRZ0sE+z4L/JSpiKj
	BHUPcWb12i3mOwGNhdvB/dTnnI7EfKB5nCvnWoyAInEB4piNqrvQcPOfI3ObOKkOchboOqVLm1CaE
	ZN+2FHZapesTbAEERTFKC2GZnGbmXKXz2+q5zevZ0qO+45BAoFmMAHzVyob0mmLw0IwMewj6h1riZ
	fGgId5XKOYncdOhqZUf2a4RE/q2ju9ODOIXbegjYg9ckzBKNEMmRtvlVo1sUXEo1+qRWK6YC7QLlE
	ayor5ELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tMf-00000008shN-0asP;
	Wed, 18 Mar 2026 16:03:21 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tMc-00000008sgR-3VYr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:03:20 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so101481a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 09:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773849796; cv=none;
        d=google.com; s=arc-20240605;
        b=X1DxiU4KlBGTOG/11auFxawUvoaXi3MEGDWYDuMHguGh9ROJy0/3ntj6+BQ88CZ4dv
         qiFHHtqzx5ZjbL39xixySXApQBG9cj9y4VLdJles3mVfnNIUgMqdPc4RSRUCP+S/1rdb
         3H7BgLpYtwpEa6wGf5SWVeL/YTiQEHEnkx/hS4iWt5MWeUXrRLA+0/yHznW/5dar/QOI
         hlWscyurACPjy6K2WpJDwIIeRGMdbF9imw8wbiTTqvkR6htPg2t0HVgGQP8075LSHnjZ
         7Dnb6Zxm3J3wp6ahgoJ9+W0ebqtHhmP22bb9BpVx988MZpDsiBrKC5XdQh4lknSP7o1m
         NOpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=;
        fh=AHYIdEF7U15l+DH3+4DxquPGl3h69jEoos8C6Dq3Gls=;
        b=isd0FcCntsS53SyGS9qdveCv2TfwBEAZXn+4Sl4UcbwjFVh3L7wAIhh387KdPilCRw
         QaSRGn/YKPGiOPoXbrepPTb1LDZoPoK/jVA4YiSXhLlpZHT9WSx4p9t3h2Ztf/+BKXHI
         XY4Uy2TRsy0Zfhlo3gWHJGeKVpNhX16UyO4dQ9ObzE46CdqPBuQj2qevt9Ih7lFtS+Nm
         PMQS+6he0hKIq3eA3h83rHZ2DqvNpWMdJNkfFc7+yN/GWzL/Xg7tvV4sksXc42a4/F7i
         A1VwClN9op7zMvQixSLn86YtX8mzrv3v+RD6yMFWbzACWni5F1oiUHQO4DnkyV6YqUb3
         Hkhg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773849796; x=1774454596; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=;
        b=QxoD1QEIbYJnCf23fT9pduFCseL6gA2cowJnQhAECamchGtvRuY8tTgsy15VRPy5zH
         kC1NJbzUGktkJbv+1cym9BYEboM+SZYF1CvzCx2ClRRWZb8kPwmtA0yhI9T0/Vx0nuXo
         K5q9pgIGTQTjzGql7WGs0JLa560AXtyLwmMzVcGL639sdtXwAFRsyt53pJGOKzVCcfkP
         eODYTB44w81f/IvVhP8TvCP/GBwscgn110+ZrrOsbfJe7Y9UgWQGiPx38N8yHvQI3O3s
         t1LZ3+1x3YhkZsiJtt0UaNE4MHP9XsKSCgRDtgYc+nxWN7scAu15GF2QFpM58/KEcAzs
         h9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849796; x=1774454596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=;
        b=hJIY9cCcjEbPKjAuhwbjTN0l5bcP6KZU7L5+MakH8GB71UVknCn2tkpmBZpJsaI6/p
         uWJxyoNhyq8JqBOpfUE5cfOkuY5lsomIa03Z4bUAZXtaPxhw3giGXOb4sSP9XbTv/fSC
         iP/RV9fkWWgz9J45XPzbRbNb6lkBuceEwPnWDEN4+VeHiGPyXPRU0KObISg9ukQmsuPR
         oW5auQgp0syqIfLBkLRYVdtLfnmiWE9ybm18fUiX4wk4tubGjA4vb0toMexlkvUeuJ8L
         0PprOBxwdSAFNMVwuPIEcj/P9GKC8G5nts/V2PORXMr3WuP98nOTxeVvbgbXs+bAmihr
         PCVw==
X-Forwarded-Encrypted: i=1; AJvYcCWVbsQLeZ9L7sfTa660ps77gGRWplyCq2sE/PB38xAU/W0gP802YPPvgzKmSOji7EIEnwMd7Zd/6KvFPUcBdymQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzExTJBvTZCKtlOaR932r/atfi82DoKFEgwHg31sGyMI5E6H8o3
	8CKl/2xTrNhPan5NU5XLRGMmIQIZ9Y6y+K/+96lRdJVbvqNy45y/SsDY4QyBwsXQBDrsgKa3htB
	qko582xRTb50EmMyQfHMzyN1zosr8i4zRelvC/HhWCw==
X-Gm-Gg: ATEYQzyO/AxrGvjIPiV8DLjggN8DXPY7GyPl0yquk6sCWvQxey8K+RIiD+J0TtV6Ac+
	ECSxjExu7O9TgDiUWgsH7GkYqIbzAN0UEdqPwFZst7rvx2EVFkeT/+0gPrab8znq9+pTu4GQJXs
	248/wZRVr7JMxgOGNhR3n2zbMrg+DALjL2pjqF5oFbF5FSlQvKSVstFOKLDTo53aKDLPFzBu7WT
	YBjwWqZ24teSta+g1gLTtV5VuXd5yOv1u1nZYFYTHipvQwjZO/h2CussY/mZ3egkpDv5qAJprIO
	lDC2bcYQa+c+gUpKjovLO/2SbL/cbSe5rr7pbclj
X-Received: by 2002:a17:907:9811:b0:b94:24:44bb with SMTP id
 a640c23a62f3a-b97f49bd1dfmr258135566b.42.1773849796081; Wed, 18 Mar 2026
 09:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com> <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
In-Reply-To: <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 18 Mar 2026 10:03:03 -0600
X-Gm-Features: AaiRm50ET16GLgpYC6lwF0jbLmfq5CygllZIeseBjuujZbOA5MhL0hZ6kP_Zg-Y
Message-ID: <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_090318_904689_70375EAD 
X-CRM114-Status: GOOD (  38.34  )
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

On Tue, 17 Mar 2026 at 08:11, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > +struct rpmsg_gpio_info {
> > > +   struct rpmsg_device *rpdev;
> > > +   struct rpmsg_gpio_packet *reply_msg;
> > > +   struct completion cmd_complete;
> > > +   struct mutex lock;
> > > +   void **port_store;
> > > +};
> >
> > Except if I missunderstood Mathieu and Bjorn's request:
> > "reuse all the design-work done in the gpio-virtio"
> > We should find similar structures here to those defined
> > in virtio_gpio.h.
> > struct rpmsg_gpio_config {
> >       __le16 ngpio;
> >       __u8 padding[2];
> >       __le32 gpio_names_size;
> > };
> >
> > /* Virtio GPIO Request / Response */
> > struct virtio_gpio_request {
> >       __le16 type;
> >       __le16 gpio;
> >       __le32 value;
> > };
>
> The core of the issue is that Shenwei is stone walling any change
> which makes it hard to keep the legacy firmware. It is possible to use
> these structures, but it makes the extra code Shenwei needs to
> translate this protocol to the legacy protocol more difficult. It
> might need to keep state, etc.
>

I agree with everything Andrew points out above.

> Two points...
>
> The firmware implements more than GPIO. There is definitely I2C as
> well, the first version of the patch has bits of I2C code. Looking at:
>
> https://lwn.net/ml/all/20250922200413.309707-3-shenwei.wang@nxp.com/
>
> There is also RTC, and a few other things which don't directly map to
> Linux subsystems, but maybe do have Linux drivers?
>
> Give how much pushback there has been on the existing protocol for
> GPIO, it would be wise to assume that I2C, and RTC is going to get the
> same amount of pushback. If any of these three, GPIO, I2C, or RTC
> decide that only a new, clean protocol will be accepted, no legacy
> shims, the firmware has to change, breaking compatibility to legacy
> protocols, and the accepted shims become pointless Maintenance burden.
>

I have made this point clear before: modeling legacy protocols in
mainline doesn't scale.  Mainline uses a single generic protocol, and
yes, it means breaking legacy protocols.  This is the cost of moving
to a mainline kernel.  If people want to use the legacy firmware, they
must stick with a legacy kernel.

> Point two is that the customers who are pushing for these drivers to
> be added to Mainline probably know that nearly nothing gets into
> Mainline without some changes. There is some short term pain to
> swapping to Mainline because of these changes, in this case, firmware
> upgrades. But in the long run, it is worth the pain to be able to use
> Mainline. And those customers who don't want to upgrade the firmware
> can keep with the out of tree drives.
>
> So, what are our choices?
>
> 1) We accept the code as it is now, with the shim?
>

NAK

> 2) We keep pushing for the virtio protocol, with the shim?
>

NAK

> 3) We keep pushing for the virtio protocol, no shim, firmware changes
>

Nothing will get merged in the RPMSG subsystem that includes support
for the legacy protocol.  Not today, not in a month, not in 5 years.

> 4) We pause GPIO where it is today, and restart all the arguments with
>    the I2C driver. We can come back to the GPIO driver in a few months
>    time once we have a better idea how I2C is going. And maybe we also
>    need to see the watchdog driver, and argue about its protocol.
>
> I also understand ST has a generic I2C driver nearly ready, if that
> gets merged first, that probably kills the NXP I2C protocol, and maybe
> the NXP GPIO and RTC protocols.
>
> My vote is for 3. If not 3, then 4.
>

Strong vote for 3.

>      Andrew
>

