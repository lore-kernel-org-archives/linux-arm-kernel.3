Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631D5CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 18:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JE/QqWs7NstXUoklYPWJg7vwj5OuQDSlnmUz+8GLmcA=; b=NQos+Z1kp3ogTR+CCRPtaScwm2
	vf+PBI2lGEUfxG9rGKRnAJ8Kv79xzJIHavakF/RwH2KP3h32onm8U6JSVsWJolpgo9RlNFZrtEx8T
	5cjcBGm70g9W9BFHe4PVeJwUN1m4pd8wgEU6RqmJuIf/iVZbsY6b9S0DNccqzGihtnsnjeRB9kjUP
	PzLrKLp1gNTnUX1Fvma9lyMUtljiuMJOIIUKg33K9oxsYA74WaxHSJsEacSykQE4oMWfO0T7ornFk
	Wqefj2x6Fc/mEIIfWv30QRASGcMrXQBM5SRLiSZ3yYcoGBaztCgs8PDTld64gj1VqViLJD74CkrKJ
	/DuH75mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CtQ-00000002dfX-1TVf;
	Tue, 07 Oct 2025 18:58:36 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CtN-00000002deN-2JxU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 18:58:35 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-7957e2f6ba8so64870436d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 11:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759863512; x=1760468312; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JE/QqWs7NstXUoklYPWJg7vwj5OuQDSlnmUz+8GLmcA=;
        b=RW2bRbwxwFm7Bghm8MKgAgtTAOIy5ZV/wOkvk8+DUNzl4EdGahXXRhWYL2t69Sz77B
         Nv5uKlR3Xkoxkeen3TjA/pFb+cpB22JeYYXKyuE38pbkF8T6lcFPTOd2jKw0Z1lw+N5o
         AJSG0Fz08e4ZzNsXYMfCnW9dPoPVtFbD9LwS3PI1JWtpwlfmE3harpfbf0KIEMACUJhE
         wcIk7NZIz9PmuvQ3ylvrFW3LbXSagNqdvSaAuWyjCkZgdgLTQeAk9V8e4TaHmbb/XN9Q
         WATmwCVwENsjIQzK5S6Btsuoh7wPoLTKOJCu38xtxaacH0DelTKCLWkJU76onL2LNRYT
         IUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863512; x=1760468312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JE/QqWs7NstXUoklYPWJg7vwj5OuQDSlnmUz+8GLmcA=;
        b=GENxOR4wqE1muZbh/qW1mFskozV5hc6BUcNItRftol3jY+qSLiXxWI6akb+AdylgPH
         g9y0BiwJwBdE0u9uir3U4Mnowem+tnJnBiz9Hmxce2Pvm8TDqRqUEWJ43os8kpUeYGj2
         cw++p/AZgvXoxzo4YPXGOhAXQzHbyejM+SR6S300fnrCFQ1m5I9dEUyvHY4N0WVQkeNq
         0tMmjvHXe5x53QfJraLbQjB1AWrddBeg9LKZphKcOsQPs3Z7LRbryUNFver9kPusSe9U
         7ex+WdYfJqEV9UyIjBgj1CoFh3h9nf5V7niozORdRtorZUPKP07qatk4XjTrKi5Rqv3p
         /6pA==
X-Forwarded-Encrypted: i=1; AJvYcCWBbe8RALCqWotYCPwNMHe1BA8aJubU4iI3L06WbbGU5vIM7aS4RH8u4JDFQz15M/Vcq3dnir5HSII5CtQLpyBk@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6W9W9WFML/papRLfovWlpi7jt9EqsGS31Tkdmr4ujqKW3FAvF
	edsJSlr9KV0eNZ80s0HrpKaEJ2fdTdRLKDAdPkl5tJbDGIl2VxLA4q+M5t/2FEL4kY97P0XUbzE
	TRo6fJx+GTYDD7NW2EiWhLNzf3itZun64tvqEPmnl
X-Gm-Gg: ASbGncvGNuFU8nlfV7A9Rm/P5wMkgeNc9H3xhufai0rJHlyxsJjhpLyP+em4Ljjf2BX
	RhTVCB7BM/EwBcqJSdef8H0lmsmioGlNEEdJA8hAAvaPWuIkqCw4IEJ63MZcR/nLi96spNBgbdF
	xpsJVL0Fh+5leSUyr+sDIrXyzKQo82/XMhoPgeFT8zpRvrITKwu3KFoipSDoNXcJE7o0Okgusl/
	AHGDuON/w9iw7hHVM0qhHO1r8v61C4+MYjo6XvMAArll5I1BqBW02RGbNMg/jrbt/vUZgRVWkA3
	ZDU=
X-Google-Smtp-Source: AGHT+IFJCSvibVVpHo9SVA1MQuL2njqF7Hz3TZEHv6SusAWE3ZVPz/ickNfrrHhzv+YbaQGGtkgTfVD3qAa0FKJd9d4=
X-Received: by 2002:a05:6214:21a1:b0:786:5ae7:7846 with SMTP id
 6a1803df08f44-87b2efb9e09mr7131866d6.32.1759863511911; Tue, 07 Oct 2025
 11:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com> <20251006232125.1833979-4-royluo@google.com>
 <2025100735-gulf-error-2ce2@gregkh>
In-Reply-To: <2025100735-gulf-error-2ce2@gregkh>
From: Roy Luo <royluo@google.com>
Date: Tue, 7 Oct 2025 11:57:55 -0700
X-Gm-Features: AS18NWCmw4sozhJ6PiheC0IEychcx5yjcq3OEgXWnrhYT0U6wZ0e0y1txxXckvE
Message-ID: <CA+zupgz-RQ=vNCBTy5yaaP9xJFpeFw+xLJYuvtjct6iuh6zD2g@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] usb: dwc3: Add Google SoC USB PHY driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_115833_597098_69196F38 
X-CRM114-Status: GOOD (  18.10  )
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

On Mon, Oct 6, 2025 at 10:51=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Oct 06, 2025 at 11:21:24PM +0000, Roy Luo wrote:
> > Support the USB PHY found on Google Tensor SoCs.
>
> That's great, but that's not what your subject line says (it says "usb:
> dwc3")

Will change the title prefix to phy in the next patchset.

>
> > This particular USB PHY supports both high-speed and super-speed
> > operations, and is paired with the SNPS DWC3 controller that's also
> > integrated on the SoCs.
> > This initial patch specifically adds functionality for high-speed.
> >
> > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/phy/Kconfig                 |   1 +
> >  drivers/phy/Makefile                |   1 +
> >  drivers/phy/google/Kconfig          |  15 ++
> >  drivers/phy/google/Makefile         |   2 +
> >  drivers/phy/google/phy-google-usb.c | 286 ++++++++++++++++++++++++++++
>
> And as others said, you don't need a whole new directory for one single
> .c file.
>
> thanks,
>
> greg k-h

The USB phy on Google Tensor G5 is no longer based on Samsung/Exynos
IP, hence we need a new driver for it.
Acknowledge that we don't need a new directory just for one file, will move
it to the drivers/phy directory in the next patchset.

Thanks,
Roy Luo

