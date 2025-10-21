Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C759ECCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9zmwlits19MWVeZiMnlveUvVwY/OpDAaLlQOnMopBQ=; b=bGgae4KctuaV0xRBwPYZ+Z3vVX
	JT+x0+uFlYymiyGFVQHiC77gb8AMc1tVy6Q7o9rhwFw0AfrwvUbsPE6nCWF/ZbakvcmIcl3Mmwi7R
	VUn1UK0ImWxSt9c0bn1H4LQPnMtzy0/tyVdKocbaP7c4wOqFKtRJQyN5R2ELLTcUWctN6xPB++ira
	1FY3EPdc0Ip+Hj955c/yjHCNXEqgPlcF/Wx6pTAOymiTp5DCZSOC4q4EjWIlDL1fBvDCcyHFd8+iG
	Tdu0O0+CxePYQSzR/ov5vj3rJw99oNwJkx3LLkVdTttvwwim+6IUVmI+dp0wybscE0UJt+8diy2LT
	xFLp3Ssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8pe-0000000GTr4-3YzY;
	Tue, 21 Oct 2025 09:39:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8pc-0000000GTqP-3fJ4
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Oct 2025 09:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=i9zmwlits19MWVeZiMnlveUvVwY/OpDAaLlQOnMopBQ=; b=PkDFUKFbh2zS5CFmZ2La8+Zouz
	7y2QXQTGd6ZarLB6Bkun2DIOUpG6OavK/AxUroM448sCiosF9anKWAxgfTfigHfXX7T+rjVsZnLUL
	cDU6EZATTw+W62VIus/CpTuBHz9eRIz/kgHFY3FTOrmtbxSSkNp4QehflGERAvor62n6jaMM1i+8J
	0kyV93KkZDbpxUFRXpjGnLhjcYY5qFkCcbFJoEY7nQcZ85Y+pbi00LSkfWMLLVCNEjdiQvoQ9czH9
	w6tiCgdg+E1GP7iZBd9mvsPchL2OURpVrEd6Uhf1WOXNj0WDlIXozp7upA+h9z4sKog2OJKOx3T/f
	ae1TvRBg==;
Received: from mx-relay03-hz1.antispameurope.com ([94.100.132.203])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7xo-00000000dJ8-0uYj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 08:43:34 +0000
ARC-Authentication-Results: i=1; mx-gate03-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=i9zmwlits19MWVeZiMnlveUvVwY/OpDAaLlQOnMopBQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761039499;
 b=Z1nVjp0Uyc83DJngcAzInxfUxBVCVjB2u/9P9Hbf2Iss0fj3sX5S7AMijJJhYYGXhxWbe2Sb
 fQWnyxguH3D0BNczGz6nmh9nXNumLVoQtsHPDSaHY+vqN7bYrrfyHgsaP3pyCw3qQsaCEKPfoXG
 Ilw+EeASBXkxHR7LLO8/yZAGOD5M8Qz3C65d5dP3WXDERYfvL1jPWIoxQo2wK4UtFhzWYtBch3t
 o+M81ysWBpQWDVCweMrQeSnq1qPV6zvMVwEY91MXY/JmRn71+Rby6tYp/pa5bdkdeMuQjF5CZkd
 c4MVKA8loPJCl/C8uDm8U5YC6ESWPmwLiH+4lvcRG1gYg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761039499;
 b=Ig4wSkuGC6XL6FS6Bo4UEJVmp5Sx4JAC1w1QHTUgChnyJjlTsVw+um2K0uNNiz0gqd8A3lFT
 3dDTJWM4sUIWb4+BREZo7GllLLjAGUR/cnuEDaDAZxv2dq0oNT0Na1/K8IMcCeCJCr+6iR69F3N
 rSrFr0T4B72RYKx3LabGmX/IP2AgiJndWtrLMs33COJF4um7F9ICa6+d53yWyePNIf6IrWsQm5a
 0WfnUUyZTBSrQSPjb88qF7WKWG8nzpOnnvNPt4O0z7nvncv2LGK0mq796a+PuIGXtB4/9VOnzCm
 luZr9dWIvkyz98/rtX6yvs4wSkQPS44QsLXwnsynInuLg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay03-hz1.antispameurope.com;
 Tue, 21 Oct 2025 11:38:19 +0200
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 11E9CA41274;
	Tue, 21 Oct 2025 11:37:38 +0200 (CEST)
Message-ID: <1963351b2e50c537418293e6ab9293576a239c98.camel@ew.tq-group.com>
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org,  imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Date: Tue, 21 Oct 2025 11:37:37 +0200
In-Reply-To: <lgse44as4k6fpzarztfnfl7wbxq2bfg5k7m7l6xlsyx23pmem4@khal3tytgwjn>
References: <20251016113730.245341-1-matthias.schiffer@ew.tq-group.com>
	 <cdkpp74ra2ltr7h46psutkwnzyvl4iegcicnhqqj7svm5trltm@w2egfj5nryjm>
	 <7d3df04c482e71760ccc941469c99412b608c92b.camel@ew.tq-group.com>
	 <lgse44as4k6fpzarztfnfl7wbxq2bfg5k7m7l6xlsyx23pmem4@khal3tytgwjn>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay03-hz1.antispameurope.com with 4crRzQ6tXCzdsVM
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: b6a1ef41415f75c94556ef2ddcc8cb65
X-cloud-security: scantime:8.361
DKIM-Signature: a=rsa-sha256;
 bh=i9zmwlits19MWVeZiMnlveUvVwY/OpDAaLlQOnMopBQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761039499; v=1;
 b=rDX/fShngBm6b/x0HJY9EvvMLYghwkue6s2ZBpfioKdJsgcBrxQvUIH8ydIVTjy0p6TM0+d7
 GKu856O0xFOaSPtW7btPYRDnFioW+A+T8nJbRqBkitsImvfm3i136xCgyr3PdyE55HRcBg8AM4V
 e5mdoBTRCpSpYuItQS8D5qmq8AQRCBE1Qhh6fvI/1Ad3HzJNvTBU5Gm365xy/R8koqSQeImIdHw
 wbp4AJA4jVdxAOGeBH10VGCd8NXsky/KMJ97xclmNMSpdG4NKYQqJPX1/LpE3bwB2Ck9fTzwus5
 CQrfzxZlHmFr6SW7K/pgSg6KXPXvyxrXXUyKMExDqfZLg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_094330_041015_C1DC2E3A 
X-CRM114-Status: GOOD (  60.72  )
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

On Tue, 2025-10-21 at 10:59 +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello Matthias,
>=20
> On Mon, Oct 20, 2025 at 10:09:29AM +0200, Matthias Schiffer wrote:
> > On Fri, 2025-10-17 at 17:01 +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > On Thu, Oct 16, 2025 at 01:37:30PM +0200, Matthias Schiffer wrote:
> > > > The CTS GPIO is only evaluated when the CRTSCTS termios flag is ena=
bled;
> > > > it should be possible to enable the flag when only GPIO and no hard=
ware-
> > > > controlled RTS/CTS are available. UCR2_IRTS is kept enabled in this=
 case,
> > > > so the hardware CTS is ignored.
> > > >=20
> > > > Fixes: 58362d5be352 ("serial: imx: implement handshaking using gpio=
s with the mctrl_gpio helper")
> > > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com=
>
> > > > ---
> > > >  drivers/tty/serial/imx.c | 10 +++++-----
> > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > >=20
> > > > diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> > > > index 500dfc009d03e..4a54a689a0603 100644
> > > > --- a/drivers/tty/serial/imx.c
> > > > +++ b/drivers/tty/serial/imx.c
> > > > @@ -1117,8 +1117,8 @@ static void imx_uart_set_mctrl(struct uart_po=
rt *port, unsigned int mctrl)
> > > >  			ucr2 |=3D UCR2_CTS;
> > > >  			/*
> > > >  			 * UCR2_IRTS is unset if and only if the port is
> > > > -			 * configured for CRTSCTS, so we use inverted UCR2_IRTS
> > > > -			 * to get the state to restore to.
> > > > +			 * configured for hardware-controlled CRTSCTS, so we use
> > > > +			 * inverted UCR2_IRTS to get the state to restore to.
> > > >  			 */
> > > >  			if (!(ucr2 & UCR2_IRTS))
> > > >  				ucr2 |=3D UCR2_CTSC;
> > > > @@ -1780,7 +1780,7 @@ imx_uart_set_termios(struct uart_port *port, =
struct ktermios *termios,
> > > >  	if ((termios->c_cflag & CSIZE) =3D=3D CS8)
> > > >  		ucr2 |=3D UCR2_WS;
> > > > =20
> > > > -	if (!sport->have_rtscts)
> > > > +	if (!sport->have_rtscts && !sport->have_rtsgpio)
> > > >  		termios->c_cflag &=3D ~CRTSCTS;
> > > > =20
> > > >  	if (port->rs485.flags & SER_RS485_ENABLED) {
> > >=20
> > > This hunk makes sense.
> > >=20
> > > > @@ -1794,7 +1794,7 @@ imx_uart_set_termios(struct uart_port *port, =
struct ktermios *termios,
> > > >  		else
> > > >  			imx_uart_rts_inactive(sport, &ucr2);
> > > > =20
> > > > -	} else if (termios->c_cflag & CRTSCTS) {
> > > > +	} else if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts) {
> > >=20
> > > I agree to add the parens here and consider this more readable than t=
he
> > > alternative
> > >=20
> > > 	} else if (termios->c_cflag & CRTSCTS && sport->have_rtscts) {
> > >=20
> > > . Note there is no real win here. If the port doesn't have RTS/CTS it
> > > doesn't matter if it tries to control the RTS line. While you could
> > > argue it shouldn't set the line, it only makes an externally observab=
le
> > > difference if one of the SoC's pads is muxed to its RTS function.
> > > I claim it's more robust in this case (i.e. no uart-has-rtscts proper=
ty
> > > but a pinmux for the RTS line) to control the line according to the R=
TS
> > > setting. This is (at least IMO) better and more expected than driving
> > > this line to a constant level. So I oppose to this hunk.
> > >=20
> > > >  		/*
> > > >  		 * Only let receiver control RTS output if we were not requested
> > > >  		 * to have RTS inactive (which then should take precedence).
> > > > @@ -1803,7 +1803,7 @@ imx_uart_set_termios(struct uart_port *port, =
struct ktermios *termios,
> > > >  			ucr2 |=3D UCR2_CTSC;
> > > >  	}
> > > > =20
> > > > -	if (termios->c_cflag & CRTSCTS)
> > > > +	if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts)
> > > >  		ucr2 &=3D ~UCR2_IRTS;
> > > >  	if (termios->c_cflag & CSTOPB)
> > > >  		ucr2 |=3D UCR2_STPB;
> > >=20
> > > Hmm, not sure. On one hand the same argument applies as above, but on
> > > the other if there are pins that are not explicitly configured but st=
ill
> > > in their CTS function this might affect operation in a bad way.
> > > Also this affects the (very usual) configuration where only RX, TX an=
d
> > > RTS are used and CTS is not. In this case have_rtscts is true (right?=
)
> > > and then if there is an accidental CTS pin this is bad and not fixed =
by
> > > your change. Hmmm...
> >=20
> > I think it makes sense to always keep UCR2_IRTS set when have_rtscts is=
 unset,
> > as otherwise there might be two separate CTS signals in the accidental =
CTS pin
> > case - the hardware + the GPIO one, both affecting the UART operation.
>=20
> With that change you break setups that have an RTS-GPIO but rely on the
> HW pin for the CTS function. Not sure how common that is, but in this
> case you only want the first code change. You could argue that in that
> case have_rtscts should be set, but that's somewhat fuzzy.

Such a setup should set have_rtscts IMO. In any case, my patch would not br=
eak
existing setups, as the CRTSCTS flag simply cannot be set for !have_rtscts
without these changes.

>=20
> > If we keep this change (the 3rd), the 2nd should also be included for
> > consistency in the code path where I just changed a comment - there, UC=
R2_CTSC
> > is set only when UCR2_IRTS is unset. The 2nd and 3rd change together ke=
ep
> > imx_uart_set_mctrl and imx_uart_set_termios aligned.
> >=20
> > >=20
> > > So in sum the 2nd and 3rd code change is controversial. If the first =
one
> > > already fixes the problem you're facing, I suggest to go for only tha=
t.
> > > If you still think that the 3rd (and maybe even the 2nd) change is a
> > > good idea, I'd request to do that in a separate commit as this is a
> > > separate problem. Also the commit log only describes the first change=
,
> > > doesn't it?
> >=20
> > The commit message describes the first and third change; the second is =
included
> > to keep the setup consistent. I don't think these changes can be separa=
ted well
> > - the second and third change only affect a case that couldn't occur wi=
thout the
> > first (as (termios->c_cflag & CRTSCTS) && !sport->have_rtscts would nev=
er have
> > been true). My suggestion would be that I extend the commit message to =
explain
> > each change in detail.
>=20
> I'd still request to split the patch in at least two patches. The first
> code change is to allow rts-gpios to work at all. The two later patches
> change details about how HW pins are controlled in the presence of
> rts-gpios

Okay, will do.

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

