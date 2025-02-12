Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3291C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZuDBz/MQSCI0W6Y1MIlb4k+WX79YX+OdPUXe7FESaI=; b=1M5AxUVQ9KhBGc+5u3pEPUoamO
	1xa7nW8KEA+OKi8Iwy72sXb202Qag3b/ppdLzDNLX0yk4lK74KVZY+AOB/fH5q2clvdHY+H/Q80lt
	3kyC9cEJLmTBs5mU9FXWmrBsP8YEeiVGyxp/hCYmNZN9X+zXP/M5aNyV6OJRFvOlvqn34SPhWHbIo
	k7xQpNi33HTi5uV//qlkJtOmlREl1bmDDX/OTFwyxPRD/dxHrWmMKdv6ioRkxEWzMSaMRpWX3BBy+
	jqww04SdTl0sGnv6QtlymAMaWEsjuSOaZbGUGuIXtKkuWzFuST7Pm3rPSBcnR3CgMYmF0p/pgOwfL
	2KBVV/iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGG7-00000008EQe-1d4b;
	Wed, 12 Feb 2025 17:10:47 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFay-000000084p3-2dW0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 16:28:18 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5439a6179a7so1078961e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 08:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739377694; x=1739982494; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZuDBz/MQSCI0W6Y1MIlb4k+WX79YX+OdPUXe7FESaI=;
        b=dw64U7QfNIvXitJ2FAINgA2TOD9iQMWA++ksKs9oFqJQGMR88HUhMmh/9/gWkC4BqH
         HxtDklKVFPxaE6E+kLl93T1s7t5Sf8eS0ujJejGTTqsoGnrGXh/MOmByVN6zxK4Q33/F
         vtH2Cs0dXKfUeGcGSlOlAovm3Bk0yt2ImrVRl1Z41fp55r63X/ZlCheoKJKuuqpOuUd/
         2vWO7Ayk4pZbkyp+rAPxQXI04SJ7eSA2dCIXMeXsRBifF2dZG80ZuK6Q9ubp06HTjWra
         NbDcHU4nvV42cHQ4JE6+1z7lz7MQRCOKNWviaQya++unfk+5RE6eR6xwgaLrqDfDYPLE
         ovmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739377694; x=1739982494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZuDBz/MQSCI0W6Y1MIlb4k+WX79YX+OdPUXe7FESaI=;
        b=EspZtapYxHYSk7mpJOLyN+ibkfaKBynDLdxtp9qx+qhGV7jGbkXoCdtfxZPiTuj3Gl
         MtvILSqBHsoUyM5xzC1jR1Ls/5SB2JZl8A15h44df6gO2jSmlbJv/ion2NGQDRJlsACZ
         iI6tOU2gF48ppaI5wXxsdNAKoKHc5uRGsRkjYpKorCq2nyb0NvL3oq87dloiMoxVUUm+
         J0PR0sLvnpBWBEdB3ozzn5ZHTOtNRtyqtkRCTbv7oh145vXgX7RudThsDPY/44OAyqN2
         OTpYYfiyt9EHilSHxhFHSlwG3+CFmtQL414wZdiWe9JNI65QsnPWaMkfocriVIbXiE+t
         7FlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPLCJ8GtALnw3USs+yUU6B6X3hZw1ZUMGZGXZi1sVXw2SNXA5e+WqS47CTukWYiYbKrMvQ79iq0P3r/GmkTOBw@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyp0CgO2+xmNgACOD/gD8A3O9kciXX6tZMApEllhgRmH4kpmpf
	b3kIkfbe5ebpAxPeBbnEEiELuQ3U3dGqgOOgF7VPIDhjQGFalyjkBmXnUv15kTMRCal3toDXKFT
	VjEI0R6VVTYDjQ/2m9i55sWOS2XHLZ3UQdn5bfw==
X-Gm-Gg: ASbGnctzECOhx7D9SaO/fqnZE3P6YO5vVaKFyLB8hcGsL1cfXaEQUedIN7n8a2cOIr6
	eyGVvl1EZCTNMSRLbMnrJn54bToMH2ktBveqSsbVkJOauofK7wZNnjIyP2bsnHuO8VtFD89ZHlS
	0hoP7OM2xAvPJx9riNoHDPQNTxlUq7
X-Google-Smtp-Source: AGHT+IHxOU7el76O6ARJgH/qSyoLSVZhpVM8aMA7Z5L0zSG1UJuAQdeZ/CLEIaRjM80ZHRoBtF9ivf8u/8H5ppM7Ojg=
X-Received: by 2002:ac2:4886:0:b0:545:16a8:6a5d with SMTP id
 2adb3069b0e04-54516a86b7amr1230558e87.2.1739377693855; Wed, 12 Feb 2025
 08:28:13 -0800 (PST)
MIME-Version: 1.0
References: <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
 <20250212-kernel-upstreaming-add_gpio_support-v1-5-080e724a21f3@blaize.com>
 <9442a87b-ab61-40e3-bbf0-caae87c5731a@kernel.org> <259dd121-8c49-44f7-b8f6-e0b68ab88304@blaize.com>
In-Reply-To: <259dd121-8c49-44f7-b8f6-e0b68ab88304@blaize.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Feb 2025 17:28:03 +0100
X-Gm-Features: AWEUYZkIVdRopbQJY-FCVehpC4ahYO-92VDY2yMNzSqT804kqps9s9wQ30KQZw8
Message-ID: <CAMRc=MehUWAsBO6YWvwOsexu0yj6S5-g_ydS8tdX12iA0KER=g@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: defconfig: Add VeriSilicon GPIO driver
To: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matthew.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_082816_925855_A3C86304 
X-CRM114-Status: GOOD (  19.24  )
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

On Wed, Feb 12, 2025 at 5:20=E2=80=AFPM Nikolaos Pasaloukos
<nikolaos.pasaloukos@blaize.com> wrote:
>
> On 12/02/2025 15:25, Krzysztof Kozlowski wrote:
>
> > On 12/02/2025 14:46, Nikolaos Pasaloukos wrote:
> >> Add support for VeriSilicon GPIO controller.
> > You enable not add support, but still the main question is: Why? Which
> > devices needs it? Why this cannot be a module?
>
> Hi Krzysztof,
>
> Thank you for your fast review and apologies for the typo. I forgot to
> mention on the commit message but I have mentioned in the cover letter
> that the driver is needed for the Blaize BLZP1600 CB2 board which is
> already supported on v6.14. I will fix the commit message on V2.
>
> This driver enables support (controls) for multiple peripherals on
> the board, like Ethernet for NFS boot, SD and eMMC to load modules from
> these media. Without this driver build in the kernel, it will be hard to
> mount a filesystem and load modules.
>

That's alright but typically you'd want to have something like:

default y if ARCH_BLAIZE

in the driver's Kconfig entry.

Bart

