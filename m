Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF25C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 03:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWNPmZie43FsZ2zJ8Q5iKZB2v/V0Po/Z+YO83V2t8Ss=; b=HVLtmDHwRw/g+/Oxtf4O+NrxN5
	zzZRg76U1MBGXJKXMUKRIzjvZuR8bYuWHPBhNAs5V4b2wgTIlOeZYneOPqRkdsmK7gVBiOylmYTiC
	ZA9I4VhIRjrGdTmQq9RtDsnG2q5iwz9kLadfe3Hf8752Aij+OswHnNzFHv/25CJj1T8eFAuO6BhTW
	ItKoJx7ZOc64/AOjWMdhfetWJUUVrOdOl2yS3hokrK3cjLVBM67r2Crjn88U/CVayzFY8P503FCz5
	ZrqCupNBGLAXdkT1vUXpKdeKOc4MaBmZJuoP5LmIy5Q4hHbpy05g4YBIcmwUFgZTc/gkrBVREV8rz
	+C8ToJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzSgL-00000001se8-0xFY;
	Tue, 01 Apr 2025 03:52:57 +0000
Received: from gate.crashing.org ([63.228.1.57])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzSeY-00000001sXJ-0xh6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 03:51:10 +0000
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 5313lvUW010557;
	Mon, 31 Mar 2025 22:47:58 -0500
Message-ID: <bcce62d1bb233edaf39637a60089fcc146c8173f.camel@kernel.crashing.org>
Subject: Re: [PATCH] Subject: [PATCH] usb: gadget: aspeed: Add NULL check in
 the ast_vhub_init_dev
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-usb@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org
Cc: gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 01 Apr 2025 14:47:57 +1100
In-Reply-To: <20250329002911.132826-1-bsdhenrymartin@gmail.com>
References: <20250329002911.132826-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_205106_397915_076F9920 
X-CRM114-Status: GOOD (  15.19  )
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

On Sat, 2025-03-29 at 08:29 +0800, Henry Martin wrote:
> When devm_kasprintf() fails, it returns a NULL pointer. However, this
> return value is not properly checked in the function
> ast_vhub_init_dev.
>=20
> A NULL check should be added after the devm_kasprintf call to prevent
> potential NULL pointer dereference error.
>=20
> Fixes: 7ecca2a4080cb ("usb/gadget: Add driver for Aspeed SoC virtual
> hub")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

> ---
> =C2=A0drivers/usb/gadget/udc/aspeed-vhub/dev.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> index 573109ca5b79..1709a58299a5 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> @@ -545,9 +545,11 @@ int ast_vhub_init_dev(struct ast_vhub *vhub,
> unsigned int idx)
> =C2=A0	struct device *parent =3D &vhub->pdev->dev;
> =C2=A0	int rc;
> =C2=A0
> +	d->name =3D devm_kasprintf(parent, GFP_KERNEL, "port%d", idx +
> 1);
> +	if (!d->name)
> +		return -ENOMEM;
> =C2=A0	d->vhub =3D vhub;
> =C2=A0	d->index =3D idx;
> -	d->name =3D devm_kasprintf(parent, GFP_KERNEL, "port%d",
> idx+1);
> =C2=A0	d->regs =3D vhub->regs + 0x100 + 0x10 * idx;
> =C2=A0
> =C2=A0	ast_vhub_init_ep0(vhub, &d->ep0, d);


