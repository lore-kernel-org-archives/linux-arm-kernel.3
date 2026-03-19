Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE97F1090220
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 13:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fa/Fief1P4zROqR9fX2RoLklMZ0ySyoencTReVNdA6I=; b=YHe3h0Zhue04esvetukuwNBvIf
	t8hqK1FQSwtR0bKXK1Nkqhou/POdvWJ6fm3qP3DySl7lYPD5jv7QQS8l6Ss8D6X9KKbjL3mNxIxaW
	+XI1um6lQZuYp0meZAPJyDmKPRZrHF4iU8CZKkK+IgKJ2C2N2LC76tScWemqf2Q5CQjHsLaVI/gdE
	eqWtUUnZyjlPKOKGuSpyNQn3QIOvSs4xkqQq2DjS1l4NE4rn2507qgqE9DqL+5FHekrutp5X1acHV
	ntIozku1b4xG2rhQ8w/iAheJSYJu02JpFHGnVpXzdWRSs1yNV/2UiIzgratlRfSn+qAnUnQq/0c1z
	xsja6xEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DfK-0000000AhpX-0qcM;
	Thu, 19 Mar 2026 13:43:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DfH-0000000AhpC-2KUD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 13:43:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECD2144562
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D269BC2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773927834;
	bh=Fa/Fief1P4zROqR9fX2RoLklMZ0ySyoencTReVNdA6I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cCFGMDx5K1bOQ7BdL9sehx8J+7gNGA1mui4U4C7+CnTeP7hPgFnJRB6VluFLH7aLn
	 W88iizUGBm5wR0MorSTWodICnOzQ69vW19M+4O90puv0h7NgZCdrDfstj2uvBfEhWE
	 mDktqNATNrhvwJSke4wCyic5Ke37hziIOoL+HlpDlh3uvly8DdjxccxCr6kqZVGeDv
	 1Vd+icQ3KEnBzMNhvSSMLBfNWQ/BBP0ifWubXfPcL3g1xUt39zL2mXgUAbjry9jI/b
	 MqT/Zw3VaQnk/LnIjgj9yqZS6siTR+Udqm1iGzU6EvNZ7qXRLj0H/lcU5KvhA2b0+u
	 9lZIhK6Onzniw==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79a610a32a6so11549787b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 06:43:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcWRNVtwiE1E+idji9FNrt3gHUo6UOc5Ij03+28Wh32E68T/7trY4EVMIttBfm232DDfrnGIwEGT/LhNiGAGJC@lists.infradead.org
X-Gm-Message-State: AOJu0YybwYbKltgY8Piypes2xrG2ywiZvvJdeGvXpd2m8qVucynWSrai
	FzMPPa+F1XmxXRHv4c7eLMmHu/2negJmdO+0K4iQ6otNoh9oXWpj+6xEgEHD1t59Z/YcBSt34vj
	cp8b0KLu5iQ4iENh0oMybThI++GxHrdg=
X-Received: by 2002:a05:690c:e694:20b0:79a:6d65:c351 with SMTP id
 00721157ae682-79a71be5f7dmr53076387b3.36.1773927833922; Thu, 19 Mar 2026
 06:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com> <CANLsYkyd8x29kz1u2dkyn_5hhWVJehz6VVKEx81Ew6i1nKObwg@mail.gmail.com>
In-Reply-To: <CANLsYkyd8x29kz1u2dkyn_5hhWVJehz6VVKEx81Ew6i1nKObwg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 14:43:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLnEGs57dRt0cv8cn6wPBQysUd55xXp2OKNv9pi=KJcYEA@mail.gmail.com>
X-Gm-Features: AaiRm51dQcDdZfF40DU8z4L0gvrWVXoJ8rq31Zd9UCtsSTES701kVKPMjzXNSzk
Message-ID: <CAD++jLnEGs57dRt0cv8cn6wPBQysUd55xXp2OKNv9pi=KJcYEA@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_064355_616358_289487DF 
X-CRM114-Status: GOOD (  13.23  )
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

On Mon, Mar 16, 2026 at 5:01=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
> [Adding Andrew Lunn]
>
> On Mon, 16 Mar 2026 at 08:23, Linus Walleij <linusw@kernel.org> wrote:
> >
> > Hi Shenwei,
> >
> > On Fri, Mar 13, 2026 at 8:58=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.=
com> wrote:
> >
> > > Support the remote devices on the remote processor via the RPMSG bus =
on
> > > i.MX platform.
> >
> > I think v12 looks pretty good, if Arnaud gives his ACK on this patch
> > series I think it's ripe for merge.
>
> Please wait until Andrew and I have provided our RBs before merging.

Fair enough, I think either you will all agree or none of you anyway.

Yours,
Linus Walleij

