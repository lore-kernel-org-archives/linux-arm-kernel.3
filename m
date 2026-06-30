Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A507FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVY7OPuBtDDWoGVmZzYJMH+zngqc4Ts/svjtm9TV7xA=; b=VE3z27iF1Pe9mnhVHH30zm8P4F
	JWmQOIn3wwiq+wIQ6Biy2TSbyhI8MOMaZRvyT4Ye1zFUk/TdahDW6ro1gYAFbuQ4ziXX7ZsTXZ9fq
	O+4QqtHRV0NRnU0l/gh4/zXjVAh1JYvq7HGBdkfUbQtaqLGcJFHsnSHhmaoJ8F9c5tCaLSrPwVyOS
	3jgsnDSmvPC0muvqaTPCNSakJQx9fUkVK7Cc8Mtb17flEjrz4UwV8yLXmPGHmDfVr8nedlILJ1w+t
	v+MpymPLbwSkb0dkxwnngBRVg60FIvkjOuglOsV/Fc/MkCLAR50LzMBI+14uXH+ccQZZARBNK+Ih8
	V38EurNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYOy-0000000H9C4-0mNV;
	Tue, 30 Jun 2026 13:21:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYOq-0000000H9BC-0Mu1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:21:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BDB0043D18
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 13:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A265C1F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 13:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782825675;
	bh=MVY7OPuBtDDWoGVmZzYJMH+zngqc4Ts/svjtm9TV7xA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iOyhgDJMUazn9ljrXYNdCvg1zL422zS4FttNWGhdvnMmlXUssySEPNAITYjTS8B2c
	 e0x/xa7PwM3CmCldqJHaNdeKzhqlDPDsYRrj5nlcG+wqJtaKqS7e7SwP+s7aM8GJa6
	 K+1zmqgPQWyqCDX8mH+vtAtFUP+x4m2BoYG7zXxtS24IhPJXzDTuGDnmuJEW0ZdBGu
	 BUwj/Xkb7nNS7nMzu7mgTJC1/JUdev7TQmFd2s67DOl7khiQLBgYpHuLEquTNtX3yN
	 RGpHp7fSnBxYRmv8dvcFmRogh4EqEuZr4t0K5ZI9FTV7LxSYAm0pvyIFQSu9LIzp70
	 ZkhNVU4yfc6DQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeba1a36dfso1670492e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 06:21:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrs3i/YagyQc+621YikLv+egbA+ZxKTyNNB216tkJYU9FPzJlZVGj+Ona3AjdNMjWbbStsn9p4U+iSRLNObzGMj@lists.infradead.org
X-Gm-Message-State: AOJu0YwaHxh04We41vg/GegJcpnxFL+0JL76Ky44GjYpx8FJ1xbXH4/2
	kDUjBaK7uX5gQpytxER/92aMyEIy0pTMiqY+/smjf0kEP9W5oJpJ123zKsBxZnbv8xIZ+3K9jtY
	8e7WaRObK2aOqYvW/oGGkxmVLEQ0pHHw=
X-Received: by 2002:a05:6512:4019:b0:5ae:b728:df28 with SMTP id
 2adb3069b0e04-5aebdbd6442mr872848e87.49.1782825674488; Tue, 30 Jun 2026
 06:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com> <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com> <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org> <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
 <ajkP4DHN4JPjr6yb@ashevche-desk.local>
In-Reply-To: <ajkP4DHN4JPjr6yb@ashevche-desk.local>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 14:21:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLmHk=efdbz9LgXJiuNzTjM7-K2d3v5TPck_-NJpBp+QkQ@mail.gmail.com>
X-Gm-Features: AVVi8CeSmNt49CsRH7ooO8TtoFwH2cGZrVPIEEBlGKP4NblkyzQpSIYZPriLS8c
Message-ID: <CAD++jLmHk=efdbz9LgXJiuNzTjM7-K2d3v5TPck_-NJpBp+QkQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip() accessor
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>, 
	"wbg@kernel.org" <wbg@kernel.org>, 
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, "lars@metafoo.de" <lars@metafoo.de>, 
	"Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>, "jic23@kernel.org" <jic23@kernel.org>, 
	"nuno.sa@analog.com" <nuno.sa@analog.com>, "andy@kernel.org" <andy@kernel.org>, 
	"dlechner@baylibre.com" <dlechner@baylibre.com>, =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	=?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
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

On Mon, Jun 22, 2026 at 11:35=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:

> So, when we instantiate our own domain in regmap GPIO, we should have tho=
se
> callbacks be defined somewhere?

Domains are just translators, but if you create an irq chip it should
ideally have these callbacks.

Yours,
Linus Walleij

