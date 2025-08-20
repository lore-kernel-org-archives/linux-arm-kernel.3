Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B20ACA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p174+Eh9XAmNMgbrKhEkVjmTUSlXzZKuRgobxcqkPrM=; b=aiWOWmFCdARa210OEvwiBJMPrX
	OnXBXDtUIQ4svxSIc8ahMsWcLkNEHxwdg73yb4k9tcpuymErhLnVsjsPb8iV255Bi2NXrmycV6D8H
	jHyqX1ErLu+yBk3lFILKd6R2Ky4A1KbwvcnopsMqcNPhHhxw6zkPmE0hRNse1t9KfjEWImkP/i/FV
	74OLBLvlkvvlM5PeuFO5L/Wu0jyFr3P6SV9hT5cMh4hSP/wMzmo4TRyrEMb/kv1GAc/UDUumqMV0M
	pX75ZvkM4eGI3AulZFS2QfAT8N+Xwr77BidL6AUCGBxo4gROv7m2Z3SVWFLXPsYGceVwO0B1np7uA
	c4Tfmslg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopux-0000000EwOc-1aj6;
	Wed, 20 Aug 2025 21:00:23 +0000
Received: from bues.ch ([116.203.120.240] helo=mail.bues.ch)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomLG-0000000EUZc-00ck
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 17:11:19 +0000
Date: Wed, 20 Aug 2025 19:10:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bues.ch; s=main;
	t=1755709872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p174+Eh9XAmNMgbrKhEkVjmTUSlXzZKuRgobxcqkPrM=;
	b=mrPkyzU62ByK8uGx1mNmesSR4xO/mcSPHp+Ec1VriviCTHS/wznJ/a/bV11/qGjRXBQuOU
	oOnH9rvX3kWmtZ6BNdyzUGy3egwRmAusoVZAVXi08/ozv69KG6awsERlmG3FT1w79mRNxL
	Uz7KHmrxvBWopIYFA3nXKp6MR5PnTG70ZBxxs6kCGRBk0kKBCMjQdmofo84DHWv2aSuk/g
	PmqzrvxzEEq92c2qNpr3vAHDjcaLs5nhyqONUIDbvTf/YttA2LDKWrmsuHpj/G23EUxvqG
	KngrJ0cICVWqvjyDjhYHZH7iYAaWmHycHAcRnZxkdF0JKrDAi8nu4XMBwjiA0w==
From: Michael =?UTF-8?B?QsO8c2No?= <mb@bues.ch>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Michael
 Buesch <m@bues.ch>, Hoan Tran <hoan@os.amperecomputing.com>, Andy
 Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>, Romain
 Perier <romain.perier@gmail.com>, Grygorii Strashko
 <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin
 Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek
 <michal.simek@amd.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 01/16] gpio: dwapb: Use modern PM macros
Message-ID: <20250820191039.4f8af41e@barney>
In-Reply-To: <CAHp75VfxSBPzvohrW4tywd4VS0r1_mp8WLvdKcN_yn=zNS49HQ@mail.gmail.com>
References: <20250820154037.22228-1-jszhang@kernel.org>
 <20250820154037.22228-2-jszhang@kernel.org>
 <CAHp75VfxSBPzvohrW4tywd4VS0r1_mp8WLvdKcN_yn=zNS49HQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pS1KmHMT0VTPklKxJ+M/HG5";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_101118_204816_199A3117 
X-CRM114-Status: GOOD (  12.04  )
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

--Sig_/pS1KmHMT0VTPklKxJ+M/HG5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 20 Aug 2025 19:54:44 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> > The dwapb_context structure is always embedded into struct
> > dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> > data overhead for !CONFIG_PM_SLEP. =20
>=20
> I don't think it's a good approach to add a lot of data for peanuts in
> case of PM_SLEEP=3Dn.

It wastes 36 bytes in case of PM=3Dn.

The driver currently allocates the struct with kzalloc and stores a pointer=
 to it
in case of PM=3Dy.
So this probably has an overhead in the same order of magnitude (pointer +
malloc overhead/alignment/fragmentation) in case of PM=3Dy now.

--=20
Michael B=C3=BCsch
https://bues.ch/

--Sig_/pS1KmHMT0VTPklKxJ+M/HG5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEihRzkKVZOnT2ipsS9TK+HZCNiw4FAmimAY8ACgkQ9TK+HZCN
iw5cNA/+NLyRCzoK1ETToeOTHdwwyQkiTbuBe6ELJDz1Fuk4Ao88nbQmFeISRwE5
M4E1ojqTn1YTeerWFS0t/IPH/6bJk23TeOMNYmweblgBCiLVQ96UmN6iw0PaRnj7
dJtLy/5/gKIHC6n5dw+Qo5cWsr+CvLJ3gwZF001XjGyEPBTjSLTQJmFgeJTb8mmg
M96uB22AtpG727LqVenvf5VgeSIL+E9Pau0TdBA/xhxwTEDZZQpIYVL8blqYTUxQ
FKcUOHINC2sPFIXTklyj/lkKMoveTjYXBMur3RSSm4k03jND2tQYBVGPFFFsi9A2
jSw8fEkkY0OMvLJesxiJWWvzrowG0IGR09Ii0vzTFSyRru5kYoXbKDFUzfn1ii4E
s6dd8RE/PrDEnI/vX8LrdxW3EzjcbBfu+6JrevevbI4ixLOQHA+usaUm15mQfDtH
V3iPr1DsMwR0dbryYcjn9AUlxLDuWZEm8d2z92OrPLZG/Ta+ypGRo2GC71hlpUGk
rxxsncdj+3drXfuVyX5n0WUVUMAY5qSr/qP8qHQPEdUwibkaOInrXIYf9SMvxdvD
zIT0fPrtfuqynuWHyWW+peELaoj9Y+dimLZUmVv5DXOrfNnYCCbIGpxGNfHVtZqn
oijZv6EsPyAZbHcR90Z2g9TxbrMT/lrn4JR5CZbBgZLQI+25TsA=
=Dkpw
-----END PGP SIGNATURE-----

--Sig_/pS1KmHMT0VTPklKxJ+M/HG5--

