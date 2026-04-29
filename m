Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D892BFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 19:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1oUs/Abu5g3UxUIAO0ZwpBJwwKm0pg05ZGOCVCeRmU=; b=MARWqVEmc79zl3WnMjP7Le+qOG
	shVfoizP2anjNxZ2F3Rf4Kqjsl+FLY2LXWR08WEDrux9qIv++4fgsfU0H8Vz70i/N4wuMvKj1VyFy
	q42CHYTGjCahFsuD/yMN2R04CDdC7DvedcNjqveqVNlq37bZZCFIAfEpngXS+Xtp6m0fP64hcr31j
	YWwdwUdlMu9t9VucWSRAJxZiaDv5Griudnul5hPLJ2z3OrASVGR0viR7yhqX3sQHd/WvNbGbHjogs
	L7N/gg1X/HBpR1AIYMF7GMSEhOpUvylDQuHi8XT9pPtL3HV1LbGxSmgze0ahpv8Ysy18F65UUFuZx
	8qayKVOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIASs-0000000490O-3AcH;
	Wed, 29 Apr 2026 19:20:54 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIASq-00000004901-0AcX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 19:20:53 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6794b8699b8so250711a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 12:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777490450; cv=none;
        d=google.com; s=arc-20240605;
        b=UzrGX6s7Vkdr3PTK8mjKVNouZb9acKR5+bA9wrHSlNdFXBYjDQ8VJdoK/aQjPcfihI
         SGaLVu2wzUrGDsgHL9cTuy3Awpmpi1SwHetWPOurySsJLKZPrsN3ifuSrpOFzftLXe6X
         ABfw0y+MOTgpMV0GS+Um4dWyEAtn4RlE1V5q8y2XqoqOtIUwMAAgW/eldcamu3TLdYxL
         7uKiBd2bbtnbXaRaf0rcdwK+XPAMH8WuZ8gMOjFDxM1u1sJ/H+341WEzbOpNynQVVZto
         a7T6LmExtZKzQYP4ziue189tHah0PON4fm3pkv7RWl/SW8voX/x7C4O6ZAykBFg1UxGi
         JMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P1oUs/Abu5g3UxUIAO0ZwpBJwwKm0pg05ZGOCVCeRmU=;
        fh=qmeNN1rpnnnAgxk+aiUkKWa8+qak0AIxolmRLptM7pw=;
        b=SwinH1K5FuwbwVxTuMgH6+H/zZWPk5jr6rQlq024SZSAlNMgv5UlLmKZk6YVhWRIY3
         uk6uL2B3eHJTFbpELt5R5AclensKGeCBBHhLRBzOModA4T/A47luO6D2MCxGg7vuhUk+
         bjwac+zZI4uZHmUjFdTCftp+4zRi8MaOR/DV5lHXXe41Yirgs6/KCmUxNzsCIheo6nOz
         BclV5VkgDsSd+8/jBA2Jd09CTrebyP1EKFK324/bI2acSwJg8faAUSabyURfi+TwPBUm
         l4TQPs49GxHhCsbIRtjos0RidUdQ7rMiGzA/msc3DOAF6PQXuzKkSi33e/nbxZaWO4Vf
         UiZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777490450; x=1778095250; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P1oUs/Abu5g3UxUIAO0ZwpBJwwKm0pg05ZGOCVCeRmU=;
        b=lmMDQt6S0qY7Zsg9dm+UxrNn9TLlnVK57t1yROI72bgI8dWxNjn8oWVcOYJ6QGq4VJ
         FKZPAkp+I9tzs8W0lG0P72WZg9VYlgi4+OAj90rR/bB3K9gl2s1tuFIQct90fdOGr7G6
         ETxMXPsqCQeedOTlDru1Kbogd11tJh2n1MCoBG7HsV/sX2vwjrVWJ5EA2ve6MT3bb345
         ukp01NlDmS8MDI8h2VX2abZcZm3DX0UEBiNLBLHxCQIAX87Q7q6ImNSfQos6U659enff
         VxwZ2ovnPpNw/YzjCBqwdgsv93sS9ldBhYQwHF0EgxaGyRlCh2neZD7VjrjCb5A9Qooq
         lDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490450; x=1778095250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1oUs/Abu5g3UxUIAO0ZwpBJwwKm0pg05ZGOCVCeRmU=;
        b=JrRAHxc1o6prUpzKrXSp+mfW6YwBWcuccMNFQdn0qohnnvWnzckZ9BNiqW9idGDIll
         Qm+gQEWI93zvu5EZ6rW5aXFKk9q8vvJQN9tUE9I4LDR0IbBaOEQ1yC5HcVf50w9760wu
         6IlZH9xTwE6KA/gK9L39oZkG+bmN6OSZqrXx8EZJSf0kCZBd/c2CH4nYRPmtVgOrIF0B
         aiup3bPcz0MhqsjDyYknrwvjpJgYCHakU7L3RifuMuMZo4w3pvztMH3PHNrsuZz6eZHL
         ShPBQgHPILQKRGuojmt8rDU2enuk7eRxqW0a9gyL4j5RGFXa6WpsxBSkwLlG6qq+kT0a
         jLzw==
X-Forwarded-Encrypted: i=1; AFNElJ9MLe6KOBYrRyQicKIJgTOW4ev4CosqCVIHEL+F4//KH2dI96LDYKg59FXs4WGImJpqP+MBtQ82iIVnvD/r5r02@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Gk5DSk3flO+2MuLeeD9Y6zINJLH76oXBfo2xOHkeaooH7HYu
	nXG1DO3pjGtdFYj7PtbG+OA2cL7qnbmKagUpAsCnhKGc7jEjab7zH3E0Gm7zXCk9m+nzUhP7RVY
	pou3eynPCdPIUpz4NX3XLH0aUk8gRKIo3Vm6ErWc1eA==
X-Gm-Gg: AeBDietmiwhnvTveLPO/jpcMwPhlxfhTWNa5oK3t2hz3EwSbjvlXaUeOAhLmIb3TqKV
	zQThJ7fODsNsFjCoRA2u4izd0foJItZm3crzd+O14hAcP58P1D/P8Y+B7WQK0qePA6HP2v6tUfh
	V6kmrL2NVTxA+wLO/XNP2iXH7hDyJex2z3FeTasfHgxE7t8YxPiIRJC1faJ4ZAaj/9dvtYzn1SW
	yHdwonYBuK1JNQcGPQJjcOswBENKyNUZ8EMijlTP/nmRTLp/RGjavSpIM0FURxTh6anKM9jVgsu
	B4poGaZbhZmLXClONlMvks2wn6r03Qbf62AyXMRt2sJRz0UL4Cc6BIQZoVylj98=
X-Received: by 2002:a05:6402:5024:b0:674:2565:f27a with SMTP id
 4fb4d7f45d1cf-679bb095b4amr4292362a12.19.1777490449661; Wed, 29 Apr 2026
 12:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com> <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch> <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch> <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s> <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com> <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
In-Reply-To: <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 29 Apr 2026 13:20:38 -0600
X-Gm-Features: AVHnY4LS0q8rVhCWEM9jcgreDzRj6jHlyTeei6srw2bJ0kIdi0Mr181JcAK3ylA
Message-ID: <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: "Padhi, Beleswar" <b-padhi@ti.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_122052_146738_F9A4D4A6 
X-CRM114-Status: GOOD (  32.80  )
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

On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
>
> Hi Mathieu,
>
> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
> > On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
> >>
> >>
> >>> -----Original Message-----
> >>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>> Sent: Wednesday, April 29, 2026 10:42 AM
> >>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
> >>> Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> >>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> >>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> >>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> >>> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> >>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> >>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> >>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> >>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> >>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> >>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> >>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> >>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> >>>>
> >>>>> -----Original Message-----
> >>>>> From: Andrew Lunn <andrew@lunn.ch>
> >>>>> Sent: Monday, April 27, 2026 3:49 PM
> >>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> >>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> >>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> >>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> >>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> >>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> >>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
> >>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> >>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> >>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> >>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> >>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> >>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> >>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> >>>>> <brgl@bgdev.pl>
> >>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
> >>>>> GPIO driver
> >>>>>>> struct virtio_gpio_response {
> >>>>>>>          __u8 status;
> >>>>>>>          __u8 value;
> >>>>>>> };
> >>>>>> It is the same message format. Please see the message definition
> >>>>> (GET_DIRECTION) below:
> >>>>>
> >>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> >>>>>> +   | 1   | 2   |port |line | err | dir|
> >>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>> Sorry, but i don't see how two u8 vs six u8 are the same message format.
> >>>>>
> >>>> Some changes to the message format are necessary.
> >>>>
> >>>> Virtio uses two communication channels (virtqueues): one for requests and
> >>> replies, and a second one for events.
> >>>> In contrast, rpmsg provides only a single communication channel, so a
> >>>> type field is required to distinguish between different kinds of messages.
> >>>>
> >>>> Since rpmsg replies and events share the same message format, an additional
> >>> line is introduced to handle both cases.
> >>>> Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
> >>> uniquely identify the target controller.
> >>>
> >>> I have commented on this before - RPMSG is already providing multiplexing
> >>> capability by way of endpoints.  There is no need for a port field.  One endpoint,
> >>> one GPIO controller.
> >>>
> >> You still need a way to let the remote side know which port the endpoint maps to, either
> >> by embedding the port information in the message (the current way), or by sending it
> >> separately.
> >>
> > An endpoint is created with every namespace request.  There should be
> > one namespace request for every GPIO controller, which yields a unique
> > endpoint for each controller and eliminates the need for an extra
> > field to identify them.
>
>
> Right, but this can still be done by just having one namespace request.
> We can create new endpoints bound to an existing namespace/channel by
> invoking rpmsg_create_ept(). This is what I suggested here too:
> https://lore.kernel.org/all/29485742-6e49-482e-b73d-228295daaeec@ti.com/
>

I will look at your suggestion (i.e link above) later this week or next week.

> My mental model looks like this for the complete picture:
>
> 1. namespace/channel#1 = rpmsg-io
>     a. ept1 -> gpio-controller@1
>     b. ept2 -> gpio-controller@2
>

I've asked for one endpoint per GPIO controller since the very
beginning.  I don't yet have a strong opinion on whether to use one
namespace request per GPIO controller or a single request that spins
off multiple endpoints.  I'll have to look at your link and reflect on
that.  Regardless of how we proceed on that front, multiplexing needs
to happen at the endpoint level rather than the packet level.  This is
the only way this work can move forward.

> 2. namespace/channel#2 = rpmsg-i2c
>     a. ept1 -> i2c@1
>     b. ept2 -> i2c@2
>     c. ept3 -> i2c@3
>
> etc...
>
> This way device groups are isolated with each channel/namespace, and
> instances within each device groups are also respected with specific
> endpoints.
>
> Thanks,
> Beleswar
>

