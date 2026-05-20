Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF12CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 02:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kk4mDuk1bqlhfjj6bz2g4hB4FwIz7h/oUwNv9idu2CE=; b=VoTvh3WOcDUNh/TDmhxJfMiUiI
	d1zR0d86p4ba+YCBjvd7Yu1svCr3wzDlthtibnMiGTCv0zODvCY/44/IVMRj5YtQlHI315rvy+Hwb
	SiN9/hwJWKBq8cYVI2MEH+AOMqwe/i8LdychQijvy2FHXLBX+pfYuRsMobAQiSIMcmrioom1D59Gv
	BZoEQKK6uPC6pUpow2JWyCL1d6WQrtLhnG7sFK+BrzzRy9ipE4Y7KwXZZjNA6FOogpng85JkShyg9
	ibdY5koiR6D5G+AI+IiA3egqIJO35uYPwVyLT2cm00naafZNbQH+27VvmPPJnmRxfu75dHgtiyXmB
	zG0vSv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWFX-00000003Gnr-4Agb;
	Wed, 20 May 2026 02:01:31 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWFU-00000003Gn0-1Epu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 02:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779242477;
	bh=Kk4mDuk1bqlhfjj6bz2g4hB4FwIz7h/oUwNv9idu2CE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WbV/MPMu3iCPoNjBN3QV8ZCBkgGN2jzbkZVfURuYvvWn4JYuZzyGcIvLS/Oavp/+O
	 WxVthfEBocwEJU2xR1pHF8QC635aFAqYGaL3oJd9CspI/+qhXbnds75YwkQp+8ENVh
	 UcOulj9Q2V8epYCcVHwuP8XBNlSzWWOV8bFKajrWGL4/OQge2oHyfuxTA159Ue5+dc
	 VS3IRjjLQyFfkN8W94o1y78M/FiLxPFxisfKcxPLBvN/JL2/T7vvZBImjOQaur7Gd+
	 jPv7vMbTQtrYSEva4R0DfDq1ky7PZkMRSJBXdP32HFRjs3ynRsLwgUNQFqH319NEDu
	 H8wSd7RkWgOdw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AC7A260263;
	Wed, 20 May 2026 10:01:14 +0800 (AWST)
Message-ID: <eeadb3378066f18cf36469adfc3a70be3ad7b787.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] usb: gadget: aspeed_udc: avoid past-the-end iterator
 in dequeue
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Maoyi Xie <maoyixie.tju@gmail.com>, Neal Liu <neal_liu@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Herrenschmidt
	 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	 <andrew@aj.id.au>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 20 May 2026 11:31:14 +0930
In-Reply-To: <20260519080213.1932516-1-maoyixie.tju@gmail.com>
References: <20260518073403.1285339-1-maoyi.xie@ntu.edu.sg>
	 <20260519080213.1932516-1-maoyixie.tju@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_190128_551875_7079D24C 
X-CRM114-Status: GOOD (  20.66  )
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

On Tue, 2026-05-19 at 16:02 +0800, Maoyi Xie wrote:
> ast_udc_ep_dequeue() declares the loop cursor `req` outside the
> list_for_each_entry(). After the loop it tests `&req->req !=3D _req`
> to decide whether the request was found. If the queue holds no
> match, `req` is past-the-end. It then aliases
> container_of(&ep->queue, struct ast_udc_request, queue) via offset
> cancellation. Whether that synthetic address equals `_req` depends
> on heap layout. The function can return 0 without dequeueing
> anything.
>=20
> Walk the list with a separate `iter`. Set `req` only when a
> request matches. After the loop, `req` is NULL if nothing
> matched.
>=20
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
> v2: Switch the loop body to Alan Stern's shape: test inside
> =C2=A0=C2=A0=C2=A0 the if, assign `req`, break. Same behaviour as v1.
> v1: https://lore.kernel.org/linux-usb/20260518073403.1285339-1-maoyi.xie@=
ntu.edu.sg/
>=20
> =C2=A0drivers/usb/gadget/udc/aspeed_udc.c | 20 ++++++++++++--------
> =C2=A01 file changed, 12 insertions(+), 8 deletions(-)
>=20
> --- a/drivers/usb/gadget/udc/aspeed_udc.c	2026-05-19 15:29:28.690931576 +=
0800
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c	2026-05-19 15:29:59.482953528 +=
0800
> @@ -692,26 +692,30 @@
> =C2=A0{
> =C2=A0	struct ast_udc_ep *ep =3D to_ast_ep(_ep);
> =C2=A0	struct ast_udc_dev *udc =3D ep->udc;
> -	struct ast_udc_request *req;
> +	struct ast_udc_request *req =3D NULL, *iter;
> =C2=A0	unsigned long flags;
> =C2=A0	int rc =3D 0;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&udc->lock, flags);
> =C2=A0
> =C2=A0	/* make sure it's actually queued on this endpoint */
> -	list_for_each_entry(req, &ep->queue, queue) {
> -		if (&req->req =3D=3D _req) {
> -			list_del_init(&req->queue);
> -			ast_udc_done(ep, req, -ESHUTDOWN);
> -			_req->status =3D -ECONNRESET;
> +	list_for_each_entry(iter, &ep->queue, queue) {
> +		if (&iter->req =3D=3D _req) {
> +			req =3D iter;
> =C2=A0			break;
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	/* dequeue request not found */
> -	if (&req->req !=3D _req)
> +	if (!req) {
> =C2=A0		rc =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	list_del_init(&req->queue);
> +	ast_udc_done(ep, req, -ESHUTDOWN);
> +	_req->status =3D -ECONNRESET;
> =C2=A0
> +out:
> =C2=A0	spin_unlock_irqrestore(&udc->lock, flags);
> =C2=A0
> =C2=A0	return rc;

This is a bit of a bikeshed comment and doesn't solve making the code
similar to other cases, however: Golfing the diff a bit, perhaps we can
start from the assumption that there isn't a match, and require the
search disprove that. Then we don't have to test whether we saw
something after-the-fact, and we avoid the goto as proposed above.

Untested:

   diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/ud=
c/aspeed_udc.c
   index 7fc6696b7694..75f9c831b21a 100644
   --- a/drivers/usb/gadget/udc/aspeed_udc.c
   +++ b/drivers/usb/gadget/udc/aspeed_udc.c
   @@ -694,7 +694,7 @@ static int ast_udc_ep_dequeue(struct usb_ep *_ep, st=
ruct usb_request *_req)
           struct ast_udc_dev *udc =3D ep->udc;
           struct ast_udc_request *req;
           unsigned long flags;
   -       int rc =3D 0;
   +       int rc =3D -EINVAL;
  =20
           spin_lock_irqsave(&udc->lock, flags);
  =20
   @@ -704,14 +704,11 @@ static int ast_udc_ep_dequeue(struct usb_ep *_ep, =
struct usb_request *_req)
                           list_del_init(&req->queue);
                           ast_udc_done(ep, req, -ESHUTDOWN);
                           _req->status =3D -ECONNRESET;
   +                       rc =3D 0;
                           break;
                   }
           }
  =20
   -       /* dequeue request not found */
   -       if (&req->req !=3D _req)
   -               rc =3D -EINVAL;
   -
           spin_unlock_irqrestore(&udc->lock, flags);
  =20
           return rc;
  =20
  =20
  =20

