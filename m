Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7B1CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 21:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W20PrwyIbAYQgwrvBzTFnlxpxnGMU7JnTyqkCQGTx3c=; b=oK9oP411kwntxdM/Nnv630uje1
	vvhfWhMuRN9K3DC8dFxL7vM+doUbpka6n3U6b6DI4kksWIrYVZsZ4VahMLJv2jJ+SCwf6KhJAwNLY
	Nw1plbO6KNKGXKZrem2DgfJAkOqJXt4Sl40S8xbfMA96S8ZI6EReqmt3hJHokqAUhZrGSREY5TSMp
	xdK7FkcYE2mpW6IByx4bQr9esXM3akREzrb3NvJpupRPiP/3YMEc+Yidg3Cy/Rfwebr3GYXRGp85X
	zsmrUfPYue8ZrR7AFFM5VOt8EJhPeYFXfkr48QkhbOaui+/b+19Vw4Bydq/78OOq8/EV9FCAMWDsa
	h/BS7M0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTai-0000000BcHp-1GaV;
	Tue, 19 Aug 2025 21:10:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNXZ-0000000Aml9-1pQk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 14:42:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9761E60209;
	Tue, 19 Aug 2025 14:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC71C4CEF1;
	Tue, 19 Aug 2025 14:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755614536;
	bh=cqwQADpES4py+UAccBwue5Qou0LgZbNLPNo27fvu4p0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kicv+klc2cIfiXFaq2sWfwYPPMXQsWzdHFOAlFRIs5e3dbX95dkJ7kDUog6a62sOh
	 jPJwjboA5nDUPvI4at1SAw8OWQ+a9SvASNHzu5wg+9sBB56p/iyIhXs0rX87l+cozs
	 UmkXEwwGbg3p8q+o2yCwCztEeZolwoCccDFGHK4Sxzbd2q3Ng1BsOCTND2d9zqP/kc
	 cP7JvWhhOKDowMXIP0YJfXGW1kMYsFtJlFvulYGeabY4C7cMwViRgbzh1wTezFEd5g
	 2Z41X0WxNsA7oiNTqBtCB/gmEqWfbjW3evPvSoEFgj8Mzlx/YWCcYHGm2N5lfEY403
	 tGxAqddpzvM9A==
Date: Tue, 19 Aug 2025 07:42:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next v18 5/7] net: mtip: Add mtip_switch_{rx|tx} functions
 to the L2 switch driver
Message-ID: <20250819074214.23d4332a@kernel.org>
In-Reply-To: <20250819103119.42a64541@wsk>
References: <20250813070755.1523898-1-lukasz.majewski@mailbox.org>
	<20250813070755.1523898-6-lukasz.majewski@mailbox.org>
	<20250815183359.352a0ecb@kernel.org>
	<20250819103119.42a64541@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 19 Aug 2025 10:31:19 +0200 =C5=81ukasz Majewski wrote:
> > The rx buffer circulation is very odd. =20
>=20
> The fec_main.c uses page_pool_alloc_pages() to allocate RX page from
> the pool.
>=20
> At the RX function the __build_skb(data, ...) is called to create skb.
>=20
> Last step with the RX function is to call skb_mark_for_recycle(skb),
> which sets skb->pp_recycle =3D 1.
>=20
> And yes, in the MTIP I do copy the data to the newly created skb in RX
> function (anyway, I need to swap bytes in the buffer).=20
>=20
> It seems like extra copy is performed in the RX function.

Right, so the use of page pool is entirely pointless.
The strength of the page pool is recycling the pages.
If you don't free / allocate pages on the fast path you're=20
just paying the extra overhead (of having a populated cache)

> > Also you are releasing the page to be recycled without clearing it
> > from the ring. I think you'd free it again on shutdown, so it's a
> > double-free. =20
>=20
> No, the page is persistent. It will be removed when the driver is
> closed and memory for pages and descriptors is released.

So remove the page_pool_recycle_direct() call, please:

  static int mtip_switch_rx(struct net_device *dev, int budget, int *port)
	...
	skb =3D netdev_alloc_skb(pndev, pkt_len + NET_IP_ALIGN);
	if (unlikely(!skb)) {
			...
			page_pool_recycle_direct(fep->page_pool, page);

