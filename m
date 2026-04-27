Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBB2FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMNoBFW05PGN89Lx84+WtOyYzlPOjlTQR1HX96yjry0=; b=J+87FbDwqbE78iSNo7kgmUdlOB
	ChD95lmTCSDQnnnjTAMcxFb4+JiWxy+IxQ81NlddjBS+K76Stm+0sk9oXWvAZ2OvlORXb7nypE+FJ
	0K9ZiKSPHmhzVz53DY6MWj+ERZKSjf2qdtLBGhb4mWKf9tv4/rEFWGQOg4FxR4Qc7ERKWM4wRbF7o
	NtDQfCgZNEGRncy6evPjBqxJqak515X/BYLzt6qZmvzC8OsX8idjJL8T6acAa44ZxDFREYC+e+lef
	zcF6DzW5knvtvO1YTZfJffp7V2CQxuvWZhsGBQTDbJ4RygfYAlYdzzS8XVc56jOTK6jPYXo9lR4AK
	VN1vZeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNYD-0000000HA9r-3fkt;
	Mon, 27 Apr 2026 15:07:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNYA-0000000HA8w-3wfV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:07:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6360C4E42A8E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 15:07:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 155A0600D1;
	Mon, 27 Apr 2026 15:07:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD5101072822D;
	Mon, 27 Apr 2026 17:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777302423; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gMNoBFW05PGN89Lx84+WtOyYzlPOjlTQR1HX96yjry0=;
	b=iPoYCp2Q3BZkyngYDlFdBLey+pjeV/cHso3bV3Ev9SH7ZwK/Ph+ThDhIUdsWAjIAidna+P
	3ehE4OUWBkBeKBsPept5h7+UjFJzC43vdRtPcS96/UMSKc6bI+/tMOrjn24RH0o/Qh8kSD
	ZYtvR1xkxPRrY4Nsl/81kzq3IhHUryb2uOY5HyGXnLnAwdi1FbIjmI/uHhWICwuCBTm/kb
	yb7adJu6DrK7iNdh/R+YnenQBw4gou837NPLjsNfQOhpCepJ2/IBELq39GzhJcDWDA4TzT
	+Ya6hjdPjMRUOuKiiMpXfEvb7bzdeKRXDuUGyynMQiloNDU44Rg6DhKNUTjYBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Russell King <linux@armlinux.org.uk>,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] ARM: at91: remove unnecessary
 of_platform_default_populate calls
In-Reply-To: <20260424-worried-renewal-924d34ed945c@thorsis.com> (Alexander
	Dahl's message of "Fri, 24 Apr 2026 12:56:27 +0200")
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
	<20260105-at91-probe-v3-3-594013ff2965@kernel.org>
	<20260423-stoke-ocean-139dbe306256@thorsis.com>
	<20260424-worried-renewal-924d34ed945c@thorsis.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 27 Apr 2026 17:07:01 +0200
Message-ID: <87tsswfnmy.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_080707_102239_9800072A 
X-CRM114-Status: GOOD (  14.43  )
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

Hi Alexander,

On 24/04/2026 at 12:56:27 +02, Alexander Dahl <ada@thorsis.com> wrote:

> Hei hei,
>
> after few hints in IRC yesterday, I tried to understand why neither
> the ebi driver nor the nand driver are probed, but I failed.  See
> below.

Just to be clear, I would not expect the NAND driver to probe "alone",
it is described as a child node of the EBI controller which has its own
compatible. As a result, only the of_platform_populate() at the end of
the probe of the EBI can lead to the NAND controller to probe. The EBI
node being a child node of a "simple-bus", this is the one we should
focus on, because it should be probed.

One reason (trying to be creative) could the that Rob's patch is
dropping an explicit populate that maybe kind of bypasses checks that
the "official" populate does. So maybe there is one resource that is
missing and which is not ignored as it used to be by the core device
driver (likely, dd.c).

Can you enable CONFIG_DEBUG_DRIVER and see in the logs if anything pops
up? Maybe trying to trace (manually) in the core why we do not attempt
to probe the EBI controller by looking for possible conditions to bail
out early. Pinctrl is one of them, so maybe just removing all pinctrl
references in the DT may help troubleshooting this (obviously probe will
fail if pinctrl is incorrect, but if it is attempted we will have a
culprit).

Good luck,
Miqu=C3=A8l

