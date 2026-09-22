Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D7FC98307
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/0DpvkER5cSeOE09m9iAwElnCK40zRbmR7dCpWAk2Q=; b=xo2gGrwAEDN3ngjNaN3m/OlVr/
	VZ6k6RN/v3N3WOypttSyne7J05KUQ4WRxf6j7gXrcbcadHfC1Ld4rfyPS3Ip7paKQHb0DbspzxKNW
	tWermhxiytYA8Uw0tULiwnC9RdaQV3txnY85DeHQ/1NyClAsRFG4vAr4cmhwP8utMt2pVs98AhcE1
	uDj1FcsGEjmM4qGkV78xsPxbl3pBdjwLORDeyzbqAhGNsVd30pvNpyzPnS5uPN0B4VsYbpWrz6yoG
	g8L28Z4lRLK5ab9K2xgWzcJlrDCiMwgvZ4OYiAMHZvMppTPLiYIzcAtj/E9azmInHuo2yAOnLBmPE
	3hQCLdsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x907G-00000005P9v-0Mjc;
	Tue, 22 Sep 2026 13:00:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9078-00000005P8D-2elX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:00:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1A8A60DCE;
	Tue, 22 Sep 2026 13:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C3A1F000FF;
	Tue, 22 Sep 2026 13:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790082049;
	bh=s/0DpvkER5cSeOE09m9iAwElnCK40zRbmR7dCpWAk2Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=anp3UBkbdeNEklwwrxIoqKilZH9/dP8mKyLwPdR/6riQTqjYMdyiJzR1CgZngC5I+
	 fE2DWE+1YkO8UuxzWs4uZ7BOjFkDEabyPudm59jCRp5tov27G2rNpJkbZftC7yT1Vo
	 ZWVfzIvdCYC7IEK4y3USzIPsA9bbfxTnx7pu7auBLe6AQcSJStBZU04sLOeNRjD1+H
	 1gJFsR2dpwriZBkpfcnKwAM37MsuV+9pN+5PVjvvxJOHdLGbO5dGVrAAi17W+vP36o
	 318/nXECNXmsZwEBocBZGdZYR+YBBdRDhqpjaCvxxuwkr/PQn8j/3C0/QMvkHFqnUD
	 IJWnpMF/eVzoQ==
Subject: Re: [PATCH net-next v7 08/14] net: lan966x: clear FDMA interrupt
 stickies after switch reset
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horatiu.vultur@microchip.com,
 steen.hegelund@microchip.com, UNGLinuxDriver@microchip.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, herve.codina@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, mohsin.bashr@gmail.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Tue, 22 Sep 2026 13:00:47 +0000
Message-ID: <179008204794.2160803.10149601672320218478@kernel.org>
In-Reply-To: <20260918-lan966x-pci-fdma-v7-8-0ecc179c8a2c@microchip.com>
References: <20260918-lan966x-pci-fdma-v7-8-0ecc179c8a2c@microchip.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Commit message describes the WARN-on-probe failure in the present
  tense, but at this commit the PCI path cannot request the FDMA IRQ:…
- [Low] In-code comment under-describes the code it documents.

--

net: lan966x: clear FDMA interrupt stickies after switch reset

This adds three register acknowledgements right after the switch reset in
lan966x_reset_switch(), clearing FDMA_ERRORS, FDMA_INTR_ERR and
FDMA_INTR_DB so that a spurious sticky latched by the GCB soft reset in PCI
mode does not make the FDMA handler fire as soon as the IRQ is requested.
The clear is done unconditionally on both the PCI and platform paths.

> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> index 6e6c08bb8eea..11094a381ec2 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> @@ -1067,6 +1067,15 @@ static int lan966x_reset_switch(struct lan966x *lan966x)
>  
>  	reset_control_reset(switch_reset);
>  
> +	/* When in PCI mode, the GCB soft reset issued by the reset
> +	 * controller can latch spurious bits in the FDMA error stickies.
> +	 * Clear them before request_irq hooks up the FDMA IRQ line,
> +	 * otherwise the handler fires immediately on probe.
> +	 */
> +	lan_wr(lan_rd(lan966x, FDMA_ERRORS), lan966x, FDMA_ERRORS);
> +	lan_wr(lan_rd(lan966x, FDMA_INTR_ERR), lan966x, FDMA_INTR_ERR);
> +	lan_wr(lan_rd(lan966x, FDMA_INTR_DB), lan966x, FDMA_INTR_DB);

[Severity: Low]
This isn't a bug, but should the comment also mention FDMA_INTR_DB?  The
comment talks only about the "FDMA error stickies", while the code below it
also acks FDMA_INTR_DB, which is the data-block completion sticky rather
than an error sticky.

In lan966x_fdma.c, lan966x_fdma_irq_handler() consumes it in the non-error
branch:

	if (db) {
		lan_wr(0, lan966x, FDMA_INTR_DB_ENA);
		lan_wr(db, lan966x, FDMA_INTR_DB);

		napi_schedule(&lan966x->napi);
	}

So a latched DB sticky would lead to napi_schedule() rather than the WARN
described in the comment.

The commit message does list all three registers, so only the in-code
comment is out of sync.  Could it be extended to say that the data-block
sticky is cleared too, so a later cleanup doesn't drop the FDMA_INTR_DB
write as unrelated?

>  
>  	/* Don't reinitialize the switch core, if it is already initialized. In
>  	 * case it is initialized twice, some pointers inside the queue system
>  	 * in HW will get corrupted and then after a while the queue system gets

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c%40microchip.com

