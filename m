Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75C6CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XHkkGY2cNGbvvZiNneWk2OoD80gfsi3EfjvphamSbE=; b=eAjCfFkkbzhaqG2uMHfYhgWr0N
	Phf7B+E4sYi/jcc/pz4QUVM1n6bRPHbPAR3ijdOHpxlPt2V1sUSMzGnUe7x9v6oqz0kneX8Zda7jo
	LPVzQbq0jE3WPTL/xzBmIUs6dzyBIhNNHqd6nDGkVziF9u+ZREgqw0gYiXewdo/ChvZjPjXMFAVoz
	Dv2MGVtpMdj1e/DknMgL3Tc+tIWoBgZdV+qIWk6iO9b1yPdEDCTLabdT16V7SHy5H3m1SP9EDGhOm
	5UclkNnsdBq2BBkkFb9gADrOGjFGMNG1Rpq509+XXe8oyqAr050FMWE1Qw3JWiA/6hhvgUurJlJKE
	ZUAgGXmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMM9-000000055CZ-28QV;
	Tue, 02 Dec 2025 09:07:34 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMM6-000000055CA-20Cl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:07:31 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-5dfa9c01c54so3271620137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764666449; x=1765271249; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XHkkGY2cNGbvvZiNneWk2OoD80gfsi3EfjvphamSbE=;
        b=LgPSYzv/M/+AUdlUkhnN5VGbYu2p++cL//CuBEw6CVR5jF3JizMJMDdAmtT7Ye5elF
         Am9vuJN4FGC4btFIQHDKOD0VZPf065MHqidSDuYMnlBlX2+LuYtuQqOsb+iU+TzwN+ht
         LeFvOE8PeK4Ys/gxKyBShl/3owEVlPzjjTu0NakA5QfZW2BRCRs59qTGPqrTOQsa90Dg
         6pYdZEQko9T/32cBV8yRATPDVb7Q7xr0a+VuasJjQmXCxh2CaPgbm+3Ffgfg1ozGfaoJ
         jdyV8ANgrbc6qzw+Ip1C7cYkO4HdpkcjVrtQK3fig555joPvUctGzKpvYHYnfMgV04pq
         PyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764666449; x=1765271249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3XHkkGY2cNGbvvZiNneWk2OoD80gfsi3EfjvphamSbE=;
        b=twn134n6N8pbsdlLSyfyYzQpCYBDftZkSukeI2xrPiOXZanp3dIQE6uqaWr39eErRX
         xBXBWEf+6XgybMBF5Q/qNgK4wNSGcZnGQWi3vk75SWqrECu394fJbSWCZ11aA4Me5pAW
         oaFmu63NTZ1bTa1lQTscwJ9UwD8yr8WNpinaercZN4cy379m0n6ihQoZxrh3wP17BAhm
         O+WLJ24eQ7zYgFBT0cXjNIQdebQSl33zhLCFVlaA4lLnUhdEJaKLGihiKvNTGGLvKZll
         bWK5yui+B4JbdQWrJpNpUeOQq4fYGVBCHWaIykFI9kjcgNWAVymyZWuCI14tMoybOknG
         iY3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKhntniYrcrJLiv+utUmDSGuy1BaCRLV/gFzi8CYSIBPo0IG60lL+Eana6TcoJWEkh8SozClbLNQjrQ5xSQ8Fy@lists.infradead.org
X-Gm-Message-State: AOJu0YwLnE+mrgwsUlk0VFO5+GjYMHiqXlSSQX5YfbmnXstOG8sBD5UA
	6vc6jtK4lic1A1TzSJOn6Z8CRLARTlDGJm3SVId6BAYdcyLOUYb+kfFvRtQe0xzBRqZw1bc1J3F
	amiEleALUElhdh4m6lIDVhw6FgWrKVTFYlI5+7L/avFS5i04j+/qkwJJhsBB5xktr
X-Gm-Gg: ASbGncsr2tHCfEGBnNvEzze3jr3jcBbWZsGSnnSUQKNQbXnG7CrxK1+Iw6/GVLuU3HU
	jQZlZmLeYT51blI4GwfYfTvZfBTczXlyEiLvV82IjXmCzXAgFcP67dPvJCSWMlZho4MkX0oZ2nz
	UAqEMXSFczyk6ehfpPjb60PXJioCnCKukHk795HkZv+YGvj+7fjl7mjbxqPGLWSRPj8wz7rsydl
	EKQMak7B5CW+2a5WecBuOU6DOm3qLt+KQsoomBxo9xpFgGZVIQ6hWkqIAXrQDLPuBj2XWQ=
X-Google-Smtp-Source: AGHT+IGiBzRHl7TPtYwtQi06ZiaJhnVzUcHhh5xBVlcMIML+l0+f6MQo/KbqNIpZ30wUru3qydCRc5k9yej1kRpZNRQ=
X-Received: by 2002:a05:7022:1111:b0:11b:9386:826c with SMTP id
 a92af1059eb24-11cbba5508fmr13693558c88.41.1764666110328; Tue, 02 Dec 2025
 01:01:50 -0800 (PST)
MIME-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com> <2025112226-heave-refrain-53e6@gregkh>
In-Reply-To: <2025112226-heave-refrain-53e6@gregkh>
From: Roy Luo <royluo@google.com>
Date: Tue, 2 Dec 2025 03:01:13 -0600
X-Gm-Features: AWmQ_bnlSStXeZAFzAhajdXf-6yqBRh8xzoWnHdfQbF_eyEVNWCr_wtC1nkDZig
Message-ID: <CA+zupgwzQ5r=-_L79D74=9VRqRO94N0yTApHChM+Nu0cn1ss3w@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_010730_533088_E1B57510 
X-CRM114-Status: GOOD (  27.83  )
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

On Sat, Nov 22, 2025 at 8:59=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Nov 22, 2025 at 09:32:06AM +0000, Roy Luo wrote:
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
> > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/usb/dwc3/Kconfig       |  13 +
> >  drivers/usb/dwc3/Makefile      |   1 +
> >  drivers/usb/dwc3/dwc3-google.c | 628 +++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 642 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index 4925d15084f816d3ff92059b476ebcc799b56b51..f58c70dabf108878cbefe0a=
bea88572d9ae81e26 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -200,4 +200,17 @@ config USB_DWC3_GENERIC_PLAT
> >         the dwc3 child node in the device tree.
> >         Say 'Y' or 'M' here if your platform integrates DWC3 in a simil=
ar way.
> >
> > +config USB_DWC3_GOOGLE
> > +     tristate "Google Platform"
> > +     depends on COMPILE_TEST
> > +     depends on OF && COMMON_CLK && RESET_CONTROLLER
>
> Shouldn't this be:
>         depends on (OF && COMMON_CLK && RESET_CONTROLLER) || COMPILE_TEST
>
> I shouldn't have to enable those options to just get a build test here,
> the apis should be properly stubbed out if those options are not
> enabled, right?
>
> thanks,
>
> greg k-h

Hi Greg,

I agree with your interpretation of COMPILE_TEST but it doesn't
seem to align with upstream convention. I found the following pattern
in several device driver Kconfig files (including but not limited to usb,
pinctrl and phy).

    depends on COMPILE_TEST || ARCH_XXX
    depends on CONFIG_A && CONFIG_B...

For this patch, the APIs exposed by OF, COMMON_CLK
and RESET_CONTROLLER are properly stubbed out so
I'm all good to go with your suggestion, but I'd like to make
sure this approach is conventional.

I plan to add ARCH_GOOGLE as a dependency in the next
version per [1], so the "depends on" would probably look like
the following per your suggestion:

    depends on (OF && COMMON_CLK && RESET_CONTROLLER && ARCH_GOOGLE)
|| COMPILE_TEST

Please let me know your thoughts.
[1] https://lore.kernel.org/linux-phy/1a53d473-fc13-4ac5-ba52-4701d95e3073@=
kernel.org/

Thanks,
Roy Luo

