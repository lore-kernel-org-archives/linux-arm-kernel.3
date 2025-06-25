Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C67C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 13:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1sh8kXgYTvfKaZBBuJeUkf6bmJ4SWj3nocH76LTnKq8=; b=LLutzKPGbsJ8G3l4RroUCP+Lhp
	vpBBTAO7nEOWfhcSA05RRb5/pRjjLR1SoNh8i5amoUat1Wk1bun2IIp3vBp8XhrrD/Mb6/0tFkl1B
	aMDXV+Af0Pto8q3XuGfCDEY+NHITRBM2FePCsNNsjsMZ2gbLYF5z3GEh1Fm5309brnwpdskMAdTz0
	Li/cNizO2LGnXsatrzOQtD9Utha59bKskUrG7REchpMOSln1hSxcIz+SXVo0X7KZ4xn6E9kEDSfbb
	7yJ+dZhNS7Gq8rACJms/t4gJPVEyg2x8PDba7ut3k3Vk0R3f2MKof6f9eIkLX2HnyMOIWCIwtedDY
	QBtiVI7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQHI-00000008pNQ-348T;
	Wed, 25 Jun 2025 13:35:04 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNHw-00000008Ibj-2tQg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:23:34 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-553e5df44f8so4872285e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847011; x=1751451811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sh8kXgYTvfKaZBBuJeUkf6bmJ4SWj3nocH76LTnKq8=;
        b=tqv7fEK0vu2m2JqmGcqTXvU7spNO5FPwKtN9L+CR+V30SyTtRnBJCildyQxiIQLC59
         NgsmwYV6efBROr4oqQIgPpW47eU0aJ8zI3L4kMxUjBnKJluBFRILGUPgXyuPWzyra+Pn
         gDyLk23dZ4eDH6ZRkCrjwrxRy+YXn2IQYOCooikseXduPp6vGrS9NV8RonZch3GcGz5B
         pc3BtSQaZv8xpTX3DfRx3dpwnp7cKTHgyNVBYYM+Cd42JNXLt096BbCh9C9GYYxzhA+f
         HvIXid+bQx4zPNzYeTZvzV/zrkh8UV7SfgaSqycOjjyenrU3mHB1pDn3tcnXAfHudJ9V
         /+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847011; x=1751451811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sh8kXgYTvfKaZBBuJeUkf6bmJ4SWj3nocH76LTnKq8=;
        b=OQrsl+rGqOU7qHC8YBy/78EomyInXw8AYRdyfdh47BSFDnYsTMXdCnMiipg5aXrQ/d
         8gfK+R/+1yuUu16Ah5Jx58JKRZM3o86ywE4SfsF/CrAOJ1mnDEgaQ83JWXY8Tj96Funs
         QWHndErplBsXAa6IBVWbsoHKth3I83DU/SMtEMrwBaSx3kEhQaZzlXUG1ncxwu0kyXQN
         vZvK4+8CE8+kzAWlzb+LINZHoo3J4ThlJOCC/7CbdhJ0tI/TxrG5KOoAvHkShMFvIHaz
         PpAKA6lkl7JWwbbYpa7HdWXn+oZ6SUjXa1kZhdhFGLBeR9v9KOVDbSQR7XANrJCzzNYK
         MYpw==
X-Forwarded-Encrypted: i=1; AJvYcCUXR/DdB9SylSQtRCP1WvdZk+jSUX10WrmHDs0TT3uMHQCQyARa11J/OziyEYVfbSVX+LoMo/4wXYoggbZPwOZv@lists.infradead.org
X-Gm-Message-State: AOJu0YzWKmmSFChuaTFJaTMuRK0bIwXa9lrPNJVor+L6hFwDghScr673
	ta51KCe+Gyzn9VDrFi0+8wyI/6bUy/YPC7Ub10vrmVkW/ZjrZ7L/4YaLjkVLmylJBEHhBd+LAB8
	r+vbmb617bXjkDKJSdrwL8yj4oVUggnlnWN5GBuUHkQ==
X-Gm-Gg: ASbGncsrtrtA0r61EBuYsf6GQvdBN+ics2WBhaunsURQVbegQgIN0fDxX7Nd9JkyVgS
	5KICMGPRLEpkg5UfWW/ASSCc2XRfO+nPpMb621NyclISvDl9yavgiQYzHwzz1V1e8OwyFYiWp73
	PsTh7+6Wszuma04EptH71LzrKwvV6jznZxlXWcQ0VfxKti2I4YUM0iDch8+2Z+trzWQzYqJX/HZ
	I7Q0l1+JH1E2g==
X-Google-Smtp-Source: AGHT+IFsA01oZJysyFytGEZV1KUrxfeUbLuJrVHSkxducs0fyVngJr8hucT3oo65yMfEXJOqTlQNr2rbLXOC/gXoNDY=
X-Received: by 2002:a05:6512:3d21:b0:553:65bc:4231 with SMTP id
 2adb3069b0e04-554fdce2db8mr788175e87.21.1750847010701; Wed, 25 Jun 2025
 03:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org> <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
 <CACMJSestPPEvsUrWaqz7yZ8OxZTMEOBY7htE7c8BV-VBumj1Lw@mail.gmail.com> <6c64751d-67f6-4c30-a312-af289d9f432e@kernel.org>
In-Reply-To: <6c64751d-67f6-4c30-a312-af289d9f432e@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:23:19 +0200
X-Gm-Features: AX0GCFuLFVrQAKskpbSfd1dqDb1DXrhBttUu-cs1kru6ZNBZYnVnFCLPa9cHjd8
Message-ID: <CAMRc=MdEZkjoDR83JFg5OPP07_DkAfeZixN9C+uxhkqkxaKypg@mail.gmail.com>
Subject: Re: [PATCH RFT 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_032332_837621_9DF980F2 
X-CRM114-Status: GOOD (  30.16  )
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

On Wed, Jun 25, 2025 at 10:54=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 25/06/2025 09:35, Bartosz Golaszewski wrote:
> > On Tue, 24 Jun 2025 at 21:44, Linus Walleij <linus.walleij@linaro.org> =
wrote:
> >>
> >> On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> >>
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> Ahead of removing struct bgpio_pdata support from the gpio-mmio gener=
ic
> >>> module, let's add support for getting the relevant values from generi=
c
> >>> device properties. "label" is a semi-standardized property in some GP=
IO
> >>> drivers so let's go with it. There's no standard "base" property, so
> >>> let's use the name "gpio-mmio,base" to tie it to this driver
> >>> specifically. The number of GPIOs will be retrieved using
> >>> gpiochip_get_ngpios() so there's no need to look it up in the softwar=
e
> >>> node.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>
> >> This works for me.
> >> I wouldn't be stoked to see device trees abusing the "gpio-mmio,base"
> >> property all of a sudden just because it now exists as a device
> >> property though... I kind of wish we had a way to opt out of exposing
> >> this to all the sub-property paths. But it seems tiresome, so:
> >>
> >> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>
> >> Yours,
> >> Linus Walleij
> >
> > That's not a problem - this property is not in any DT bindings and as
> > such is not an allowed property in DT sources. For out-of-tree DTs? We
> > don't care about those.
> That's not true, we do care about implied ABI. Try changing/breaking
> this later, when users complain their out of tree DTS is affected, and
> explaining this all to Greg.
>

Wait, seriously? I thought that the upstream bindings are the source
of truth for device-tree sources...

> Rob was/is working on tools checking this for such implied ABI, I think.
> For of_xxx() calls it is obvious, for device_xxx() or fwnode_xxx() it is
> not, therefore please add a comment that this is not allowed to be used
> by Devicetree platforms (or that this is only for
> ACPI/platform_data/whatever). I don't have any other guideline/solution
> other than a comment.
>

Ok.

Bart

