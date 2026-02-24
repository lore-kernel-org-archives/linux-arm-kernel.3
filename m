Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272A2F4BB6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 18:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkhJvVlHP2HM21UJR495PsQ26BfaGB2+8QVHbNSzt78=; b=Ub1/C5/oI6tfCy4rnNCHnosioP
	xQfciMg5dSWs96qJ5iIiRrl2EyIozsfHB0Mc/XuQv4SZ5XIy2PHIMg78/a888uYnqi6dvD79TbHAy
	b1ts3vGZlEdbvc0h+9Ey9j/AWW9ViRGqtNrHnr4wpcNEhB8Ktj4FxCpL5ps+4RFdc09irINg+hQvm
	LKz7fbDOCdM5DXwP8IFV18IgBmtC8CGIC47mf8jt09SYNogaKb0zHNnT59htiMVohy6/DzgekhDDA
	ttSkbKw2OVYiI1duup2yfHP19Ps0xB37mxt9MtIXH3KlzUfRV5OiGdvcdsf8nSzPL36cTyPrETSL7
	yoWv1PDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwqw-00000002bc1-1cQe;
	Tue, 24 Feb 2026 18:09:46 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwqt-00000002bbV-3v6u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 18:09:45 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-65f812e0d93so259353a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 10:09:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771956581; cv=none;
        d=google.com; s=arc-20240605;
        b=LxZzJyxnYktm956rHjszVKtfzHloSzbRh4U1ZqG6QlKEDHb1ICQbCMOGoMZO6MY8qu
         BmDZmKHTIp3Ov5lm6jQwz7mLJotpipZkUsgBNNV/HMEoX+8r1ybFm/KPIxfvmJWgDYZ9
         bzCjsQfhjMwk4r+GT8h7+tIJF0H4GO3oDxBzV9hqcrTCTXjMfmR4+vU/EWUMdW+zX1Nb
         LD3ftLDC13rnLrHONROmMJDJfsMHKEjj5bS/VVd/vg/H5N4QLmz9Ec75R5Ayh58rKQna
         aPIWx+NiQy/4vK/mqmnl+FOlXEunDspY26JF/Vb7rbkE0AH2UMlUnLEdTvYQ3Me37fTN
         cyrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WkhJvVlHP2HM21UJR495PsQ26BfaGB2+8QVHbNSzt78=;
        fh=PCk03srSeLAPYfTgwcCZEOrF/5pZcpHnMDSP7OGsfdM=;
        b=iBa/056ITSM1Y0ZVDSJuRdOSq8HfTT1VxVVtU+B8jGEJW1ySS2OVYJUZ+xTK1KjDlc
         r1/2xthbU7DUltVGLz8zLAbrW1NpjP6aFQMDr8leA4jaIWZgtFb21sGzhiDj681Wg4n8
         dcOlhc8n+LUk0E2/2WXWmv7Z5VAM9Nv3LO6y/qqpKkJvozJ4cumT3wtqZmE/84y+kFlt
         akx0aoZjWVHeyMdTFrkgHHNjyjRgGo55kuNOotxwLZeTVa/9kwL1PzTHv3VqhIROV3P0
         2F9GZvOiStmBb4/kQj4NZ0EKJwgs9SBJPYImYudsEQeEiPLeci7tcMZr/tdoQ0HyB7Hb
         T+Zg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771956581; x=1772561381; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkhJvVlHP2HM21UJR495PsQ26BfaGB2+8QVHbNSzt78=;
        b=y03M8XBH9ordpms4iaeUYPrEeIyfRn+6pP1oYVvxgwARYP90rLryw5PFlsAkYayQ7J
         zTHFcuRa1QYaS5s5pnVVWH54fHeS6wrZR/9IwiLDUT8JIgwuEgF9TNk/pU8sjitZXjP4
         ge1hiTDfCk6fy2j9BLUm47w3A0TYFN46x1TnPO4KIB6XVz7sVi7RS9XK+55iYBrR9Fdx
         2SHgSf9EI/aJ0Yv1BstEDFVHqxbn6+88hLJ/ocimnrXxUPQ36Bs7yIxj+XU5kF1euGoJ
         y1NP8uJC372XkGs7LZR+8TIAryWby/xqiV5/V1g9EhBmClvzjtH8fNGWja9RZxeINVeb
         dK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956581; x=1772561381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WkhJvVlHP2HM21UJR495PsQ26BfaGB2+8QVHbNSzt78=;
        b=r5VQDYHL6qJv7sy563aV/PIHd4B+m7uLMVLvo4FzfGXY0vgjVGhdKJtmqeyQpo6MDH
         iAqeKlD1jArhWIUiY5gsIBcJD7PZD0FMbvS3mphz3f2OQFqX1jP8ZePsqNnqvhuN1c0m
         hjRBFTNGb99l5GQS56vCTn14qoUNBbam6alHpkqJqRBa737T2yQx0UcVj8IOtCQPmm5X
         QtUEuPy39hhOIyrFWvDJV7HfmevAUVy3WuWfDKTUZoNIe/wNlccHIml/mZk3GTqi6ob7
         XuWqQOIXCVxRpT9z7rrw55rMVVr1nJWUYL6gM8E6RuS09Avh+ByRSzIhRJxSDWF/4yHt
         T2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8S6QKoKjVtDXyI1vRVmQ4aURAkMNF5U/y91U9CmOVNTZeR3zry1VrqMJg0ldeqfvG86BKdgwXszlOdzfm5U+9@lists.infradead.org
X-Gm-Message-State: AOJu0YzclpM6dd6s5wifMHIYxufMb7Fje3vL3IATt5e7/e6tuUL5Rtq9
	4MiyLe7cOdcdpyrIis3f88GCbPSMWtQcBUDbDJ+9GzE75Lwmu+ay4QwnjUUpMA5LtmxGEvSwXqo
	0Q4LJa6n+R6040wN8rlxeRg98tRU/GgRL5BhpIRkgcw==
X-Gm-Gg: ATEYQzwIyoEOgMpKsEUVnO2Vzdus/sMbd1fYk3U1QZkEzJEMP7YZsXmPuj6fXRrJBmM
	RHvt7cLFtkHynyNjWc5ZtVpV7kY04VygTdJ1jD06oDzeeXTIxQuRVc7uJhJZjHBvanyg4oBsjr2
	bMo1q/7UyIg1vyrgWChqmFTVlovyVjEJnMpuirkvASPzH2DdPLD9XBy1LKCrj2+w8gX3X6kRIEd
	D1TNA3tpRkx1qOkgMYflLbHdOnraE7sWl+5cEwnlreo2mhKJtzOOQSL4Fnx94N34yPJ3w83wrfo
	enEO9q4iDMPxT0oS+XhiHM4WTqnXkFaFlEI25eveOA==
X-Received: by 2002:a05:6402:460c:b0:65f:7498:389d with SMTP id
 4fb4d7f45d1cf-65f74983abfmr1106639a12.10.1771956581270; Tue, 24 Feb 2026
 10:09:41 -0800 (PST)
MIME-Version: 1.0
References: <20260212213656.662437-4-shenwei.wang@nxp.com> <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch> <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch> <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch> <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com> <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 24 Feb 2026 11:09:30 -0700
X-Gm-Features: AaiRm513jfkXhWCicXSxk8RHd0EwNINnculQUiIBSoqo4oda2oGf6hKMPIXU_e0
Message-ID: <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_100944_019445_2FB66D72 
X-CRM114-Status: GOOD (  39.37  )
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

On Tue, 24 Feb 2026 at 08:56, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Bjorn Andersson <andersson@kernel.org>
> > Sent: Monday, February 23, 2026 8:43 AM
> > To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Shenwei Wang
> > <shenwei.wang@nxp.com>; Andrew Lunn <andrew@lunn.ch>; Bartosz
> > Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob He=
rring
> > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dool=
ey
> > <conor+dt@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Fr=
ank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO d=
river
> > On Mon, Feb 23, 2026 at 03:24:43PM +0100, Arnaud POULIQUEN wrote:
> > > On 2/22/26 15:48, Linus Walleij wrote:
> > > > On Fri, Feb 20, 2026 at 7:57=E2=80=AFPM Shenwei Wang <shenwei.wang@=
nxp.com>
> > wrote:
> > [..]
> > > >
> > > > Is it generic? If it is not, let's call it "NXP rpmsg GPIO driver"
> > > > and rename files etc accordingly. Maybe it can share code with the
> > > > actual generic RPMSG driver once that arrives, that is more of a li=
brary
> > question.
> > >
> > > I would like to (re)express my concerns regarding the creation of an
> > > NXP-specific driver. To clarify my concerns, ST, like probably some
> > > other SoC vendors, has rpmsg-gpio and rpmsg-i2c drivers in downstream
> > > with plans to upstream them.
> > >
> > > If we proceed in this direction:
> > >
> > > -Any vendor wishing to upstream an rpmsg-gpio driver might submit
> > > their own platform-specific version.
> > >
> > > - If NXP upstreams other rpmsg drivers, these will likely remain
> > > NXP-centric to maintain compatibility with their legacy firmware and
> > > the nxp-rpmsg-gpio driver, leading to platform-specific versions in s=
everal
> > frameworks.
> > >
> > > - The implementation will impact not only the Linux side but also the
> > > remote side. Indeed, some operating systems like Zephyr or NuttX
> > > implement the rpmsg device side (Zephyr already implements the
> > > rpmsg-tty)
> > >
> > > Maintaining a generic approach for RPMsg, similar to what is done for
> > > Virtio, seems to me a more reliable solution, even though it may
> > > induce some downstream costs (ST would also need to break
> > > compatibility with legacy ST remote proc firmware).
> > >
> >
> > Could the virtio-based mechanism be used directly (without rpmsg)?
> >
>
> Technically, yes=E2=80=94it's possible to use the virtio mechanism direct=
ly without rpmsg.
> It=E2=80=99s a bit like talking straight to the IP layer without involvin=
g TCP or UDP: doable, but
> at a lower=E2=80=91level approach.
>
> As for the idea of gpio=E2=80=91virtio, which could be an optional soluti=
on that certain customers
> might prefer. I recall hearing this idea from Mathieu originally, though =
I=E2=80=99m not sure whether
> he plans to implement it.
>

As Daniel pointed out, gpio-virtio is already available and already
includes a protocol that is generic - no need to redefine a new one as
this set is trying to.

As mentioned in a previous email, I understand some implementations
will have restricted memory and need to use RPMSG.  For those cases a
generic rpmsg-gpio protocol should be derived from gpio-virtio that
would only deal with breaking down the standard gpio-virtio protocol
into something digestible by RPMSG.  That was Bjorn's point in an
earlier message.  This will allow to use the same interface and be
flexible in how we want to talk to the transport medium, i.e pure
gpio-virtio or rpmsg-gpio.

Fortunately RPMSG already uses channels to differentiate between
traffic, no need to multiplex everything on the same channel.  That
too needs to go.

> As the chip vendor, NXP=E2=80=99s role is to provide all possible options=
 and let customers choose
> the approach that best fits their needs; we don=E2=80=99t make that decis=
ion for them.

As kernel maintainers, our role is to advise on designs that are
generic, simple, maintainable and stand the test of time.

>
> Thanks,
> Shenwei
>
> >
> > If not, it would be good to derive a generic rpmsg-gpio protocol from t=
he virtio
> > protocol, and land implementations of this in e.g. Linux and Zephyr to =
establish
> > that option.
> >
> > Regards,
> > Bjorn
> >
> > >
> > > In the end, I am just trying to influence the direction for RPMsg, bu=
t
> > > based on the discussions in this thread, it seems others share simila=
r
> > > expectations, which should probably be taken into account as well.
> > >
> > > Thanks and Regards,
> > > Arnaud
> > >
> > >
> > > I just want to
> > >
> > > >
> > > > Yours,
> > > > Linus Walleij
> > >

