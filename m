Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CC9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 01:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ynEPinVYg58vFFqJ9Y3/dS+93WPxCWeOZ+W7+imhK8=; b=FPEzgqcqduoThZhn5PC/GF+Y62
	oNFh70LokTHzGqIOyIGAkkqXkAW6EUrc6oh5jgNIXNWKQzqmYzB9wrqlY1glNnYqCI+EzSbWZmcwF
	4r8TQaKTP0Uuc9pFhIdolhf8lXWd7f4xIoKt8Dyp2E1IZqzSTp9iWLkl1/GGJPupb6MB6YIHV32UN
	cYJmoITJ2kMyNhfgvKfe5DNWwFNRCo+LSjGlqsBOCRCwataToRR7teK9KccRYdLVfEmEJiLADEB71
	b7AAbY0EYRgOBeFSsG9t87SvDe8nXxUL71NV/azLx+yLBKc8LvpRUZ2B/bZ5SdQw+pMm3U23kPvV4
	7GG76/Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOE7-00000009Pw0-2F8C;
	Thu, 13 Feb 2025 01:41:15 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOCg-00000009PgZ-1wYK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 01:39:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739410784;
	bh=7ynEPinVYg58vFFqJ9Y3/dS+93WPxCWeOZ+W7+imhK8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Fx7eib3XacDk4lxD4dnjY4m+ta1n7/2Jkt7TtBw5BZw5rUPmpssTEoG+roFoYDPvg
	 YGNwK+sEiNMwEAYVitnFnOjB9YGrbTA+FjTqjwgvZQHBDYWSIlOMnXzcERdzCJqPrm
	 U6H/QITP/jNkLuUV2C+PvrByCdd3hn86fqitcVUfr5K7FWaFe1GYp9YALBK9YStdux
	 iawfA8zq0tMjdDnjZBXoRyE0Ok0eacV8W+C7gLl4A6Bl6Mmsu8gARPYK61XeUBp+0H
	 3x0KZydeJ1OZQKFjDlLj6HWrKuRiAgp25OHG19g1vaHpGRY8a+7QQ82Lw5SDTWHRuU
	 QH0Cu94VW1lYg==
Received: from [192.168.68.112] (203-173-7-184.dyn.iinet.net.au [203.173.7.184])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 662197576E;
	Thu, 13 Feb 2025 09:39:43 +0800 (AWST)
Message-ID: <8e6c7913fda39baa50309886f9f945864301660f.camel@codeconstruct.com.au>
Subject: Re: [PATCH] soc: aspeed: Add NULL pointer check in
 aspeed_lpc_enable_snoop()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: joel@jms.id.au, richardcochran@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Thu, 13 Feb 2025 12:09:42 +1030
In-Reply-To: <CALGdzuoeYesmdRBG_QPW_rkFcX7v=0hsDr0iX3u5extEL5qYag@mail.gmail.com>
References: <20250212212556.2667-1-chenyuan0y@gmail.com>
	 <f649fc0f8491ab666b3c10f74e3dc18da6c20f0a.camel@codeconstruct.com.au>
	 <CALGdzuoeYesmdRBG_QPW_rkFcX7v=0hsDr0iX3u5extEL5qYag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_173946_707657_555BD287 
X-CRM114-Status: GOOD (  23.24  )
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

On Wed, 2025-02-12 at 19:37 -0600, Chenyuan Yang wrote:
> Hi Andrew,
>=20
> Thanks for your prompt reply!
>=20
> On Wed, Feb 12, 2025 at 6:21=E2=80=AFPM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > Hi Chenyuan,
> >=20
> > On Wed, 2025-02-12 at 15:25 -0600, Chenyuan Yang wrote:
> > > lpc_snoop->chan[channel].miscdev.name could be NULL, thus,
> > > a pointer check is added to prevent potential NULL pointer
> > > dereference.
> > > This is similar to the fix in commit 3027e7b15b02
> > > ("ice: FiI am cx some null pointer dereference issues in ice_ptp.c").
> > >=20
> > > This issue is found by our static analysis tool.
> > >=20
> > > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > > ---
> > > =C2=A0drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 ++
> > > =C2=A01 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > > b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > > index 9ab5ba9cf1d6..376b3a910797 100644
> > > --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > > +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > > @@ -200,6 +200,8 @@ static int aspeed_lpc_enable_snoop(struct
> > > aspeed_lpc_snoop *lpc_snoop,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lpc_snoop->chan[channel].m=
iscdev.minor =3D MISC_DYNAMIC_MINOR;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lpc_snoop->chan[channel].m=
iscdev.name =3D
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME,
> > > channel);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!lpc_snoop->chan[channel].m=
iscdev.name)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return -ENOMEM;
> >=20
> > This introduces yet another place where the driver leaks resources in
> > an error path (in this case, the channel kfifo). The misc device also
> > gets leaked later on. It would be nice to address those first so that
> > handling this error can take the appropriate cleanup path.
> >=20
> > Andrew
>=20
> It seems that the `aspeed_lpc_enable_snoop()` function originally does
> not have a cleanup path. For example, if `misc_register` fails, the
> function directly returns rc without performing any cleanup.
> Similarly, when the `channel` has its default value, the function
> simply returns -EINVAL.
>=20
> Given this, I am wondering whether it would be a good idea to
> introduce a cleanup path. If so, should we ensure cleanup for all
> possible exit points?

Yes please!

Thanks,

Andrew


