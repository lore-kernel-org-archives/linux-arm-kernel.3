Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1235ACD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2ZOqhU/l6/beyy/jENnR1Hvx3qZYXFW88yO0lTvHG8=; b=u9e1QIwkl5ibwFYKdYIfprYhoD
	hnA9isAz6MZNXbhQjGqbj08Uc91XhZKXFl7ev3VSTlCL2StPjzdHyGWry5HlWvcFYCz2GrC/iYdfG
	zRM6Xd6QiFm1uzFvXiA7sMQ9umkw5bstqEextBc5+r/EkjWO4y0QDx91F0OCJE5IfW7wUmmJVqPSk
	huWvx/QAaNAfdCR4jC0FDH+qtFBcLQ+RVLO61wTVrhSMsJwwo6KPOyOw007zosvtFa8WMuW2S3iTn
	N1TcAW511T6rM22rwm8eqI+X0OHkkKClCy1ZNM6sc6q2e8c/uXiWrUhjangjAy0ycX2qRdtsB9f+w
	D7ZYq75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3BZ-0000000Dw1J-0K8D;
	Mon, 15 Jun 2026 09:00:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3BR-0000000DvzC-1ZJg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:00:44 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so2528830f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 02:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781514039; x=1782118839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2ZOqhU/l6/beyy/jENnR1Hvx3qZYXFW88yO0lTvHG8=;
        b=CbQ/wsnQpn6PJ53aldbFyhM7PFnzUqwoS3qnTJ19D4VzvN/NCO7ITVQoF66mUeTovc
         nAMoFllcAt15SP4xZcFQItjjZYHCv2GwyRGG6B70eWuTS8bPoDvkSidvzRKr2Dd8V7Kp
         dF/PNj6W02QF68YVM8SRtEvdCqx7jow1m+F88Sw5GDBBiqol2roHAwxTrrQXw+Buhn9J
         g9yprrqGIKjXh5gGaU6IRUrDpzHxTzNZgXKiGxCxs2H1Xandg1MbJ3lwSoxVtLjAgJrr
         rwwJQuxqt8Rh+Xg6rpcmkzJmVJBrWyDr6IOEA8MQDyBZ7hHx7BjcsiYiEGj5wuUR9DCT
         bPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514039; x=1782118839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z2ZOqhU/l6/beyy/jENnR1Hvx3qZYXFW88yO0lTvHG8=;
        b=V1sktRE3kt7vAvyqqMN+180hZ8JKfqIed5I2SgxiJiW8+SeeY97old4oRVsaKmAjbl
         n6Ok+QnGRG0qDQy9VHck9jQNrrQ6nY98K3/4V4JeVvTv1jphKzKP8DZgfA4wsSHStJ9s
         iZKI5h4hBTnByA0W1vk7lrB/k3s4tfzCtOH51q/F6WoGYjtTTL7qm+KOEp1Bg6sUB/ZP
         a0ZW0dO5z66j/RJfkpqLryfZwuPQDZsN8xIeFAuWnJQL9NBtOpnRs1S7olTKE2jXufao
         gBGZKHAl6zHl1ymQveOQzE3JTocKF1bJxsWAWNyjFJMXII6CbkP5B4hf2CtYcgRqkzAy
         lA8A==
X-Forwarded-Encrypted: i=1; AFNElJ/XQXCq0Ablt06H+j93LbTDREMw4d+muMASx/VAQZbYHzp07JS8eGBZJDpj3+O5I1cxbfEOqc8PDhSEwUhE6Lgk@lists.infradead.org
X-Gm-Message-State: AOJu0YwLOGeve1UaprTe6c8TtZaK+bZwSuTGx78n/ceN8HzJ120dWq6Z
	bp9ziW8Y6BbRh0HzgoAYFukXpK4Lg8Gy0ji6TcH1nkWUVCmYy9VTJUuY
X-Gm-Gg: Acq92OEQcFHGpx7tM+FtkhpZbl+Wk2CsnpDgIltP2FkU6ZiwueyiG6PoJvgwDSklUv3
	oEtyuNNlchkdO2vk/ByM/xuIB07MvVJfZFNz+KriG1S6ksMkcDcTDzYFzKVruE+aWrIBShOujAW
	cNi8yQ6qlUt8A52XY/1DhzXJfAp6Jvr3gnm07+r5iUQikQ1t8AnalcWtyOJrTPATU8NIDeSnG3k
	KUgOg7u+cuXE0IhmqsvNKb4rA4k4EWoIY5gIR/mGu2AMfMVm+By1NU5VjZKEE4MHPYgjQ6QNfuz
	Fntm8CedBguzb2mCRoemUPrheUjA8Jy/XOrJdtTTQWOhsX5fTXdmozae9noUd6in54/iQAeL2Re
	YOKxk6uBb9OXcmm0BV6ERnS6XY151/dYK8yVCFIlf5en3lpGz/Luw2s8IPRjZPzbdMP+bz2DsBx
	bKhisc1+97zWrIz3TFgSLrEqLqyhHZmwmbaqn2+sLU5/JCgyV+HFK8vicxXDJR
X-Received: by 2002:a05:600d:6452:10b0:48f:e230:d5ab with SMTP id 5b1f17b1804b1-490ec5057bdmr127752275e9.31.1781514039035;
        Mon, 15 Jun 2026 02:00:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2ce361sm31634760f8f.31.2026.06.15.02.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:00:38 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:00:36 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Leonard
 =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>, Marc Kleine-Budde
 <mkl@pengutronix.de>, Alexandre Torgue <alexandre.torgue@st.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 0/3] ARM: dts: stm32: lxa: change stdout-path baud rate
 from 9600 to 115200
Message-ID: <20260615100036.1e09c22d@pumpkin>
In-Reply-To: <f0b7d0a0-9b75-4d63-bc1a-f0891c86b2b9@pengutronix.de>
References: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
	<20260611204341.147f1afb@pumpkin>
	<b4fd25b6-52e3-4b5e-8440-69545bce43e8@pengutronix.de>
	<20260612075342.6615d66c@pumpkin>
	<f0b7d0a0-9b75-4d63-bc1a-f0891c86b2b9@pengutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_020041_501134_4806855C 
X-CRM114-Status: GOOD (  31.72  )
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

On Mon, 15 Jun 2026 09:53:49 +0200
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> Hello David,
> 
> On 6/12/26 8:53 AM, David Laight wrote:
> > On Thu, 11 Jun 2026 22:33:18 +0200
> > Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >   
> >> Hi David,
> >>
> >> On 6/11/26 21:43, David Laight wrote:  
> >>> On Thu, 11 Jun 2026 20:12:32 +0200
> >>> Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >>>     
> >>>> The LXA boards are the only STM32 boards that set stdout-path = &uart*
> >>>> instead of explicitly specifying a baud rate.
> >>>>
> >>>> This would mean the default of 9600 is used, but it goes unnoticed when
> >>>> booting normally as barebox fixes up a console= line that includes a
> >>>> baud rate.
> >>>>
> >>>> When EFI booting GRUB however, GRUB will not pass along the console=
> >>>> line and thus the board ends up with a 9600 baud Linux console,
> >>>> confusing users.    
> >>>
> >>> Is it possible to determine the current baud rate (by reading the hardware
> >>> register) and default to that value.
> >>> Then if grub has initialised the uart the kernel will use the same
> >>> baud rate.    
> >>
> >> I think so, yes. In addition to the register divider configuration, one
> >> would need the input clock rate as well, but that's not a problem.
> >>
> >> Do you know if any drivers already do this?  
> > 
> > I've seen it done somewhere, certainly x86, but possibly NetBSD.
> > That would have been preserving the baud rate set by the bios.
> > You don't want the baud rate changing half way through the boot sequence.  
> 
> I agree in general, but in this case here, the BIOS defaults to 115200:

That would certainly make 115200 a better default than 9600.

	David

> 
> https://github.com/linux-automation/meta-lxatac/blob/wrynose/meta-lxatac-bsp/recipes-bsp/barebox/files/lxatac/defconfig#L171
> https://elixir.bootlin.com/barebox/v2026.06.0/source/common/console.c#L349
> 
> Cheers,
> Ahmad
> 
> > 
> > 	David
> >   
> >>
> >> Nevertheless, I would like the LXA device trees changed, even if only
> >> to align them with all other existing STM32 device trees.
> >>
> >> Cheers,
> >> Ahmad
> >>
> >>  
> >>>
> >>> 	David
> >>>     
> >>>>
> >>>> This series fixes this. As the device trees were added at different
> >>>> times, they are fixed each in a separate commit with its own Fixes: tag.
> >>>>
> >>>> ---
> >>>> Ahmad Fatoum (3):
> >>>>       ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
> >>>>       ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
> >>>>       ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200
> >>>>
> >>>>  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
> >>>>  arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
> >>>>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
> >>>>  3 files changed, 3 insertions(+), 3 deletions(-)
> >>>> ---
> >>>> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> >>>> change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
> >>>>
> >>>> Best regards,
> >>>> --  
> >>>> Ahmad Fatoum <a.fatoum@pengutronix.de>
> >>>>
> >>>>    
> >>>
> >>>     
> >>
> >>  
> > 
> >   
> 


