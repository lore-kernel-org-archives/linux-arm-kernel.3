Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79909C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 17:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/cXnZFhK26rMDhHireAeksGXzd4YCvpdsNWOevRhCw=; b=O3UWTmzuduhDyi88vCzGCVz2US
	SNMGgdlQ9sdJhF3mar0XktaLGhOIs8UJusEZYhx2zN5GozHrlify6QHM6H7FC17FiLXVl1zWswNki
	dzORhAyfhQFXua1N3i2d39/WPRSZJdiKkUD9mtjqUxZv1f2GPyXBkDOjvAJ7oKmTlrkBbImSUDJx4
	oSSX8y3cA/HncToXKo14Sps48K0PI+3eMM3XYFiiFXPyfcu1psV5j/B0EP3jV2xj+/2uVUrKc0Pgz
	bHqjnCxbs9giM4NTFi+3GSF0KYiXtHe2rKwTbS2BwzZ9WL8R9E1pKvS6O1oplT6amxim3Vdtx4lRM
	y5QOMlpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHR0P-0000000Dhul-46KL;
	Tue, 20 May 2025 17:43:57 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQvw-0000000DhH6-1k4N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 17:39:22 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4768f90bf36so58992791cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747762758; x=1748367558; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/cXnZFhK26rMDhHireAeksGXzd4YCvpdsNWOevRhCw=;
        b=cBhMV2F0nmXn468hgeftWP0jBQIMGDaWnmRYDt2N6ngdA0g/3J1DuJO17uNHlo/4lC
         g8XFEEZIYQ+GC04mzrk7AjuiqeNyiiebuSCIKJQFAM9OdkerLHW8POKy8SsSxgCYzTr5
         ZUhf6EI/R5xVuOXxTw168RPZabL0dW9y6qipzepfYFGdoK8Rky6567fG529BQV43Oiit
         EuMB2wH1uyOm+UQnx+ErciVB+CZqyo8VzlLPZoRXa+sGyWDihaMl4TyvIgrvqz2abIk1
         m62wRSoH7j2L1WQOwLfp3QDmPy6dIo0skmRA5V4hDBJpgc9jLYdpvhpIvyQI8BVamKn4
         upyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747762758; x=1748367558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/cXnZFhK26rMDhHireAeksGXzd4YCvpdsNWOevRhCw=;
        b=vI4cPhI65X+K+9O1P9mrXH7Lb7ZQXSh+2V3B2uHbPyEKFeqYcRaRdrnXlDD4Zb7I6Q
         8WqxybLKt7XidIn7P8hCPuxrgPrs8jUYB2RumNlE2xT2T5mzmrdb3HXLghSvvMWzE5AF
         dF8hndCcHyoezjJCLIJ9S+XEJicl9eiMlaLZrIbwzjXet8gqk1Amn6IfgaY9NRtma5Ae
         qd/Sq3o2j+GeEMBoV7yQFDXuxfbfinD+9wcS8dq31SQSqkPSbt6CIpoBSoBe929xNMXx
         xoIbN55jI9JWHhB/BDtDaK9Iymrl9JQfsyU5gTxzilWgifPjLTCl36Xwm6ajgnhANcnO
         V64Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFoLvk68fz2SXUCjRMzvSF2NGxLTKftCkWpIIAuA/9dPki9bIz8/olrlaitKb1Qbo1gfAsfdENVcyn3P/U97uO@lists.infradead.org
X-Gm-Message-State: AOJu0Yww/NkkBR91A2yrYq+eTLu866tVOOmKR9RWRDvNGrCuUM4xfO2c
	XHaPhDy9YFvcUGoKBzWstZDBLoCZORAh1RkEZvBkfApA15UvXGeZSq4jnJ3BIXVLc7gsN//qKAV
	cGVQV/qtiGwHgCujPdSfUbYD3gmcNEII=
X-Gm-Gg: ASbGnct1QcpoJ0nckz02PbzLc+Oxr0nowT5ZqkThUaazLYnG2gzzb590p1EPDSHIJNP
	NOnJ/uxkM277InBCTjsVU1tdouEdHBQDoZ/1FDf7MI+aTnSWydSYMCZV/f11ebxtQionycA4PBP
	wT7KNFa46V7s1E2O8UH+SC+NhAZ2inVGZDYvX8WbgowNlTgf4H+eeSQzcXv8/6DwBpkw==
X-Google-Smtp-Source: AGHT+IGCy8Dky2uDFs544GvIZ3DEH0oxECMeS+ZNPaiNhH+aATrtk0AVPWaVxOrcPA3K24xoB0ESl3vOs26Sf6ozux0=
X-Received: by 2002:a05:622a:6202:b0:476:76df:d26d with SMTP id
 d75a77b69052e-494b074f915mr256312981cf.8.1747762758261; Tue, 20 May 2025
 10:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250515-vt8500-timer-updates-v3-3-2197a1b062bd@gmail.com>
 <202505180911.hDevFA1N-lkp@intel.com> <CABjd4YwJgZiq9_jKGa70GaxaW8TT=JuwDioU6jH=J_O=t+QT8w@mail.gmail.com>
 <f74dbbcb-1628-4280-92e8-d89823a3a318@roeck-us.net>
In-Reply-To: <f74dbbcb-1628-4280-92e8-d89823a3a318@roeck-us.net>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 20 May 2025 21:39:15 +0400
X-Gm-Features: AX0GCFu2VdGiOaPdTGNsD9E3jaLA46XfuVGvrGU1UJ1V9x-G8SIxw9EzEocSyA4
Message-ID: <CABjd4YyXwznntcLVcYL6qx16YEwv4_VWzrXrE7_QHmQxiE0pXQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel test robot <lkp@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, oe-kbuild-all@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_103920_459129_6C4F560E 
X-CRM114-Status: GOOD (  37.88  )
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

On Mon, May 19, 2025 at 5:34=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 5/19/25 04:34, Alexey Charkov wrote:
> > On Sun, May 18, 2025 at 5:24=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
> >>
> >> Hi Alexey,
> >>
> >> kernel test robot noticed the following build warnings:
> >>
> >> [auto build test WARNING on 92a09c47464d040866cf2b4cd052bc60555185fb]
> >>
> >> url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/=
dt-bindings-timer-via-vt8500-timer-Convert-to-YAML/20250516-025729
> >> base:   92a09c47464d040866cf2b4cd052bc60555185fb
> >> patch link:    https://lore.kernel.org/r/20250515-vt8500-timer-updates=
-v3-3-2197a1b062bd%40gmail.com
> >> patch subject: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepar=
e for watchdog functionality
> >> config: loongarch-randconfig-r123-20250517 (https://download.01.org/0d=
ay-ci/archive/20250518/202505180911.hDevFA1N-lkp@intel.com/config)
> >> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> >> reproduce: (https://download.01.org/0day-ci/archive/20250518/202505180=
911.hDevFA1N-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202505180911.hDevFA1N-=
lkp@intel.com/
> >>
> >> sparse warnings: (new ones prefixed by >>)
> >>>> drivers/clocksource/timer-vt8500.c:201:51: sparse: sparse: incorrect=
 type in assignment (different address spaces) @@     expected void *platfo=
rm_data @@     got void [noderef] __iomem *static [assigned] [toplevel] reg=
base @@
> >>     drivers/clocksource/timer-vt8500.c:201:51: sparse:     expected vo=
id *platform_data
> >>     drivers/clocksource/timer-vt8500.c:201:51: sparse:     got void [n=
oderef] __iomem *static [assigned] [toplevel] regbase
> >>
> >> vim +201 drivers/clocksource/timer-vt8500.c
> >>
> >>     175
> >>     176  /*
> >>     177   * This probe gets called after the timer is already up and r=
unning. This will create
> >>     178   * the watchdog device as a child since the registers are sha=
red.
> >>     179   */
> >>     180  static int vt8500_timer_probe(struct platform_device *pdev)
> >>     181  {
> >>     182          struct platform_device *vt8500_watchdog_device;
> >>     183          struct device *dev =3D &pdev->dev;
> >>     184          int ret;
> >>     185
> >>     186          if (!sys_timer_ch) {
> >>     187                  dev_info(dev, "Not enabling watchdog: only on=
e irq was given");
> >>     188                  return 0;
> >>     189          }
> >>     190
> >>     191          if (!regbase)
> >>     192                  return dev_err_probe(dev, -ENOMEM,
> >>     193                          "Timer not initialized, cannot create=
 watchdog");
> >>     194
> >>     195          vt8500_watchdog_device =3D platform_device_alloc("vt8=
500-wdt", -1);
> >>     196          if (!vt8500_watchdog_device)
> >>     197                  return dev_err_probe(dev, -ENOMEM,
> >>     198                          "Failed to allocate vt8500-wdt");
> >>     199
> >>     200          /* Pass the base address as platform data and nothing=
 else */
> >>   > 201          vt8500_watchdog_device->dev.platform_data =3D regbase=
;
> >
> > Frankly, given that this driver only applies to VT8500 (which is ARM
> > based), the warning appears a bit overzealous. After all, on ARM MMIO
> > addresses are in the same physical address space as normal memory
> > addresses, and furthermore this platform_data is never dereferenced
> > directly anyway.
>
> Guess we'll need AI compilers in the future to help them know that.
> I for my part would argue that "this warning can be ignored" is the
> source of many problems flying under the radar.
>
> >
> > I could silence the warning either by more aggressive casting or by
> > wrapping the pointer into some struct, but both of those sound a bit
> > overreaching. Would appreciate guidance from the list on how to best
> > approach this.
> >
>
> First of all, I am quite sure that using platform drivers for this is the
> wrong approach to start with. This seems to be a perfect candidate for
> an auxiliary driver.

TIL: auxiliary bus :)

Thanks for the pointer Guenter, it does indeed look like a more
appropriate choice. I'll try and port the driver to use that instead,
and resubmit.

> Second, I do consider passing an iomem pointer as platform data to be
> inherently unsafe. I would very much prefer either passing a regmap
> pointer or, if that doesn't work, a data structure.

I guess it resolves itself with the auxiliary driver approach, as I
can then just upcast the auxiliary device pointer to the parent's
enclosing private struct, which can then contain both a timer read
function and the specific pointers to the two registers the watchdog
needs. No need then for the child to do its arbitrary offsets into the
parent's iomem region - just use what's given directly. It's still
going to be iomem pointer access, but on the other hand putting a
layer of indirection (i.e. regmap) into the system timer code sounds a
bit scary to me.

Best regards,
Alexey

