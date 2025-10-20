Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB90CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 08:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJ1iu3qQhIz3Rj3mCvPCsfbK0AahgJl9A/vKcVA1tTU=; b=N8BxoOvP2HLt6LXRyxM0wt37rV
	+Ejvob45lqxGqGAiAlAYDxQW2xcnBj+BH7xsKXmzW72g4FB0T5kag5/E3PGk1eA3Yo/r7uNgI3mxf
	50PkCJLr432/OKSscRc74Coot9e1dDKxEfI4DWgx7DWG8BMBl7i91mCJBilAEwARlcyhxlS+utZU2
	lKccaZQRmxR4HmMF478fF4aXTQ8iXfY/3OXXXuqtJgipO2+7IzBKl78KFYG42vEUDDXv84RtWQ1vu
	GSoRPTipQ+uiXG791MPa8Qsj42kyX4iys1EOEnQ9T12ZQTV/LTc6Di+TKl78P36D0ckIPT0+/Pvqx
	R4TEh3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAkyA-0000000CJGq-069B;
	Mon, 20 Oct 2025 08:10:18 +0000
Received: from mx-relay31-hz2.antispameurope.com ([94.100.136.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAkxx-0000000CJCb-0xlr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 08:10:11 +0000
ARC-Authentication-Results: i=1; mx-gate31-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=SJ1iu3qQhIz3Rj3mCvPCsfbK0AahgJl9A/vKcVA1tTU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760947784;
 b=jp3qh4bIBQIdik/m7+8AgDd4n2xJyvzbGX9ctiaN7EvwmkukQ4JTs6LZzsWLQsxy0YlBW+Zt
 JBfhqUJ0csI3m+ar+51QkJSltNUjwW0dO//8eNBQnHUdaDel6NPGaCpmicGcCRZkFKthSYtwsDc
 hGQChSxnMbhEXo2XnT1U+zEVcmQm/XkAY6z1zyqjSJZa6qONMnF7ATGNr7iixIIDZsAvVXL2XdT
 97SRVOx30gZ49rc0CjtU4STMEJlT8x01UXDLz9ynE45u5SaA00tkIOph9Jeg71PCpvkw38cGahP
 QZpRYsOf1DEUiOk6t6jEFKSybnKYs/U4o9imHh42hffzA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760947784;
 b=OcE0o6NXT1CNJW862t//mjtEWn8XNM52BrmWk/F+Q27DgFjAPZl4yfc+Y36RxlpindMr46nn
 ZM5r56gzoxmJuCuuqs1bAW6/X1/nEtc9hM/3r+bL2Qch+4HUz7k2FNHwpnuDlTO+I4TjvBSm2Pq
 dyXpX0PSaSC0nkSutr2Ct+uggblynXZPaHVsIER2o/0weGW3KhgxUbPf3Y/VfY5OiC/l7npaPkL
 dNE/WdQ/LFpq5Bja2pz52iEi5lR3rU73F5NVN3+l5PTEniXajXw/bSYeUL5qJBalZ7Flrb+2Ufb
 Nw25iy7vwVKNEkH6OrWH4c/9leLMKa0F6/48K3RpY1pqA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay31-hz2.antispameurope.com;
 Mon, 20 Oct 2025 10:09:44 +0200
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id CCAA2A4118D;
	Mon, 20 Oct 2025 10:09:29 +0200 (CEST)
Message-ID: <7d3df04c482e71760ccc941469c99412b608c92b.camel@ew.tq-group.com>
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org,  imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Date: Mon, 20 Oct 2025 10:09:29 +0200
In-Reply-To: <cdkpp74ra2ltr7h46psutkwnzyvl4iegcicnhqqj7svm5trltm@w2egfj5nryjm>
References: <20251016113730.245341-1-matthias.schiffer@ew.tq-group.com>
	 <cdkpp74ra2ltr7h46psutkwnzyvl4iegcicnhqqj7svm5trltm@w2egfj5nryjm>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay31-hz2.antispameurope.com with 4cqp4B4MC2zGq5s
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 4274035f3daba9a9b82ce09d6a79390d
X-cloud-security: scantime:2.261
DKIM-Signature: a=rsa-sha256;
 bh=SJ1iu3qQhIz3Rj3mCvPCsfbK0AahgJl9A/vKcVA1tTU=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760947783; v=1;
 b=mCcfO1sTBsfpi1gfTBTumP5IGAHu6hLb/Feht0++fPesYBUJl5pgr/spd0KrhrkEyXbLgldO
 qjRrUkLjo+ybUNTmmQiTV8mjo1SOLbUgedf9elDz+zGbROVcGqD0T7i0Lumq8nUoKp6O5xVwRND
 SrOgamelXqY4uq/nFS8ozhsAi1vFVFsA2td3XgVc9Mr+hTW4ggLNBqwLSLZjkXkX/GPPXUNZ0RR
 buosH1LbFJYdLKgbyty/LVTY++k2L6Vr+iPwb75yQ5YqK9xgyVe47m1ZrXOtvVekEnVTpMeNl1S
 jSEoR1tywE64A5A0PiVRxSQcJFJiNE592DAYDMrQM4hSQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_011005_635901_B5154FB5 
X-CRM114-Status: GOOD (  48.60  )
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

On Fri, 2025-10-17 at 17:01 +0200, Uwe Kleine-K=C3=B6nig wrote:
> On Thu, Oct 16, 2025 at 01:37:30PM +0200, Matthias Schiffer wrote:
> > The CTS GPIO is only evaluated when the CRTSCTS termios flag is enabled=
;
> > it should be possible to enable the flag when only GPIO and no hardware=
-
> > controlled RTS/CTS are available. UCR2_IRTS is kept enabled in this cas=
e,
> > so the hardware CTS is ignored.
> >=20
> > Fixes: 58362d5be352 ("serial: imx: implement handshaking using gpios wi=
th the mctrl_gpio helper")
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
> >  drivers/tty/serial/imx.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> > index 500dfc009d03e..4a54a689a0603 100644
> > --- a/drivers/tty/serial/imx.c
> > +++ b/drivers/tty/serial/imx.c
> > @@ -1117,8 +1117,8 @@ static void imx_uart_set_mctrl(struct uart_port *=
port, unsigned int mctrl)
> >  			ucr2 |=3D UCR2_CTS;
> >  			/*
> >  			 * UCR2_IRTS is unset if and only if the port is
> > -			 * configured for CRTSCTS, so we use inverted UCR2_IRTS
> > -			 * to get the state to restore to.
> > +			 * configured for hardware-controlled CRTSCTS, so we use
> > +			 * inverted UCR2_IRTS to get the state to restore to.
> >  			 */
> >  			if (!(ucr2 & UCR2_IRTS))
> >  				ucr2 |=3D UCR2_CTSC;
> > @@ -1780,7 +1780,7 @@ imx_uart_set_termios(struct uart_port *port, stru=
ct ktermios *termios,
> >  	if ((termios->c_cflag & CSIZE) =3D=3D CS8)
> >  		ucr2 |=3D UCR2_WS;
> > =20
> > -	if (!sport->have_rtscts)
> > +	if (!sport->have_rtscts && !sport->have_rtsgpio)
> >  		termios->c_cflag &=3D ~CRTSCTS;
> > =20
> >  	if (port->rs485.flags & SER_RS485_ENABLED) {
>=20
> This hunk makes sense.
>=20
> > @@ -1794,7 +1794,7 @@ imx_uart_set_termios(struct uart_port *port, stru=
ct ktermios *termios,
> >  		else
> >  			imx_uart_rts_inactive(sport, &ucr2);
> > =20
> > -	} else if (termios->c_cflag & CRTSCTS) {
> > +	} else if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts) {
>=20
> I agree to add the parens here and consider this more readable than the
> alternative
>=20
> 	} else if (termios->c_cflag & CRTSCTS && sport->have_rtscts) {
>=20
> . Note there is no real win here. If the port doesn't have RTS/CTS it
> doesn't matter if it tries to control the RTS line. While you could
> argue it shouldn't set the line, it only makes an externally observable
> difference if one of the SoC's pads is muxed to its RTS function.
> I claim it's more robust in this case (i.e. no uart-has-rtscts property
> but a pinmux for the RTS line) to control the line according to the RTS
> setting. This is (at least IMO) better and more expected than driving
> this line to a constant level. So I oppose to this hunk.
>=20
> >  		/*
> >  		 * Only let receiver control RTS output if we were not requested
> >  		 * to have RTS inactive (which then should take precedence).
> > @@ -1803,7 +1803,7 @@ imx_uart_set_termios(struct uart_port *port, stru=
ct ktermios *termios,
> >  			ucr2 |=3D UCR2_CTSC;
> >  	}
> > =20
> > -	if (termios->c_cflag & CRTSCTS)
> > +	if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts)
> >  		ucr2 &=3D ~UCR2_IRTS;
> >  	if (termios->c_cflag & CSTOPB)
> >  		ucr2 |=3D UCR2_STPB;
>=20
> Hmm, not sure. On one hand the same argument applies as above, but on
> the other if there are pins that are not explicitly configured but still
> in their CTS function this might affect operation in a bad way.
> Also this affects the (very usual) configuration where only RX, TX and
> RTS are used and CTS is not. In this case have_rtscts is true (right?)
> and then if there is an accidental CTS pin this is bad and not fixed by
> your change. Hmmm...

I think it makes sense to always keep UCR2_IRTS set when have_rtscts is uns=
et,
as otherwise there might be two separate CTS signals in the accidental CTS =
pin
case - the hardware + the GPIO one, both affecting the UART operation.

If we keep this change (the 3rd), the 2nd should also be included for
consistency in the code path where I just changed a comment - there, UCR2_C=
TSC
is set only when UCR2_IRTS is unset. The 2nd and 3rd change together keep
imx_uart_set_mctrl and imx_uart_set_termios aligned.

>=20
> So in sum the 2nd and 3rd code change is controversial. If the first one
> already fixes the problem you're facing, I suggest to go for only that.
> If you still think that the 3rd (and maybe even the 2nd) change is a
> good idea, I'd request to do that in a separate commit as this is a
> separate problem. Also the commit log only describes the first change,
> doesn't it?

The commit message describes the first and third change; the second is incl=
uded
to keep the setup consistent. I don't think these changes can be separated =
well
- the second and third change only affect a case that couldn't occur withou=
t the
first (as (termios->c_cflag & CRTSCTS) && !sport->have_rtscts would never h=
ave
been true). My suggestion would be that I extend the commit message to expl=
ain
each change in detail.

Best,
Matthias


>=20
> Best regards
> Uwe

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

