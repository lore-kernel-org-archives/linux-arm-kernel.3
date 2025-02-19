Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C45C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 01:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkFhdB0sw0/QyG+CwpMOC58rxh7WXIHCwBFRv+IGTiY=; b=yBX5VHnsW7imYevr/o6K8qdW6u
	SJIx8GRo6h9B+2Ed5BUJJdsT78e4n7xlkEXg1MlNSWrkS2Y+vIPPiec9XdYlnwHGON+FDGPApk3lq
	yNC69kH6Kd8HUnsrjqG1eXJcgi5fgzybvZuwA+ELJPKv1jf9en+bEAuwJDo8vEbyw6vi47sxNeQgj
	CgfGnJQzKnPUWz4qYNus2TCeIjwqsqB/ooIsbEEyhEQYiv0HNqhZPNI4vQ24a4Gtbi/Y5T8pvM8Lv
	s860U9rDeP3RSFdDjflyo+Uy8bVkNFXIfbmk9vrdizkLy4CL4u2J7dkeaMbcMBVMTbMEDdL/jLSQV
	yvP70euA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYrW-0000000AWq0-3qZj;
	Wed, 19 Feb 2025 01:26:54 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYq3-0000000AWhp-1m29
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 01:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739928321;
	bh=dkFhdB0sw0/QyG+CwpMOC58rxh7WXIHCwBFRv+IGTiY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=avb2FyYTTBY0LlkaOkCWpVHdubriDy15YcVmzOXNlQiNvvVH4Edal4xm7c3TFeLde
	 caVsMWd0Y6xZbmPtPyQAIMN6ycCu92Xcth4M+4NFXk+EsV9VN7YJVYQkUqQkgmQhRU
	 Y0vm11gVt7B7X5KmbiK3eTG3nOGez8xNILAhcwg6LdXRToDky4FlSSQUbU43PPpRV/
	 r4cn6rq8yEU/tQoV1drbOEanUU0THtZFkx/WHZVt8C7ky5Ezx3LKZ6QFXm5lw3zPXu
	 rsC9l5oM5TKZMmRfK5nWOi1FzlwDH19cuBy955S20HlvKh9uAgIoPNCabIJZvGL1uE
	 r+E+cydkmu7KA==
Received: from [192.168.68.112] (203-173-1-6.dyn.iinet.net.au [203.173.1.6])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 41B3476191;
	Wed, 19 Feb 2025 09:25:19 +0800 (AWST)
Message-ID: <201b57c00043e2c3590c77a4d1aba413aa576b01.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting down
 logic
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Guenter Roeck <linux@roeck-us.net>, Heyi Guo
 <guoheyi@linux.alibaba.com>,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,  linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley
 <joel@jms.id.au>,  Eddie James <eajames@linux.ibm.com>
Date: Wed, 19 Feb 2025 11:55:19 +1030
In-Reply-To: <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
	 <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_172523_670097_DCD67074 
X-CRM114-Status: GOOD (  18.27  )
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

On Mon, 2025-02-17 at 21:33 -0800, Guenter Roeck wrote:
> On 2/17/25 19:16, Heyi Guo wrote:
> > Aspeed watchdog uses counting down logic, so the value set to register
> > should be the value of subtracting pretimeout from total timeout.
> >=20
> > Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
> >=20
> > Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
> >=20
> > Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Joel Stanley <joel@jms.id.au>
> > Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> > Cc: Eddie James <eajames@linux.ibm.com>
> > ---
> > =C2=A0 drivers/watchdog/aspeed_wdt.c | 7 +++++++
> > =C2=A0 1 file changed, 7 insertions(+)
> >=20
> > diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wd=
t.c
> > index b4773a6aaf8c..520d8aba12a5 100644
> > --- a/drivers/watchdog/aspeed_wdt.c
> > +++ b/drivers/watchdog/aspeed_wdt.c
> > @@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct watchd=
og_device *wdd,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 actual =3D pretimeo=
ut * WDT_RATE_1MHZ;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 s =3D wdt->cfg->irq=
_shift;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 m =3D wdt->cfg->irq=
_mask;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 reload =3D readl(wdt->ba=
se + WDT_RELOAD_VALUE);
> > +
>=20
> It is unusual to use a register value here and not the configured timeout
> value. I would have assumed that pretimeout is compared against wdt->timo=
ut,
> not against the register value, and that the multiplication with WDT_RATE=
_1MHZ
> is done after validation. This needs an explanation.

+1

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (actual >=3D reload)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> > +
>=20
> On top of that, you'll also need to explain why watchdog_pretimeout_inval=
id()
> and with it the validation in watchdog_set_pretimeout() does not work for=
 this
> watchdog and why this extra validation is necessary.

+1 as well.

Further, the logic looks broken regardless for the AST2400 where
there's no pretimeout support. aspeed_wdt_set_pretimeout() should error
out if wdt->cfg->irq_mask is 0.

Andrew


