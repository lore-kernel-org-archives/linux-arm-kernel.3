Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7027CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/RnWaY84K7NxRT+Dl3MJsVLPAwuGx8R4hiQP+sNEkA=; b=s3DQZLzvnQ7H9cbK5vcyTrutgu
	XiUgZ4MC0EZfiuYpT6qLtzKI4dqrBusQ2Qu9kR67Xzovy4RMYubS9WtKLZu0MJukW0+moY0rTQcgN
	q1UOhIqOJBIRR9hIDcIbpEpN/43GFfZe71IJxQReYVZqDCCMYnz7Y22OryX94mppStfJYkx6gCpz6
	DPx7PbM7Z/cZNwGNvJH0b8IJH0Prq1LaDRFmC0H4BiDzaTR4iOzHB/CluP8l8vjlmdDyReQDy8EUK
	/WKx/ktiE0vx0prOpMFUorL65oFQjOs8lBs+LmfBO42WFkx9Afh8kRIFveqfduj9jLK2QO38MstG2
	oTCcbbxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCKR-00000008CPM-0EOi;
	Thu, 01 Oct 2026 08:39:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCKP-00000008CP7-0FSH;
	Thu, 01 Oct 2026 08:39:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A515841B63;
	Thu,  1 Oct 2026 08:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079951F00899;
	Thu,  1 Oct 2026 08:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790843984;
	bh=j/RnWaY84K7NxRT+Dl3MJsVLPAwuGx8R4hiQP+sNEkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vvdNIjIwILZSpdnBP/cMooYLCoakeofqnL6V5bBrRHNZfz30J/DuKcwhC/mPIfXlc
	 Jo2n3s9qDBwK8a0mxzZ+nWYAqK8ryRYprm38alQi37WZxBS1nOxwb6utIhppDDPvri
	 fYtlzeYWSEUN3czFXCabauIXSqIAXvZvECGWRVm4=
Date: Thu, 1 Oct 2026 10:39:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>,
	florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, phil@raspberrypi.com, stefan@agner.ch,
	bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] serial: 8250_bcm2835aux: Add support for RTS/CTS auto
 flow control
Message-ID: <2026100123-dipper-amnesty-f721@gregkh>
References: <20260930125620.221836-1-sairon@sairon.cz>
 <2e420fc4-e829-42ea-99c2-48e518ac59d9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e420fc4-e829-42ea-99c2-48e518ac59d9@kernel.org>
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

On Thu, Oct 01, 2026 at 08:09:32AM +0200, Jiri Slaby wrote:
> On 30. 09. 26, 14:56, Jan Čermák wrote:
> > --- a/drivers/tty/serial/8250/8250_bcm2835aux.c
> > +++ b/drivers/tty/serial/8250/8250_bcm2835aux.c
> ...
> > @@ -46,6 +59,150 @@ struct bcm2835aux_data {
> >   	u32 cntl;
> >   };
> > +static bool bcm2835aux_tty_throttled(struct uart_port *port)
> > +{
> > +	struct tty_struct *tty;
> > +	bool throttled;
> > +
> > +	if (!port->state)
> > +		return false;
> > +
> > +	tty = tty_port_tty_get(&port->state->port);
> > +	throttled = tty && tty_throttled(tty);
> > +	tty_kref_put(tty);
> > +
> > +	return throttled;
> 
> Instead:
> 
> scoped_guard(tty_port_tty, port)
>    return tty_throttled(scoped_tty());
> 
> return false;

LLMs do not understand "modern" kernel programming styles :(

