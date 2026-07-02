Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2658BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ci5DBXRn+5kdYcV4syoJ/nlrfafCD6IBrci7rpIgT7k=; b=mh547udSwm8ApHy11okbZNm0Zc
	00b8d3GkQkeHFzjDKDjgzHTCIEF9L0+72SMDUCOvHMiKf3qTb9OTT8Mi8nXGzReFBky8iGlZ+VOJj
	cX6e5XNy/0nKTe6dxsOb9vxhfv0Uvd75Lw3oN52ahIU8QUKSiMVq0wRX5g3eIzBxR78Zb00n6DoV0
	YKcOWpWk2wtPtTH+BUJYdbcLXnOmNp9pliVCoOP5lsCFK3JDk8pmMOt9KESNVQLKwUIcrfi39IebJ
	iMgKDq9rpd8fvFD5H051Egml+ryfj5MHb4Y1IqaoMc7iLLNgKF+IjbIpOZ6stIeiYFhsE4H3zEoGa
	hzj37ZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDIm-00000003wlB-0cKY;
	Thu, 02 Jul 2026 09:01:44 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDIj-00000003wkO-2kO7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 09:01:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E3D852003DD;
	Thu, 02 Jul 2026 11:01:34 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfDIc-005iZG-2i;
	Thu, 02 Jul 2026 11:01:34 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfDIc-000000005AH-3BGi;
	Thu, 02 Jul 2026 11:01:34 +0200
Message-ID: <1ef8b2e4ab588aac1dae737541240e698fcf26a7.camel@pengutronix.de>
Subject: Re: [PATCH RFC v5 05/12] clk: zte: Add Clock registration
 infrastructure.
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Brian Masney
 <bmasney@redhat.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 02 Jul 2026 11:01:34 +0200
In-Reply-To: <84C4450E-7355-48CD-BCBB-CF619C27EBED@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
	 <20260628-zx29clk-v5-5-79ff044e4192@gmail.com>
	 <c59fab242716c80250a66707d7ccaaf243a85aac.camel@pengutronix.de>
	 <84C4450E-7355-48CD-BCBB-CF619C27EBED@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_020141_843987_51B32B92 
X-CRM114-Status: GOOD (  17.29  )
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

On Di, 2026-06-30 at 11:53 +0300, Stefan D=C3=B6singer wrote:
> Hi Philipp,
>=20
> > Am 30.06.2026 um 11:27 schrieb Philipp Zabel <p.zabel@pengutronix.de>:
> >=20
> > I think the MFD driver is unnecessary overhead. Can't you just keep the
> > reset controllers as auxdev and use of_platform_populate() to create
> > devices for clock-controller child nodes such as syscon-reboot?
>=20
> MFD for top and matrix was the suggestion of Conor:
>=20
> https://lore.kernel.org/linux-arm-kernel/20260618-fantasy-estimate-6c52ed=
bc6890@spud/
>=20
> To quote:
>=20
> > I think aux bus makes perfect sense when you have a clock/reset
> > controller, but once you start expanding past that and you have reboot
> > or hwmon or hwspinlock then mfd starts to make sense.

Note how the example Conor gives is introduced with:

> > Because I messed up stuff in the past, reset-mpfs.c has both aux bus
> > and mfd probing in it, [...]

So while, yes, this is possible, I'd like to avoid it if not necessary.

> I can go either way. To me aux vs mfd seems like a distinction without a =
difference.

I think that's because the main difference doesn't apply here:

MFD comes from aggregate devices where a shared register space
accessible via a physical bus (which we have) can be partitioned out to
child devices. Reset controls are often just individual registers or
even bits scattered around the CRU register space, so we can't make use
of the MFD framework's IO/IRQ resource partitioning infrastructure at
all.

Auxiliary devices were introduced to separate functionality of a single
device into subsystem drivers (which applies here) for devices that are
not just controlled via direct register access, for example via a
firmware interface. That's not the case here, we usually can just share
a regmap.

Either way, I'd prefer the reset driver to not carry more boilerplate
than actual reset code, so if you can either put all of them into a
single auxiliary_driver or into a single platform_driver, I would be
happier.

regards
Philipp

