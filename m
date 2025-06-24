Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CBFC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p48sMTmP/Wq8ruqfMZ8LiS7A/PulyMV9Lx/kALaANNI=; b=kTJtV8BPWoCSocrednjsX6nWpJ
	puVSrz9lXv4hOAH+/k2ol5olidhtZkwHzzXNQJxKcySjLD7DqVuLD9FRN6QW3Nno2Lb+cihGkEeRi
	fdi9hhJRgSgMXQrQDI285eR1tqJwsyVG22hoGi8Drv3rjhquoDmTr6PfC21bVuiYJ8ah3tn6bN+tP
	5rcNGz9yFV9ESHyjhe1vuUDHScE24bBW7hCiTgx8uShpta1+JTcl1lPuAjgFNORCUUaMw+l6JS5tE
	9z2YMGVyDTkByapMk1X+oHFADq+Yg0ogO3ud7uQkDo68f5n9fLEyL4eGaVJep4F6aOSXNLWm/8b6K
	P1vl7q6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBeG-00000006vLs-1jgf;
	Tue, 24 Jun 2025 21:57:48 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9bP-00000006eQR-49Wh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 19:46:45 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-553b9eb2299so205120e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794402; x=1751399202; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p48sMTmP/Wq8ruqfMZ8LiS7A/PulyMV9Lx/kALaANNI=;
        b=u/ESwc0e/SUmPAarLuHeUAm1IWxFmZE/jXDAuwSZsOawq28XRHt/ZF3uozmckSEb2Q
         gnESqA27RgB79Ur7pWpfm9RIu+AGk8Z1I4NKd/Gbq8hAs9tSlU9sRtZhQnh+cyMiUVBr
         03Dq9YUQf7mHtOEjiEmOOeWfnhdRMv7QA5sKUi0L9z6soPUMLz82pI8Xff2QYhU6jdk6
         44FRA/9Yoi2ivzCyrx5icr061nlA2FMYUwDs5+FhkVJPJrBOmFMbFtufNVTWxPij1BVU
         9cLg6X1IOuslkXdPpgTLNgCjf+fjf7gJSF/zxQLyDNORppu9O/lQeETLrooEw/dZVa+7
         SEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794402; x=1751399202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p48sMTmP/Wq8ruqfMZ8LiS7A/PulyMV9Lx/kALaANNI=;
        b=OXwSozkJsev+cB/rP2Lfa7BEkT278C7w0Lvq71phr6/EYeYKWnyHE0htmLjtEu22al
         xdNnNlOhuGwHDASjdKA/jmm96tMbk/A62i3fps6w/rsfhofV8l1HJGHGGyXKvBANeDzc
         V27KbiJ6+e+liCdSY+YMoAo1oeZO/PPQoJ+WN6wcA0Zosv5czxUyq2Jm58Q5xWKiMsuw
         x+jBUUVtNV3XJjWD4L1i6kH/9Aq6v4P20VOwjAHzr16V86UETw3Wq74chVu/h5/GSXRK
         VoG38U+HkNGDHvp6L3Z0ksVwWfMP+IfpQApQ7tbFynonfqug+WPqlGtm2pfXJ4VsldRv
         IHyg==
X-Forwarded-Encrypted: i=1; AJvYcCVrI3UVbN05u5UQT81/e4VaVahWGwWkhdqJh4naCIICux+HRJ5rLUdXCTeQNXqtBng2HJJ9MKNtcSDrNKrmaIrG@lists.infradead.org
X-Gm-Message-State: AOJu0YxmR3JL9mk5fhSCI4igqdDhn+e44zwbTYXV95Jrp8caHqQnxO6+
	i4jhT5C/LDU/OlVQVQFA8g9t2Rog7dotR3EN9aZ5NzbnYsmEGaguT6pA1j/2/ek7IE4gl1GC34x
	rt8aShGPs/DpuE7dvLZsAjn4oNNZy9fo+WYA5Q1uyvA==
X-Gm-Gg: ASbGncvaaKL4DLW0RNx2MXdWSUNfEBbcwzhWuVhXuAItZ5eZdkLMX8EJ5ENxLjKQwd6
	H4y1zAWQv+/fRan/RtqRUCIHS81AqMlpmcboBekziaSOreOa3e8eTbHWJMwRMsF8EVd/Tki2bmk
	3lJ/cgor2JwpzTUEWxkCz+0NndqtYIVGzzQQYjkMkJ4AuiSKk4aH25OA==
X-Google-Smtp-Source: AGHT+IHdpwQMLs1O1YXsE7OYJDSqDv174xvDSUigjOl1MX3lK4+jDay8aiOLOcZL8anmxuKl33tiqVeqknlI9Y/jdlg=
X-Received: by 2002:a05:6512:1114:b0:553:cb0b:4dc7 with SMTP id
 2adb3069b0e04-554f5c85c83mr1548662e87.9.1750794402146; Tue, 24 Jun 2025
 12:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-5-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-5-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:46:31 +0200
X-Gm-Features: AX0GCFtNgkCX1W_AdlK11ZGEmJmRv7gODCrJ0s33UaorzXY8ZeRx0-2XaShZXAw
Message-ID: <CACRpkdZ0zsBCXLqdXKoY5Fyn835xqunesRLrAMxUu6ASWU7iBw@mail.gmail.com>
Subject: Re: [PATCH RFT 5/6] ARM: s3c: crag6410: use generic device properties
 for gpio-mmio
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_124644_030716_835ED7A1 
X-CRM114-Status: GOOD (  14.30  )
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

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The GPIO device in crag6410 is registered with struct bgpio_pdata passed
> as platform_data to the gpio-mmio driver. We want to remove the
> bgpio_pdata from the kernel and the gpio-mmio driver is now also able to
> get the relevant values from the software node. Set up device properties
> and switch to using platform_device_info to register the device as
> platform_add_devices() doesn't allow us to pass device properties to the
> driver model.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

