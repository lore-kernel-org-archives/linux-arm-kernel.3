Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14F9112588E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=; b=izoGgDK5kZSbtG140ZUVYuLlHn
	cm96TWFUzrRv2zBa/VF7LGAFgtrAa7YWlw7TED3CmK1mf16Eyr0M9VZqxQov1OBkxKPrAYBoUHvGY
	XQl1CIeLdcOHnPw0qYNcfPuZHxgYhO7qi1iVvGFms8sjLq8PjqhNBdinfUjSTswdkQ6xL2Eds42z/
	PM52dTzkd6/3Dn6o3KjSZBl4tYrJpYKPAnOEsPq5h2Fr7Xh3Wqd0qBfhSKgRcpprC1g0PvPaQTbOp
	aO5vSKuVWCdb8PeBeJphRQ4k2xcZhabCzpYHxlgwLxmUjDoW2dDtuhPkGzOOqKdLVddSjQMRoW0Qh
	X6xa2NSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Pxn-0000000CS8c-0IVF;
	Wed, 11 Mar 2026 20:15:27 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Pxk-0000000CS7z-1GWw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 20:15:25 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so28275366b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 13:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773260121; cv=none;
        d=google.com; s=arc-20240605;
        b=dfeEaxOt7lKetqZLCzIL1Y2AZ0dlIsv0ewVCZvsUcxDGWaH1Upk00DX/WdkWs9uufo
         nFY38GixNTr+0IfJ496WM4Yy6WUMIO963e/WtwtzfitxXl4lOeFbg/yijQnUHTC0uH9b
         vThOVwfbt32pYUPUe4dNVp9p4EzwBDx5cKma4ph/JzSOyEGrR9eTtomAuoAhPjyLHhl7
         sqo7/ZF5YmKxP3O83f+WuQ8q0uTnjFFa0RpDSPjesEx3/JND0KvxWz7ZQnnqVoHAo5zH
         jdzf7Q3HvM990Nt91+9GJwT04ymrCS+1kIthTyFBNcAhvT+dYm1Cbd7bQl3oCzkI/0N2
         b5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=;
        fh=VI1gfXwFMHwuCNj6sWI16H1OSkNKz/vC1FxqLGV7g9M=;
        b=ZZDVsTUVqnPCbkAN0r1EGJDz9UUlRFfQ8EN9NhDLxc7PwSP4pbGdJ2f4VO7pcoqj5z
         CU4tU89+SP5hCCWg7uhnyM71eUh6RspStcIOoL/Tg3aVObhqjJepjZfOaiWK8M5oP5iJ
         euYJNFkbwk6VZcjJcgl/ZcOakFsDmKeQ48TFL6hvlOMt/PcEnjZOYcTH6jsrOMwVnGNF
         g/NXGj5M/SNSUQAFgXQ1EL6QW+KlVPwCOErvghxTnKJwOb2YkKb5v3IObhMDSsVUUnIf
         4iazHc1tBUyJDLX6t83bsCpkcmF56aaQHFdWh+u6+N/8m3bmjQjTLkCgx9yy68zUebhx
         RAYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773260121; x=1773864921; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=;
        b=TTw8AOUJFN0n+f23ObRMmU4/cBUhNjD4i6jA5PxdKBOgaC0mv3TG+2ng8/tJ/L393x
         e5xZqSUM+owYf6/z6gerBUDUDAAd9O3i8ERcIbljFo6txnQ8hYYflJPa3O2slqaQeLwI
         dOctzXvTfBhx19w/pzZOxXi2a7XSH6C+g7FNIMKrXswidjfzrfHHjr+yjxQd+eeUozy/
         orkLJpq+K1Kvl9CfdmpNnmjoqsA9zdZIS+RdFKhStM11gwuuOIudVCub8vdQMalPQd/z
         XSVa6KHJlqU/XyriKQOMxc+QoMbWE/gj9vTu/Nj3vUivcffRBtRrcFNMWw+GJd+MACnW
         TLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773260121; x=1773864921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=;
        b=HG9GWsGkcpeHurQ8skIRRFrrfMoWprfVk6KpEga0Fy/E/JL3QRsVzKzLVOa3Sp1Bxs
         soAxR7gP3oz6zZVFbC5f2Z28yLv5RwUAXNghJ31wVYdbKQ+5HfoV0Z3l5C4qTqn4XSaS
         adGM6R44WqCsBu/e2vhHN2VaGZCjNlXi+wQsK9jnHZe1T6deiqcCBjByUrTZq3bMSrhb
         Rgi+Dz/EEsNnlzRu/PkdJhPNUkuD9SXDdWjvRn2EwdEsjGRRewhp6//IurY8mFFdLsiq
         r9Z29Hpu0zo/Jv38uVrt5Xen8fN4q0ig06dR23HNHvId1Wu2Wnq5zASjKBGaBlqw8cJJ
         Ofog==
X-Forwarded-Encrypted: i=1; AJvYcCVDRrBoEVBtqEakTcj6oAiwxmKdn7CuVw3sKLLysy9mP2iZzpCab/wIcxXjSokIXEL0aruaIfmbsf+FYsFdk5yd@lists.infradead.org
X-Gm-Message-State: AOJu0YzNDylNxxUwAsM1aeFOcjXoBk9p8e8UmrCn25JlPUrTZtcPMJRC
	Q6G9Q4xvhVpRANAPhIqVEoMSTJehSgeLEXMYqLOtexMoKmSKrcyMZAlRkmTEbKv4RLqUcCjGwf/
	Je60rp0T0MK8xCL7QXFVEuwtBQjWcqxk=
X-Gm-Gg: ATEYQzykUdO78KjbSCykb66oPfhnXkvHh3U2UWzodxzTFHCjvyRNex3upE/FrbFeBV+
	tDg3xvyePxKm8GuWf/PI8CvLuv8aUxA0XwCsFEFL2knEKjTufR3g/hEGnjhICtaut0d/HesEpYA
	A+TNASIJicz29030FviPXbFuCImVgVqjFnnHzemmjpa84czJv2P4ytApBMKTmaVRHSHFDia2rfs
	zKaG6B7iLd9pIEhc/qHlmR5eMLeeTuEOb24v9z8pA2u8GdtWApvCCThmUHW5Iw4Oln09dza3jAi
	GaaGboi+pbU+DwNz9jy3BSX0MWIv9z3+9HpCd7/Q2lds7M5vN7xpxyfnQDiAGO0jIZst2Hyj1Nq
	Z1p97N3ZC3XQIcOxw0A==
X-Received: by 2002:a17:907:fd17:b0:b94:1df4:3525 with SMTP id
 a640c23a62f3a-b972e20f6c9mr213172366b.1.1773260120699; Wed, 11 Mar 2026
 13:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org> <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
In-Reply-To: <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 11 Mar 2026 22:14:43 +0200
X-Gm-Features: AaiRm50gZlAiM-5_F_zUlx0D2HjCtugUtf3WuAOsTMIp9Wv8sMtNxrZngwvWk-o
Message-ID: <CAHp75VevThmDMm6VoVB9P0YbUGGGsmgnzr2gn9=1xtJZt-kuQw@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO support
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_131524_364385_3CAC6D38 
X-CRM114-Status: GOOD (  18.00  )
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

On Wed, Mar 11, 2026 at 8:38=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
> On 12/11/2025 13:55, Bartosz Golaszewski wrote:

...

> On Tegra234, the main gpio controller has a total of 164 GPIOs (see
> the tegra234_main_ports in drivers/gpio/gpio-tegra186.c). The GPIOs
> are assigned a index by the kernel from 0-163, but these GPIOs are
> not contiguous with respect to the device-tree specifier.

If I may ask...

Why? Is it sparse because there are pads that can't be used as GPIOs?

> For example, in device-tree, if I have a shared-gpio with the
> following specifier ...
>
>   gpios =3D <&gpio TEGRA234_MAIN_GPIO(AF, 1) GPIO_ACTIVE_LOW>;
>
> The macro TEGRA234_MAIN_GPIO(AF, 1) evaluates to (23 * 8) + 1 =3D 185.

To me it sounds like a bad design of the driver for this SoC/platform.

> This is greater than 164 and this is causing the above crash because
> 'entry->offset' in gpio_device_setup_shared() is greater than
> 'gdev->ngpio' and this causes us to access invalid memory.
>
> This is what I have been able to determine so far and wanted to get
> your inputs.


--=20
With Best Regards,
Andy Shevchenko

