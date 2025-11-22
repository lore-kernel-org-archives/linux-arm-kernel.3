Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D971DCF64B1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 13:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D33saOqa18RCkbxGkW6RKN+23lAQ9LGSuB2LH3pnMFs=; b=wNo3Dfu24ZA+5Qsr4R2qFXssKa
	svzFL31S0cfnzv0t80JZ4jaBGDVZUvb7WNhXheEZIPMLhVveL/uLNdHvaFP1Awniy4IBCUC5dNGu7
	OgKMshA6ehz+sD3mp4jBvHIESpJQRBsEmhRU0Esut7egMqO7UDj23oHzDriK0sEmjZlj5qpCnhIv2
	YmKwGRIdJH8IVCiEgs7kGRuRg2JxKPLyOGS0bEHX63+vWUW7a6RN/BYtVK1t8qJvzKzkDwKRW3UU0
	4fjvlTpxuRqaMB5DoQKxOCJEiRMMdZnuvV3BAyKbQPiQoecuoqFr4MeQd3hsB6irpYOFKhD23nl6c
	/mLzR7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMnDw-00000009bJx-0RaS;
	Sat, 22 Nov 2025 13:00:20 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMnDt-00000009bJ9-0vLV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 13:00:18 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-8845498be17so40249206d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Nov 2025 05:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763816416; x=1764421216; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D33saOqa18RCkbxGkW6RKN+23lAQ9LGSuB2LH3pnMFs=;
        b=cEf1WqBL9X+ga5jSItSdbvpCtxSk5bLIuV6blqPPnuFbld6ANIQIHZaSLu3zOzKCZ6
         EZyrSpyBb/32WYL6hyddrwgAV3csOe3qayyQyAVW1G2Gh3vNZxWMAlWgE1RpoK8mhOed
         KUm955QpI6WuXXNWsoY+a8VdC3IYquKpLSmnDr8HC51ayHaqTNg7gqscN5XVM1XekmJq
         JLWq6WZOhRQsE4pK3PyBAQa/oDJaX+OhK8k+CV/9iukMgA9tvg2NxQK4WQfJ8KMk3SNe
         xDcEfBMdapMqy9HBqxCOgQR/bihntHrVcPwBufBVz/0jBA6DOXvj6/nKwCMZB9Y4XQMg
         xl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763816416; x=1764421216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D33saOqa18RCkbxGkW6RKN+23lAQ9LGSuB2LH3pnMFs=;
        b=SuWZEJEVhK+BDuVaL0H6HW8ZfLBQrFVkBw9OHqbEbZ/Ggx72I/U5dBmvoaZzzJlOry
         t4CYpofuX1Hc/JGfg1dDNWqj4vWQdtyWKtY4PiNG8mAuUMyiVq/6/PSPSZDvjtNkZuCN
         01doBJipLTggb6DMHgIw/3gi0WdDkV7KXDRxke5feayr+FAe0zZUuAOVKLCTvnDerIx+
         xsEVpRQWEEKDrB/TY/Lezj7ZM/6XUOXnIJWJ/BlrQ9jXkE5bXPw8VRbJfnGOsqrAsER4
         QoFlGKjpAmq2RA9gnRpYYJgWv6sOC7fr0afM+Ufr76S50kHCBpkCWht/zm9QtmJU5B9I
         s7Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWWEc4IHGrzFbXWZkFjpIRxFnga4HvpghQoTcP33nrYM0HhVzjfuWGr2AQki7pjnIh7hTFe50TWbx0mBY7Fy1E/@lists.infradead.org
X-Gm-Message-State: AOJu0YyBkN4LTTpVg3fJn4kVa5MTK77sPKjl311xTNUKns9xR8QNtHwx
	28ulZ/khRlFFGcrAIq9thjxlTsfuuKGsA+dNfbHRtOvMrZYBnnmD3HRSCqagXyLsv51s1eZPIzk
	xC5emnSR1OQeqeqPsrZDpgUOTLhIlmbTgqMBrXhChoA==
X-Gm-Gg: ASbGncsEyamfY8eWJ0wViAKJj93WiY3d2nDl7Yf6EUWB6xdTRKJ4tS/TF/0LJVoPohm
	pE1s8ladRXe/qLIM+gbYPnAr98P87thgME3aHZLV4aJNKmWH2uXR1+JBAtmmNGcxBMsv5UzHi5F
	JFF3tM1Kl1vz++SNRcFTpowxBR7SDlx6n9HSxaOC/Sue8zAHObsLQW4Byd0fXV5+FCi16RmxIsG
	VG3Wtx25/8bUMCYQethe4GxhdRSDCHPQj0K6MyFVDynHtV20aO+M9MzzddaFxDXkQg/Xxc54xhI
	M0TmCg==
X-Google-Smtp-Source: AGHT+IHJrCgIOLl4o7NWWLpx4hV5ffDAfX6bvndBUHOzhVwN3Sh2SMUBYCSUaMSJYcN7I8cF0AZYPeseet0woJPXfmE=
X-Received: by 2002:a05:6214:19ef:b0:880:53b3:a9bd with SMTP id
 6a1803df08f44-8847c48694cmr88775616d6.5.1763816415832; Sat, 22 Nov 2025
 05:00:15 -0800 (PST)
MIME-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com> <CADrjBPqPsPBBSbhx8ZFreFWX2tRxaATT=azS-b1H2b=TJoVAAw@mail.gmail.com>
 <2025112248-spoon-waffle-a508@gregkh>
In-Reply-To: <2025112248-spoon-waffle-a508@gregkh>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 22 Nov 2025 13:00:04 +0000
X-Gm-Features: AWmQ_blyAPM0LR0XqdHlXvnT72Nj6YIaIeoZyPTuWF8E9Zu5nwZOromhbyVp9eo
Message-ID: <CADrjBPp0icwChpAdeK-CBEqvV__ALJ4YO=cp5uhXEUu3nqL4UQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roy Luo <royluo@google.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_050017_272564_1167ABCD 
X-CRM114-Status: GOOD (  28.25  )
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

Hi Greg

On Sat, 22 Nov 2025 at 12:35, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Nov 22, 2025 at 11:58:39AM +0000, Peter Griffin wrote:
> > Hi Roy,
> >
> > Thanks for your patch. It's great to see Laguna support being added upstream.
> >
> > On Sat, 22 Nov 2025 at 09:32, Roy Luo <royluo@google.com> wrote:
> > >
> > > Add support for the DWC3 USB controller found on Google Tensor G5
> > > (codename: laguna). The controller features dual-role functionality
> > > and hibernation.
> > >
> > > The primary focus is implementing hibernation support in host mode,
> > > enabling the controller to enter a low-power state (D3). This is
> > > particularly relevant during system power state transition and
> > > runtime power management for power efficiency.
> > > Highlights:
> > > - Align suspend callback with dwc3_suspend_common() for deciding
> > >   between a full teardown and hibernation in host mode.
> > > - Integration with `psw` (power switchable) and `top` power domains,
> > >   managing their states and device links to support hibernation.
> > > - A notifier callback dwc3_google_usb_psw_pd_notifier() for
> > >   `psw` power domain events to manage controller state
> > >   transitions to/from D3.
> > > - Coordination of the `non_sticky` reset during power state
> > >   transitions, asserting it on D3 entry and deasserting on D0 entry
> > >   in hibernation scenario.
> > > - Handling of high-speed and super-speed PME interrupts
> > >   that are generated by remote wakeup during hibernation.
> > >
> > > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > > Signed-off-by: Roy Luo <royluo@google.com>
> > > ---
> > >  drivers/usb/dwc3/Kconfig       |  13 +
> > >  drivers/usb/dwc3/Makefile      |   1 +
> > >  drivers/usb/dwc3/dwc3-google.c | 628 +++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 642 insertions(+)
> > >
> > > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > > index 4925d15084f816d3ff92059b476ebcc799b56b51..f58c70dabf108878cbefe0abea88572d9ae81e26 100644
> > > --- a/drivers/usb/dwc3/Kconfig
> > > +++ b/drivers/usb/dwc3/Kconfig
> > > @@ -200,4 +200,17 @@ config USB_DWC3_GENERIC_PLAT
> > >           the dwc3 child node in the device tree.
> > >           Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
> > >
> > > +config USB_DWC3_GOOGLE
> > > +       tristate "Google Platform"
> > > +       depends on COMPILE_TEST
> > > +       depends on OF && COMMON_CLK && RESET_CONTROLLER
> > > +       help
> > > +         Support the DesignWare Core USB3 IP found on Google Tensor
> > > +         SoCs, starting with the G5 generation. This driver includes
> >
> > consider adding: (Laguna)
>
> What is "laguna" and why should it be listed here?

Laguna is the codename of the SoC (mentioned in the commit message).
The dt compatibles and proposed dt files all mention Laguna (as
opposed to G5) or its abbreviated form lga  so it could be helpful to
have this mentioned in the help message.

See https://lore.kernel.org/lkml/20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid/

Peter.

