Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35071C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 10:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqS8yiFvPoQH42365EOQ4XQDK7lHJ8Wg2V08GdiylrY=; b=4MmO3vlLMIOargB/5Ksz6UJ9r6
	eVjHe6OagLARPxO1bfifUVZ8wLRuXR1pVKEr6fa9k7FZm6+f0VWIgJyckGk/ixlKN5mnATNR+5fXT
	E70V6R+ntDpGzn1aGTrQlVyYuIXxedEM9wYnBC0oQwshJPKuZYPbMGNUOy6PCIoF/aNt79wad68F5
	mzBAO97amKtX+fzozEWiZLK5lh3moAoLa5xJKu8a5BUd/jaSdhtftqAoNcnH6HZ44VmzvgoPlreGr
	eBfXtb9Hpjz1egxyM2G+ZtX7lOUzrcG7BlVqF3NEkrltvf+U6TE2eOQApYai3kjhBfW2trmS96uFm
	eJIuIFCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLvN-000000025lj-1ZcF;
	Mon, 27 Jan 2025 10:00:57 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLu0-000000025Tl-2uQQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 09:59:34 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30615661f98so43764181fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 01:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737971970; x=1738576770; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqS8yiFvPoQH42365EOQ4XQDK7lHJ8Wg2V08GdiylrY=;
        b=R29CjJFdNJ/yH6bP5Are1le53wqs4sMBL61m/JfKb5rCiHdCoZZCsq4Qk7QVBj803g
         eo4HQE8QAtF+P0Ip0KHSy10Ar8Pv1ch0FW5NSjzJB+Xrlhx/xKRMC53G2//7Ev/QmjZv
         HLjhlQOsm8c3fMzmYd9EA5tkNAORBD6wcfE8F3Vv3302R1SUFgK8i0Jo6DMbdhkxUCzP
         x7d9e7JuG2E5iM/BfcMBdNGT206ZFypIYSWqIm1FU8XmQMbRBAnu18sMsTOUV2mRC1rW
         P4NXBHpZjWMtSs79BCASLVowW4r6vsaFD4hU0RNXbS2HmK2Zy7tjivU6Jiq6qnlmrSpW
         1eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737971970; x=1738576770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqS8yiFvPoQH42365EOQ4XQDK7lHJ8Wg2V08GdiylrY=;
        b=Vg5+JbNSvN+ruwDQAZTsbnuZ7kQJ7R/axIlVZ0p2V+XzgxyuUvW08OAlh0fng9eAw/
         6O8AkgeHvE0juJOUpdAucf7tBFXuQv/wqG3qh/6dr6rGgKWENWo6HwOpwS6HpI/HcCPx
         UbnnSk15RZljxNgaNRqunk6OlDqqVr/FlJmLlm6+8hxqkgQl5wrtf7YmIiEDQlIXyiwE
         ya6LUe8oPoOKOxdzfTQJHoaVE8eDjHgJ/Q/vbO5nT+zMjnjEzIbzHznOWe7ok7JUCJIV
         5udSvMaESZ7+g4MT74PwZ37pthFDPCm8i289YLlPhfNLEo+pQedzj18MpvDvA2Z1cwZh
         nxig==
X-Forwarded-Encrypted: i=1; AJvYcCUUCbypq2E/DdyFpmLlPTMMXfcazKOS9Bep3IHdZsokUIPPRif994KW9Cd2+3llisEl22FShRn6uuYg723w038m@lists.infradead.org
X-Gm-Message-State: AOJu0YxVRjWwkJV0zXxrHCAyZk8sSdzjIgN5/3YqPGPRwWS29WWC8N1r
	v8kp7WhXXDaRcnOzDDJFR3iE1UnUZX/Xe/8B4TTaOUKbgIAyystNeuuVPtvrVXvZEaThlO0rlZa
	QkAclPL1LqAmPm/oc5QAIahxio19doS/htGmVtw==
X-Gm-Gg: ASbGncsUnJI7cp3f+pCS3Yp47ov3WaQS7XGiD+ZxeGw0KyTjBHi+6BQ+LPqseCDKc5Z
	6z8oUR+aQK4dAEp0GYc/asKYIO810DloJQkXWXlA27iwxRT06tns7m0+Aus34
X-Google-Smtp-Source: AGHT+IHqpm1ys9+lwbd/QxujcbzJL4i0yKhhKzjeujkw2d5Z1I5Id1mRs2qKI/MXH9CQY+F8hE4OzkVsIK/ZHQmuZJE=
X-Received: by 2002:a05:6512:1312:b0:542:234b:9a6a with SMTP id
 2adb3069b0e04-5439c281f9amr15646461e87.33.1737971970154; Mon, 27 Jan 2025
 01:59:30 -0800 (PST)
MIME-Version: 1.0
References: <20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com> <20250122-amlogic-pinctrl-v4-3-4677b2e18ff1@amlogic.com>
In-Reply-To: <20250122-amlogic-pinctrl-v4-3-4677b2e18ff1@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Jan 2025 10:59:19 +0100
X-Gm-Features: AWEUYZlw3ilYGs0ATdzTHL2yQh4eIVQWc6_6OrIXQyU_MtlIHFv72pFxPtpk8xc
Message-ID: <CACRpkdZRbpd0Kw9V=aYX5P0vJLtErNR+aBzPagSwf=AZh6QERA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] pinctrl: Add driver support for Amlogic SoCs
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_015932_740427_49CAEF3B 
X-CRM114-Status: GOOD (  13.59  )
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

Hi Xianwei,

thanks for your patch!

On Wed, Jan 22, 2025 at 4:26=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Add a new pinctrl driver for Amlogic SoCs. All future Amlogic
> SoCs pinctrl drives use this, such A4, A5, S6, S7 etc. To support
> new Amlogic SoCs, only need to add the corresponding dts file.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  drivers/pinctrl/Kconfig           |   18 +
>  drivers/pinctrl/Makefile          |    1 +
>  drivers/pinctrl/pinctrl-amlogic.c | 1053 +++++++++++++++++++++++++++++++=
++++++

Please move this file into drivers/pinctrl/meson as I requested
earlier. We can rename "meson" to "amlogic" later if that placement
is confusing.

> +config PINCTRL_AMLOGIC

There is already PINCTRL_AMLOGIC_C3 and PINCTRL_AMLOGIC_T7
as will be very apparent when you move this driver.

What is a *proper* name for this family of SoCs?

> +MODULE_LICENSE("Dual BSD/GPL");

On the top of the file you have:
> +// SPDX-License-Identifier: GPL-2.0-only

So this does not add up. Fix one or the other.

Yours,
Linus Walleij

