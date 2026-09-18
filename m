Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532F2C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ri8MoCutLUnAxAJvx/W7d6M2QnpZ79h8pcccg60WaOM=; b=ksgzmwTlcUi5//jEsaJbNn83dd
	vpxoC2q1UNzMpfW0N7gW9x73RehI1duLuIHWyGrgIZ/Koz+gyDs+m9fvpekvj/VwrBELzpUtOGlyy
	ikk1eugqpUBBjm1LUwn7invzO1pPydxedGPA3j+J7g2sjIo3CL8AjF9yYeFA3qUAp1hza+0n3TBEj
	R4//rNnKdKxjcRz6gX2A3P8RDvuI9XAzWf47Y7OlUZab6BHoF+n1A+ORDMhxk37E/pZ0l4tRm7Bn2
	OFLz6zq7rP+xKenocjdCIDTgcOGCWAS1kn8huzGOGs+UkUszQIlIzqBH1CF7NLE0cegHt5WpSsyDb
	7p7+xyPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aQb-0000000ErvO-49ze;
	Fri, 18 Sep 2026 15:23:05 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aQY-0000000Eru5-3R8X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 15:23:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3C5111A0993
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 15:22:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 018BD60649;
	Fri, 18 Sep 2026 15:22:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E965110328FD9;
	Fri, 18 Sep 2026 17:22:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789744975; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ri8MoCutLUnAxAJvx/W7d6M2QnpZ79h8pcccg60WaOM=;
	b=cg6ZBC5WDILhswpSgON8oRSwmK/S8wqQRKQmx7TRN6JCs9US64BvsaQYq9DSkjFFAGTnVH
	S7umg7XDZscGtph1aZjbzeVU3uqFZVCH3suMEQfLLFHqaDVi/k8MN6rQyijpct5j7Vgzjz
	S3+WUoi92vFTtl4ZEmbumeEzL7fXe6f55NtEcHLr9msBCb1zT562hPRhFGeTI1jyLvYFht
	FZmoGz6h9gE+VkBkOuLISfunIGOea/hNpD3GZKLILfYLvjugtkAjLVhudKcNXYIvV6FpJj
	a4dYiXzEGw+7mDxHJV4hz9u6qF/+PTjv4PayBd2txng68vGzkIZseRrvtTsjMg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 17:22:49 +0200
Message-Id: <DLIJN4CDS11K.RVJGK3UALMJE@bootlin.com>
Subject: Re: [PATCH v2] net: macb: add TX stall timeout callback to recover
 from lost TSTART write
Cc: "Lukasz Raczylo" <lukasz@raczylo.com>, "Steffen Jaeckel"
 <sjaeckel@suse.de>, "Drew Streib" <dtype@dtype.org>
To: "Andrea della Porta" <andrea.porta@suse.com>, <netdev@vger.kernel.org>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rpi-kernel@lists.infradead.org>, "Nicolai Buchwitz"
 <nb@tipi-net.de>, "Conor Dooley" <conor.dooley@microchip.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <468f480454a314303bac6a54780b153f689f2267.1781598350.git.andrea.porta@suse.com>
In-Reply-To: <468f480454a314303bac6a54780b153f689f2267.1781598350.git.andrea.porta@suse.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_082302_993888_472B1EDC 
X-CRM114-Status: GOOD (  14.75  )
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

Hello all,

On Tue Jun 16, 2026 at 3:23 PM CEST, Andrea della Porta wrote:
> From: Lukasz Raczylo <lukasz@raczylo.com>
>
> The MACB found in the Raspberry Pi RP1 suffers from sporadic stalls on
> the TX queue.
> While the exact root cause is not yet fully understood, it is likely
> related to a hardware issue where a TSTART write to the NCR register
> is missed, preventing the transmission from being kicked off.
>
> Implement a timeout callback to handle TX queue stalls, triggering the
> existing restart mechanism to recover.

Any news on this topic?

There was a guess that a "flush PCIe posted write after TSTART
doorbell" patch [0] could solve it but I was sceptical [1]. We never
landed that and only took the Tx timeout implementation. If it ever
triggers then the kernel log gets a "NETDEV WATCHDOG: ..." critical
line appended [2].

I got reminded because I came across on this wiki page [3] about the
issue, whose author is in Cc. As an aside, I landed there by testing out
the Marginalia search engine and queried "macb driver" (as one does).

Main discovery of the day: it happens on EyeQ5 & latest net/main
(46bc52d13594) as well. Thanks to Andrea for the quick reproducer.

	# udhcpc -i eth1
	...
	# iperf3 -c $IP -P10 -t3000
	...
	^C
	# dmesg | grep eth1
	[    2.182191] macb 2b00000.ethernet eth1: Cadence GEM rev 0x00070200 at 0=
x02b00000 irq 35 (00:28:f8:94:24:69)
	[   23.570335] macb 2b00000.ethernet eth1: PHY [2b00000.ethernet-ffffffff:=
0e] driver [Marvell 88E1510] (irq=3DPOLL)
	[   23.570981] macb 2b00000.ethernet eth1: configuring for phy/rgmii-id li=
nk mode
	[   27.783260] macb 2b00000.ethernet eth1: Link is Up - 1Gbps/Full - flow =
control tx
	[   42.182370] macb 2b00000.ethernet eth1: NETDEV WATCHDOG: CPU: 0: transm=
it queue 0 timed out 5088 ms
	[   51.158331] macb 2b00000.ethernet eth1: NETDEV WATCHDOG: CPU: 0: transm=
it queue 0 timed out 5004 ms
	[   56.262381] macb 2b00000.ethernet eth1: NETDEV WATCHDOG: CPU: 0: transm=
it queue 0 timed out 10108 ms
	[   61.126317] macb 2b00000.ethernet eth1: NETDEV WATCHDOG: CPU: 3: transm=
it queue 0 timed out 14972 ms
	[   67.206322] macb 2b00000.ethernet eth1: NETDEV WATCHDOG: CPU: 0: transm=
it queue 0 timed out 5004 ms

Note: the initial reproducer was `iperf3 -c $IP -P10 -t3000 -w4M`.
I can reproduce without -w4M but -P10 is required even though we reach
line rate with a single stream. This points to a race/mb issue in
macb_start_xmit?

I'm posting to see if anyone has theories. I'll be posting some race
fixes soon but they don't fix it (not surprising as they are unrelated).
I have many ideas but I need more time for testing; it'll be much easier
now with a reproduction setup.

[0]: https://lore.kernel.org/netdev/20260514215459.36109-2-lukasz@raczylo.c=
om/
[1]: https://lore.kernel.org/netdev/DIK002QFFNBY.31C3KUX2SQC6W@bootlin.com/
[2]: https://elixir.bootlin.com/linux/v7.2.5/source/net/sched/sch_generic.c=
#L563-L569
[3]: https://dtype.org/wiki/Cm5_macb_network_hang

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

