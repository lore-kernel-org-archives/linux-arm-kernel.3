Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76745C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvMGf5g2weozdIFZo63Xax4wmIQw1PPebi0s+41OCrs=; b=sEk2XXZYt36lAKVX5s75JhgKFU
	WAiGGkGWud5YRxLxIN3pcGxEQL/hR+hi6pymP7lAXXKZMzammX2WG2zlQCBiFrwkYTfbUz895Mj9N
	G/q7OZ75h+2OI3MSvLZ5pkcjIA5TFvN+ZIN7FDp9tfAjZskMQcMNHmGwKkV7C0x//LadrU0ZtGBv3
	EvYxBUK00Vac2Qm5OfTFPgtSqtf/V6qNuIUSkkeenp59nFGgdCa0n7yzB0eWtxrlYkTMITGRflxpS
	bvho/UbsQOppPjzRP1AmXcy+Ol/iEImIL/uUtQtfpAcWrmkne6BGoV2BMtwlQ/WQAuj47pyUYoaNk
	vqTXyJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGypz-000000091gz-1lG1;
	Mon, 19 May 2025 11:39:19 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGym5-000000090nu-1PPz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 11:35:18 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-476af5479feso48099951cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 04:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747654515; x=1748259315; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvMGf5g2weozdIFZo63Xax4wmIQw1PPebi0s+41OCrs=;
        b=eoCxjMW41QhOHSHIXqHmCYy8ua1rDzvc4uRNL2OSYqgDh1xxanqE1Z03rIz7AK5oS+
         knmHCgaqpM7KTSXOjdzkRRt15egSfMxpM/lJj6XiLGxIKPvuawUs1sykDWDWhwBV8DoN
         6WQNA3/O3ng27WpDghLg5AuLJcu1GWjpL5K++gK59Fxf/GI8awY117/T5guMLRgMTLpi
         dxgb4ddmuBRWifx75yXZe+2Ex2gTcXGWi57TCCq27VWf9rXY+rw3TPN0fBfuMkfkNSgt
         nZQHccR2ZjxXb5pEZH+aHL67URvQYdE1wtQ23sprbNArf1vt0dSu9dOAY2Hu3qXGQc0R
         xFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747654515; x=1748259315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvMGf5g2weozdIFZo63Xax4wmIQw1PPebi0s+41OCrs=;
        b=FQLWWvlPZpH+845+/B5+WUt7fIjS/kWrpOWaKHg0RS8IjGF0TFZKKwlCMoxEcI7eGw
         WJTSnPoHL0N1zuJnK3WnV3RLsptqp0gvoA7NNxurUMdjb2p6GZKAtGWQQWWmmbPLYNrE
         GzTc+S0va2bquQH9GdOLaJF1BeKv5Jk0fHfehf/B4hqysiVGwg6IwARLStT1UQb4X7jv
         tByKBElWpHT6EWPAfHe2tJdnTc/iebWUkpB3vrWE8Lfoe1hNfDVcxqbsGSOB7gnkXXjH
         rzOEIWJRqm1CMWWWhOAgJYIstRONyaJaj6VQZqD4/BlfpiQk8Ttj0oDti9MCtjDqBCwz
         pypw==
X-Forwarded-Encrypted: i=1; AJvYcCXEpf46ZaBRkaQspWVAkgXEfnr2Vz0cZpHH+lkJA2aHL6HDMECQW3ULMKyEaLaHkXSJZyja39Rw2GDZEBlCtd+c@lists.infradead.org
X-Gm-Message-State: AOJu0YykfZELfMhpYhTmN47E6pYXrXKu58PG42lmTeDWGVRWIuHCIFpF
	6zyHnvwd4T7O5IFA66/e0Wm3ccsoJCWT352+ZtZn6KxU3TYl1i+Jc7vwbXfKqs+7U+nOhSm3Z34
	aTfERwR+yvI7gF5r2pnt2dliC21Ge3sONXOs7
X-Gm-Gg: ASbGncuTD/5vpHAiOs3cGTJ+n2ridiRbVDvt60HHj7djGSko5R7Qmhy39HZrK/vB4pq
	u+7j8GZgORtXFkmOq3cj3Nhxfgbh2MdeTinOGiOz9Y8PWiWAc0Drvnfm/bJnFwqtS46Emi9m4CX
	dEJzAaVa7Dfj0gJAEspa15wLF0eGaQqvRlvKJWhLFssZx8cOFTvLiPdXCluuKTlkY=
X-Google-Smtp-Source: AGHT+IG8voR8X2h42Gvzm1hYVSaBNVOszaGXju3Wj3QHsFtLKDEveorvqw8YGPS+So3ZB6nWZgvBoo5R7KUB95DaVlk=
X-Received: by 2002:a05:622a:59c3:b0:476:9474:9b73 with SMTP id
 d75a77b69052e-494b0939a78mr192684461cf.42.1747654503905; Mon, 19 May 2025
 04:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250515-vt8500-timer-updates-v3-3-2197a1b062bd@gmail.com> <202505180911.hDevFA1N-lkp@intel.com>
In-Reply-To: <202505180911.hDevFA1N-lkp@intel.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 19 May 2025 15:34:59 +0400
X-Gm-Features: AX0GCFuiDlrcWsgaEaNmFJ8EIQjE8OcrTnIsT4xwkYdG39zHB1uMjrH0T6Jryxc
Message-ID: <CABjd4YwJgZiq9_jKGa70GaxaW8TT=JuwDioU6jH=J_O=t+QT8w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
To: kernel test robot <lkp@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_043517_377611_0C62E23A 
X-CRM114-Status: GOOD (  20.16  )
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

On Sun, May 18, 2025 at 5:24=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Alexey,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 92a09c47464d040866cf2b4cd052bc60555185fb]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-=
bindings-timer-via-vt8500-timer-Convert-to-YAML/20250516-025729
> base:   92a09c47464d040866cf2b4cd052bc60555185fb
> patch link:    https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3=
-3-2197a1b062bd%40gmail.com
> patch subject: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare f=
or watchdog functionality
> config: loongarch-randconfig-r123-20250517 (https://download.01.org/0day-=
ci/archive/20250518/202505180911.hDevFA1N-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20250518/202505180911=
.hDevFA1N-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505180911.hDevFA1N-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/clocksource/timer-vt8500.c:201:51: sparse: sparse: incorrect t=
ype in assignment (different address spaces) @@     expected void *platform=
_data @@     got void [noderef] __iomem *static [assigned] [toplevel] regba=
se @@
>    drivers/clocksource/timer-vt8500.c:201:51: sparse:     expected void *=
platform_data
>    drivers/clocksource/timer-vt8500.c:201:51: sparse:     got void [noder=
ef] __iomem *static [assigned] [toplevel] regbase
>
> vim +201 drivers/clocksource/timer-vt8500.c
>
>    175
>    176  /*
>    177   * This probe gets called after the timer is already up and runni=
ng. This will create
>    178   * the watchdog device as a child since the registers are shared.
>    179   */
>    180  static int vt8500_timer_probe(struct platform_device *pdev)
>    181  {
>    182          struct platform_device *vt8500_watchdog_device;
>    183          struct device *dev =3D &pdev->dev;
>    184          int ret;
>    185
>    186          if (!sys_timer_ch) {
>    187                  dev_info(dev, "Not enabling watchdog: only one ir=
q was given");
>    188                  return 0;
>    189          }
>    190
>    191          if (!regbase)
>    192                  return dev_err_probe(dev, -ENOMEM,
>    193                          "Timer not initialized, cannot create wat=
chdog");
>    194
>    195          vt8500_watchdog_device =3D platform_device_alloc("vt8500-=
wdt", -1);
>    196          if (!vt8500_watchdog_device)
>    197                  return dev_err_probe(dev, -ENOMEM,
>    198                          "Failed to allocate vt8500-wdt");
>    199
>    200          /* Pass the base address as platform data and nothing els=
e */
>  > 201          vt8500_watchdog_device->dev.platform_data =3D regbase;

Frankly, given that this driver only applies to VT8500 (which is ARM
based), the warning appears a bit overzealous. After all, on ARM MMIO
addresses are in the same physical address space as normal memory
addresses, and furthermore this platform_data is never dereferenced
directly anyway.

I could silence the warning either by more aggressive casting or by
wrapping the pointer into some struct, but both of those sound a bit
overreaching. Would appreciate guidance from the list on how to best
approach this.

Best regards,
Alexey

