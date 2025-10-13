Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D36CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 13:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2vv6Elqb0iIv4dJrDSGaSWX9dF6LnvkTkr6vnIRmSI=; b=Auz+OZoN6z2B+unUi0L9qqRgWR
	v4E1+BBlGkyPkybSY4JAUM36uO3JUirrkj00VcaoBJYCD5LcwnzDHSk+3PI4CNflTgzLlr4Z+ou+Z
	0ysrJbSQK90Mcxnb6GVCpOkWAHmqPw9yfy09Vp6uerfa7YMj3MxUVjkvhKoEjAwDeNcH4WPm4mMR/
	RQ3lqRJJt1nX4zg27VzGL6I3aZycAHfYGlS69WfOjoRTI2c3caEbnF/gN7WwDD5WAk/vhs8S/BvXg
	yyF6b+mebOxBaL/jes+x7/zAqJvScZ+8JP/iovLPJmH5nPmqvLU11Hd4LVHJwBZiNeL2oJMpSs2g8
	5fWVmBUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IgS-0000000DEZS-2u69;
	Mon, 13 Oct 2025 13:33:52 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IgQ-0000000DEYt-3aq8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 13:33:52 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-37612b15a53so44387301fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760362429; x=1760967229; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2vv6Elqb0iIv4dJrDSGaSWX9dF6LnvkTkr6vnIRmSI=;
        b=kR2c8B6s/75SvauF7FQQLAmeqk7niPgDeu+2pHJ7VpibbzTSZltC1RyqYD3oIog9Ji
         uho7jp+c1TBAr4oMjDR5s5ZZLPVoRliFoe7qX8tpzdXRhIqunVTyWv75KeLhzM4+N2g7
         S20c+0D1LjQAHwO/ND9Zzr4DUuCiHbeF029YZt8Io9gxx9XCzt7o9y2mv4mS0Loi+/fP
         unAta4mSWp5fKOSXDbOJMpCkGaTsLM4Wvtuq9aYsdkE9dvCGBcygs3leY3WTsKHuqzma
         e4JrUCYrpy4v9dSnvjVkAHMZakcMgBXDj7nQ6+k3mXXO6bJhjf1pVvInXFVS12gJx9+V
         r6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362429; x=1760967229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2vv6Elqb0iIv4dJrDSGaSWX9dF6LnvkTkr6vnIRmSI=;
        b=NBgWVzkLcRfM0nlIf4pZlZNeRRI9k6eEsolenwEoQTO3Vveueyjv9pKAOYDd8KowCw
         58ulCmeuEm45VP0EVBonTgbUQAxlGgqHNl0rVJ4XvrL5qRPi0kdoJ703zpoG36926FFM
         WeFWpoqJyQSO81N9TXRUuFTQA8SkEMm9oKFdzELjc5VjiNInoub6jcFP+JhA+E1OJ/ow
         H+lsckNpWD56otIjWqSgWm4LvyBuVsCRrjAKe8zqkw32J+H9AcEcrJkdXVmfqbGDSfME
         w5D9Al2Lkyzfu3WcU3LmRjwvLil+mgg7DzPoeZG+w+6KvEb8hAPnDxl6sYwB/hV8HDro
         rl3w==
X-Forwarded-Encrypted: i=1; AJvYcCV2MrFzHylQ4PXwyPxYeLxlyTO/B5ABBKGSuF6BYjvb63SGR3YKmmI+FjEfVZPGwM4/BxSgUkP0J9H5+b9aAe1/@lists.infradead.org
X-Gm-Message-State: AOJu0YxHrCIsoaD6cJPPgemjv7PI2OQPXXmSfeDqb5faI0Yls2LfEtid
	HL6PbiMMAceQQd+oQvEcHtNT88TwhW2p7sRu9AKIbKyCFzUW3f1CfMah5Qa3Hx1zlzQ95pjZzq+
	N4MSEHYuXYz4PkhduAUA/gZU4x6CUO6TJbH3HaJreug==
X-Gm-Gg: ASbGnctAIdPYHrq+RHuIqN2UpEGHzrSByF9BdRJY3cedJ8yeicKg26lVDFS1YqcYQvS
	zvPyqSFOSa8yoBBoWCns5+vqHoiQ9N5mjqVKri2FZCxdyOsmpWe5hHukAbRJdz5fiE7KTtt7Ov3
	n3ROxBNPcjwLUI/nPjcA58SK3IxXyR0pE1hbXgN0weWvQ69/AuGqDG+XK+whfwsGrBJC95xt6Pu
	3UHxcIAjnem1l62ssB/zTyV8763DArROVpTDZyD
X-Google-Smtp-Source: AGHT+IHgmK1HRnpsjGLKqPnG70DMAC1goUv3OwVcHtnyu/bV4k7lGHTS4AnKXk+tRstKPxroMpvqgq8QwqZeDkRf4ek=
X-Received: by 2002:a05:651c:1ca:b0:36b:8361:15c7 with SMTP id
 38308e7fff4ca-37609ee797dmr52547101fa.42.1760362428700; Mon, 13 Oct 2025
 06:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251009222716.394806-1-shenwei.wang@nxp.com> <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch> <aOk0y8xTi9hoGvyX@p14s>
In-Reply-To: <aOk0y8xTi9hoGvyX@p14s>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 15:33:36 +0200
X-Gm-Features: AS18NWBC-gdxliFCyTe38OsztEkF4HyZ8vB9ddnx1Arh4R638fPWDwBoKXMNGso
Message-ID: <CACRpkdaTp4SPj1DvJUD+ThBuQRrK+0ciVE0j92P9_c7EVvF0Jw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_063350_916433_832CCB3E 
X-CRM114-Status: GOOD (  23.40  )
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

On Fri, Oct 10, 2025 at 6:31=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
> On Fri, Oct 10, 2025 at 12:58:38AM +0200, Andrew Lunn wrote:
> > On Thu, Oct 09, 2025 at 05:27:15PM -0500, Shenwei Wang wrote:
> > > On i.MX SoCs, the system may include two processors:
> > >     - An MCU running an RTOS
> > >     - An MPU running Linux
> > >
> > > These processors communicate via the RPMSG protocol.
> > > The driver implements the standard GPIO interface, allowing
> > > the Linux side to control GPIO controllers which reside in
> > > the remote processor via RPMSG protocol.
> >
> > I've not seen the discussion on earlier versions of this patchset, so
> > i might be asking something already asked and answered. Sorry if i am.
> >
> > Is there anything IMX specific in here? This appears to be the first
> > RPMSG GPIO driver. Do we have the opportunity here to define a
> > protocol for all future RPMSG GPIO drivers, which any/all vendors
> > should follow, so we don't have lots of different implementations of
> > basically they same thing? So this would become gpio-rpmsg.c and a
> > Document somewhere describing the protocol?
> >
>
> I haven't looked at this patchset yet but I think Andrew's proposal has m=
erit.

Yeah this was my comment on v2 as well :D

I even posted a bug to the AMP mailing list to elicit some attention
from that camp. It worked because now Arnaud is on board reviewing
the patch set from an ST PoV.

Maybe it is possible to split the driver in one generic part and one
i.MX part, so it is easy to reuse for other SoCs?

Yours,
Linus Walleij

