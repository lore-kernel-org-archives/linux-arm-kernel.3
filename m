Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C52606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bS+ATqAa;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=aAhmzboG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xu3fbCynnktpfkkN/K5x/WE6WVfufnhucl87fRAo4SE=; b=bS+ATqAaWq+dKmjUPPSDGw6Sfs
	j8Xl0WwYEegHLYsHDgqo2bSRm2NRcMUYPieg6piM4TQoyBV5VZy9gznxfTDaxjn4W5a3Xq5lz3XUV
	dz8vaTCQhijfeooTHME5bEtZZt5vTXmH+xK7j2RvnWyXAfzsPy/ts35Ociv57HabNrtPevNn9CoE4
	Svu2NSb5qWEIFIq/dktV8IMpTaXi/hl/3p7/KDODp/i3YXH/Ik1apI/1ugOfrpzsyeVPsd/NDKLbS
	w4mcOHx89KE/Ymcx0Wr2rYgVn4BQGK4xGXWL2pDcERcdRwxWr5d/9i7eWxV4dEVHjI3s/5dx+dLKO
	nOfier3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRUR-00000003EBi-3DbV;
	Mon, 26 Oct 2026 20:40:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRUQ-00000003EBW-3FnN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 20:40:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C4A1A601EF;
	Mon, 26 Oct 2026 20:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A5E1F01825;
	Mon, 26 Oct 2026 20:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793047217;
	bh=Xu3fbCynnktpfkkN/K5x/WE6WVfufnhucl87fRAo4SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aAhmzboGmKn6SPgg9I60tpW201e6cOJ/1U7hNNdY5Hbq+R66xDfSwant0dSQ2xhm2
	 N8uh3H1bUhEeEinc69spsXOxUtmIaWtKygTpwiCD32vflykYssB12lejPOCshxKIJY
	 FncmlNQyh1b/URXkhG6+s/bfxhxbszK1CPUenNHg=
Date: Mon, 26 Oct 2026 21:40:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raul E Rangel <rrangel@chromium.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
Message-ID: <2026102657-tubby-tragedy-5f1b@gregkh>
References: <at4bw-G8czG-G7Wl@ashevche-desk.local>
 <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
 <at5qKehogAjTa-fA@ashevche-desk.local>
 <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
 <at8eDFj2WNaXDaot@ashevche-desk.local>
 <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
 <at-vyZ1sDhYPu0W5@ashevche-desk.local>
 <CADvTj4o_CENc3i92OQEZudOErSKPUptT4t2CCqDaGbseuK0QcQ@mail.gmail.com>
 <2026102631-stove-preview-b534@gregkh>
 <CADvTj4pCnnzx4B28H_1BuY4gm2fh_8HYL9jLpsAoJcWfiUXOHw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4pCnnzx4B28H_1BuY4gm2fh_8HYL9jLpsAoJcWfiUXOHw@mail.gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 02:24:58PM -0600, James Hilliard wrote:
> On Mon, Oct 26, 2026 at 2:17 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Oct 26, 2026 at 01:59:06PM -0600, James Hilliard wrote:
> > > On Mon, Oct 26, 2026 at 1:53 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > On Mon, Oct 26, 2026 at 10:45:54AM -0600, James Hilliard wrote:
> > > > > On Mon, Oct 26, 2026 at 3:33 AM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrote:
> > > > > > > On Sun, Oct 25, 2026 at 2:44 PM Andy Shevchenko
> > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrote:
> > > >
> > > > ...
> > > >
> > > > > > > > Some people might want to test the stuff. And sending too often you actually
> > > > > > > > will get the opposite results, people will be tired to even start reviewing
> > > > > > > > and/or testing your code as it's changed way too quickly.
> > > > > > >
> > > > > > > My thought process was that people wouldn't want to be testing code that
> > > > > > > had known bugs flagged in Sashiko reviews.
> > > > > >
> > > > > > Sashiko reviews are not visible in my or any other mailbox. To see them I have
> > > > > > to go to some URL and so on, meaning to waste time to see why on the earth the
> > > > > > new version has been sent.
> > > > >
> > > > > Maybe the Sashiko reviews are getting caught in spam filtering or something?
> > > > > They are showing up for me and on the mailing list[0] so I'm a bit confused why
> > > > > you aren't seeing them. You shouldn't have to go to the web interface[1] to look
> > > > > up the reviews.
> > > > >
> > > > > [0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.org/
> > > > >
> > > > > [1] https://sashiko.dev/
> > > > >
> > > > > > It's better before addressing Sashiko comments,
> > > > > > reply to all people involved and to Sashiko's original email, so it will be
> > > > > > visible in the previous version why you issued (actually about to issue) the
> > > > > > next version.
> > > > >
> > > > > Hmm, maybe it makes sense to enable recipients in the reply_to config[2]?
> > > >
> > > > It's up to the list owners / subsystem maintainers.
> > > >
> > > > > [2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/projects/linux/mailing_lists.toml#L290
> > > > >
> > > > > > And before even issuing it, wait for a while, people might
> > > > > > disagree with Sashiko judgement or your replies on how to address that.
> > > > >
> > > > > I was assuming everyone was seeing the Sashiko reviews getting posted to
> > > > > the mailing list already. The are ending up in lore so unless someone isn't
> > > > > subscribed to the list I'm not sure why they wouldn't be seeing those reviews
> > > > > already.
> > > >
> > > > I assume you already answered your Q. mailing list in this sense doesn't mean
> > > > recipients. I think it simply goes to the mailing list without forwarding.
> > >
> > > Do we want those reviews going to recipients as well as the mailing list?
> >
> > For serial patches, we decided to only have it go to the submitter and
> > the list.
> 
> When it goes to the list is it supposed to go to list subscribers as
> well or only to lore?

All list subscribers as well, I've watched your interactions just fine
:)

thanks,

greg k-h

