Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD39FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WL3Uj3kb7PrFoW/8XQQ00eIJvsOj+gpzAMtc380q7Qs=; b=RERgKVt2giYwF24aBwFdX6epFo
	ulSdue+ivI6JwJinZIOPjljm9G3PWwXUV9dolW6doA5TZMFt8L3O04LkjosBzznWy9no+FnsskREF
	IwyY7BOmIB8b5d19NIVE2jPaNgouQxmN1GqoM79rwkb91G3qxnYMcoQs2BdcN5SHwbTWw9pU+Nq/+
	G6lpEejjE28RfAPcE/ERYuU1Zdf9vww4GFhnvckuD6qhpESMfTBqG+gT7arOpQsk7fMqUC/OnExzV
	KbC8ETuVwYcrYOznZCR8ClC7faQY7TrHg1PhnKisCwhhfjsFyz1A19wf8PwCephOX2sLVQnc3TX8c
	CwliWzgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJQa-0000000H2Mu-1HAp;
	Tue, 05 May 2026 17:19:24 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJQX-0000000H2ML-1i5O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 17:19:22 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so3979143b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778001560; x=1778606360; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WL3Uj3kb7PrFoW/8XQQ00eIJvsOj+gpzAMtc380q7Qs=;
        b=YsZsDcNMOcVQ+rSVj5FmEYVw0umXyKBHuiFSEhIYMFctyFJhMT2zZDCwObIRX7PLfS
         6N4tkpRhXNpM6YAq/KYHvPxIR71lEufrR7nXFAXZA4ffGl9WzvTW5aSkyO1k0cTsyjE/
         d+P3pB2IbzWlHroKOLQg3hWslzZ4lkxpjZvbIMEpu8Rnc7OIA5eD0BEuwalJqH9hIYrl
         wEhlVEKi+0q1Vjt+1q76Dv0idM0jkedKlRKE77L1L0jjwNcGuQdNBHiS5Mv2+cWv6mAq
         E5axj4Pos8knuVm4OpVXT75KlT6FK0/qTJrtJvzTORU4qJoOUKNNrZpxoKMr4IBZ6O3Z
         pfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778001560; x=1778606360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WL3Uj3kb7PrFoW/8XQQ00eIJvsOj+gpzAMtc380q7Qs=;
        b=spGuR2t/nqUb4mkozzu7Q+5/hycnN652vNSidFqFYSrS5Z1xccSCBo/EW72/cn/MPy
         /HpCFNu8YyHl//WQ1bGWyB3+V+oiO6PZdoTY8vj3ZPounKF4zid8VFVjCes5pdSXEcXm
         qLUsL8VPekWKB8Mq1FdbZPP6z8cX50OvhBMDanBx0Va4dP0djhD8+YdCUBnLQb7QaxP+
         tX4L6iMUBxb0Ia4qljNMfKyOOZ7J74nXp3oexRsj15Uxa5y7Mb+AaWqsdOyEVvRGax6c
         5qX/2mEjHswrVkHYZqIz2IRHpMwhPrp628pxc0NGJWBKfDW9ixbZygOfFDdcSk/gO+q+
         t/KQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XLFuuL54zM9/RQ4OcKSwrox5aNlBvPBY/9JJ7xPnOxD34gOJkxNFWXAIeTz43XitoeT9MxrEXCCdsK/aeRaGW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/JY/9/t4DSpSRtLruzB10Oawk1Rh+4ghpnSN6EuVo1bj4uXLC
	RT5YBIqlgu5HSX6StfaQ23YKQu1WoSYGwajOqV4r2FbGMm8wQAtLccyFFnpL/5b5yJ8=
X-Gm-Gg: AeBDietu/62HirlnJuPJjxsBVCYbQjdAl6PYXLQqKKi9fs0y9f4uTeiCyt/Yp/JSBCY
	tG3iGSnZLwKs5uB/Qzi0MmokqZrwumoCBUHo9G4wDYcCJVn3OJ6ub5qN1mNrZXUK6A28ZJI7cA6
	E8McGNR+hX3kCrnAuP2pPOPjL2x6Ara8mSxF8yT4qhuURn6xHR1yWc/3qviPHka8wktW05QnOZB
	2wXLPbkaBvo1PiQsotgm1+3NccSBccRiZP+qEl57qJJIxCNxU1VZvPyDkjD8JrlVjR4DIMt4FX0
	NpY17RaE+gny7js4vQBrh68qEu3ZQeEQZ1HjmVeV6eqwbuaUE+xrFZTjntzvBkgtaEBC6/2rxtT
	5H7JKYqYMYIbDsMUJqT8xJVbvuwbQE6DYgskq2je4FVTMGuEyGOHQ2Vo/f9Lm9oqsHmlRpzW4PD
	GltXPKbEsjZhnzbmxltmzZucrEfp7DN23VwlOTiNBuEluB5lgG
X-Received: by 2002:a05:6a00:61c2:b0:83a:3135:edbd with SMTP id d2e1a72fcca58-83a3135f266mr300178b3a.7.1778001559581;
        Tue, 05 May 2026 10:19:19 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7e49:16e6:42db:e391])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83962e7e3fcsm3646944b3a.0.2026.05.05.10.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:19:18 -0700 (PDT)
Date: Tue, 5 May 2026 11:19:15 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: "Padhi, Beleswar" <b-padhi@ti.com>, Shenwei Wang <shenwei.wang@nxp.com>,
	Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <afomkynW95IRIHYW@p14s>
References: <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
 <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s>
 <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
 <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_101921_514580_49D3AE92 
X-CRM114-Status: GOOD (  48.77  )
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

On Thu, Apr 30, 2026 at 09:35:09AM +0200, Arnaud POULIQUEN wrote:
> Hello,
> 
> On 4/29/26 21:20, Mathieu Poirier wrote:
> > On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
> > > 
> > > Hi Mathieu,
> > > 
> > > On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
> > > > On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
> > > > > 
> > > > > 
> > > > > > -----Original Message-----
> > > > > > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > > > Sent: Wednesday, April 29, 2026 10:42 AM
> > > > > > To: Shenwei Wang <shenwei.wang@nxp.com>
> > > > > > Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
> > > > > > Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > > > > > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > > > > > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > > > > > <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > > > > > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > > > > > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > > > > > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > > > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > > > > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > > > > > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> > > > > > imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> > > > > > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > > > > > On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> > > > > > > 
> > > > > > > > -----Original Message-----
> > > > > > > > From: Andrew Lunn <andrew@lunn.ch>
> > > > > > > > Sent: Monday, April 27, 2026 3:49 PM
> > > > > > > > To: Shenwei Wang <shenwei.wang@nxp.com>
> > > > > > > > Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> > > > > > > > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> > > > > > > > Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > > > > > > > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> > > > > > > > Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> > > > > > > > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> > > > > > > > Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > > > > > > > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > > > > > > > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> > > > > > > > Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > > > > > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > > > > > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > > > > > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > > > > > > dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> > > > > > > > <brgl@bgdev.pl>
> > > > > > > > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
> > > > > > > > GPIO driver
> > > > > > > > > > struct virtio_gpio_response {
> > > > > > > > > >           __u8 status;
> > > > > > > > > >           __u8 value;
> > > > > > > > > > };
> > > > > > > > > It is the same message format. Please see the message definition
> > > > > > > > (GET_DIRECTION) below:
> > > > > > > > 
> > > > > > > > > +   +-----+-----+-----+-----+-----+----+
> > > > > > > > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> > > > > > > > > +   | 1   | 2   |port |line | err | dir|
> > > > > > > > > +   +-----+-----+-----+-----+-----+----+
> > > > > > > > Sorry, but i don't see how two u8 vs six u8 are the same message format.
> > > > > > > > 
> > > > > > > Some changes to the message format are necessary.
> > > > > > > 
> > > > > > > Virtio uses two communication channels (virtqueues): one for requests and
> > > > > > replies, and a second one for events.
> > > > > > > In contrast, rpmsg provides only a single communication channel, so a
> > > > > > > type field is required to distinguish between different kinds of messages.
> > > > > > > 
> > > > > > > Since rpmsg replies and events share the same message format, an additional
> > > > > > line is introduced to handle both cases.
> > > > > > > Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
> > > > > > uniquely identify the target controller.
> > > > > > 
> > > > > > I have commented on this before - RPMSG is already providing multiplexing
> > > > > > capability by way of endpoints.  There is no need for a port field.  One endpoint,
> > > > > > one GPIO controller.
> > > > > > 
> > > > > You still need a way to let the remote side know which port the endpoint maps to, either
> > > > > by embedding the port information in the message (the current way), or by sending it
> > > > > separately.
> > > > > 
> > > > An endpoint is created with every namespace request.  There should be
> > > > one namespace request for every GPIO controller, which yields a unique
> > > > endpoint for each controller and eliminates the need for an extra
> > > > field to identify them.
> > > 
> > > 
> > > Right, but this can still be done by just having one namespace request.
> > > We can create new endpoints bound to an existing namespace/channel by
> > > invoking rpmsg_create_ept(). This is what I suggested here too:
> > > https://lore.kernel.org/all/29485742-6e49-482e-b73d-228295daaeec@ti.com/
> > > 
> > 
> > I will look at your suggestion (i.e link above) later this week or next week.
> > 
> > > My mental model looks like this for the complete picture:
> > > 
> > > 1. namespace/channel#1 = rpmsg-io
> > >      a. ept1 -> gpio-controller@1
> > >      b. ept2 -> gpio-controller@2
> > > 
> > 
> > I've asked for one endpoint per GPIO controller since the very
> > beginning.  I don't yet have a strong opinion on whether to use one
> > namespace request per GPIO controller or a single request that spins
> > off multiple endpoints.  I'll have to look at your link and reflect on
> > that.  Regardless of how we proceed on that front, multiplexing needs
> > to happen at the endpoint level rather than the packet level.  This is
> > the only way this work can move forward.
> > 
> 
> I would be more in favor of Mathieu’s proposal: “An endpoint is created with
> every namespace request.”
> 
> If the endpoint is created only on the Linux side, how do we match the Linux
> endpoint address with the local port field on the remote side?
> 
> With a multi-namespace approach, the namespace could be rpmsg-io-[addr],
> where [addr] corresponds to the GPIO controller address in the DT. This
> would:
> 
> - match the RPMsg probe with the DT,
> - provide a simple mapping between the port and the endpoint on both sides,
> - allow multiple endpoints on the remote side,
> - provide a simple discovery mechanism for remote capabilities.
>

This is exactly what I had in mind but I'll finish reading this thread before
expressing a final point of view.  That said, the namespace announcement should
be "rpmsg-gpio-[addr]" rather than "rpmsg-io-[addr]" to make sure there is no
ambiguity on the meaning of "io".

More comments to come...
 
> Regards,
> Arnaud
> 
> > > 2. namespace/channel#2 = rpmsg-i2c
> > >      a. ept1 -> i2c@1
> > >      b. ept2 -> i2c@2
> > >      c. ept3 -> i2c@3
> > > 
> > > etc...
> > > 
> > > This way device groups are isolated with each channel/namespace, and
> > > instances within each device groups are also respected with specific
> > > endpoints.
> > > 
> > > Thanks,
> > > Beleswar
> > > 
> > 
> 

