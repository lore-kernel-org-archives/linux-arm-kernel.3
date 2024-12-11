Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA23E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 17:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NxV4GoHK/ahyIflRv/mOazvo62QwExn028Ncg5fkKE=; b=dMZEticjRGVhkfutkEuXnnAxOc
	NzzPcz4SMRC2HEUny8iOOqlK8xvteFSP0fl0p/AFZSx4FtUjjU61VEd+fpM+nBtdepdtUk+ips33e
	96UuPDU/xCIUjf6pEXE7G2cLTzB/EJWt5ivHtoYU5OTO5P7uT7NNKRBaSegEJQpgw4cA0Zd+qSbCS
	b0DSAoFh4ZTBo4afypyuWHHxzYqGsJuuAqN11UBUQtxmdWNDRSLc2l2vCk3rz19sl0a2JR519xtKB
	AQoeyT1mRNwXDX2ResMC+XEps4PQWFUzuNhWokftJ0UO7NZ+h7NCWmJAHD6Bq68snsNxRpDjQnkc+
	xzE2WjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQx0-0000000Ffyr-1xxH;
	Wed, 11 Dec 2024 17:56:42 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQvw-0000000Ffky-0lRr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 17:55:37 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3eb687d96e9so1305350b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 09:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733939735; x=1734544535; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NxV4GoHK/ahyIflRv/mOazvo62QwExn028Ncg5fkKE=;
        b=eY9wxNKH3NBKgKBVSeVGtvfRzlP7FUpbHQznWFxmnRwXHgWL4WpOYRFudwlPm3HqpR
         zsZ3BaOp8HApsbMhDcvNar2eWsa/otUHMfH71dIHlOFeDXbP3FwA0VZuw0VNJnrWTb1A
         F40brZM1Zsbwk00nKa/QDZHaJumwe16haGKp3XfNdDUkhq8YBjaqH34QAYmXxNs9+PcK
         QV0CIpxvlRSkUiTCD03H+HQDqOmqxD5mNeNna+I7MBuOSl7vEJ56TO25maHcHrUbwKzY
         dN/u9B7YH7ybj3dL5fA6uuFVLxxNLBrT9ZVnXM4qUggrgQzlmF5/VsNfyDno1iW6oQqe
         YjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733939735; x=1734544535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NxV4GoHK/ahyIflRv/mOazvo62QwExn028Ncg5fkKE=;
        b=nQ62vnGjihGDfBKY7YEynIxJ5oB+2LdA9yXSWuPw73/Y6nfQgtl2ArnuwjiH4hmEpP
         qGj/sQU13DnFMmj6QwaH7ebFcD8aRIWAk4Ik4goPrdtKdckOCwcvEMBlWhIyAfFUZDjM
         W55/C7+KGy8POho2tEeHze/j1AaB7g3AQABuqz/GaSL6ZY5VmpkeukIoeglrvYvAupB8
         QVK8zUNK9V5eHcUboFHWTGljpqdtVhtsWExyfj2CidwZt4Ob23vDKdZkQMJhwnCPjlS0
         xogjf6DBvJYhdk13pxX7ffvsEEUunm7ZhsFUdfpym3M9hoA0ALlNKPAoSCsGNmVQDhrW
         F7VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvxPi1DWNgVcxI4WLMUEZeSZR5zS/tbobCn516sCH2Mn/2h26UF+3iof27EX08Wvmq+3RrGx8lLfbC03o9Q6dc@lists.infradead.org
X-Gm-Message-State: AOJu0YwSZH2h1qTqLH4tQQnwmVw5hv//X5bFLMwW7ExOn8iiCVodJg0U
	L6cxAVfaKF/pgHb65s462jwnjJpPqwfeiUlVTRy+uv7S0ihxQZlSSUHjRjyHBm6tpldkp1QMnwK
	ADAje8e5e6+1VCV8q1hhJyKGifFdp6Qu0cMlBhg==
X-Gm-Gg: ASbGncsQNxEfew2sHGxnEEZT4yklAeqVksduJS9gxJWwBmztyE0YEMoaxD6hDdXTK8l
	IKEA7OdMMjj2CMbYX/opPzbk+/x/Hv1TIxxM=
X-Google-Smtp-Source: AGHT+IF4vtTjbxANqGCquCOW86vWqQwnJkVwBIy0+PKUY3mXo9+jIK2tbaAnXdNFAA6ijnfwpTtlzsC6XGNl2/h4Y9Q=
X-Received: by 2002:a05:6808:189c:b0:3e6:6097:847d with SMTP id
 5614622812f47-3eb85a8b199mr2732633b6e.7.1733939734907; Wed, 11 Dec 2024
 09:55:34 -0800 (PST)
MIME-Version: 1.0
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org> <CADrjBPoZqbAM=2zOdgXD_dTrgh-J7yE+OX_JSVJ42Lmzb-DPEw@mail.gmail.com>
In-Reply-To: <CADrjBPoZqbAM=2zOdgXD_dTrgh-J7yE+OX_JSVJ42Lmzb-DPEw@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Dec 2024 17:55:23 +0000
Message-ID: <CADrjBPpv7Y-v4w-ZjsM52wPXM1G=v028BxmJA=_zb4ksDq21EQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_095536_219132_D1816F30 
X-CRM114-Status: GOOD (  31.92  )
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

Hi Andr=C3=A9,

On Sat, 7 Dec 2024 at 21:31, Peter Griffin <peter.griffin@linaro.org> wrote=
:
>
> Hi Andr=C3=A9,
>
> Firstly, thanks for all your work getting USB on Pixel 6 / gs101
> working upstream :)
>
> On Fri, 6 Dec 2024 at 16:31, Andr=C3=A9 Draszik <andre.draszik@linaro.org=
> wrote:
> >
> > gs101's SS phy needs to be configured differently based on the
> > connector orientation, as the SS link can only be established if the
> > mux is configured correctly.
> >
> > The code to handle programming of the mux is in place already, this com=
mit
> > now adds the missing pieces to subscribe to the Type-C orientation
> > switch event.
> >
> > Note that for this all to work we rely on the USB controller
> > re-initialising us. It should invoke our .exit() upon cable unplug, and
> > during cable plug we'll receive the orientation event after which we
> > expect our .init() to be called.
> >
> > Above reinitialisation happens if the DWC3 controller can enter runtime
> > suspend automatically. For the DWC3 driver, this is an opt-in:
> >     echo auto > /sys/devices/.../11110000.usb/power/control
> > Once done, things work as long as the UDC is not bound as otherwise it
> > stays busy because it doesn't cancel / stop outstanding TRBs. For now
> > we have to manually unbind the UDC in that case:
> >      echo "" > sys/kernel/config/usb_gadget/.../UDC
> >
> > Note that if the orientation-switch property is missing from the DT,
> > the code will behave as before this commit (meaning for gs101 it will
> > work in SS mode in one orientation only). Other platforms are not
> > affected either way.
> >
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Tested-by: Peter Griffin <peter.griffin@linaro.org>
>
> Notes on testing:
>
> I tested this series with the corresponding DT using a Pixel 6 device
> with 2 different USB hubs and also plugging directly into my laptop.
> I've tried various combinations of plugging / unplugging from both
> ends of the USB cable and changing cable orientation. With the latest
> series the disconnect/reconnect always seems robustly detected and
> Pixel is enumerated as a USB device by the host, adb connection to the
> phone is possible even with the cable orientation changing between
> disconnect/reconnect.
>
> One thing I did notice during testing is that in one cable orientation
> Pixel is detected as a `SuperSpeed USB device` by the host and in the
> other cable orientation it is detected as a `high-speed USB device`.
> Which suggests there is still a latent bug in the phy
> re-configuration.

You can disregard this last point, I had a typo in my test setup :( I
just confirmed that it is detected as SuperSpeed in both orientations.

Thanks,

Peter

