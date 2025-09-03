Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C98BCA1018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjKN0U25Br3FtvU+oCN6aTZaMOV6BZcMe11X4TvFP/M=; b=mvZIwF8JgIkDut5MEmhdlBS0aF
	EaEtFu1ejz42r7Sf4zFdHM/k+C1Ag0NUhhI2xM/2iyBMlE6X1j2ntq2VNuo8sTxZu0H8HNVrIqssc
	M5EA80WGs/n6PnJ2E9F9+nLaSE/2hfczpLcDP+GsL+jTEE3+gRdewPwpnSbDvxO9E2gCwDVGAeAYo
	pxQdn7cR9H89LtYuftxzvvP1b/D15/mbFwa3S/nxv5Kmh7lhndIy5R14aGpp8lMxhZYmFSR++8mNU
	2+/KLs5gMu+zj4/m6f0zi0kuvrUQut1HXBywMbdk1jdex+U9jX4UJG2W2uSrHad7XWh8JPHADJz58
	fS7qEwRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uturi-00000007dQv-1E4P;
	Wed, 03 Sep 2025 21:18:02 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utq8K-000000071Re-1ulj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 16:14:53 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55f72452a8eso5000772e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 09:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756916091; x=1757520891; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjKN0U25Br3FtvU+oCN6aTZaMOV6BZcMe11X4TvFP/M=;
        b=oEfSGN/uCnxnp56xgy9ulj3SUSG4JzpmyrWxszlh5ZQNIiOcgtVMQDlAvl9Ll0hMQE
         WGe8sgqbmQ3VyEr8q12qV5s4kTL6vovb+8rfyBDYWksVFc9QwdMQ99NdHjUOQuFodfdZ
         oCr+wATnG6yL5zHS+4FKvm9kc4jphfd3kAY/ReJMsDfAbm0d3dhjvZHrImxLvuBY/cYs
         nRXuM3eich4FMCDm5gOREc7BGMQYjbIEXgos2V07LJJojCihm0dMu6KaVyxrpOfTrrSt
         7zUUySF2JIVAEwd43PuHzLGImzQAmDnXbWMn+gs2s6JR9Fjwly1YN+sn1TCcY/opD7S3
         +/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916091; x=1757520891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjKN0U25Br3FtvU+oCN6aTZaMOV6BZcMe11X4TvFP/M=;
        b=WD6x3cfWUy3nQIzSrtHFeZQKqRsz8iw/P7ITZNJRUYM+9fZKbhK7z/PZsmB2PJS4DL
         V3k0GTTChexLe10gFNSjtwwafNhWMzctNznZkdyVUpd/jVjgmE9pg+ERXW8p4Kxkevua
         ib9uIRtHIB6SxkYISNieYwVfejjnqgUUTBppeVnJ0t+eqKPciXBQrq2yeHtzkB9znhIZ
         KSTjGnjC4N2aKy3e4HcdjmQ7K2hmtKGx/tzLptSVRj89EYZM5cFu1KtxfmJRNi1VN1oh
         lBGxIjbhENrt8lKyC9LP4ZEa1ZXAhYjDfpz9YgW9tuXIhzTFO7eB3mdKiaNlYDXwX1n2
         +lNA==
X-Forwarded-Encrypted: i=1; AJvYcCVoXpWox4GRvB60wiQyWboT8pKrDxGkIccTPl5xS5TuQ0dKD7wmP+pfcywlJlHTKcWppWylOKVO9yw54yiEqH6l@lists.infradead.org
X-Gm-Message-State: AOJu0YyU8QE4050qvzzvIw44w1VidnvFFV0a3YbZv3XyKhSW+TbeKh2F
	qQAXr9U7Vj2BCYw+3nCLN+2xCb5R+bF0YVPLBmnyPWNqPWcD6N0PRXKO5PONsOIyM+EjjyKQpOd
	C1J3lCYxzn78Te/8F7ebODz9diK+RZs5Kp2RSB2SSWg==
X-Gm-Gg: ASbGncsAJkw16KWMWYNWRWkt+kzGIGnZ4X7boVxrAW516IvkLdIkQk+PwJS5KI1dWAz
	YtfLHfI8JQ9MLZxwO3lFbftBi1eZ2QsZi1N0piylw4dc5ddBcxxwW7iVN4n7Rx7Fd9+Xlj0G9Qa
	qFemlyowe+PVmWHa7R7xzZxiCgYoguwZ1KWIpethPrRjoQrPg2zzJe+YURiLaFJ4NQmvI9cMoIV
	IzVMFQwOHGRSGIriEhUaMxccfKlXneG3PikyVLj9Z/v/nyDTw==
X-Google-Smtp-Source: AGHT+IEYSoT9PG8aDYwGOjTAyyVLf8UrHyR2tnQVPp7h/U/Zc10Xoq9OuXixYnOi9MZP7jxzk7HWZjPy8zIrFh00r+8=
X-Received: by 2002:a19:6b18:0:b0:560:827f:9ff4 with SMTP id
 2adb3069b0e04-560827fa6eamr2023502e87.27.1756916090513; Wed, 03 Sep 2025
 09:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
 <20250825-gpio-mmio-gpio-conv-v1-7-356b4b1d5110@linaro.org>
 <aLhie72v1T9Bw1vx@black.igk.intel.com> <aLhjOAttpdT--tW7@black.igk.intel.com>
In-Reply-To: <aLhjOAttpdT--tW7@black.igk.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 18:14:39 +0200
X-Gm-Features: Ac12FXxw2HgYwqaw48OzmEBdzdirvLd_j34-_oFlC6LOY6De-1zKdNxJynwFI20
Message-ID: <CAMRc=McKc9PR-gDs5PtLJaibouwjm96Fiy37s_DC7_f_pdebpg@mail.gmail.com>
Subject: Re: [PATCH RESEND 07/14] gpio: ts4800: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_091452_497013_56060840 
X-CRM114-Status: GOOD (  22.22  )
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

On Wed, Sep 3, 2025 at 5:48=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Sep 03, 2025 at 05:44:59PM +0200, Andy Shevchenko wrote:
> > On Mon, Aug 25, 2025 at 11:48:48AM +0200, Bartosz Golaszewski wrote:
> > >
> > > Convert the driver to using the new generic GPIO chip interfaces from
> > > linux/gpio/generic.h.
>
> ...
>
> > > +   config =3D (typeof(config)){
> >
> > First of all, what's wrong with the pattern used in the kernel when we
> > explicitly show the compound literal? Also we put a space before {.
> >
> > > +           .dev =3D dev,
> > > +           .sz =3D 2,
> > > +           .dat =3D base_addr + INPUT_REG_OFFSET,
> > > +           .set =3D base_addr + OUTPUT_REG_OFFSET,
> > > +           .dirout =3D base_addr + DIRECTION_REG_OFFSET,
> > > +   };
> > > +
> > > +   retval =3D gpio_generic_chip_init(chip, &config);
> > >     if (retval)
> > > -           return dev_err_probe(dev, retval, "bgpio_init failed\n");
> > > +           return dev_err_probe(dev, retval,
> > > +                                "failed to initialize the generic GP=
IO chip\n");
> >
> > Second, can't it all be hidden in the GPIOLIB just by passing the point=
er to
> > the above initialised structure? Yes, it will take a pointer space in G=
PIO chip
> > for all, but I think it will reduce the burden.
>
> Okay, it seems the motivation is to make it in align with, e.g., gpio-reg=
map.
> But why not simply convert the drivers to use gpio-regmap instead?
>

Because the goal of this rework is removing the gpio-mmio fields out
of struct gpio_chip and also I can't test this conversion
functionally. Out of scope basically. But if you want to do the
conversion, I'm absolutely open to it. :)

Bart

