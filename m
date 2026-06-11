Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AB9CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 12:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9WLujsb76wJX19mGC9SDiFMCyDY7pNnF6G3yu8LFgE=; b=AJyIFkGhrSzlVHFTSIHEKMnq53
	6ip8NBx3kpM3nTeFw2rnkpy7Znq/j4siO+rNaSwT+IkiVhT4Ef1xBSTv21CxPFvWYxLVR3uwTpDVh
	BbQ9K4Vo/s6ylA5m9xa4E/aUeqMDq7KPUnkYJ9OVcuuiew0T0BOghwXVFZISwFN6lEP9vYxjjnetz
	XquqQfZCkDMSS5/pCP9ZBq1o9SHJyrEn5Ogt1Wst4NxPzaClRFL8b+0g4qw3yBZ10meWKnqHCy7w0
	ZRAKkIOF9UReqX8+BChOIDiRW8PbHHGb+7SWBDkXDnX/kZbJhm90etcm9ABAZVMrAEB4WRyKasPde
	LjeC0vzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXesi-00000009RTT-0x5e;
	Thu, 11 Jun 2026 12:51:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXesh-00000009RSy-1ZqV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 12:51:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 002314430C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 12:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AF11F008A3
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 12:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781182294;
	bh=e9WLujsb76wJX19mGC9SDiFMCyDY7pNnF6G3yu8LFgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KwaI5VqY0p7DAHXz8MzhJMOIHJOjZed7svN8SV/HGfUR99cKVb7WfZDH2KjdGcW5r
	 +EzPcme8QoWuXMs3K+H0pPnuXJ9rFvxrqr7Of3PptQnEKQgfGJRQ+98UN4fBIGgLd4
	 DdzOYTFg8PCu4MroMNudhUK8q15qmG3405HG7hIxt+tqio+jQKNi+UUoLsCmZdON4q
	 noIDgWUwO0lhkSyJ9oM/prdrsAOcP7v02fA6KBegv70wCGCvJrDOyLUM2rf9nwWpJs
	 c0iN194kuN0GvY6G4X+fyurayXXGIuuYHXlCaEQRpcG2SyaFfbcdw66g4CkLxe0Ddl
	 VutqEYt1WmDoA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa7a70c0aaso8077454e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 05:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+U3zlGRTa3eb1sRMn36PuiSafzzjd1vFXpylgk+VZPmJjTlXshkc3m/7kZCTnsDlDF7ZNSKvp2Dx9o76KSPVcc@lists.infradead.org
X-Gm-Message-State: AOJu0YxK9VpE7rBL2xDa1lrXDI5EvjGCbx8h40W4EB6kugwwwulIRq+O
	jot4+fjq0hMiNs8FQ+4pFE0MzUPrAw/ordgn2c1KSP7GUCXe3lpve31IuhLeMolr2PpkAx1Soxe
	RYCl7QKgpxyz8H5edunK39W3A4Wmoso8=
X-Received: by 2002:a05:6512:104f:b0:5a3:6731:910a with SMTP id
 2adb3069b0e04-5ad27ab9e1amr954915e87.11.1781182293519; Thu, 11 Jun 2026
 05:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
In-Reply-To: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:51:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLk3YdMUSkk71rgT=taQZnEhqgMgGP0dKBPx7_5Bsxmu+g@mail.gmail.com>
X-Gm-Features: AVVi8Cd-dIHDWtIpo4Lae4LYz5CqVn4HEUpS_YsaMZ1wtD9Hr9uCut8hp35HQx0
Message-ID: <CAD++jLk3YdMUSkk71rgT=taQZnEhqgMgGP0dKBPx7_5Bsxmu+g@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] pinctrl: Add support gpiod_to_irq
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

thanks for your patches!

On Thu, Jun 11, 2026 at 9:54=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> Some users need to obtain an IRQ directly from a GPIO descriptor through =
gpiod_to_irq().
> Add the required DT binding and implementation to support this use case.
> Since this introduces a new DT property, the property is kept optional to
> maintain compatibility with existing SoCs and DTS files.

To me it looks like you have just re-implemented hierarchical
irqs.

Look into the section "Infrastructure helpers for GPIO irqchips"
in Documentation/driver-api/gpio/driver.rst, especially towards
the end.

Solve this by using GPIOLIB_IRQCHIP and a custom
child_to_parent_hwirq() callback to translate the GPIO into
an IRQ.

To just implement gpiod_to_irq() without any irqchip abstraction
is also broken: you can't force all users to just use this way
to get an IRQ it's excessively restricting.

Add

  interrupt-controller: true

  "#interrupt-cells":
    const: 2

to the pinctrl node as well so that DT users can simply request
the IRQ from the irqchip inside of the pin controller. It will
be hierarchical and lightweight but an irqchip nevertheless.

The GPIOLIB_IRQCHIP approach will help you to get this
right.

Yours,
Linus Walleij

