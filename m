Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B535CFC521
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 09:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwfSbVA0IF+INvF3WYKe7TTnKMqGNeoc7QfEa9rVX5E=; b=gl0IXBWuWysChHVX9IpPLuP0qQ
	vH00j5z8nEeSUDjQ9XoVO0o1euDa+iDlPyGCzGdBCTsB7ozk+JMSBPcfXK9qLbEJT1HVCy9mZZXFH
	uSBYz/9kuNPPar39psi4owKLMRihH2PPPR5u9sjpqr7kQnJFzl3eYmIySwcTsnRt1HkWqqiupeQD2
	sIaPnmtR8+8kb2qmsPsIrqimBhPgPstXqj++f6clOeM+tPN1QcO2fgYuZa6dBYKswFDBe45g9q4FU
	1JiafHYAaFWr4CZM8U/fQnGNblm5fXvxAwRbK+euVU2xvI4+DBpP32HLMn6JUPB3HUDvhsXM9v3NT
	woT1GkBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMjyw-00000009QNn-0hKj;
	Sat, 22 Nov 2025 09:32:38 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMjyt-00000009QLK-0ugf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 09:32:36 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso3315391b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Nov 2025 01:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763803954; x=1764408754; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwfSbVA0IF+INvF3WYKe7TTnKMqGNeoc7QfEa9rVX5E=;
        b=YxgqT+Jz8zgbF+ZJYNJ0u1+gZWQfzvUcPKPe2VK+Cj733yJOvCmoa4U6HIfs5r1TyD
         0ctpsDn7ebMsABw4lmMlp00Lj+bKIwBvwU31sH5T0j4/5Gq1vTnFYiaqivNfop++TTSC
         DJaCXoJck2SbujNdMFWvvW22dWC6AKAJUcTKYZ9GxZsaBX1y2iwZNVduQIPNaGh73xT9
         48GazyDUIw/RpGKFyTRWwlQd5W/N8t8iElH8bymXaXVHgndts4euHDXLu9JPqwqhFbR6
         VsGzUPPa9E5mvWf0Co6uN68W1hieQvdr9A/MuTeQLUvR+bVSJmt0yVJaQMlqJfirBsmb
         tjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763803954; x=1764408754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PwfSbVA0IF+INvF3WYKe7TTnKMqGNeoc7QfEa9rVX5E=;
        b=kk8LhxFKmHL17XenMBv5O1tJirq91VfIwvbGE26RO1j0PmFnZk0rVaBdpLnhom/hve
         4momiPL3YFuKwiJDJymcE6j5TrOMRlqngZZpr3+RiOniQdsGkFAssfDkdPkEXagxpf3O
         Stgq+d74JOkjdFAz9B1nZvcPQQuI+zZgwZNa10FqLcg+/ynutFjtmePbXNniLZHYDRVW
         fRIZMV0kR3qGkFj/s4Nw4lY99JNDMmRbsSDmAQEHeFodq6tCYss+fJjbCGssuGurp+NE
         Gjdcj3i9AcgotAHsO1Gz3pMW8epg8DVoPkeQqyAwOgAm3Tmopo7/dnc9HPrP0xGf8Omb
         2nZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN75RGapfEhl8SDQCJBRqr7ptVHvhO5jgXzBZxlY5UP2p8c539DVbYexpR1KoBrO+ecIzLJLKSvPNo0L5y1XCs@lists.infradead.org
X-Gm-Message-State: AOJu0YyBw6rnfdCHymIEeS1h9eJpew6vhxKboyc8jyeykbISRO7XwvPO
	lAmazwSTUrgwiDrG31TyA8mVR1RqKlNvtCGN58oiVGK4PvXAI2VgMGGBdF5dNueyvGoQGr4n6Xt
	ygola1ubr7+9zdiVULMcBwa/a706EYUNMC2EWyS/r
X-Gm-Gg: ASbGnctaOF64I5cftMiES5Ubl5zZ+64jmOYBGiaM2vrvZGPnfcF2aoW1oKt/15b//ch
	8z+ZLl7T0gkU4LOdmdM8z40/R+jPU6VQQ9hVyzkqEGieJELRFPGIorV9E5fszL3njlFYfP+XaV1
	O1SRdUqaPSG1VFUO6SoTFfXqqxhdeqhq10kWhvX3h94B1BAoYfsVxFgRmlGDRGzTAQTXEyfmNOU
	L9jshjnhvtwEZd0c+ArXWhJNAVxZ/x6TuMeHbqMfHB27/0MPcUpUsTcYeEHqExfGslJgTU=
X-Google-Smtp-Source: AGHT+IEtl9+0xCjdQa9+R+GC+GJziEZM6X7VYbuzp+qoVNZuwKZ3umLayWIhnoniyzbglxAh3nD2e8iWh7BCQ7kfWaI=
X-Received: by 2002:a05:7022:6727:b0:119:e56c:18a7 with SMTP id
 a92af1059eb24-11c9d712aebmr2102850c88.15.1763803953323; Sat, 22 Nov 2025
 01:32:33 -0800 (PST)
MIME-Version: 1.0
References: <20251119093749.292926-1-royluo@google.com> <20251119093749.292926-3-royluo@google.com>
 <2025112144-claw-recolor-49c3@gregkh>
In-Reply-To: <2025112144-claw-recolor-49c3@gregkh>
From: Roy Luo <royluo@google.com>
Date: Sat, 22 Nov 2025 17:31:56 +0800
X-Gm-Features: AWmQ_blaOp8wg2UyednGm_iXI4eOxC8hbQ1lsk34Jq7M1OwHCTll441SPBByo04
Message-ID: <CA+zupgyEP+_q0uO1SpvR_wpk0ZP2EWf_E6FGQpOCLW63dKp5Fw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_013235_260279_E3F57EF3 
X-CRM114-Status: GOOD (  29.27  )
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

On Fri, Nov 21, 2025 at 10:26=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Nov 19, 2025 at 09:37:48AM +0000, Roy Luo wrote:
> > Add support for the DWC3 USB controller found on Google Tensor G5
> > (codename: laguna). The controller features dual-role functionality
> > and hibernation.
> >
> > The primary focus is implementing hibernation support in host mode,
> > enabling the controller to enter a low-power state (D3). This is
> > particularly relevant during system power state transition and
> > runtime power management for power efficiency.
> > Highlights:
> > - Align suspend callback with dwc3_suspend_common() for deciding
> >   between a full teardown and hibernation in host mode.
> > - Integration with `psw` (power switchable) and `top` power domains,
> >   managing their states and device links to support hibernation.
> > - A notifier callback dwc3_google_usb_psw_pd_notifier() for
> >   `psw` power domain events to manage controller state
> >   transitions to/from D3.
> > - Coordination of the `non_sticky` reset during power state
> >   transitions, asserting it on D3 entry and deasserting on D0 entry
> >   in hibernation scenario.
> > - Handling of high-speed and super-speed PME interrupts
> >   that are generated by remote wakeup during hibernation.
> >
> > Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/usb/dwc3/Kconfig       |  10 +
> >  drivers/usb/dwc3/Makefile      |   1 +
> >  drivers/usb/dwc3/dwc3-google.c | 628 +++++++++++++++++++++++++++++++++
> >  3 files changed, 639 insertions(+)
> >  create mode 100644 drivers/usb/dwc3/dwc3-google.c
> >
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index 4925d15084f8..bb0e4dc97da3 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -200,4 +200,14 @@ config USB_DWC3_GENERIC_PLAT
> >         the dwc3 child node in the device tree.
> >         Say 'Y' or 'M' here if your platform integrates DWC3 in a simil=
ar way.
> >
> > +config USB_DWC3_GOOGLE
> > +     tristate "Google Platform"
> > +     depends on OF && COMMON_CLK && RESET_CONTROLLER
>
> No build testing?

Will add depends on COMPILE_TEST.

>
> > +     default n
>
> This is always the default, no need to list it here.

Will drop it.

>
> > +     help
> > +       Support the DesignWare Core USB3 IP found on Google Tensor
> > +       SoCs, starting with the G5 generation. This driver includes
> > +       support for hibernation in host mode.
> > +       Say 'Y' or 'M' if you have one such device.
>
> You forgot the module name :(
>
> > +#define to_dwc3_google(d) container_of((d), struct dwc3_google, dwc)
>
> container_of_const() please.

Ack, will fix it in the next version.

>
>
> thanks,
>
> greg k-h

Thanks for the review.

Regards,
Roy Luo

