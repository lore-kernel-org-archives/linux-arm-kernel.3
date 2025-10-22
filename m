Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F227CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DebWUerm1P3b92vVeQv2ZKMa4RczUkTUoAChT1TsvQ=; b=qticPA20PPkwokmg9jE0y7sW+G
	tnDGeyS5+B5VUDRlfdKpcLy7kxUHmfhN/JgY73QfBnUOm5+6Jm+dgHYgOHUdeEn3QTLyz6Zo37Kht
	C6ytWONrx3Y6k0BwebZICDrPM0T0sPq9HckDRZnsgCD+vApNvDrB7oOZ/fpaLi52/Iqp7M1yYpBad
	suHzA5CwxLUjW+xMMRtCgM5hGPjq28lz6Fuw30U78NX0jxONyfb6/Dh8rkZ2t5KlPjSnA8mtcqi2S
	Ww6dga/mCjZO52/ZujNGHNvbwBK+zpavGJN6e0cMY2uMbDp/SDDf7Pq0OuDvtSeQ14yt801yFQ9kQ
	odbxiTEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ1o-0000000326z-1GX2;
	Wed, 22 Oct 2025 13:37:24 +0000
Received: from mx-relay102-hz1.antispameurope.com ([94.100.133.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ1h-0000000324E-0MHR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:37:23 +0000
ARC-Authentication-Results: i=1; mx-gate102-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=1DebWUerm1P3b92vVeQv2ZKMa4RczUkTUoAChT1TsvQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761140224;
 b=jFwiBdDm1UVUKOtoxh1l5uAZ8yoZ9dbKwxVjlun/HTRxF/vJ5EzVfM2q6Cfo3HP2tI8Uq06s
 tsVMnpaNzdfjwfx79b9aFxurWypd1KdsrdG7ycU8OPSbdpuzEk031/CUKP3D0gIp+tfVsB4bafG
 Z2XJW4BoUl9Q+ISWifLU/eknVoltGug1t5PduvodINvFub5xAzbYmOt6OKP0iXxO9/sj3iozQ2A
 B9XU8LvYs9etqNtbwh0GFqz2oEp3/9dhbKvuLyxXpiL9PlZ7Cxort/0ZoI83pWqrLqQzCgPluWl
 Lw4jDJjsIylaxmensz6qRpfDa47so5tiGh5qbecWjkAvQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761140224;
 b=VzC4Jy4KTUZV+nzJiFarZqK5wuZLRe5yRvtJdO/ua4KgOV7pGL2zNyWI1ujH4UavuQzDPOPo
 95/fml5mHuj8vvPOBjDaby2woQYWwLl7j4RPmdjMjVTTXROZmu8YrI8FkIFFUGKR/QaIu9bKa8k
 IdnTUWg0/lmImPb84mKTb5qQnaU6BpjQrIO2l3bQdWszhoR5Ljo0sTs3Ii2oM1i12MOYAzER0nd
 axE1/KJZj47VFlCGA4trXcg6L7fgF0BYU2KZW9nPtEf1kdFwj+nIdigEc6bTDeeBXcuJ0g38qNy
 SV0CwjiEYGQyWSUohfLavjfFMfRP8c8yqT7shhfpuz9CQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay102-hz1.antispameurope.com;
 Wed, 22 Oct 2025 15:37:04 +0200
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 14121220C57;
	Wed, 22 Oct 2025 15:36:52 +0200 (CEST)
Message-ID: <d46d07858a3b5cc9134e17509617901e2215122f.camel@ew.tq-group.com>
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org,  imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Date: Wed, 22 Oct 2025 15:36:51 +0200
In-Reply-To: <1963351b2e50c537418293e6ab9293576a239c98.camel@ew.tq-group.com>
References: <20251016113730.245341-1-matthias.schiffer@ew.tq-group.com>
	 <cdkpp74ra2ltr7h46psutkwnzyvl4iegcicnhqqj7svm5trltm@w2egfj5nryjm>
	 <7d3df04c482e71760ccc941469c99412b608c92b.camel@ew.tq-group.com>
	 <lgse44as4k6fpzarztfnfl7wbxq2bfg5k7m7l6xlsyx23pmem4@khal3tytgwjn>
	 <1963351b2e50c537418293e6ab9293576a239c98.camel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-cloud-security-sender: matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay102-hz1.antispameurope.com with 4cs9F04rnBz1H2R
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 2922bd59ae7bb4f5e6d1e8192f878683
X-cloud-security: scantime:1.834
DKIM-Signature: a=rsa-sha256;
 bh=1DebWUerm1P3b92vVeQv2ZKMa4RczUkTUoAChT1TsvQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761140223; v=1;
 b=m49Qdl66HF7t1CnNcgtX+bRJxh05uS0hOt9rigmlqeUyziwdZ+XwLpbMR/Z/fg+Lj2Y0CB2Q
 mPlPce0i+OS7Lvx6wed7Mg3HCbNZ7PlS5dSjw6vCuXsxIMBcZKwFnJPupUiAhBwEm68xqgHerwy
 4QyggtvPyhhdxfGv0FSMxVT1nRga+XGmJDV6rqGcAEuo/ZIBsAs+N/LtFzlrkK7QHlAYzvERa+b
 FpV16VaIbMDI/1LL4G030u6havwPIIjr0Fi7SLQvLt2qybCx7HAId7ZvqJhI5ZumGpFyPLNIJ+h
 5B8clfe3v6YdmzZY9vyIFbsPWt659IsUkwR1R1FhD+Uxw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_063717_476045_854ADB6D 
X-CRM114-Status: GOOD (  67.48  )
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

On Tue, 2025-10-21 at 11:37 +0200, Matthias Schiffer wrote:
> On Tue, 2025-10-21 at 10:59 +0200, Uwe Kleine-K=C3=B6nig wrote:
> > Hello Matthias,
> >=20
> > On Mon, Oct 20, 2025 at 10:09:29AM +0200, Matthias Schiffer wrote:
> > > On Fri, 2025-10-17 at 17:01 +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > > On Thu, Oct 16, 2025 at 01:37:30PM +0200, Matthias Schiffer wrote:
> > > > > The CTS GPIO is only evaluated when the CRTSCTS termios flag is e=
nabled;
> > > > > it should be possible to enable the flag when only GPIO and no ha=
rdware-
> > > > > controlled RTS/CTS are available. UCR2_IRTS is kept enabled in th=
is case,
> > > > > so the hardware CTS is ignored.
> > > > >=20
> > > > > Fixes: 58362d5be352 ("serial: imx: implement handshaking using gp=
ios with the mctrl_gpio helper")
> > > > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.c=
om>
> > > > > ---
> > > > >  drivers/tty/serial/imx.c | 10 +++++-----
> > > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> > > > > index 500dfc009d03e..4a54a689a0603 100644
> > > > > --- a/drivers/tty/serial/imx.c
> > > > > +++ b/drivers/tty/serial/imx.c
> > > > > @@ -1117,8 +1117,8 @@ static void imx_uart_set_mctrl(struct uart_=
port *port, unsigned int mctrl)
> > > > >  			ucr2 |=3D UCR2_CTS;
> > > > >  			/*
> > > > >  			 * UCR2_IRTS is unset if and only if the port is
> > > > > -			 * configured for CRTSCTS, so we use inverted UCR2_IRTS
> > > > > -			 * to get the state to restore to.
> > > > > +			 * configured for hardware-controlled CRTSCTS, so we use
> > > > > +			 * inverted UCR2_IRTS to get the state to restore to.
> > > > >  			 */
> > > > >  			if (!(ucr2 & UCR2_IRTS))
> > > > >  				ucr2 |=3D UCR2_CTSC;
> > > > > @@ -1780,7 +1780,7 @@ imx_uart_set_termios(struct uart_port *port=
, struct ktermios *termios,
> > > > >  	if ((termios->c_cflag & CSIZE) =3D=3D CS8)
> > > > >  		ucr2 |=3D UCR2_WS;
> > > > > =20
> > > > > -	if (!sport->have_rtscts)
> > > > > +	if (!sport->have_rtscts && !sport->have_rtsgpio)
> > > > >  		termios->c_cflag &=3D ~CRTSCTS;
> > > > > =20
> > > > >  	if (port->rs485.flags & SER_RS485_ENABLED) {
> > > >=20
> > > > This hunk makes sense.
> > > >=20
> > > > > @@ -1794,7 +1794,7 @@ imx_uart_set_termios(struct uart_port *port=
, struct ktermios *termios,
> > > > >  		else
> > > > >  			imx_uart_rts_inactive(sport, &ucr2);
> > > > > =20
> > > > > -	} else if (termios->c_cflag & CRTSCTS) {
> > > > > +	} else if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts) =
{
> > > >=20
> > > > I agree to add the parens here and consider this more readable than=
 the
> > > > alternative
> > > >=20
> > > > 	} else if (termios->c_cflag & CRTSCTS && sport->have_rtscts) {
> > > >=20
> > > > . Note there is no real win here. If the port doesn't have RTS/CTS =
it
> > > > doesn't matter if it tries to control the RTS line. While you could
> > > > argue it shouldn't set the line, it only makes an externally observ=
able
> > > > difference if one of the SoC's pads is muxed to its RTS function.
> > > > I claim it's more robust in this case (i.e. no uart-has-rtscts prop=
erty
> > > > but a pinmux for the RTS line) to control the line according to the=
 RTS
> > > > setting. This is (at least IMO) better and more expected than drivi=
ng
> > > > this line to a constant level. So I oppose to this hunk.
> > > >=20
> > > > >  		/*
> > > > >  		 * Only let receiver control RTS output if we were not request=
ed
> > > > >  		 * to have RTS inactive (which then should take precedence).
> > > > > @@ -1803,7 +1803,7 @@ imx_uart_set_termios(struct uart_port *port=
, struct ktermios *termios,
> > > > >  			ucr2 |=3D UCR2_CTSC;
> > > > >  	}
> > > > > =20
> > > > > -	if (termios->c_cflag & CRTSCTS)
> > > > > +	if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts)
> > > > >  		ucr2 &=3D ~UCR2_IRTS;
> > > > >  	if (termios->c_cflag & CSTOPB)
> > > > >  		ucr2 |=3D UCR2_STPB;
> > > >=20
> > > > Hmm, not sure. On one hand the same argument applies as above, but =
on
> > > > the other if there are pins that are not explicitly configured but =
still
> > > > in their CTS function this might affect operation in a bad way.
> > > > Also this affects the (very usual) configuration where only RX, TX =
and
> > > > RTS are used and CTS is not. In this case have_rtscts is true (righ=
t?)
> > > > and then if there is an accidental CTS pin this is bad and not fixe=
d by
> > > > your change. Hmmm...
> > >=20
> > > I think it makes sense to always keep UCR2_IRTS set when have_rtscts =
is unset,
> > > as otherwise there might be two separate CTS signals in the accidenta=
l CTS pin
> > > case - the hardware + the GPIO one, both affecting the UART operation=
.
> >=20
> > With that change you break setups that have an RTS-GPIO but rely on the
> > HW pin for the CTS function. Not sure how common that is, but in this
> > case you only want the first code change. You could argue that in that
> > case have_rtscts should be set, but that's somewhat fuzzy.
>=20
> Such a setup should set have_rtscts IMO. In any case, my patch would not =
break
> existing setups, as the CRTSCTS flag simply cannot be set for !have_rtsct=
s
> without these changes.
>=20
> >=20
> > > If we keep this change (the 3rd), the 2nd should also be included for
> > > consistency in the code path where I just changed a comment - there, =
UCR2_CTSC
> > > is set only when UCR2_IRTS is unset. The 2nd and 3rd change together =
keep
> > > imx_uart_set_mctrl and imx_uart_set_termios aligned.
> > >=20
> > > >=20
> > > > So in sum the 2nd and 3rd code change is controversial. If the firs=
t one
> > > > already fixes the problem you're facing, I suggest to go for only t=
hat.
> > > > If you still think that the 3rd (and maybe even the 2nd) change is =
a
> > > > good idea, I'd request to do that in a separate commit as this is a
> > > > separate problem. Also the commit log only describes the first chan=
ge,
> > > > doesn't it?
> > >=20
> > > The commit message describes the first and third change; the second i=
s included
> > > to keep the setup consistent. I don't think these changes can be sepa=
rated well
> > > - the second and third change only affect a case that couldn't occur =
without the
> > > first (as (termios->c_cflag & CRTSCTS) && !sport->have_rtscts would n=
ever have
> > > been true). My suggestion would be that I extend the commit message t=
o explain
> > > each change in detail.
> >=20
> > I'd still request to split the patch in at least two patches. The first
> > code change is to allow rts-gpios to work at all. The two later patches
> > change details about how HW pins are controlled in the presence of
> > rts-gpios
>=20
> Okay, will do.

Hmm, thinking about this again, I'm not sure how to assign Fixes tags if we=
 do
it like this. Depending on our decision on the correct handling of hardware=
-
controlled RTS/CTS in the presence of the GPIOs, the first patch might intr=
oduce
"wrong" code which is then fixed by the second (but the second patch could =
not
have a Fixes tag for the first patch of the same series).

As it seems preferable not to introduce the wrong code in the first place, =
I
would propose to change the order of patches: The first one would update th=
e
handling of CTSC and IRTS with CRTSCTS in the absence of have_rtscts (witho=
ut
functional change, as CRTSCTS can't be set without have_rtscts), with the f=
inal
patch of the series allowing CRTSCTS with just have_rtsgpio.

Best,
Matthias

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

