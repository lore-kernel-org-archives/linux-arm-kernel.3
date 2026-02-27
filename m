Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5009AFD9E26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 00:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DezwKPafh4uiqbk/gjEzFUtqzlwBbzlI4BmHc11dhE=; b=hr6DdAzVDy4uozaaR7bS9YHe10
	Jk/MUi9oEpeH18JJQyJFEDNHX3kkMf/4F/mTH0M4BneihUHE8mK0rY1pc8zvNJTgl2lHglQaXUMam
	TJTv0CrO0ffNvWd5njTy4FXuS7MnhMfaEg9cN5UlPtQq3r0SscKjIJuvIwYhkkupuVPOC4As3D1rq
	ODGyNCHgXZmNMNgVm3BCYQ/2n2sOqOBZzX+CHt+8SeikEdpWKwSGp9iar1X803/KDA9oD3HUHHA1z
	ApLxzvYdMKdc+YEMHzAjgA3q2to/FypqQQhZgnwmE/Sf7QI8nC7YxEqVYmvZnx8iTaodfd9p0Y6Wi
	QkwjYNuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvlHh-00000007Oyn-1RFD;
	Fri, 27 Feb 2026 00:00:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvlHg-00000007OyQ-1r1F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 00:00:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DD2D6012A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 00:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05585C19423
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 00:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772150443;
	bh=9DezwKPafh4uiqbk/gjEzFUtqzlwBbzlI4BmHc11dhE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=laueYUpuuYc+GxWvK+6ILshWte/ihb4gEMV5tn8EimGyWRJbCpY8dx/vP47+MjMyf
	 ZZTJ6DdinA6SMT84gvU7sNGo+VKSSR6mtYLODZL9sSQ6a23FFUXXy34e+wmf5TaovF
	 XKrKIAHiK1uv6C0KdrMjWcKTWNLHmVjV9QPZWQATjSUXFLYbrJGJWV/2dLCRenitK8
	 bxCyWB2Ho8IbADrr2cM+0TKxt6mcID7k42E6sTDD1Pn+XGC7u4SkbeItZyNmbo3vih
	 lyVwoqgWyLT1xDk20EITFGsewzbURcw9jot23Fi/2MW9MXmJBTrR2JL+Azovw8+T/Y
	 UNOtkcpcJPCNw==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79801df3e42so20345777b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 16:00:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/9Ex6MmQteit1uzlhnkcu7fmLPzi9L2Py8fdaBthVBAAICaSSetQre+iPzY6K8yIoa1d+7es5WORQ/x8KFF5j@lists.infradead.org
X-Gm-Message-State: AOJu0Yw97t1FpzIn1SrOSxGmesrh4fD2o7KBKD5bWjkghDbdwiyoSDHA
	oNslm2ohTxJbm7Gs/rsMbugHv3MV+lxSFHnxmXroOUF24n/Bps+PnP8wzWuVq/JTp3XV/cb3leg
	B0aawZ+QSZ2prhKg4q9R0Fte1k6U2HV0=
X-Received: by 2002:a05:690c:308a:b0:796:3e25:3e95 with SMTP id
 00721157ae682-79874d00f80mr36642507b3.18.1772150442330; Thu, 26 Feb 2026
 16:00:42 -0800 (PST)
MIME-Version: 1.0
References: <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com>
 <PAXPR04MB91851D3DA6A92669CB5926A18974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkw-8ERXy3v8Sv55Cpq=+41Toez3EjLMbENAkavvr8STeQ@mail.gmail.com>
 <PAXPR04MB9185B68BC640D940534E44098974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <d4c8f7dd-c0a8-4721-9750-47429637d8c1@lunn.ch> <PAXPR04MB9185BB6443B9E1E407F409D68974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <ndozoc6qdrpv3xuktumsah56im5rbtg6iwerq3xi2xkcuyewpx@szswqvojleg3>
 <AS8PR04MB917652D63DB090D22129D3D78975A@AS8PR04MB9176.eurprd04.prod.outlook.com>
 <2b72kkgwe5hio4uwrxj5oi72llkxhx7egw442fugq6unv7unah@5bfve7k3mvky>
 <PAXPR04MB918508A39832000D786E8F938975A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <l7vmhr5rg444pqp47x2k5ejamjnisx5rqwfmfr6m2tjazxpbm6@wq2vd4hcxco2>
In-Reply-To: <l7vmhr5rg444pqp47x2k5ejamjnisx5rqwfmfr6m2tjazxpbm6@wq2vd4hcxco2>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 01:00:31 +0100
X-Gmail-Original-Message-ID: <CAD++jLkTFHqQRgNeaOmEDOL7AEM8WLVKxU-ZpRyLuw3whOK2ug@mail.gmail.com>
X-Gm-Features: AaiRm53DnshMNxnGb5s2nvHBLr2HJwlmre0-C9Elu3HkLIEYq6Sfix20f-OwTTU
Message-ID: <CAD++jLkTFHqQRgNeaOmEDOL7AEM8WLVKxU-ZpRyLuw3whOK2ug@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Bjorn Andersson <andersson@kernel.org>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
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

On Wed, Feb 25, 2026 at 10:02=E2=80=AFPM Bjorn Andersson <andersson@kernel.=
org> wrote:

> > Thanks for the explanation. If I=E2=80=99m understanding correctly, wha=
t you=E2=80=99re suggesting is
> > essentially a driver that merges the roles of a virtio_driver and an rp=
msg_driver into a
> > single source file. There may be opportunities for a few function reuse=
, but overall it
> > would still result in a fairly distinct codebase.
> >
>
> Most of the non-boilerplate code in gpio-virtio would be impacted by
> differences between rpmsg and virtio. So combining the two
> implementations in a single source file would add complexity to an
> otherwise straightforward driver, only with trivial parts reused.
>
> My expectation is that it will be better to just have two separate
> drivers - but reuse all the design-work done in the gpio-virtio.

I agree with Bjorn.

If there is indeed code to be reused, just create a library
module .c/.o/.h file and export the symbols. modprobe will
bring it in, Kconfig will configure it in if compiled in. One or the
other or both modules can use that. We do this
all over the place.

Yours,
Linus Walleij

