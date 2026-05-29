Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17CCCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c024gKKjc1BP6uOHzo7JwDhVMobKmBODDZE59zQhr2g=; b=pp+3jNNuXyM3nhAUd593cdpWEe
	7WTxPUoJxnMHUq318Zitjb8tfzqZn3KeVX5f0ngDc9oiDXbAMHN9q7jtgbBLmsPsoKfMRCnnXe+Hs
	8hREkVOU0FPBCci1lvRatIWdPAIVPND7JfG4KW0R7CRN1OqMuW3hhoIaFycG0k7tEUwjjWC4SLejp
	fcGdWr4Qp5DL0QGPPyb4kOkTfLIol7mc0P4IDNLibcnhRHs6L7uJEbTBvaHpc9jzsTPDmhSfIWVl1
	iiF5SdcDmET3Bo74Od92qzCzrEcqJWK+Y+pcOubVY51Z5eXA8x6nQEKYSgzdxsKEv95cpLup0mB9k
	jKuIExAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrvj-00000006uH0-3jKe;
	Fri, 29 May 2026 07:46:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrvg-00000006uGC-15ab
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 07:46:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1625E4E42D7F;
	Fri, 29 May 2026 07:46:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC731601FA;
	Fri, 29 May 2026 07:46:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1F4D10888CC3;
	Fri, 29 May 2026 09:46:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780040806; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c024gKKjc1BP6uOHzo7JwDhVMobKmBODDZE59zQhr2g=;
	b=KjmIZrLWYMuBX5Ryi0sbKhJ6S0YIpXtTli22Qoe9K29ZjXJm+VJASuKQN5LUGreAwA3TZY
	58Q0hGSxsZmfypZBHd6JdJB6RJoUCdtZnZuitD4hGpbWe2+jBLG8LUsyoWnR9oWsedJ8Fa
	5lATLDUktJL7FNVjtB1eK9zHycaSx/is+nVhZhp/N0CBo6LCH/OIJomqKX88B8JWB7yPe1
	bmjk95lkXiDl/sTME/LvC9yhlJVIw1rZfdhqtC5vFHJNp1HKhYDO5VBziMEJ4wnPtJ8wRb
	aWeYjyirFWL5DeA3Kavh8LIBoRXNJjRcOZ2W69/WWZNRItY4xIJRBiPDeUFG4g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 09:46:40 +0200
Message-Id: <DIUZSUI8A5G2.E4D5YUXOWX95@bootlin.com>
Subject: Re: [PATCH net-next v2 3/3] net: macb: add TX stall watchdog to
 recover from lost TCOMP interrupts
Cc: <netdev@vger.kernel.org>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rpi-kernel@lists.infradead.org>
To: "Andrea della Porta" <andrea.porta@suse.com>, "Lukasz Raczylo"
 <lukasz@raczylo.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1777064117.git.lukasz@raczylo.com>
 <20260514215459.36109-1-lukasz@raczylo.com>
 <20260514215459.36109-4-lukasz@raczylo.com> <ahhom_0PJtqnXsv5@apocalypse>
In-Reply-To: <ahhom_0PJtqnXsv5@apocalypse>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_004652_431942_C79543A8 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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

On Thu May 28, 2026 at 6:08 PM CEST, Andrea della Porta wrote:
> Has this patch seen a V3 version? I guess the only thing it's needed
> is something like this:
>
> static void macb_tx_timeout(struct net_device *dev, unsigned int txqueue)
> {
>         struct macb *bp =3D netdev_priv(dev);
>         macb_tx_restart(&bp->queues[txqueue]);
> }
>
> and then setting .ndo_tx_timeout =3D macb_tx_timeout in macb_netdev_ops.

Agreed! (pointed out here, with more details)
https://lore.kernel.org/netdev/DIK002QFFNBY.31C3KUX2SQC6W@bootlin.com/

s/txqueue/q/ to respect the driver's traditions.

Sadly at91ether_netdev_ops cannot have macb_tx_timeout because code is
too different.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


