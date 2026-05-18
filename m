Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506E9CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 02:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8u7GTxrVk0C2PJrbCem+3xBCd5jbswvYhojVoW4ZD0=; b=hpW3LkZTmTe+9hn/gleReS9Oel
	eGYIuoWd8CF/Ab5+HvIL22FAxVg+Rvx9KcrT4Td5GdQYGKm6zK2cSV0XIZiscFS/yiHtm7Tj+URsp
	mTTrLeOwoq3b+D5/RjR3/OVeI/mk61jg4goUKXEdG2BwuRiQ9AiYneJnvJJEMOzxX5fHaHvF2dQJn
	TRgyogb38lrEx/FbCxW9aFpQXGuVtP7POrGPz6V2P5K0PdFWXNWmPGUBR/n4mMH8vUzLcbDpjENqV
	DY3G2MYPyo/dTi1M68n+JWNFud+CQ6yTbeizI0URqrGN7qpYLro3rehGJeT3ituoNbyl8vGC6mrMf
	HnNRlR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnP5-0000000DtHe-1w8v;
	Mon, 18 May 2026 02:08:23 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnP1-0000000DtGi-45ho
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 02:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779070089;
	bh=x8u7GTxrVk0C2PJrbCem+3xBCd5jbswvYhojVoW4ZD0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WjJ1dXe9pkIadrwUEsZ3nLCVl/sBeoO0RlerFs/2F7dsR1vqQ6h9eDUgMn+2BkJTx
	 sU+ufPnAAQlTC2n1ZqiIJ57FPvyX6d2rHwaqtdVQA2eHw9vQaKS71sYWwy+v42CegN
	 J/IlaMjSZiSqQ8sIqirJmsH1FPCrhnyLjeoSEK5x0PyTXTU4nWKrgUf0odHukYNQFB
	 OHEFn5a34TwZfn+n3rTOyQ72FOxTIW6NCsSFIYu/6tKwi/8j+t2+PmB3GBPebZHusL
	 QRsB5qRB4R0G8390g019AOKULWeZ0eKglLCCxJPRG+SUCKjYcAHVgaMAaFMht7F8gx
	 c7PaiHl78VcVw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2BFAC6037B;
	Mon, 18 May 2026 10:08:06 +0800 (AWST)
Message-ID: <7927e6edf6cbe915a66b76746436c8d19f317bd6.camel@codeconstruct.com.au>
Subject: Re: usb: gadget: aspeed_udc: list iterator used after loop in
 ast_udc_ep_dequeue
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Maoyi Xie <maoyixie.tju@gmail.com>, neal_liu@aspeedtech.com, 
	gregkh@linuxfoundation.org
Cc: joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
 linux-usb@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 11:38:05 +0930
In-Reply-To: <CAHPEe=Fs223obDewRunPdTtqhVOM11AXVsLRNHx+=NP0KiFwMQ@mail.gmail.com>
References: <CAHPEe=Fs223obDewRunPdTtqhVOM11AXVsLRNHx+=NP0KiFwMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_190820_374664_D95F9A5E 
X-CRM114-Status: GOOD (  27.81  )
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

Hi,

On Sun, 2026-05-17 at 23:46 +0800, Maoyi Xie wrote:
> Hi all,
>=20
> (Resending from a personal address =E2=80=94 my previous attempt from
> my NTU corporate account carried an auto-appended confidentiality
> disclaimer that you've declined to accept. The content below is
> unchanged.)
>=20
> I have been running a small static check for list_for_each_entry
> past-the-end patterns, similar to Jakob Koschel's 2022 cleanup
> (commit 2966a9918df and related). The check flagged
> ast_udc_ep_dequeue() in drivers/usb/gadget/udc/aspeed_udc.c, and I
> would like to ask whether you consider this a real defect before I
> send anything formal. The same code is present in v7.0 and in
> v7.1-rc1 (the two files are byte-identical).
>=20
> The code in question is around line 691:
>=20
> =C2=A0=C2=A0=C2=A0 struct ast_udc_request *req;
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 list_for_each_entry(req, &ep->queue, queue) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (&req->req =3D=3D _req) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_d=
el_init(&req->queue);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ast_ud=
c_done(ep, req, -ESHUTDOWN);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _req->=
status =3D -ECONNRESET;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 if (&req->req !=3D _req)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D -EINVAL;
>=20
> If nothing matches, the loop exits past-the-end and req becomes the
> synthetic container_of(&ep->queue, struct ast_udc_request, queue).
> Reading &req->req after the loop is undefined per C11. The post-loop
> check works in practice only because real _req values do not collide
> with that synthetic address.
>=20
> What made me suspect this was not intentional is that 14 other UDC
> drivers in the same directory (at91_udc, atmel_usba_udc, dummy_hcd,
> fsl_qe_udc, fsl_udc_core, goku_udc, gr_udc, lpc32xx_udc, max3420_udc,
> net2280, omap_udc, pxa25x_udc, pxa27x_udc, udc-xilinx) use a
> different pattern, with a separate iter cursor and a result variable.
> For example dummy_hcd.c:
>=20
> =C2=A0=C2=A0=C2=A0 struct dummy_request *req =3D NULL, *iter;
> =C2=A0=C2=A0=C2=A0 list_for_each_entry(iter, &ep->queue, queue) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (&iter->req !=3D _req) cont=
inue;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req =3D iter;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retval =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> =C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 if (retval =3D=3D 0) { ... }
>=20
> aspeed_udc seems to be the only outlier in drivers/usb/gadget/udc/,
> which is what made me think this was probably an oversight rather
> than a deliberate idiom.
>=20
> I also tried to confirm whether it observably misbehaves. If _req
> happens to coincide with the synthetic past-the-end address, the
> function returns 0 (success) on an empty queue without removing
> anything. I attached a small userspace reproducer (poc_aspeed_udc.c
> and its output log) that arranges this collision. In normal use _req
> comes from the kernel slab and the collision is unlikely to happen
> naturally, so I am not sure whether this rises to the level of a
> real bug or just a code-quality issue.
>=20
> Two questions:
>=20
> =C2=A0 1. Do you consider the past-the-end use here a defect worth fixing=
,
> =C2=A0=C2=A0=C2=A0=C2=A0 or is it an accepted idiom in this driver that I=
 am misreading?

I don't know that it's an accepted idiom - there are only two
invocations in the driver and the other doesn't suffer the problem
you've highlighted.

list_first_entry() does note that the caller be sure that the list
isn't empty. As you note this isn't tested, so it's now a pre-condition
of ast_udc_ep_dequeue() that it's not. A bunch of gadgets test if they
have requests in-flight before invoking dequeue, so that may not be
unreasonable. However, given ast_udc_nuke(), and the implementation
admitting that the provided req might be invalid by the existence of
the test, I'm not convinced that the invariant is upheld.

Note that the (other, separate) Aspeed vhub driver avoids your concern
in its dequeue implementations, so I'd rather it's avoided in the udc
implementation as well:

 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
drivers/usb/gadget/udc/aspeed-vhub/ep0.c?h=3Dv7.1-rc4#n438
 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
drivers/usb/gadget/udc/aspeed-vhub/epn.c?h=3Dv7.1-rc4#n472

>=20
> =C2=A0 2. If it is worth fixing, I already have a small patch that brings
> =C2=A0=C2=A0=C2=A0=C2=A0 the function in line with the 14 sibling drivers=
. Would you like
> =C2=A0=C2=A0=C2=A0=C2=A0 me to send it, or would you rather address it lo=
cally?

IMO send the patch. It's almost always better to be reviewing a
concrete change proposal.

Andrew

