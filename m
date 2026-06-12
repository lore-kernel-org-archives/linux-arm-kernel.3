Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC6ECD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 06:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MssOwhTL72ghClGQmpNeh5OP7aj5IoqaYdtcZRWycjQ=; b=DHLzaYqcKBP26lJ5B6t/Qd30GY
	y5rzB4KhDIc+h/sJe9DKP5gUe1V5mTtTM4SwncHvRnFYUFAnbK6PhCsjbxGYolPLNVYGN6GBEqGOL
	YMcmn0KpyqkwlU8unVgSJJkTX0A5w+VAXfQZ3nIOwZcWMXeaa1mU4Y9usQtY79P6sxkL43WwTJF+4
	BxFotmIt+8UQ+3ivRemt6tKsunlBys3ig9KxyHxoX6fZa5WV3Z5vaxsfztjlKJKvhOnvIOxivVdlZ
	2O1FUsn7Wwz/dfB4WIsyKlMsxeum8olVB6oRYq6T7TOv+yEVCzwNp2b8vBdEk43rfCSPUadVH6kVF
	DCCl0T7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvm2-0000000AQYw-0ZRk;
	Fri, 12 Jun 2026 06:53:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvlz-0000000AQYZ-0fYh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 06:53:48 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so6283775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 23:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781247225; x=1781852025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MssOwhTL72ghClGQmpNeh5OP7aj5IoqaYdtcZRWycjQ=;
        b=PSdleG86dBMCoQx0f532gfBxzw/PNBOPtoOA5gmxZUYLQ2cN5x5wCS+bdLFx4d4HoJ
         DgPe/1RaTNpvluJ2nI++Y0Wd3u71bciHmFip6MsrRnnlMtlDgORaipU2vCYcJX1HfFx6
         yfKh7Tsiek6qteNy+zCkPEdeEdEOxZ5m7eeD70BF8Phl7ixaIMnHCqUOcdfnWp2EkNMU
         NwrqpvreWlGNfSCoGAb64AQ96eEgqly9gWd5MmSlK1OzauHfmgj0h/+d3az30FDyUgYm
         e0scQlKjK3js3aNVfUjTt2uIZDcamdRi7icTQ7oNQnPhFoClgshQ5qJ1/IPOLnYTOhKS
         9xMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247225; x=1781852025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MssOwhTL72ghClGQmpNeh5OP7aj5IoqaYdtcZRWycjQ=;
        b=YYy7uZ7LW0B43IWo3fNwY7JwElMMrG3T+0bLxEIs8+6kfkCZTzHN/YBza85TiAiqqo
         +3Y5HvG+wZ+/jBgoNheo6DoUQ/P+OaclTKqZbPTBpCaNKFrX4JOL0akogGjqNviGA82d
         CGqUmPdOr/SGdHAZFaNrL5h2976X7iBqmmh1JmIOK+pM+fVcdoTKggaTrcAn1MXkRy+/
         MYdw/RVCQEr7x08NkCPjJRb6wjL+SXgcgzwd/GhALyMNx56oDzSE74g5xpx0Bjy0FyYo
         zViztFw1NM2xGhsGaeSo86r/uDbBsGihpHcLXgk6typj6IxAcEAwFg5s3Yq5r7xAqnEL
         s+4g==
X-Forwarded-Encrypted: i=1; AFNElJ9sb56GKlaT6WA1m7sSZ1LotRc4Sb+MtRHkUwqgZjWL5U5EMfRtwv6ToxDeB/OfukBWUsGPTy1apHV5TWUg922Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzSf+JGeCPkByYMNdyzqcqEJJv0q1NvixJY+QZ/Ddqe/poaf1Sz
	8tc428Uuqc/UHuWJX9wJvHKI/2W74Y/aE77OwkSUdPMYHHaSB1hM9/AD
X-Gm-Gg: Acq92OGXtiOA4tqmeWNbS+/RRc4CRJ+j4WDFpRfwBLx6WCAUdlaODyFt3G4h8N43CQr
	j7Fo5+6hmhRPRMnQ9cKbJM8qd+Ahv6w4zvj8LUBU59wtvM1UwZYyyGUkYPja+73zgMnaTl7acCX
	mJI8txbdqQn0k8NFzKeRCVHLvr0xVVmpSExPIF/6m6YjqOEd1X+ZqDVeOCNilqABB2lDSvIt7ep
	DqU3RQhPECmL3v2ate+A7D1IcymJGLZHBlwqih+byg7xthNToyxN0I0RWsX6GwXyKeezQQ0+m/f
	cJ/w23gBtJfmg5KFaHSN1xv/dmMIBK/xUOGboUc98SkgiTHtY992Rj1VzlZNIzH0NoVRoDIVd6V
	Maiv2Lg98hromUFEphYeZLjVHdsH+ScNUQTb+Nax58+NudM7Hx0liRpnnPofxTMk+bPtGkqZi69
	3vh8iq2DNNyk1nvKA/adCb0/zy9o6ZIG5ensjEWRgkLkNOPeSoLXMEhuy++wcrxlp1Sv+/yEU=
X-Received: by 2002:a05:600c:8485:b0:490:a1be:6b01 with SMTP id 5b1f17b1804b1-490ec4991d8mr16991665e9.4.1781247224745;
        Thu, 11 Jun 2026 23:53:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2d09a85sm119274065e9.14.2026.06.11.23.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:53:43 -0700 (PDT)
Date: Fri, 12 Jun 2026 07:53:42 +0100
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
Message-ID: <20260612075342.6615d66c@pumpkin>
In-Reply-To: <b4fd25b6-52e3-4b5e-8440-69545bce43e8@pengutronix.de>
References: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
	<20260611204341.147f1afb@pumpkin>
	<b4fd25b6-52e3-4b5e-8440-69545bce43e8@pengutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_235347_272958_03982915 
X-CRM114-Status: GOOD (  30.38  )
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

On Thu, 11 Jun 2026 22:33:18 +0200
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> Hi David,
> 
> On 6/11/26 21:43, David Laight wrote:
> > On Thu, 11 Jun 2026 20:12:32 +0200
> > Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >   
> >> The LXA boards are the only STM32 boards that set stdout-path = &uart*
> >> instead of explicitly specifying a baud rate.
> >>
> >> This would mean the default of 9600 is used, but it goes unnoticed when
> >> booting normally as barebox fixes up a console= line that includes a
> >> baud rate.
> >>
> >> When EFI booting GRUB however, GRUB will not pass along the console=
> >> line and thus the board ends up with a 9600 baud Linux console,
> >> confusing users.  
> > 
> > Is it possible to determine the current baud rate (by reading the hardware
> > register) and default to that value.
> > Then if grub has initialised the uart the kernel will use the same
> > baud rate.  
> 
> I think so, yes. In addition to the register divider configuration, one
> would need the input clock rate as well, but that's not a problem.
> 
> Do you know if any drivers already do this?

I've seen it done somewhere, certainly x86, but possibly NetBSD.
That would have been preserving the baud rate set by the bios.
You don't want the baud rate changing half way through the boot sequence.

	David

> 
> Nevertheless, I would like the LXA device trees changed, even if only
> to align them with all other existing STM32 device trees.
> 
> Cheers,
> Ahmad
> 
> 
> > 
> > 	David
> >   
> >>
> >> This series fixes this. As the device trees were added at different
> >> times, they are fixed each in a separate commit with its own Fixes: tag.
> >>
> >> ---
> >> Ahmad Fatoum (3):
> >>       ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
> >>       ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
> >>       ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200
> >>
> >>  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
> >>  arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
> >>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
> >>  3 files changed, 3 insertions(+), 3 deletions(-)
> >> ---
> >> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> >> change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
> >>
> >> Best regards,
> >> --  
> >> Ahmad Fatoum <a.fatoum@pengutronix.de>
> >>
> >>  
> > 
> >   
> 
> 


