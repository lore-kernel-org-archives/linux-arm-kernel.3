Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2966BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oi59Gfv03QRh4wuEQ3UJG1fGRKD0h5n2wK8ssSfHsFY=; b=n1TiMYWxpTjnb7/sZCnMqJtoa/
	qTO5+d399GcjJAxmWxgmmJri8CcHMvRttV1gdwgPXJZJ4K81DO3KWeQBjDtSyJdF4tUWxjLhARwdr
	38/eTCqAdaERvA51XsEnCJ6DftIBY6bG2bUtSjKZ/zzi0wUEVFry0WZc2JTeMQo/TGSBmdJg57kGy
	GVCRt0PYh3CH3zoOKvTo3N4cqh5G5GSIy5hHt3YO+AGJr0Et5FawPFl3TmDJMXz8LXBwgvKj72CXa
	TAvdmrzfvuNEXnaUAKY/8Lf6aDs5i6rUwVNMSbiu/e6SkkJ70ckIO1r1rs1pvXb7gpwvCyBbJG5oK
	/S5Embvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexOM-00000002Tkp-1yJ7;
	Wed, 01 Jul 2026 16:02:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexOG-00000002TjT-0Ipf;
	Wed, 01 Jul 2026 16:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Oi59Gfv03QRh4wuEQ3UJG1fGRKD0h5n2wK8ssSfHsFY=; b=MaTGrKK+eqnG+SYj6BecTVg4tW
	7qdxK+Va41Q2jRAT+9P3v8pxHfhrcHqMtM0ibxcke4vKH8rCytyJ5qNXhNiPiPlw7DlvHvWuAPj/b
	vEzF/SktlyChlwRuHUHMup59gXxjv9f5OA8ur9ozlYgSkytj0D7Y3tS6nkskdPA6syEzkUyFnz8DT
	9XXxi41yPrqj3MDFzGyFtq/Up91i4+qDj2lA4ZUy+FDVdkSVkCRzYSycpnyM+fOwlV4iQCmEkssL4
	urBkcySQ3HphZQ2h7vbr4Qm7iVrhM4RZntqzA3KBN8ad0mcymjnmgG1b5p6DbRWg+MwZufHFsSLAF
	+2QOQenw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 =?UTF-8?B?8J+Sqy4yMjA=?= <1579567540@qq.com>
Cc: linux-can <linux-can@vger.kernel.org>, mailhol <mailhol@kernel.org>,
 kernel <kernel@pengutronix.de>, robh <robh@kernel.org>,
 krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] can: rockchip: add RK3588 CAN-FD support
Date: Wed, 01 Jul 2026 18:02:02 +0200
Message-ID: <3077724.o0KrE1Onz3@diego>
In-Reply-To: <tencent_AF88C27E354DFF34B132BC0906236A01A408@qq.com>
References: <20260701070128.2096267-1-1579567540@qq.com>
 <20260701-flashy-crocodile-of-flowers-a6a23e-mkl@pengutronix.de>
 <tencent_AF88C27E354DFF34B132BC0906236A01A408@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_090220_141733_011E615B 
X-CRM114-Status: GOOD (  28.25  )
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

Am Mittwoch, 1. Juli 2026, 14:29:22 Mitteleurop=C3=A4ische Sommerzeit schri=
eb =F0=9F=92=AB.220:
> Hi Heiko, Marc,
>=20
> thanks for the review.
>=20
> > please use a real name, not an alias.
>=20
> I will use my real name in future revisions.
>=20
> > Funnily enough, we seem to have worked on the same topic
> > at the same time :-)
> >
> > https://lore.kernel.org/lkml/20260630164336.3444550-1-heiko@sntech.de/
>=20
> I missed Heiko's series before sending mine, sorry for the noise.
> (But it really is a very interesting coincidence.)
> Since the series overlap, I am happy to base further work on Heiko's
> series, or to let Heiko fold the RK3588 RX_FIFO_CNT bitfield change into
> his v2 if that is preferred.

I don't think we need two people working on this and you did the better
investigation into the differences, so you should get the credit :-)

So I guess my preference would be to:
=2D pick up the erratum 6 into your patch
=2D add my haikou patch to the series - that way we also get a user
=2D handle Krzysztof's comment from
  https://lore.kernel.org/linux-rockchip/20260701-sensible-cryptic-ocelot-5=
8035b@quoll/

  as both our bindings have the same structure, so I guess it should be

    oneOf:
       - enum:
             rockchip,rk3568v2-canfd
             rockchip,rk3588v2-canfd
       - items:
           - const: rockchip,rk3568v3-canfd
           - const: rockchip,rk3568v2-canfd

And submit that as v2.


> For RX_FIFO_CNT, I found the bitfield difference by reading Rockchip's
> vendor kernel 6.1 driver and comparing the CAN support for RK3568 and
> RK3588. The vendor driver uses different RX FIFO count bitfields for the
> two SoCs, and my testing on RK3588v2 also indicates that bits 7:5 are
> needed. I can add a short note about this in the commit message or
> code comment.

It's already in the commit message, so that should be fine


> One more question about RKCANFD_QUIRK_CANFD_BROKEN: in my RK3588v2 test
> setup the two known CAN-FD trigger frames did not cause an Error
> Interrupt or Error-Warning. I also ran a 12 hour CAN-FD stress test with
> can0/can1 directly connected, 200 MHz CAN clock, 500 kbit/s nominal
> bitrate and 1 Mbit/s data bitrate. That test included periodic
> transmission of the two CANFD_BROKEN frames, variable DLC CAN-FD frames,
> CAN-FD+BRS+EFF load, and a canfdtest run with 19,417,129 frames without
> data mismatch.
>=20
> Would it make sense to leave RKCANFD_QUIRK_CANFD_BROKEN disabled for
> RK3588v2, or have you seen this issue on RK3588 as well?

I was more going by the fact that even Rockchip removed every mention of
the -FD from all documentation, so was assuming it still being broken as
before. But if it actually works, then personally I'm more than fine with
enabling CAN-FD :-D .

I guess Marc might have more insight where the FD issue triggered on
the RK3568.


Heiko



