Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3457B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 20:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hVCyFm3l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hywMFMGWC22FCsnfeYWHg5SybWSfpDHUd/LvoxS7oLY=; b=hVCyFm3lXALpcQGviz8gHE/TLV
	AdLaq2A6gZPvwizB6+m+nnkS1YGz8popxmpCyr8lgy8dvrhS4K6028gayVpzIegJlIWMcXW0SNL0j
	qUBZtOXHugqW1/4Fp+Vb/8HQnvflE1PqsXePxERDLEtPr3vJD/Ygb1KsjYijS78h/9q5qzKxbOKoA
	sG5cPUMLhL3EIfTiHMJG4/rm2KMCHn+3naGP6rWJsvzj2ZWn9gA2DK/1gCRqtSkd9KTnd188wgQ6X
	4eVRCymN6Wkecu4XYMBE41YeIhU7zILMVukW7SgW2x3RcsWIEhOl33TK4fKohn4KzpFaU52T6LYam
	N60YySOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOL4e-00000003cNx-3BLU;
	Tue, 03 Nov 2026 20:25:40 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOL4b-00000003cNL-0dO3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 20:25:38 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 38B0092009E; Tue,  3 Nov 2026 21:25:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 321B692009B;
	Tue,  3 Nov 2026 20:25:31 +0000 (GMT)
Date: Tue, 3 Nov 2026 20:25:31 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    James Hilliard <james.hilliard1@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
    =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
    Tony Lindgren <tony@atomide.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Richard Genoud <richard.genoud@bootlin.com>, 
    Nicolas Ferre <nicolas.ferre@microchip.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
    Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
    =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
    Sascha Hauer <s.hauer@pengutronix.de>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>, 
    Peter Ujfalusi <peter.ujfalusi@ti.com>, 
    Vignesh Raghavendra <vigneshr@ti.com>, 
    Patrice Chotard <patrice.chotard@foss.st.com>, 
    linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 2/8] serial: serialize asynchronous write wakeups with
 the port lock
In-Reply-To: <auoUlkzXsl9WJG8B@ashevche-desk.local>
Message-ID: <alpine.DEB.2.21.2611031947260.15685@angie.orcam.me.uk>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-2-9159caade148@gmail.com> <auoUlkzXsl9WJG8B@ashevche-desk.local>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_122537_356919_683EA6AC 
X-CRM114-Status: GOOD (  15.19  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 3 Nov 2026, Andy Shevchenko wrote:

> > +static unsigned long sccnxp_handle_events(struct sccnxp_port *s)
> >  {
> 
> > -	int i;
> > +	unsigned int i;
> 
> This change seems unrelated to the patch. Again, slow down and READ what AI
> produces before sending, please!

 Indeed.  FWIW I've thrown v8 at hardware I look after, that is:

 drivers/tty/serial/dz.c            |  9 ++--
 drivers/tty/serial/sb1250-duart.c  | 25 ++++++----
 drivers/tty/serial/zs.c            | 94 ++++++++++++++++++++++++++++----------
 drivers/tty/serial/zs.h            |  3 ++

and that has caused no observable regressions in my simple verification as 
direct terminal lines, both in the line mode and with ncurses.

 I have no leased-line modem hardware to put this under stress with all 
the signalling; I could see, and probably should, whether I can set up a 
SLIP connection with a direct serial link and see how it performs, but 
it'd take me more time than I can afford right now, especially as I'm 
locally short of one PSU for the systems in question that is waiting for 
parts to arrive for repair, and swapping the one working unit between 
systems is quite involving (ones in the lab won't run SLIP owing to the 
firmware limitation of the console servers they're wired to).

 But I didn't have a chance to reply before v9 has been posted with more 
updates, so I'll wait for things to settle before reviewing the changes in 
detail.

 Please consider this a NAK for the drivers listed above until the final 
version of the patch has been posted and I've had a chance to verify it.

  Maciej

