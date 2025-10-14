Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABDECCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 10:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGzolF9q1IpbbklG5j2EadJMhIpSSosnmlJzCW1vwdk=; b=G0CzaGpo5CYZv7li0gqcvqSwxg
	bM1s7t85iqMQ6GYhYvAsoZwfXKHU1IA8VwMYKaXdNBNqpxnQcjznLiAGqcw1ts5jtPMHoH9qMJFZN
	smw1AUaK+OXXRnPBd6OMEqSr3IVWUSEk2w/PkBdw2/sSjeD9/zN3K29VsKV5qEoMkl0TEhedKW9la
	2Iu/gecXoCLkYLPubELRgSNxt4iSeZqSbKg3SXhK8kYVOAxAR0KTldptdsHYeBP6deKi322Y0Pg1X
	PmZqpufFGOE1RLL0gkc7X/SXu91GbwKw2bXSDCzq0IgUkHXHkypJ4yz2G9VTpUuYxwcZa0GEKkrV/
	wBQFMhPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8cif-0000000FyVQ-47bt;
	Tue, 14 Oct 2025 10:57:29 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8cie-0000000FyTy-0hg9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 10:57:29 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-7815092cd22so4160657b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 03:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760439447; x=1761044247; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGzolF9q1IpbbklG5j2EadJMhIpSSosnmlJzCW1vwdk=;
        b=SXarK4YEDNwsjWMiwmjGIaO3A1rWEiK3iwfa36hSczRXECIDKmMq83eW5gerxeo5Y5
         ISv6z4cNEoudw3Lt/yXzf2ux2GCt89BmPOb14I/aWgrr0SFeLUg/xpOcV03CsuzdXzuj
         AfyuEGOZBJW3WoJtmB1krQkU3vQX03X0DkyfjcL7vK8bBzpFUwvOsWp8TWgDzDRqUYUd
         Vx1W+n/b1zzKZ5J4oxV1Q1fev6VKOc6BPm8eTYHjNu1PK0bYsvYwyiO6wJiC15GDV2t/
         rUPpWDXxVye1gTJ3/F/y0LScozb+caWi0ReEUwpY97fH2EBdj39HAPb8zImr6S7Rkkrh
         X0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760439447; x=1761044247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGzolF9q1IpbbklG5j2EadJMhIpSSosnmlJzCW1vwdk=;
        b=B8wqJ7H0ILitAHTCguf3oaBPAaTUI/sFzhrOjSDBHNTdi6pIRMAVEcl22BgYbYx2l1
         k+yAKP7cj2zi2M6kEw8Cf8rdGwsradZBU02qhViwY6qytms20sLBe6wn9AhRWOALVOPg
         MnwSFA88/51eSpZZFX/yppbt/Cz+Ku6+m+lyZjj7p+O57Ni6AL5j/3WsvRtLoQ/k+X0E
         aOgFb2VI06j/nEsYYXlTCpK4fs6OlCCCW611Tj9ga8L1Td7GIxmmj+zIPOqcy67U7x7a
         erHUAz7JGaE1Scie4tlmH9pR5DaaWhv3+PFTXtcmjdgdBQrF7LaRZgF7B42hh9CoL04Q
         f4pw==
X-Forwarded-Encrypted: i=1; AJvYcCXZGCsShJ9daByd6b87tkO3J30c2R9r7sLSo9BeJC5O9KtJjob7/xMlsjEQhRDLxKHNwj/Kd6jPUrtEQzyWGBd/@lists.infradead.org
X-Gm-Message-State: AOJu0YwBMhcN6jpNQCjBz6f/CS82pULGhcVVfXa0m0N89sB8VVHsbuM1
	F1dCCNonIdgGZUXS58kLL0CwPwabjeEtiErOwjLz+BXXp1VnWq6RdB/kD8b9LqUi4FTEN5Bmjvl
	KbRzbtqFGKzN/xlx1hmRIlMXoch+KZ9/bfM2kvac6vw==
X-Gm-Gg: ASbGncs78cWVrvcl/4O9gZYKwLP/w2dIBWIsQ/KlknlM1ttdiKsuH0vjKeMa0J7ZTFY
	zAZ/UlGWiMx8CqDfGMI85qfeY+ENvgxjbZF9Id+xxah9nmvVvvexi2JSPDyPe5OyFu47AxIHR5E
	wSOmil/nYmstS40uimtT/RRGbXmMp2PzX2dTCCtM+Y4vi9YdpyVslJ5nTIHx2fH36e9ebbM+Fhp
	kYR5jElyzueB9fXcZ/fnStRz1phrhAVEvnZBtip
X-Google-Smtp-Source: AGHT+IEgeGSPp5tZrYwz7LuhOGgC2QQoV6jKld35rrrEDILk6KVu5XlJczlMevH7xUUTupvZG733g6Xg/DOqB7cpoSI=
X-Received: by 2002:a53:d649:0:b0:636:d3f9:6418 with SMTP id
 956f58d0204a3-63ccb864da8mr16445847d50.22.1760439446953; Tue, 14 Oct 2025
 03:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251014015712.2922237-1-gary.yang@cixtech.com> <20251014015712.2922237-3-gary.yang@cixtech.com>
In-Reply-To: <20251014015712.2922237-3-gary.yang@cixtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 12:57:11 +0200
X-Gm-Features: AS18NWAM1tuEn3mlDY7wbHC5_VT-EX1J8T4IWs4ITMBNmXaEI1pGIgOsxThjx3c
Message-ID: <CACRpkdaXW-BFM=HvqLiSY-Mkmhso2ETmkZzOX328aSadUEBdSQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] pinctrl: cix: Add pin-controller support for sky1
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_035728_220272_83D85514 
X-CRM114-Status: GOOD (  18.29  )
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

Hi Gary,

this looks very nice, as long as we finish the bindings we can
soon merge this I hope.

Some small comments!

On Tue, Oct 14, 2025 at 3:57=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:


> There are two pin-controllers on Cix Sky1 platform.
> one is used under S0 state, the other is used under S0 and S5 state.
>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
(...)

> +config PINCTRL_SKY1
> +       tristate "Cix Sky1 pinctrl driver"
> +       depends on ARCH_CIX

Maybe depends on ARCH_CIX || COMPILE_TEST so we
get some compile testing in the test farms and also a test
on the rest of the dependencies.

(Makes the bots complain so we can fix all such things!)

> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_address.h>
> +#include <linux/pinctrl/machine.h>

Do you really need <linux/pinctrl/machine.h>?

Another thing you might want to consider is whether the
designware GPIO will use this pin controller as
"back-end" for the GPIOs using gpio-ranges in the
GPIO controller nodes, for example (I just made this up):

gpio-ranges =3D <&pinctrl1 0 20 10>, <&pinctrl2 10 50 20>;

Then you might want to implement the GPIO
accelerator operations in struct pinmux_ops, i.e. these:

 * @gpio_request_enable: requests and enables GPIO on a certain pin.
 *      Implement this only if you can mux every pin individually as GPIO. =
The
 *      affected GPIO range is passed along with an offset(pin number) into=
 that
 *      specific GPIO range - function selectors and pin groups are orthogo=
nal
 *      to this, the core will however make sure the pins do not collide.
 * @gpio_disable_free: free up GPIO muxing on a certain pin, the reverse of
 *      @gpio_request_enable
 * @gpio_set_direction: Since controllers may need different configurations
 *      depending on whether the GPIO is configured as input or output,
 *      a direction selector function may be implemented as a backing
 *      to the GPIO controllers that need pin muxing.
 * @strict: do not allow simultaneous use of the same pin for GPIO and anot=
her
 *      function. Check both gpio_owner and mux_owner strictly before appro=
ving
 *      the pin request.

And nowadays it is also worth considering using:

        bool (*function_is_gpio) (struct pinctrl_dev *pctldev,
                                  unsigned int selector);

To make the pinctrl core awara of a certain function selector being the
GPIO function (which makes the accelerated functions work much better
with the strict mode).

This can all be added later in separate patches, but this is a good time
to make sure nothing stands in the way of doing this.

Yours,
Linus Walleij

